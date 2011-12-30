//                      | # Final register values should be:
//                      | # %eax:		0x00000006
//                      | # %ecx:		0x00000001
//                      | # %edx:		0x00000001
//                      | # %ebx:		0x00000006
//                      | # %esp:		0x000001f8
//                      | # %ebp:		0x00000200
//                      | # %edi:		0x0000000b
//                      | 
//  0x000:              |  	.pos 0
//  0x000: 30f700000000 | irmovl $0, %edi
    mem[0] = 8'h30;
    mem[1] = 8'hf7;
    mem[2] = 8'h00;
    mem[3] = 8'h00;
    mem[4] = 8'h00;
    mem[5] = 8'h00;
//  0x006: 30f400020000 | init:	 irmovl Stack, %esp
    mem[6] = 8'h30;
    mem[7] = 8'hf4;
    mem[8] = 8'h00;
    mem[9] = 8'h02;
    mem[10] = 8'h00;
    mem[11] = 8'h00;
//  0x00c: 30f500020000 | 	 irmovl Stack, %ebp
    mem[12] = 8'h30;
    mem[13] = 8'hf5;
    mem[14] = 8'h00;
    mem[15] = 8'h02;
    mem[16] = 8'h00;
    mem[17] = 8'h00;
//  0x012: 801d000000   | 	 call test_block
    mem[18] = 8'h80;
    mem[19] = 8'h1d;
    mem[20] = 8'h00;
    mem[21] = 8'h00;
    mem[22] = 8'h00;
//                      | 
//  0x017: 30f101000000 | bad_block:	irmovl $1,%ecx
    mem[23] = 8'h30;
    mem[24] = 8'hf1;
    mem[25] = 8'h01;
    mem[26] = 8'h00;
    mem[27] = 8'h00;
    mem[28] = 8'h00;
//                      | 
//  0x01d: 30f103000000 | test_block:	irmovl $3,%ecx
    mem[29] = 8'h30;
    mem[30] = 8'hf1;
    mem[31] = 8'h03;
    mem[32] = 8'h00;
    mem[33] = 8'h00;
    mem[34] = 8'h00;
//                      | 
//  0x023: 6017         | addl %ecx, %edi
    mem[35] = 8'h60;
    mem[36] = 8'h17;
//                      | 
//  0x025: 30f400020000 | irmovl Stack,%esp
    mem[37] = 8'h30;
    mem[38] = 8'hf4;
    mem[39] = 8'h00;
    mem[40] = 8'h02;
    mem[41] = 8'h00;
    mem[42] = 8'h00;
//  0x02b: 30f500020000 | irmovl Stack,%ebp
    mem[43] = 8'h30;
    mem[44] = 8'hf5;
    mem[45] = 8'h00;
    mem[46] = 8'h02;
    mem[47] = 8'h00;
    mem[48] = 8'h00;
//  0x031: a05f         | pushl %ebp
    mem[49] = 8'ha0;
    mem[50] = 8'h5f;
//  0x033: 30f004000000 | irmovl $4,%eax
    mem[51] = 8'h30;
    mem[52] = 8'hf0;
    mem[53] = 8'h04;
    mem[54] = 8'h00;
    mem[55] = 8'h00;
    mem[56] = 8'h00;
//  0x039: a00f         | pushl %eax
    mem[57] = 8'ha0;
    mem[58] = 8'h0f;
//  0x03b: b05f         | popl %ebp
    mem[59] = 8'hb0;
    mem[60] = 8'h5f;
//                      | 
//  0x03d: 6057         | addl %ebp, %edi
    mem[61] = 8'h60;
    mem[62] = 8'h57;
//                      | 
//  0x03f: 30f400020000 | irmovl Stack,%esp
    mem[63] = 8'h30;
    mem[64] = 8'hf4;
    mem[65] = 8'h00;
    mem[66] = 8'h02;
    mem[67] = 8'h00;
    mem[68] = 8'h00;
//  0x045: 30f500020000 | irmovl Stack,%ebp
    mem[69] = 8'h30;
    mem[70] = 8'hf5;
    mem[71] = 8'h00;
    mem[72] = 8'h02;
    mem[73] = 8'h00;
    mem[74] = 8'h00;
//  0x04b: a05f         | pushl %ebp
    mem[75] = 8'ha0;
    mem[76] = 8'h5f;
//  0x04d: 30f004000000 | irmovl $4,%eax
    mem[77] = 8'h30;
    mem[78] = 8'hf0;
    mem[79] = 8'h04;
    mem[80] = 8'h00;
    mem[81] = 8'h00;
    mem[82] = 8'h00;
//  0x053: a00f         | pushl %eax
    mem[83] = 8'ha0;
    mem[84] = 8'h0f;
//                      | 
//  0x055: 6007         | addl %eax, %edi
    mem[85] = 8'h60;
    mem[86] = 8'h07;
//                      | 
//  0x057: 30f006000000 | irmovl $6,%eax
    mem[87] = 8'h30;
    mem[88] = 8'hf0;
    mem[89] = 8'h06;
    mem[90] = 8'h00;
    mem[91] = 8'h00;
    mem[92] = 8'h00;
//  0x05d: 30f10f000000 | irmovl $15,%ecx
    mem[93] = 8'h30;
    mem[94] = 8'hf1;
    mem[95] = 8'h0f;
    mem[96] = 8'h00;
    mem[97] = 8'h00;
    mem[98] = 8'h00;
//  0x063: 400196000000 | rmmovl %eax,150(%ecx)
    mem[99] = 8'h40;
    mem[100] = 8'h01;
    mem[101] = 8'h96;
    mem[102] = 8'h00;
    mem[103] = 8'h00;
    mem[104] = 8'h00;
//  0x069: 502196000000 | mrmovl 150(%ecx),%edx
    mem[105] = 8'h50;
    mem[106] = 8'h21;
    mem[107] = 8'h96;
    mem[108] = 8'h00;
    mem[109] = 8'h00;
    mem[110] = 8'h00;
//  0x06f: 402100000000 | rmmovl %edx,(%ecx)
    mem[111] = 8'h40;
    mem[112] = 8'h21;
    mem[113] = 8'h00;
    mem[114] = 8'h00;
    mem[115] = 8'h00;
    mem[116] = 8'h00;
//  0x075: 503100000000 | mrmovl (%ecx),%ebx
    mem[117] = 8'h50;
    mem[118] = 8'h31;
    mem[119] = 8'h00;
    mem[120] = 8'h00;
    mem[121] = 8'h00;
    mem[122] = 8'h00;
//                      | 
//  0x07b: 808d000000   | 	 call test_block2
    mem[123] = 8'h80;
    mem[124] = 8'h8d;
    mem[125] = 8'h00;
    mem[126] = 8'h00;
    mem[127] = 8'h00;
//  0x080: 30f201000000 | 	 irmovl $1,%edx
    mem[128] = 8'h30;
    mem[129] = 8'hf2;
    mem[130] = 8'h01;
    mem[131] = 8'h00;
    mem[132] = 8'h00;
    mem[133] = 8'h00;
//                      | 
//  0x086: 30f101000000 | bad_block2:	irmovl $1,%ecx
    mem[134] = 8'h30;
    mem[135] = 8'hf1;
    mem[136] = 8'h01;
    mem[137] = 8'h00;
    mem[138] = 8'h00;
    mem[139] = 8'h00;
//  0x08c: 00           | 	halt
    mem[140] = 8'h00;
//                      | 
//  0x08d: a05f         | test_block2:	pushl %ebp
    mem[141] = 8'ha0;
    mem[142] = 8'h5f;
//  0x08f: 2045         | 		rrmovl %esp,%ebp
    mem[143] = 8'h20;
    mem[144] = 8'h45;
//  0x091: 30f103000000 | 		irmovl $3,%ecx
    mem[145] = 8'h30;
    mem[146] = 8'hf1;
    mem[147] = 8'h03;
    mem[148] = 8'h00;
    mem[149] = 8'h00;
    mem[150] = 8'h00;
//  0x097: 2054         | 		rrmovl %ebp,%esp
    mem[151] = 8'h20;
    mem[152] = 8'h54;
//  0x099: b05f         | 		popl %ebp
    mem[153] = 8'hb0;
    mem[154] = 8'h5f;
//  0x09b: 90           | 		ret
    mem[155] = 8'h90;
//                      | 
//                      | 
//  0x200:              | 	.pos 0x200
//  0x200:              | Stack:
//                      | 
