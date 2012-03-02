y86js
=====

`y86js` is a y86 CPU emulator written in JavaScript.

What is y86?
------------

The y86 hypothetical processor is a stripped-down version of the x86 processor. Defined in [chapter 4](http://csapp.cs.cmu.edu/public/ch4-preview.pdf) of Computer Systems: A Programmer's Perspective (hereafter "CS:APP", [book link](http://www.amazon.com/dp/0136108040/), [homepage](http://csapp.cs.cmu.edu/)), it is an academic instruction set specified in a way such that it is easier to implement, but still retains a few key characteristics of IA-32, such as variable-length instructions and eight 32-bit registers.

Differences from standard y86
-----------------------------

The standard y86 instruction set, as specified by CS:APP, does not define interrupts and MMIO registers. `y86js` supports these two features as first defined in [the CSE 352 curriculum at the University of Washington](http://www.cs.washington.edu/education/courses/cse352/11sp/). These features are optional and can be ignored.

API
---

### Constructor

You can instantiate an instance of the emulator with the `Y86` constructor:

    var cpu = new Y86();

An optional parameter lets you specify, in the number of bytes, the size of the memory you want to allocate to the emulator. The default is 4096 kilobytes.

### Public methods

* `tick()`: Advances the processor one tick ahead.
* `reset()`: Resets all registers (including flags) to 0 and zeroes the entire RAM.
* `readMem(address, register)`: Moves 4 bytes from the specified memory `address` to the specified `register`.
* `writeMem(address, value, register)`: Moves 4 bytes from the specified `register` to the specified memory `address`. If `register` is not specified, `value` is used instead.
* `getFlags()`: Returns an object with the properties `zf`, `sf`, and `of`, each corresponding to the internal y86 flags they represent.
* `getIrs()`: Returns an object with the properties `icr` (interrupt control register) and `ifr` (interrupt flag register).
* `registerMmioModule(module)`: Registers the specified `module` and returns it. See below for more info.

### Public properties

* `mem`: The memory in form of the raw [`ArrayBuffer`](https://developer.mozilla.org/en/JavaScript_typed_arrays/ArrayBuffer) that backs it.
* `ram`: The memory as an unsigned 8-bit integer array ([`Uint8Array`](https://developer.mozilla.org/en/JavaScript_typed_arrays/Uint8Array))
* `ram32`: The memory as an unsigned 32-bit integer array ([`Uint32Array`](https://developer.mozilla.org/en/JavaScript_typed_arrays/Uint32Array))
* `regs`: The registers in form of the raw [`ArrayBuffer`](https://developer.mozilla.org/en/JavaScript_typed_arrays/ArrayBuffer) that backs them. Registers are stored in the following order:
  * `eax`
  * `ecx`
  * `edx`
  * `ebx`
  * `esp`
  * `ebp`
  * `esi`
  * `edi`
  * `eip`
* `reg`: The registers as an unsigned 32-bit integer array ([`Uint32Array`](https://developer.mozilla.org/en/JavaScript_typed_arrays/Uint32Array))
* `reg8`: The registers as an unsigned 8-bit integer array ([`Uint8Array`](https://developer.mozilla.org/en/JavaScript_typed_arrays/Uint8Array))

Use caution when directly manipulating the internal registers and the memory.

MMIO and interrupts
-------------------

There are three types of MMIO _modules_:

* Read interceptor ("`r`")
* Write interceptor ("`w`")
* Interrupt provider ("`interr`")

While these types can be mixed and matched freely, do keep in mind silly or non-sensical combos.

The `module` object provided to the `registerMmioModule(module)` method should have the following properties:

* `name`
* `types`: An array with one or more of the types aforementioned.
* `addrs`: An array of addresses to intercept for this module.

Depending on the type of the module, additional functions and properties may need to be declared.

When a module is a _read interceptor_, the module should declare the `read(address)` function, which should return the data value that is to be read, given an `address`.

When a module is a _write interceptor_, the module should declare the `write(address, value)` function, which is called when an intercepted address is written to.

When a module is an _interrupt provider_, the module needs to declare two more properties:

* `events`, an object where a key is an arbitrary interrupt event identifier, and a value is an array of bit positions that this even should map to in both the `ifr` (interrupt flag register) and `icr` (interrupt control register).
* `vectors`, an object where a key is an arbitrary interrupt event identifier, and a value that is a memory location / address that was specified to be intercepted.

In addition, an _interrupt provider_ module must declare the `tick()` function.

_More docs to be added._