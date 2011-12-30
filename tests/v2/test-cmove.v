//                      | # Y86 cmove unit test program
//                      | # Final register values should be:
//                      | # %eax: 0x00000004
//                      | # %ecx: 0xffffffff
//                      | # %edx: 0x00000004
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
//  0x00e: 2312         | cmove %ecx,%edx
    mem[14] = 8'h23;
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
//  0x01e: 2302         | cmove %eax,%edx
    mem[30] = 8'h23;
    mem[31] = 8'h02;
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
//  0x02e: 2313         | cmove %ecx,%ebx
    mem[46] = 8'h23;
    mem[47] = 8'h13;
