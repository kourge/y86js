//                      | # Y86 mrmovl and rmmovl unit test program
//                      | # Final register values should be:
//                      | # %eax:		0x00000006
//                      | # %ecx:		0x00000100
//                      | # %edx:		0x00000006
//                      | # %ebx:		0x00000006
//                      | 
//                      | # Final memory state should be:
//                      | # 0x00fc:       0x00000600
//  0x000:              |     .pos 0
//  0x000: 7040000000   |     jmp Start
    mem[0] = 8'h70;
    mem[1] = 8'h40;
    mem[2] = 8'h00;
    mem[3] = 8'h00;
    mem[4] = 8'h00;
//  0x040:              |     .pos 0x40
//  0x040:              | Start:
//  0x040: 30f006000000 |     irmovl $6,%eax
    mem[64] = 8'h30;
    mem[65] = 8'hf0;
    mem[66] = 8'h06;
    mem[67] = 8'h00;
    mem[68] = 8'h00;
    mem[69] = 8'h00;
//  0x046: 30f100010000 |     irmovl A,%ecx
    mem[70] = 8'h30;
    mem[71] = 8'hf1;
    mem[72] = 8'h00;
    mem[73] = 8'h01;
    mem[74] = 8'h00;
    mem[75] = 8'h00;
//  0x04c: 4001fdffffff |     rmmovl %eax,-3(%ecx)
    mem[76] = 8'h40;
    mem[77] = 8'h01;
    mem[78] = 8'hfd;
    mem[79] = 8'hff;
    mem[80] = 8'hff;
    mem[81] = 8'hff;
//  0x052: 5021fdffffff |     mrmovl -3(%ecx),%edx
    mem[82] = 8'h50;
    mem[83] = 8'h21;
    mem[84] = 8'hfd;
    mem[85] = 8'hff;
    mem[86] = 8'hff;
    mem[87] = 8'hff;
//  0x058: 402100000000 |     rmmovl %edx,(%ecx)
    mem[88] = 8'h40;
    mem[89] = 8'h21;
    mem[90] = 8'h00;
    mem[91] = 8'h00;
    mem[92] = 8'h00;
    mem[93] = 8'h00;
//  0x05e: 503100000000 |     mrmovl (%ecx),%ebx
    mem[94] = 8'h50;
    mem[95] = 8'h31;
    mem[96] = 8'h00;
    mem[97] = 8'h00;
    mem[98] = 8'h00;
    mem[99] = 8'h00;
//  0x064: 00           |     halt
    mem[100] = 8'h00;
//  0x100:              |     .pos 0x100
//  0x100:              | A:
