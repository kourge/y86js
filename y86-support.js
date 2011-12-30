
Number.prototype.toHex = function toHex(d) {
  var r = this.toString(16).toUpperCase(), l = (d || 8) - r.length;
  if (d !== -1) while (l > 0 && l--) r = "0" + r;
  return "0x" + r;
};

function loadHex(content) {
  var c1, c2, l = content.length, ram = y86.ram;
  if (l % 2 != 0) throw new Error();
  for (var i = 0; i < l; i += 2) {
    c1 = content.charAt(i); c2 = content.charAt(i + 1);
    ram[i >> 1] = parseInt(c1, 16) << 4 | parseInt(c2, 16);
  }
  return i;
}

function loadHexTxt(content) {
  var lines = content.split(/\r\n|\r|\n/), ram = y86.ram, c = 0;
  for (var i = 0, l = lines.length; i < l; i++) {
    var m = lines[i].trim().match(/w\s+([0-9a-f]+)\s+([0-9a-f]+)/i);
    if (!m) continue;
    var code = parseInt(m[1], 16), addr = parseInt(m[2], 16);
    ram[c++, addr] = code;
  }
  return c;
}

function loadYO(content) {
  var lines = content.split(/\r\n|\r|\n/), ram = y86.ram, c = 0;
  for (var i = 0, l = lines.length; i < l; i++) {
    var line = lines[i].replace(/\|.*$/, "").trim().split(":");
    if (line.length == 1) continue;
    var addr = parseInt(line[0].trim(), 16), code = line[1].trim();
    for (var j = 0, len = code.length; j < len; j += 2, c++)
      ram[addr + (j / 2)] = parseInt(code.substring(j, j + 2), 16);
  }
  return c;
}

/*
function dumpRegs() {
  var labels = $w("PC= eax= ecx= edx= ebx= esp= ebp= esi= edi=");
  var regs = [EIP, EAX, ECX, EDX, EBX, ESP, EBP, ESI, EDI].map(function(r) {
    return y86.reg[r].toHex();
  });
  var r = labels.zip(regs).map(function(p) { return p.join(""); });
  console.info(r.join(", "));
}
*/

function instr(icode, ifun) {
  var lookup = [
    "halt", "nop", "rrmovl", "irmovl", "rmmovl", "mrmovl",
    "opl", "jmp", "call", "ret", "pushl", "popl", "iaddl", "leave"
  ];
  var opLookup = ["addl", "subl", "andl", "xorl"];
  var condLookup = [null, "le", "l", "e", "ne", "ge", "g"];
  var ins = lookup[icode], c = condLookup[ifun];
  switch (icode) {
    case I_OPL: ins = opLookup[ifun]; break;
    case I_RRMOVL: if (c) ins = "cmov" + c; break;
    case I_JXX: if (c) ins = "j" + c; break;
  }
  return ins;
}

