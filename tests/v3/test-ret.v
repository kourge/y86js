//                      | # Y86 ret unit test program
//                      | 
//                      | # Final register values should be:
//                      | # %ecx:		0x00000003
//                      | # %edx:		0x00000001
//                      | # %esp:		0x000000f8
//                      | # %ebp:		0x00000100
//                      | 
//                      | # Final memory state should be:
//                      | # 0x00f8:       0x00000100
//                      | # 0x00fc:       0x00000011
//                      | 
//  0x000:              | 	.pos 0
//  0x000: 7040000000   | 	jmp Start
    mem[0] = 8'h70;
    mem[1] = 8'h40;
    mem[2] = 8'h00;
    mem[3] = 8'h00;
    mem[4] = 8'h00;
//  0x040:              | 	.pos 0x40
//  0x040: 30f400010000 | Start:	 irmovl Stack, %esp
    mem[64] = 8'h30;
    mem[65] = 8'hf4;
    mem[66] = 8'h00;
    mem[67] = 8'h01;
    mem[68] = 8'h00;
    mem[69] = 8'h00;
//  0x046: 30f500010000 | 	 irmovl Stack, %ebp
    mem[70] = 8'h30;
    mem[71] = 8'hf5;
    mem[72] = 8'h00;
    mem[73] = 8'h01;
    mem[74] = 8'h00;
    mem[75] = 8'h00;
//  0x04c: 805e000000   | 	 call test_block
    mem[76] = 8'h80;
    mem[77] = 8'h5e;
    mem[78] = 8'h00;
    mem[79] = 8'h00;
    mem[80] = 8'h00;
//  0x051: 30f201000000 | 	 irmovl $1,%edx
    mem[81] = 8'h30;
    mem[82] = 8'hf2;
    mem[83] = 8'h01;
    mem[84] = 8'h00;
    mem[85] = 8'h00;
    mem[86] = 8'h00;
//  0x057: 00           | 	 halt
    mem[87] = 8'h00;
//                      | 
//  0x058: 30f101000000 | bad_block: irmovl $1,%ecx
    mem[88] = 8'h30;
    mem[89] = 8'hf1;
    mem[90] = 8'h01;
    mem[91] = 8'h00;
    mem[92] = 8'h00;
    mem[93] = 8'h00;
//                      | 
//  0x05e: a05f         | test_block: pushl %ebp
    mem[94] = 8'ha0;
    mem[95] = 8'h5f;
//  0x060: 2045         |         rrmovl %esp,%ebp
    mem[96] = 8'h20;
    mem[97] = 8'h45;
//  0x062: 30f103000000 | 	irmovl $3,%ecx
    mem[98] = 8'h30;
    mem[99] = 8'hf1;
    mem[100] = 8'h03;
    mem[101] = 8'h00;
    mem[102] = 8'h00;
    mem[103] = 8'h00;
//  0x068: 2054         | 	rrmovl %ebp,%esp
    mem[104] = 8'h20;
    mem[105] = 8'h54;
//  0x06a: b05f         | 	popl %ebp
    mem[106] = 8'hb0;
    mem[107] = 8'h5f;
//  0x06c: 90           | 	ret
    mem[108] = 8'h90;
//                      | 
//  0x100:              | 	.pos 0x100
//  0x100:              | Stack:
