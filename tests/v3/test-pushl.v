//                      | # Y86 pushl unit test program
//                      | # Final register values should be:
//                      | # %esp:	0x000000fc
//                      | # %ebp: 0x00000100
//                      | 
//                      | # Final memory values should be:
//                      | # 0x00fc:      0x00000100
//                      | # 0x00f8:      0x00000004
//                      | 
//  0x000:              |     .pos 0
//  0x000: 7040000000   |     jmp Start
    mem[0] = 8'h70;
    mem[1] = 8'h40;
    mem[2] = 8'h00;
    mem[3] = 8'h00;
    mem[4] = 8'h00;
//  0x040:              |     .pos 0x40
//  0x040:              | Start:
//  0x040: 30f400010000 |     irmovl Stack,%esp
    mem[64] = 8'h30;
    mem[65] = 8'hf4;
    mem[66] = 8'h00;
    mem[67] = 8'h01;
    mem[68] = 8'h00;
    mem[69] = 8'h00;
//  0x046: 30f500010000 |     irmovl Stack,%ebp
    mem[70] = 8'h30;
    mem[71] = 8'hf5;
    mem[72] = 8'h00;
    mem[73] = 8'h01;
    mem[74] = 8'h00;
    mem[75] = 8'h00;
//  0x04c: a05f         |     pushl %ebp
    mem[76] = 8'ha0;
    mem[77] = 8'h5f;
//  0x04e: 30f004000000 |     irmovl $4,%eax
    mem[78] = 8'h30;
    mem[79] = 8'hf0;
    mem[80] = 8'h04;
    mem[81] = 8'h00;
    mem[82] = 8'h00;
    mem[83] = 8'h00;
//  0x054: a00f         |     pushl %eax
    mem[84] = 8'ha0;
    mem[85] = 8'h0f;
//  0x056: 00           |     halt
    mem[86] = 8'h00;
//  0x100:              |     .pos 0x100
//  0x100:              | Stack:
