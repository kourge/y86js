//                      | # Y86 call unit test program
//                      | 
//                      | # Final register values should be:
//                      | # %ecx:		0x00000003
//                      | # %esp:		0x000000fc
//                      | # %ebp:		0x00000100
//                      | 
//                      | # Final memory state should be:
//                      | # 0x00fc:       0x00000011
//                      | 
//  0x000:              | 	.pos 0
//  0x000: 30f400010000 | init:	 irmovl Stack, %esp
    mem[0] = 8'h30;
    mem[1] = 8'hf4;
    mem[2] = 8'h00;
    mem[3] = 8'h01;
    mem[4] = 8'h00;
    mem[5] = 8'h00;
//  0x006: 30f500010000 | 	 irmovl Stack, %ebp
    mem[6] = 8'h30;
    mem[7] = 8'hf5;
    mem[8] = 8'h00;
    mem[9] = 8'h01;
    mem[10] = 8'h00;
    mem[11] = 8'h00;
//  0x00c: 8018000000   | 	 call test_block
    mem[12] = 8'h80;
    mem[13] = 8'h18;
    mem[14] = 8'h00;
    mem[15] = 8'h00;
    mem[16] = 8'h00;
//  0x011: 30f101000000 | bad_block: irmovl $1,%ecx
    mem[17] = 8'h30;
    mem[18] = 8'hf1;
    mem[19] = 8'h01;
    mem[20] = 8'h00;
    mem[21] = 8'h00;
    mem[22] = 8'h00;
//  0x017: 00           |          halt
    mem[23] = 8'h00;
//  0x018: 30f103000000 | test_block: irmovl $3,%ecx
    mem[24] = 8'h30;
    mem[25] = 8'hf1;
    mem[26] = 8'h03;
    mem[27] = 8'h00;
    mem[28] = 8'h00;
    mem[29] = 8'h00;
//  0x01e: 00           | 	 halt
    mem[30] = 8'h00;
//  0x100:              | 	.pos 0x100
//  0x100:              | Stack:
