
Array.prototype.extend = function extend(enumerable) {
  enumerable.each(function(element) {
    this.push(element);
  }.bind(this));
  return this;
};

var regs;
$(document).observe("dom:loaded", function() {
  function init() {
    regs = $w("eax ecx edx ebx esp ebp esi edi eip").map(function(name, i) {
      return $(name).update(y86.reg[i].toHex());
    });
    $w("zf sf of").each(function(flag) {
      $(flag).update(y86.getFlags()[flag] ? "1" : "0");
    });
  }
  init();

  $("load").observe("click", function(event) {
    var content = $F("memload"), format = $F("format");
    ({yo: loadYO, hex: loadHex, hextxt: loadHexTxt})[format](content);
  });
  $("reset").observe("click", function(event) {
    y86.reset();
    init();
    regs.invoke("addClassName", "written");
    $("instr-cell").update("&nbsp;");
  });

  $("tick").observe("click", function(event) {
    tick();
  });
});

function fillNibbles(instr, icode) {
  for (var i = 0, l = instr.length, b, nibbles = []; b = instr[i], i < l; i++)
    nibbles.extend([b >> 4, b & 0xF]);
  var sig = [2, 2, 4, 12, 12, 12, 4, 10, 10, 2, 4, 4, 12, 2][icode],
      line = "1px solid transparent";
  var elements = $$("td.nibble").each(function(element, i) {
    element.addClassName("hidden");
    if (i < sig)
      element.removeClassName("hidden").update(nibbles[i].toString(16));
  });
  var hasValC = [I_IRMOVL, I_RMMOVL, I_MRMOVL, I_IADDL].include(icode);
  var oneByte = [I_NOP, I_HALT, I_RET, I_LEAVE].include(icode);
  elements[3][hasValC ? "addClassName" : "removeClassName"]("sep");
  elements[1][oneByte ? "removeClassName" : "addClassName"]("sep");
}

function disas(r) {
  var regLookup = ["eax", "ecx", "edx", "ebx", "esp", "ebp", "esi", "edi"],
      p = [instr(r.icode, r.ifun)];
  switch (r.icode) {
    case I_IRMOVL:
      p.extend([" $", r.val.toHex(-1), ",%", regLookup[r.rB]]);
      break;
    case I_RRMOVL:
    case I_OPL:
      p.extend([" %", regLookup[r.rA], ",%", regLookup[r.rB]]);
      break;

    case I_JXX:
      p.extend([" $", r.eip.toHex(-1)]);
      break;

    case I_RMMOVL:
      p.extend([
        " %", regLookup[r.rA], ",",
        r.valC === 0 ? "" : r.valC.toString(16),
        "(%", regLookup[r.rB], ")"
      ]);
      break;
    case I_MRMOVL:
      p.extend([
        " ", r.valC === 0 ? "" : r.valC.toString(16),
        "(%", regLookup[r.rB], "),",
        "%", regLookup[r.rA]
      ]);
      break;
    case I_PUSHL:
    case I_POPL:
      p.extend([" %", regLookup[r.rA]]);
      break;
    case I_CALL:
      p.extend([" $", r.eip.toHex()]);
      break;
  }
  return p.join("");
}

var flags = {zf: false, sf: false, of: false};
function tick() {
  regs.invoke("removeClassName", "written");

  var r = y86.tick();
  $("instr-cell").update(disas(r));
  fillNibbles(r.instr, r.icode);
  // console.log(r);

  if (r.eip)
    regs[EIP].addClassName("written").update(r.eip.toHex());

  switch (r.icode) {
    case I_IRMOVL:
    case I_IADDL:
      regs[r.rB].addClassName("written").update(r.val.toHex());
      break;
    case I_RRMOVL:
      if (r.condMet)
        regs[r.rB].addClassName("written").update(r.val.toHex());
      break;
    case I_OPL:
      regs[r.rB].addClassName("written").update(r.val.toHex());
      $w("zf sf of").each(function(flag) {
        if (r[flag] != flags[flag]) {
          $(flag).update(r[flag] ? "1" : "0").addClassName("written");
          flags[flag] = r[flag];
        }
      });
      break;

    case I_MRMOVL:
      regs[r.rA].addClassName("written").update(r.val.toHex());
      break;
    case I_PUSHL:
    case I_CALL:
    case I_RET:
      regs[ESP].addClassName("written").update(r.esp.toHex());
      break;
    case I_POPL:
      regs[ESP].addClassName("written").update(r.esp.toHex());
      regs[r.rA].addClassName("written").update(r.val.toHex());
      break;

    case I_LEAVE:
      regs[ESP].addClassName("written").update(r.esp.toHex());
      regs[EBP].addClassName("written").update(r.ebp.toHex());
      break;
  }
  return r;
}

Element.addMethods({
  switchClassName: function switchClassName(element, klass, value) {
    if (!(element = $(element))) return;
    element[value ? "addClassName" : "removeClassName"](klass);
    return element;
  }
});

y86.registerMmioModule({
  name: "lights", types: ["r", "w"], addrs: [0x0008],
  bitPattern: 0,
  read: function read(addr) {
    return this.bitPattern;
  },
  write: function write(addr, value) {
    this.bitPattern = value;
    var greens = $$("div.light-region.green .light").reverse(),
        reds = $$("div.light-region.red .light").reverse();
    $("hex").update((value & 0xFFFF).toString(16).toUpperCase());
    for (var i = 16; i < 24; i++)
      greens[i - 16].switchClassName("on", (value >> i) & 1);
    for (i = 24; i < 32; i++)
      reds[i - 24].switchClassName("on", (value >> i) & 1);
  }
});

/*
registerMmioModule({
  name: "switches", types: ["r", "w", "interr"], addrs: [0x000C, 0x0034],
  events: {input: $R(0, 29).toArray()},
  vectors: {input: 0x0034},

  vector: 0, previous: 0,

  read: function read(addr) {
    switch (addr) {
      case 0x000C:
        //
      case 0x0034: return this.vector;
    }
  },
  write: function write(addr, value) {
    if (addr == 0x0034) this.vector = value;
  },
  tick: function tick() {
    // xor previous, fire event accordingly
  }
});
*/

