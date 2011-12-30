//                      | # Y86 jl unit test program
//                      | # Final register values should be:
//                      | # %eax:	0xffffffff
//                      | # %ecx: 0x00000004
//                      | # %ebx:	0x0000000a
//                      | 
//  0x000: 30f003000000 | Start:	 irmovl $3,%eax
    mem[0] = 8'h30;
    mem[1] = 8'hf0;
    mem[2] = 8'h03;
    mem[3] = 8'h00;
    mem[4] = 8'h00;
    mem[5] = 8'h00;
//  0x006: 30f102000000 | 	 irmovl $2,%ecx
    mem[6] = 8'h30;
    mem[7] = 8'hf1;
    mem[8] = 8'h02;
    mem[9] = 8'h00;
    mem[10] = 8'h00;
    mem[11] = 8'h00;
//  0x00c: 6110         | 	 subl %ecx,%eax
    mem[12] = 8'h61;
    mem[13] = 8'h10;
//  0x00e: 7239000000   | 	 jl Jmp1
    mem[14] = 8'h72;
    mem[15] = 8'h39;
    mem[16] = 8'h00;
    mem[17] = 8'h00;
    mem[18] = 8'h00;
//  0x013: 30f003000000 | 	 irmovl $3,%eax
    mem[19] = 8'h30;
    mem[20] = 8'hf0;
    mem[21] = 8'h03;
    mem[22] = 8'h00;
    mem[23] = 8'h00;
    mem[24] = 8'h00;
//  0x019: 30f103000000 | 	 irmovl $3,%ecx
    mem[25] = 8'h30;
    mem[26] = 8'hf1;
    mem[27] = 8'h03;
    mem[28] = 8'h00;
    mem[29] = 8'h00;
    mem[30] = 8'h00;
//  0x01f: 6101         | 	 subl %eax,%ecx
    mem[31] = 8'h61;
    mem[32] = 8'h01;
//  0x021: 7239000000   | 	 jl Jmp1
    mem[33] = 8'h72;
    mem[34] = 8'h39;
    mem[35] = 8'h00;
    mem[36] = 8'h00;
    mem[37] = 8'h00;
//  0x026: 30f003000000 | 	 irmovl $3,%eax
    mem[38] = 8'h30;
    mem[39] = 8'hf0;
    mem[40] = 8'h03;
    mem[41] = 8'h00;
    mem[42] = 8'h00;
    mem[43] = 8'h00;
//  0x02c: 30f104000000 | 	 irmovl $4,%ecx
    mem[44] = 8'h30;
    mem[45] = 8'hf1;
    mem[46] = 8'h04;
    mem[47] = 8'h00;
    mem[48] = 8'h00;
    mem[49] = 8'h00;
//  0x032: 6110         | 	 subl %ecx,%eax
    mem[50] = 8'h61;
    mem[51] = 8'h10;
//  0x034: 7244000000   | 	 jl Jmp2
    mem[52] = 8'h72;
    mem[53] = 8'h44;
    mem[54] = 8'h00;
    mem[55] = 8'h00;
    mem[56] = 8'h00;
//                      | 
//  0x039: 30f205000000 | Jmp1:	 irmovl $5,%edx
    mem[57] = 8'h30;
    mem[58] = 8'hf2;
    mem[59] = 8'h05;
    mem[60] = 8'h00;
    mem[61] = 8'h00;
    mem[62] = 8'h00;
//  0x03f: 7044000000   | 	 jmp Jmp2
    mem[63] = 8'h70;
    mem[64] = 8'h44;
    mem[65] = 8'h00;
    mem[66] = 8'h00;
    mem[67] = 8'h00;
//                      | 
//  0x044: 30f30a000000 | Jmp2:	 irmovl $10,%ebx
    mem[68] = 8'h30;
    mem[69] = 8'hf3;
    mem[70] = 8'h0a;
    mem[71] = 8'h00;
    mem[72] = 8'h00;
    mem[73] = 8'h00;
