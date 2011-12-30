//                      | # Y86 mrmovl and rmmovl unit test program
//                      | 
//  0x000:              |     .pos 0
//  0x000: 30f006000000 |     irmovl $6,%eax
    mem[0] = 8'h30;
    mem[1] = 8'hf0;
    mem[2] = 8'h06;
    mem[3] = 8'h00;
    mem[4] = 8'h00;
    mem[5] = 8'h00;
//  0x006: 30f100010000 |     irmovl A,%ecx
    mem[6] = 8'h30;
    mem[7] = 8'hf1;
    mem[8] = 8'h00;
    mem[9] = 8'h01;
    mem[10] = 8'h00;
    mem[11] = 8'h00;
//  0x00c: 4001fdffffff |     rmmovl %eax,-3(%ecx)
    mem[12] = 8'h40;
    mem[13] = 8'h01;
    mem[14] = 8'hfd;
    mem[15] = 8'hff;
    mem[16] = 8'hff;
    mem[17] = 8'hff;
//  0x012: 5021fdffffff |     mrmovl -3(%ecx),%edx
    mem[18] = 8'h50;
    mem[19] = 8'h21;
    mem[20] = 8'hfd;
    mem[21] = 8'hff;
    mem[22] = 8'hff;
    mem[23] = 8'hff;
//  0x018: 402100000000 |     rmmovl %edx,(%ecx)
    mem[24] = 8'h40;
    mem[25] = 8'h21;
    mem[26] = 8'h00;
    mem[27] = 8'h00;
    mem[28] = 8'h00;
    mem[29] = 8'h00;
//  0x01e: 503100000000 |     mrmovl (%ecx),%ebx
    mem[30] = 8'h50;
    mem[31] = 8'h31;
    mem[32] = 8'h00;
    mem[33] = 8'h00;
    mem[34] = 8'h00;
    mem[35] = 8'h00;
//  0x024: 00           |     halt
    mem[36] = 8'h00;
//  0x100:              |     .pos 0x100
//  0x100:              | A:
