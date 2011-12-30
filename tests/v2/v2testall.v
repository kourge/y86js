//                      | # Y86 cmov and jump test
//                      | # Final register values should be:
//                      | # %eax: 0x00000004
//                      | # %ecx: 0x00000007
//                      | # %edx: 0x0000000c
//                      | # %ebx: 0x00000001
//                      | # %esi: 0x00000065
//                      | 
//  0x000: 30f004000000 | irmovl $4,%eax
    mem[0] = 8'h30;
    mem[1] = 8'hf0;
    mem[2] = 8'h04;
    mem[3] = 8'h00;
    mem[4] = 8'h00;
    mem[5] = 8'h00;
//  0x006: 30f105000000 | irmovl $5,%ecx
    mem[6] = 8'h30;
    mem[7] = 8'hf1;
    mem[8] = 8'h05;
    mem[9] = 8'h00;
    mem[10] = 8'h00;
    mem[11] = 8'h00;
//  0x00c: 6101         | subl %eax,%ecx
    mem[12] = 8'h61;
    mem[13] = 8'h01;
//  0x00e: 2612         | cmovg %ecx,%edx
    mem[14] = 8'h26;
    mem[15] = 8'h12;
//  0x010: 30f004000000 | irmovl $4,%eax
    mem[16] = 8'h30;
    mem[17] = 8'hf0;
    mem[18] = 8'h04;
    mem[19] = 8'h00;
    mem[20] = 8'h00;
    mem[21] = 8'h00;
//  0x016: 30f104000000 | irmovl $4,%ecx
    mem[22] = 8'h30;
    mem[23] = 8'hf1;
    mem[24] = 8'h04;
    mem[25] = 8'h00;
    mem[26] = 8'h00;
    mem[27] = 8'h00;
//  0x01c: 6101         | subl %eax,%ecx
    mem[28] = 8'h61;
    mem[29] = 8'h01;
//  0x01e: 2603         | cmovg %eax,%ebx
    mem[30] = 8'h26;
    mem[31] = 8'h03;
//  0x020: 30f004000000 | irmovl $4,%eax
    mem[32] = 8'h30;
    mem[33] = 8'hf0;
    mem[34] = 8'h04;
    mem[35] = 8'h00;
    mem[36] = 8'h00;
    mem[37] = 8'h00;
//  0x026: 30f103000000 | irmovl $3,%ecx
    mem[38] = 8'h30;
    mem[39] = 8'hf1;
    mem[40] = 8'h03;
    mem[41] = 8'h00;
    mem[42] = 8'h00;
    mem[43] = 8'h00;
//  0x02c: 6101         | subl %eax,%ecx
    mem[44] = 8'h61;
    mem[45] = 8'h01;
//  0x02e: 2613         | cmovg %ecx,%ebx
    mem[46] = 8'h26;
    mem[47] = 8'h13;
//                      | # %eax: 0x00000004
//                      | # %ecx: 0xffffffff
//                      | # %edx: 0x00000001
//                      | 
//  0x030: 6002         | addl %eax,%edx
    mem[48] = 8'h60;
    mem[49] = 8'h02;
//  0x032: 6021         | addl %edx,%ecx
    mem[50] = 8'h60;
    mem[51] = 8'h21;
//  0x034: 2016         | rrmovl %ecx, %esi
    mem[52] = 8'h20;
    mem[53] = 8'h16;
//                      | # %esi: 0x00000004
//                      | 
//  0x036: 30f004000000 | irmovl $4,%eax
    mem[54] = 8'h30;
    mem[55] = 8'hf0;
    mem[56] = 8'h04;
    mem[57] = 8'h00;
    mem[58] = 8'h00;
    mem[59] = 8'h00;
//  0x03c: 30f105000000 | irmovl $5,%ecx
    mem[60] = 8'h30;
    mem[61] = 8'hf1;
    mem[62] = 8'h05;
    mem[63] = 8'h00;
    mem[64] = 8'h00;
    mem[65] = 8'h00;
//  0x042: 6101         | subl %eax,%ecx
    mem[66] = 8'h61;
    mem[67] = 8'h01;
//  0x044: 2312         | cmove %ecx,%edx
    mem[68] = 8'h23;
    mem[69] = 8'h12;
//  0x046: 30f004000000 | irmovl $4,%eax
    mem[70] = 8'h30;
    mem[71] = 8'hf0;
    mem[72] = 8'h04;
    mem[73] = 8'h00;
    mem[74] = 8'h00;
    mem[75] = 8'h00;
//  0x04c: 30f104000000 | irmovl $4,%ecx
    mem[76] = 8'h30;
    mem[77] = 8'hf1;
    mem[78] = 8'h04;
    mem[79] = 8'h00;
    mem[80] = 8'h00;
    mem[81] = 8'h00;
//  0x052: 6101         | subl %eax,%ecx
    mem[82] = 8'h61;
    mem[83] = 8'h01;
//  0x054: 2302         | cmove %eax,%edx
    mem[84] = 8'h23;
    mem[85] = 8'h02;
//  0x056: 30f004000000 | irmovl $4,%eax
    mem[86] = 8'h30;
    mem[87] = 8'hf0;
    mem[88] = 8'h04;
    mem[89] = 8'h00;
    mem[90] = 8'h00;
    mem[91] = 8'h00;
//  0x05c: 30f103000000 | irmovl $3,%ecx
    mem[92] = 8'h30;
    mem[93] = 8'hf1;
    mem[94] = 8'h03;
    mem[95] = 8'h00;
    mem[96] = 8'h00;
    mem[97] = 8'h00;
//  0x062: 6101         | subl %eax,%ecx
    mem[98] = 8'h61;
    mem[99] = 8'h01;
//  0x064: 2313         | cmove %ecx,%ebx
    mem[100] = 8'h23;
    mem[101] = 8'h13;
//                      | # %eax: 0x00000004
//                      | # %ecx: 0xffffffff
//                      | # %edx: 0x00000004
//                      | 
//  0x066: 6002         | addl %eax,%edx
    mem[102] = 8'h60;
    mem[103] = 8'h02;
//  0x068: 6021         | addl %edx,%ecx
    mem[104] = 8'h60;
    mem[105] = 8'h21;
//  0x06a: 6016         | addl %ecx, %esi
    mem[106] = 8'h60;
    mem[107] = 8'h16;
//                      | # %esi: 0x0000000b
//                      | 
//  0x06c: 30f004000000 | irmovl $4,%eax
    mem[108] = 8'h30;
    mem[109] = 8'hf0;
    mem[110] = 8'h04;
    mem[111] = 8'h00;
    mem[112] = 8'h00;
    mem[113] = 8'h00;
//  0x072: 30f105000000 | irmovl $5,%ecx
    mem[114] = 8'h30;
    mem[115] = 8'hf1;
    mem[116] = 8'h05;
    mem[117] = 8'h00;
    mem[118] = 8'h00;
    mem[119] = 8'h00;
//  0x078: 6101         | subl %eax,%ecx
    mem[120] = 8'h61;
    mem[121] = 8'h01;
//  0x07a: 2512         | cmovge %ecx,%edx
    mem[122] = 8'h25;
    mem[123] = 8'h12;
//  0x07c: 30f004000000 | irmovl $4,%eax
    mem[124] = 8'h30;
    mem[125] = 8'hf0;
    mem[126] = 8'h04;
    mem[127] = 8'h00;
    mem[128] = 8'h00;
    mem[129] = 8'h00;
//  0x082: 30f104000000 | irmovl $4,%ecx
    mem[130] = 8'h30;
    mem[131] = 8'hf1;
    mem[132] = 8'h04;
    mem[133] = 8'h00;
    mem[134] = 8'h00;
    mem[135] = 8'h00;
//  0x088: 6101         | subl %eax,%ecx
    mem[136] = 8'h61;
    mem[137] = 8'h01;
//  0x08a: 2503         | cmovge %eax,%ebx
    mem[138] = 8'h25;
    mem[139] = 8'h03;
//  0x08c: 30f004000000 | irmovl $4,%eax
    mem[140] = 8'h30;
    mem[141] = 8'hf0;
    mem[142] = 8'h04;
    mem[143] = 8'h00;
    mem[144] = 8'h00;
    mem[145] = 8'h00;
//  0x092: 30f103000000 | irmovl $3,%ecx
    mem[146] = 8'h30;
    mem[147] = 8'hf1;
    mem[148] = 8'h03;
    mem[149] = 8'h00;
    mem[150] = 8'h00;
    mem[151] = 8'h00;
//  0x098: 6101         | subl %eax,%ecx
    mem[152] = 8'h61;
    mem[153] = 8'h01;
//  0x09a: 2513         | cmovge %ecx,%ebx
    mem[154] = 8'h25;
    mem[155] = 8'h13;
//                      | # %eax: 0x00000004
//                      | # %ecx: 0xffffffff
//                      | # %edx: 0x00000001
//                      | # %ebx: 0x00000004
//                      | 
//  0x09c: 6002         | addl %eax,%edx
    mem[156] = 8'h60;
    mem[157] = 8'h02;
//  0x09e: 6021         | addl %edx,%ecx
    mem[158] = 8'h60;
    mem[159] = 8'h21;
//  0x0a0: 6031         | addl %ebx,%ecx
    mem[160] = 8'h60;
    mem[161] = 8'h31;
//  0x0a2: 6016         | addl %ecx, %esi
    mem[162] = 8'h60;
    mem[163] = 8'h16;
//                      | # %esi: 0x00000013
//                      | 
//  0x0a4: 30f004000000 | irmovl $4,%eax
    mem[164] = 8'h30;
    mem[165] = 8'hf0;
    mem[166] = 8'h04;
    mem[167] = 8'h00;
    mem[168] = 8'h00;
    mem[169] = 8'h00;
//  0x0aa: 30f105000000 | irmovl $5,%ecx
    mem[170] = 8'h30;
    mem[171] = 8'hf1;
    mem[172] = 8'h05;
    mem[173] = 8'h00;
    mem[174] = 8'h00;
    mem[175] = 8'h00;
//  0x0b0: 6101         | subl %eax,%ecx
    mem[176] = 8'h61;
    mem[177] = 8'h01;
//  0x0b2: 2212         | cmovl %ecx,%edx
    mem[178] = 8'h22;
    mem[179] = 8'h12;
//  0x0b4: 30f004000000 | irmovl $4,%eax
    mem[180] = 8'h30;
    mem[181] = 8'hf0;
    mem[182] = 8'h04;
    mem[183] = 8'h00;
    mem[184] = 8'h00;
    mem[185] = 8'h00;
//  0x0ba: 30f104000000 | irmovl $4,%ecx
    mem[186] = 8'h30;
    mem[187] = 8'hf1;
    mem[188] = 8'h04;
    mem[189] = 8'h00;
    mem[190] = 8'h00;
    mem[191] = 8'h00;
//  0x0c0: 6101         | subl %eax,%ecx
    mem[192] = 8'h61;
    mem[193] = 8'h01;
//  0x0c2: 2202         | cmovl %eax,%edx
    mem[194] = 8'h22;
    mem[195] = 8'h02;
//  0x0c4: 30f004000000 | irmovl $4,%eax
    mem[196] = 8'h30;
    mem[197] = 8'hf0;
    mem[198] = 8'h04;
    mem[199] = 8'h00;
    mem[200] = 8'h00;
    mem[201] = 8'h00;
//  0x0ca: 30f103000000 | irmovl $3,%ecx
    mem[202] = 8'h30;
    mem[203] = 8'hf1;
    mem[204] = 8'h03;
    mem[205] = 8'h00;
    mem[206] = 8'h00;
    mem[207] = 8'h00;
//  0x0d0: 6101         | subl %eax,%ecx
    mem[208] = 8'h61;
    mem[209] = 8'h01;
//  0x0d2: 2213         | cmovl %ecx,%ebx
    mem[210] = 8'h22;
    mem[211] = 8'h13;
//                      | # %eax: 0x00000004
//                      | # %ecx: 0xffffffff
//                      | # %ebx: 0xffffffff
//                      | 
//  0x0d4: 6001         | addl %eax,%ecx
    mem[212] = 8'h60;
    mem[213] = 8'h01;
//  0x0d6: 6031         | addl %ebx,%ecx
    mem[214] = 8'h60;
    mem[215] = 8'h31;
//  0x0d8: 6016         | addl %ecx, %esi
    mem[216] = 8'h60;
    mem[217] = 8'h16;
//                      | # %esi: 0x00000015
//                      | 
//  0x0da: 30f004000000 | irmovl $4,%eax
    mem[218] = 8'h30;
    mem[219] = 8'hf0;
    mem[220] = 8'h04;
    mem[221] = 8'h00;
    mem[222] = 8'h00;
    mem[223] = 8'h00;
//  0x0e0: 30f105000000 | irmovl $5,%ecx
    mem[224] = 8'h30;
    mem[225] = 8'hf1;
    mem[226] = 8'h05;
    mem[227] = 8'h00;
    mem[228] = 8'h00;
    mem[229] = 8'h00;
//  0x0e6: 6101         | subl %eax,%ecx
    mem[230] = 8'h61;
    mem[231] = 8'h01;
//  0x0e8: 2112         | cmovle %ecx,%edx
    mem[232] = 8'h21;
    mem[233] = 8'h12;
//  0x0ea: 30f004000000 | irmovl $4,%eax
    mem[234] = 8'h30;
    mem[235] = 8'hf0;
    mem[236] = 8'h04;
    mem[237] = 8'h00;
    mem[238] = 8'h00;
    mem[239] = 8'h00;
//  0x0f0: 30f104000000 | irmovl $4,%ecx
    mem[240] = 8'h30;
    mem[241] = 8'hf1;
    mem[242] = 8'h04;
    mem[243] = 8'h00;
    mem[244] = 8'h00;
    mem[245] = 8'h00;
//  0x0f6: 6101         | subl %eax,%ecx
    mem[246] = 8'h61;
    mem[247] = 8'h01;
//  0x0f8: 2102         | cmovle %eax,%edx
    mem[248] = 8'h21;
    mem[249] = 8'h02;
//  0x0fa: 30f004000000 | irmovl $4,%eax
    mem[250] = 8'h30;
    mem[251] = 8'hf0;
    mem[252] = 8'h04;
    mem[253] = 8'h00;
    mem[254] = 8'h00;
    mem[255] = 8'h00;
//  0x100: 30f103000000 | irmovl $3,%ecx
    mem[256] = 8'h30;
    mem[257] = 8'hf1;
    mem[258] = 8'h03;
    mem[259] = 8'h00;
    mem[260] = 8'h00;
    mem[261] = 8'h00;
//  0x106: 6101         | subl %eax,%ecx
    mem[262] = 8'h61;
    mem[263] = 8'h01;
//  0x108: 2113         | cmovle %ecx,%ebx
    mem[264] = 8'h21;
    mem[265] = 8'h13;
//                      | # %eax: 0x00000004
//                      | # %ecx: 0xffffffff
//                      | # %edx: 0x00000004
//                      | # %ebx: 0xffffffff
//                      | 
//  0x10a: 6002         | addl %eax,%edx
    mem[266] = 8'h60;
    mem[267] = 8'h02;
//  0x10c: 6021         | addl %edx,%ecx
    mem[268] = 8'h60;
    mem[269] = 8'h21;
//  0x10e: 6031         | addl %ebx,%ecx
    mem[270] = 8'h60;
    mem[271] = 8'h31;
//  0x110: 6016         | addl %ecx, %esi
    mem[272] = 8'h60;
    mem[273] = 8'h16;
//                      | # %esi: 0x0000001b
//                      | 
//  0x112: 30f004000000 | irmovl $4,%eax
    mem[274] = 8'h30;
    mem[275] = 8'hf0;
    mem[276] = 8'h04;
    mem[277] = 8'h00;
    mem[278] = 8'h00;
    mem[279] = 8'h00;
//  0x118: 30f105000000 | irmovl $5,%ecx
    mem[280] = 8'h30;
    mem[281] = 8'hf1;
    mem[282] = 8'h05;
    mem[283] = 8'h00;
    mem[284] = 8'h00;
    mem[285] = 8'h00;
//  0x11e: 6101         | subl %eax,%ecx
    mem[286] = 8'h61;
    mem[287] = 8'h01;
//  0x120: 2412         | cmovne %ecx,%edx
    mem[288] = 8'h24;
    mem[289] = 8'h12;
//  0x122: 30f004000000 | irmovl $4,%eax
    mem[290] = 8'h30;
    mem[291] = 8'hf0;
    mem[292] = 8'h04;
    mem[293] = 8'h00;
    mem[294] = 8'h00;
    mem[295] = 8'h00;
//  0x128: 30f104000000 | irmovl $4,%ecx
    mem[296] = 8'h30;
    mem[297] = 8'hf1;
    mem[298] = 8'h04;
    mem[299] = 8'h00;
    mem[300] = 8'h00;
    mem[301] = 8'h00;
//  0x12e: 6101         | subl %eax,%ecx
    mem[302] = 8'h61;
    mem[303] = 8'h01;
//  0x130: 2402         | cmovne %eax,%edx
    mem[304] = 8'h24;
    mem[305] = 8'h02;
//  0x132: 30f004000000 | irmovl $4,%eax
    mem[306] = 8'h30;
    mem[307] = 8'hf0;
    mem[308] = 8'h04;
    mem[309] = 8'h00;
    mem[310] = 8'h00;
    mem[311] = 8'h00;
//  0x138: 30f103000000 | irmovl $3,%ecx
    mem[312] = 8'h30;
    mem[313] = 8'hf1;
    mem[314] = 8'h03;
    mem[315] = 8'h00;
    mem[316] = 8'h00;
    mem[317] = 8'h00;
//  0x13e: 6101         | subl %eax,%ecx
    mem[318] = 8'h61;
    mem[319] = 8'h01;
//  0x140: 2413         | cmovne %ecx,%ebx
    mem[320] = 8'h24;
    mem[321] = 8'h13;
//                      | # %eax: 0x00000004
//                      | # %ecx: 0xffffffff
//                      | # %edx: 0x00000001
//                      | # %ebx: 0xffffffff
//                      | 
//  0x142: 6002         | addl %eax,%edx
    mem[322] = 8'h60;
    mem[323] = 8'h02;
//  0x144: 6021         | addl %edx,%ecx
    mem[324] = 8'h60;
    mem[325] = 8'h21;
//  0x146: 6031         | addl %ebx,%ecx
    mem[326] = 8'h60;
    mem[327] = 8'h31;
//  0x148: 6016         | addl %ecx, %esi
    mem[328] = 8'h60;
    mem[329] = 8'h16;
//                      | # %esi: 0x0000001e
//                      | 
//  0x14a: 30f003000000 | Start0:	 irmovl $3,%eax
    mem[330] = 8'h30;
    mem[331] = 8'hf0;
    mem[332] = 8'h03;
    mem[333] = 8'h00;
    mem[334] = 8'h00;
    mem[335] = 8'h00;
//  0x150: 30f103000000 | 	 irmovl $3,%ecx
    mem[336] = 8'h30;
    mem[337] = 8'hf1;
    mem[338] = 8'h03;
    mem[339] = 8'h00;
    mem[340] = 8'h00;
    mem[341] = 8'h00;
//  0x156: 6110         | 	 subl %ecx,%eax
    mem[342] = 8'h61;
    mem[343] = 8'h10;
//  0x158: 7370010000   | 	 je Jmp10
    mem[344] = 8'h73;
    mem[345] = 8'h70;
    mem[346] = 8'h01;
    mem[347] = 8'h00;
    mem[348] = 8'h00;
//  0x15d: 30f003000000 | 	 irmovl $3,%eax
    mem[349] = 8'h30;
    mem[350] = 8'hf0;
    mem[351] = 8'h03;
    mem[352] = 8'h00;
    mem[353] = 8'h00;
    mem[354] = 8'h00;
//  0x163: 30f102000000 | 	 irmovl $2,%ecx
    mem[355] = 8'h30;
    mem[356] = 8'hf1;
    mem[357] = 8'h02;
    mem[358] = 8'h00;
    mem[359] = 8'h00;
    mem[360] = 8'h00;
//  0x169: 6101         | 	 subl %eax,%ecx
    mem[361] = 8'h61;
    mem[362] = 8'h01;
//  0x16b: 737b010000   | 	 je Jmp20
    mem[363] = 8'h73;
    mem[364] = 8'h7b;
    mem[365] = 8'h01;
    mem[366] = 8'h00;
    mem[367] = 8'h00;
//                      | 
//  0x170: 30f205000000 | Jmp10:	 irmovl $5,%edx
    mem[368] = 8'h30;
    mem[369] = 8'hf2;
    mem[370] = 8'h05;
    mem[371] = 8'h00;
    mem[372] = 8'h00;
    mem[373] = 8'h00;
//  0x176: 707b010000   | 	 jmp Jmp20
    mem[374] = 8'h70;
    mem[375] = 8'h7b;
    mem[376] = 8'h01;
    mem[377] = 8'h00;
    mem[378] = 8'h00;
//                      | 
//  0x17b: 30f30a000000 | Jmp20:	 irmovl $10,%ebx
    mem[379] = 8'h30;
    mem[380] = 8'hf3;
    mem[381] = 8'h0a;
    mem[382] = 8'h00;
    mem[383] = 8'h00;
    mem[384] = 8'h00;
//                      | # %ecx:	0x00000003
//                      | # %edx:	0x00000005
//                      | # %ebx:	0x0000000a
//                      | 
//  0x181: 6021         | addl %edx,%ecx
    mem[385] = 8'h60;
    mem[386] = 8'h21;
//  0x183: 6031         | addl %ebx,%ecx
    mem[387] = 8'h60;
    mem[388] = 8'h31;
//  0x185: 6016         | addl %ecx, %esi
    mem[389] = 8'h60;
    mem[390] = 8'h16;
//                      | # %esi: 0x00000030
//                      | 
//  0x187: 30f003000000 | Start1:	 irmovl $3,%eax
    mem[391] = 8'h30;
    mem[392] = 8'hf0;
    mem[393] = 8'h03;
    mem[394] = 8'h00;
    mem[395] = 8'h00;
    mem[396] = 8'h00;
//  0x18d: 30f102000000 | 	 irmovl $2,%ecx
    mem[397] = 8'h30;
    mem[398] = 8'hf1;
    mem[399] = 8'h02;
    mem[400] = 8'h00;
    mem[401] = 8'h00;
    mem[402] = 8'h00;
//  0x193: 6110         | 	 subl %ecx,%eax
    mem[403] = 8'h61;
    mem[404] = 8'h10;
//  0x195: 73c0010000   | 	 je Jmp11
    mem[405] = 8'h73;
    mem[406] = 8'hc0;
    mem[407] = 8'h01;
    mem[408] = 8'h00;
    mem[409] = 8'h00;
//  0x19a: 30f003000000 | 	 irmovl $3,%eax
    mem[410] = 8'h30;
    mem[411] = 8'hf0;
    mem[412] = 8'h03;
    mem[413] = 8'h00;
    mem[414] = 8'h00;
    mem[415] = 8'h00;
//  0x1a0: 30f103000000 | 	 irmovl $3,%ecx
    mem[416] = 8'h30;
    mem[417] = 8'hf1;
    mem[418] = 8'h03;
    mem[419] = 8'h00;
    mem[420] = 8'h00;
    mem[421] = 8'h00;
//  0x1a6: 6101         | 	 subl %eax,%ecx
    mem[422] = 8'h61;
    mem[423] = 8'h01;
//  0x1a8: 73cb010000   | 	 je Jmp21
    mem[424] = 8'h73;
    mem[425] = 8'hcb;
    mem[426] = 8'h01;
    mem[427] = 8'h00;
    mem[428] = 8'h00;
//  0x1ad: 30f003000000 | 	 irmovl $3,%eax
    mem[429] = 8'h30;
    mem[430] = 8'hf0;
    mem[431] = 8'h03;
    mem[432] = 8'h00;
    mem[433] = 8'h00;
    mem[434] = 8'h00;
//  0x1b3: 30f104000000 | 	 irmovl $4,%ecx
    mem[435] = 8'h30;
    mem[436] = 8'hf1;
    mem[437] = 8'h04;
    mem[438] = 8'h00;
    mem[439] = 8'h00;
    mem[440] = 8'h00;
//  0x1b9: 6110         | 	 subl %ecx,%eax
    mem[441] = 8'h61;
    mem[442] = 8'h10;
//  0x1bb: 73c0010000   | 	 je Jmp11
    mem[443] = 8'h73;
    mem[444] = 8'hc0;
    mem[445] = 8'h01;
    mem[446] = 8'h00;
    mem[447] = 8'h00;
//                      | 
//  0x1c0: 30f205000000 | Jmp11:	 irmovl $5,%edx
    mem[448] = 8'h30;
    mem[449] = 8'hf2;
    mem[450] = 8'h05;
    mem[451] = 8'h00;
    mem[452] = 8'h00;
    mem[453] = 8'h00;
//  0x1c6: 70cb010000   | 	 jmp Jmp21
    mem[454] = 8'h70;
    mem[455] = 8'hcb;
    mem[456] = 8'h01;
    mem[457] = 8'h00;
    mem[458] = 8'h00;
//                      | 
//  0x1cb: 30f30a000000 | Jmp21:	 irmovl $10,%ebx
    mem[459] = 8'h30;
    mem[460] = 8'hf3;
    mem[461] = 8'h0a;
    mem[462] = 8'h00;
    mem[463] = 8'h00;
    mem[464] = 8'h00;
//                      | # %eax:	0x00000003
//                      | # %ebx:	0x0000000a
//                      | 
//  0x1d1: 6030         | addl %ebx,%eax
    mem[465] = 8'h60;
    mem[466] = 8'h30;
//  0x1d3: 6006         | addl %eax, %esi
    mem[467] = 8'h60;
    mem[468] = 8'h06;
//                      | # %esi: 0x0000003d
//                      | 
//  0x1d5: 30f004000000 | Start2:	  irmovl $4,%eax
    mem[469] = 8'h30;
    mem[470] = 8'hf0;
    mem[471] = 8'h04;
    mem[472] = 8'h00;
    mem[473] = 8'h00;
    mem[474] = 8'h00;
//  0x1db: 30f103000000 | 	  irmovl $3,%ecx
    mem[475] = 8'h30;
    mem[476] = 8'hf1;
    mem[477] = 8'h03;
    mem[478] = 8'h00;
    mem[479] = 8'h00;
    mem[480] = 8'h00;
//  0x1e1: 6101         | 	  subl %eax,%ecx
    mem[481] = 8'h61;
    mem[482] = 8'h01;
//  0x1e3: 7514020000   | 	  jge Jmp22
    mem[483] = 8'h75;
    mem[484] = 8'h14;
    mem[485] = 8'h02;
    mem[486] = 8'h00;
    mem[487] = 8'h00;
//  0x1e8: 30f004000000 | 	  irmovl $4,%eax
    mem[488] = 8'h30;
    mem[489] = 8'hf0;
    mem[490] = 8'h04;
    mem[491] = 8'h00;
    mem[492] = 8'h00;
    mem[493] = 8'h00;
//  0x1ee: 30f104000000 | 	  irmovl $4,%ecx
    mem[494] = 8'h30;
    mem[495] = 8'hf1;
    mem[496] = 8'h04;
    mem[497] = 8'h00;
    mem[498] = 8'h00;
    mem[499] = 8'h00;
//  0x1f4: 6101         | 	  subl %eax,%ecx
    mem[500] = 8'h61;
    mem[501] = 8'h01;
//  0x1f6: 75fb010000   | 	  jge Jmp12
    mem[502] = 8'h75;
    mem[503] = 8'hfb;
    mem[504] = 8'h01;
    mem[505] = 8'h00;
    mem[506] = 8'h00;
//                      | 
//  0x1fb: 30f201000000 | Jmp12:	  irmovl $1,%edx
    mem[507] = 8'h30;
    mem[508] = 8'hf2;
    mem[509] = 8'h01;
    mem[510] = 8'h00;
    mem[511] = 8'h00;
    mem[512] = 8'h00;
//  0x201: 30f004000000 | 	  irmovl $4,%eax
    mem[513] = 8'h30;
    mem[514] = 8'hf0;
    mem[515] = 8'h04;
    mem[516] = 8'h00;
    mem[517] = 8'h00;
    mem[518] = 8'h00;
//  0x207: 30f105000000 | 	  irmovl $5,%ecx
    mem[519] = 8'h30;
    mem[520] = 8'hf1;
    mem[521] = 8'h05;
    mem[522] = 8'h00;
    mem[523] = 8'h00;
    mem[524] = 8'h00;
//  0x20d: 6101         | 	  subl %eax,%ecx
    mem[525] = 8'h61;
    mem[526] = 8'h01;
//  0x20f: 7514020000   | 	  jge Jmp22
    mem[527] = 8'h75;
    mem[528] = 8'h14;
    mem[529] = 8'h02;
    mem[530] = 8'h00;
    mem[531] = 8'h00;
//                      | 
//  0x214: 30f302000000 | Jmp22:	  irmovl $2,%ebx
    mem[532] = 8'h30;
    mem[533] = 8'hf3;
    mem[534] = 8'h02;
    mem[535] = 8'h00;
    mem[536] = 8'h00;
    mem[537] = 8'h00;
//                      | # %eax:	0x00000004
//                      | # %ecx:	0x00000001
//                      | # %edx:	0x00000001
//                      | # %ebx:	0x00000002
//                      | 
//  0x21a: 6002         | addl %eax,%edx
    mem[538] = 8'h60;
    mem[539] = 8'h02;
//  0x21c: 6021         | addl %edx,%ecx
    mem[540] = 8'h60;
    mem[541] = 8'h21;
//  0x21e: 6031         | addl %ebx,%ecx
    mem[542] = 8'h60;
    mem[543] = 8'h31;
//  0x220: 6016         | addl %ecx, %esi
    mem[544] = 8'h60;
    mem[545] = 8'h16;
//                      | # %esi: 0x00000045
//                      | 
//  0x222: 30f003000000 | Start3:	 irmovl $3,%eax
    mem[546] = 8'h30;
    mem[547] = 8'hf0;
    mem[548] = 8'h03;
    mem[549] = 8'h00;
    mem[550] = 8'h00;
    mem[551] = 8'h00;
//  0x228: 30f102000000 | 	 irmovl $2,%ecx
    mem[552] = 8'h30;
    mem[553] = 8'hf1;
    mem[554] = 8'h02;
    mem[555] = 8'h00;
    mem[556] = 8'h00;
    mem[557] = 8'h00;
//  0x22e: 6110         | 	 subl %ecx,%eax
    mem[558] = 8'h61;
    mem[559] = 8'h10;
//  0x230: 725b020000   | 	 jl Jmp13
    mem[560] = 8'h72;
    mem[561] = 8'h5b;
    mem[562] = 8'h02;
    mem[563] = 8'h00;
    mem[564] = 8'h00;
//  0x235: 30f003000000 | 	 irmovl $3,%eax
    mem[565] = 8'h30;
    mem[566] = 8'hf0;
    mem[567] = 8'h03;
    mem[568] = 8'h00;
    mem[569] = 8'h00;
    mem[570] = 8'h00;
//  0x23b: 30f103000000 | 	 irmovl $3,%ecx
    mem[571] = 8'h30;
    mem[572] = 8'hf1;
    mem[573] = 8'h03;
    mem[574] = 8'h00;
    mem[575] = 8'h00;
    mem[576] = 8'h00;
//  0x241: 6101         | 	 subl %eax,%ecx
    mem[577] = 8'h61;
    mem[578] = 8'h01;
//  0x243: 725b020000   | 	 jl Jmp13
    mem[579] = 8'h72;
    mem[580] = 8'h5b;
    mem[581] = 8'h02;
    mem[582] = 8'h00;
    mem[583] = 8'h00;
//  0x248: 30f003000000 | 	 irmovl $3,%eax
    mem[584] = 8'h30;
    mem[585] = 8'hf0;
    mem[586] = 8'h03;
    mem[587] = 8'h00;
    mem[588] = 8'h00;
    mem[589] = 8'h00;
//  0x24e: 30f104000000 | 	 irmovl $4,%ecx
    mem[590] = 8'h30;
    mem[591] = 8'hf1;
    mem[592] = 8'h04;
    mem[593] = 8'h00;
    mem[594] = 8'h00;
    mem[595] = 8'h00;
//  0x254: 6110         | 	 subl %ecx,%eax
    mem[596] = 8'h61;
    mem[597] = 8'h10;
//  0x256: 7266020000   | 	 jl Jmp23
    mem[598] = 8'h72;
    mem[599] = 8'h66;
    mem[600] = 8'h02;
    mem[601] = 8'h00;
    mem[602] = 8'h00;
//                      | 
//  0x25b: 30f205000000 | Jmp13:	 irmovl $5,%edx
    mem[603] = 8'h30;
    mem[604] = 8'hf2;
    mem[605] = 8'h05;
    mem[606] = 8'h00;
    mem[607] = 8'h00;
    mem[608] = 8'h00;
//  0x261: 7066020000   | 	 jmp Jmp23
    mem[609] = 8'h70;
    mem[610] = 8'h66;
    mem[611] = 8'h02;
    mem[612] = 8'h00;
    mem[613] = 8'h00;
//                      | 
//  0x266: 30f30a000000 | Jmp23:	 irmovl $10,%ebx
    mem[614] = 8'h30;
    mem[615] = 8'hf3;
    mem[616] = 8'h0a;
    mem[617] = 8'h00;
    mem[618] = 8'h00;
    mem[619] = 8'h00;
//                      | # %eax:	0xffffffff
//                      | # %ecx: 0x00000004
//                      | # %ebx:	0x0000000a
//                      | 
//  0x26c: 6001         | addl %eax,%ecx
    mem[620] = 8'h60;
    mem[621] = 8'h01;
//  0x26e: 6031         | addl %ebx,%ecx
    mem[622] = 8'h60;
    mem[623] = 8'h31;
//  0x270: 6016         | addl %ecx, %esi
    mem[624] = 8'h60;
    mem[625] = 8'h16;
//                      | # %esi: 0x00000052
//                      | 
//  0x272: 30f004000000 | Start4:	  irmovl $4,%eax
    mem[626] = 8'h30;
    mem[627] = 8'hf0;
    mem[628] = 8'h04;
    mem[629] = 8'h00;
    mem[630] = 8'h00;
    mem[631] = 8'h00;
//  0x278: 30f103000000 | 	  irmovl $3,%ecx
    mem[632] = 8'h30;
    mem[633] = 8'hf1;
    mem[634] = 8'h03;
    mem[635] = 8'h00;
    mem[636] = 8'h00;
    mem[637] = 8'h00;
//  0x27e: 6110         | 	  subl %ecx,%eax
    mem[638] = 8'h61;
    mem[639] = 8'h10;
//  0x280: 7198020000   | 	  jle Jmp14
    mem[640] = 8'h71;
    mem[641] = 8'h98;
    mem[642] = 8'h02;
    mem[643] = 8'h00;
    mem[644] = 8'h00;
//  0x285: 30f004000000 | 	  irmovl $4,%eax
    mem[645] = 8'h30;
    mem[646] = 8'hf0;
    mem[647] = 8'h04;
    mem[648] = 8'h00;
    mem[649] = 8'h00;
    mem[650] = 8'h00;
//  0x28b: 30f103000000 | 	  irmovl $3,%ecx
    mem[651] = 8'h30;
    mem[652] = 8'hf1;
    mem[653] = 8'h03;
    mem[654] = 8'h00;
    mem[655] = 8'h00;
    mem[656] = 8'h00;
//  0x291: 6101         | 	  subl %eax,%ecx
    mem[657] = 8'h61;
    mem[658] = 8'h01;
//  0x293: 719e020000   | 	  jle Jmp24
    mem[659] = 8'h71;
    mem[660] = 8'h9e;
    mem[661] = 8'h02;
    mem[662] = 8'h00;
    mem[663] = 8'h00;
//                      | 
//  0x298: 30f206000000 | Jmp14:	  irmovl $6,%edx
    mem[664] = 8'h30;
    mem[665] = 8'hf2;
    mem[666] = 8'h06;
    mem[667] = 8'h00;
    mem[668] = 8'h00;
    mem[669] = 8'h00;
//                      | 
//  0x29e: 30f207000000 | Jmp24:	  irmovl $7,%edx
    mem[670] = 8'h30;
    mem[671] = 8'hf2;
    mem[672] = 8'h07;
    mem[673] = 8'h00;
    mem[674] = 8'h00;
    mem[675] = 8'h00;
//  0x2a4: 30f004000000 | 	  irmovl $4,%eax
    mem[676] = 8'h30;
    mem[677] = 8'hf0;
    mem[678] = 8'h04;
    mem[679] = 8'h00;
    mem[680] = 8'h00;
    mem[681] = 8'h00;
//  0x2aa: 30f104000000 | 	  irmovl $4,%ecx
    mem[682] = 8'h30;
    mem[683] = 8'hf1;
    mem[684] = 8'h04;
    mem[685] = 8'h00;
    mem[686] = 8'h00;
    mem[687] = 8'h00;
//  0x2b0: 6101         | 	  subl %eax,%ecx
    mem[688] = 8'h61;
    mem[689] = 8'h01;
//  0x2b2: 71bd020000   | 	  jle Jmp34
    mem[690] = 8'h71;
    mem[691] = 8'hbd;
    mem[692] = 8'h02;
    mem[693] = 8'h00;
    mem[694] = 8'h00;
//  0x2b7: 30f305000000 | 	  irmovl $5,%ebx
    mem[695] = 8'h30;
    mem[696] = 8'hf3;
    mem[697] = 8'h05;
    mem[698] = 8'h00;
    mem[699] = 8'h00;
    mem[700] = 8'h00;
//                      | 
//  0x2bd: 30f301000000 | Jmp34:	  irmovl $1,%ebx
    mem[701] = 8'h30;
    mem[702] = 8'hf3;
    mem[703] = 8'h01;
    mem[704] = 8'h00;
    mem[705] = 8'h00;
    mem[706] = 8'h00;
//                      | # %eax:	0x00000004
//                      | # %edx:	0x00000007
//                      | # %ebx:	0x00000001
//                      | 
//  0x2c3: 6002         | addl %eax,%edx
    mem[707] = 8'h60;
    mem[708] = 8'h02;
//  0x2c5: 6032         | addl %ebx,%edx
    mem[709] = 8'h60;
    mem[710] = 8'h32;
//  0x2c7: 6026         | addl %edx, %esi
    mem[711] = 8'h60;
    mem[712] = 8'h26;
//                      | # %esi: 0x0000005e
//                      | 
//  0x2c9: 30f004000000 | Start5:	  irmovl $4,%eax
    mem[713] = 8'h30;
    mem[714] = 8'hf0;
    mem[715] = 8'h04;
    mem[716] = 8'h00;
    mem[717] = 8'h00;
    mem[718] = 8'h00;
//  0x2cf: 70da020000   | 	  jmp JmpPnt
    mem[719] = 8'h70;
    mem[720] = 8'hda;
    mem[721] = 8'h02;
    mem[722] = 8'h00;
    mem[723] = 8'h00;
//  0x2d4: 30f102000000 | 	  irmovl $2,%ecx
    mem[724] = 8'h30;
    mem[725] = 8'hf1;
    mem[726] = 8'h02;
    mem[727] = 8'h00;
    mem[728] = 8'h00;
    mem[729] = 8'h00;
//                      | 
//  0x2da: 30f103000000 | JmpPnt:	  irmovl $3,%ecx
    mem[730] = 8'h30;
    mem[731] = 8'hf1;
    mem[732] = 8'h03;
    mem[733] = 8'h00;
    mem[734] = 8'h00;
    mem[735] = 8'h00;
//                      | # %eax:	0x00000004
//                      | # %ecx: 0x00000003
//                      | 
//  0x2e0: 6001         | addl %eax,%ecx
    mem[736] = 8'h60;
    mem[737] = 8'h01;
//  0x2e2: 6016         | addl %ecx, %esi
    mem[738] = 8'h60;
    mem[739] = 8'h16;
//                      | # %esi: 0x00000065
//                      | 
//  0x2e4: 00           | halt
    mem[740] = 8'h00;
