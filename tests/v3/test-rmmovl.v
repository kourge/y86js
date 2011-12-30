//                      | # Y86 rmmovl unit test program
//                      | 
//                      | # Final values should be:
//                      | # %eax:	        0x00000005
//                      | # %ecx:		0x00000014
//                      | # %edx:		0x00000010
//                      | # 0x0010:	0x00000014
//                      | # 0x0014:	0x00000005
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
//  0x040: 30f140000000 |     irmovl A,%ecx
    mem[64] = 8'h30;
    mem[65] = 8'hf1;
    mem[66] = 8'h40;
    mem[67] = 8'h00;
    mem[68] = 8'h00;
    mem[69] = 8'h00;
//  0x046: 30f244000000 |     irmovl B,%edx
    mem[70] = 8'h30;
    mem[71] = 8'hf2;
    mem[72] = 8'h44;
    mem[73] = 8'h00;
    mem[74] = 8'h00;
    mem[75] = 8'h00;
//  0x04c: 30f005000000 |     irmovl $5,%eax
    mem[76] = 8'h30;
    mem[77] = 8'hf0;
    mem[78] = 8'h05;
    mem[79] = 8'h00;
    mem[80] = 8'h00;
    mem[81] = 8'h00;
//  0x052: 401200000000 |     rmmovl %ecx,(%edx)
    mem[82] = 8'h40;
    mem[83] = 8'h12;
    mem[84] = 8'h00;
    mem[85] = 8'h00;
    mem[86] = 8'h00;
    mem[87] = 8'h00;
//  0x058: 400100000000 |     rmmovl %eax,(%ecx)
    mem[88] = 8'h40;
    mem[89] = 8'h01;
    mem[90] = 8'h00;
    mem[91] = 8'h00;
    mem[92] = 8'h00;
    mem[93] = 8'h00;
//  0x05e: 4001feffffff |     rmmovl %eax,-2(%ecx)
    mem[94] = 8'h40;
    mem[95] = 8'h01;
    mem[96] = 8'hfe;
    mem[97] = 8'hff;
    mem[98] = 8'hff;
    mem[99] = 8'hff;
//  0x064: 00           |     halt
    mem[100] = 8'h00;
//  0x040:              |     .pos 0x40
//  0x040:              | A:
//  0x044:              |     .pos 0x44
//  0x044:              | B:
