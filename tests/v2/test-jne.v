//                      | # Y86 jne unit test program
//                      | # Final register values should be:
//                      | # %ecx:	0x00000003
//                      | # %edx:	0x00000005
//                      | # %ebx:	0x0000000a
//                      | 
//  0x000: 30f003000000 | Start:	 irmovl $3,%eax
    mem[0] = 8'h30;
    mem[1] = 8'hf0;
    mem[2] = 8'h03;
    mem[3] = 8'h00;
    mem[4] = 8'h00;
    mem[5] = 8'h00;
//  0x006: 30f103000000 | 	 irmovl $3,%ecx
    mem[6] = 8'h30;
    mem[7] = 8'hf1;
    mem[8] = 8'h03;
    mem[9] = 8'h00;
    mem[10] = 8'h00;
    mem[11] = 8'h00;
//  0x00c: 6110         | 	 subl %ecx,%eax
    mem[12] = 8'h61;
    mem[13] = 8'h10;
//  0x00e: 7326000000   | 	 je Jmp1
    mem[14] = 8'h73;
    mem[15] = 8'h26;
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
//  0x019: 30f102000000 | 	 irmovl $2,%ecx
    mem[25] = 8'h30;
    mem[26] = 8'hf1;
    mem[27] = 8'h02;
    mem[28] = 8'h00;
    mem[29] = 8'h00;
    mem[30] = 8'h00;
//  0x01f: 6101         | 	 subl %eax,%ecx
    mem[31] = 8'h61;
    mem[32] = 8'h01;
//  0x021: 7331000000   | 	 je Jmp2
    mem[33] = 8'h73;
    mem[34] = 8'h31;
    mem[35] = 8'h00;
    mem[36] = 8'h00;
    mem[37] = 8'h00;
//                      | 
//  0x026: 30f205000000 | Jmp1:	 irmovl $5,%edx
    mem[38] = 8'h30;
    mem[39] = 8'hf2;
    mem[40] = 8'h05;
    mem[41] = 8'h00;
    mem[42] = 8'h00;
    mem[43] = 8'h00;
//  0x02c: 7031000000   | 	 jmp Jmp2
    mem[44] = 8'h70;
    mem[45] = 8'h31;
    mem[46] = 8'h00;
    mem[47] = 8'h00;
    mem[48] = 8'h00;
//                      | 
//  0x031: 30f30a000000 | Jmp2:	 irmovl $10,%ebx
    mem[49] = 8'h30;
    mem[50] = 8'hf3;
    mem[51] = 8'h0a;
    mem[52] = 8'h00;
    mem[53] = 8'h00;
    mem[54] = 8'h00;
