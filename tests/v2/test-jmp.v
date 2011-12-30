//                      | # Y86 jmp unit test program
//                      | # Final register values should be:
//                      | # %eax:	0x00000004
//                      | # %ecx: 0x00000003
//                      | 
//  0x000: 30f004000000 | Start:	  irmovl $4,%eax
    mem[0] = 8'h30;
    mem[1] = 8'hf0;
    mem[2] = 8'h04;
    mem[3] = 8'h00;
    mem[4] = 8'h00;
    mem[5] = 8'h00;
//  0x006: 7011000000   | 	  jmp JmpPnt
    mem[6] = 8'h70;
    mem[7] = 8'h11;
    mem[8] = 8'h00;
    mem[9] = 8'h00;
    mem[10] = 8'h00;
//  0x00b: 30f102000000 | 	  irmovl $2,%ecx
    mem[11] = 8'h30;
    mem[12] = 8'hf1;
    mem[13] = 8'h02;
    mem[14] = 8'h00;
    mem[15] = 8'h00;
    mem[16] = 8'h00;
//                      | 
//  0x011: 30f103000000 | JmpPnt:	  irmovl $3,%ecx
    mem[17] = 8'h30;
    mem[18] = 8'hf1;
    mem[19] = 8'h03;
    mem[20] = 8'h00;
    mem[21] = 8'h00;
    mem[22] = 8'h00;
