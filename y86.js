
var EAX = 0, ECX = 1, EDX = 2, EBX = 3,
    ESP = 4, EBP = 5, ESI = 6, EDI = 7, EIP = 8;
var I_HALT = 0x0, I_NOP = 0x1,
    I_RRMOVL = 0x2, I_IRMOVL = 0x3, I_RMMOVL = 0x4, I_MRMOVL = 0x5,
    I_OPL = 0x6, I_JXX = 0x7,
    I_CALL = 0x8, I_RET = 0x9, I_PUSHL = 0xA, I_POPL = 0xB,
    I_IADDL = 0xC, I_LEAVE = 0xD;
var ALU_ADD = 0, ALU_SUB = 1, ALU_AND = 2, ALU_XOR = 3;
var C_UNCOND = 0, C_LE = 1, C_L = 2, C_E = 3, C_NE = 4, C_GE = 5, C_G = 6;
var S_AOK = 0, S_HALTED = 1, S_BAD_INSTR = 2;


var Y86 = function Y86(memSize) {
"use strict";

var zf = false, sf = false, of = false;
var regs = new ArrayBuffer(4 * 9);
var reg  = new Uint32Array(regs), reg8 = new Uint8Array(regs);
var mem = new ArrayBuffer(memSize || 4096 * 1024);
var ram = new Uint8Array(mem), ram32 = new Uint32Array(mem);
var scratchSpace = new ArrayBuffer(4), scU8  = new Uint8Array(scratchSpace),
    scU32 = new Uint32Array(scratchSpace), sc32 = new Int32Array(scratchSpace);
var rMmioModules = [], wMmioModules = [], interrMmioModules = [];
var icr = 0, ifr = 0, lastRti = false;

function tick() {
  var pc = reg[EIP], instr = ram.subarray(pc, pc + 6), size = 0, j = 0;
  if (!lastRti) {
    for (var i = 0, l = interrMmioModules.length; i < l; i++) {
      var mod = interrMmioModules[i],
          events = mod.events, firedEvents = mod.tick();
      for (var event in firedEvents) // Update IFR
        for (var k = 0, bits = events[event], l = bits.length; k < l; k++)
          ifr |= firedEvents[event] << bits[k];
    }
    // Check global bit as well as both ICR and IFR
    if ((icr >> 31) && ((icr & ~0x80000000) & ifr) != 0) {
      icr &= ~0x80000000; // Turn off global bit
      for (var n = 30, module, event; n >= 0; n--)
        if (((icr >> n) & 1) && ((ifr >> n) & 1))
          module = moduleForEvent[event = eventForBit[n]];
      var vector = module.vectors[event];
      instr = [(I_CALL << 4) | 1,
              (vector >> 24) & 0xFF, (vector >> 16) & 0xFF,
              (vector >> 8) & 0xFF, vector & 0xFF, 0];
    }
  }
  var icode = instr[0] >> 4, ifun = instr[0] & 0x0F, rs = instr[1],
      rA = rs >> 4, rB = rs & 0x0F, valA = reg[rA], valB = reg[rB],
      valCOffset = (icode == I_JXX || icode == I_CALL) ? 1 : 2;
  for (j = 3; j >= 0; j--) scU8[j] = instr[j + valCOffset];
  var dU = scU32[0], dS = sc32[0], cond, ret = {
    icode: icode, ifun: ifun, instr: instr
  };
  if (icode == I_RRMOVL || icode == I_JXX) switch (ifun) {
    case C_UNCOND: cond = true;    break;
    case C_LE: cond = sf || zf;    break;
    case C_L:  cond = sf;          break;
    case C_E:  cond = zf;          break;
    case C_NE: cond = !zf;         break;
    case C_GE: cond = !sf;         break;
    case C_G:  cond = !(sf || zf); break;
    default: throw new Error();
  }
  switch (icode) {
    case I_HALT:
      return ret;

    case I_NOP:
      size = 1;
      break;

    case I_IRMOVL:
      size = 6;
      ret.rB = rB; ret.val = (reg[rB] = dU);
      break;

    case I_RRMOVL:
      size = 2; ret.condMet = cond; ret.rB = rB; ret.rA = rA;
      if (cond) ret.val = (reg[rB] = valA);
      break;

    case I_OPL:
      size = 2; of = false;
      var result;
      switch (ifun) {
        case ALU_ADD:
          result = valB + valA;
          of = (valA >= 0 && valB >= 0  && result < 0) ||
               (valA < 0 && valB < 0 && result >= 0);
          break;
        case ALU_SUB:
          result = valB - valA;
          of = (valA >= 0 && valB < 0 && result < 0) ||
               (valA < 0 && valB >= 0 && result >= 0);
          break;
        case ALU_AND: result = valB & valA; break;
        case ALU_XOR: result = valB ^ valA; break;
      }
      reg[rB] = result;
      zf = (result === 0);
      sf = (result < 0);
      ret.rA = rA; ret.rB = rB;
      ret.valA = valA; ret.valB = valB; ret.val = reg[rB];
      ret.of = of; ret.zf = zf; ret.sf = sf;
      break;

    case I_JXX:
      size = 5; ret.condMet = cond;
      if (cond) reg[EIP] = dU;
      break;

    case I_RMMOVL:
      size = 6; j = 3;
      var addr = valB + dS, redirected = writeMem(addr, null, rA);
      ret.rA = rA; ret.rB = rB; ret.valC = dS; ret.redirected = redirected;
      ret.addr = addr; ret.val = valA;
      break;

    case I_MRMOVL:
      size = 6; j = 3; ret.valC = dS;
      var addr = valB + dS, r = readMem(addr, rA);
      ret.rA = rA; ret.rB = rB; ret.redirected = r[1];
      ret.addr = addr; ret.val = r[0];
      break;

    case I_PUSHL:
      size = 2; j = 0;
      for (var r = rA << 2, addr = (reg[ESP] -= 4); j < 4; j++)
        ram[addr + j] = reg8[r + j];
      ret.rA = rA; ret.addr = addr; ret.val = reg[rA]; ret.esp = addr;
      break;

    case I_POPL:
      size = 2; j = 0;
      for (var r = rA << 2, addr = reg[ESP]; j < 4; j++)
        reg8[r + j] = ram[addr + j];
      ret.esp = (reg[ESP] += 4);
      ret.addr = addr; ret.rA = rA; ret.val = reg[rA];
      break;

    case I_CALL:
      size = 5;
      if (ifun != 1) reg[EIP] += size;
      for (var r = EIP << 2, addr = (reg[ESP] -= 4); j < 4; j++)
        ram[addr + j] = reg8[r + j];
      reg[EIP] = dU; ret.esp = addr;
      break;

    case I_RET:
      size = 1; j = 0;
      for (var r = EIP << 2, addr = reg[ESP]; j < 4; j++)
        reg8[r + j] = ram[addr + j];
      ret.esp = (reg[ESP] += 4);
      break;

    case I_IADDL:
      size = 6;
      ret.rB = rB; ret.val = (reg[rB] += dS);
      break;

    case I_LEAVE:
      size = 1; j = 0;
      reg[ESP] = reg[EBP]; // rrmovl %ebp,%esp
      // pop %ebp
      for (var r = EBP << 2, addr = reg[ESP]; j < 4; j++)
        reg8[r + j] = ram[addr + j];
      ret.esp = (reg[ESP] += 4); ret.ebp = reg[EBP];

    default: throw new Error();
  }
  lastRti = (icode == I_RET) && (ifun == 1);
  if (icode != I_CALL && icode != I_RET)
    if (icode != I_JXX || (icode == I_JXX && !cond))
      reg[EIP] += size;
  ret.eip = reg[EIP];
  return ret;
}

function writeMem(addr, val, register) {
  var redirected = false, j = 0, modules = wMmioModules;
  val = register ? reg[register] : val;
  for (var i = 0, l = modules.length, module; module = modules[i], i < l; i++)
    if (module.addrs.indexOf(addr) !== -1 && (redirected = true))
      module.write(addr, val);
  if (!redirected && (j = 3))
    if (register !== void(0))
      for (var r = register << 2; j >= 0; j--)
        ram[addr + j] = reg8[r + j];
    else
      for (scU32[0] = val; j >= 0; j--)
        ram[addr + j] = scU8[j];
  return redirected;
}

function readMem(addr, register) {
  var redirected = false, j = 0, modules = rMmioModules;
  for (var i = 0, l = modules.length, module; module = modules[i], i < l; i++)
    if (module.addrs.indexOf(addr) !== -1 && (redirected = true))
      scU32[0] = module.read(addr);
  if (!redirected)
    for (j = 3; j >= 0; j--)
      scU8[j] = ram[addr + j];
  if (register !== void(0) && (j = 3))
    for (var r = register << 2; j >= 0; j--)
      reg8[r + j] = scU8[j];
  return [scU32[0], redirected];
}

var eventForBit = [], moduleForEvent = {};
function registerMmioModule(module) {
  var types = module.types, events = module.events;
  for (var event in events) {
    moduleForEvent[event] = module;
    for (var i = 0, bits = events[event], l = bits.length; i < l; i++)
      eventForBit[bits[i]] = event;
  }
  var slots = {r: rMmioModules, w: wMmioModules, interr: interrMmioModules};
  for (var j = 0, l = types.length; j < l; j++)
    slots[types[j]].push(module);
  return module;
}

registerMmioModule({
  name: "psr", types: ["r", "w"], addrs: [0x0014],
  read: function read(addr) {
    return (zf << 2) | (sf << 1) | of;
  },
  write: function write(addr, value) {
    zf = (value >> 2) & 1;
    sf = (value >> 1) & 1;
    of = value & 1;
  }
});

registerMmioModule({
  name: "ir", types: ["r", "w"], addrs: [0x0018, 0x001C],
  read: function read(addr) {
    switch (addr) {
      case 0x0018: return icr;
      case 0x001C: return ifr;
    }
  },
  write: function write(addr, value) {
    switch (addr) {
      case 0x0018: icr = value; break;
      case 0x001C: ifr = value; break;
    }
  }
});

registerMmioModule({
  name: "timer", types: ["r", "w", "interr"], addrs: [0x0020, 0x0024, 0x0030],
  events: {timer: [30]}, // ifr / icr bit position
  vectors: {timer: 0x0030},

  tr: 0, trr: 0, vector: 0,

  read: function read(addr) {
    switch (addr) {
      case 0x0020: return this.tr;
      case 0x0024: return this.trr;
      case 0x0030: return this.vector;
    }
  },
  write: function write(addr, value) {
    switch (addr) {
      case 0x0020: this.tr = value; break;
      case 0x0024: this.trr = value; break;
      case 0x0030: this.vector = value; break;
    }
  },
  tick: function tick() {
    if (this.tr == 0 && this.trr !== 0) {
      this.tr = this.trr;
      return {timer: [1]};
    } else
      this.tr--;
    return {timer: [0]};
  }
});

return {
  constructor: Y86,
  tick: tick, reset: function reset() {
    zf = sf = of = false;
    for (var i = 0, l = reg.length; i < l; i++) reg[i] = 0;
    for (i = 0, l = ram32.length; i < l; i++) ram32[i] = 0;
  },
  mem: mem, ram: ram, ram32: ram32,
  readMem: readMem, writeMem: writeMem,
  regs: regs, reg: reg, reg8: reg8,
  registerMmioModule: registerMmioModule,
  getFlags: function getFlags() { return {zf: zf, sf: sf, of: of}; },
  getIrs: function getIrs() { return {icr: icr, ifr: ifr}; }
};

};

var y86 = new Y86();


