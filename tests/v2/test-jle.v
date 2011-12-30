//                      | # Y86 jle unit test program
//                      | # Final register values should be:
//                      | # %eax:	0x00000004
//                      | # %edx:	0x00000007
//                      | # %ebx:	0x00000001
//                      | 
//  0x000: 30f004000000 | Start:	  irmovl $4,%eax
    mem[0] = 8'h30;
    mem[1] = 8'hf0;
    mem[2] = 8'h04;
    mem[3] = 8'h00;
    mem[4] = 8'h00;
    mem[5] = 8'h00;
//  0x006: 30f103000000 | 	  irmovl $3,%ecx
    mem[6] = 8'h30;
    mem[7] = 8'hf1;
    mem[8] = 8'h03;
    mem[9] = 8'h00;
    mem[10] = 8'h00;
    mem[11] = 8'h00;
//  0x00c: 6110         | 	  subl %ecx,%eax
    mem[12] = 8'h61;
    mem[13] = 8'h10;
//  0x00e: 7126000000   | 	  jle Jmp1
    mem[14] = 8'h71;
    mem[15] = 8'h26;
    mem[16] = 8'h00;
    mem[17] = 8'h00;
    mem[18] = 8'h00;
//  0x013: 30f004000000 | 	  irmovl $4,%eax
    mem[19] = 8'h30;
    mem[20] = 8'hf0;
    mem[21] = 8'h04;
    mem[22] = 8'h00;
    mem[23] = 8'h00;
    mem[24] = 8'h00;
//  0x019: 30f103000000 | 	  irmovl $3,%ecx
    mem[25] = 8'h30;
    mem[26] = 8'hf1;
    mem[27] = 8'h03;
    mem[28] = 8'h00;
    mem[29] = 8'h00;
    mem[30] = 8'h00;
//  0x01f: 6101         | 	  subl %eax,%ecx
    mem[31] = 8'h61;
    mem[32] = 8'h01;
//  0x021: 712c000000   | 	  jle Jmp2
    mem[33] = 8'h71;
    mem[34] = 8'h2c;
    mem[35] = 8'h00;
    mem[36] = 8'h00;
    mem[37] = 8'h00;
//                      | 
//  0x026: 30f206000000 | Jmp1:	  irmovl $6,%edx
    mem[38] = 8'h30;
    mem[39] = 8'hf2;
    mem[40] = 8'h06;
    mem[41] = 8'h00;
    mem[42] = 8'h00;
    mem[43] = 8'h00;
//                      | 
//  0x02c: 30f207000000 | Jmp2:	  irmovl $7,%edx
    mem[44] = 8'h30;
    mem[45] = 8'hf2;
    mem[46] = 8'h07;
    mem[47] = 8'h00;
    mem[48] = 8'h00;
    mem[49] = 8'h00;
//  0x032: 30f004000000 | 	  irmovl $4,%eax
    mem[50] = 8'h30;
    mem[51] = 8'hf0;
    mem[52] = 8'h04;
    mem[53] = 8'h00;
    mem[54] = 8'h00;
    mem[55] = 8'h00;
//  0x038: 30f104000000 | 	  irmovl $4,%ecx
    mem[56] = 8'h30;
    mem[57] = 8'hf1;
    mem[58] = 8'h04;
    mem[59] = 8'h00;
    mem[60] = 8'h00;
    mem[61] = 8'h00;
//  0x03e: 6101         | 	  subl %eax,%ecx
    mem[62] = 8'h61;
    mem[63] = 8'h01;
//  0x040: 714b000000   | 	  jle Jmp3
    mem[64] = 8'h71;
    mem[65] = 8'h4b;
    mem[66] = 8'h00;
    mem[67] = 8'h00;
    mem[68] = 8'h00;
//  0x045: 30f305000000 | 	  irmovl $5,%ebx
    mem[69] = 8'h30;
    mem[70] = 8'hf3;
    mem[71] = 8'h05;
    mem[72] = 8'h00;
    mem[73] = 8'h00;
    mem[74] = 8'h00;
//                      | 
//  0x04b: 30f301000000 | Jmp3:	  irmovl $1,%ebx
    mem[75] = 8'h30;
    mem[76] = 8'hf3;
    mem[77] = 8'h01;
    mem[78] = 8'h00;
    mem[79] = 8'h00;
    mem[80] = 8'h00;
//                      | 
