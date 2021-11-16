pragma Ada_2012;
pragma Style_Checks (Off);
pragma Warnings ("U");

with Interfaces.C; use Interfaces.C;
with bits_stdint_uintn_h;
with bits_stdint_intn_h;

package elf_h is

   EI_NIDENT : constant := (16);  --  /usr/include/elf.h:61

   EI_MAG0 : constant := 0;  --  /usr/include/elf.h:103
   ELFMAG0 : aliased constant unsigned_char := 16#7f#;  --  /usr/include/elf.h:104

   EI_MAG1 : constant := 1;  --  /usr/include/elf.h:106
   ELFMAG1 : aliased constant unsigned_char := Character'Pos('E');  --  /usr/include/elf.h:107

   EI_MAG2 : constant := 2;  --  /usr/include/elf.h:109
   ELFMAG2 : aliased constant unsigned_char := Character'Pos('L');  --  /usr/include/elf.h:110

   EI_MAG3 : constant := 3;  --  /usr/include/elf.h:112
   ELFMAG3 : aliased constant unsigned_char := Character'Pos('F');  --  /usr/include/elf.h:113
   --  unsupported macro: ELFMAG "\177ELF"

   SELFMAG : constant := 4;  --  /usr/include/elf.h:117

   EI_CLASS : constant := 4;  --  /usr/include/elf.h:119
   ELFCLASSNONE : constant := 0;  --  /usr/include/elf.h:120
   ELFCLASS32 : constant := 1;  --  /usr/include/elf.h:121
   ELFCLASS64 : constant := 2;  --  /usr/include/elf.h:122
   ELFCLASSNUM : constant := 3;  --  /usr/include/elf.h:123

   EI_DATA : constant := 5;  --  /usr/include/elf.h:125
   ELFDATANONE : constant := 0;  --  /usr/include/elf.h:126
   ELFDATA2LSB : constant := 1;  --  /usr/include/elf.h:127
   ELFDATA2MSB : constant := 2;  --  /usr/include/elf.h:128
   ELFDATANUM : constant := 3;  --  /usr/include/elf.h:129

   EI_VERSION : constant := 6;  --  /usr/include/elf.h:131

   EI_OSABI : constant := 7;  --  /usr/include/elf.h:134
   ELFOSABI_NONE : constant := 0;  --  /usr/include/elf.h:135
   ELFOSABI_SYSV : constant := 0;  --  /usr/include/elf.h:136
   ELFOSABI_HPUX : constant := 1;  --  /usr/include/elf.h:137
   ELFOSABI_NETBSD : constant := 2;  --  /usr/include/elf.h:138
   ELFOSABI_GNU : constant := 3;  --  /usr/include/elf.h:139
   --  unsupported macro: ELFOSABI_LINUX ELFOSABI_GNU

   ELFOSABI_SOLARIS : constant := 6;  --  /usr/include/elf.h:141
   ELFOSABI_AIX : constant := 7;  --  /usr/include/elf.h:142
   ELFOSABI_IRIX : constant := 8;  --  /usr/include/elf.h:143
   ELFOSABI_FREEBSD : constant := 9;  --  /usr/include/elf.h:144
   ELFOSABI_TRU64 : constant := 10;  --  /usr/include/elf.h:145
   ELFOSABI_MODESTO : constant := 11;  --  /usr/include/elf.h:146
   ELFOSABI_OPENBSD : constant := 12;  --  /usr/include/elf.h:147
   ELFOSABI_ARM_AEABI : constant := 64;  --  /usr/include/elf.h:148
   ELFOSABI_ARM : constant := 97;  --  /usr/include/elf.h:149
   ELFOSABI_STANDALONE : constant := 255;  --  /usr/include/elf.h:150

   EI_ABIVERSION : constant := 8;  --  /usr/include/elf.h:152

   EI_PAD : constant := 9;  --  /usr/include/elf.h:154

   ET_NONE : constant := 0;  --  /usr/include/elf.h:158
   ET_REL : constant := 1;  --  /usr/include/elf.h:159
   ET_EXEC : constant := 2;  --  /usr/include/elf.h:160
   ET_DYN : constant := 3;  --  /usr/include/elf.h:161
   ET_CORE : constant := 4;  --  /usr/include/elf.h:162
   ET_NUM : constant := 5;  --  /usr/include/elf.h:163
   ET_LOOS : constant := 16#fe00#;  --  /usr/include/elf.h:164
   ET_HIOS : constant := 16#feff#;  --  /usr/include/elf.h:165
   ET_LOPROC : constant := 16#ff00#;  --  /usr/include/elf.h:166
   ET_HIPROC : constant := 16#ffff#;  --  /usr/include/elf.h:167

   EM_NONE : constant := 0;  --  /usr/include/elf.h:171
   EM_M32 : constant := 1;  --  /usr/include/elf.h:172
   EM_SPARC : constant := 2;  --  /usr/include/elf.h:173
   EM_386 : constant := 3;  --  /usr/include/elf.h:174
   EM_68K : constant := 4;  --  /usr/include/elf.h:175
   EM_88K : constant := 5;  --  /usr/include/elf.h:176
   EM_IAMCU : constant := 6;  --  /usr/include/elf.h:177
   EM_860 : constant := 7;  --  /usr/include/elf.h:178
   EM_MIPS : constant := 8;  --  /usr/include/elf.h:179
   EM_S370 : constant := 9;  --  /usr/include/elf.h:180
   EM_MIPS_RS3_LE : constant := 10;  --  /usr/include/elf.h:181

   EM_PARISC : constant := 15;  --  /usr/include/elf.h:183

   EM_VPP500 : constant := 17;  --  /usr/include/elf.h:185
   EM_SPARC32PLUS : constant := 18;  --  /usr/include/elf.h:186
   EM_960 : constant := 19;  --  /usr/include/elf.h:187
   EM_PPC : constant := 20;  --  /usr/include/elf.h:188
   EM_PPC64 : constant := 21;  --  /usr/include/elf.h:189
   EM_S390 : constant := 22;  --  /usr/include/elf.h:190
   EM_SPU : constant := 23;  --  /usr/include/elf.h:191

   EM_V800 : constant := 36;  --  /usr/include/elf.h:193
   EM_FR20 : constant := 37;  --  /usr/include/elf.h:194
   EM_RH32 : constant := 38;  --  /usr/include/elf.h:195
   EM_RCE : constant := 39;  --  /usr/include/elf.h:196
   EM_ARM : constant := 40;  --  /usr/include/elf.h:197
   EM_FAKE_ALPHA : constant := 41;  --  /usr/include/elf.h:198
   EM_SH : constant := 42;  --  /usr/include/elf.h:199
   EM_SPARCV9 : constant := 43;  --  /usr/include/elf.h:200
   EM_TRICORE : constant := 44;  --  /usr/include/elf.h:201
   EM_ARC : constant := 45;  --  /usr/include/elf.h:202
   EM_H8_300 : constant := 46;  --  /usr/include/elf.h:203
   EM_H8_300H : constant := 47;  --  /usr/include/elf.h:204
   EM_H8S : constant := 48;  --  /usr/include/elf.h:205
   EM_H8_500 : constant := 49;  --  /usr/include/elf.h:206
   EM_IA_64 : constant := 50;  --  /usr/include/elf.h:207
   EM_MIPS_X : constant := 51;  --  /usr/include/elf.h:208
   EM_COLDFIRE : constant := 52;  --  /usr/include/elf.h:209
   EM_68HC12 : constant := 53;  --  /usr/include/elf.h:210
   EM_MMA : constant := 54;  --  /usr/include/elf.h:211
   EM_PCP : constant := 55;  --  /usr/include/elf.h:212
   EM_NCPU : constant := 56;  --  /usr/include/elf.h:213
   EM_NDR1 : constant := 57;  --  /usr/include/elf.h:214
   EM_STARCORE : constant := 58;  --  /usr/include/elf.h:215
   EM_ME16 : constant := 59;  --  /usr/include/elf.h:216
   EM_ST100 : constant := 60;  --  /usr/include/elf.h:217
   EM_TINYJ : constant := 61;  --  /usr/include/elf.h:218
   EM_X86_64 : constant := 62;  --  /usr/include/elf.h:219
   EM_PDSP : constant := 63;  --  /usr/include/elf.h:220
   EM_PDP10 : constant := 64;  --  /usr/include/elf.h:221
   EM_PDP11 : constant := 65;  --  /usr/include/elf.h:222
   EM_FX66 : constant := 66;  --  /usr/include/elf.h:223
   EM_ST9PLUS : constant := 67;  --  /usr/include/elf.h:224
   EM_ST7 : constant := 68;  --  /usr/include/elf.h:225
   EM_68HC16 : constant := 69;  --  /usr/include/elf.h:226
   EM_68HC11 : constant := 70;  --  /usr/include/elf.h:227
   EM_68HC08 : constant := 71;  --  /usr/include/elf.h:228
   EM_68HC05 : constant := 72;  --  /usr/include/elf.h:229
   EM_SVX : constant := 73;  --  /usr/include/elf.h:230
   EM_ST19 : constant := 74;  --  /usr/include/elf.h:231
   EM_VAX : constant := 75;  --  /usr/include/elf.h:232
   EM_CRIS : constant := 76;  --  /usr/include/elf.h:233
   EM_JAVELIN : constant := 77;  --  /usr/include/elf.h:234
   EM_FIREPATH : constant := 78;  --  /usr/include/elf.h:235
   EM_ZSP : constant := 79;  --  /usr/include/elf.h:236
   EM_MMIX : constant := 80;  --  /usr/include/elf.h:237
   EM_HUANY : constant := 81;  --  /usr/include/elf.h:238
   EM_PRISM : constant := 82;  --  /usr/include/elf.h:239
   EM_AVR : constant := 83;  --  /usr/include/elf.h:240
   EM_FR30 : constant := 84;  --  /usr/include/elf.h:241
   EM_D10V : constant := 85;  --  /usr/include/elf.h:242
   EM_D30V : constant := 86;  --  /usr/include/elf.h:243
   EM_V850 : constant := 87;  --  /usr/include/elf.h:244
   EM_M32R : constant := 88;  --  /usr/include/elf.h:245
   EM_MN10300 : constant := 89;  --  /usr/include/elf.h:246
   EM_MN10200 : constant := 90;  --  /usr/include/elf.h:247
   EM_PJ : constant := 91;  --  /usr/include/elf.h:248
   EM_OPENRISC : constant := 92;  --  /usr/include/elf.h:249
   EM_ARC_COMPACT : constant := 93;  --  /usr/include/elf.h:250
   EM_XTENSA : constant := 94;  --  /usr/include/elf.h:251
   EM_VIDEOCORE : constant := 95;  --  /usr/include/elf.h:252
   EM_TMM_GPP : constant := 96;  --  /usr/include/elf.h:253
   EM_NS32K : constant := 97;  --  /usr/include/elf.h:254
   EM_TPC : constant := 98;  --  /usr/include/elf.h:255
   EM_SNP1K : constant := 99;  --  /usr/include/elf.h:256
   EM_ST200 : constant := 100;  --  /usr/include/elf.h:257
   EM_IP2K : constant := 101;  --  /usr/include/elf.h:258
   EM_MAX : constant := 102;  --  /usr/include/elf.h:259
   EM_CR : constant := 103;  --  /usr/include/elf.h:260
   EM_F2MC16 : constant := 104;  --  /usr/include/elf.h:261
   EM_MSP430 : constant := 105;  --  /usr/include/elf.h:262
   EM_BLACKFIN : constant := 106;  --  /usr/include/elf.h:263
   EM_SE_C33 : constant := 107;  --  /usr/include/elf.h:264
   EM_SEP : constant := 108;  --  /usr/include/elf.h:265
   EM_ARCA : constant := 109;  --  /usr/include/elf.h:266
   EM_UNICORE : constant := 110;  --  /usr/include/elf.h:267
   EM_EXCESS : constant := 111;  --  /usr/include/elf.h:268
   EM_DXP : constant := 112;  --  /usr/include/elf.h:269
   EM_ALTERA_NIOS2 : constant := 113;  --  /usr/include/elf.h:270
   EM_CRX : constant := 114;  --  /usr/include/elf.h:271
   EM_XGATE : constant := 115;  --  /usr/include/elf.h:272
   EM_C166 : constant := 116;  --  /usr/include/elf.h:273
   EM_M16C : constant := 117;  --  /usr/include/elf.h:274
   EM_DSPIC30F : constant := 118;  --  /usr/include/elf.h:275
   EM_CE : constant := 119;  --  /usr/include/elf.h:276
   EM_M32C : constant := 120;  --  /usr/include/elf.h:277

   EM_TSK3000 : constant := 131;  --  /usr/include/elf.h:279
   EM_RS08 : constant := 132;  --  /usr/include/elf.h:280
   EM_SHARC : constant := 133;  --  /usr/include/elf.h:281
   EM_ECOG2 : constant := 134;  --  /usr/include/elf.h:282
   EM_SCORE7 : constant := 135;  --  /usr/include/elf.h:283
   EM_DSP24 : constant := 136;  --  /usr/include/elf.h:284
   EM_VIDEOCORE3 : constant := 137;  --  /usr/include/elf.h:285
   EM_LATTICEMICO32 : constant := 138;  --  /usr/include/elf.h:286
   EM_SE_C17 : constant := 139;  --  /usr/include/elf.h:287
   EM_TI_C6000 : constant := 140;  --  /usr/include/elf.h:288
   EM_TI_C2000 : constant := 141;  --  /usr/include/elf.h:289
   EM_TI_C5500 : constant := 142;  --  /usr/include/elf.h:290
   EM_TI_ARP32 : constant := 143;  --  /usr/include/elf.h:291
   EM_TI_PRU : constant := 144;  --  /usr/include/elf.h:292

   EM_MMDSP_PLUS : constant := 160;  --  /usr/include/elf.h:294
   EM_CYPRESS_M8C : constant := 161;  --  /usr/include/elf.h:295
   EM_R32C : constant := 162;  --  /usr/include/elf.h:296
   EM_TRIMEDIA : constant := 163;  --  /usr/include/elf.h:297
   EM_QDSP6 : constant := 164;  --  /usr/include/elf.h:298
   EM_8051 : constant := 165;  --  /usr/include/elf.h:299
   EM_STXP7X : constant := 166;  --  /usr/include/elf.h:300
   EM_NDS32 : constant := 167;  --  /usr/include/elf.h:301
   EM_ECOG1X : constant := 168;  --  /usr/include/elf.h:302
   EM_MAXQ30 : constant := 169;  --  /usr/include/elf.h:303
   EM_XIMO16 : constant := 170;  --  /usr/include/elf.h:304
   EM_MANIK : constant := 171;  --  /usr/include/elf.h:305
   EM_CRAYNV2 : constant := 172;  --  /usr/include/elf.h:306
   EM_RX : constant := 173;  --  /usr/include/elf.h:307
   EM_METAG : constant := 174;  --  /usr/include/elf.h:308
   EM_MCST_ELBRUS : constant := 175;  --  /usr/include/elf.h:309
   EM_ECOG16 : constant := 176;  --  /usr/include/elf.h:310
   EM_CR16 : constant := 177;  --  /usr/include/elf.h:311
   EM_ETPU : constant := 178;  --  /usr/include/elf.h:312
   EM_SLE9X : constant := 179;  --  /usr/include/elf.h:313
   EM_L10M : constant := 180;  --  /usr/include/elf.h:314
   EM_K10M : constant := 181;  --  /usr/include/elf.h:315

   EM_AARCH64 : constant := 183;  --  /usr/include/elf.h:317

   EM_AVR32 : constant := 185;  --  /usr/include/elf.h:319
   EM_STM8 : constant := 186;  --  /usr/include/elf.h:320
   EM_TILE64 : constant := 187;  --  /usr/include/elf.h:321
   EM_TILEPRO : constant := 188;  --  /usr/include/elf.h:322
   EM_MICROBLAZE : constant := 189;  --  /usr/include/elf.h:323
   EM_CUDA : constant := 190;  --  /usr/include/elf.h:324
   EM_TILEGX : constant := 191;  --  /usr/include/elf.h:325
   EM_CLOUDSHIELD : constant := 192;  --  /usr/include/elf.h:326
   EM_COREA_1ST : constant := 193;  --  /usr/include/elf.h:327
   EM_COREA_2ND : constant := 194;  --  /usr/include/elf.h:328
   EM_ARCV2 : constant := 195;  --  /usr/include/elf.h:329
   EM_OPEN8 : constant := 196;  --  /usr/include/elf.h:330
   EM_RL78 : constant := 197;  --  /usr/include/elf.h:331
   EM_VIDEOCORE5 : constant := 198;  --  /usr/include/elf.h:332
   EM_78KOR : constant := 199;  --  /usr/include/elf.h:333
   EM_56800EX : constant := 200;  --  /usr/include/elf.h:334
   EM_BA1 : constant := 201;  --  /usr/include/elf.h:335
   EM_BA2 : constant := 202;  --  /usr/include/elf.h:336
   EM_XCORE : constant := 203;  --  /usr/include/elf.h:337
   EM_MCHP_PIC : constant := 204;  --  /usr/include/elf.h:338

   EM_KM32 : constant := 210;  --  /usr/include/elf.h:340
   EM_KMX32 : constant := 211;  --  /usr/include/elf.h:341
   EM_EMX16 : constant := 212;  --  /usr/include/elf.h:342
   EM_EMX8 : constant := 213;  --  /usr/include/elf.h:343
   EM_KVARC : constant := 214;  --  /usr/include/elf.h:344
   EM_CDP : constant := 215;  --  /usr/include/elf.h:345
   EM_COGE : constant := 216;  --  /usr/include/elf.h:346
   EM_COOL : constant := 217;  --  /usr/include/elf.h:347
   EM_NORC : constant := 218;  --  /usr/include/elf.h:348
   EM_CSR_KALIMBA : constant := 219;  --  /usr/include/elf.h:349
   EM_Z80 : constant := 220;  --  /usr/include/elf.h:350
   EM_VISIUM : constant := 221;  --  /usr/include/elf.h:351
   EM_FT32 : constant := 222;  --  /usr/include/elf.h:352
   EM_MOXIE : constant := 223;  --  /usr/include/elf.h:353
   EM_AMDGPU : constant := 224;  --  /usr/include/elf.h:354

   EM_RISCV : constant := 243;  --  /usr/include/elf.h:356

   EM_BPF : constant := 247;  --  /usr/include/elf.h:358
   EM_CSKY : constant := 252;  --  /usr/include/elf.h:359

   EM_NUM : constant := 253;  --  /usr/include/elf.h:361
   --  unsupported macro: EM_ARC_A5 EM_ARC_COMPACT

   EM_ALPHA : constant := 16#9026#;  --  /usr/include/elf.h:371

   EV_NONE : constant := 0;  --  /usr/include/elf.h:375
   EV_CURRENT : constant := 1;  --  /usr/include/elf.h:376
   EV_NUM : constant := 2;  --  /usr/include/elf.h:377

   SHN_UNDEF : constant := 0;  --  /usr/include/elf.h:411
   SHN_LORESERVE : constant := 16#ff00#;  --  /usr/include/elf.h:412
   SHN_LOPROC : constant := 16#ff00#;  --  /usr/include/elf.h:413
   SHN_BEFORE : constant := 16#ff00#;  --  /usr/include/elf.h:414

   SHN_AFTER : constant := 16#ff01#;  --  /usr/include/elf.h:416

   SHN_HIPROC : constant := 16#ff1f#;  --  /usr/include/elf.h:418
   SHN_LOOS : constant := 16#ff20#;  --  /usr/include/elf.h:419
   SHN_HIOS : constant := 16#ff3f#;  --  /usr/include/elf.h:420
   SHN_ABS : constant := 16#fff1#;  --  /usr/include/elf.h:421
   SHN_COMMON : constant := 16#fff2#;  --  /usr/include/elf.h:422
   SHN_XINDEX : constant := 16#ffff#;  --  /usr/include/elf.h:423
   SHN_HIRESERVE : constant := 16#ffff#;  --  /usr/include/elf.h:424

   SHT_NULL : constant := 0;  --  /usr/include/elf.h:428
   SHT_PROGBITS : constant := 1;  --  /usr/include/elf.h:429
   SHT_SYMTAB : constant := 2;  --  /usr/include/elf.h:430
   SHT_STRTAB : constant := 3;  --  /usr/include/elf.h:431
   SHT_RELA : constant := 4;  --  /usr/include/elf.h:432
   SHT_HASH : constant := 5;  --  /usr/include/elf.h:433
   SHT_DYNAMIC : constant := 6;  --  /usr/include/elf.h:434
   SHT_NOTE : constant := 7;  --  /usr/include/elf.h:435
   SHT_NOBITS : constant := 8;  --  /usr/include/elf.h:436
   SHT_REL : constant := 9;  --  /usr/include/elf.h:437
   SHT_SHLIB : constant := 10;  --  /usr/include/elf.h:438
   SHT_DYNSYM : constant := 11;  --  /usr/include/elf.h:439
   SHT_INIT_ARRAY : constant := 14;  --  /usr/include/elf.h:440
   SHT_FINI_ARRAY : constant := 15;  --  /usr/include/elf.h:441
   SHT_PREINIT_ARRAY : constant := 16;  --  /usr/include/elf.h:442
   SHT_GROUP : constant := 17;  --  /usr/include/elf.h:443
   SHT_SYMTAB_SHNDX : constant := 18;  --  /usr/include/elf.h:444
   SHT_NUM : constant := 19;  --  /usr/include/elf.h:445
   SHT_LOOS : constant := 16#60000000#;  --  /usr/include/elf.h:446
   SHT_GNU_ATTRIBUTES : constant := 16#6ffffff5#;  --  /usr/include/elf.h:447
   SHT_GNU_HASH : constant := 16#6ffffff6#;  --  /usr/include/elf.h:448
   SHT_GNU_LIBLIST : constant := 16#6ffffff7#;  --  /usr/include/elf.h:449
   SHT_CHECKSUM : constant := 16#6ffffff8#;  --  /usr/include/elf.h:450
   SHT_LOSUNW : constant := 16#6ffffffa#;  --  /usr/include/elf.h:451
   SHT_SUNW_move : constant := 16#6ffffffa#;  --  /usr/include/elf.h:452
   SHT_SUNW_COMDAT : constant := 16#6ffffffb#;  --  /usr/include/elf.h:453
   SHT_SUNW_syminfo : constant := 16#6ffffffc#;  --  /usr/include/elf.h:454
   SHT_GNU_verdef : constant := 16#6ffffffd#;  --  /usr/include/elf.h:455
   SHT_GNU_verneed : constant := 16#6ffffffe#;  --  /usr/include/elf.h:456
   SHT_GNU_versym : constant := 16#6fffffff#;  --  /usr/include/elf.h:457
   SHT_HISUNW : constant := 16#6fffffff#;  --  /usr/include/elf.h:458
   SHT_HIOS : constant := 16#6fffffff#;  --  /usr/include/elf.h:459
   SHT_LOPROC : constant := 16#70000000#;  --  /usr/include/elf.h:460
   SHT_HIPROC : constant := 16#7fffffff#;  --  /usr/include/elf.h:461
   SHT_LOUSER : constant := 16#80000000#;  --  /usr/include/elf.h:462
   SHT_HIUSER : constant := 16#8fffffff#;  --  /usr/include/elf.h:463

   SHF_WRITE : constant := (2 ** 0);  --  /usr/include/elf.h:467
   SHF_ALLOC : constant := (2 ** 1);  --  /usr/include/elf.h:468
   SHF_EXECINSTR : constant := (2 ** 2);  --  /usr/include/elf.h:469
   SHF_MERGE : constant := (2 ** 4);  --  /usr/include/elf.h:470
   SHF_STRINGS : constant := (2 ** 5);  --  /usr/include/elf.h:471
   SHF_INFO_LINK : constant := (2 ** 6);  --  /usr/include/elf.h:472
   SHF_LINK_ORDER : constant := (2 ** 7);  --  /usr/include/elf.h:473
   SHF_OS_NONCONFORMING : constant := (2 ** 8);  --  /usr/include/elf.h:474

   SHF_GROUP : constant := (2 ** 9);  --  /usr/include/elf.h:476
   SHF_TLS : constant := (2 ** 10);  --  /usr/include/elf.h:477
   SHF_COMPRESSED : constant := (2 ** 11);  --  /usr/include/elf.h:478
   SHF_MASKOS : constant := 16#0ff00000#;  --  /usr/include/elf.h:479
   SHF_MASKPROC : constant := 16#f0000000#;  --  /usr/include/elf.h:480
   SHF_GNU_RETAIN : constant := (2 ** 21);  --  /usr/include/elf.h:481
   SHF_ORDERED : constant := (2 ** 30);  --  /usr/include/elf.h:482

   SHF_EXCLUDE : constant := (2 ** 31);  --  /usr/include/elf.h:484

   ELFCOMPRESS_ZLIB : constant := 1;  --  /usr/include/elf.h:505
   ELFCOMPRESS_LOOS : constant := 16#60000000#;  --  /usr/include/elf.h:506
   ELFCOMPRESS_HIOS : constant := 16#6fffffff#;  --  /usr/include/elf.h:507
   ELFCOMPRESS_LOPROC : constant := 16#70000000#;  --  /usr/include/elf.h:508
   ELFCOMPRESS_HIPROC : constant := 16#7fffffff#;  --  /usr/include/elf.h:509

   GRP_COMDAT : constant := 16#1#;  --  /usr/include/elf.h:512

   SYMINFO_BT_SELF : constant := 16#ffff#;  --  /usr/include/elf.h:552
   SYMINFO_BT_PARENT : constant := 16#fffe#;  --  /usr/include/elf.h:553
   SYMINFO_BT_LOWRESERVE : constant := 16#ff00#;  --  /usr/include/elf.h:554

   SYMINFO_FLG_DIRECT : constant := 16#0001#;  --  /usr/include/elf.h:557
   SYMINFO_FLG_PASSTHRU : constant := 16#0002#;  --  /usr/include/elf.h:558
   SYMINFO_FLG_COPY : constant := 16#0004#;  --  /usr/include/elf.h:559
   SYMINFO_FLG_LAZYLOAD : constant := 16#0008#;  --  /usr/include/elf.h:560

   SYMINFO_NONE : constant := 0;  --  /usr/include/elf.h:563
   SYMINFO_CURRENT : constant := 1;  --  /usr/include/elf.h:564
   SYMINFO_NUM : constant := 2;  --  /usr/include/elf.h:565
   --  arg-macro: function ELF32_ST_BIND (val)
   --    return ((unsigned char) (val)) >> 4;
   --  arg-macro: function ELF32_ST_TYPE (val)
   --    return (val) and 16#f#;
   --  arg-macro: function ELF32_ST_INFO (bind, type)
   --    return ((bind) << 4) + ((type) and 16#f#);
   --  arg-macro: procedure ELF64_ST_BIND (val)
   --    ELF32_ST_BIND (val)
   --  arg-macro: procedure ELF64_ST_TYPE (val)
   --    ELF32_ST_TYPE (val)
   --  arg-macro: procedure ELF64_ST_INFO (bind, type)
   --    ELF32_ST_INFO ((bind), (type))

   STB_LOCAL : constant := 0;  --  /usr/include/elf.h:581
   STB_GLOBAL : constant := 1;  --  /usr/include/elf.h:582
   STB_WEAK : constant := 2;  --  /usr/include/elf.h:583
   STB_NUM : constant := 3;  --  /usr/include/elf.h:584
   STB_LOOS : constant := 10;  --  /usr/include/elf.h:585
   STB_GNU_UNIQUE : constant := 10;  --  /usr/include/elf.h:586
   STB_HIOS : constant := 12;  --  /usr/include/elf.h:587
   STB_LOPROC : constant := 13;  --  /usr/include/elf.h:588
   STB_HIPROC : constant := 15;  --  /usr/include/elf.h:589

   STT_NOTYPE : constant := 0;  --  /usr/include/elf.h:593
   STT_OBJECT : constant := 1;  --  /usr/include/elf.h:594
   STT_FUNC : constant := 2;  --  /usr/include/elf.h:595
   STT_SECTION : constant := 3;  --  /usr/include/elf.h:596
   STT_FILE : constant := 4;  --  /usr/include/elf.h:597
   STT_COMMON : constant := 5;  --  /usr/include/elf.h:598
   STT_TLS : constant := 6;  --  /usr/include/elf.h:599
   STT_NUM : constant := 7;  --  /usr/include/elf.h:600
   STT_LOOS : constant := 10;  --  /usr/include/elf.h:601
   STT_GNU_IFUNC : constant := 10;  --  /usr/include/elf.h:602
   STT_HIOS : constant := 12;  --  /usr/include/elf.h:603
   STT_LOPROC : constant := 13;  --  /usr/include/elf.h:604
   STT_HIPROC : constant := 15;  --  /usr/include/elf.h:605

   STN_UNDEF : constant := 0;  --  /usr/include/elf.h:612
   --  arg-macro: function ELF32_ST_VISIBILITY (o)
   --    return (o) and 16#03#;
   --  arg-macro: procedure ELF64_ST_VISIBILITY (o)
   --    ELF32_ST_VISIBILITY (o)

   STV_DEFAULT : constant := 0;  --  /usr/include/elf.h:623
   STV_INTERNAL : constant := 1;  --  /usr/include/elf.h:624
   STV_HIDDEN : constant := 2;  --  /usr/include/elf.h:625
   STV_PROTECTED : constant := 3;  --  /usr/include/elf.h:626
   --  arg-macro: function ELF32_R_SYM (val)
   --    return (val) >> 8;
   --  arg-macro: function ELF32_R_TYPE (val)
   --    return (val) and 16#ff#;
   --  arg-macro: function ELF32_R_INFO (sym, type)
   --    return ((sym) << 8) + ((type) and 16#ff#);
   --  arg-macro: function ELF64_R_SYM (i)
   --    return (i) >> 32;
   --  arg-macro: function ELF64_R_TYPE (i)
   --    return (i) and 16#ffffffff#;
   --  arg-macro: function ELF64_R_INFO (sym, type)
   --    return (((Elf64_Xword) (sym)) << 32) + (type);

   PN_XNUM : constant := 16#ffff#;  --  /usr/include/elf.h:704

   PT_NULL : constant := 0;  --  /usr/include/elf.h:708
   PT_LOAD : constant := 1;  --  /usr/include/elf.h:709
   PT_DYNAMIC : constant := 2;  --  /usr/include/elf.h:710
   PT_INTERP : constant := 3;  --  /usr/include/elf.h:711
   PT_NOTE : constant := 4;  --  /usr/include/elf.h:712
   PT_SHLIB : constant := 5;  --  /usr/include/elf.h:713
   PT_PHDR : constant := 6;  --  /usr/include/elf.h:714
   PT_TLS : constant := 7;  --  /usr/include/elf.h:715
   PT_NUM : constant := 8;  --  /usr/include/elf.h:716
   PT_LOOS : constant := 16#60000000#;  --  /usr/include/elf.h:717
   PT_GNU_EH_FRAME : constant := 16#6474e550#;  --  /usr/include/elf.h:718
   PT_GNU_STACK : constant := 16#6474e551#;  --  /usr/include/elf.h:719
   PT_GNU_RELRO : constant := 16#6474e552#;  --  /usr/include/elf.h:720
   PT_GNU_PROPERTY : constant := 16#6474e553#;  --  /usr/include/elf.h:721
   PT_LOSUNW : constant := 16#6ffffffa#;  --  /usr/include/elf.h:722
   PT_SUNWBSS : constant := 16#6ffffffa#;  --  /usr/include/elf.h:723
   PT_SUNWSTACK : constant := 16#6ffffffb#;  --  /usr/include/elf.h:724
   PT_HISUNW : constant := 16#6fffffff#;  --  /usr/include/elf.h:725
   PT_HIOS : constant := 16#6fffffff#;  --  /usr/include/elf.h:726
   PT_LOPROC : constant := 16#70000000#;  --  /usr/include/elf.h:727
   PT_HIPROC : constant := 16#7fffffff#;  --  /usr/include/elf.h:728

   PF_X : constant := (2 ** 0);  --  /usr/include/elf.h:732
   PF_W : constant := (2 ** 1);  --  /usr/include/elf.h:733
   PF_R : constant := (2 ** 2);  --  /usr/include/elf.h:734
   PF_MASKOS : constant := 16#0ff00000#;  --  /usr/include/elf.h:735
   PF_MASKPROC : constant := 16#f0000000#;  --  /usr/include/elf.h:736

   NT_PRSTATUS : constant := 1;  --  /usr/include/elf.h:740
   NT_PRFPREG : constant := 2;  --  /usr/include/elf.h:741

   NT_FPREGSET : constant := 2;  --  /usr/include/elf.h:743
   NT_PRPSINFO : constant := 3;  --  /usr/include/elf.h:744
   NT_PRXREG : constant := 4;  --  /usr/include/elf.h:745
   NT_TASKSTRUCT : constant := 4;  --  /usr/include/elf.h:746
   NT_PLATFORM : constant := 5;  --  /usr/include/elf.h:747
   NT_AUXV : constant := 6;  --  /usr/include/elf.h:748
   NT_GWINDOWS : constant := 7;  --  /usr/include/elf.h:749
   NT_ASRS : constant := 8;  --  /usr/include/elf.h:750
   NT_PSTATUS : constant := 10;  --  /usr/include/elf.h:751
   NT_PSINFO : constant := 13;  --  /usr/include/elf.h:752
   NT_PRCRED : constant := 14;  --  /usr/include/elf.h:753
   NT_UTSNAME : constant := 15;  --  /usr/include/elf.h:754
   NT_LWPSTATUS : constant := 16;  --  /usr/include/elf.h:755
   NT_LWPSINFO : constant := 17;  --  /usr/include/elf.h:756
   NT_PRFPXREG : constant := 20;  --  /usr/include/elf.h:757
   NT_SIGINFO : constant := 16#53494749#;  --  /usr/include/elf.h:758

   NT_FILE : constant := 16#46494c45#;  --  /usr/include/elf.h:760

   NT_PRXFPREG : constant := 16#46e62b7f#;  --  /usr/include/elf.h:762
   NT_PPC_VMX : constant := 16#100#;  --  /usr/include/elf.h:763
   NT_PPC_SPE : constant := 16#101#;  --  /usr/include/elf.h:764
   NT_PPC_VSX : constant := 16#102#;  --  /usr/include/elf.h:765
   NT_PPC_TAR : constant := 16#103#;  --  /usr/include/elf.h:766
   NT_PPC_PPR : constant := 16#104#;  --  /usr/include/elf.h:767
   NT_PPC_DSCR : constant := 16#105#;  --  /usr/include/elf.h:768
   NT_PPC_EBB : constant := 16#106#;  --  /usr/include/elf.h:769
   NT_PPC_PMU : constant := 16#107#;  --  /usr/include/elf.h:770
   NT_PPC_TM_CGPR : constant := 16#108#;  --  /usr/include/elf.h:771
   NT_PPC_TM_CFPR : constant := 16#109#;  --  /usr/include/elf.h:772
   NT_PPC_TM_CVMX : constant := 16#10a#;  --  /usr/include/elf.h:773
   NT_PPC_TM_CVSX : constant := 16#10b#;  --  /usr/include/elf.h:774
   NT_PPC_TM_SPR : constant := 16#10c#;  --  /usr/include/elf.h:775
   NT_PPC_TM_CTAR : constant := 16#10d#;  --  /usr/include/elf.h:776

   NT_PPC_TM_CPPR : constant := 16#10e#;  --  /usr/include/elf.h:778

   NT_PPC_TM_CDSCR : constant := 16#10f#;  --  /usr/include/elf.h:780

   NT_PPC_PKEY : constant := 16#110#;  --  /usr/include/elf.h:782

   NT_386_TLS : constant := 16#200#;  --  /usr/include/elf.h:784
   NT_386_IOPERM : constant := 16#201#;  --  /usr/include/elf.h:785
   NT_X86_XSTATE : constant := 16#202#;  --  /usr/include/elf.h:786
   NT_S390_HIGH_GPRS : constant := 16#300#;  --  /usr/include/elf.h:787
   NT_S390_TIMER : constant := 16#301#;  --  /usr/include/elf.h:788
   NT_S390_TODCMP : constant := 16#302#;  --  /usr/include/elf.h:789
   NT_S390_TODPREG : constant := 16#303#;  --  /usr/include/elf.h:790
   NT_S390_CTRS : constant := 16#304#;  --  /usr/include/elf.h:791
   NT_S390_PREFIX : constant := 16#305#;  --  /usr/include/elf.h:792
   NT_S390_LAST_BREAK : constant := 16#306#;  --  /usr/include/elf.h:793
   NT_S390_SYSTEM_CALL : constant := 16#307#;  --  /usr/include/elf.h:794
   NT_S390_TDB : constant := 16#308#;  --  /usr/include/elf.h:795
   NT_S390_VXRS_LOW : constant := 16#309#;  --  /usr/include/elf.h:796

   NT_S390_VXRS_HIGH : constant := 16#30a#;  --  /usr/include/elf.h:798
   NT_S390_GS_CB : constant := 16#30b#;  --  /usr/include/elf.h:799
   NT_S390_GS_BC : constant := 16#30c#;  --  /usr/include/elf.h:800

   NT_S390_RI_CB : constant := 16#30d#;  --  /usr/include/elf.h:802
   NT_ARM_VFP : constant := 16#400#;  --  /usr/include/elf.h:803
   NT_ARM_TLS : constant := 16#401#;  --  /usr/include/elf.h:804
   NT_ARM_HW_BREAK : constant := 16#402#;  --  /usr/include/elf.h:805
   NT_ARM_HW_WATCH : constant := 16#403#;  --  /usr/include/elf.h:806
   NT_ARM_SYSTEM_CALL : constant := 16#404#;  --  /usr/include/elf.h:807
   NT_ARM_SVE : constant := 16#405#;  --  /usr/include/elf.h:808

   NT_ARM_PAC_MASK : constant := 16#406#;  --  /usr/include/elf.h:810

   NT_ARM_PACA_KEYS : constant := 16#407#;  --  /usr/include/elf.h:812

   NT_ARM_PACG_KEYS : constant := 16#408#;  --  /usr/include/elf.h:814

   NT_VMCOREDD : constant := 16#700#;  --  /usr/include/elf.h:816
   NT_MIPS_DSP : constant := 16#800#;  --  /usr/include/elf.h:817
   NT_MIPS_FP_MODE : constant := 16#801#;  --  /usr/include/elf.h:818
   NT_MIPS_MSA : constant := 16#802#;  --  /usr/include/elf.h:819

   NT_VERSION : constant := 1;  --  /usr/include/elf.h:823

   DT_NULL : constant := 0;  --  /usr/include/elf.h:850
   DT_NEEDED : constant := 1;  --  /usr/include/elf.h:851
   DT_PLTRELSZ : constant := 2;  --  /usr/include/elf.h:852
   DT_PLTGOT : constant := 3;  --  /usr/include/elf.h:853
   DT_HASH : constant := 4;  --  /usr/include/elf.h:854
   DT_STRTAB : constant := 5;  --  /usr/include/elf.h:855
   DT_SYMTAB : constant := 6;  --  /usr/include/elf.h:856
   DT_RELA : constant := 7;  --  /usr/include/elf.h:857
   DT_RELASZ : constant := 8;  --  /usr/include/elf.h:858
   DT_RELAENT : constant := 9;  --  /usr/include/elf.h:859
   DT_STRSZ : constant := 10;  --  /usr/include/elf.h:860
   DT_SYMENT : constant := 11;  --  /usr/include/elf.h:861
   DT_INIT : constant := 12;  --  /usr/include/elf.h:862
   DT_FINI : constant := 13;  --  /usr/include/elf.h:863
   DT_SONAME : constant := 14;  --  /usr/include/elf.h:864
   DT_RPATH : constant := 15;  --  /usr/include/elf.h:865
   DT_SYMBOLIC : constant := 16;  --  /usr/include/elf.h:866
   DT_REL : constant := 17;  --  /usr/include/elf.h:867
   DT_RELSZ : constant := 18;  --  /usr/include/elf.h:868
   DT_RELENT : constant := 19;  --  /usr/include/elf.h:869
   DT_PLTREL : constant := 20;  --  /usr/include/elf.h:870
   DT_DEBUG : constant := 21;  --  /usr/include/elf.h:871
   DT_TEXTREL : constant := 22;  --  /usr/include/elf.h:872
   DT_JMPREL : constant := 23;  --  /usr/include/elf.h:873
   DT_BIND_NOW : constant := 24;  --  /usr/include/elf.h:874
   DT_INIT_ARRAY : constant := 25;  --  /usr/include/elf.h:875
   DT_FINI_ARRAY : constant := 26;  --  /usr/include/elf.h:876
   DT_INIT_ARRAYSZ : constant := 27;  --  /usr/include/elf.h:877
   DT_FINI_ARRAYSZ : constant := 28;  --  /usr/include/elf.h:878
   DT_RUNPATH : constant := 29;  --  /usr/include/elf.h:879
   DT_FLAGS : constant := 30;  --  /usr/include/elf.h:880
   DT_ENCODING : constant := 32;  --  /usr/include/elf.h:881
   DT_PREINIT_ARRAY : constant := 32;  --  /usr/include/elf.h:882
   DT_PREINIT_ARRAYSZ : constant := 33;  --  /usr/include/elf.h:883
   DT_SYMTAB_SHNDX : constant := 34;  --  /usr/include/elf.h:884
   DT_NUM : constant := 35;  --  /usr/include/elf.h:885
   DT_LOOS : constant := 16#6000000d#;  --  /usr/include/elf.h:886
   DT_HIOS : constant := 16#6ffff000#;  --  /usr/include/elf.h:887
   DT_LOPROC : constant := 16#70000000#;  --  /usr/include/elf.h:888
   DT_HIPROC : constant := 16#7fffffff#;  --  /usr/include/elf.h:889
   --  unsupported macro: DT_PROCNUM DT_MIPS_NUM

   DT_VALRNGLO : constant := 16#6ffffd00#;  --  /usr/include/elf.h:895
   DT_GNU_PRELINKED : constant := 16#6ffffdf5#;  --  /usr/include/elf.h:896
   DT_GNU_CONFLICTSZ : constant := 16#6ffffdf6#;  --  /usr/include/elf.h:897
   DT_GNU_LIBLISTSZ : constant := 16#6ffffdf7#;  --  /usr/include/elf.h:898
   DT_CHECKSUM : constant := 16#6ffffdf8#;  --  /usr/include/elf.h:899
   DT_PLTPADSZ : constant := 16#6ffffdf9#;  --  /usr/include/elf.h:900
   DT_MOVEENT : constant := 16#6ffffdfa#;  --  /usr/include/elf.h:901
   DT_MOVESZ : constant := 16#6ffffdfb#;  --  /usr/include/elf.h:902
   DT_FEATURE_1 : constant := 16#6ffffdfc#;  --  /usr/include/elf.h:903
   DT_POSFLAG_1 : constant := 16#6ffffdfd#;  --  /usr/include/elf.h:904

   DT_SYMINSZ : constant := 16#6ffffdfe#;  --  /usr/include/elf.h:906
   DT_SYMINENT : constant := 16#6ffffdff#;  --  /usr/include/elf.h:907
   DT_VALRNGHI : constant := 16#6ffffdff#;  --  /usr/include/elf.h:908
   --  arg-macro: function DT_VALTAGIDX (tag)
   --    return DT_VALRNGHI - (tag);

   DT_VALNUM : constant := 12;  --  /usr/include/elf.h:910

   DT_ADDRRNGLO : constant := 16#6ffffe00#;  --  /usr/include/elf.h:917
   DT_GNU_HASH : constant := 16#6ffffef5#;  --  /usr/include/elf.h:918
   DT_TLSDESC_PLT : constant := 16#6ffffef6#;  --  /usr/include/elf.h:919
   DT_TLSDESC_GOT : constant := 16#6ffffef7#;  --  /usr/include/elf.h:920
   DT_GNU_CONFLICT : constant := 16#6ffffef8#;  --  /usr/include/elf.h:921
   DT_GNU_LIBLIST : constant := 16#6ffffef9#;  --  /usr/include/elf.h:922
   DT_CONFIG : constant := 16#6ffffefa#;  --  /usr/include/elf.h:923
   DT_DEPAUDIT : constant := 16#6ffffefb#;  --  /usr/include/elf.h:924
   DT_AUDIT : constant := 16#6ffffefc#;  --  /usr/include/elf.h:925
   DT_PLTPAD : constant := 16#6ffffefd#;  --  /usr/include/elf.h:926
   DT_MOVETAB : constant := 16#6ffffefe#;  --  /usr/include/elf.h:927
   DT_SYMINFO : constant := 16#6ffffeff#;  --  /usr/include/elf.h:928
   DT_ADDRRNGHI : constant := 16#6ffffeff#;  --  /usr/include/elf.h:929
   --  arg-macro: function DT_ADDRTAGIDX (tag)
   --    return DT_ADDRRNGHI - (tag);

   DT_ADDRNUM : constant := 11;  --  /usr/include/elf.h:931

   DT_VERSYM : constant := 16#6ffffff0#;  --  /usr/include/elf.h:935

   DT_RELACOUNT : constant := 16#6ffffff9#;  --  /usr/include/elf.h:937
   DT_RELCOUNT : constant := 16#6ffffffa#;  --  /usr/include/elf.h:938

   DT_FLAGS_1 : constant := 16#6ffffffb#;  --  /usr/include/elf.h:941
   DT_VERDEF : constant := 16#6ffffffc#;  --  /usr/include/elf.h:942

   DT_VERDEFNUM : constant := 16#6ffffffd#;  --  /usr/include/elf.h:944
   DT_VERNEED : constant := 16#6ffffffe#;  --  /usr/include/elf.h:945

   DT_VERNEEDNUM : constant := 16#6fffffff#;  --  /usr/include/elf.h:947
   --  arg-macro: function DT_VERSIONTAGIDX (tag)
   --    return DT_VERNEEDNUM - (tag);

   DT_VERSIONTAGNUM : constant := 16;  --  /usr/include/elf.h:949

   DT_AUXILIARY : constant := 16#7ffffffd#;  --  /usr/include/elf.h:953
   DT_FILTER : constant := 16#7fffffff#;  --  /usr/include/elf.h:954
   --  arg-macro: function DT_EXTRATAGIDX (tag)
   --    return (Elf32_Word)-((Elf32_Sword) (tag) <<1>>1)-1;

   DT_EXTRANUM : constant := 3;  --  /usr/include/elf.h:956

   DF_ORIGIN : constant := 16#00000001#;  --  /usr/include/elf.h:959
   DF_SYMBOLIC : constant := 16#00000002#;  --  /usr/include/elf.h:960
   DF_TEXTREL : constant := 16#00000004#;  --  /usr/include/elf.h:961
   DF_BIND_NOW : constant := 16#00000008#;  --  /usr/include/elf.h:962
   DF_STATIC_TLS : constant := 16#00000010#;  --  /usr/include/elf.h:963

   DF_1_NOW : constant := 16#00000001#;  --  /usr/include/elf.h:967
   DF_1_GLOBAL : constant := 16#00000002#;  --  /usr/include/elf.h:968
   DF_1_GROUP : constant := 16#00000004#;  --  /usr/include/elf.h:969
   DF_1_NODELETE : constant := 16#00000008#;  --  /usr/include/elf.h:970
   DF_1_LOADFLTR : constant := 16#00000010#;  --  /usr/include/elf.h:971
   DF_1_INITFIRST : constant := 16#00000020#;  --  /usr/include/elf.h:972
   DF_1_NOOPEN : constant := 16#00000040#;  --  /usr/include/elf.h:973
   DF_1_ORIGIN : constant := 16#00000080#;  --  /usr/include/elf.h:974
   DF_1_DIRECT : constant := 16#00000100#;  --  /usr/include/elf.h:975
   DF_1_TRANS : constant := 16#00000200#;  --  /usr/include/elf.h:976
   DF_1_INTERPOSE : constant := 16#00000400#;  --  /usr/include/elf.h:977
   DF_1_NODEFLIB : constant := 16#00000800#;  --  /usr/include/elf.h:978
   DF_1_NODUMP : constant := 16#00001000#;  --  /usr/include/elf.h:979
   DF_1_CONFALT : constant := 16#00002000#;  --  /usr/include/elf.h:980
   DF_1_ENDFILTEE : constant := 16#00004000#;  --  /usr/include/elf.h:981
   DF_1_DISPRELDNE : constant := 16#00008000#;  --  /usr/include/elf.h:982
   DF_1_DISPRELPND : constant := 16#00010000#;  --  /usr/include/elf.h:983
   DF_1_NODIRECT : constant := 16#00020000#;  --  /usr/include/elf.h:984
   DF_1_IGNMULDEF : constant := 16#00040000#;  --  /usr/include/elf.h:985
   DF_1_NOKSYMS : constant := 16#00080000#;  --  /usr/include/elf.h:986
   DF_1_NOHDR : constant := 16#00100000#;  --  /usr/include/elf.h:987
   DF_1_EDITED : constant := 16#00200000#;  --  /usr/include/elf.h:988
   DF_1_NORELOC : constant := 16#00400000#;  --  /usr/include/elf.h:989
   DF_1_SYMINTPOSE : constant := 16#00800000#;  --  /usr/include/elf.h:990
   DF_1_GLOBAUDIT : constant := 16#01000000#;  --  /usr/include/elf.h:991
   DF_1_SINGLETON : constant := 16#02000000#;  --  /usr/include/elf.h:992
   DF_1_STUB : constant := 16#04000000#;  --  /usr/include/elf.h:993
   DF_1_PIE : constant := 16#08000000#;  --  /usr/include/elf.h:994
   DF_1_KMOD : constant := 16#10000000#;  --  /usr/include/elf.h:995
   DF_1_WEAKFILTER : constant := 16#20000000#;  --  /usr/include/elf.h:996
   DF_1_NOCOMMON : constant := 16#40000000#;  --  /usr/include/elf.h:997

   DTF_1_PARINIT : constant := 16#00000001#;  --  /usr/include/elf.h:1000
   DTF_1_CONFEXP : constant := 16#00000002#;  --  /usr/include/elf.h:1001

   DF_P1_LAZYLOAD : constant := 16#00000001#;  --  /usr/include/elf.h:1004
   DF_P1_GROUPPERM : constant := 16#00000002#;  --  /usr/include/elf.h:1005

   VER_DEF_NONE : constant := 0;  --  /usr/include/elf.h:1036
   VER_DEF_CURRENT : constant := 1;  --  /usr/include/elf.h:1037
   VER_DEF_NUM : constant := 2;  --  /usr/include/elf.h:1038

   VER_FLG_BASE : constant := 16#1#;  --  /usr/include/elf.h:1041

   VER_NDX_LOCAL : constant := 0;  --  /usr/include/elf.h:1045
   VER_NDX_GLOBAL : constant := 1;  --  /usr/include/elf.h:1046
   VER_NDX_LORESERVE : constant := 16#ff00#;  --  /usr/include/elf.h:1047
   VER_NDX_ELIMINATE : constant := 16#ff01#;  --  /usr/include/elf.h:1048

   VER_NEED_NONE : constant := 0;  --  /usr/include/elf.h:1093
   VER_NEED_CURRENT : constant := 1;  --  /usr/include/elf.h:1094
   VER_NEED_NUM : constant := 2;  --  /usr/include/elf.h:1095

   VER_FLG_WEAK : constant := 16#2#;  --  /usr/include/elf.h:1121

   AT_NULL : constant := 0;  --  /usr/include/elf.h:1159
   AT_IGNORE : constant := 1;  --  /usr/include/elf.h:1160
   AT_EXECFD : constant := 2;  --  /usr/include/elf.h:1161
   AT_PHDR : constant := 3;  --  /usr/include/elf.h:1162
   AT_PHENT : constant := 4;  --  /usr/include/elf.h:1163
   AT_PHNUM : constant := 5;  --  /usr/include/elf.h:1164
   AT_PAGESZ : constant := 6;  --  /usr/include/elf.h:1165
   AT_BASE : constant := 7;  --  /usr/include/elf.h:1166
   AT_FLAGS : constant := 8;  --  /usr/include/elf.h:1167
   AT_ENTRY : constant := 9;  --  /usr/include/elf.h:1168
   AT_NOTELF : constant := 10;  --  /usr/include/elf.h:1169
   AT_UID : constant := 11;  --  /usr/include/elf.h:1170
   AT_EUID : constant := 12;  --  /usr/include/elf.h:1171
   AT_GID : constant := 13;  --  /usr/include/elf.h:1172
   AT_EGID : constant := 14;  --  /usr/include/elf.h:1173
   AT_CLKTCK : constant := 17;  --  /usr/include/elf.h:1174

   AT_PLATFORM : constant := 15;  --  /usr/include/elf.h:1177
   AT_HWCAP : constant := 16;  --  /usr/include/elf.h:1178

   AT_FPUCW : constant := 18;  --  /usr/include/elf.h:1183

   AT_DCACHEBSIZE : constant := 19;  --  /usr/include/elf.h:1186
   AT_ICACHEBSIZE : constant := 20;  --  /usr/include/elf.h:1187
   AT_UCACHEBSIZE : constant := 21;  --  /usr/include/elf.h:1188

   AT_IGNOREPPC : constant := 22;  --  /usr/include/elf.h:1192

   AT_SECURE : constant := 23;  --  /usr/include/elf.h:1194

   AT_BASE_PLATFORM : constant := 24;  --  /usr/include/elf.h:1196

   AT_RANDOM : constant := 25;  --  /usr/include/elf.h:1198

   AT_HWCAP2 : constant := 26;  --  /usr/include/elf.h:1200

   AT_EXECFN : constant := 31;  --  /usr/include/elf.h:1203

   AT_SYSINFO : constant := 32;  --  /usr/include/elf.h:1207
   AT_SYSINFO_EHDR : constant := 33;  --  /usr/include/elf.h:1208

   AT_L1I_CACHESHAPE : constant := 34;  --  /usr/include/elf.h:1212
   AT_L1D_CACHESHAPE : constant := 35;  --  /usr/include/elf.h:1213
   AT_L2_CACHESHAPE : constant := 36;  --  /usr/include/elf.h:1214
   AT_L3_CACHESHAPE : constant := 37;  --  /usr/include/elf.h:1215

   AT_L1I_CACHESIZE : constant := 40;  --  /usr/include/elf.h:1220
   AT_L1I_CACHEGEOMETRY : constant := 41;  --  /usr/include/elf.h:1221
   AT_L1D_CACHESIZE : constant := 42;  --  /usr/include/elf.h:1222
   AT_L1D_CACHEGEOMETRY : constant := 43;  --  /usr/include/elf.h:1223
   AT_L2_CACHESIZE : constant := 44;  --  /usr/include/elf.h:1224
   AT_L2_CACHEGEOMETRY : constant := 45;  --  /usr/include/elf.h:1225
   AT_L3_CACHESIZE : constant := 46;  --  /usr/include/elf.h:1226
   AT_L3_CACHEGEOMETRY : constant := 47;  --  /usr/include/elf.h:1227

   AT_MINSIGSTKSZ : constant := 51;  --  /usr/include/elf.h:1229

   ELF_NOTE_SOLARIS : aliased constant String := "SUNW Solaris" & ASCII.NUL;  --  /usr/include/elf.h:1252

   ELF_NOTE_GNU : aliased constant String := "GNU" & ASCII.NUL;  --  /usr/include/elf.h:1255

   ELF_NOTE_PAGESIZE_HINT : constant := 1;  --  /usr/include/elf.h:1261

   NT_GNU_ABI_TAG : constant := 1;  --  /usr/include/elf.h:1272
   --  unsupported macro: ELF_NOTE_ABI NT_GNU_ABI_TAG

   ELF_NOTE_OS_LINUX : constant := 0;  --  /usr/include/elf.h:1277
   ELF_NOTE_OS_GNU : constant := 1;  --  /usr/include/elf.h:1278
   ELF_NOTE_OS_SOLARIS2 : constant := 2;  --  /usr/include/elf.h:1279
   ELF_NOTE_OS_FREEBSD : constant := 3;  --  /usr/include/elf.h:1280

   NT_GNU_HWCAP : constant := 2;  --  /usr/include/elf.h:1288

   NT_GNU_BUILD_ID : constant := 3;  --  /usr/include/elf.h:1292

   NT_GNU_GOLD_VERSION : constant := 4;  --  /usr/include/elf.h:1295

   NT_GNU_PROPERTY_TYPE_0 : constant := 5;  --  /usr/include/elf.h:1298

   NOTE_GNU_PROPERTY_SECTION_NAME : aliased constant String := ".note.gnu.property" & ASCII.NUL;  --  /usr/include/elf.h:1301

   GNU_PROPERTY_STACK_SIZE : constant := 1;  --  /usr/include/elf.h:1306

   GNU_PROPERTY_NO_COPY_ON_PROTECTED : constant := 2;  --  /usr/include/elf.h:1308

   GNU_PROPERTY_LOPROC : constant := 16#c0000000#;  --  /usr/include/elf.h:1311

   GNU_PROPERTY_HIPROC : constant := 16#dfffffff#;  --  /usr/include/elf.h:1313

   GNU_PROPERTY_LOUSER : constant := 16#e0000000#;  --  /usr/include/elf.h:1315

   GNU_PROPERTY_HIUSER : constant := 16#ffffffff#;  --  /usr/include/elf.h:1317

   GNU_PROPERTY_AARCH64_FEATURE_1_AND : constant := 16#c0000000#;  --  /usr/include/elf.h:1320

   GNU_PROPERTY_AARCH64_FEATURE_1_BTI : constant := (2 ** 0);  --  /usr/include/elf.h:1322
   GNU_PROPERTY_AARCH64_FEATURE_1_PAC : constant := (2 ** 1);  --  /usr/include/elf.h:1323

   GNU_PROPERTY_X86_ISA_1_USED : constant := 16#c0010002#;  --  /usr/include/elf.h:1327

   GNU_PROPERTY_X86_ISA_1_NEEDED : constant := 16#c0008002#;  --  /usr/include/elf.h:1330

   GNU_PROPERTY_X86_FEATURE_1_AND : constant := 16#c0000002#;  --  /usr/include/elf.h:1332

   GNU_PROPERTY_X86_ISA_1_BASELINE : constant := (2 ** 0);  --  /usr/include/elf.h:1336

   GNU_PROPERTY_X86_ISA_1_V2 : constant := (2 ** 1);  --  /usr/include/elf.h:1340

   GNU_PROPERTY_X86_ISA_1_V3 : constant := (2 ** 2);  --  /usr/include/elf.h:1343

   GNU_PROPERTY_X86_ISA_1_V4 : constant := (2 ** 3);  --  /usr/include/elf.h:1346

   GNU_PROPERTY_X86_FEATURE_1_IBT : constant := (2 ** 0);  --  /usr/include/elf.h:1350

   GNU_PROPERTY_X86_FEATURE_1_SHSTK : constant := (2 ** 1);  --  /usr/include/elf.h:1353
   --  arg-macro: function ELF32_M_SYM (info)
   --    return (info) >> 8;
   --  arg-macro: function ELF32_M_SIZE (info)
   --    return (unsigned char) (info);
   --  arg-macro: function ELF32_M_INFO (sym, size)
   --    return ((sym) << 8) + (unsigned char) (size);
   --  arg-macro: procedure ELF64_M_SYM (info)
   --    ELF32_M_SYM (info)
   --  arg-macro: procedure ELF64_M_SIZE (info)
   --    ELF32_M_SIZE (info)
   --  arg-macro: procedure ELF64_M_INFO (sym, size)
   --    ELF32_M_INFO (sym, size)

   EF_CPU32 : constant := 16#00810000#;  --  /usr/include/elf.h:1387

   R_68K_NONE : constant := 0;  --  /usr/include/elf.h:1391
   R_68K_32 : constant := 1;  --  /usr/include/elf.h:1392
   R_68K_16 : constant := 2;  --  /usr/include/elf.h:1393
   R_68K_8 : constant := 3;  --  /usr/include/elf.h:1394
   R_68K_PC32 : constant := 4;  --  /usr/include/elf.h:1395
   R_68K_PC16 : constant := 5;  --  /usr/include/elf.h:1396
   R_68K_PC8 : constant := 6;  --  /usr/include/elf.h:1397
   R_68K_GOT32 : constant := 7;  --  /usr/include/elf.h:1398
   R_68K_GOT16 : constant := 8;  --  /usr/include/elf.h:1399
   R_68K_GOT8 : constant := 9;  --  /usr/include/elf.h:1400
   R_68K_GOT32O : constant := 10;  --  /usr/include/elf.h:1401
   R_68K_GOT16O : constant := 11;  --  /usr/include/elf.h:1402
   R_68K_GOT8O : constant := 12;  --  /usr/include/elf.h:1403
   R_68K_PLT32 : constant := 13;  --  /usr/include/elf.h:1404
   R_68K_PLT16 : constant := 14;  --  /usr/include/elf.h:1405
   R_68K_PLT8 : constant := 15;  --  /usr/include/elf.h:1406
   R_68K_PLT32O : constant := 16;  --  /usr/include/elf.h:1407
   R_68K_PLT16O : constant := 17;  --  /usr/include/elf.h:1408
   R_68K_PLT8O : constant := 18;  --  /usr/include/elf.h:1409
   R_68K_COPY : constant := 19;  --  /usr/include/elf.h:1410
   R_68K_GLOB_DAT : constant := 20;  --  /usr/include/elf.h:1411
   R_68K_JMP_SLOT : constant := 21;  --  /usr/include/elf.h:1412
   R_68K_RELATIVE : constant := 22;  --  /usr/include/elf.h:1413
   R_68K_TLS_GD32 : constant := 25;  --  /usr/include/elf.h:1414
   R_68K_TLS_GD16 : constant := 26;  --  /usr/include/elf.h:1415
   R_68K_TLS_GD8 : constant := 27;  --  /usr/include/elf.h:1416
   R_68K_TLS_LDM32 : constant := 28;  --  /usr/include/elf.h:1417
   R_68K_TLS_LDM16 : constant := 29;  --  /usr/include/elf.h:1418
   R_68K_TLS_LDM8 : constant := 30;  --  /usr/include/elf.h:1419
   R_68K_TLS_LDO32 : constant := 31;  --  /usr/include/elf.h:1420
   R_68K_TLS_LDO16 : constant := 32;  --  /usr/include/elf.h:1421
   R_68K_TLS_LDO8 : constant := 33;  --  /usr/include/elf.h:1422
   R_68K_TLS_IE32 : constant := 34;  --  /usr/include/elf.h:1423
   R_68K_TLS_IE16 : constant := 35;  --  /usr/include/elf.h:1424
   R_68K_TLS_IE8 : constant := 36;  --  /usr/include/elf.h:1425
   R_68K_TLS_LE32 : constant := 37;  --  /usr/include/elf.h:1426

   R_68K_TLS_LE16 : constant := 38;  --  /usr/include/elf.h:1428

   R_68K_TLS_LE8 : constant := 39;  --  /usr/include/elf.h:1430

   R_68K_TLS_DTPMOD32 : constant := 40;  --  /usr/include/elf.h:1432
   R_68K_TLS_DTPREL32 : constant := 41;  --  /usr/include/elf.h:1433
   R_68K_TLS_TPREL32 : constant := 42;  --  /usr/include/elf.h:1434

   R_68K_NUM : constant := 43;  --  /usr/include/elf.h:1436

   R_386_NONE : constant := 0;  --  /usr/include/elf.h:1442
   R_386_32 : constant := 1;  --  /usr/include/elf.h:1443
   R_386_PC32 : constant := 2;  --  /usr/include/elf.h:1444
   R_386_GOT32 : constant := 3;  --  /usr/include/elf.h:1445
   R_386_PLT32 : constant := 4;  --  /usr/include/elf.h:1446
   R_386_COPY : constant := 5;  --  /usr/include/elf.h:1447
   R_386_GLOB_DAT : constant := 6;  --  /usr/include/elf.h:1448
   R_386_JMP_SLOT : constant := 7;  --  /usr/include/elf.h:1449
   R_386_RELATIVE : constant := 8;  --  /usr/include/elf.h:1450
   R_386_GOTOFF : constant := 9;  --  /usr/include/elf.h:1451
   R_386_GOTPC : constant := 10;  --  /usr/include/elf.h:1452
   R_386_32PLT : constant := 11;  --  /usr/include/elf.h:1453
   R_386_TLS_TPOFF : constant := 14;  --  /usr/include/elf.h:1454
   R_386_TLS_IE : constant := 15;  --  /usr/include/elf.h:1455

   R_386_TLS_GOTIE : constant := 16;  --  /usr/include/elf.h:1457

   R_386_TLS_LE : constant := 17;  --  /usr/include/elf.h:1459

   R_386_TLS_GD : constant := 18;  --  /usr/include/elf.h:1461

   R_386_TLS_LDM : constant := 19;  --  /usr/include/elf.h:1463

   R_386_16 : constant := 20;  --  /usr/include/elf.h:1466
   R_386_PC16 : constant := 21;  --  /usr/include/elf.h:1467
   R_386_8 : constant := 22;  --  /usr/include/elf.h:1468
   R_386_PC8 : constant := 23;  --  /usr/include/elf.h:1469
   R_386_TLS_GD_32 : constant := 24;  --  /usr/include/elf.h:1470

   R_386_TLS_GD_PUSH : constant := 25;  --  /usr/include/elf.h:1472
   R_386_TLS_GD_CALL : constant := 26;  --  /usr/include/elf.h:1473

   R_386_TLS_GD_POP : constant := 27;  --  /usr/include/elf.h:1475
   R_386_TLS_LDM_32 : constant := 28;  --  /usr/include/elf.h:1476

   R_386_TLS_LDM_PUSH : constant := 29;  --  /usr/include/elf.h:1478
   R_386_TLS_LDM_CALL : constant := 30;  --  /usr/include/elf.h:1479

   R_386_TLS_LDM_POP : constant := 31;  --  /usr/include/elf.h:1481
   R_386_TLS_LDO_32 : constant := 32;  --  /usr/include/elf.h:1482
   R_386_TLS_IE_32 : constant := 33;  --  /usr/include/elf.h:1483

   R_386_TLS_LE_32 : constant := 34;  --  /usr/include/elf.h:1485

   R_386_TLS_DTPMOD32 : constant := 35;  --  /usr/include/elf.h:1487
   R_386_TLS_DTPOFF32 : constant := 36;  --  /usr/include/elf.h:1488
   R_386_TLS_TPOFF32 : constant := 37;  --  /usr/include/elf.h:1489
   R_386_SIZE32 : constant := 38;  --  /usr/include/elf.h:1490
   R_386_TLS_GOTDESC : constant := 39;  --  /usr/include/elf.h:1491
   R_386_TLS_DESC_CALL : constant := 40;  --  /usr/include/elf.h:1492

   R_386_TLS_DESC : constant := 41;  --  /usr/include/elf.h:1495

   R_386_IRELATIVE : constant := 42;  --  /usr/include/elf.h:1499
   R_386_GOT32X : constant := 43;  --  /usr/include/elf.h:1500

   R_386_NUM : constant := 44;  --  /usr/include/elf.h:1503

   STT_SPARC_REGISTER : constant := 13;  --  /usr/include/elf.h:1509

   EF_SPARCV9_MM : constant := 3;  --  /usr/include/elf.h:1513
   EF_SPARCV9_TSO : constant := 0;  --  /usr/include/elf.h:1514
   EF_SPARCV9_PSO : constant := 1;  --  /usr/include/elf.h:1515
   EF_SPARCV9_RMO : constant := 2;  --  /usr/include/elf.h:1516
   EF_SPARC_LEDATA : constant := 16#800000#;  --  /usr/include/elf.h:1517
   EF_SPARC_EXT_MASK : constant := 16#FFFF00#;  --  /usr/include/elf.h:1518
   EF_SPARC_32PLUS : constant := 16#000100#;  --  /usr/include/elf.h:1519
   EF_SPARC_SUN_US1 : constant := 16#000200#;  --  /usr/include/elf.h:1520
   EF_SPARC_HAL_R1 : constant := 16#000400#;  --  /usr/include/elf.h:1521
   EF_SPARC_SUN_US3 : constant := 16#000800#;  --  /usr/include/elf.h:1522

   R_SPARC_NONE : constant := 0;  --  /usr/include/elf.h:1526
   R_SPARC_8 : constant := 1;  --  /usr/include/elf.h:1527
   R_SPARC_16 : constant := 2;  --  /usr/include/elf.h:1528
   R_SPARC_32 : constant := 3;  --  /usr/include/elf.h:1529
   R_SPARC_DISP8 : constant := 4;  --  /usr/include/elf.h:1530
   R_SPARC_DISP16 : constant := 5;  --  /usr/include/elf.h:1531
   R_SPARC_DISP32 : constant := 6;  --  /usr/include/elf.h:1532
   R_SPARC_WDISP30 : constant := 7;  --  /usr/include/elf.h:1533
   R_SPARC_WDISP22 : constant := 8;  --  /usr/include/elf.h:1534
   R_SPARC_HI22 : constant := 9;  --  /usr/include/elf.h:1535
   R_SPARC_22 : constant := 10;  --  /usr/include/elf.h:1536
   R_SPARC_13 : constant := 11;  --  /usr/include/elf.h:1537
   R_SPARC_LO10 : constant := 12;  --  /usr/include/elf.h:1538
   R_SPARC_GOT10 : constant := 13;  --  /usr/include/elf.h:1539
   R_SPARC_GOT13 : constant := 14;  --  /usr/include/elf.h:1540
   R_SPARC_GOT22 : constant := 15;  --  /usr/include/elf.h:1541
   R_SPARC_PC10 : constant := 16;  --  /usr/include/elf.h:1542
   R_SPARC_PC22 : constant := 17;  --  /usr/include/elf.h:1543
   R_SPARC_WPLT30 : constant := 18;  --  /usr/include/elf.h:1544
   R_SPARC_COPY : constant := 19;  --  /usr/include/elf.h:1545
   R_SPARC_GLOB_DAT : constant := 20;  --  /usr/include/elf.h:1546
   R_SPARC_JMP_SLOT : constant := 21;  --  /usr/include/elf.h:1547
   R_SPARC_RELATIVE : constant := 22;  --  /usr/include/elf.h:1548
   R_SPARC_UA32 : constant := 23;  --  /usr/include/elf.h:1549

   R_SPARC_PLT32 : constant := 24;  --  /usr/include/elf.h:1553
   R_SPARC_HIPLT22 : constant := 25;  --  /usr/include/elf.h:1554
   R_SPARC_LOPLT10 : constant := 26;  --  /usr/include/elf.h:1555
   R_SPARC_PCPLT32 : constant := 27;  --  /usr/include/elf.h:1556
   R_SPARC_PCPLT22 : constant := 28;  --  /usr/include/elf.h:1557
   R_SPARC_PCPLT10 : constant := 29;  --  /usr/include/elf.h:1558
   R_SPARC_10 : constant := 30;  --  /usr/include/elf.h:1559
   R_SPARC_11 : constant := 31;  --  /usr/include/elf.h:1560
   R_SPARC_64 : constant := 32;  --  /usr/include/elf.h:1561
   R_SPARC_OLO10 : constant := 33;  --  /usr/include/elf.h:1562
   R_SPARC_HH22 : constant := 34;  --  /usr/include/elf.h:1563
   R_SPARC_HM10 : constant := 35;  --  /usr/include/elf.h:1564
   R_SPARC_LM22 : constant := 36;  --  /usr/include/elf.h:1565
   R_SPARC_PC_HH22 : constant := 37;  --  /usr/include/elf.h:1566
   R_SPARC_PC_HM10 : constant := 38;  --  /usr/include/elf.h:1567
   R_SPARC_PC_LM22 : constant := 39;  --  /usr/include/elf.h:1568
   R_SPARC_WDISP16 : constant := 40;  --  /usr/include/elf.h:1569
   R_SPARC_WDISP19 : constant := 41;  --  /usr/include/elf.h:1570
   R_SPARC_GLOB_JMP : constant := 42;  --  /usr/include/elf.h:1571
   R_SPARC_7 : constant := 43;  --  /usr/include/elf.h:1572
   R_SPARC_5 : constant := 44;  --  /usr/include/elf.h:1573
   R_SPARC_6 : constant := 45;  --  /usr/include/elf.h:1574
   R_SPARC_DISP64 : constant := 46;  --  /usr/include/elf.h:1575
   R_SPARC_PLT64 : constant := 47;  --  /usr/include/elf.h:1576
   R_SPARC_HIX22 : constant := 48;  --  /usr/include/elf.h:1577
   R_SPARC_LOX10 : constant := 49;  --  /usr/include/elf.h:1578
   R_SPARC_H44 : constant := 50;  --  /usr/include/elf.h:1579
   R_SPARC_M44 : constant := 51;  --  /usr/include/elf.h:1580
   R_SPARC_L44 : constant := 52;  --  /usr/include/elf.h:1581
   R_SPARC_REGISTER : constant := 53;  --  /usr/include/elf.h:1582
   R_SPARC_UA64 : constant := 54;  --  /usr/include/elf.h:1583
   R_SPARC_UA16 : constant := 55;  --  /usr/include/elf.h:1584
   R_SPARC_TLS_GD_HI22 : constant := 56;  --  /usr/include/elf.h:1585
   R_SPARC_TLS_GD_LO10 : constant := 57;  --  /usr/include/elf.h:1586
   R_SPARC_TLS_GD_ADD : constant := 58;  --  /usr/include/elf.h:1587
   R_SPARC_TLS_GD_CALL : constant := 59;  --  /usr/include/elf.h:1588
   R_SPARC_TLS_LDM_HI22 : constant := 60;  --  /usr/include/elf.h:1589
   R_SPARC_TLS_LDM_LO10 : constant := 61;  --  /usr/include/elf.h:1590
   R_SPARC_TLS_LDM_ADD : constant := 62;  --  /usr/include/elf.h:1591
   R_SPARC_TLS_LDM_CALL : constant := 63;  --  /usr/include/elf.h:1592
   R_SPARC_TLS_LDO_HIX22 : constant := 64;  --  /usr/include/elf.h:1593
   R_SPARC_TLS_LDO_LOX10 : constant := 65;  --  /usr/include/elf.h:1594
   R_SPARC_TLS_LDO_ADD : constant := 66;  --  /usr/include/elf.h:1595
   R_SPARC_TLS_IE_HI22 : constant := 67;  --  /usr/include/elf.h:1596
   R_SPARC_TLS_IE_LO10 : constant := 68;  --  /usr/include/elf.h:1597
   R_SPARC_TLS_IE_LD : constant := 69;  --  /usr/include/elf.h:1598
   R_SPARC_TLS_IE_LDX : constant := 70;  --  /usr/include/elf.h:1599
   R_SPARC_TLS_IE_ADD : constant := 71;  --  /usr/include/elf.h:1600
   R_SPARC_TLS_LE_HIX22 : constant := 72;  --  /usr/include/elf.h:1601
   R_SPARC_TLS_LE_LOX10 : constant := 73;  --  /usr/include/elf.h:1602
   R_SPARC_TLS_DTPMOD32 : constant := 74;  --  /usr/include/elf.h:1603
   R_SPARC_TLS_DTPMOD64 : constant := 75;  --  /usr/include/elf.h:1604
   R_SPARC_TLS_DTPOFF32 : constant := 76;  --  /usr/include/elf.h:1605
   R_SPARC_TLS_DTPOFF64 : constant := 77;  --  /usr/include/elf.h:1606
   R_SPARC_TLS_TPOFF32 : constant := 78;  --  /usr/include/elf.h:1607
   R_SPARC_TLS_TPOFF64 : constant := 79;  --  /usr/include/elf.h:1608
   R_SPARC_GOTDATA_HIX22 : constant := 80;  --  /usr/include/elf.h:1609
   R_SPARC_GOTDATA_LOX10 : constant := 81;  --  /usr/include/elf.h:1610
   R_SPARC_GOTDATA_OP_HIX22 : constant := 82;  --  /usr/include/elf.h:1611
   R_SPARC_GOTDATA_OP_LOX10 : constant := 83;  --  /usr/include/elf.h:1612
   R_SPARC_GOTDATA_OP : constant := 84;  --  /usr/include/elf.h:1613
   R_SPARC_H34 : constant := 85;  --  /usr/include/elf.h:1614
   R_SPARC_SIZE32 : constant := 86;  --  /usr/include/elf.h:1615
   R_SPARC_SIZE64 : constant := 87;  --  /usr/include/elf.h:1616
   R_SPARC_WDISP10 : constant := 88;  --  /usr/include/elf.h:1617
   R_SPARC_JMP_IREL : constant := 248;  --  /usr/include/elf.h:1618
   R_SPARC_IRELATIVE : constant := 249;  --  /usr/include/elf.h:1619
   R_SPARC_GNU_VTINHERIT : constant := 250;  --  /usr/include/elf.h:1620
   R_SPARC_GNU_VTENTRY : constant := 251;  --  /usr/include/elf.h:1621
   R_SPARC_REV32 : constant := 252;  --  /usr/include/elf.h:1622

   R_SPARC_NUM : constant := 253;  --  /usr/include/elf.h:1624

   DT_SPARC_REGISTER : constant := 16#70000001#;  --  /usr/include/elf.h:1628
   DT_SPARC_NUM : constant := 2;  --  /usr/include/elf.h:1629

   EF_MIPS_NOREORDER : constant := 1;  --  /usr/include/elf.h:1635
   EF_MIPS_PIC : constant := 2;  --  /usr/include/elf.h:1636
   EF_MIPS_CPIC : constant := 4;  --  /usr/include/elf.h:1637
   EF_MIPS_XGOT : constant := 8;  --  /usr/include/elf.h:1638
   EF_MIPS_64BIT_WHIRL : constant := 16;  --  /usr/include/elf.h:1639
   EF_MIPS_ABI2 : constant := 32;  --  /usr/include/elf.h:1640
   EF_MIPS_ABI_ON32 : constant := 64;  --  /usr/include/elf.h:1641
   EF_MIPS_FP64 : constant := 512;  --  /usr/include/elf.h:1642
   EF_MIPS_NAN2008 : constant := 1024;  --  /usr/include/elf.h:1643
   EF_MIPS_ARCH : constant := 16#f0000000#;  --  /usr/include/elf.h:1644

   EF_MIPS_ARCH_1 : constant := 16#00000000#;  --  /usr/include/elf.h:1648
   EF_MIPS_ARCH_2 : constant := 16#10000000#;  --  /usr/include/elf.h:1649
   EF_MIPS_ARCH_3 : constant := 16#20000000#;  --  /usr/include/elf.h:1650
   EF_MIPS_ARCH_4 : constant := 16#30000000#;  --  /usr/include/elf.h:1651
   EF_MIPS_ARCH_5 : constant := 16#40000000#;  --  /usr/include/elf.h:1652
   EF_MIPS_ARCH_32 : constant := 16#50000000#;  --  /usr/include/elf.h:1653
   EF_MIPS_ARCH_64 : constant := 16#60000000#;  --  /usr/include/elf.h:1654
   EF_MIPS_ARCH_32R2 : constant := 16#70000000#;  --  /usr/include/elf.h:1655
   EF_MIPS_ARCH_64R2 : constant := 16#80000000#;  --  /usr/include/elf.h:1656
   --  unsupported macro: E_MIPS_ARCH_1 EF_MIPS_ARCH_1
   --  unsupported macro: E_MIPS_ARCH_2 EF_MIPS_ARCH_2
   --  unsupported macro: E_MIPS_ARCH_3 EF_MIPS_ARCH_3
   --  unsupported macro: E_MIPS_ARCH_4 EF_MIPS_ARCH_4
   --  unsupported macro: E_MIPS_ARCH_5 EF_MIPS_ARCH_5
   --  unsupported macro: E_MIPS_ARCH_32 EF_MIPS_ARCH_32
   --  unsupported macro: E_MIPS_ARCH_64 EF_MIPS_ARCH_64

   SHN_MIPS_ACOMMON : constant := 16#ff00#;  --  /usr/include/elf.h:1670
   SHN_MIPS_TEXT : constant := 16#ff01#;  --  /usr/include/elf.h:1671
   SHN_MIPS_DATA : constant := 16#ff02#;  --  /usr/include/elf.h:1672
   SHN_MIPS_SCOMMON : constant := 16#ff03#;  --  /usr/include/elf.h:1673
   SHN_MIPS_SUNDEFINED : constant := 16#ff04#;  --  /usr/include/elf.h:1674

   SHT_MIPS_LIBLIST : constant := 16#70000000#;  --  /usr/include/elf.h:1678
   SHT_MIPS_MSYM : constant := 16#70000001#;  --  /usr/include/elf.h:1679
   SHT_MIPS_CONFLICT : constant := 16#70000002#;  --  /usr/include/elf.h:1680
   SHT_MIPS_GPTAB : constant := 16#70000003#;  --  /usr/include/elf.h:1681
   SHT_MIPS_UCODE : constant := 16#70000004#;  --  /usr/include/elf.h:1682
   SHT_MIPS_DEBUG : constant := 16#70000005#;  --  /usr/include/elf.h:1683
   SHT_MIPS_REGINFO : constant := 16#70000006#;  --  /usr/include/elf.h:1684
   SHT_MIPS_PACKAGE : constant := 16#70000007#;  --  /usr/include/elf.h:1685
   SHT_MIPS_PACKSYM : constant := 16#70000008#;  --  /usr/include/elf.h:1686
   SHT_MIPS_RELD : constant := 16#70000009#;  --  /usr/include/elf.h:1687
   SHT_MIPS_IFACE : constant := 16#7000000b#;  --  /usr/include/elf.h:1688
   SHT_MIPS_CONTENT : constant := 16#7000000c#;  --  /usr/include/elf.h:1689
   SHT_MIPS_OPTIONS : constant := 16#7000000d#;  --  /usr/include/elf.h:1690
   SHT_MIPS_SHDR : constant := 16#70000010#;  --  /usr/include/elf.h:1691
   SHT_MIPS_FDESC : constant := 16#70000011#;  --  /usr/include/elf.h:1692
   SHT_MIPS_EXTSYM : constant := 16#70000012#;  --  /usr/include/elf.h:1693
   SHT_MIPS_DENSE : constant := 16#70000013#;  --  /usr/include/elf.h:1694
   SHT_MIPS_PDESC : constant := 16#70000014#;  --  /usr/include/elf.h:1695
   SHT_MIPS_LOCSYM : constant := 16#70000015#;  --  /usr/include/elf.h:1696
   SHT_MIPS_AUXSYM : constant := 16#70000016#;  --  /usr/include/elf.h:1697
   SHT_MIPS_OPTSYM : constant := 16#70000017#;  --  /usr/include/elf.h:1698
   SHT_MIPS_LOCSTR : constant := 16#70000018#;  --  /usr/include/elf.h:1699
   SHT_MIPS_LINE : constant := 16#70000019#;  --  /usr/include/elf.h:1700
   SHT_MIPS_RFDESC : constant := 16#7000001a#;  --  /usr/include/elf.h:1701
   SHT_MIPS_DELTASYM : constant := 16#7000001b#;  --  /usr/include/elf.h:1702
   SHT_MIPS_DELTAINST : constant := 16#7000001c#;  --  /usr/include/elf.h:1703
   SHT_MIPS_DELTACLASS : constant := 16#7000001d#;  --  /usr/include/elf.h:1704
   SHT_MIPS_DWARF : constant := 16#7000001e#;  --  /usr/include/elf.h:1705
   SHT_MIPS_DELTADECL : constant := 16#7000001f#;  --  /usr/include/elf.h:1706
   SHT_MIPS_SYMBOL_LIB : constant := 16#70000020#;  --  /usr/include/elf.h:1707
   SHT_MIPS_EVENTS : constant := 16#70000021#;  --  /usr/include/elf.h:1708
   SHT_MIPS_TRANSLATE : constant := 16#70000022#;  --  /usr/include/elf.h:1709
   SHT_MIPS_PIXIE : constant := 16#70000023#;  --  /usr/include/elf.h:1710
   SHT_MIPS_XLATE : constant := 16#70000024#;  --  /usr/include/elf.h:1711
   SHT_MIPS_XLATE_DEBUG : constant := 16#70000025#;  --  /usr/include/elf.h:1712
   SHT_MIPS_WHIRL : constant := 16#70000026#;  --  /usr/include/elf.h:1713
   SHT_MIPS_EH_REGION : constant := 16#70000027#;  --  /usr/include/elf.h:1714
   SHT_MIPS_XLATE_OLD : constant := 16#70000028#;  --  /usr/include/elf.h:1715
   SHT_MIPS_PDR_EXCEPTION : constant := 16#70000029#;  --  /usr/include/elf.h:1716
   SHT_MIPS_XHASH : constant := 16#7000002b#;  --  /usr/include/elf.h:1717

   SHF_MIPS_GPREL : constant := 16#10000000#;  --  /usr/include/elf.h:1721
   SHF_MIPS_MERGE : constant := 16#20000000#;  --  /usr/include/elf.h:1722
   SHF_MIPS_ADDR : constant := 16#40000000#;  --  /usr/include/elf.h:1723
   SHF_MIPS_STRINGS : constant := 16#80000000#;  --  /usr/include/elf.h:1724
   SHF_MIPS_NOSTRIP : constant := 16#08000000#;  --  /usr/include/elf.h:1725
   SHF_MIPS_LOCAL : constant := 16#04000000#;  --  /usr/include/elf.h:1726
   SHF_MIPS_NAMES : constant := 16#02000000#;  --  /usr/include/elf.h:1727
   SHF_MIPS_NODUPE : constant := 16#01000000#;  --  /usr/include/elf.h:1728

   STO_MIPS_DEFAULT : constant := 16#0#;  --  /usr/include/elf.h:1734
   STO_MIPS_INTERNAL : constant := 16#1#;  --  /usr/include/elf.h:1735
   STO_MIPS_HIDDEN : constant := 16#2#;  --  /usr/include/elf.h:1736
   STO_MIPS_PROTECTED : constant := 16#3#;  --  /usr/include/elf.h:1737
   STO_MIPS_PLT : constant := 16#8#;  --  /usr/include/elf.h:1738
   STO_MIPS_SC_ALIGN_UNUSED : constant := 16#ff#;  --  /usr/include/elf.h:1739

   STB_MIPS_SPLIT_COMMON : constant := 13;  --  /usr/include/elf.h:1742

   ODK_NULL : constant := 0;  --  /usr/include/elf.h:1783
   ODK_REGINFO : constant := 1;  --  /usr/include/elf.h:1784
   ODK_EXCEPTIONS : constant := 2;  --  /usr/include/elf.h:1785
   ODK_PAD : constant := 3;  --  /usr/include/elf.h:1786
   ODK_HWPATCH : constant := 4;  --  /usr/include/elf.h:1787
   ODK_FILL : constant := 5;  --  /usr/include/elf.h:1788
   ODK_TAGS : constant := 6;  --  /usr/include/elf.h:1789
   ODK_HWAND : constant := 7;  --  /usr/include/elf.h:1790
   ODK_HWOR : constant := 8;  --  /usr/include/elf.h:1791

   OEX_FPU_MIN : constant := 16#1f#;  --  /usr/include/elf.h:1795
   OEX_FPU_MAX : constant := 16#1f00#;  --  /usr/include/elf.h:1796
   OEX_PAGE0 : constant := 16#10000#;  --  /usr/include/elf.h:1797
   OEX_SMM : constant := 16#20000#;  --  /usr/include/elf.h:1798
   OEX_FPDBUG : constant := 16#40000#;  --  /usr/include/elf.h:1799
   --  unsupported macro: OEX_PRECISEFP OEX_FPDBUG

   OEX_DISMISS : constant := 16#80000#;  --  /usr/include/elf.h:1801

   OEX_FPU_INVAL : constant := 16#10#;  --  /usr/include/elf.h:1803
   OEX_FPU_DIV0 : constant := 16#08#;  --  /usr/include/elf.h:1804
   OEX_FPU_OFLO : constant := 16#04#;  --  /usr/include/elf.h:1805
   OEX_FPU_UFLO : constant := 16#02#;  --  /usr/include/elf.h:1806
   OEX_FPU_INEX : constant := 16#01#;  --  /usr/include/elf.h:1807

   OHW_R4KEOP : constant := 16#1#;  --  /usr/include/elf.h:1811
   OHW_R8KPFETCH : constant := 16#2#;  --  /usr/include/elf.h:1812
   OHW_R5KEOP : constant := 16#4#;  --  /usr/include/elf.h:1813
   OHW_R5KCVTL : constant := 16#8#;  --  /usr/include/elf.h:1814

   OPAD_PREFIX : constant := 16#1#;  --  /usr/include/elf.h:1816
   OPAD_POSTFIX : constant := 16#2#;  --  /usr/include/elf.h:1817
   OPAD_SYMBOL : constant := 16#4#;  --  /usr/include/elf.h:1818

   OHWA0_R4KEOP_CHECKED : constant := 16#00000001#;  --  /usr/include/elf.h:1830
   OHWA1_R4KEOP_CLEAN : constant := 16#00000002#;  --  /usr/include/elf.h:1831

   R_MIPS_NONE : constant := 0;  --  /usr/include/elf.h:1835
   R_MIPS_16 : constant := 1;  --  /usr/include/elf.h:1836
   R_MIPS_32 : constant := 2;  --  /usr/include/elf.h:1837
   R_MIPS_REL32 : constant := 3;  --  /usr/include/elf.h:1838
   R_MIPS_26 : constant := 4;  --  /usr/include/elf.h:1839
   R_MIPS_HI16 : constant := 5;  --  /usr/include/elf.h:1840
   R_MIPS_LO16 : constant := 6;  --  /usr/include/elf.h:1841
   R_MIPS_GPREL16 : constant := 7;  --  /usr/include/elf.h:1842
   R_MIPS_LITERAL : constant := 8;  --  /usr/include/elf.h:1843
   R_MIPS_GOT16 : constant := 9;  --  /usr/include/elf.h:1844
   R_MIPS_PC16 : constant := 10;  --  /usr/include/elf.h:1845
   R_MIPS_CALL16 : constant := 11;  --  /usr/include/elf.h:1846
   R_MIPS_GPREL32 : constant := 12;  --  /usr/include/elf.h:1847

   R_MIPS_SHIFT5 : constant := 16;  --  /usr/include/elf.h:1849
   R_MIPS_SHIFT6 : constant := 17;  --  /usr/include/elf.h:1850
   R_MIPS_64 : constant := 18;  --  /usr/include/elf.h:1851
   R_MIPS_GOT_DISP : constant := 19;  --  /usr/include/elf.h:1852
   R_MIPS_GOT_PAGE : constant := 20;  --  /usr/include/elf.h:1853
   R_MIPS_GOT_OFST : constant := 21;  --  /usr/include/elf.h:1854
   R_MIPS_GOT_HI16 : constant := 22;  --  /usr/include/elf.h:1855
   R_MIPS_GOT_LO16 : constant := 23;  --  /usr/include/elf.h:1856
   R_MIPS_SUB : constant := 24;  --  /usr/include/elf.h:1857
   R_MIPS_INSERT_A : constant := 25;  --  /usr/include/elf.h:1858
   R_MIPS_INSERT_B : constant := 26;  --  /usr/include/elf.h:1859
   R_MIPS_DELETE : constant := 27;  --  /usr/include/elf.h:1860
   R_MIPS_HIGHER : constant := 28;  --  /usr/include/elf.h:1861
   R_MIPS_HIGHEST : constant := 29;  --  /usr/include/elf.h:1862
   R_MIPS_CALL_HI16 : constant := 30;  --  /usr/include/elf.h:1863
   R_MIPS_CALL_LO16 : constant := 31;  --  /usr/include/elf.h:1864
   R_MIPS_SCN_DISP : constant := 32;  --  /usr/include/elf.h:1865
   R_MIPS_REL16 : constant := 33;  --  /usr/include/elf.h:1866
   R_MIPS_ADD_IMMEDIATE : constant := 34;  --  /usr/include/elf.h:1867
   R_MIPS_PJUMP : constant := 35;  --  /usr/include/elf.h:1868
   R_MIPS_RELGOT : constant := 36;  --  /usr/include/elf.h:1869
   R_MIPS_JALR : constant := 37;  --  /usr/include/elf.h:1870
   R_MIPS_TLS_DTPMOD32 : constant := 38;  --  /usr/include/elf.h:1871
   R_MIPS_TLS_DTPREL32 : constant := 39;  --  /usr/include/elf.h:1872
   R_MIPS_TLS_DTPMOD64 : constant := 40;  --  /usr/include/elf.h:1873
   R_MIPS_TLS_DTPREL64 : constant := 41;  --  /usr/include/elf.h:1874
   R_MIPS_TLS_GD : constant := 42;  --  /usr/include/elf.h:1875
   R_MIPS_TLS_LDM : constant := 43;  --  /usr/include/elf.h:1876
   R_MIPS_TLS_DTPREL_HI16 : constant := 44;  --  /usr/include/elf.h:1877
   R_MIPS_TLS_DTPREL_LO16 : constant := 45;  --  /usr/include/elf.h:1878
   R_MIPS_TLS_GOTTPREL : constant := 46;  --  /usr/include/elf.h:1879
   R_MIPS_TLS_TPREL32 : constant := 47;  --  /usr/include/elf.h:1880
   R_MIPS_TLS_TPREL64 : constant := 48;  --  /usr/include/elf.h:1881
   R_MIPS_TLS_TPREL_HI16 : constant := 49;  --  /usr/include/elf.h:1882
   R_MIPS_TLS_TPREL_LO16 : constant := 50;  --  /usr/include/elf.h:1883
   R_MIPS_GLOB_DAT : constant := 51;  --  /usr/include/elf.h:1884
   R_MIPS_COPY : constant := 126;  --  /usr/include/elf.h:1885
   R_MIPS_JUMP_SLOT : constant := 127;  --  /usr/include/elf.h:1886

   R_MIPS_NUM : constant := 128;  --  /usr/include/elf.h:1888

   PT_MIPS_REGINFO : constant := 16#70000000#;  --  /usr/include/elf.h:1892
   PT_MIPS_RTPROC : constant := 16#70000001#;  --  /usr/include/elf.h:1893
   PT_MIPS_OPTIONS : constant := 16#70000002#;  --  /usr/include/elf.h:1894
   PT_MIPS_ABIFLAGS : constant := 16#70000003#;  --  /usr/include/elf.h:1895

   PF_MIPS_LOCAL : constant := 16#10000000#;  --  /usr/include/elf.h:1899

   DT_MIPS_RLD_VERSION : constant := 16#70000001#;  --  /usr/include/elf.h:1903
   DT_MIPS_TIME_STAMP : constant := 16#70000002#;  --  /usr/include/elf.h:1904
   DT_MIPS_ICHECKSUM : constant := 16#70000003#;  --  /usr/include/elf.h:1905
   DT_MIPS_IVERSION : constant := 16#70000004#;  --  /usr/include/elf.h:1906
   DT_MIPS_FLAGS : constant := 16#70000005#;  --  /usr/include/elf.h:1907
   DT_MIPS_BASE_ADDRESS : constant := 16#70000006#;  --  /usr/include/elf.h:1908
   DT_MIPS_MSYM : constant := 16#70000007#;  --  /usr/include/elf.h:1909
   DT_MIPS_CONFLICT : constant := 16#70000008#;  --  /usr/include/elf.h:1910
   DT_MIPS_LIBLIST : constant := 16#70000009#;  --  /usr/include/elf.h:1911
   DT_MIPS_LOCAL_GOTNO : constant := 16#7000000a#;  --  /usr/include/elf.h:1912
   DT_MIPS_CONFLICTNO : constant := 16#7000000b#;  --  /usr/include/elf.h:1913
   DT_MIPS_LIBLISTNO : constant := 16#70000010#;  --  /usr/include/elf.h:1914
   DT_MIPS_SYMTABNO : constant := 16#70000011#;  --  /usr/include/elf.h:1915
   DT_MIPS_UNREFEXTNO : constant := 16#70000012#;  --  /usr/include/elf.h:1916
   DT_MIPS_GOTSYM : constant := 16#70000013#;  --  /usr/include/elf.h:1917
   DT_MIPS_HIPAGENO : constant := 16#70000014#;  --  /usr/include/elf.h:1918
   DT_MIPS_RLD_MAP : constant := 16#70000016#;  --  /usr/include/elf.h:1919
   DT_MIPS_DELTA_CLASS : constant := 16#70000017#;  --  /usr/include/elf.h:1920
   DT_MIPS_DELTA_CLASS_NO : constant := 16#70000018#;  --  /usr/include/elf.h:1921

   DT_MIPS_DELTA_INSTANCE : constant := 16#70000019#;  --  /usr/include/elf.h:1923
   DT_MIPS_DELTA_INSTANCE_NO : constant := 16#7000001a#;  --  /usr/include/elf.h:1924

   DT_MIPS_DELTA_RELOC : constant := 16#7000001b#;  --  /usr/include/elf.h:1926
   DT_MIPS_DELTA_RELOC_NO : constant := 16#7000001c#;  --  /usr/include/elf.h:1927

   DT_MIPS_DELTA_SYM : constant := 16#7000001d#;  --  /usr/include/elf.h:1929

   DT_MIPS_DELTA_SYM_NO : constant := 16#7000001e#;  --  /usr/include/elf.h:1931

   DT_MIPS_DELTA_CLASSSYM : constant := 16#70000020#;  --  /usr/include/elf.h:1933

   DT_MIPS_DELTA_CLASSSYM_NO : constant := 16#70000021#;  --  /usr/include/elf.h:1935

   DT_MIPS_CXX_FLAGS : constant := 16#70000022#;  --  /usr/include/elf.h:1937
   DT_MIPS_PIXIE_INIT : constant := 16#70000023#;  --  /usr/include/elf.h:1938
   DT_MIPS_SYMBOL_LIB : constant := 16#70000024#;  --  /usr/include/elf.h:1939
   DT_MIPS_LOCALPAGE_GOTIDX : constant := 16#70000025#;  --  /usr/include/elf.h:1940
   DT_MIPS_LOCAL_GOTIDX : constant := 16#70000026#;  --  /usr/include/elf.h:1941
   DT_MIPS_HIDDEN_GOTIDX : constant := 16#70000027#;  --  /usr/include/elf.h:1942
   DT_MIPS_PROTECTED_GOTIDX : constant := 16#70000028#;  --  /usr/include/elf.h:1943
   DT_MIPS_OPTIONS : constant := 16#70000029#;  --  /usr/include/elf.h:1944
   DT_MIPS_INTERFACE : constant := 16#7000002a#;  --  /usr/include/elf.h:1945
   DT_MIPS_DYNSTR_ALIGN : constant := 16#7000002b#;  --  /usr/include/elf.h:1946
   DT_MIPS_INTERFACE_SIZE : constant := 16#7000002c#;  --  /usr/include/elf.h:1947
   DT_MIPS_RLD_TEXT_RESOLVE_ADDR : constant := 16#7000002d#;  --  /usr/include/elf.h:1948

   DT_MIPS_PERF_SUFFIX : constant := 16#7000002e#;  --  /usr/include/elf.h:1950

   DT_MIPS_COMPACT_SIZE : constant := 16#7000002f#;  --  /usr/include/elf.h:1952
   DT_MIPS_GP_VALUE : constant := 16#70000030#;  --  /usr/include/elf.h:1953
   DT_MIPS_AUX_DYNAMIC : constant := 16#70000031#;  --  /usr/include/elf.h:1954

   DT_MIPS_PLTGOT : constant := 16#70000032#;  --  /usr/include/elf.h:1956

   DT_MIPS_RWPLT : constant := 16#70000034#;  --  /usr/include/elf.h:1960

   DT_MIPS_RLD_MAP_REL : constant := 16#70000035#;  --  /usr/include/elf.h:1964

   DT_MIPS_XHASH : constant := 16#70000036#;  --  /usr/include/elf.h:1966
   DT_MIPS_NUM : constant := 16#37#;  --  /usr/include/elf.h:1967

   RHF_NONE : constant := 0;  --  /usr/include/elf.h:1971
   RHF_QUICKSTART : constant := (2 ** 0);  --  /usr/include/elf.h:1972
   RHF_NOTPOT : constant := (2 ** 1);  --  /usr/include/elf.h:1973
   RHF_NO_LIBRARY_REPLACEMENT : constant := (2 ** 2);  --  /usr/include/elf.h:1974
   RHF_NO_MOVE : constant := (2 ** 3);  --  /usr/include/elf.h:1975
   RHF_SGI_ONLY : constant := (2 ** 4);  --  /usr/include/elf.h:1976
   RHF_GUARANTEE_INIT : constant := (2 ** 5);  --  /usr/include/elf.h:1977
   RHF_DELTA_C_PLUS_PLUS : constant := (2 ** 6);  --  /usr/include/elf.h:1978
   RHF_GUARANTEE_START_INIT : constant := (2 ** 7);  --  /usr/include/elf.h:1979
   RHF_PIXIE : constant := (2 ** 8);  --  /usr/include/elf.h:1980
   RHF_DEFAULT_DELAY_LOAD : constant := (2 ** 9);  --  /usr/include/elf.h:1981
   RHF_REQUICKSTART : constant := (2 ** 10);  --  /usr/include/elf.h:1982
   RHF_REQUICKSTARTED : constant := (2 ** 11);  --  /usr/include/elf.h:1983
   RHF_CORD : constant := (2 ** 12);  --  /usr/include/elf.h:1984
   RHF_NO_UNRES_UNDEF : constant := (2 ** 13);  --  /usr/include/elf.h:1985
   RHF_RLD_ORDER_SAFE : constant := (2 ** 14);  --  /usr/include/elf.h:1986

   LL_NONE : constant := 0;  --  /usr/include/elf.h:2011
   LL_EXACT_MATCH : constant := (2 ** 0);  --  /usr/include/elf.h:2012
   LL_IGNORE_INT_VER : constant := (2 ** 1);  --  /usr/include/elf.h:2013
   LL_REQUIRE_MINOR : constant := (2 ** 2);  --  /usr/include/elf.h:2014
   LL_EXPORTS : constant := (2 ** 3);  --  /usr/include/elf.h:2015
   LL_DELAY_LOAD : constant := (2 ** 4);  --  /usr/include/elf.h:2016
   LL_DELTA : constant := (2 ** 5);  --  /usr/include/elf.h:2017

   MIPS_AFL_REG_NONE : constant := 16#00#;  --  /usr/include/elf.h:2050
   MIPS_AFL_REG_32 : constant := 16#01#;  --  /usr/include/elf.h:2051
   MIPS_AFL_REG_64 : constant := 16#02#;  --  /usr/include/elf.h:2052
   MIPS_AFL_REG_128 : constant := 16#03#;  --  /usr/include/elf.h:2053

   MIPS_AFL_ASE_DSP : constant := 16#00000001#;  --  /usr/include/elf.h:2057
   MIPS_AFL_ASE_DSPR2 : constant := 16#00000002#;  --  /usr/include/elf.h:2058
   MIPS_AFL_ASE_EVA : constant := 16#00000004#;  --  /usr/include/elf.h:2059
   MIPS_AFL_ASE_MCU : constant := 16#00000008#;  --  /usr/include/elf.h:2060
   MIPS_AFL_ASE_MDMX : constant := 16#00000010#;  --  /usr/include/elf.h:2061
   MIPS_AFL_ASE_MIPS3D : constant := 16#00000020#;  --  /usr/include/elf.h:2062
   MIPS_AFL_ASE_MT : constant := 16#00000040#;  --  /usr/include/elf.h:2063
   MIPS_AFL_ASE_SMARTMIPS : constant := 16#00000080#;  --  /usr/include/elf.h:2064
   MIPS_AFL_ASE_VIRT : constant := 16#00000100#;  --  /usr/include/elf.h:2065
   MIPS_AFL_ASE_MSA : constant := 16#00000200#;  --  /usr/include/elf.h:2066
   MIPS_AFL_ASE_MIPS16 : constant := 16#00000400#;  --  /usr/include/elf.h:2067
   MIPS_AFL_ASE_MICROMIPS : constant := 16#00000800#;  --  /usr/include/elf.h:2068
   MIPS_AFL_ASE_XPA : constant := 16#00001000#;  --  /usr/include/elf.h:2069
   MIPS_AFL_ASE_MASK : constant := 16#00001fff#;  --  /usr/include/elf.h:2070

   MIPS_AFL_EXT_XLR : constant := 1;  --  /usr/include/elf.h:2074
   MIPS_AFL_EXT_OCTEON2 : constant := 2;  --  /usr/include/elf.h:2075
   MIPS_AFL_EXT_OCTEONP : constant := 3;  --  /usr/include/elf.h:2076
   MIPS_AFL_EXT_LOONGSON_3A : constant := 4;  --  /usr/include/elf.h:2077
   MIPS_AFL_EXT_OCTEON : constant := 5;  --  /usr/include/elf.h:2078
   MIPS_AFL_EXT_5900 : constant := 6;  --  /usr/include/elf.h:2079
   MIPS_AFL_EXT_4650 : constant := 7;  --  /usr/include/elf.h:2080
   MIPS_AFL_EXT_4010 : constant := 8;  --  /usr/include/elf.h:2081
   MIPS_AFL_EXT_4100 : constant := 9;  --  /usr/include/elf.h:2082
   MIPS_AFL_EXT_3900 : constant := 10;  --  /usr/include/elf.h:2083
   MIPS_AFL_EXT_10000 : constant := 11;  --  /usr/include/elf.h:2084
   MIPS_AFL_EXT_SB1 : constant := 12;  --  /usr/include/elf.h:2085
   MIPS_AFL_EXT_4111 : constant := 13;  --  /usr/include/elf.h:2086
   MIPS_AFL_EXT_4120 : constant := 14;  --  /usr/include/elf.h:2087
   MIPS_AFL_EXT_5400 : constant := 15;  --  /usr/include/elf.h:2088
   MIPS_AFL_EXT_5500 : constant := 16;  --  /usr/include/elf.h:2089
   MIPS_AFL_EXT_LOONGSON_2E : constant := 17;  --  /usr/include/elf.h:2090
   MIPS_AFL_EXT_LOONGSON_2F : constant := 18;  --  /usr/include/elf.h:2091

   MIPS_AFL_FLAGS1_ODDSPREG : constant := 1;  --  /usr/include/elf.h:2094

   EF_PARISC_TRAPNIL : constant := 16#00010000#;  --  /usr/include/elf.h:2123
   EF_PARISC_EXT : constant := 16#00020000#;  --  /usr/include/elf.h:2124
   EF_PARISC_LSB : constant := 16#00040000#;  --  /usr/include/elf.h:2125
   EF_PARISC_WIDE : constant := 16#00080000#;  --  /usr/include/elf.h:2126
   EF_PARISC_NO_KABP : constant := 16#00100000#;  --  /usr/include/elf.h:2127

   EF_PARISC_LAZYSWAP : constant := 16#00400000#;  --  /usr/include/elf.h:2129
   EF_PARISC_ARCH : constant := 16#0000ffff#;  --  /usr/include/elf.h:2130

   EFA_PARISC_1_0 : constant := 16#020b#;  --  /usr/include/elf.h:2134
   EFA_PARISC_1_1 : constant := 16#0210#;  --  /usr/include/elf.h:2135
   EFA_PARISC_2_0 : constant := 16#0214#;  --  /usr/include/elf.h:2136

   SHN_PARISC_ANSI_COMMON : constant := 16#ff00#;  --  /usr/include/elf.h:2140

   SHN_PARISC_HUGE_COMMON : constant := 16#ff01#;  --  /usr/include/elf.h:2142

   SHT_PARISC_EXT : constant := 16#70000000#;  --  /usr/include/elf.h:2146
   SHT_PARISC_UNWIND : constant := 16#70000001#;  --  /usr/include/elf.h:2147
   SHT_PARISC_DOC : constant := 16#70000002#;  --  /usr/include/elf.h:2148

   SHF_PARISC_SHORT : constant := 16#20000000#;  --  /usr/include/elf.h:2152
   SHF_PARISC_HUGE : constant := 16#40000000#;  --  /usr/include/elf.h:2153
   SHF_PARISC_SBP : constant := 16#80000000#;  --  /usr/include/elf.h:2154

   STT_PARISC_MILLICODE : constant := 13;  --  /usr/include/elf.h:2158
   --  unsupported macro: STT_HP_OPAQUE (STT_LOOS + 0x1)
   --  unsupported macro: STT_HP_STUB (STT_LOOS + 0x2)

   R_PARISC_NONE : constant := 0;  --  /usr/include/elf.h:2165
   R_PARISC_DIR32 : constant := 1;  --  /usr/include/elf.h:2166
   R_PARISC_DIR21L : constant := 2;  --  /usr/include/elf.h:2167
   R_PARISC_DIR17R : constant := 3;  --  /usr/include/elf.h:2168
   R_PARISC_DIR17F : constant := 4;  --  /usr/include/elf.h:2169
   R_PARISC_DIR14R : constant := 6;  --  /usr/include/elf.h:2170
   R_PARISC_PCREL32 : constant := 9;  --  /usr/include/elf.h:2171
   R_PARISC_PCREL21L : constant := 10;  --  /usr/include/elf.h:2172
   R_PARISC_PCREL17R : constant := 11;  --  /usr/include/elf.h:2173
   R_PARISC_PCREL17F : constant := 12;  --  /usr/include/elf.h:2174
   R_PARISC_PCREL14R : constant := 14;  --  /usr/include/elf.h:2175
   R_PARISC_DPREL21L : constant := 18;  --  /usr/include/elf.h:2176
   R_PARISC_DPREL14R : constant := 22;  --  /usr/include/elf.h:2177
   R_PARISC_GPREL21L : constant := 26;  --  /usr/include/elf.h:2178
   R_PARISC_GPREL14R : constant := 30;  --  /usr/include/elf.h:2179
   R_PARISC_LTOFF21L : constant := 34;  --  /usr/include/elf.h:2180
   R_PARISC_LTOFF14R : constant := 38;  --  /usr/include/elf.h:2181
   R_PARISC_SECREL32 : constant := 41;  --  /usr/include/elf.h:2182
   R_PARISC_SEGBASE : constant := 48;  --  /usr/include/elf.h:2183
   R_PARISC_SEGREL32 : constant := 49;  --  /usr/include/elf.h:2184
   R_PARISC_PLTOFF21L : constant := 50;  --  /usr/include/elf.h:2185
   R_PARISC_PLTOFF14R : constant := 54;  --  /usr/include/elf.h:2186
   R_PARISC_LTOFF_FPTR32 : constant := 57;  --  /usr/include/elf.h:2187
   R_PARISC_LTOFF_FPTR21L : constant := 58;  --  /usr/include/elf.h:2188
   R_PARISC_LTOFF_FPTR14R : constant := 62;  --  /usr/include/elf.h:2189
   R_PARISC_FPTR64 : constant := 64;  --  /usr/include/elf.h:2190
   R_PARISC_PLABEL32 : constant := 65;  --  /usr/include/elf.h:2191
   R_PARISC_PLABEL21L : constant := 66;  --  /usr/include/elf.h:2192
   R_PARISC_PLABEL14R : constant := 70;  --  /usr/include/elf.h:2193
   R_PARISC_PCREL64 : constant := 72;  --  /usr/include/elf.h:2194
   R_PARISC_PCREL22F : constant := 74;  --  /usr/include/elf.h:2195
   R_PARISC_PCREL14WR : constant := 75;  --  /usr/include/elf.h:2196
   R_PARISC_PCREL14DR : constant := 76;  --  /usr/include/elf.h:2197
   R_PARISC_PCREL16F : constant := 77;  --  /usr/include/elf.h:2198
   R_PARISC_PCREL16WF : constant := 78;  --  /usr/include/elf.h:2199
   R_PARISC_PCREL16DF : constant := 79;  --  /usr/include/elf.h:2200
   R_PARISC_DIR64 : constant := 80;  --  /usr/include/elf.h:2201
   R_PARISC_DIR14WR : constant := 83;  --  /usr/include/elf.h:2202
   R_PARISC_DIR14DR : constant := 84;  --  /usr/include/elf.h:2203
   R_PARISC_DIR16F : constant := 85;  --  /usr/include/elf.h:2204
   R_PARISC_DIR16WF : constant := 86;  --  /usr/include/elf.h:2205
   R_PARISC_DIR16DF : constant := 87;  --  /usr/include/elf.h:2206
   R_PARISC_GPREL64 : constant := 88;  --  /usr/include/elf.h:2207
   R_PARISC_GPREL14WR : constant := 91;  --  /usr/include/elf.h:2208
   R_PARISC_GPREL14DR : constant := 92;  --  /usr/include/elf.h:2209
   R_PARISC_GPREL16F : constant := 93;  --  /usr/include/elf.h:2210
   R_PARISC_GPREL16WF : constant := 94;  --  /usr/include/elf.h:2211
   R_PARISC_GPREL16DF : constant := 95;  --  /usr/include/elf.h:2212
   R_PARISC_LTOFF64 : constant := 96;  --  /usr/include/elf.h:2213
   R_PARISC_LTOFF14WR : constant := 99;  --  /usr/include/elf.h:2214
   R_PARISC_LTOFF14DR : constant := 100;  --  /usr/include/elf.h:2215
   R_PARISC_LTOFF16F : constant := 101;  --  /usr/include/elf.h:2216
   R_PARISC_LTOFF16WF : constant := 102;  --  /usr/include/elf.h:2217
   R_PARISC_LTOFF16DF : constant := 103;  --  /usr/include/elf.h:2218
   R_PARISC_SECREL64 : constant := 104;  --  /usr/include/elf.h:2219
   R_PARISC_SEGREL64 : constant := 112;  --  /usr/include/elf.h:2220
   R_PARISC_PLTOFF14WR : constant := 115;  --  /usr/include/elf.h:2221
   R_PARISC_PLTOFF14DR : constant := 116;  --  /usr/include/elf.h:2222
   R_PARISC_PLTOFF16F : constant := 117;  --  /usr/include/elf.h:2223
   R_PARISC_PLTOFF16WF : constant := 118;  --  /usr/include/elf.h:2224
   R_PARISC_PLTOFF16DF : constant := 119;  --  /usr/include/elf.h:2225
   R_PARISC_LTOFF_FPTR64 : constant := 120;  --  /usr/include/elf.h:2226
   R_PARISC_LTOFF_FPTR14WR : constant := 123;  --  /usr/include/elf.h:2227
   R_PARISC_LTOFF_FPTR14DR : constant := 124;  --  /usr/include/elf.h:2228
   R_PARISC_LTOFF_FPTR16F : constant := 125;  --  /usr/include/elf.h:2229
   R_PARISC_LTOFF_FPTR16WF : constant := 126;  --  /usr/include/elf.h:2230
   R_PARISC_LTOFF_FPTR16DF : constant := 127;  --  /usr/include/elf.h:2231
   R_PARISC_LORESERVE : constant := 128;  --  /usr/include/elf.h:2232
   R_PARISC_COPY : constant := 128;  --  /usr/include/elf.h:2233
   R_PARISC_IPLT : constant := 129;  --  /usr/include/elf.h:2234
   R_PARISC_EPLT : constant := 130;  --  /usr/include/elf.h:2235
   R_PARISC_TPREL32 : constant := 153;  --  /usr/include/elf.h:2236
   R_PARISC_TPREL21L : constant := 154;  --  /usr/include/elf.h:2237
   R_PARISC_TPREL14R : constant := 158;  --  /usr/include/elf.h:2238
   R_PARISC_LTOFF_TP21L : constant := 162;  --  /usr/include/elf.h:2239
   R_PARISC_LTOFF_TP14R : constant := 166;  --  /usr/include/elf.h:2240
   R_PARISC_LTOFF_TP14F : constant := 167;  --  /usr/include/elf.h:2241
   R_PARISC_TPREL64 : constant := 216;  --  /usr/include/elf.h:2242
   R_PARISC_TPREL14WR : constant := 219;  --  /usr/include/elf.h:2243
   R_PARISC_TPREL14DR : constant := 220;  --  /usr/include/elf.h:2244
   R_PARISC_TPREL16F : constant := 221;  --  /usr/include/elf.h:2245
   R_PARISC_TPREL16WF : constant := 222;  --  /usr/include/elf.h:2246
   R_PARISC_TPREL16DF : constant := 223;  --  /usr/include/elf.h:2247
   R_PARISC_LTOFF_TP64 : constant := 224;  --  /usr/include/elf.h:2248
   R_PARISC_LTOFF_TP14WR : constant := 227;  --  /usr/include/elf.h:2249
   R_PARISC_LTOFF_TP14DR : constant := 228;  --  /usr/include/elf.h:2250
   R_PARISC_LTOFF_TP16F : constant := 229;  --  /usr/include/elf.h:2251
   R_PARISC_LTOFF_TP16WF : constant := 230;  --  /usr/include/elf.h:2252
   R_PARISC_LTOFF_TP16DF : constant := 231;  --  /usr/include/elf.h:2253
   R_PARISC_GNU_VTENTRY : constant := 232;  --  /usr/include/elf.h:2254
   R_PARISC_GNU_VTINHERIT : constant := 233;  --  /usr/include/elf.h:2255
   R_PARISC_TLS_GD21L : constant := 234;  --  /usr/include/elf.h:2256
   R_PARISC_TLS_GD14R : constant := 235;  --  /usr/include/elf.h:2257
   R_PARISC_TLS_GDCALL : constant := 236;  --  /usr/include/elf.h:2258
   R_PARISC_TLS_LDM21L : constant := 237;  --  /usr/include/elf.h:2259
   R_PARISC_TLS_LDM14R : constant := 238;  --  /usr/include/elf.h:2260
   R_PARISC_TLS_LDMCALL : constant := 239;  --  /usr/include/elf.h:2261
   R_PARISC_TLS_LDO21L : constant := 240;  --  /usr/include/elf.h:2262
   R_PARISC_TLS_LDO14R : constant := 241;  --  /usr/include/elf.h:2263
   R_PARISC_TLS_DTPMOD32 : constant := 242;  --  /usr/include/elf.h:2264
   R_PARISC_TLS_DTPMOD64 : constant := 243;  --  /usr/include/elf.h:2265
   R_PARISC_TLS_DTPOFF32 : constant := 244;  --  /usr/include/elf.h:2266
   R_PARISC_TLS_DTPOFF64 : constant := 245;  --  /usr/include/elf.h:2267
   --  unsupported macro: R_PARISC_TLS_LE21L R_PARISC_TPREL21L
   --  unsupported macro: R_PARISC_TLS_LE14R R_PARISC_TPREL14R
   --  unsupported macro: R_PARISC_TLS_IE21L R_PARISC_LTOFF_TP21L
   --  unsupported macro: R_PARISC_TLS_IE14R R_PARISC_LTOFF_TP14R
   --  unsupported macro: R_PARISC_TLS_TPREL32 R_PARISC_TPREL32
   --  unsupported macro: R_PARISC_TLS_TPREL64 R_PARISC_TPREL64

   R_PARISC_HIRESERVE : constant := 255;  --  /usr/include/elf.h:2274
   --  unsupported macro: PT_HP_TLS (PT_LOOS + 0x0)
   --  unsupported macro: PT_HP_CORE_NONE (PT_LOOS + 0x1)
   --  unsupported macro: PT_HP_CORE_VERSION (PT_LOOS + 0x2)
   --  unsupported macro: PT_HP_CORE_KERNEL (PT_LOOS + 0x3)
   --  unsupported macro: PT_HP_CORE_COMM (PT_LOOS + 0x4)
   --  unsupported macro: PT_HP_CORE_PROC (PT_LOOS + 0x5)
   --  unsupported macro: PT_HP_CORE_LOADABLE (PT_LOOS + 0x6)
   --  unsupported macro: PT_HP_CORE_STACK (PT_LOOS + 0x7)
   --  unsupported macro: PT_HP_CORE_SHM (PT_LOOS + 0x8)
   --  unsupported macro: PT_HP_CORE_MMF (PT_LOOS + 0x9)
   --  unsupported macro: PT_HP_PARALLEL (PT_LOOS + 0x10)
   --  unsupported macro: PT_HP_FASTBIND (PT_LOOS + 0x11)
   --  unsupported macro: PT_HP_OPT_ANNOT (PT_LOOS + 0x12)
   --  unsupported macro: PT_HP_HSL_ANNOT (PT_LOOS + 0x13)
   --  unsupported macro: PT_HP_STACK (PT_LOOS + 0x14)

   PT_PARISC_ARCHEXT : constant := 16#70000000#;  --  /usr/include/elf.h:2294
   PT_PARISC_UNWIND : constant := 16#70000001#;  --  /usr/include/elf.h:2295

   PF_PARISC_SBP : constant := 16#08000000#;  --  /usr/include/elf.h:2299

   PF_HP_PAGE_SIZE : constant := 16#00100000#;  --  /usr/include/elf.h:2301
   PF_HP_FAR_SHARED : constant := 16#00200000#;  --  /usr/include/elf.h:2302
   PF_HP_NEAR_SHARED : constant := 16#00400000#;  --  /usr/include/elf.h:2303
   PF_HP_CODE : constant := 16#01000000#;  --  /usr/include/elf.h:2304
   PF_HP_MODIFY : constant := 16#02000000#;  --  /usr/include/elf.h:2305
   PF_HP_LAZYSWAP : constant := 16#04000000#;  --  /usr/include/elf.h:2306
   PF_HP_SBP : constant := 16#08000000#;  --  /usr/include/elf.h:2307

   EF_ALPHA_32BIT : constant := 1;  --  /usr/include/elf.h:2314
   EF_ALPHA_CANRELAX : constant := 2;  --  /usr/include/elf.h:2315

   SHT_ALPHA_DEBUG : constant := 16#70000001#;  --  /usr/include/elf.h:2320
   SHT_ALPHA_REGINFO : constant := 16#70000002#;  --  /usr/include/elf.h:2321

   SHF_ALPHA_GPREL : constant := 16#10000000#;  --  /usr/include/elf.h:2325

   STO_ALPHA_NOPV : constant := 16#80#;  --  /usr/include/elf.h:2328
   STO_ALPHA_STD_GPLOAD : constant := 16#88#;  --  /usr/include/elf.h:2329

   R_ALPHA_NONE : constant := 0;  --  /usr/include/elf.h:2333
   R_ALPHA_REFLONG : constant := 1;  --  /usr/include/elf.h:2334
   R_ALPHA_REFQUAD : constant := 2;  --  /usr/include/elf.h:2335
   R_ALPHA_GPREL32 : constant := 3;  --  /usr/include/elf.h:2336
   R_ALPHA_LITERAL : constant := 4;  --  /usr/include/elf.h:2337
   R_ALPHA_LITUSE : constant := 5;  --  /usr/include/elf.h:2338
   R_ALPHA_GPDISP : constant := 6;  --  /usr/include/elf.h:2339
   R_ALPHA_BRADDR : constant := 7;  --  /usr/include/elf.h:2340
   R_ALPHA_HINT : constant := 8;  --  /usr/include/elf.h:2341
   R_ALPHA_SREL16 : constant := 9;  --  /usr/include/elf.h:2342
   R_ALPHA_SREL32 : constant := 10;  --  /usr/include/elf.h:2343
   R_ALPHA_SREL64 : constant := 11;  --  /usr/include/elf.h:2344
   R_ALPHA_GPRELHIGH : constant := 17;  --  /usr/include/elf.h:2345
   R_ALPHA_GPRELLOW : constant := 18;  --  /usr/include/elf.h:2346
   R_ALPHA_GPREL16 : constant := 19;  --  /usr/include/elf.h:2347
   R_ALPHA_COPY : constant := 24;  --  /usr/include/elf.h:2348
   R_ALPHA_GLOB_DAT : constant := 25;  --  /usr/include/elf.h:2349
   R_ALPHA_JMP_SLOT : constant := 26;  --  /usr/include/elf.h:2350
   R_ALPHA_RELATIVE : constant := 27;  --  /usr/include/elf.h:2351
   R_ALPHA_TLS_GD_HI : constant := 28;  --  /usr/include/elf.h:2352
   R_ALPHA_TLSGD : constant := 29;  --  /usr/include/elf.h:2353
   R_ALPHA_TLS_LDM : constant := 30;  --  /usr/include/elf.h:2354
   R_ALPHA_DTPMOD64 : constant := 31;  --  /usr/include/elf.h:2355
   R_ALPHA_GOTDTPREL : constant := 32;  --  /usr/include/elf.h:2356
   R_ALPHA_DTPREL64 : constant := 33;  --  /usr/include/elf.h:2357
   R_ALPHA_DTPRELHI : constant := 34;  --  /usr/include/elf.h:2358
   R_ALPHA_DTPRELLO : constant := 35;  --  /usr/include/elf.h:2359
   R_ALPHA_DTPREL16 : constant := 36;  --  /usr/include/elf.h:2360
   R_ALPHA_GOTTPREL : constant := 37;  --  /usr/include/elf.h:2361
   R_ALPHA_TPREL64 : constant := 38;  --  /usr/include/elf.h:2362
   R_ALPHA_TPRELHI : constant := 39;  --  /usr/include/elf.h:2363
   R_ALPHA_TPRELLO : constant := 40;  --  /usr/include/elf.h:2364
   R_ALPHA_TPREL16 : constant := 41;  --  /usr/include/elf.h:2365

   R_ALPHA_NUM : constant := 46;  --  /usr/include/elf.h:2367

   LITUSE_ALPHA_ADDR : constant := 0;  --  /usr/include/elf.h:2370
   LITUSE_ALPHA_BASE : constant := 1;  --  /usr/include/elf.h:2371
   LITUSE_ALPHA_BYTOFF : constant := 2;  --  /usr/include/elf.h:2372
   LITUSE_ALPHA_JSR : constant := 3;  --  /usr/include/elf.h:2373
   LITUSE_ALPHA_TLS_GD : constant := 4;  --  /usr/include/elf.h:2374
   LITUSE_ALPHA_TLS_LDM : constant := 5;  --  /usr/include/elf.h:2375
   --  unsupported macro: DT_ALPHA_PLTRO (DT_LOPROC + 0)

   DT_ALPHA_NUM : constant := 1;  --  /usr/include/elf.h:2379

   EF_PPC_EMB : constant := 16#80000000#;  --  /usr/include/elf.h:2384

   EF_PPC_RELOCATABLE : constant := 16#00010000#;  --  /usr/include/elf.h:2387
   EF_PPC_RELOCATABLE_LIB : constant := 16#00008000#;  --  /usr/include/elf.h:2388

   R_PPC_NONE : constant := 0;  --  /usr/include/elf.h:2392
   R_PPC_ADDR32 : constant := 1;  --  /usr/include/elf.h:2393
   R_PPC_ADDR24 : constant := 2;  --  /usr/include/elf.h:2394
   R_PPC_ADDR16 : constant := 3;  --  /usr/include/elf.h:2395
   R_PPC_ADDR16_LO : constant := 4;  --  /usr/include/elf.h:2396
   R_PPC_ADDR16_HI : constant := 5;  --  /usr/include/elf.h:2397
   R_PPC_ADDR16_HA : constant := 6;  --  /usr/include/elf.h:2398
   R_PPC_ADDR14 : constant := 7;  --  /usr/include/elf.h:2399
   R_PPC_ADDR14_BRTAKEN : constant := 8;  --  /usr/include/elf.h:2400
   R_PPC_ADDR14_BRNTAKEN : constant := 9;  --  /usr/include/elf.h:2401
   R_PPC_REL24 : constant := 10;  --  /usr/include/elf.h:2402
   R_PPC_REL14 : constant := 11;  --  /usr/include/elf.h:2403
   R_PPC_REL14_BRTAKEN : constant := 12;  --  /usr/include/elf.h:2404
   R_PPC_REL14_BRNTAKEN : constant := 13;  --  /usr/include/elf.h:2405
   R_PPC_GOT16 : constant := 14;  --  /usr/include/elf.h:2406
   R_PPC_GOT16_LO : constant := 15;  --  /usr/include/elf.h:2407
   R_PPC_GOT16_HI : constant := 16;  --  /usr/include/elf.h:2408
   R_PPC_GOT16_HA : constant := 17;  --  /usr/include/elf.h:2409
   R_PPC_PLTREL24 : constant := 18;  --  /usr/include/elf.h:2410
   R_PPC_COPY : constant := 19;  --  /usr/include/elf.h:2411
   R_PPC_GLOB_DAT : constant := 20;  --  /usr/include/elf.h:2412
   R_PPC_JMP_SLOT : constant := 21;  --  /usr/include/elf.h:2413
   R_PPC_RELATIVE : constant := 22;  --  /usr/include/elf.h:2414
   R_PPC_LOCAL24PC : constant := 23;  --  /usr/include/elf.h:2415
   R_PPC_UADDR32 : constant := 24;  --  /usr/include/elf.h:2416
   R_PPC_UADDR16 : constant := 25;  --  /usr/include/elf.h:2417
   R_PPC_REL32 : constant := 26;  --  /usr/include/elf.h:2418
   R_PPC_PLT32 : constant := 27;  --  /usr/include/elf.h:2419
   R_PPC_PLTREL32 : constant := 28;  --  /usr/include/elf.h:2420
   R_PPC_PLT16_LO : constant := 29;  --  /usr/include/elf.h:2421
   R_PPC_PLT16_HI : constant := 30;  --  /usr/include/elf.h:2422
   R_PPC_PLT16_HA : constant := 31;  --  /usr/include/elf.h:2423
   R_PPC_SDAREL16 : constant := 32;  --  /usr/include/elf.h:2424
   R_PPC_SECTOFF : constant := 33;  --  /usr/include/elf.h:2425
   R_PPC_SECTOFF_LO : constant := 34;  --  /usr/include/elf.h:2426
   R_PPC_SECTOFF_HI : constant := 35;  --  /usr/include/elf.h:2427
   R_PPC_SECTOFF_HA : constant := 36;  --  /usr/include/elf.h:2428

   R_PPC_TLS : constant := 67;  --  /usr/include/elf.h:2431
   R_PPC_DTPMOD32 : constant := 68;  --  /usr/include/elf.h:2432
   R_PPC_TPREL16 : constant := 69;  --  /usr/include/elf.h:2433
   R_PPC_TPREL16_LO : constant := 70;  --  /usr/include/elf.h:2434
   R_PPC_TPREL16_HI : constant := 71;  --  /usr/include/elf.h:2435
   R_PPC_TPREL16_HA : constant := 72;  --  /usr/include/elf.h:2436
   R_PPC_TPREL32 : constant := 73;  --  /usr/include/elf.h:2437
   R_PPC_DTPREL16 : constant := 74;  --  /usr/include/elf.h:2438
   R_PPC_DTPREL16_LO : constant := 75;  --  /usr/include/elf.h:2439
   R_PPC_DTPREL16_HI : constant := 76;  --  /usr/include/elf.h:2440
   R_PPC_DTPREL16_HA : constant := 77;  --  /usr/include/elf.h:2441
   R_PPC_DTPREL32 : constant := 78;  --  /usr/include/elf.h:2442
   R_PPC_GOT_TLSGD16 : constant := 79;  --  /usr/include/elf.h:2443
   R_PPC_GOT_TLSGD16_LO : constant := 80;  --  /usr/include/elf.h:2444
   R_PPC_GOT_TLSGD16_HI : constant := 81;  --  /usr/include/elf.h:2445
   R_PPC_GOT_TLSGD16_HA : constant := 82;  --  /usr/include/elf.h:2446
   R_PPC_GOT_TLSLD16 : constant := 83;  --  /usr/include/elf.h:2447
   R_PPC_GOT_TLSLD16_LO : constant := 84;  --  /usr/include/elf.h:2448
   R_PPC_GOT_TLSLD16_HI : constant := 85;  --  /usr/include/elf.h:2449
   R_PPC_GOT_TLSLD16_HA : constant := 86;  --  /usr/include/elf.h:2450
   R_PPC_GOT_TPREL16 : constant := 87;  --  /usr/include/elf.h:2451
   R_PPC_GOT_TPREL16_LO : constant := 88;  --  /usr/include/elf.h:2452
   R_PPC_GOT_TPREL16_HI : constant := 89;  --  /usr/include/elf.h:2453
   R_PPC_GOT_TPREL16_HA : constant := 90;  --  /usr/include/elf.h:2454
   R_PPC_GOT_DTPREL16 : constant := 91;  --  /usr/include/elf.h:2455
   R_PPC_GOT_DTPREL16_LO : constant := 92;  --  /usr/include/elf.h:2456
   R_PPC_GOT_DTPREL16_HI : constant := 93;  --  /usr/include/elf.h:2457
   R_PPC_GOT_DTPREL16_HA : constant := 94;  --  /usr/include/elf.h:2458
   R_PPC_TLSGD : constant := 95;  --  /usr/include/elf.h:2459
   R_PPC_TLSLD : constant := 96;  --  /usr/include/elf.h:2460

   R_PPC_EMB_NADDR32 : constant := 101;  --  /usr/include/elf.h:2464
   R_PPC_EMB_NADDR16 : constant := 102;  --  /usr/include/elf.h:2465
   R_PPC_EMB_NADDR16_LO : constant := 103;  --  /usr/include/elf.h:2466
   R_PPC_EMB_NADDR16_HI : constant := 104;  --  /usr/include/elf.h:2467
   R_PPC_EMB_NADDR16_HA : constant := 105;  --  /usr/include/elf.h:2468
   R_PPC_EMB_SDAI16 : constant := 106;  --  /usr/include/elf.h:2469
   R_PPC_EMB_SDA2I16 : constant := 107;  --  /usr/include/elf.h:2470
   R_PPC_EMB_SDA2REL : constant := 108;  --  /usr/include/elf.h:2471
   R_PPC_EMB_SDA21 : constant := 109;  --  /usr/include/elf.h:2472
   R_PPC_EMB_MRKREF : constant := 110;  --  /usr/include/elf.h:2473
   R_PPC_EMB_RELSEC16 : constant := 111;  --  /usr/include/elf.h:2474
   R_PPC_EMB_RELST_LO : constant := 112;  --  /usr/include/elf.h:2475
   R_PPC_EMB_RELST_HI : constant := 113;  --  /usr/include/elf.h:2476
   R_PPC_EMB_RELST_HA : constant := 114;  --  /usr/include/elf.h:2477
   R_PPC_EMB_BIT_FLD : constant := 115;  --  /usr/include/elf.h:2478
   R_PPC_EMB_RELSDA : constant := 116;  --  /usr/include/elf.h:2479

   R_PPC_DIAB_SDA21_LO : constant := 180;  --  /usr/include/elf.h:2482
   R_PPC_DIAB_SDA21_HI : constant := 181;  --  /usr/include/elf.h:2483
   R_PPC_DIAB_SDA21_HA : constant := 182;  --  /usr/include/elf.h:2484
   R_PPC_DIAB_RELSDA_LO : constant := 183;  --  /usr/include/elf.h:2485
   R_PPC_DIAB_RELSDA_HI : constant := 184;  --  /usr/include/elf.h:2486
   R_PPC_DIAB_RELSDA_HA : constant := 185;  --  /usr/include/elf.h:2487

   R_PPC_IRELATIVE : constant := 248;  --  /usr/include/elf.h:2490

   R_PPC_REL16 : constant := 249;  --  /usr/include/elf.h:2493
   R_PPC_REL16_LO : constant := 250;  --  /usr/include/elf.h:2494
   R_PPC_REL16_HI : constant := 251;  --  /usr/include/elf.h:2495
   R_PPC_REL16_HA : constant := 252;  --  /usr/include/elf.h:2496

   R_PPC_TOC16 : constant := 255;  --  /usr/include/elf.h:2500
   --  unsupported macro: DT_PPC_GOT (DT_LOPROC + 0)
   --  unsupported macro: DT_PPC_OPT (DT_LOPROC + 1)

   DT_PPC_NUM : constant := 2;  --  /usr/include/elf.h:2505

   PPC_OPT_TLS : constant := 1;  --  /usr/include/elf.h:2508
   --  unsupported macro: R_PPC64_NONE R_PPC_NONE
   --  unsupported macro: R_PPC64_ADDR32 R_PPC_ADDR32
   --  unsupported macro: R_PPC64_ADDR24 R_PPC_ADDR24
   --  unsupported macro: R_PPC64_ADDR16 R_PPC_ADDR16
   --  unsupported macro: R_PPC64_ADDR16_LO R_PPC_ADDR16_LO
   --  unsupported macro: R_PPC64_ADDR16_HI R_PPC_ADDR16_HI
   --  unsupported macro: R_PPC64_ADDR16_HA R_PPC_ADDR16_HA
   --  unsupported macro: R_PPC64_ADDR14 R_PPC_ADDR14
   --  unsupported macro: R_PPC64_ADDR14_BRTAKEN R_PPC_ADDR14_BRTAKEN
   --  unsupported macro: R_PPC64_ADDR14_BRNTAKEN R_PPC_ADDR14_BRNTAKEN
   --  unsupported macro: R_PPC64_REL24 R_PPC_REL24
   --  unsupported macro: R_PPC64_REL14 R_PPC_REL14
   --  unsupported macro: R_PPC64_REL14_BRTAKEN R_PPC_REL14_BRTAKEN
   --  unsupported macro: R_PPC64_REL14_BRNTAKEN R_PPC_REL14_BRNTAKEN
   --  unsupported macro: R_PPC64_GOT16 R_PPC_GOT16
   --  unsupported macro: R_PPC64_GOT16_LO R_PPC_GOT16_LO
   --  unsupported macro: R_PPC64_GOT16_HI R_PPC_GOT16_HI
   --  unsupported macro: R_PPC64_GOT16_HA R_PPC_GOT16_HA
   --  unsupported macro: R_PPC64_COPY R_PPC_COPY
   --  unsupported macro: R_PPC64_GLOB_DAT R_PPC_GLOB_DAT
   --  unsupported macro: R_PPC64_JMP_SLOT R_PPC_JMP_SLOT
   --  unsupported macro: R_PPC64_RELATIVE R_PPC_RELATIVE
   --  unsupported macro: R_PPC64_UADDR32 R_PPC_UADDR32
   --  unsupported macro: R_PPC64_UADDR16 R_PPC_UADDR16
   --  unsupported macro: R_PPC64_REL32 R_PPC_REL32
   --  unsupported macro: R_PPC64_PLT32 R_PPC_PLT32
   --  unsupported macro: R_PPC64_PLTREL32 R_PPC_PLTREL32
   --  unsupported macro: R_PPC64_PLT16_LO R_PPC_PLT16_LO
   --  unsupported macro: R_PPC64_PLT16_HI R_PPC_PLT16_HI
   --  unsupported macro: R_PPC64_PLT16_HA R_PPC_PLT16_HA
   --  unsupported macro: R_PPC64_SECTOFF R_PPC_SECTOFF
   --  unsupported macro: R_PPC64_SECTOFF_LO R_PPC_SECTOFF_LO
   --  unsupported macro: R_PPC64_SECTOFF_HI R_PPC_SECTOFF_HI
   --  unsupported macro: R_PPC64_SECTOFF_HA R_PPC_SECTOFF_HA

   R_PPC64_ADDR30 : constant := 37;  --  /usr/include/elf.h:2548
   R_PPC64_ADDR64 : constant := 38;  --  /usr/include/elf.h:2549
   R_PPC64_ADDR16_HIGHER : constant := 39;  --  /usr/include/elf.h:2550
   R_PPC64_ADDR16_HIGHERA : constant := 40;  --  /usr/include/elf.h:2551
   R_PPC64_ADDR16_HIGHEST : constant := 41;  --  /usr/include/elf.h:2552
   R_PPC64_ADDR16_HIGHESTA : constant := 42;  --  /usr/include/elf.h:2553
   R_PPC64_UADDR64 : constant := 43;  --  /usr/include/elf.h:2554
   R_PPC64_REL64 : constant := 44;  --  /usr/include/elf.h:2555
   R_PPC64_PLT64 : constant := 45;  --  /usr/include/elf.h:2556
   R_PPC64_PLTREL64 : constant := 46;  --  /usr/include/elf.h:2557
   R_PPC64_TOC16 : constant := 47;  --  /usr/include/elf.h:2558
   R_PPC64_TOC16_LO : constant := 48;  --  /usr/include/elf.h:2559
   R_PPC64_TOC16_HI : constant := 49;  --  /usr/include/elf.h:2560
   R_PPC64_TOC16_HA : constant := 50;  --  /usr/include/elf.h:2561
   R_PPC64_TOC : constant := 51;  --  /usr/include/elf.h:2562
   R_PPC64_PLTGOT16 : constant := 52;  --  /usr/include/elf.h:2563
   R_PPC64_PLTGOT16_LO : constant := 53;  --  /usr/include/elf.h:2564
   R_PPC64_PLTGOT16_HI : constant := 54;  --  /usr/include/elf.h:2565
   R_PPC64_PLTGOT16_HA : constant := 55;  --  /usr/include/elf.h:2566

   R_PPC64_ADDR16_DS : constant := 56;  --  /usr/include/elf.h:2568
   R_PPC64_ADDR16_LO_DS : constant := 57;  --  /usr/include/elf.h:2569
   R_PPC64_GOT16_DS : constant := 58;  --  /usr/include/elf.h:2570
   R_PPC64_GOT16_LO_DS : constant := 59;  --  /usr/include/elf.h:2571
   R_PPC64_PLT16_LO_DS : constant := 60;  --  /usr/include/elf.h:2572
   R_PPC64_SECTOFF_DS : constant := 61;  --  /usr/include/elf.h:2573
   R_PPC64_SECTOFF_LO_DS : constant := 62;  --  /usr/include/elf.h:2574
   R_PPC64_TOC16_DS : constant := 63;  --  /usr/include/elf.h:2575
   R_PPC64_TOC16_LO_DS : constant := 64;  --  /usr/include/elf.h:2576
   R_PPC64_PLTGOT16_DS : constant := 65;  --  /usr/include/elf.h:2577
   R_PPC64_PLTGOT16_LO_DS : constant := 66;  --  /usr/include/elf.h:2578

   R_PPC64_TLS : constant := 67;  --  /usr/include/elf.h:2581
   R_PPC64_DTPMOD64 : constant := 68;  --  /usr/include/elf.h:2582
   R_PPC64_TPREL16 : constant := 69;  --  /usr/include/elf.h:2583
   R_PPC64_TPREL16_LO : constant := 70;  --  /usr/include/elf.h:2584
   R_PPC64_TPREL16_HI : constant := 71;  --  /usr/include/elf.h:2585
   R_PPC64_TPREL16_HA : constant := 72;  --  /usr/include/elf.h:2586
   R_PPC64_TPREL64 : constant := 73;  --  /usr/include/elf.h:2587
   R_PPC64_DTPREL16 : constant := 74;  --  /usr/include/elf.h:2588
   R_PPC64_DTPREL16_LO : constant := 75;  --  /usr/include/elf.h:2589
   R_PPC64_DTPREL16_HI : constant := 76;  --  /usr/include/elf.h:2590
   R_PPC64_DTPREL16_HA : constant := 77;  --  /usr/include/elf.h:2591
   R_PPC64_DTPREL64 : constant := 78;  --  /usr/include/elf.h:2592
   R_PPC64_GOT_TLSGD16 : constant := 79;  --  /usr/include/elf.h:2593
   R_PPC64_GOT_TLSGD16_LO : constant := 80;  --  /usr/include/elf.h:2594
   R_PPC64_GOT_TLSGD16_HI : constant := 81;  --  /usr/include/elf.h:2595
   R_PPC64_GOT_TLSGD16_HA : constant := 82;  --  /usr/include/elf.h:2596
   R_PPC64_GOT_TLSLD16 : constant := 83;  --  /usr/include/elf.h:2597
   R_PPC64_GOT_TLSLD16_LO : constant := 84;  --  /usr/include/elf.h:2598
   R_PPC64_GOT_TLSLD16_HI : constant := 85;  --  /usr/include/elf.h:2599
   R_PPC64_GOT_TLSLD16_HA : constant := 86;  --  /usr/include/elf.h:2600
   R_PPC64_GOT_TPREL16_DS : constant := 87;  --  /usr/include/elf.h:2601
   R_PPC64_GOT_TPREL16_LO_DS : constant := 88;  --  /usr/include/elf.h:2602
   R_PPC64_GOT_TPREL16_HI : constant := 89;  --  /usr/include/elf.h:2603
   R_PPC64_GOT_TPREL16_HA : constant := 90;  --  /usr/include/elf.h:2604
   R_PPC64_GOT_DTPREL16_DS : constant := 91;  --  /usr/include/elf.h:2605
   R_PPC64_GOT_DTPREL16_LO_DS : constant := 92;  --  /usr/include/elf.h:2606
   R_PPC64_GOT_DTPREL16_HI : constant := 93;  --  /usr/include/elf.h:2607
   R_PPC64_GOT_DTPREL16_HA : constant := 94;  --  /usr/include/elf.h:2608
   R_PPC64_TPREL16_DS : constant := 95;  --  /usr/include/elf.h:2609
   R_PPC64_TPREL16_LO_DS : constant := 96;  --  /usr/include/elf.h:2610
   R_PPC64_TPREL16_HIGHER : constant := 97;  --  /usr/include/elf.h:2611
   R_PPC64_TPREL16_HIGHERA : constant := 98;  --  /usr/include/elf.h:2612
   R_PPC64_TPREL16_HIGHEST : constant := 99;  --  /usr/include/elf.h:2613
   R_PPC64_TPREL16_HIGHESTA : constant := 100;  --  /usr/include/elf.h:2614
   R_PPC64_DTPREL16_DS : constant := 101;  --  /usr/include/elf.h:2615
   R_PPC64_DTPREL16_LO_DS : constant := 102;  --  /usr/include/elf.h:2616
   R_PPC64_DTPREL16_HIGHER : constant := 103;  --  /usr/include/elf.h:2617
   R_PPC64_DTPREL16_HIGHERA : constant := 104;  --  /usr/include/elf.h:2618
   R_PPC64_DTPREL16_HIGHEST : constant := 105;  --  /usr/include/elf.h:2619
   R_PPC64_DTPREL16_HIGHESTA : constant := 106;  --  /usr/include/elf.h:2620
   R_PPC64_TLSGD : constant := 107;  --  /usr/include/elf.h:2621
   R_PPC64_TLSLD : constant := 108;  --  /usr/include/elf.h:2622
   R_PPC64_TOCSAVE : constant := 109;  --  /usr/include/elf.h:2623

   R_PPC64_ADDR16_HIGH : constant := 110;  --  /usr/include/elf.h:2626
   R_PPC64_ADDR16_HIGHA : constant := 111;  --  /usr/include/elf.h:2627
   R_PPC64_TPREL16_HIGH : constant := 112;  --  /usr/include/elf.h:2628
   R_PPC64_TPREL16_HIGHA : constant := 113;  --  /usr/include/elf.h:2629
   R_PPC64_DTPREL16_HIGH : constant := 114;  --  /usr/include/elf.h:2630
   R_PPC64_DTPREL16_HIGHA : constant := 115;  --  /usr/include/elf.h:2631

   R_PPC64_JMP_IREL : constant := 247;  --  /usr/include/elf.h:2634
   R_PPC64_IRELATIVE : constant := 248;  --  /usr/include/elf.h:2635
   R_PPC64_REL16 : constant := 249;  --  /usr/include/elf.h:2636
   R_PPC64_REL16_LO : constant := 250;  --  /usr/include/elf.h:2637
   R_PPC64_REL16_HI : constant := 251;  --  /usr/include/elf.h:2638
   R_PPC64_REL16_HA : constant := 252;  --  /usr/include/elf.h:2639

   EF_PPC64_ABI : constant := 3;  --  /usr/include/elf.h:2645
   --  unsupported macro: DT_PPC64_GLINK (DT_LOPROC + 0)
   --  unsupported macro: DT_PPC64_OPD (DT_LOPROC + 1)
   --  unsupported macro: DT_PPC64_OPDSZ (DT_LOPROC + 2)
   --  unsupported macro: DT_PPC64_OPT (DT_LOPROC + 3)

   DT_PPC64_NUM : constant := 4;  --  /usr/include/elf.h:2652

   PPC64_OPT_TLS : constant := 1;  --  /usr/include/elf.h:2655
   PPC64_OPT_MULTI_TOC : constant := 2;  --  /usr/include/elf.h:2656
   PPC64_OPT_LOCALENTRY : constant := 4;  --  /usr/include/elf.h:2657

   STO_PPC64_LOCAL_BIT : constant := 5;  --  /usr/include/elf.h:2660
   --  unsupported macro: STO_PPC64_LOCAL_MASK (7 << STO_PPC64_LOCAL_BIT)
   --  arg-macro: function PPC64_LOCAL_ENTRY_OFFSET (other)
   --    return ((2 ** (((other) and STO_PPC64_LOCAL_MASK) >> STO_PPC64_LOCAL_BIT)) >> 2) << 2;

   EF_ARM_RELEXEC : constant := 16#01#;  --  /usr/include/elf.h:2669
   EF_ARM_HASENTRY : constant := 16#02#;  --  /usr/include/elf.h:2670
   EF_ARM_INTERWORK : constant := 16#04#;  --  /usr/include/elf.h:2671
   EF_ARM_APCS_26 : constant := 16#08#;  --  /usr/include/elf.h:2672
   EF_ARM_APCS_FLOAT : constant := 16#10#;  --  /usr/include/elf.h:2673
   EF_ARM_PIC : constant := 16#20#;  --  /usr/include/elf.h:2674
   EF_ARM_ALIGN8 : constant := 16#40#;  --  /usr/include/elf.h:2675
   EF_ARM_NEW_ABI : constant := 16#80#;  --  /usr/include/elf.h:2676
   EF_ARM_OLD_ABI : constant := 16#100#;  --  /usr/include/elf.h:2677
   EF_ARM_SOFT_FLOAT : constant := 16#200#;  --  /usr/include/elf.h:2678
   EF_ARM_VFP_FLOAT : constant := 16#400#;  --  /usr/include/elf.h:2679
   EF_ARM_MAVERICK_FLOAT : constant := 16#800#;  --  /usr/include/elf.h:2680

   EF_ARM_ABI_FLOAT_SOFT : constant := 16#200#;  --  /usr/include/elf.h:2682
   EF_ARM_ABI_FLOAT_HARD : constant := 16#400#;  --  /usr/include/elf.h:2683

   EF_ARM_SYMSARESORTED : constant := 16#04#;  --  /usr/include/elf.h:2688
   EF_ARM_DYNSYMSUSESEGIDX : constant := 16#08#;  --  /usr/include/elf.h:2689
   EF_ARM_MAPSYMSFIRST : constant := 16#10#;  --  /usr/include/elf.h:2690
   EF_ARM_EABIMASK : constant := 16#FF000000#;  --  /usr/include/elf.h:2691

   EF_ARM_BE8 : constant := 16#00800000#;  --  /usr/include/elf.h:2694
   EF_ARM_LE8 : constant := 16#00400000#;  --  /usr/include/elf.h:2695
   --  arg-macro: function EF_ARM_EABI_VERSION (flags)
   --    return (flags) and EF_ARM_EABIMASK;

   EF_ARM_EABI_UNKNOWN : constant := 16#00000000#;  --  /usr/include/elf.h:2698
   EF_ARM_EABI_VER1 : constant := 16#01000000#;  --  /usr/include/elf.h:2699
   EF_ARM_EABI_VER2 : constant := 16#02000000#;  --  /usr/include/elf.h:2700
   EF_ARM_EABI_VER3 : constant := 16#03000000#;  --  /usr/include/elf.h:2701
   EF_ARM_EABI_VER4 : constant := 16#04000000#;  --  /usr/include/elf.h:2702
   EF_ARM_EABI_VER5 : constant := 16#05000000#;  --  /usr/include/elf.h:2703
   --  unsupported macro: STT_ARM_TFUNC STT_LOPROC
   --  unsupported macro: STT_ARM_16BIT STT_HIPROC

   SHF_ARM_ENTRYSECT : constant := 16#10000000#;  --  /usr/include/elf.h:2710
   SHF_ARM_COMDEF : constant := 16#80000000#;  --  /usr/include/elf.h:2711

   PF_ARM_SB : constant := 16#10000000#;  --  /usr/include/elf.h:2715

   PF_ARM_PI : constant := 16#20000000#;  --  /usr/include/elf.h:2717
   PF_ARM_ABS : constant := 16#40000000#;  --  /usr/include/elf.h:2718
   --  unsupported macro: PT_ARM_EXIDX (PT_LOPROC + 1)
   --  unsupported macro: SHT_ARM_EXIDX (SHT_LOPROC + 1)
   --  unsupported macro: SHT_ARM_PREEMPTMAP (SHT_LOPROC + 2)
   --  unsupported macro: SHT_ARM_ATTRIBUTES (SHT_LOPROC + 3)

   R_AARCH64_NONE : constant := 0;  --  /usr/include/elf.h:2731

   R_AARCH64_P32_ABS32 : constant := 1;  --  /usr/include/elf.h:2734
   R_AARCH64_P32_COPY : constant := 180;  --  /usr/include/elf.h:2735
   R_AARCH64_P32_GLOB_DAT : constant := 181;  --  /usr/include/elf.h:2736
   R_AARCH64_P32_JUMP_SLOT : constant := 182;  --  /usr/include/elf.h:2737
   R_AARCH64_P32_RELATIVE : constant := 183;  --  /usr/include/elf.h:2738
   R_AARCH64_P32_TLS_DTPMOD : constant := 184;  --  /usr/include/elf.h:2739
   R_AARCH64_P32_TLS_DTPREL : constant := 185;  --  /usr/include/elf.h:2740
   R_AARCH64_P32_TLS_TPREL : constant := 186;  --  /usr/include/elf.h:2741
   R_AARCH64_P32_TLSDESC : constant := 187;  --  /usr/include/elf.h:2742
   R_AARCH64_P32_IRELATIVE : constant := 188;  --  /usr/include/elf.h:2743

   R_AARCH64_ABS64 : constant := 257;  --  /usr/include/elf.h:2746
   R_AARCH64_ABS32 : constant := 258;  --  /usr/include/elf.h:2747
   R_AARCH64_ABS16 : constant := 259;  --  /usr/include/elf.h:2748
   R_AARCH64_PREL64 : constant := 260;  --  /usr/include/elf.h:2749
   R_AARCH64_PREL32 : constant := 261;  --  /usr/include/elf.h:2750
   R_AARCH64_PREL16 : constant := 262;  --  /usr/include/elf.h:2751
   R_AARCH64_MOVW_UABS_G0 : constant := 263;  --  /usr/include/elf.h:2752
   R_AARCH64_MOVW_UABS_G0_NC : constant := 264;  --  /usr/include/elf.h:2753
   R_AARCH64_MOVW_UABS_G1 : constant := 265;  --  /usr/include/elf.h:2754
   R_AARCH64_MOVW_UABS_G1_NC : constant := 266;  --  /usr/include/elf.h:2755
   R_AARCH64_MOVW_UABS_G2 : constant := 267;  --  /usr/include/elf.h:2756
   R_AARCH64_MOVW_UABS_G2_NC : constant := 268;  --  /usr/include/elf.h:2757
   R_AARCH64_MOVW_UABS_G3 : constant := 269;  --  /usr/include/elf.h:2758
   R_AARCH64_MOVW_SABS_G0 : constant := 270;  --  /usr/include/elf.h:2759
   R_AARCH64_MOVW_SABS_G1 : constant := 271;  --  /usr/include/elf.h:2760
   R_AARCH64_MOVW_SABS_G2 : constant := 272;  --  /usr/include/elf.h:2761
   R_AARCH64_LD_PREL_LO19 : constant := 273;  --  /usr/include/elf.h:2762
   R_AARCH64_ADR_PREL_LO21 : constant := 274;  --  /usr/include/elf.h:2763
   R_AARCH64_ADR_PREL_PG_HI21 : constant := 275;  --  /usr/include/elf.h:2764
   R_AARCH64_ADR_PREL_PG_HI21_NC : constant := 276;  --  /usr/include/elf.h:2765
   R_AARCH64_ADD_ABS_LO12_NC : constant := 277;  --  /usr/include/elf.h:2766
   R_AARCH64_LDST8_ABS_LO12_NC : constant := 278;  --  /usr/include/elf.h:2767
   R_AARCH64_TSTBR14 : constant := 279;  --  /usr/include/elf.h:2768
   R_AARCH64_CONDBR19 : constant := 280;  --  /usr/include/elf.h:2769
   R_AARCH64_JUMP26 : constant := 282;  --  /usr/include/elf.h:2770
   R_AARCH64_CALL26 : constant := 283;  --  /usr/include/elf.h:2771
   R_AARCH64_LDST16_ABS_LO12_NC : constant := 284;  --  /usr/include/elf.h:2772
   R_AARCH64_LDST32_ABS_LO12_NC : constant := 285;  --  /usr/include/elf.h:2773
   R_AARCH64_LDST64_ABS_LO12_NC : constant := 286;  --  /usr/include/elf.h:2774
   R_AARCH64_MOVW_PREL_G0 : constant := 287;  --  /usr/include/elf.h:2775
   R_AARCH64_MOVW_PREL_G0_NC : constant := 288;  --  /usr/include/elf.h:2776
   R_AARCH64_MOVW_PREL_G1 : constant := 289;  --  /usr/include/elf.h:2777
   R_AARCH64_MOVW_PREL_G1_NC : constant := 290;  --  /usr/include/elf.h:2778
   R_AARCH64_MOVW_PREL_G2 : constant := 291;  --  /usr/include/elf.h:2779
   R_AARCH64_MOVW_PREL_G2_NC : constant := 292;  --  /usr/include/elf.h:2780
   R_AARCH64_MOVW_PREL_G3 : constant := 293;  --  /usr/include/elf.h:2781
   R_AARCH64_LDST128_ABS_LO12_NC : constant := 299;  --  /usr/include/elf.h:2782
   R_AARCH64_MOVW_GOTOFF_G0 : constant := 300;  --  /usr/include/elf.h:2783
   R_AARCH64_MOVW_GOTOFF_G0_NC : constant := 301;  --  /usr/include/elf.h:2784
   R_AARCH64_MOVW_GOTOFF_G1 : constant := 302;  --  /usr/include/elf.h:2785
   R_AARCH64_MOVW_GOTOFF_G1_NC : constant := 303;  --  /usr/include/elf.h:2786
   R_AARCH64_MOVW_GOTOFF_G2 : constant := 304;  --  /usr/include/elf.h:2787
   R_AARCH64_MOVW_GOTOFF_G2_NC : constant := 305;  --  /usr/include/elf.h:2788
   R_AARCH64_MOVW_GOTOFF_G3 : constant := 306;  --  /usr/include/elf.h:2789
   R_AARCH64_GOTREL64 : constant := 307;  --  /usr/include/elf.h:2790
   R_AARCH64_GOTREL32 : constant := 308;  --  /usr/include/elf.h:2791
   R_AARCH64_GOT_LD_PREL19 : constant := 309;  --  /usr/include/elf.h:2792
   R_AARCH64_LD64_GOTOFF_LO15 : constant := 310;  --  /usr/include/elf.h:2793
   R_AARCH64_ADR_GOT_PAGE : constant := 311;  --  /usr/include/elf.h:2794
   R_AARCH64_LD64_GOT_LO12_NC : constant := 312;  --  /usr/include/elf.h:2795
   R_AARCH64_LD64_GOTPAGE_LO15 : constant := 313;  --  /usr/include/elf.h:2796
   R_AARCH64_TLSGD_ADR_PREL21 : constant := 512;  --  /usr/include/elf.h:2797
   R_AARCH64_TLSGD_ADR_PAGE21 : constant := 513;  --  /usr/include/elf.h:2798
   R_AARCH64_TLSGD_ADD_LO12_NC : constant := 514;  --  /usr/include/elf.h:2799
   R_AARCH64_TLSGD_MOVW_G1 : constant := 515;  --  /usr/include/elf.h:2800
   R_AARCH64_TLSGD_MOVW_G0_NC : constant := 516;  --  /usr/include/elf.h:2801
   R_AARCH64_TLSLD_ADR_PREL21 : constant := 517;  --  /usr/include/elf.h:2802
   R_AARCH64_TLSLD_ADR_PAGE21 : constant := 518;  --  /usr/include/elf.h:2803
   R_AARCH64_TLSLD_ADD_LO12_NC : constant := 519;  --  /usr/include/elf.h:2804
   R_AARCH64_TLSLD_MOVW_G1 : constant := 520;  --  /usr/include/elf.h:2805
   R_AARCH64_TLSLD_MOVW_G0_NC : constant := 521;  --  /usr/include/elf.h:2806
   R_AARCH64_TLSLD_LD_PREL19 : constant := 522;  --  /usr/include/elf.h:2807
   R_AARCH64_TLSLD_MOVW_DTPREL_G2 : constant := 523;  --  /usr/include/elf.h:2808
   R_AARCH64_TLSLD_MOVW_DTPREL_G1 : constant := 524;  --  /usr/include/elf.h:2809
   R_AARCH64_TLSLD_MOVW_DTPREL_G1_NC : constant := 525;  --  /usr/include/elf.h:2810
   R_AARCH64_TLSLD_MOVW_DTPREL_G0 : constant := 526;  --  /usr/include/elf.h:2811
   R_AARCH64_TLSLD_MOVW_DTPREL_G0_NC : constant := 527;  --  /usr/include/elf.h:2812
   R_AARCH64_TLSLD_ADD_DTPREL_HI12 : constant := 528;  --  /usr/include/elf.h:2813
   R_AARCH64_TLSLD_ADD_DTPREL_LO12 : constant := 529;  --  /usr/include/elf.h:2814
   R_AARCH64_TLSLD_ADD_DTPREL_LO12_NC : constant := 530;  --  /usr/include/elf.h:2815
   R_AARCH64_TLSLD_LDST8_DTPREL_LO12 : constant := 531;  --  /usr/include/elf.h:2816
   R_AARCH64_TLSLD_LDST8_DTPREL_LO12_NC : constant := 532;  --  /usr/include/elf.h:2817
   R_AARCH64_TLSLD_LDST16_DTPREL_LO12 : constant := 533;  --  /usr/include/elf.h:2818
   R_AARCH64_TLSLD_LDST16_DTPREL_LO12_NC : constant := 534;  --  /usr/include/elf.h:2819
   R_AARCH64_TLSLD_LDST32_DTPREL_LO12 : constant := 535;  --  /usr/include/elf.h:2820
   R_AARCH64_TLSLD_LDST32_DTPREL_LO12_NC : constant := 536;  --  /usr/include/elf.h:2821
   R_AARCH64_TLSLD_LDST64_DTPREL_LO12 : constant := 537;  --  /usr/include/elf.h:2822
   R_AARCH64_TLSLD_LDST64_DTPREL_LO12_NC : constant := 538;  --  /usr/include/elf.h:2823
   R_AARCH64_TLSIE_MOVW_GOTTPREL_G1 : constant := 539;  --  /usr/include/elf.h:2824
   R_AARCH64_TLSIE_MOVW_GOTTPREL_G0_NC : constant := 540;  --  /usr/include/elf.h:2825
   R_AARCH64_TLSIE_ADR_GOTTPREL_PAGE21 : constant := 541;  --  /usr/include/elf.h:2826
   R_AARCH64_TLSIE_LD64_GOTTPREL_LO12_NC : constant := 542;  --  /usr/include/elf.h:2827
   R_AARCH64_TLSIE_LD_GOTTPREL_PREL19 : constant := 543;  --  /usr/include/elf.h:2828
   R_AARCH64_TLSLE_MOVW_TPREL_G2 : constant := 544;  --  /usr/include/elf.h:2829
   R_AARCH64_TLSLE_MOVW_TPREL_G1 : constant := 545;  --  /usr/include/elf.h:2830
   R_AARCH64_TLSLE_MOVW_TPREL_G1_NC : constant := 546;  --  /usr/include/elf.h:2831
   R_AARCH64_TLSLE_MOVW_TPREL_G0 : constant := 547;  --  /usr/include/elf.h:2832
   R_AARCH64_TLSLE_MOVW_TPREL_G0_NC : constant := 548;  --  /usr/include/elf.h:2833
   R_AARCH64_TLSLE_ADD_TPREL_HI12 : constant := 549;  --  /usr/include/elf.h:2834
   R_AARCH64_TLSLE_ADD_TPREL_LO12 : constant := 550;  --  /usr/include/elf.h:2835
   R_AARCH64_TLSLE_ADD_TPREL_LO12_NC : constant := 551;  --  /usr/include/elf.h:2836
   R_AARCH64_TLSLE_LDST8_TPREL_LO12 : constant := 552;  --  /usr/include/elf.h:2837
   R_AARCH64_TLSLE_LDST8_TPREL_LO12_NC : constant := 553;  --  /usr/include/elf.h:2838
   R_AARCH64_TLSLE_LDST16_TPREL_LO12 : constant := 554;  --  /usr/include/elf.h:2839
   R_AARCH64_TLSLE_LDST16_TPREL_LO12_NC : constant := 555;  --  /usr/include/elf.h:2840
   R_AARCH64_TLSLE_LDST32_TPREL_LO12 : constant := 556;  --  /usr/include/elf.h:2841
   R_AARCH64_TLSLE_LDST32_TPREL_LO12_NC : constant := 557;  --  /usr/include/elf.h:2842
   R_AARCH64_TLSLE_LDST64_TPREL_LO12 : constant := 558;  --  /usr/include/elf.h:2843
   R_AARCH64_TLSLE_LDST64_TPREL_LO12_NC : constant := 559;  --  /usr/include/elf.h:2844
   R_AARCH64_TLSDESC_LD_PREL19 : constant := 560;  --  /usr/include/elf.h:2845
   R_AARCH64_TLSDESC_ADR_PREL21 : constant := 561;  --  /usr/include/elf.h:2846
   R_AARCH64_TLSDESC_ADR_PAGE21 : constant := 562;  --  /usr/include/elf.h:2847
   R_AARCH64_TLSDESC_LD64_LO12 : constant := 563;  --  /usr/include/elf.h:2848
   R_AARCH64_TLSDESC_ADD_LO12 : constant := 564;  --  /usr/include/elf.h:2849
   R_AARCH64_TLSDESC_OFF_G1 : constant := 565;  --  /usr/include/elf.h:2850
   R_AARCH64_TLSDESC_OFF_G0_NC : constant := 566;  --  /usr/include/elf.h:2851
   R_AARCH64_TLSDESC_LDR : constant := 567;  --  /usr/include/elf.h:2852
   R_AARCH64_TLSDESC_ADD : constant := 568;  --  /usr/include/elf.h:2853
   R_AARCH64_TLSDESC_CALL : constant := 569;  --  /usr/include/elf.h:2854
   R_AARCH64_TLSLE_LDST128_TPREL_LO12 : constant := 570;  --  /usr/include/elf.h:2855
   R_AARCH64_TLSLE_LDST128_TPREL_LO12_NC : constant := 571;  --  /usr/include/elf.h:2856
   R_AARCH64_TLSLD_LDST128_DTPREL_LO12 : constant := 572;  --  /usr/include/elf.h:2857
   R_AARCH64_TLSLD_LDST128_DTPREL_LO12_NC : constant := 573;  --  /usr/include/elf.h:2858
   R_AARCH64_COPY : constant := 1024;  --  /usr/include/elf.h:2859
   R_AARCH64_GLOB_DAT : constant := 1025;  --  /usr/include/elf.h:2860
   R_AARCH64_JUMP_SLOT : constant := 1026;  --  /usr/include/elf.h:2861
   R_AARCH64_RELATIVE : constant := 1027;  --  /usr/include/elf.h:2862
   R_AARCH64_TLS_DTPMOD : constant := 1028;  --  /usr/include/elf.h:2863
   R_AARCH64_TLS_DTPREL : constant := 1029;  --  /usr/include/elf.h:2864
   R_AARCH64_TLS_TPREL : constant := 1030;  --  /usr/include/elf.h:2865
   R_AARCH64_TLSDESC : constant := 1031;  --  /usr/include/elf.h:2866
   R_AARCH64_IRELATIVE : constant := 1032;  --  /usr/include/elf.h:2867
   --  unsupported macro: DT_AARCH64_BTI_PLT (DT_LOPROC + 1)
   --  unsupported macro: DT_AARCH64_PAC_PLT (DT_LOPROC + 3)
   --  unsupported macro: DT_AARCH64_VARIANT_PCS (DT_LOPROC + 5)

   DT_AARCH64_NUM : constant := 6;  --  /usr/include/elf.h:2873

   STO_AARCH64_VARIANT_PCS : constant := 16#80#;  --  /usr/include/elf.h:2876

   R_ARM_NONE : constant := 0;  --  /usr/include/elf.h:2880
   R_ARM_PC24 : constant := 1;  --  /usr/include/elf.h:2881

   R_ARM_ABS32 : constant := 2;  --  /usr/include/elf.h:2883
   R_ARM_REL32 : constant := 3;  --  /usr/include/elf.h:2884
   R_ARM_PC13 : constant := 4;  --  /usr/include/elf.h:2885
   R_ARM_ABS16 : constant := 5;  --  /usr/include/elf.h:2886
   R_ARM_ABS12 : constant := 6;  --  /usr/include/elf.h:2887
   R_ARM_THM_ABS5 : constant := 7;  --  /usr/include/elf.h:2888
   R_ARM_ABS8 : constant := 8;  --  /usr/include/elf.h:2889
   R_ARM_SBREL32 : constant := 9;  --  /usr/include/elf.h:2890
   R_ARM_THM_PC22 : constant := 10;  --  /usr/include/elf.h:2891
   R_ARM_THM_PC8 : constant := 11;  --  /usr/include/elf.h:2892

   R_ARM_AMP_VCALL9 : constant := 12;  --  /usr/include/elf.h:2894
   R_ARM_SWI24 : constant := 13;  --  /usr/include/elf.h:2895
   R_ARM_TLS_DESC : constant := 13;  --  /usr/include/elf.h:2896
   R_ARM_THM_SWI8 : constant := 14;  --  /usr/include/elf.h:2897
   R_ARM_XPC25 : constant := 15;  --  /usr/include/elf.h:2898
   R_ARM_THM_XPC22 : constant := 16;  --  /usr/include/elf.h:2899
   R_ARM_TLS_DTPMOD32 : constant := 17;  --  /usr/include/elf.h:2900
   R_ARM_TLS_DTPOFF32 : constant := 18;  --  /usr/include/elf.h:2901
   R_ARM_TLS_TPOFF32 : constant := 19;  --  /usr/include/elf.h:2902
   R_ARM_COPY : constant := 20;  --  /usr/include/elf.h:2903
   R_ARM_GLOB_DAT : constant := 21;  --  /usr/include/elf.h:2904
   R_ARM_JUMP_SLOT : constant := 22;  --  /usr/include/elf.h:2905
   R_ARM_RELATIVE : constant := 23;  --  /usr/include/elf.h:2906
   R_ARM_GOTOFF : constant := 24;  --  /usr/include/elf.h:2907
   R_ARM_GOTPC : constant := 25;  --  /usr/include/elf.h:2908
   R_ARM_GOT32 : constant := 26;  --  /usr/include/elf.h:2909
   R_ARM_PLT32 : constant := 27;  --  /usr/include/elf.h:2910
   R_ARM_CALL : constant := 28;  --  /usr/include/elf.h:2911
   R_ARM_JUMP24 : constant := 29;  --  /usr/include/elf.h:2912

   R_ARM_THM_JUMP24 : constant := 30;  --  /usr/include/elf.h:2914
   R_ARM_BASE_ABS : constant := 31;  --  /usr/include/elf.h:2915
   R_ARM_ALU_PCREL_7_0 : constant := 32;  --  /usr/include/elf.h:2916
   R_ARM_ALU_PCREL_15_8 : constant := 33;  --  /usr/include/elf.h:2917
   R_ARM_ALU_PCREL_23_15 : constant := 34;  --  /usr/include/elf.h:2918
   R_ARM_LDR_SBREL_11_0 : constant := 35;  --  /usr/include/elf.h:2919
   R_ARM_ALU_SBREL_19_12 : constant := 36;  --  /usr/include/elf.h:2920
   R_ARM_ALU_SBREL_27_20 : constant := 37;  --  /usr/include/elf.h:2921
   R_ARM_TARGET1 : constant := 38;  --  /usr/include/elf.h:2922
   R_ARM_SBREL31 : constant := 39;  --  /usr/include/elf.h:2923
   R_ARM_V4BX : constant := 40;  --  /usr/include/elf.h:2924
   R_ARM_TARGET2 : constant := 41;  --  /usr/include/elf.h:2925
   R_ARM_PREL31 : constant := 42;  --  /usr/include/elf.h:2926
   R_ARM_MOVW_ABS_NC : constant := 43;  --  /usr/include/elf.h:2927
   R_ARM_MOVT_ABS : constant := 44;  --  /usr/include/elf.h:2928
   R_ARM_MOVW_PREL_NC : constant := 45;  --  /usr/include/elf.h:2929
   R_ARM_MOVT_PREL : constant := 46;  --  /usr/include/elf.h:2930
   R_ARM_THM_MOVW_ABS_NC : constant := 47;  --  /usr/include/elf.h:2931
   R_ARM_THM_MOVT_ABS : constant := 48;  --  /usr/include/elf.h:2932

   R_ARM_THM_MOVW_PREL_NC : constant := 49;  --  /usr/include/elf.h:2934

   R_ARM_THM_MOVT_PREL : constant := 50;  --  /usr/include/elf.h:2936

   R_ARM_THM_JUMP19 : constant := 51;  --  /usr/include/elf.h:2938

   R_ARM_THM_JUMP6 : constant := 52;  --  /usr/include/elf.h:2940

   R_ARM_THM_ALU_PREL_11_0 : constant := 53;  --  /usr/include/elf.h:2942

   R_ARM_THM_PC12 : constant := 54;  --  /usr/include/elf.h:2944

   R_ARM_ABS32_NOI : constant := 55;  --  /usr/include/elf.h:2946
   R_ARM_REL32_NOI : constant := 56;  --  /usr/include/elf.h:2947
   R_ARM_ALU_PC_G0_NC : constant := 57;  --  /usr/include/elf.h:2948
   R_ARM_ALU_PC_G0 : constant := 58;  --  /usr/include/elf.h:2949
   R_ARM_ALU_PC_G1_NC : constant := 59;  --  /usr/include/elf.h:2950
   R_ARM_ALU_PC_G1 : constant := 60;  --  /usr/include/elf.h:2951
   R_ARM_ALU_PC_G2 : constant := 61;  --  /usr/include/elf.h:2952
   R_ARM_LDR_PC_G1 : constant := 62;  --  /usr/include/elf.h:2953
   R_ARM_LDR_PC_G2 : constant := 63;  --  /usr/include/elf.h:2954
   R_ARM_LDRS_PC_G0 : constant := 64;  --  /usr/include/elf.h:2955

   R_ARM_LDRS_PC_G1 : constant := 65;  --  /usr/include/elf.h:2957

   R_ARM_LDRS_PC_G2 : constant := 66;  --  /usr/include/elf.h:2959

   R_ARM_LDC_PC_G0 : constant := 67;  --  /usr/include/elf.h:2961
   R_ARM_LDC_PC_G1 : constant := 68;  --  /usr/include/elf.h:2962
   R_ARM_LDC_PC_G2 : constant := 69;  --  /usr/include/elf.h:2963
   R_ARM_ALU_SB_G0_NC : constant := 70;  --  /usr/include/elf.h:2964
   R_ARM_ALU_SB_G0 : constant := 71;  --  /usr/include/elf.h:2965
   R_ARM_ALU_SB_G1_NC : constant := 72;  --  /usr/include/elf.h:2966
   R_ARM_ALU_SB_G1 : constant := 73;  --  /usr/include/elf.h:2967
   R_ARM_ALU_SB_G2 : constant := 74;  --  /usr/include/elf.h:2968
   R_ARM_LDR_SB_G0 : constant := 75;  --  /usr/include/elf.h:2969

   R_ARM_LDR_SB_G1 : constant := 76;  --  /usr/include/elf.h:2971

   R_ARM_LDR_SB_G2 : constant := 77;  --  /usr/include/elf.h:2973

   R_ARM_LDRS_SB_G0 : constant := 78;  --  /usr/include/elf.h:2975

   R_ARM_LDRS_SB_G1 : constant := 79;  --  /usr/include/elf.h:2977

   R_ARM_LDRS_SB_G2 : constant := 80;  --  /usr/include/elf.h:2979

   R_ARM_LDC_SB_G0 : constant := 81;  --  /usr/include/elf.h:2981
   R_ARM_LDC_SB_G1 : constant := 82;  --  /usr/include/elf.h:2982
   R_ARM_LDC_SB_G2 : constant := 83;  --  /usr/include/elf.h:2983
   R_ARM_MOVW_BREL_NC : constant := 84;  --  /usr/include/elf.h:2984

   R_ARM_MOVT_BREL : constant := 85;  --  /usr/include/elf.h:2986

   R_ARM_MOVW_BREL : constant := 86;  --  /usr/include/elf.h:2988

   R_ARM_THM_MOVW_BREL_NC : constant := 87;  --  /usr/include/elf.h:2990

   R_ARM_THM_MOVT_BREL : constant := 88;  --  /usr/include/elf.h:2992

   R_ARM_THM_MOVW_BREL : constant := 89;  --  /usr/include/elf.h:2994

   R_ARM_TLS_GOTDESC : constant := 90;  --  /usr/include/elf.h:2996
   R_ARM_TLS_CALL : constant := 91;  --  /usr/include/elf.h:2997
   R_ARM_TLS_DESCSEQ : constant := 92;  --  /usr/include/elf.h:2998
   R_ARM_THM_TLS_CALL : constant := 93;  --  /usr/include/elf.h:2999
   R_ARM_PLT32_ABS : constant := 94;  --  /usr/include/elf.h:3000
   R_ARM_GOT_ABS : constant := 95;  --  /usr/include/elf.h:3001
   R_ARM_GOT_PREL : constant := 96;  --  /usr/include/elf.h:3002
   R_ARM_GOT_BREL12 : constant := 97;  --  /usr/include/elf.h:3003

   R_ARM_GOTOFF12 : constant := 98;  --  /usr/include/elf.h:3005

   R_ARM_GOTRELAX : constant := 99;  --  /usr/include/elf.h:3007
   R_ARM_GNU_VTENTRY : constant := 100;  --  /usr/include/elf.h:3008
   R_ARM_GNU_VTINHERIT : constant := 101;  --  /usr/include/elf.h:3009
   R_ARM_THM_PC11 : constant := 102;  --  /usr/include/elf.h:3010
   R_ARM_THM_PC9 : constant := 103;  --  /usr/include/elf.h:3011

   R_ARM_TLS_GD32 : constant := 104;  --  /usr/include/elf.h:3013

   R_ARM_TLS_LDM32 : constant := 105;  --  /usr/include/elf.h:3015

   R_ARM_TLS_LDO32 : constant := 106;  --  /usr/include/elf.h:3017

   R_ARM_TLS_IE32 : constant := 107;  --  /usr/include/elf.h:3019

   R_ARM_TLS_LE32 : constant := 108;  --  /usr/include/elf.h:3021

   R_ARM_TLS_LDO12 : constant := 109;  --  /usr/include/elf.h:3023

   R_ARM_TLS_LE12 : constant := 110;  --  /usr/include/elf.h:3025

   R_ARM_TLS_IE12GP : constant := 111;  --  /usr/include/elf.h:3027

   R_ARM_ME_TOO : constant := 128;  --  /usr/include/elf.h:3029
   R_ARM_THM_TLS_DESCSEQ : constant := 129;  --  /usr/include/elf.h:3030
   R_ARM_THM_TLS_DESCSEQ16 : constant := 129;  --  /usr/include/elf.h:3031
   R_ARM_THM_TLS_DESCSEQ32 : constant := 130;  --  /usr/include/elf.h:3032
   R_ARM_THM_GOT_BREL12 : constant := 131;  --  /usr/include/elf.h:3033

   R_ARM_IRELATIVE : constant := 160;  --  /usr/include/elf.h:3035
   R_ARM_RXPC25 : constant := 249;  --  /usr/include/elf.h:3036
   R_ARM_RSBREL32 : constant := 250;  --  /usr/include/elf.h:3037
   R_ARM_THM_RPC22 : constant := 251;  --  /usr/include/elf.h:3038
   R_ARM_RREL32 : constant := 252;  --  /usr/include/elf.h:3039
   R_ARM_RABS22 : constant := 253;  --  /usr/include/elf.h:3040
   R_ARM_RPC24 : constant := 254;  --  /usr/include/elf.h:3041
   R_ARM_RBASE : constant := 255;  --  /usr/include/elf.h:3042

   R_ARM_NUM : constant := 256;  --  /usr/include/elf.h:3044

   R_CKCORE_NONE : constant := 0;  --  /usr/include/elf.h:3047
   R_CKCORE_ADDR32 : constant := 1;  --  /usr/include/elf.h:3048
   R_CKCORE_PCRELIMM8BY4 : constant := 2;  --  /usr/include/elf.h:3049
   R_CKCORE_PCRELIMM11BY2 : constant := 3;  --  /usr/include/elf.h:3050
   R_CKCORE_PCREL32 : constant := 5;  --  /usr/include/elf.h:3051
   R_CKCORE_PCRELJSR_IMM11BY2 : constant := 6;  --  /usr/include/elf.h:3052
   R_CKCORE_RELATIVE : constant := 9;  --  /usr/include/elf.h:3053
   R_CKCORE_COPY : constant := 10;  --  /usr/include/elf.h:3054
   R_CKCORE_GLOB_DAT : constant := 11;  --  /usr/include/elf.h:3055
   R_CKCORE_JUMP_SLOT : constant := 12;  --  /usr/include/elf.h:3056
   R_CKCORE_GOTOFF : constant := 13;  --  /usr/include/elf.h:3057
   R_CKCORE_GOTPC : constant := 14;  --  /usr/include/elf.h:3058
   R_CKCORE_GOT32 : constant := 15;  --  /usr/include/elf.h:3059
   R_CKCORE_PLT32 : constant := 16;  --  /usr/include/elf.h:3060
   R_CKCORE_ADDRGOT : constant := 17;  --  /usr/include/elf.h:3061
   R_CKCORE_ADDRPLT : constant := 18;  --  /usr/include/elf.h:3062
   R_CKCORE_PCREL_IMM26BY2 : constant := 19;  --  /usr/include/elf.h:3063
   R_CKCORE_PCREL_IMM16BY2 : constant := 20;  --  /usr/include/elf.h:3064
   R_CKCORE_PCREL_IMM16BY4 : constant := 21;  --  /usr/include/elf.h:3065
   R_CKCORE_PCREL_IMM10BY2 : constant := 22;  --  /usr/include/elf.h:3066
   R_CKCORE_PCREL_IMM10BY4 : constant := 23;  --  /usr/include/elf.h:3067
   R_CKCORE_ADDR_HI16 : constant := 24;  --  /usr/include/elf.h:3068

   R_CKCORE_ADDR_LO16 : constant := 25;  --  /usr/include/elf.h:3070
   R_CKCORE_GOTPC_HI16 : constant := 26;  --  /usr/include/elf.h:3071

   R_CKCORE_GOTPC_LO16 : constant := 27;  --  /usr/include/elf.h:3073
   R_CKCORE_GOTOFF_HI16 : constant := 28;  --  /usr/include/elf.h:3074

   R_CKCORE_GOTOFF_LO16 : constant := 29;  --  /usr/include/elf.h:3076
   R_CKCORE_GOT12 : constant := 30;  --  /usr/include/elf.h:3077
   R_CKCORE_GOT_HI16 : constant := 31;  --  /usr/include/elf.h:3078

   R_CKCORE_GOT_LO16 : constant := 32;  --  /usr/include/elf.h:3080
   R_CKCORE_PLT12 : constant := 33;  --  /usr/include/elf.h:3081
   R_CKCORE_PLT_HI16 : constant := 34;  --  /usr/include/elf.h:3082

   R_CKCORE_PLT_LO16 : constant := 35;  --  /usr/include/elf.h:3084
   R_CKCORE_ADDRGOT_HI16 : constant := 36;  --  /usr/include/elf.h:3085

   R_CKCORE_ADDRGOT_LO16 : constant := 37;  --  /usr/include/elf.h:3087
   R_CKCORE_ADDRPLT_HI16 : constant := 38;  --  /usr/include/elf.h:3088

   R_CKCORE_ADDRPLT_LO16 : constant := 39;  --  /usr/include/elf.h:3090
   R_CKCORE_PCREL_JSR_IMM26BY2 : constant := 40;  --  /usr/include/elf.h:3091
   R_CKCORE_TOFFSET_LO16 : constant := 41;  --  /usr/include/elf.h:3092
   R_CKCORE_DOFFSET_LO16 : constant := 42;  --  /usr/include/elf.h:3093
   R_CKCORE_PCREL_IMM18BY2 : constant := 43;  --  /usr/include/elf.h:3094
   R_CKCORE_DOFFSET_IMM18 : constant := 44;  --  /usr/include/elf.h:3095
   R_CKCORE_DOFFSET_IMM18BY2 : constant := 45;  --  /usr/include/elf.h:3096
   R_CKCORE_DOFFSET_IMM18BY4 : constant := 46;  --  /usr/include/elf.h:3097
   R_CKCORE_GOT_IMM18BY4 : constant := 48;  --  /usr/include/elf.h:3098
   R_CKCORE_PLT_IMM18BY4 : constant := 49;  --  /usr/include/elf.h:3099
   R_CKCORE_PCREL_IMM7BY4 : constant := 50;  --  /usr/include/elf.h:3100
   R_CKCORE_TLS_LE32 : constant := 51;  --  /usr/include/elf.h:3101
   R_CKCORE_TLS_IE32 : constant := 52;  --  /usr/include/elf.h:3102
   R_CKCORE_TLS_GD32 : constant := 53;  --  /usr/include/elf.h:3103
   R_CKCORE_TLS_LDM32 : constant := 54;  --  /usr/include/elf.h:3104
   R_CKCORE_TLS_LDO32 : constant := 55;  --  /usr/include/elf.h:3105
   R_CKCORE_TLS_DTPMOD32 : constant := 56;  --  /usr/include/elf.h:3106
   R_CKCORE_TLS_DTPOFF32 : constant := 57;  --  /usr/include/elf.h:3107
   R_CKCORE_TLS_TPOFF32 : constant := 58;  --  /usr/include/elf.h:3108

   EF_CSKY_ABIMASK : constant := 16#F0000000#;  --  /usr/include/elf.h:3111
   EF_CSKY_OTHER : constant := 16#0FFF0000#;  --  /usr/include/elf.h:3112
   EF_CSKY_PROCESSOR : constant := 16#0000FFFF#;  --  /usr/include/elf.h:3113

   EF_CSKY_ABIV1 : constant := 16#10000000#;  --  /usr/include/elf.h:3115
   EF_CSKY_ABIV2 : constant := 16#20000000#;  --  /usr/include/elf.h:3116
   --  unsupported macro: SHT_CSKY_ATTRIBUTES (SHT_LOPROC + 1)

   EF_IA_64_MASKOS : constant := 16#0000000f#;  --  /usr/include/elf.h:3124
   EF_IA_64_ABI64 : constant := 16#00000010#;  --  /usr/include/elf.h:3125
   EF_IA_64_ARCH : constant := 16#ff000000#;  --  /usr/include/elf.h:3126
   --  unsupported macro: PT_IA_64_ARCHEXT (PT_LOPROC + 0)
   --  unsupported macro: PT_IA_64_UNWIND (PT_LOPROC + 1)
   --  unsupported macro: PT_IA_64_HP_OPT_ANOT (PT_LOOS + 0x12)
   --  unsupported macro: PT_IA_64_HP_HSL_ANOT (PT_LOOS + 0x13)
   --  unsupported macro: PT_IA_64_HP_STACK (PT_LOOS + 0x14)

   PF_IA_64_NORECOV : constant := 16#80000000#;  --  /usr/include/elf.h:3136
   --  unsupported macro: SHT_IA_64_EXT (SHT_LOPROC + 0)
   --  unsupported macro: SHT_IA_64_UNWIND (SHT_LOPROC + 1)

   SHF_IA_64_SHORT : constant := 16#10000000#;  --  /usr/include/elf.h:3143
   SHF_IA_64_NORECOV : constant := 16#20000000#;  --  /usr/include/elf.h:3144
   --  unsupported macro: DT_IA_64_PLT_RESERVE (DT_LOPROC + 0)

   DT_IA_64_NUM : constant := 1;  --  /usr/include/elf.h:3148

   R_IA64_NONE : constant := 16#00#;  --  /usr/include/elf.h:3151
   R_IA64_IMM14 : constant := 16#21#;  --  /usr/include/elf.h:3152
   R_IA64_IMM22 : constant := 16#22#;  --  /usr/include/elf.h:3153
   R_IA64_IMM64 : constant := 16#23#;  --  /usr/include/elf.h:3154
   R_IA64_DIR32MSB : constant := 16#24#;  --  /usr/include/elf.h:3155
   R_IA64_DIR32LSB : constant := 16#25#;  --  /usr/include/elf.h:3156
   R_IA64_DIR64MSB : constant := 16#26#;  --  /usr/include/elf.h:3157
   R_IA64_DIR64LSB : constant := 16#27#;  --  /usr/include/elf.h:3158
   R_IA64_GPREL22 : constant := 16#2a#;  --  /usr/include/elf.h:3159
   R_IA64_GPREL64I : constant := 16#2b#;  --  /usr/include/elf.h:3160
   R_IA64_GPREL32MSB : constant := 16#2c#;  --  /usr/include/elf.h:3161
   R_IA64_GPREL32LSB : constant := 16#2d#;  --  /usr/include/elf.h:3162
   R_IA64_GPREL64MSB : constant := 16#2e#;  --  /usr/include/elf.h:3163
   R_IA64_GPREL64LSB : constant := 16#2f#;  --  /usr/include/elf.h:3164
   R_IA64_LTOFF22 : constant := 16#32#;  --  /usr/include/elf.h:3165
   R_IA64_LTOFF64I : constant := 16#33#;  --  /usr/include/elf.h:3166
   R_IA64_PLTOFF22 : constant := 16#3a#;  --  /usr/include/elf.h:3167
   R_IA64_PLTOFF64I : constant := 16#3b#;  --  /usr/include/elf.h:3168
   R_IA64_PLTOFF64MSB : constant := 16#3e#;  --  /usr/include/elf.h:3169
   R_IA64_PLTOFF64LSB : constant := 16#3f#;  --  /usr/include/elf.h:3170
   R_IA64_FPTR64I : constant := 16#43#;  --  /usr/include/elf.h:3171
   R_IA64_FPTR32MSB : constant := 16#44#;  --  /usr/include/elf.h:3172
   R_IA64_FPTR32LSB : constant := 16#45#;  --  /usr/include/elf.h:3173
   R_IA64_FPTR64MSB : constant := 16#46#;  --  /usr/include/elf.h:3174
   R_IA64_FPTR64LSB : constant := 16#47#;  --  /usr/include/elf.h:3175
   R_IA64_PCREL60B : constant := 16#48#;  --  /usr/include/elf.h:3176
   R_IA64_PCREL21B : constant := 16#49#;  --  /usr/include/elf.h:3177
   R_IA64_PCREL21M : constant := 16#4a#;  --  /usr/include/elf.h:3178
   R_IA64_PCREL21F : constant := 16#4b#;  --  /usr/include/elf.h:3179
   R_IA64_PCREL32MSB : constant := 16#4c#;  --  /usr/include/elf.h:3180
   R_IA64_PCREL32LSB : constant := 16#4d#;  --  /usr/include/elf.h:3181
   R_IA64_PCREL64MSB : constant := 16#4e#;  --  /usr/include/elf.h:3182
   R_IA64_PCREL64LSB : constant := 16#4f#;  --  /usr/include/elf.h:3183
   R_IA64_LTOFF_FPTR22 : constant := 16#52#;  --  /usr/include/elf.h:3184
   R_IA64_LTOFF_FPTR64I : constant := 16#53#;  --  /usr/include/elf.h:3185
   R_IA64_LTOFF_FPTR32MSB : constant := 16#54#;  --  /usr/include/elf.h:3186
   R_IA64_LTOFF_FPTR32LSB : constant := 16#55#;  --  /usr/include/elf.h:3187
   R_IA64_LTOFF_FPTR64MSB : constant := 16#56#;  --  /usr/include/elf.h:3188
   R_IA64_LTOFF_FPTR64LSB : constant := 16#57#;  --  /usr/include/elf.h:3189
   R_IA64_SEGREL32MSB : constant := 16#5c#;  --  /usr/include/elf.h:3190
   R_IA64_SEGREL32LSB : constant := 16#5d#;  --  /usr/include/elf.h:3191
   R_IA64_SEGREL64MSB : constant := 16#5e#;  --  /usr/include/elf.h:3192
   R_IA64_SEGREL64LSB : constant := 16#5f#;  --  /usr/include/elf.h:3193
   R_IA64_SECREL32MSB : constant := 16#64#;  --  /usr/include/elf.h:3194
   R_IA64_SECREL32LSB : constant := 16#65#;  --  /usr/include/elf.h:3195
   R_IA64_SECREL64MSB : constant := 16#66#;  --  /usr/include/elf.h:3196
   R_IA64_SECREL64LSB : constant := 16#67#;  --  /usr/include/elf.h:3197
   R_IA64_REL32MSB : constant := 16#6c#;  --  /usr/include/elf.h:3198
   R_IA64_REL32LSB : constant := 16#6d#;  --  /usr/include/elf.h:3199
   R_IA64_REL64MSB : constant := 16#6e#;  --  /usr/include/elf.h:3200
   R_IA64_REL64LSB : constant := 16#6f#;  --  /usr/include/elf.h:3201
   R_IA64_LTV32MSB : constant := 16#74#;  --  /usr/include/elf.h:3202
   R_IA64_LTV32LSB : constant := 16#75#;  --  /usr/include/elf.h:3203
   R_IA64_LTV64MSB : constant := 16#76#;  --  /usr/include/elf.h:3204
   R_IA64_LTV64LSB : constant := 16#77#;  --  /usr/include/elf.h:3205
   R_IA64_PCREL21BI : constant := 16#79#;  --  /usr/include/elf.h:3206
   R_IA64_PCREL22 : constant := 16#7a#;  --  /usr/include/elf.h:3207
   R_IA64_PCREL64I : constant := 16#7b#;  --  /usr/include/elf.h:3208
   R_IA64_IPLTMSB : constant := 16#80#;  --  /usr/include/elf.h:3209
   R_IA64_IPLTLSB : constant := 16#81#;  --  /usr/include/elf.h:3210
   R_IA64_COPY : constant := 16#84#;  --  /usr/include/elf.h:3211
   R_IA64_SUB : constant := 16#85#;  --  /usr/include/elf.h:3212
   R_IA64_LTOFF22X : constant := 16#86#;  --  /usr/include/elf.h:3213
   R_IA64_LDXMOV : constant := 16#87#;  --  /usr/include/elf.h:3214
   R_IA64_TPREL14 : constant := 16#91#;  --  /usr/include/elf.h:3215
   R_IA64_TPREL22 : constant := 16#92#;  --  /usr/include/elf.h:3216
   R_IA64_TPREL64I : constant := 16#93#;  --  /usr/include/elf.h:3217
   R_IA64_TPREL64MSB : constant := 16#96#;  --  /usr/include/elf.h:3218
   R_IA64_TPREL64LSB : constant := 16#97#;  --  /usr/include/elf.h:3219
   R_IA64_LTOFF_TPREL22 : constant := 16#9a#;  --  /usr/include/elf.h:3220
   R_IA64_DTPMOD64MSB : constant := 16#a6#;  --  /usr/include/elf.h:3221
   R_IA64_DTPMOD64LSB : constant := 16#a7#;  --  /usr/include/elf.h:3222
   R_IA64_LTOFF_DTPMOD22 : constant := 16#aa#;  --  /usr/include/elf.h:3223
   R_IA64_DTPREL14 : constant := 16#b1#;  --  /usr/include/elf.h:3224
   R_IA64_DTPREL22 : constant := 16#b2#;  --  /usr/include/elf.h:3225
   R_IA64_DTPREL64I : constant := 16#b3#;  --  /usr/include/elf.h:3226
   R_IA64_DTPREL32MSB : constant := 16#b4#;  --  /usr/include/elf.h:3227
   R_IA64_DTPREL32LSB : constant := 16#b5#;  --  /usr/include/elf.h:3228
   R_IA64_DTPREL64MSB : constant := 16#b6#;  --  /usr/include/elf.h:3229
   R_IA64_DTPREL64LSB : constant := 16#b7#;  --  /usr/include/elf.h:3230
   R_IA64_LTOFF_DTPREL22 : constant := 16#ba#;  --  /usr/include/elf.h:3231

   EF_SH_MACH_MASK : constant := 16#1f#;  --  /usr/include/elf.h:3236
   EF_SH_UNKNOWN : constant := 16#0#;  --  /usr/include/elf.h:3237
   EF_SH1 : constant := 16#1#;  --  /usr/include/elf.h:3238
   EF_SH2 : constant := 16#2#;  --  /usr/include/elf.h:3239
   EF_SH3 : constant := 16#3#;  --  /usr/include/elf.h:3240
   EF_SH_DSP : constant := 16#4#;  --  /usr/include/elf.h:3241
   EF_SH3_DSP : constant := 16#5#;  --  /usr/include/elf.h:3242
   EF_SH4AL_DSP : constant := 16#6#;  --  /usr/include/elf.h:3243
   EF_SH3E : constant := 16#8#;  --  /usr/include/elf.h:3244
   EF_SH4 : constant := 16#9#;  --  /usr/include/elf.h:3245
   EF_SH2E : constant := 16#b#;  --  /usr/include/elf.h:3246
   EF_SH4A : constant := 16#c#;  --  /usr/include/elf.h:3247
   EF_SH2A : constant := 16#d#;  --  /usr/include/elf.h:3248
   EF_SH4_NOFPU : constant := 16#10#;  --  /usr/include/elf.h:3249
   EF_SH4A_NOFPU : constant := 16#11#;  --  /usr/include/elf.h:3250
   EF_SH4_NOMMU_NOFPU : constant := 16#12#;  --  /usr/include/elf.h:3251
   EF_SH2A_NOFPU : constant := 16#13#;  --  /usr/include/elf.h:3252
   EF_SH3_NOMMU : constant := 16#14#;  --  /usr/include/elf.h:3253
   EF_SH2A_SH4_NOFPU : constant := 16#15#;  --  /usr/include/elf.h:3254
   EF_SH2A_SH3_NOFPU : constant := 16#16#;  --  /usr/include/elf.h:3255
   EF_SH2A_SH4 : constant := 16#17#;  --  /usr/include/elf.h:3256
   EF_SH2A_SH3E : constant := 16#18#;  --  /usr/include/elf.h:3257

   R_SH_NONE : constant := 0;  --  /usr/include/elf.h:3260
   R_SH_DIR32 : constant := 1;  --  /usr/include/elf.h:3261
   R_SH_REL32 : constant := 2;  --  /usr/include/elf.h:3262
   R_SH_DIR8WPN : constant := 3;  --  /usr/include/elf.h:3263
   R_SH_IND12W : constant := 4;  --  /usr/include/elf.h:3264
   R_SH_DIR8WPL : constant := 5;  --  /usr/include/elf.h:3265
   R_SH_DIR8WPZ : constant := 6;  --  /usr/include/elf.h:3266
   R_SH_DIR8BP : constant := 7;  --  /usr/include/elf.h:3267
   R_SH_DIR8W : constant := 8;  --  /usr/include/elf.h:3268
   R_SH_DIR8L : constant := 9;  --  /usr/include/elf.h:3269
   R_SH_SWITCH16 : constant := 25;  --  /usr/include/elf.h:3270
   R_SH_SWITCH32 : constant := 26;  --  /usr/include/elf.h:3271
   R_SH_USES : constant := 27;  --  /usr/include/elf.h:3272
   R_SH_COUNT : constant := 28;  --  /usr/include/elf.h:3273
   R_SH_ALIGN : constant := 29;  --  /usr/include/elf.h:3274
   R_SH_CODE : constant := 30;  --  /usr/include/elf.h:3275
   R_SH_DATA : constant := 31;  --  /usr/include/elf.h:3276
   R_SH_LABEL : constant := 32;  --  /usr/include/elf.h:3277
   R_SH_SWITCH8 : constant := 33;  --  /usr/include/elf.h:3278
   R_SH_GNU_VTINHERIT : constant := 34;  --  /usr/include/elf.h:3279
   R_SH_GNU_VTENTRY : constant := 35;  --  /usr/include/elf.h:3280
   R_SH_TLS_GD_32 : constant := 144;  --  /usr/include/elf.h:3281
   R_SH_TLS_LD_32 : constant := 145;  --  /usr/include/elf.h:3282
   R_SH_TLS_LDO_32 : constant := 146;  --  /usr/include/elf.h:3283
   R_SH_TLS_IE_32 : constant := 147;  --  /usr/include/elf.h:3284
   R_SH_TLS_LE_32 : constant := 148;  --  /usr/include/elf.h:3285
   R_SH_TLS_DTPMOD32 : constant := 149;  --  /usr/include/elf.h:3286
   R_SH_TLS_DTPOFF32 : constant := 150;  --  /usr/include/elf.h:3287
   R_SH_TLS_TPOFF32 : constant := 151;  --  /usr/include/elf.h:3288
   R_SH_GOT32 : constant := 160;  --  /usr/include/elf.h:3289
   R_SH_PLT32 : constant := 161;  --  /usr/include/elf.h:3290
   R_SH_COPY : constant := 162;  --  /usr/include/elf.h:3291
   R_SH_GLOB_DAT : constant := 163;  --  /usr/include/elf.h:3292
   R_SH_JMP_SLOT : constant := 164;  --  /usr/include/elf.h:3293
   R_SH_RELATIVE : constant := 165;  --  /usr/include/elf.h:3294
   R_SH_GOTOFF : constant := 166;  --  /usr/include/elf.h:3295
   R_SH_GOTPC : constant := 167;  --  /usr/include/elf.h:3296

   R_SH_NUM : constant := 256;  --  /usr/include/elf.h:3298

   EF_S390_HIGH_GPRS : constant := 16#00000001#;  --  /usr/include/elf.h:3304

   R_390_NONE : constant := 0;  --  /usr/include/elf.h:3308
   R_390_8 : constant := 1;  --  /usr/include/elf.h:3309
   R_390_12 : constant := 2;  --  /usr/include/elf.h:3310
   R_390_16 : constant := 3;  --  /usr/include/elf.h:3311
   R_390_32 : constant := 4;  --  /usr/include/elf.h:3312
   R_390_PC32 : constant := 5;  --  /usr/include/elf.h:3313
   R_390_GOT12 : constant := 6;  --  /usr/include/elf.h:3314
   R_390_GOT32 : constant := 7;  --  /usr/include/elf.h:3315
   R_390_PLT32 : constant := 8;  --  /usr/include/elf.h:3316
   R_390_COPY : constant := 9;  --  /usr/include/elf.h:3317
   R_390_GLOB_DAT : constant := 10;  --  /usr/include/elf.h:3318
   R_390_JMP_SLOT : constant := 11;  --  /usr/include/elf.h:3319
   R_390_RELATIVE : constant := 12;  --  /usr/include/elf.h:3320
   R_390_GOTOFF32 : constant := 13;  --  /usr/include/elf.h:3321
   R_390_GOTPC : constant := 14;  --  /usr/include/elf.h:3322
   R_390_GOT16 : constant := 15;  --  /usr/include/elf.h:3323
   R_390_PC16 : constant := 16;  --  /usr/include/elf.h:3324
   R_390_PC16DBL : constant := 17;  --  /usr/include/elf.h:3325
   R_390_PLT16DBL : constant := 18;  --  /usr/include/elf.h:3326
   R_390_PC32DBL : constant := 19;  --  /usr/include/elf.h:3327
   R_390_PLT32DBL : constant := 20;  --  /usr/include/elf.h:3328
   R_390_GOTPCDBL : constant := 21;  --  /usr/include/elf.h:3329
   R_390_64 : constant := 22;  --  /usr/include/elf.h:3330
   R_390_PC64 : constant := 23;  --  /usr/include/elf.h:3331
   R_390_GOT64 : constant := 24;  --  /usr/include/elf.h:3332
   R_390_PLT64 : constant := 25;  --  /usr/include/elf.h:3333
   R_390_GOTENT : constant := 26;  --  /usr/include/elf.h:3334
   R_390_GOTOFF16 : constant := 27;  --  /usr/include/elf.h:3335
   R_390_GOTOFF64 : constant := 28;  --  /usr/include/elf.h:3336
   R_390_GOTPLT12 : constant := 29;  --  /usr/include/elf.h:3337
   R_390_GOTPLT16 : constant := 30;  --  /usr/include/elf.h:3338
   R_390_GOTPLT32 : constant := 31;  --  /usr/include/elf.h:3339
   R_390_GOTPLT64 : constant := 32;  --  /usr/include/elf.h:3340
   R_390_GOTPLTENT : constant := 33;  --  /usr/include/elf.h:3341
   R_390_PLTOFF16 : constant := 34;  --  /usr/include/elf.h:3342
   R_390_PLTOFF32 : constant := 35;  --  /usr/include/elf.h:3343
   R_390_PLTOFF64 : constant := 36;  --  /usr/include/elf.h:3344
   R_390_TLS_LOAD : constant := 37;  --  /usr/include/elf.h:3345
   R_390_TLS_GDCALL : constant := 38;  --  /usr/include/elf.h:3346

   R_390_TLS_LDCALL : constant := 39;  --  /usr/include/elf.h:3348

   R_390_TLS_GD32 : constant := 40;  --  /usr/include/elf.h:3350

   R_390_TLS_GD64 : constant := 41;  --  /usr/include/elf.h:3352

   R_390_TLS_GOTIE12 : constant := 42;  --  /usr/include/elf.h:3354

   R_390_TLS_GOTIE32 : constant := 43;  --  /usr/include/elf.h:3356

   R_390_TLS_GOTIE64 : constant := 44;  --  /usr/include/elf.h:3358

   R_390_TLS_LDM32 : constant := 45;  --  /usr/include/elf.h:3360

   R_390_TLS_LDM64 : constant := 46;  --  /usr/include/elf.h:3362

   R_390_TLS_IE32 : constant := 47;  --  /usr/include/elf.h:3364

   R_390_TLS_IE64 : constant := 48;  --  /usr/include/elf.h:3366

   R_390_TLS_IEENT : constant := 49;  --  /usr/include/elf.h:3368

   R_390_TLS_LE32 : constant := 50;  --  /usr/include/elf.h:3370

   R_390_TLS_LE64 : constant := 51;  --  /usr/include/elf.h:3372

   R_390_TLS_LDO32 : constant := 52;  --  /usr/include/elf.h:3374

   R_390_TLS_LDO64 : constant := 53;  --  /usr/include/elf.h:3376

   R_390_TLS_DTPMOD : constant := 54;  --  /usr/include/elf.h:3378
   R_390_TLS_DTPOFF : constant := 55;  --  /usr/include/elf.h:3379
   R_390_TLS_TPOFF : constant := 56;  --  /usr/include/elf.h:3380

   R_390_20 : constant := 57;  --  /usr/include/elf.h:3382
   R_390_GOT20 : constant := 58;  --  /usr/include/elf.h:3383
   R_390_GOTPLT20 : constant := 59;  --  /usr/include/elf.h:3384
   R_390_TLS_GOTIE20 : constant := 60;  --  /usr/include/elf.h:3385

   R_390_IRELATIVE : constant := 61;  --  /usr/include/elf.h:3387

   R_390_NUM : constant := 62;  --  /usr/include/elf.h:3389

   R_CRIS_NONE : constant := 0;  --  /usr/include/elf.h:3393
   R_CRIS_8 : constant := 1;  --  /usr/include/elf.h:3394
   R_CRIS_16 : constant := 2;  --  /usr/include/elf.h:3395
   R_CRIS_32 : constant := 3;  --  /usr/include/elf.h:3396
   R_CRIS_8_PCREL : constant := 4;  --  /usr/include/elf.h:3397
   R_CRIS_16_PCREL : constant := 5;  --  /usr/include/elf.h:3398
   R_CRIS_32_PCREL : constant := 6;  --  /usr/include/elf.h:3399
   R_CRIS_GNU_VTINHERIT : constant := 7;  --  /usr/include/elf.h:3400
   R_CRIS_GNU_VTENTRY : constant := 8;  --  /usr/include/elf.h:3401
   R_CRIS_COPY : constant := 9;  --  /usr/include/elf.h:3402
   R_CRIS_GLOB_DAT : constant := 10;  --  /usr/include/elf.h:3403
   R_CRIS_JUMP_SLOT : constant := 11;  --  /usr/include/elf.h:3404
   R_CRIS_RELATIVE : constant := 12;  --  /usr/include/elf.h:3405
   R_CRIS_16_GOT : constant := 13;  --  /usr/include/elf.h:3406
   R_CRIS_32_GOT : constant := 14;  --  /usr/include/elf.h:3407
   R_CRIS_16_GOTPLT : constant := 15;  --  /usr/include/elf.h:3408
   R_CRIS_32_GOTPLT : constant := 16;  --  /usr/include/elf.h:3409
   R_CRIS_32_GOTREL : constant := 17;  --  /usr/include/elf.h:3410
   R_CRIS_32_PLT_GOTREL : constant := 18;  --  /usr/include/elf.h:3411
   R_CRIS_32_PLT_PCREL : constant := 19;  --  /usr/include/elf.h:3412

   R_CRIS_NUM : constant := 20;  --  /usr/include/elf.h:3414

   R_X86_64_NONE : constant := 0;  --  /usr/include/elf.h:3418
   R_X86_64_64 : constant := 1;  --  /usr/include/elf.h:3419
   R_X86_64_PC32 : constant := 2;  --  /usr/include/elf.h:3420
   R_X86_64_GOT32 : constant := 3;  --  /usr/include/elf.h:3421
   R_X86_64_PLT32 : constant := 4;  --  /usr/include/elf.h:3422
   R_X86_64_COPY : constant := 5;  --  /usr/include/elf.h:3423
   R_X86_64_GLOB_DAT : constant := 6;  --  /usr/include/elf.h:3424
   R_X86_64_JUMP_SLOT : constant := 7;  --  /usr/include/elf.h:3425
   R_X86_64_RELATIVE : constant := 8;  --  /usr/include/elf.h:3426
   R_X86_64_GOTPCREL : constant := 9;  --  /usr/include/elf.h:3427

   R_X86_64_32 : constant := 10;  --  /usr/include/elf.h:3429
   R_X86_64_32S : constant := 11;  --  /usr/include/elf.h:3430
   R_X86_64_16 : constant := 12;  --  /usr/include/elf.h:3431
   R_X86_64_PC16 : constant := 13;  --  /usr/include/elf.h:3432
   R_X86_64_8 : constant := 14;  --  /usr/include/elf.h:3433
   R_X86_64_PC8 : constant := 15;  --  /usr/include/elf.h:3434
   R_X86_64_DTPMOD64 : constant := 16;  --  /usr/include/elf.h:3435
   R_X86_64_DTPOFF64 : constant := 17;  --  /usr/include/elf.h:3436
   R_X86_64_TPOFF64 : constant := 18;  --  /usr/include/elf.h:3437
   R_X86_64_TLSGD : constant := 19;  --  /usr/include/elf.h:3438

   R_X86_64_TLSLD : constant := 20;  --  /usr/include/elf.h:3440

   R_X86_64_DTPOFF32 : constant := 21;  --  /usr/include/elf.h:3442
   R_X86_64_GOTTPOFF : constant := 22;  --  /usr/include/elf.h:3443

   R_X86_64_TPOFF32 : constant := 23;  --  /usr/include/elf.h:3445
   R_X86_64_PC64 : constant := 24;  --  /usr/include/elf.h:3446
   R_X86_64_GOTOFF64 : constant := 25;  --  /usr/include/elf.h:3447
   R_X86_64_GOTPC32 : constant := 26;  --  /usr/include/elf.h:3448

   R_X86_64_GOT64 : constant := 27;  --  /usr/include/elf.h:3450
   R_X86_64_GOTPCREL64 : constant := 28;  --  /usr/include/elf.h:3451

   R_X86_64_GOTPC64 : constant := 29;  --  /usr/include/elf.h:3453
   R_X86_64_GOTPLT64 : constant := 30;  --  /usr/include/elf.h:3454
   R_X86_64_PLTOFF64 : constant := 31;  --  /usr/include/elf.h:3455

   R_X86_64_SIZE32 : constant := 32;  --  /usr/include/elf.h:3457
   R_X86_64_SIZE64 : constant := 33;  --  /usr/include/elf.h:3458
   R_X86_64_GOTPC32_TLSDESC : constant := 34;  --  /usr/include/elf.h:3459
   R_X86_64_TLSDESC_CALL : constant := 35;  --  /usr/include/elf.h:3460

   R_X86_64_TLSDESC : constant := 36;  --  /usr/include/elf.h:3462
   R_X86_64_IRELATIVE : constant := 37;  --  /usr/include/elf.h:3463
   R_X86_64_RELATIVE64 : constant := 38;  --  /usr/include/elf.h:3464

   R_X86_64_GOTPCRELX : constant := 41;  --  /usr/include/elf.h:3467

   R_X86_64_REX_GOTPCRELX : constant := 42;  --  /usr/include/elf.h:3470

   R_X86_64_NUM : constant := 43;  --  /usr/include/elf.h:3473

   SHT_X86_64_UNWIND : constant := 16#70000001#;  --  /usr/include/elf.h:3476

   R_MN10300_NONE : constant := 0;  --  /usr/include/elf.h:3480
   R_MN10300_32 : constant := 1;  --  /usr/include/elf.h:3481
   R_MN10300_16 : constant := 2;  --  /usr/include/elf.h:3482
   R_MN10300_8 : constant := 3;  --  /usr/include/elf.h:3483
   R_MN10300_PCREL32 : constant := 4;  --  /usr/include/elf.h:3484
   R_MN10300_PCREL16 : constant := 5;  --  /usr/include/elf.h:3485
   R_MN10300_PCREL8 : constant := 6;  --  /usr/include/elf.h:3486
   R_MN10300_GNU_VTINHERIT : constant := 7;  --  /usr/include/elf.h:3487
   R_MN10300_GNU_VTENTRY : constant := 8;  --  /usr/include/elf.h:3488
   R_MN10300_24 : constant := 9;  --  /usr/include/elf.h:3489
   R_MN10300_GOTPC32 : constant := 10;  --  /usr/include/elf.h:3490
   R_MN10300_GOTPC16 : constant := 11;  --  /usr/include/elf.h:3491
   R_MN10300_GOTOFF32 : constant := 12;  --  /usr/include/elf.h:3492
   R_MN10300_GOTOFF24 : constant := 13;  --  /usr/include/elf.h:3493
   R_MN10300_GOTOFF16 : constant := 14;  --  /usr/include/elf.h:3494
   R_MN10300_PLT32 : constant := 15;  --  /usr/include/elf.h:3495
   R_MN10300_PLT16 : constant := 16;  --  /usr/include/elf.h:3496
   R_MN10300_GOT32 : constant := 17;  --  /usr/include/elf.h:3497
   R_MN10300_GOT24 : constant := 18;  --  /usr/include/elf.h:3498
   R_MN10300_GOT16 : constant := 19;  --  /usr/include/elf.h:3499
   R_MN10300_COPY : constant := 20;  --  /usr/include/elf.h:3500
   R_MN10300_GLOB_DAT : constant := 21;  --  /usr/include/elf.h:3501
   R_MN10300_JMP_SLOT : constant := 22;  --  /usr/include/elf.h:3502
   R_MN10300_RELATIVE : constant := 23;  --  /usr/include/elf.h:3503
   R_MN10300_TLS_GD : constant := 24;  --  /usr/include/elf.h:3504
   R_MN10300_TLS_LD : constant := 25;  --  /usr/include/elf.h:3505
   R_MN10300_TLS_LDO : constant := 26;  --  /usr/include/elf.h:3506
   R_MN10300_TLS_GOTIE : constant := 27;  --  /usr/include/elf.h:3507

   R_MN10300_TLS_IE : constant := 28;  --  /usr/include/elf.h:3509

   R_MN10300_TLS_LE : constant := 29;  --  /usr/include/elf.h:3511

   R_MN10300_TLS_DTPMOD : constant := 30;  --  /usr/include/elf.h:3513
   R_MN10300_TLS_DTPOFF : constant := 31;  --  /usr/include/elf.h:3514
   R_MN10300_TLS_TPOFF : constant := 32;  --  /usr/include/elf.h:3515
   R_MN10300_SYM_DIFF : constant := 33;  --  /usr/include/elf.h:3516

   R_MN10300_ALIGN : constant := 34;  --  /usr/include/elf.h:3518

   R_MN10300_NUM : constant := 35;  --  /usr/include/elf.h:3520

   R_M32R_NONE : constant := 0;  --  /usr/include/elf.h:3524
   R_M32R_16 : constant := 1;  --  /usr/include/elf.h:3525
   R_M32R_32 : constant := 2;  --  /usr/include/elf.h:3526
   R_M32R_24 : constant := 3;  --  /usr/include/elf.h:3527
   R_M32R_10_PCREL : constant := 4;  --  /usr/include/elf.h:3528
   R_M32R_18_PCREL : constant := 5;  --  /usr/include/elf.h:3529
   R_M32R_26_PCREL : constant := 6;  --  /usr/include/elf.h:3530
   R_M32R_HI16_ULO : constant := 7;  --  /usr/include/elf.h:3531
   R_M32R_HI16_SLO : constant := 8;  --  /usr/include/elf.h:3532
   R_M32R_LO16 : constant := 9;  --  /usr/include/elf.h:3533
   R_M32R_SDA16 : constant := 10;  --  /usr/include/elf.h:3534
   R_M32R_GNU_VTINHERIT : constant := 11;  --  /usr/include/elf.h:3535
   R_M32R_GNU_VTENTRY : constant := 12;  --  /usr/include/elf.h:3536

   R_M32R_16_RELA : constant := 33;  --  /usr/include/elf.h:3538
   R_M32R_32_RELA : constant := 34;  --  /usr/include/elf.h:3539
   R_M32R_24_RELA : constant := 35;  --  /usr/include/elf.h:3540
   R_M32R_10_PCREL_RELA : constant := 36;  --  /usr/include/elf.h:3541
   R_M32R_18_PCREL_RELA : constant := 37;  --  /usr/include/elf.h:3542
   R_M32R_26_PCREL_RELA : constant := 38;  --  /usr/include/elf.h:3543
   R_M32R_HI16_ULO_RELA : constant := 39;  --  /usr/include/elf.h:3544
   R_M32R_HI16_SLO_RELA : constant := 40;  --  /usr/include/elf.h:3545
   R_M32R_LO16_RELA : constant := 41;  --  /usr/include/elf.h:3546
   R_M32R_SDA16_RELA : constant := 42;  --  /usr/include/elf.h:3547
   R_M32R_RELA_GNU_VTINHERIT : constant := 43;  --  /usr/include/elf.h:3548
   R_M32R_RELA_GNU_VTENTRY : constant := 44;  --  /usr/include/elf.h:3549
   R_M32R_REL32 : constant := 45;  --  /usr/include/elf.h:3550

   R_M32R_GOT24 : constant := 48;  --  /usr/include/elf.h:3552
   R_M32R_26_PLTREL : constant := 49;  --  /usr/include/elf.h:3553
   R_M32R_COPY : constant := 50;  --  /usr/include/elf.h:3554
   R_M32R_GLOB_DAT : constant := 51;  --  /usr/include/elf.h:3555
   R_M32R_JMP_SLOT : constant := 52;  --  /usr/include/elf.h:3556
   R_M32R_RELATIVE : constant := 53;  --  /usr/include/elf.h:3557
   R_M32R_GOTOFF : constant := 54;  --  /usr/include/elf.h:3558
   R_M32R_GOTPC24 : constant := 55;  --  /usr/include/elf.h:3559
   R_M32R_GOT16_HI_ULO : constant := 56;  --  /usr/include/elf.h:3560

   R_M32R_GOT16_HI_SLO : constant := 57;  --  /usr/include/elf.h:3562

   R_M32R_GOT16_LO : constant := 58;  --  /usr/include/elf.h:3564
   R_M32R_GOTPC_HI_ULO : constant := 59;  --  /usr/include/elf.h:3565

   R_M32R_GOTPC_HI_SLO : constant := 60;  --  /usr/include/elf.h:3567

   R_M32R_GOTPC_LO : constant := 61;  --  /usr/include/elf.h:3569

   R_M32R_GOTOFF_HI_ULO : constant := 62;  --  /usr/include/elf.h:3571

   R_M32R_GOTOFF_HI_SLO : constant := 63;  --  /usr/include/elf.h:3573

   R_M32R_GOTOFF_LO : constant := 64;  --  /usr/include/elf.h:3575
   R_M32R_NUM : constant := 256;  --  /usr/include/elf.h:3576

   R_MICROBLAZE_NONE : constant := 0;  --  /usr/include/elf.h:3579
   R_MICROBLAZE_32 : constant := 1;  --  /usr/include/elf.h:3580
   R_MICROBLAZE_32_PCREL : constant := 2;  --  /usr/include/elf.h:3581
   R_MICROBLAZE_64_PCREL : constant := 3;  --  /usr/include/elf.h:3582
   R_MICROBLAZE_32_PCREL_LO : constant := 4;  --  /usr/include/elf.h:3583
   R_MICROBLAZE_64 : constant := 5;  --  /usr/include/elf.h:3584
   R_MICROBLAZE_32_LO : constant := 6;  --  /usr/include/elf.h:3585
   R_MICROBLAZE_SRO32 : constant := 7;  --  /usr/include/elf.h:3586
   R_MICROBLAZE_SRW32 : constant := 8;  --  /usr/include/elf.h:3587
   R_MICROBLAZE_64_NONE : constant := 9;  --  /usr/include/elf.h:3588
   R_MICROBLAZE_32_SYM_OP_SYM : constant := 10;  --  /usr/include/elf.h:3589
   R_MICROBLAZE_GNU_VTINHERIT : constant := 11;  --  /usr/include/elf.h:3590
   R_MICROBLAZE_GNU_VTENTRY : constant := 12;  --  /usr/include/elf.h:3591
   R_MICROBLAZE_GOTPC_64 : constant := 13;  --  /usr/include/elf.h:3592
   R_MICROBLAZE_GOT_64 : constant := 14;  --  /usr/include/elf.h:3593
   R_MICROBLAZE_PLT_64 : constant := 15;  --  /usr/include/elf.h:3594
   R_MICROBLAZE_REL : constant := 16;  --  /usr/include/elf.h:3595
   R_MICROBLAZE_JUMP_SLOT : constant := 17;  --  /usr/include/elf.h:3596
   R_MICROBLAZE_GLOB_DAT : constant := 18;  --  /usr/include/elf.h:3597
   R_MICROBLAZE_GOTOFF_64 : constant := 19;  --  /usr/include/elf.h:3598
   R_MICROBLAZE_GOTOFF_32 : constant := 20;  --  /usr/include/elf.h:3599
   R_MICROBLAZE_COPY : constant := 21;  --  /usr/include/elf.h:3600
   R_MICROBLAZE_TLS : constant := 22;  --  /usr/include/elf.h:3601
   R_MICROBLAZE_TLSGD : constant := 23;  --  /usr/include/elf.h:3602
   R_MICROBLAZE_TLSLD : constant := 24;  --  /usr/include/elf.h:3603
   R_MICROBLAZE_TLSDTPMOD32 : constant := 25;  --  /usr/include/elf.h:3604
   R_MICROBLAZE_TLSDTPREL32 : constant := 26;  --  /usr/include/elf.h:3605
   R_MICROBLAZE_TLSDTPREL64 : constant := 27;  --  /usr/include/elf.h:3606
   R_MICROBLAZE_TLSGOTTPREL32 : constant := 28;  --  /usr/include/elf.h:3607
   R_MICROBLAZE_TLSTPREL32 : constant := 29;  --  /usr/include/elf.h:3608

   DT_NIOS2_GP : constant := 16#70000002#;  --  /usr/include/elf.h:3611

   R_NIOS2_NONE : constant := 0;  --  /usr/include/elf.h:3614
   R_NIOS2_S16 : constant := 1;  --  /usr/include/elf.h:3615
   R_NIOS2_U16 : constant := 2;  --  /usr/include/elf.h:3616
   R_NIOS2_PCREL16 : constant := 3;  --  /usr/include/elf.h:3617
   R_NIOS2_CALL26 : constant := 4;  --  /usr/include/elf.h:3618
   R_NIOS2_IMM5 : constant := 5;  --  /usr/include/elf.h:3619
   R_NIOS2_CACHE_OPX : constant := 6;  --  /usr/include/elf.h:3620
   R_NIOS2_IMM6 : constant := 7;  --  /usr/include/elf.h:3621
   R_NIOS2_IMM8 : constant := 8;  --  /usr/include/elf.h:3622
   R_NIOS2_HI16 : constant := 9;  --  /usr/include/elf.h:3623
   R_NIOS2_LO16 : constant := 10;  --  /usr/include/elf.h:3624
   R_NIOS2_HIADJ16 : constant := 11;  --  /usr/include/elf.h:3625
   R_NIOS2_BFD_RELOC_32 : constant := 12;  --  /usr/include/elf.h:3626
   R_NIOS2_BFD_RELOC_16 : constant := 13;  --  /usr/include/elf.h:3627
   R_NIOS2_BFD_RELOC_8 : constant := 14;  --  /usr/include/elf.h:3628
   R_NIOS2_GPREL : constant := 15;  --  /usr/include/elf.h:3629
   R_NIOS2_GNU_VTINHERIT : constant := 16;  --  /usr/include/elf.h:3630
   R_NIOS2_GNU_VTENTRY : constant := 17;  --  /usr/include/elf.h:3631
   R_NIOS2_UJMP : constant := 18;  --  /usr/include/elf.h:3632
   R_NIOS2_CJMP : constant := 19;  --  /usr/include/elf.h:3633
   R_NIOS2_CALLR : constant := 20;  --  /usr/include/elf.h:3634
   R_NIOS2_ALIGN : constant := 21;  --  /usr/include/elf.h:3635

   R_NIOS2_GOT16 : constant := 22;  --  /usr/include/elf.h:3637
   R_NIOS2_CALL16 : constant := 23;  --  /usr/include/elf.h:3638
   R_NIOS2_GOTOFF_LO : constant := 24;  --  /usr/include/elf.h:3639
   R_NIOS2_GOTOFF_HA : constant := 25;  --  /usr/include/elf.h:3640
   R_NIOS2_PCREL_LO : constant := 26;  --  /usr/include/elf.h:3641
   R_NIOS2_PCREL_HA : constant := 27;  --  /usr/include/elf.h:3642
   R_NIOS2_TLS_GD16 : constant := 28;  --  /usr/include/elf.h:3643
   R_NIOS2_TLS_LDM16 : constant := 29;  --  /usr/include/elf.h:3644
   R_NIOS2_TLS_LDO16 : constant := 30;  --  /usr/include/elf.h:3645
   R_NIOS2_TLS_IE16 : constant := 31;  --  /usr/include/elf.h:3646
   R_NIOS2_TLS_LE16 : constant := 32;  --  /usr/include/elf.h:3647
   R_NIOS2_TLS_DTPMOD : constant := 33;  --  /usr/include/elf.h:3648
   R_NIOS2_TLS_DTPREL : constant := 34;  --  /usr/include/elf.h:3649
   R_NIOS2_TLS_TPREL : constant := 35;  --  /usr/include/elf.h:3650
   R_NIOS2_COPY : constant := 36;  --  /usr/include/elf.h:3651
   R_NIOS2_GLOB_DAT : constant := 37;  --  /usr/include/elf.h:3652
   R_NIOS2_JUMP_SLOT : constant := 38;  --  /usr/include/elf.h:3653
   R_NIOS2_RELATIVE : constant := 39;  --  /usr/include/elf.h:3654
   R_NIOS2_GOTOFF : constant := 40;  --  /usr/include/elf.h:3655
   R_NIOS2_CALL26_NOAT : constant := 41;  --  /usr/include/elf.h:3656
   R_NIOS2_GOT_LO : constant := 42;  --  /usr/include/elf.h:3657
   R_NIOS2_GOT_HA : constant := 43;  --  /usr/include/elf.h:3658
   R_NIOS2_CALL_LO : constant := 44;  --  /usr/include/elf.h:3659
   R_NIOS2_CALL_HA : constant := 45;  --  /usr/include/elf.h:3660

   R_TILEPRO_NONE : constant := 0;  --  /usr/include/elf.h:3663
   R_TILEPRO_32 : constant := 1;  --  /usr/include/elf.h:3664
   R_TILEPRO_16 : constant := 2;  --  /usr/include/elf.h:3665
   R_TILEPRO_8 : constant := 3;  --  /usr/include/elf.h:3666
   R_TILEPRO_32_PCREL : constant := 4;  --  /usr/include/elf.h:3667
   R_TILEPRO_16_PCREL : constant := 5;  --  /usr/include/elf.h:3668
   R_TILEPRO_8_PCREL : constant := 6;  --  /usr/include/elf.h:3669
   R_TILEPRO_LO16 : constant := 7;  --  /usr/include/elf.h:3670
   R_TILEPRO_HI16 : constant := 8;  --  /usr/include/elf.h:3671
   R_TILEPRO_HA16 : constant := 9;  --  /usr/include/elf.h:3672
   R_TILEPRO_COPY : constant := 10;  --  /usr/include/elf.h:3673
   R_TILEPRO_GLOB_DAT : constant := 11;  --  /usr/include/elf.h:3674
   R_TILEPRO_JMP_SLOT : constant := 12;  --  /usr/include/elf.h:3675
   R_TILEPRO_RELATIVE : constant := 13;  --  /usr/include/elf.h:3676
   R_TILEPRO_BROFF_X1 : constant := 14;  --  /usr/include/elf.h:3677
   R_TILEPRO_JOFFLONG_X1 : constant := 15;  --  /usr/include/elf.h:3678
   R_TILEPRO_JOFFLONG_X1_PLT : constant := 16;  --  /usr/include/elf.h:3679
   R_TILEPRO_IMM8_X0 : constant := 17;  --  /usr/include/elf.h:3680
   R_TILEPRO_IMM8_Y0 : constant := 18;  --  /usr/include/elf.h:3681
   R_TILEPRO_IMM8_X1 : constant := 19;  --  /usr/include/elf.h:3682
   R_TILEPRO_IMM8_Y1 : constant := 20;  --  /usr/include/elf.h:3683
   R_TILEPRO_MT_IMM15_X1 : constant := 21;  --  /usr/include/elf.h:3684
   R_TILEPRO_MF_IMM15_X1 : constant := 22;  --  /usr/include/elf.h:3685
   R_TILEPRO_IMM16_X0 : constant := 23;  --  /usr/include/elf.h:3686
   R_TILEPRO_IMM16_X1 : constant := 24;  --  /usr/include/elf.h:3687
   R_TILEPRO_IMM16_X0_LO : constant := 25;  --  /usr/include/elf.h:3688
   R_TILEPRO_IMM16_X1_LO : constant := 26;  --  /usr/include/elf.h:3689
   R_TILEPRO_IMM16_X0_HI : constant := 27;  --  /usr/include/elf.h:3690
   R_TILEPRO_IMM16_X1_HI : constant := 28;  --  /usr/include/elf.h:3691
   R_TILEPRO_IMM16_X0_HA : constant := 29;  --  /usr/include/elf.h:3692
   R_TILEPRO_IMM16_X1_HA : constant := 30;  --  /usr/include/elf.h:3693
   R_TILEPRO_IMM16_X0_PCREL : constant := 31;  --  /usr/include/elf.h:3694
   R_TILEPRO_IMM16_X1_PCREL : constant := 32;  --  /usr/include/elf.h:3695
   R_TILEPRO_IMM16_X0_LO_PCREL : constant := 33;  --  /usr/include/elf.h:3696
   R_TILEPRO_IMM16_X1_LO_PCREL : constant := 34;  --  /usr/include/elf.h:3697
   R_TILEPRO_IMM16_X0_HI_PCREL : constant := 35;  --  /usr/include/elf.h:3698
   R_TILEPRO_IMM16_X1_HI_PCREL : constant := 36;  --  /usr/include/elf.h:3699
   R_TILEPRO_IMM16_X0_HA_PCREL : constant := 37;  --  /usr/include/elf.h:3700
   R_TILEPRO_IMM16_X1_HA_PCREL : constant := 38;  --  /usr/include/elf.h:3701
   R_TILEPRO_IMM16_X0_GOT : constant := 39;  --  /usr/include/elf.h:3702
   R_TILEPRO_IMM16_X1_GOT : constant := 40;  --  /usr/include/elf.h:3703
   R_TILEPRO_IMM16_X0_GOT_LO : constant := 41;  --  /usr/include/elf.h:3704
   R_TILEPRO_IMM16_X1_GOT_LO : constant := 42;  --  /usr/include/elf.h:3705
   R_TILEPRO_IMM16_X0_GOT_HI : constant := 43;  --  /usr/include/elf.h:3706
   R_TILEPRO_IMM16_X1_GOT_HI : constant := 44;  --  /usr/include/elf.h:3707
   R_TILEPRO_IMM16_X0_GOT_HA : constant := 45;  --  /usr/include/elf.h:3708
   R_TILEPRO_IMM16_X1_GOT_HA : constant := 46;  --  /usr/include/elf.h:3709
   R_TILEPRO_MMSTART_X0 : constant := 47;  --  /usr/include/elf.h:3710
   R_TILEPRO_MMEND_X0 : constant := 48;  --  /usr/include/elf.h:3711
   R_TILEPRO_MMSTART_X1 : constant := 49;  --  /usr/include/elf.h:3712
   R_TILEPRO_MMEND_X1 : constant := 50;  --  /usr/include/elf.h:3713
   R_TILEPRO_SHAMT_X0 : constant := 51;  --  /usr/include/elf.h:3714
   R_TILEPRO_SHAMT_X1 : constant := 52;  --  /usr/include/elf.h:3715
   R_TILEPRO_SHAMT_Y0 : constant := 53;  --  /usr/include/elf.h:3716
   R_TILEPRO_SHAMT_Y1 : constant := 54;  --  /usr/include/elf.h:3717
   R_TILEPRO_DEST_IMM8_X1 : constant := 55;  --  /usr/include/elf.h:3718

   R_TILEPRO_TLS_GD_CALL : constant := 60;  --  /usr/include/elf.h:3720
   R_TILEPRO_IMM8_X0_TLS_GD_ADD : constant := 61;  --  /usr/include/elf.h:3721
   R_TILEPRO_IMM8_X1_TLS_GD_ADD : constant := 62;  --  /usr/include/elf.h:3722
   R_TILEPRO_IMM8_Y0_TLS_GD_ADD : constant := 63;  --  /usr/include/elf.h:3723
   R_TILEPRO_IMM8_Y1_TLS_GD_ADD : constant := 64;  --  /usr/include/elf.h:3724
   R_TILEPRO_TLS_IE_LOAD : constant := 65;  --  /usr/include/elf.h:3725
   R_TILEPRO_IMM16_X0_TLS_GD : constant := 66;  --  /usr/include/elf.h:3726
   R_TILEPRO_IMM16_X1_TLS_GD : constant := 67;  --  /usr/include/elf.h:3727
   R_TILEPRO_IMM16_X0_TLS_GD_LO : constant := 68;  --  /usr/include/elf.h:3728
   R_TILEPRO_IMM16_X1_TLS_GD_LO : constant := 69;  --  /usr/include/elf.h:3729
   R_TILEPRO_IMM16_X0_TLS_GD_HI : constant := 70;  --  /usr/include/elf.h:3730
   R_TILEPRO_IMM16_X1_TLS_GD_HI : constant := 71;  --  /usr/include/elf.h:3731
   R_TILEPRO_IMM16_X0_TLS_GD_HA : constant := 72;  --  /usr/include/elf.h:3732
   R_TILEPRO_IMM16_X1_TLS_GD_HA : constant := 73;  --  /usr/include/elf.h:3733
   R_TILEPRO_IMM16_X0_TLS_IE : constant := 74;  --  /usr/include/elf.h:3734
   R_TILEPRO_IMM16_X1_TLS_IE : constant := 75;  --  /usr/include/elf.h:3735
   R_TILEPRO_IMM16_X0_TLS_IE_LO : constant := 76;  --  /usr/include/elf.h:3736
   R_TILEPRO_IMM16_X1_TLS_IE_LO : constant := 77;  --  /usr/include/elf.h:3737
   R_TILEPRO_IMM16_X0_TLS_IE_HI : constant := 78;  --  /usr/include/elf.h:3738
   R_TILEPRO_IMM16_X1_TLS_IE_HI : constant := 79;  --  /usr/include/elf.h:3739
   R_TILEPRO_IMM16_X0_TLS_IE_HA : constant := 80;  --  /usr/include/elf.h:3740
   R_TILEPRO_IMM16_X1_TLS_IE_HA : constant := 81;  --  /usr/include/elf.h:3741
   R_TILEPRO_TLS_DTPMOD32 : constant := 82;  --  /usr/include/elf.h:3742
   R_TILEPRO_TLS_DTPOFF32 : constant := 83;  --  /usr/include/elf.h:3743
   R_TILEPRO_TLS_TPOFF32 : constant := 84;  --  /usr/include/elf.h:3744
   R_TILEPRO_IMM16_X0_TLS_LE : constant := 85;  --  /usr/include/elf.h:3745
   R_TILEPRO_IMM16_X1_TLS_LE : constant := 86;  --  /usr/include/elf.h:3746
   R_TILEPRO_IMM16_X0_TLS_LE_LO : constant := 87;  --  /usr/include/elf.h:3747
   R_TILEPRO_IMM16_X1_TLS_LE_LO : constant := 88;  --  /usr/include/elf.h:3748
   R_TILEPRO_IMM16_X0_TLS_LE_HI : constant := 89;  --  /usr/include/elf.h:3749
   R_TILEPRO_IMM16_X1_TLS_LE_HI : constant := 90;  --  /usr/include/elf.h:3750
   R_TILEPRO_IMM16_X0_TLS_LE_HA : constant := 91;  --  /usr/include/elf.h:3751
   R_TILEPRO_IMM16_X1_TLS_LE_HA : constant := 92;  --  /usr/include/elf.h:3752

   R_TILEPRO_GNU_VTINHERIT : constant := 128;  --  /usr/include/elf.h:3754
   R_TILEPRO_GNU_VTENTRY : constant := 129;  --  /usr/include/elf.h:3755

   R_TILEPRO_NUM : constant := 130;  --  /usr/include/elf.h:3757

   R_TILEGX_NONE : constant := 0;  --  /usr/include/elf.h:3761
   R_TILEGX_64 : constant := 1;  --  /usr/include/elf.h:3762
   R_TILEGX_32 : constant := 2;  --  /usr/include/elf.h:3763
   R_TILEGX_16 : constant := 3;  --  /usr/include/elf.h:3764
   R_TILEGX_8 : constant := 4;  --  /usr/include/elf.h:3765
   R_TILEGX_64_PCREL : constant := 5;  --  /usr/include/elf.h:3766
   R_TILEGX_32_PCREL : constant := 6;  --  /usr/include/elf.h:3767
   R_TILEGX_16_PCREL : constant := 7;  --  /usr/include/elf.h:3768
   R_TILEGX_8_PCREL : constant := 8;  --  /usr/include/elf.h:3769
   R_TILEGX_HW0 : constant := 9;  --  /usr/include/elf.h:3770
   R_TILEGX_HW1 : constant := 10;  --  /usr/include/elf.h:3771
   R_TILEGX_HW2 : constant := 11;  --  /usr/include/elf.h:3772
   R_TILEGX_HW3 : constant := 12;  --  /usr/include/elf.h:3773
   R_TILEGX_HW0_LAST : constant := 13;  --  /usr/include/elf.h:3774
   R_TILEGX_HW1_LAST : constant := 14;  --  /usr/include/elf.h:3775
   R_TILEGX_HW2_LAST : constant := 15;  --  /usr/include/elf.h:3776
   R_TILEGX_COPY : constant := 16;  --  /usr/include/elf.h:3777
   R_TILEGX_GLOB_DAT : constant := 17;  --  /usr/include/elf.h:3778
   R_TILEGX_JMP_SLOT : constant := 18;  --  /usr/include/elf.h:3779
   R_TILEGX_RELATIVE : constant := 19;  --  /usr/include/elf.h:3780
   R_TILEGX_BROFF_X1 : constant := 20;  --  /usr/include/elf.h:3781
   R_TILEGX_JUMPOFF_X1 : constant := 21;  --  /usr/include/elf.h:3782
   R_TILEGX_JUMPOFF_X1_PLT : constant := 22;  --  /usr/include/elf.h:3783
   R_TILEGX_IMM8_X0 : constant := 23;  --  /usr/include/elf.h:3784
   R_TILEGX_IMM8_Y0 : constant := 24;  --  /usr/include/elf.h:3785
   R_TILEGX_IMM8_X1 : constant := 25;  --  /usr/include/elf.h:3786
   R_TILEGX_IMM8_Y1 : constant := 26;  --  /usr/include/elf.h:3787
   R_TILEGX_DEST_IMM8_X1 : constant := 27;  --  /usr/include/elf.h:3788
   R_TILEGX_MT_IMM14_X1 : constant := 28;  --  /usr/include/elf.h:3789
   R_TILEGX_MF_IMM14_X1 : constant := 29;  --  /usr/include/elf.h:3790
   R_TILEGX_MMSTART_X0 : constant := 30;  --  /usr/include/elf.h:3791
   R_TILEGX_MMEND_X0 : constant := 31;  --  /usr/include/elf.h:3792
   R_TILEGX_SHAMT_X0 : constant := 32;  --  /usr/include/elf.h:3793
   R_TILEGX_SHAMT_X1 : constant := 33;  --  /usr/include/elf.h:3794
   R_TILEGX_SHAMT_Y0 : constant := 34;  --  /usr/include/elf.h:3795
   R_TILEGX_SHAMT_Y1 : constant := 35;  --  /usr/include/elf.h:3796
   R_TILEGX_IMM16_X0_HW0 : constant := 36;  --  /usr/include/elf.h:3797
   R_TILEGX_IMM16_X1_HW0 : constant := 37;  --  /usr/include/elf.h:3798
   R_TILEGX_IMM16_X0_HW1 : constant := 38;  --  /usr/include/elf.h:3799
   R_TILEGX_IMM16_X1_HW1 : constant := 39;  --  /usr/include/elf.h:3800
   R_TILEGX_IMM16_X0_HW2 : constant := 40;  --  /usr/include/elf.h:3801
   R_TILEGX_IMM16_X1_HW2 : constant := 41;  --  /usr/include/elf.h:3802
   R_TILEGX_IMM16_X0_HW3 : constant := 42;  --  /usr/include/elf.h:3803
   R_TILEGX_IMM16_X1_HW3 : constant := 43;  --  /usr/include/elf.h:3804
   R_TILEGX_IMM16_X0_HW0_LAST : constant := 44;  --  /usr/include/elf.h:3805
   R_TILEGX_IMM16_X1_HW0_LAST : constant := 45;  --  /usr/include/elf.h:3806
   R_TILEGX_IMM16_X0_HW1_LAST : constant := 46;  --  /usr/include/elf.h:3807
   R_TILEGX_IMM16_X1_HW1_LAST : constant := 47;  --  /usr/include/elf.h:3808
   R_TILEGX_IMM16_X0_HW2_LAST : constant := 48;  --  /usr/include/elf.h:3809
   R_TILEGX_IMM16_X1_HW2_LAST : constant := 49;  --  /usr/include/elf.h:3810
   R_TILEGX_IMM16_X0_HW0_PCREL : constant := 50;  --  /usr/include/elf.h:3811
   R_TILEGX_IMM16_X1_HW0_PCREL : constant := 51;  --  /usr/include/elf.h:3812
   R_TILEGX_IMM16_X0_HW1_PCREL : constant := 52;  --  /usr/include/elf.h:3813
   R_TILEGX_IMM16_X1_HW1_PCREL : constant := 53;  --  /usr/include/elf.h:3814
   R_TILEGX_IMM16_X0_HW2_PCREL : constant := 54;  --  /usr/include/elf.h:3815
   R_TILEGX_IMM16_X1_HW2_PCREL : constant := 55;  --  /usr/include/elf.h:3816
   R_TILEGX_IMM16_X0_HW3_PCREL : constant := 56;  --  /usr/include/elf.h:3817
   R_TILEGX_IMM16_X1_HW3_PCREL : constant := 57;  --  /usr/include/elf.h:3818
   R_TILEGX_IMM16_X0_HW0_LAST_PCREL : constant := 58;  --  /usr/include/elf.h:3819
   R_TILEGX_IMM16_X1_HW0_LAST_PCREL : constant := 59;  --  /usr/include/elf.h:3820
   R_TILEGX_IMM16_X0_HW1_LAST_PCREL : constant := 60;  --  /usr/include/elf.h:3821
   R_TILEGX_IMM16_X1_HW1_LAST_PCREL : constant := 61;  --  /usr/include/elf.h:3822
   R_TILEGX_IMM16_X0_HW2_LAST_PCREL : constant := 62;  --  /usr/include/elf.h:3823
   R_TILEGX_IMM16_X1_HW2_LAST_PCREL : constant := 63;  --  /usr/include/elf.h:3824
   R_TILEGX_IMM16_X0_HW0_GOT : constant := 64;  --  /usr/include/elf.h:3825
   R_TILEGX_IMM16_X1_HW0_GOT : constant := 65;  --  /usr/include/elf.h:3826
   R_TILEGX_IMM16_X0_HW0_PLT_PCREL : constant := 66;  --  /usr/include/elf.h:3827
   R_TILEGX_IMM16_X1_HW0_PLT_PCREL : constant := 67;  --  /usr/include/elf.h:3828
   R_TILEGX_IMM16_X0_HW1_PLT_PCREL : constant := 68;  --  /usr/include/elf.h:3829
   R_TILEGX_IMM16_X1_HW1_PLT_PCREL : constant := 69;  --  /usr/include/elf.h:3830
   R_TILEGX_IMM16_X0_HW2_PLT_PCREL : constant := 70;  --  /usr/include/elf.h:3831
   R_TILEGX_IMM16_X1_HW2_PLT_PCREL : constant := 71;  --  /usr/include/elf.h:3832
   R_TILEGX_IMM16_X0_HW0_LAST_GOT : constant := 72;  --  /usr/include/elf.h:3833
   R_TILEGX_IMM16_X1_HW0_LAST_GOT : constant := 73;  --  /usr/include/elf.h:3834
   R_TILEGX_IMM16_X0_HW1_LAST_GOT : constant := 74;  --  /usr/include/elf.h:3835
   R_TILEGX_IMM16_X1_HW1_LAST_GOT : constant := 75;  --  /usr/include/elf.h:3836
   R_TILEGX_IMM16_X0_HW3_PLT_PCREL : constant := 76;  --  /usr/include/elf.h:3837
   R_TILEGX_IMM16_X1_HW3_PLT_PCREL : constant := 77;  --  /usr/include/elf.h:3838
   R_TILEGX_IMM16_X0_HW0_TLS_GD : constant := 78;  --  /usr/include/elf.h:3839
   R_TILEGX_IMM16_X1_HW0_TLS_GD : constant := 79;  --  /usr/include/elf.h:3840
   R_TILEGX_IMM16_X0_HW0_TLS_LE : constant := 80;  --  /usr/include/elf.h:3841
   R_TILEGX_IMM16_X1_HW0_TLS_LE : constant := 81;  --  /usr/include/elf.h:3842
   R_TILEGX_IMM16_X0_HW0_LAST_TLS_LE : constant := 82;  --  /usr/include/elf.h:3843
   R_TILEGX_IMM16_X1_HW0_LAST_TLS_LE : constant := 83;  --  /usr/include/elf.h:3844
   R_TILEGX_IMM16_X0_HW1_LAST_TLS_LE : constant := 84;  --  /usr/include/elf.h:3845
   R_TILEGX_IMM16_X1_HW1_LAST_TLS_LE : constant := 85;  --  /usr/include/elf.h:3846
   R_TILEGX_IMM16_X0_HW0_LAST_TLS_GD : constant := 86;  --  /usr/include/elf.h:3847
   R_TILEGX_IMM16_X1_HW0_LAST_TLS_GD : constant := 87;  --  /usr/include/elf.h:3848
   R_TILEGX_IMM16_X0_HW1_LAST_TLS_GD : constant := 88;  --  /usr/include/elf.h:3849
   R_TILEGX_IMM16_X1_HW1_LAST_TLS_GD : constant := 89;  --  /usr/include/elf.h:3850

   R_TILEGX_IMM16_X0_HW0_TLS_IE : constant := 92;  --  /usr/include/elf.h:3852
   R_TILEGX_IMM16_X1_HW0_TLS_IE : constant := 93;  --  /usr/include/elf.h:3853
   R_TILEGX_IMM16_X0_HW0_LAST_PLT_PCREL : constant := 94;  --  /usr/include/elf.h:3854
   R_TILEGX_IMM16_X1_HW0_LAST_PLT_PCREL : constant := 95;  --  /usr/include/elf.h:3855
   R_TILEGX_IMM16_X0_HW1_LAST_PLT_PCREL : constant := 96;  --  /usr/include/elf.h:3856
   R_TILEGX_IMM16_X1_HW1_LAST_PLT_PCREL : constant := 97;  --  /usr/include/elf.h:3857
   R_TILEGX_IMM16_X0_HW2_LAST_PLT_PCREL : constant := 98;  --  /usr/include/elf.h:3858
   R_TILEGX_IMM16_X1_HW2_LAST_PLT_PCREL : constant := 99;  --  /usr/include/elf.h:3859
   R_TILEGX_IMM16_X0_HW0_LAST_TLS_IE : constant := 100;  --  /usr/include/elf.h:3860
   R_TILEGX_IMM16_X1_HW0_LAST_TLS_IE : constant := 101;  --  /usr/include/elf.h:3861
   R_TILEGX_IMM16_X0_HW1_LAST_TLS_IE : constant := 102;  --  /usr/include/elf.h:3862
   R_TILEGX_IMM16_X1_HW1_LAST_TLS_IE : constant := 103;  --  /usr/include/elf.h:3863

   R_TILEGX_TLS_DTPMOD64 : constant := 106;  --  /usr/include/elf.h:3865
   R_TILEGX_TLS_DTPOFF64 : constant := 107;  --  /usr/include/elf.h:3866
   R_TILEGX_TLS_TPOFF64 : constant := 108;  --  /usr/include/elf.h:3867
   R_TILEGX_TLS_DTPMOD32 : constant := 109;  --  /usr/include/elf.h:3868
   R_TILEGX_TLS_DTPOFF32 : constant := 110;  --  /usr/include/elf.h:3869
   R_TILEGX_TLS_TPOFF32 : constant := 111;  --  /usr/include/elf.h:3870
   R_TILEGX_TLS_GD_CALL : constant := 112;  --  /usr/include/elf.h:3871
   R_TILEGX_IMM8_X0_TLS_GD_ADD : constant := 113;  --  /usr/include/elf.h:3872
   R_TILEGX_IMM8_X1_TLS_GD_ADD : constant := 114;  --  /usr/include/elf.h:3873
   R_TILEGX_IMM8_Y0_TLS_GD_ADD : constant := 115;  --  /usr/include/elf.h:3874
   R_TILEGX_IMM8_Y1_TLS_GD_ADD : constant := 116;  --  /usr/include/elf.h:3875
   R_TILEGX_TLS_IE_LOAD : constant := 117;  --  /usr/include/elf.h:3876
   R_TILEGX_IMM8_X0_TLS_ADD : constant := 118;  --  /usr/include/elf.h:3877
   R_TILEGX_IMM8_X1_TLS_ADD : constant := 119;  --  /usr/include/elf.h:3878
   R_TILEGX_IMM8_Y0_TLS_ADD : constant := 120;  --  /usr/include/elf.h:3879
   R_TILEGX_IMM8_Y1_TLS_ADD : constant := 121;  --  /usr/include/elf.h:3880

   R_TILEGX_GNU_VTINHERIT : constant := 128;  --  /usr/include/elf.h:3882
   R_TILEGX_GNU_VTENTRY : constant := 129;  --  /usr/include/elf.h:3883

   R_TILEGX_NUM : constant := 130;  --  /usr/include/elf.h:3885

   EF_RISCV_RVC : constant := 16#0001#;  --  /usr/include/elf.h:3888
   EF_RISCV_FLOAT_ABI : constant := 16#0006#;  --  /usr/include/elf.h:3889
   EF_RISCV_FLOAT_ABI_SOFT : constant := 16#0000#;  --  /usr/include/elf.h:3890
   EF_RISCV_FLOAT_ABI_SINGLE : constant := 16#0002#;  --  /usr/include/elf.h:3891
   EF_RISCV_FLOAT_ABI_DOUBLE : constant := 16#0004#;  --  /usr/include/elf.h:3892
   EF_RISCV_FLOAT_ABI_QUAD : constant := 16#0006#;  --  /usr/include/elf.h:3893

   R_RISCV_NONE : constant := 0;  --  /usr/include/elf.h:3896
   R_RISCV_32 : constant := 1;  --  /usr/include/elf.h:3897
   R_RISCV_64 : constant := 2;  --  /usr/include/elf.h:3898
   R_RISCV_RELATIVE : constant := 3;  --  /usr/include/elf.h:3899
   R_RISCV_COPY : constant := 4;  --  /usr/include/elf.h:3900
   R_RISCV_JUMP_SLOT : constant := 5;  --  /usr/include/elf.h:3901
   R_RISCV_TLS_DTPMOD32 : constant := 6;  --  /usr/include/elf.h:3902
   R_RISCV_TLS_DTPMOD64 : constant := 7;  --  /usr/include/elf.h:3903
   R_RISCV_TLS_DTPREL32 : constant := 8;  --  /usr/include/elf.h:3904
   R_RISCV_TLS_DTPREL64 : constant := 9;  --  /usr/include/elf.h:3905
   R_RISCV_TLS_TPREL32 : constant := 10;  --  /usr/include/elf.h:3906
   R_RISCV_TLS_TPREL64 : constant := 11;  --  /usr/include/elf.h:3907
   R_RISCV_BRANCH : constant := 16;  --  /usr/include/elf.h:3908
   R_RISCV_JAL : constant := 17;  --  /usr/include/elf.h:3909
   R_RISCV_CALL : constant := 18;  --  /usr/include/elf.h:3910
   R_RISCV_CALL_PLT : constant := 19;  --  /usr/include/elf.h:3911
   R_RISCV_GOT_HI20 : constant := 20;  --  /usr/include/elf.h:3912
   R_RISCV_TLS_GOT_HI20 : constant := 21;  --  /usr/include/elf.h:3913
   R_RISCV_TLS_GD_HI20 : constant := 22;  --  /usr/include/elf.h:3914
   R_RISCV_PCREL_HI20 : constant := 23;  --  /usr/include/elf.h:3915
   R_RISCV_PCREL_LO12_I : constant := 24;  --  /usr/include/elf.h:3916
   R_RISCV_PCREL_LO12_S : constant := 25;  --  /usr/include/elf.h:3917
   R_RISCV_HI20 : constant := 26;  --  /usr/include/elf.h:3918
   R_RISCV_LO12_I : constant := 27;  --  /usr/include/elf.h:3919
   R_RISCV_LO12_S : constant := 28;  --  /usr/include/elf.h:3920
   R_RISCV_TPREL_HI20 : constant := 29;  --  /usr/include/elf.h:3921
   R_RISCV_TPREL_LO12_I : constant := 30;  --  /usr/include/elf.h:3922
   R_RISCV_TPREL_LO12_S : constant := 31;  --  /usr/include/elf.h:3923
   R_RISCV_TPREL_ADD : constant := 32;  --  /usr/include/elf.h:3924
   R_RISCV_ADD8 : constant := 33;  --  /usr/include/elf.h:3925
   R_RISCV_ADD16 : constant := 34;  --  /usr/include/elf.h:3926
   R_RISCV_ADD32 : constant := 35;  --  /usr/include/elf.h:3927
   R_RISCV_ADD64 : constant := 36;  --  /usr/include/elf.h:3928
   R_RISCV_SUB8 : constant := 37;  --  /usr/include/elf.h:3929
   R_RISCV_SUB16 : constant := 38;  --  /usr/include/elf.h:3930
   R_RISCV_SUB32 : constant := 39;  --  /usr/include/elf.h:3931
   R_RISCV_SUB64 : constant := 40;  --  /usr/include/elf.h:3932
   R_RISCV_GNU_VTINHERIT : constant := 41;  --  /usr/include/elf.h:3933
   R_RISCV_GNU_VTENTRY : constant := 42;  --  /usr/include/elf.h:3934
   R_RISCV_ALIGN : constant := 43;  --  /usr/include/elf.h:3935
   R_RISCV_RVC_BRANCH : constant := 44;  --  /usr/include/elf.h:3936
   R_RISCV_RVC_JUMP : constant := 45;  --  /usr/include/elf.h:3937
   R_RISCV_RVC_LUI : constant := 46;  --  /usr/include/elf.h:3938
   R_RISCV_GPREL_I : constant := 47;  --  /usr/include/elf.h:3939
   R_RISCV_GPREL_S : constant := 48;  --  /usr/include/elf.h:3940
   R_RISCV_TPREL_I : constant := 49;  --  /usr/include/elf.h:3941
   R_RISCV_TPREL_S : constant := 50;  --  /usr/include/elf.h:3942
   R_RISCV_RELAX : constant := 51;  --  /usr/include/elf.h:3943
   R_RISCV_SUB6 : constant := 52;  --  /usr/include/elf.h:3944
   R_RISCV_SET6 : constant := 53;  --  /usr/include/elf.h:3945
   R_RISCV_SET8 : constant := 54;  --  /usr/include/elf.h:3946
   R_RISCV_SET16 : constant := 55;  --  /usr/include/elf.h:3947
   R_RISCV_SET32 : constant := 56;  --  /usr/include/elf.h:3948
   R_RISCV_32_PCREL : constant := 57;  --  /usr/include/elf.h:3949
   R_RISCV_IRELATIVE : constant := 58;  --  /usr/include/elf.h:3950

   R_RISCV_NUM : constant := 59;  --  /usr/include/elf.h:3952

   R_BPF_NONE : constant := 0;  --  /usr/include/elf.h:3956
   R_BPF_64_64 : constant := 1;  --  /usr/include/elf.h:3957
   R_BPF_64_32 : constant := 10;  --  /usr/include/elf.h:3958

   R_METAG_HIADDR16 : constant := 0;  --  /usr/include/elf.h:3962
   R_METAG_LOADDR16 : constant := 1;  --  /usr/include/elf.h:3963
   R_METAG_ADDR32 : constant := 2;  --  /usr/include/elf.h:3964
   R_METAG_NONE : constant := 3;  --  /usr/include/elf.h:3965
   R_METAG_RELBRANCH : constant := 4;  --  /usr/include/elf.h:3966
   R_METAG_GETSETOFF : constant := 5;  --  /usr/include/elf.h:3967

   R_METAG_REG32OP1 : constant := 6;  --  /usr/include/elf.h:3970
   R_METAG_REG32OP2 : constant := 7;  --  /usr/include/elf.h:3971
   R_METAG_REG32OP3 : constant := 8;  --  /usr/include/elf.h:3972
   R_METAG_REG16OP1 : constant := 9;  --  /usr/include/elf.h:3973
   R_METAG_REG16OP2 : constant := 10;  --  /usr/include/elf.h:3974
   R_METAG_REG16OP3 : constant := 11;  --  /usr/include/elf.h:3975
   R_METAG_REG32OP4 : constant := 12;  --  /usr/include/elf.h:3976

   R_METAG_HIOG : constant := 13;  --  /usr/include/elf.h:3978
   R_METAG_LOOG : constant := 14;  --  /usr/include/elf.h:3979

   R_METAG_REL8 : constant := 15;  --  /usr/include/elf.h:3981
   R_METAG_REL16 : constant := 16;  --  /usr/include/elf.h:3982

   R_METAG_GNU_VTINHERIT : constant := 30;  --  /usr/include/elf.h:3985
   R_METAG_GNU_VTENTRY : constant := 31;  --  /usr/include/elf.h:3986

   R_METAG_HI16_GOTOFF : constant := 32;  --  /usr/include/elf.h:3989
   R_METAG_LO16_GOTOFF : constant := 33;  --  /usr/include/elf.h:3990
   R_METAG_GETSET_GOTOFF : constant := 34;  --  /usr/include/elf.h:3991
   R_METAG_GETSET_GOT : constant := 35;  --  /usr/include/elf.h:3992
   R_METAG_HI16_GOTPC : constant := 36;  --  /usr/include/elf.h:3993
   R_METAG_LO16_GOTPC : constant := 37;  --  /usr/include/elf.h:3994
   R_METAG_HI16_PLT : constant := 38;  --  /usr/include/elf.h:3995
   R_METAG_LO16_PLT : constant := 39;  --  /usr/include/elf.h:3996
   R_METAG_RELBRANCH_PLT : constant := 40;  --  /usr/include/elf.h:3997
   R_METAG_GOTOFF : constant := 41;  --  /usr/include/elf.h:3998
   R_METAG_PLT : constant := 42;  --  /usr/include/elf.h:3999
   R_METAG_COPY : constant := 43;  --  /usr/include/elf.h:4000
   R_METAG_JMP_SLOT : constant := 44;  --  /usr/include/elf.h:4001
   R_METAG_RELATIVE : constant := 45;  --  /usr/include/elf.h:4002
   R_METAG_GLOB_DAT : constant := 46;  --  /usr/include/elf.h:4003

   R_METAG_TLS_GD : constant := 47;  --  /usr/include/elf.h:4006
   R_METAG_TLS_LDM : constant := 48;  --  /usr/include/elf.h:4007
   R_METAG_TLS_LDO_HI16 : constant := 49;  --  /usr/include/elf.h:4008
   R_METAG_TLS_LDO_LO16 : constant := 50;  --  /usr/include/elf.h:4009
   R_METAG_TLS_LDO : constant := 51;  --  /usr/include/elf.h:4010
   R_METAG_TLS_IE : constant := 52;  --  /usr/include/elf.h:4011
   R_METAG_TLS_IENONPIC : constant := 53;  --  /usr/include/elf.h:4012
   R_METAG_TLS_IENONPIC_HI16 : constant := 54;  --  /usr/include/elf.h:4013
   R_METAG_TLS_IENONPIC_LO16 : constant := 55;  --  /usr/include/elf.h:4014
   R_METAG_TLS_TPOFF : constant := 56;  --  /usr/include/elf.h:4015
   R_METAG_TLS_DTPMOD : constant := 57;  --  /usr/include/elf.h:4016
   R_METAG_TLS_DTPOFF : constant := 58;  --  /usr/include/elf.h:4017
   R_METAG_TLS_LE : constant := 59;  --  /usr/include/elf.h:4018
   R_METAG_TLS_LE_HI16 : constant := 60;  --  /usr/include/elf.h:4019
   R_METAG_TLS_LE_LO16 : constant := 61;  --  /usr/include/elf.h:4020

   R_NDS32_NONE : constant := 0;  --  /usr/include/elf.h:4023
   R_NDS32_32_RELA : constant := 20;  --  /usr/include/elf.h:4024
   R_NDS32_COPY : constant := 39;  --  /usr/include/elf.h:4025
   R_NDS32_GLOB_DAT : constant := 40;  --  /usr/include/elf.h:4026
   R_NDS32_JMP_SLOT : constant := 41;  --  /usr/include/elf.h:4027
   R_NDS32_RELATIVE : constant := 42;  --  /usr/include/elf.h:4028
   R_NDS32_TLS_TPOFF : constant := 102;  --  /usr/include/elf.h:4029
   R_NDS32_TLS_DESC : constant := 119;  --  /usr/include/elf.h:4030

   R_ARC_NONE : constant := 16#0#;  --  /usr/include/elf.h:4033
   R_ARC_8 : constant := 16#1#;  --  /usr/include/elf.h:4034
   R_ARC_16 : constant := 16#2#;  --  /usr/include/elf.h:4035
   R_ARC_24 : constant := 16#3#;  --  /usr/include/elf.h:4036
   R_ARC_32 : constant := 16#4#;  --  /usr/include/elf.h:4037
   R_ARC_B26 : constant := 16#5#;  --  /usr/include/elf.h:4038
   R_ARC_B22_PCREL : constant := 16#6#;  --  /usr/include/elf.h:4039
   R_ARC_H30 : constant := 16#7#;  --  /usr/include/elf.h:4040
   R_ARC_N8 : constant := 16#8#;  --  /usr/include/elf.h:4041
   R_ARC_N16 : constant := 16#9#;  --  /usr/include/elf.h:4042
   R_ARC_N24 : constant := 16#A#;  --  /usr/include/elf.h:4043
   R_ARC_N32 : constant := 16#B#;  --  /usr/include/elf.h:4044
   R_ARC_SDA : constant := 16#C#;  --  /usr/include/elf.h:4045
   R_ARC_SECTOFF : constant := 16#D#;  --  /usr/include/elf.h:4046
   R_ARC_S21H_PCREL : constant := 16#E#;  --  /usr/include/elf.h:4047
   R_ARC_S21W_PCREL : constant := 16#F#;  --  /usr/include/elf.h:4048
   R_ARC_S25H_PCREL : constant := 16#10#;  --  /usr/include/elf.h:4049
   R_ARC_S25W_PCREL : constant := 16#11#;  --  /usr/include/elf.h:4050
   R_ARC_SDA32 : constant := 16#12#;  --  /usr/include/elf.h:4051
   R_ARC_SDA_LDST : constant := 16#13#;  --  /usr/include/elf.h:4052
   R_ARC_SDA_LDST1 : constant := 16#14#;  --  /usr/include/elf.h:4053
   R_ARC_SDA_LDST2 : constant := 16#15#;  --  /usr/include/elf.h:4054
   R_ARC_SDA16_LD : constant := 16#16#;  --  /usr/include/elf.h:4055
   R_ARC_SDA16_LD1 : constant := 16#17#;  --  /usr/include/elf.h:4056
   R_ARC_SDA16_LD2 : constant := 16#18#;  --  /usr/include/elf.h:4057
   R_ARC_S13_PCREL : constant := 16#19#;  --  /usr/include/elf.h:4058
   R_ARC_W : constant := 16#1A#;  --  /usr/include/elf.h:4059
   R_ARC_32_ME : constant := 16#1B#;  --  /usr/include/elf.h:4060
   R_ARC_N32_ME : constant := 16#1C#;  --  /usr/include/elf.h:4061
   R_ARC_SECTOFF_ME : constant := 16#1D#;  --  /usr/include/elf.h:4062
   R_ARC_SDA32_ME : constant := 16#1E#;  --  /usr/include/elf.h:4063
   R_ARC_W_ME : constant := 16#1F#;  --  /usr/include/elf.h:4064
   R_ARC_H30_ME : constant := 16#20#;  --  /usr/include/elf.h:4065
   R_ARC_SECTOFF_U8 : constant := 16#21#;  --  /usr/include/elf.h:4066
   R_ARC_SECTOFF_S9 : constant := 16#22#;  --  /usr/include/elf.h:4067
   R_AC_SECTOFF_U8 : constant := 16#23#;  --  /usr/include/elf.h:4068
   R_AC_SECTOFF_U8_1 : constant := 16#24#;  --  /usr/include/elf.h:4069
   R_AC_SECTOFF_U8_2 : constant := 16#25#;  --  /usr/include/elf.h:4070
   R_AC_SECTOFF_S9 : constant := 16#26#;  --  /usr/include/elf.h:4071
   R_AC_SECTOFF_S9_1 : constant := 16#27#;  --  /usr/include/elf.h:4072
   R_AC_SECTOFF_S9_2 : constant := 16#28#;  --  /usr/include/elf.h:4073
   R_ARC_SECTOFF_ME_1 : constant := 16#29#;  --  /usr/include/elf.h:4074
   R_ARC_SECTOFF_ME_2 : constant := 16#2A#;  --  /usr/include/elf.h:4075
   R_ARC_SECTOFF_1 : constant := 16#2B#;  --  /usr/include/elf.h:4076
   R_ARC_SECTOFF_2 : constant := 16#2C#;  --  /usr/include/elf.h:4077
   R_ARC_PC32 : constant := 16#32#;  --  /usr/include/elf.h:4078
   R_ARC_GOTPC32 : constant := 16#33#;  --  /usr/include/elf.h:4079
   R_ARC_PLT32 : constant := 16#34#;  --  /usr/include/elf.h:4080
   R_ARC_COPY : constant := 16#35#;  --  /usr/include/elf.h:4081
   R_ARC_GLOB_DAT : constant := 16#36#;  --  /usr/include/elf.h:4082
   R_ARC_JUMP_SLOT : constant := 16#37#;  --  /usr/include/elf.h:4083
   R_ARC_RELATIVE : constant := 16#38#;  --  /usr/include/elf.h:4084
   R_ARC_GOTOFF : constant := 16#39#;  --  /usr/include/elf.h:4085
   R_ARC_GOTPC : constant := 16#3A#;  --  /usr/include/elf.h:4086
   R_ARC_GOT32 : constant := 16#3B#;  --  /usr/include/elf.h:4087

   R_ARC_TLS_DTPMOD : constant := 16#42#;  --  /usr/include/elf.h:4089
   R_ARC_TLS_DTPOFF : constant := 16#43#;  --  /usr/include/elf.h:4090
   R_ARC_TLS_TPOFF : constant := 16#44#;  --  /usr/include/elf.h:4091
   R_ARC_TLS_GD_GOT : constant := 16#45#;  --  /usr/include/elf.h:4092
   R_ARC_TLS_GD_LD : constant := 16#46#;  --  /usr/include/elf.h:4093
   R_ARC_TLS_GD_CALL : constant := 16#47#;  --  /usr/include/elf.h:4094
   R_ARC_TLS_IE_GOT : constant := 16#48#;  --  /usr/include/elf.h:4095
   R_ARC_TLS_DTPOFF_S9 : constant := 16#4a#;  --  /usr/include/elf.h:4096
   R_ARC_TLS_LE_S9 : constant := 16#4a#;  --  /usr/include/elf.h:4097
   R_ARC_TLS_LE_32 : constant := 16#4b#;  --  /usr/include/elf.h:4098

  -- This file defines standard ELF types, structures, and macros.
  --   Copyright (C) 1995-2021 Free Software Foundation, Inc.
  --   This file is part of the GNU C Library.
  --   The GNU C Library is free software; you can redistribute it and/or
  --   modify it under the terms of the GNU Lesser General Public
  --   License as published by the Free Software Foundation; either
  --   version 2.1 of the License, or (at your option) any later version.
  --   The GNU C Library is distributed in the hope that it will be useful,
  --   but WITHOUT ANY WARRANTY; without even the implied warranty of
  --   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  --   Lesser General Public License for more details.
  --   You should have received a copy of the GNU Lesser General Public
  --   License along with the GNU C Library; if not, see
  --   <https://www.gnu.org/licenses/>.   

  -- Standard ELF types.   
  -- Type for a 16-bit quantity.   
   subtype Elf32_Half is bits_stdint_uintn_h.uint16_t;  -- /usr/include/elf.h:27

   subtype Elf64_Half is bits_stdint_uintn_h.uint16_t;  -- /usr/include/elf.h:28

  -- Types for signed and unsigned 32-bit quantities.   
   subtype Elf32_Word is bits_stdint_uintn_h.uint32_t;  -- /usr/include/elf.h:31

   subtype Elf32_Sword is bits_stdint_intn_h.int32_t;  -- /usr/include/elf.h:32

   subtype Elf64_Word is bits_stdint_uintn_h.uint32_t;  -- /usr/include/elf.h:33

   subtype Elf64_Sword is bits_stdint_intn_h.int32_t;  -- /usr/include/elf.h:34

  -- Types for signed and unsigned 64-bit quantities.   
   subtype Elf32_Xword is bits_stdint_uintn_h.uint64_t;  -- /usr/include/elf.h:37

   subtype Elf32_Sxword is bits_stdint_intn_h.int64_t;  -- /usr/include/elf.h:38

   subtype Elf64_Xword is bits_stdint_uintn_h.uint64_t;  -- /usr/include/elf.h:39

   subtype Elf64_Sxword is bits_stdint_intn_h.int64_t;  -- /usr/include/elf.h:40

  -- Type of addresses.   
   subtype Elf32_Addr is bits_stdint_uintn_h.uint32_t;  -- /usr/include/elf.h:43

   subtype Elf64_Addr is bits_stdint_uintn_h.uint64_t;  -- /usr/include/elf.h:44

  -- Type of file offsets.   
   subtype Elf32_Off is bits_stdint_uintn_h.uint32_t;  -- /usr/include/elf.h:47

   subtype Elf64_Off is bits_stdint_uintn_h.uint64_t;  -- /usr/include/elf.h:48

  -- Type for section indices, which are 16-bit quantities.   
   subtype Elf32_Section is bits_stdint_uintn_h.uint16_t;  -- /usr/include/elf.h:51

   subtype Elf64_Section is bits_stdint_uintn_h.uint16_t;  -- /usr/include/elf.h:52

  -- Type for version symbol information.   
   subtype Elf32_Versym is Elf32_Half;  -- /usr/include/elf.h:55

   subtype Elf64_Versym is Elf64_Half;  -- /usr/include/elf.h:56

  -- The ELF file header.  This appears at the start of every ELF file.   
  -- Magic number and other info  
  -- Object file type  
  -- Architecture  
  -- Object file version  
  -- Entry point virtual address  
  -- Program header table file offset  
  -- Section header table file offset  
  -- Processor-specific flags  
  -- ELF header size in bytes  
  -- Program header table entry size  
  -- Program header table entry count  
  -- Section header table entry size  
  -- Section header table entry count  
  -- Section header string table index  
   type Elf32_Ehdr_array948 is array (0 .. 15) of aliased unsigned_char;
   type Elf32_Ehdr is record
      e_ident : aliased Elf32_Ehdr_array948;  -- /usr/include/elf.h:65
      e_type : aliased Elf32_Half;  -- /usr/include/elf.h:66
      e_machine : aliased Elf32_Half;  -- /usr/include/elf.h:67
      e_version : aliased Elf32_Word;  -- /usr/include/elf.h:68
      e_entry : aliased Elf32_Addr;  -- /usr/include/elf.h:69
      e_phoff : aliased Elf32_Off;  -- /usr/include/elf.h:70
      e_shoff : aliased Elf32_Off;  -- /usr/include/elf.h:71
      e_flags : aliased Elf32_Word;  -- /usr/include/elf.h:72
      e_ehsize : aliased Elf32_Half;  -- /usr/include/elf.h:73
      e_phentsize : aliased Elf32_Half;  -- /usr/include/elf.h:74
      e_phnum : aliased Elf32_Half;  -- /usr/include/elf.h:75
      e_shentsize : aliased Elf32_Half;  -- /usr/include/elf.h:76
      e_shnum : aliased Elf32_Half;  -- /usr/include/elf.h:77
      e_shstrndx : aliased Elf32_Half;  -- /usr/include/elf.h:78
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/elf.h:79

  -- Magic number and other info  
  -- Object file type  
  -- Architecture  
  -- Object file version  
  -- Entry point virtual address  
  -- Program header table file offset  
  -- Section header table file offset  
  -- Processor-specific flags  
  -- ELF header size in bytes  
  -- Program header table entry size  
  -- Program header table entry count  
  -- Section header table entry size  
  -- Section header table entry count  
  -- Section header string table index  
   type Elf64_Ehdr_array948 is array (0 .. 15) of aliased unsigned_char;
   type Elf64_Ehdr is record
      e_ident : aliased Elf64_Ehdr_array948;  -- /usr/include/elf.h:83
      e_type : aliased Elf64_Half;  -- /usr/include/elf.h:84
      e_machine : aliased Elf64_Half;  -- /usr/include/elf.h:85
      e_version : aliased Elf64_Word;  -- /usr/include/elf.h:86
      e_entry : aliased Elf64_Addr;  -- /usr/include/elf.h:87
      e_phoff : aliased Elf64_Off;  -- /usr/include/elf.h:88
      e_shoff : aliased Elf64_Off;  -- /usr/include/elf.h:89
      e_flags : aliased Elf64_Word;  -- /usr/include/elf.h:90
      e_ehsize : aliased Elf64_Half;  -- /usr/include/elf.h:91
      e_phentsize : aliased Elf64_Half;  -- /usr/include/elf.h:92
      e_phnum : aliased Elf64_Half;  -- /usr/include/elf.h:93
      e_shentsize : aliased Elf64_Half;  -- /usr/include/elf.h:94
      e_shnum : aliased Elf64_Half;  -- /usr/include/elf.h:95
      e_shstrndx : aliased Elf64_Half;  -- /usr/include/elf.h:96
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/elf.h:97

  -- Fields in the e_ident array.  The EI_* macros are indices into the
  --   array.  The macros under each EI_* macro are the values the byte
  --   may have.   

  -- Conglomeration of the identification bytes, for easy testing as a word.   
  -- Value must be EV_CURRENT  
  -- Legal values for e_type (object file type).   
  -- Legal values for e_machine (architecture).   
  -- reserved 11-14  
  -- reserved 16  
  -- reserved 24-35  
  -- reserved 121-130  
  -- reserved 145-159  
  -- reserved 182  
  -- reserved 184  
  -- reserved 205-209  
  -- reserved 225-242  
  -- Old spellings/synonyms.   
  -- If it is necessary to assign new unofficial EM_* values, please
  --   pick large random numbers (0x8523, 0xa7f2, etc.) to minimize the
  --   chances of collision with official or non-GNU unofficial values.   

  -- Legal values for e_version (version).   
  -- Section header.   
  -- Section name (string tbl index)  
  -- Section type  
  -- Section flags  
  -- Section virtual addr at execution  
  -- Section file offset  
  -- Section size in bytes  
  -- Link to another section  
  -- Additional section information  
  -- Section alignment  
  -- Entry size if section holds table  
   type Elf32_Shdr is record
      sh_name : aliased Elf32_Word;  -- /usr/include/elf.h:383
      sh_type : aliased Elf32_Word;  -- /usr/include/elf.h:384
      sh_flags : aliased Elf32_Word;  -- /usr/include/elf.h:385
      sh_addr : aliased Elf32_Addr;  -- /usr/include/elf.h:386
      sh_offset : aliased Elf32_Off;  -- /usr/include/elf.h:387
      sh_size : aliased Elf32_Word;  -- /usr/include/elf.h:388
      sh_link : aliased Elf32_Word;  -- /usr/include/elf.h:389
      sh_info : aliased Elf32_Word;  -- /usr/include/elf.h:390
      sh_addralign : aliased Elf32_Word;  -- /usr/include/elf.h:391
      sh_entsize : aliased Elf32_Word;  -- /usr/include/elf.h:392
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/elf.h:393

  -- Section name (string tbl index)  
  -- Section type  
  -- Section flags  
  -- Section virtual addr at execution  
  -- Section file offset  
  -- Section size in bytes  
  -- Link to another section  
  -- Additional section information  
  -- Section alignment  
  -- Entry size if section holds table  
   type Elf64_Shdr is record
      sh_name : aliased Elf64_Word;  -- /usr/include/elf.h:397
      sh_type : aliased Elf64_Word;  -- /usr/include/elf.h:398
      sh_flags : aliased Elf64_Xword;  -- /usr/include/elf.h:399
      sh_addr : aliased Elf64_Addr;  -- /usr/include/elf.h:400
      sh_offset : aliased Elf64_Off;  -- /usr/include/elf.h:401
      sh_size : aliased Elf64_Xword;  -- /usr/include/elf.h:402
      sh_link : aliased Elf64_Word;  -- /usr/include/elf.h:403
      sh_info : aliased Elf64_Word;  -- /usr/include/elf.h:404
      sh_addralign : aliased Elf64_Xword;  -- /usr/include/elf.h:405
      sh_entsize : aliased Elf64_Xword;  -- /usr/include/elf.h:406
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/elf.h:407

  -- Special section indices.   
  -- Legal values for sh_type (section type).   
  -- Legal values for sh_flags (section flags).   
  -- Section compression header.  Used when SHF_COMPRESSED is set.   
  -- Compression format.   
  -- Uncompressed data size.   
  -- Uncompressed data alignment.   
   type Elf32_Chdr is record
      ch_type : aliased Elf32_Word;  -- /usr/include/elf.h:491
      ch_size : aliased Elf32_Word;  -- /usr/include/elf.h:492
      ch_addralign : aliased Elf32_Word;  -- /usr/include/elf.h:493
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/elf.h:494

  -- Compression format.   
  -- Uncompressed data size.   
  -- Uncompressed data alignment.   
   type Elf64_Chdr is record
      ch_type : aliased Elf64_Word;  -- /usr/include/elf.h:498
      ch_reserved : aliased Elf64_Word;  -- /usr/include/elf.h:499
      ch_size : aliased Elf64_Xword;  -- /usr/include/elf.h:500
      ch_addralign : aliased Elf64_Xword;  -- /usr/include/elf.h:501
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/elf.h:502

  -- Legal values for ch_type (compression algorithm).   
  -- Section group handling.   
  -- Symbol table entry.   
  -- Symbol name (string tbl index)  
  -- Symbol value  
  -- Symbol size  
  -- Symbol type and binding  
  -- Symbol visibility  
  -- Section index  
   type Elf32_Sym is record
      st_name : aliased Elf32_Word;  -- /usr/include/elf.h:518
      st_value : aliased Elf32_Addr;  -- /usr/include/elf.h:519
      st_size : aliased Elf32_Word;  -- /usr/include/elf.h:520
      st_info : aliased unsigned_char;  -- /usr/include/elf.h:521
      st_other : aliased unsigned_char;  -- /usr/include/elf.h:522
      st_shndx : aliased Elf32_Section;  -- /usr/include/elf.h:523
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/elf.h:524

  -- Symbol name (string tbl index)  
  -- Symbol type and binding  
  -- Symbol visibility  
  -- Section index  
  -- Symbol value  
  -- Symbol size  
   type Elf64_Sym is record
      st_name : aliased Elf64_Word;  -- /usr/include/elf.h:528
      st_info : aliased unsigned_char;  -- /usr/include/elf.h:529
      st_other : aliased unsigned_char;  -- /usr/include/elf.h:530
      st_shndx : aliased Elf64_Section;  -- /usr/include/elf.h:531
      st_value : aliased Elf64_Addr;  -- /usr/include/elf.h:532
      st_size : aliased Elf64_Xword;  -- /usr/include/elf.h:533
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/elf.h:534

  -- The syminfo section if available contains additional information about
  --   every dynamic symbol.   

  -- Direct bindings, symbol bound to  
  -- Per symbol flags  
   type Elf32_Syminfo is record
      si_boundto : aliased Elf32_Half;  -- /usr/include/elf.h:541
      si_flags : aliased Elf32_Half;  -- /usr/include/elf.h:542
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/elf.h:543

  -- Direct bindings, symbol bound to  
  -- Per symbol flags  
   type Elf64_Syminfo is record
      si_boundto : aliased Elf64_Half;  -- /usr/include/elf.h:547
      si_flags : aliased Elf64_Half;  -- /usr/include/elf.h:548
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/elf.h:549

  -- Possible values for si_boundto.   
  -- Possible bitmasks for si_flags.   
  -- Syminfo version values.   
  -- How to extract and insert information held in the st_info field.   
  -- Both Elf32_Sym and Elf64_Sym use the same one-byte st_info field.   
  -- Legal values for ST_BIND subfield of st_info (symbol binding).   
  -- Legal values for ST_TYPE subfield of st_info (symbol type).   
  -- Symbol table indices are found in the hash buckets and chain table
  --   of a symbol hash table section.  This special index value indicates
  --   the end of a chain, meaning no further symbols are found in that bucket.   

  -- How to extract and insert information held in the st_other field.   
  -- For ELF64 the definitions are the same.   
  -- Symbol visibility specification encoded in the st_other field.   
  -- Relocation table entry without addend (in section of type SHT_REL).   
  -- Address  
  -- Relocation type and symbol index  
   type Elf32_Rel is record
      r_offset : aliased Elf32_Addr;  -- /usr/include/elf.h:633
      r_info : aliased Elf32_Word;  -- /usr/include/elf.h:634
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/elf.h:635

  -- I have seen two different definitions of the Elf64_Rel and
  --   Elf64_Rela structures, so we'll leave them out until Novell (or
  --   whoever) gets their act together.   

  -- The following, at least, is used on Sparc v9, MIPS, and Alpha.   
  -- Address  
  -- Relocation type and symbol index  
   type Elf64_Rel is record
      r_offset : aliased Elf64_Addr;  -- /usr/include/elf.h:644
      r_info : aliased Elf64_Xword;  -- /usr/include/elf.h:645
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/elf.h:646

  -- Relocation table entry with addend (in section of type SHT_RELA).   
  -- Address  
  -- Relocation type and symbol index  
  -- Addend  
   type Elf32_Rela is record
      r_offset : aliased Elf32_Addr;  -- /usr/include/elf.h:652
      r_info : aliased Elf32_Word;  -- /usr/include/elf.h:653
      r_addend : aliased Elf32_Sword;  -- /usr/include/elf.h:654
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/elf.h:655

  -- Address  
  -- Relocation type and symbol index  
  -- Addend  
   type Elf64_Rela is record
      r_offset : aliased Elf64_Addr;  -- /usr/include/elf.h:659
      r_info : aliased Elf64_Xword;  -- /usr/include/elf.h:660
      r_addend : aliased Elf64_Sxword;  -- /usr/include/elf.h:661
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/elf.h:662

  -- How to extract and insert information held in the r_info field.   
  -- Program segment header.   
  -- Segment type  
  -- Segment file offset  
  -- Segment virtual address  
  -- Segment physical address  
  -- Segment size in file  
  -- Segment size in memory  
  -- Segment flags  
  -- Segment alignment  
   type Elf32_Phdr is record
      p_type : aliased Elf32_Word;  -- /usr/include/elf.h:678
      p_offset : aliased Elf32_Off;  -- /usr/include/elf.h:679
      p_vaddr : aliased Elf32_Addr;  -- /usr/include/elf.h:680
      p_paddr : aliased Elf32_Addr;  -- /usr/include/elf.h:681
      p_filesz : aliased Elf32_Word;  -- /usr/include/elf.h:682
      p_memsz : aliased Elf32_Word;  -- /usr/include/elf.h:683
      p_flags : aliased Elf32_Word;  -- /usr/include/elf.h:684
      p_align : aliased Elf32_Word;  -- /usr/include/elf.h:685
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/elf.h:686

  -- Segment type  
  -- Segment flags  
  -- Segment file offset  
  -- Segment virtual address  
  -- Segment physical address  
  -- Segment size in file  
  -- Segment size in memory  
  -- Segment alignment  
   type Elf64_Phdr is record
      p_type : aliased Elf64_Word;  -- /usr/include/elf.h:690
      p_flags : aliased Elf64_Word;  -- /usr/include/elf.h:691
      p_offset : aliased Elf64_Off;  -- /usr/include/elf.h:692
      p_vaddr : aliased Elf64_Addr;  -- /usr/include/elf.h:693
      p_paddr : aliased Elf64_Addr;  -- /usr/include/elf.h:694
      p_filesz : aliased Elf64_Xword;  -- /usr/include/elf.h:695
      p_memsz : aliased Elf64_Xword;  -- /usr/include/elf.h:696
      p_align : aliased Elf64_Xword;  -- /usr/include/elf.h:697
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/elf.h:698

  -- Special value for e_phnum.  This indicates that the real number of
  --   program headers is too large to fit into e_phnum.  Instead the real
  --   value is in the field sh_info of section 0.   

  -- Legal values for p_type (segment type).   
  -- Legal values for p_flags (segment flags).   
  -- Legal values for note segment descriptor types for core files.  
  -- Legal values for the note segment descriptor types for object files.   
  -- Dynamic section entry.   
  -- Dynamic entry type  
  -- Integer value  
  -- Address value  
   type Elf32_Dyn_union981 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            d_val : aliased Elf32_Word;  -- /usr/include/elf.h:833
         when others =>
            d_ptr : aliased Elf32_Addr;  -- /usr/include/elf.h:834
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;
   type Elf32_Dyn is record
      d_tag : aliased Elf32_Sword;  -- /usr/include/elf.h:830
      d_un : aliased Elf32_Dyn_union981;  -- /usr/include/elf.h:835
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/elf.h:836

  -- Dynamic entry type  
  -- Integer value  
  -- Address value  
   type Elf64_Dyn_union984 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            d_val : aliased Elf64_Xword;  -- /usr/include/elf.h:843
         when others =>
            d_ptr : aliased Elf64_Addr;  -- /usr/include/elf.h:844
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;
   type Elf64_Dyn is record
      d_tag : aliased Elf64_Sxword;  -- /usr/include/elf.h:840
      d_un : aliased Elf64_Dyn_union984;  -- /usr/include/elf.h:845
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/elf.h:846

  -- Legal values for d_tag (dynamic entry type).   
  -- DT_* entries which fall between DT_VALRNGHI & DT_VALRNGLO use the
  --   Dyn.d_un.d_val field of the Elf*_Dyn structure.  This follows Sun's
  --   approach.   

  -- DT_* entries which fall between DT_ADDRRNGHI & DT_ADDRRNGLO use the
  --   Dyn.d_un.d_ptr field of the Elf*_Dyn structure.
  --   If any adjustment is made to the ELF object after it has been
  --   built these entries will need to be adjusted.   

  -- The versioning entry types.  The next are defined as part of the
  --   GNU extension.   

  -- These were chosen by Sun.   
  -- Sun added these machine-independent extensions in the "processor-specific"
  --   range.  Be compatible.   

  -- Values of `d_un.d_val' in the DT_FLAGS entry.   
  -- State flags selectable in the `d_un.d_val' element of the DT_FLAGS_1
  --   entry in the dynamic section.   

  -- Flags for the feature selection in DT_FEATURE_1.   
  -- Flags in the DT_POSFLAG_1 entry effecting only the next DT_* entry.   
  -- Version definition sections.   
  -- Version revision  
  -- Version information  
  -- Version Index  
  -- Number of associated aux entries  
  -- Version name hash value  
  -- Offset in bytes to verdaux array  
  -- Offset in bytes to next verdef
  --					   entry  

   type Elf32_Verdef is record
      vd_version : aliased Elf32_Half;  -- /usr/include/elf.h:1012
      vd_flags : aliased Elf32_Half;  -- /usr/include/elf.h:1013
      vd_ndx : aliased Elf32_Half;  -- /usr/include/elf.h:1014
      vd_cnt : aliased Elf32_Half;  -- /usr/include/elf.h:1015
      vd_hash : aliased Elf32_Word;  -- /usr/include/elf.h:1016
      vd_aux : aliased Elf32_Word;  -- /usr/include/elf.h:1017
      vd_next : aliased Elf32_Word;  -- /usr/include/elf.h:1018
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/elf.h:1020

  -- Version revision  
  -- Version information  
  -- Version Index  
  -- Number of associated aux entries  
  -- Version name hash value  
  -- Offset in bytes to verdaux array  
  -- Offset in bytes to next verdef
  --					   entry  

   type Elf64_Verdef is record
      vd_version : aliased Elf64_Half;  -- /usr/include/elf.h:1024
      vd_flags : aliased Elf64_Half;  -- /usr/include/elf.h:1025
      vd_ndx : aliased Elf64_Half;  -- /usr/include/elf.h:1026
      vd_cnt : aliased Elf64_Half;  -- /usr/include/elf.h:1027
      vd_hash : aliased Elf64_Word;  -- /usr/include/elf.h:1028
      vd_aux : aliased Elf64_Word;  -- /usr/include/elf.h:1029
      vd_next : aliased Elf64_Word;  -- /usr/include/elf.h:1030
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/elf.h:1032

  -- Legal values for vd_version (version revision).   
  -- Legal values for vd_flags (version information flags).   
  -- Versym symbol index values.   
  -- Auxiliary version information.   
  -- Version or dependency names  
  -- Offset in bytes to next verdaux
  --					   entry  

   type Elf32_Verdaux is record
      vda_name : aliased Elf32_Word;  -- /usr/include/elf.h:1054
      vda_next : aliased Elf32_Word;  -- /usr/include/elf.h:1055
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/elf.h:1057

  -- Version or dependency names  
  -- Offset in bytes to next verdaux
  --					   entry  

   type Elf64_Verdaux is record
      vda_name : aliased Elf64_Word;  -- /usr/include/elf.h:1061
      vda_next : aliased Elf64_Word;  -- /usr/include/elf.h:1062
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/elf.h:1064

  -- Version dependency section.   
  -- Version of structure  
  -- Number of associated aux entries  
  -- Offset of filename for this
  --					   dependency  

  -- Offset in bytes to vernaux array  
  -- Offset in bytes to next verneed
  --					   entry  

   type Elf32_Verneed is record
      vn_version : aliased Elf32_Half;  -- /usr/include/elf.h:1071
      vn_cnt : aliased Elf32_Half;  -- /usr/include/elf.h:1072
      vn_file : aliased Elf32_Word;  -- /usr/include/elf.h:1073
      vn_aux : aliased Elf32_Word;  -- /usr/include/elf.h:1075
      vn_next : aliased Elf32_Word;  -- /usr/include/elf.h:1076
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/elf.h:1078

  -- Version of structure  
  -- Number of associated aux entries  
  -- Offset of filename for this
  --					   dependency  

  -- Offset in bytes to vernaux array  
  -- Offset in bytes to next verneed
  --					   entry  

   type Elf64_Verneed is record
      vn_version : aliased Elf64_Half;  -- /usr/include/elf.h:1082
      vn_cnt : aliased Elf64_Half;  -- /usr/include/elf.h:1083
      vn_file : aliased Elf64_Word;  -- /usr/include/elf.h:1084
      vn_aux : aliased Elf64_Word;  -- /usr/include/elf.h:1086
      vn_next : aliased Elf64_Word;  -- /usr/include/elf.h:1087
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/elf.h:1089

  -- Legal values for vn_version (version revision).   
  -- Auxiliary needed version information.   
  -- Hash value of dependency name  
  -- Dependency specific information  
  -- Unused  
  -- Dependency name string offset  
  -- Offset in bytes to next vernaux
  --					   entry  

   type Elf32_Vernaux is record
      vna_hash : aliased Elf32_Word;  -- /usr/include/elf.h:1101
      vna_flags : aliased Elf32_Half;  -- /usr/include/elf.h:1102
      vna_other : aliased Elf32_Half;  -- /usr/include/elf.h:1103
      vna_name : aliased Elf32_Word;  -- /usr/include/elf.h:1104
      vna_next : aliased Elf32_Word;  -- /usr/include/elf.h:1105
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/elf.h:1107

  -- Hash value of dependency name  
  -- Dependency specific information  
  -- Unused  
  -- Dependency name string offset  
  -- Offset in bytes to next vernaux
  --					   entry  

   type Elf64_Vernaux is record
      vna_hash : aliased Elf64_Word;  -- /usr/include/elf.h:1111
      vna_flags : aliased Elf64_Half;  -- /usr/include/elf.h:1112
      vna_other : aliased Elf64_Half;  -- /usr/include/elf.h:1113
      vna_name : aliased Elf64_Word;  -- /usr/include/elf.h:1114
      vna_next : aliased Elf64_Word;  -- /usr/include/elf.h:1115
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/elf.h:1117

  -- Legal values for vna_flags.   
  -- Auxiliary vector.   
  -- This vector is normally only used by the program interpreter.  The
  --   usual definition in an ABI supplement uses the name auxv_t.  The
  --   vector is not usually defined in a standard <elf.h> file, but it
  --   can't hurt.  We rename it to avoid conflicts.  The sizes of these
  --   types are an arrangement between the exec server and the program
  --   interpreter, so we don't fully specify them here.   

  -- Entry type  
  -- Integer value  
  -- We use to have pointer elements added here.  We cannot do that,
  --	 though, since it does not work when using 32-bit definitions
  --	 on 64-bit platforms and vice versa.   

   type Elf32_auxv_t_union1003 (discr : unsigned := 0) is record
      case discr is
         when others =>
            a_val : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/elf.h:1138
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;
   type Elf32_auxv_t is record
      a_type : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/elf.h:1135
      a_un : aliased Elf32_auxv_t_union1003;  -- /usr/include/elf.h:1142
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/elf.h:1143

  -- Entry type  
  -- Integer value  
  -- We use to have pointer elements added here.  We cannot do that,
  --	 though, since it does not work when using 32-bit definitions
  --	 on 64-bit platforms and vice versa.   

   type Elf64_auxv_t_union1006 (discr : unsigned := 0) is record
      case discr is
         when others =>
            a_val : aliased bits_stdint_uintn_h.uint64_t;  -- /usr/include/elf.h:1150
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;
   type Elf64_auxv_t is record
      a_type : aliased bits_stdint_uintn_h.uint64_t;  -- /usr/include/elf.h:1147
      a_un : aliased Elf64_auxv_t_union1006;  -- /usr/include/elf.h:1154
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/elf.h:1155

  -- Legal values for a_type (entry type).   
  -- Some more special a_type values describing the hardware.   
  -- This entry gives some information about the FPU initialization
  --   performed by the kernel.   

  -- Cache block sizes.   
  -- A special ignored value for PPC, used by the kernel to control the
  --   interpretation of the AUXV. Must be > 16.   

  -- Pointer to the global system page used for system calls and other
  --   nice things.   

  -- Shapes of the caches.  Bits 0-3 contains associativity; bits 4-7 contains
  --   log2 of line size; mask those to get cache size.   

  -- Shapes of the caches, with more room to describe them.
  --   *GEOMETRY are comprised of cache line size in bytes in the bottom 16 bits
  --   and the cache associativity in the next 16 bits.   

  -- Note section contents.  Each entry in the note section begins with
  --   a header of a fixed form.   

  -- Length of the note's name.   
  -- Length of the note's descriptor.   
  -- Type of the note.   
   type Elf32_Nhdr is record
      n_namesz : aliased Elf32_Word;  -- /usr/include/elf.h:1237
      n_descsz : aliased Elf32_Word;  -- /usr/include/elf.h:1238
      n_type : aliased Elf32_Word;  -- /usr/include/elf.h:1239
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/elf.h:1240

  -- Length of the note's name.   
  -- Length of the note's descriptor.   
  -- Type of the note.   
   type Elf64_Nhdr is record
      n_namesz : aliased Elf64_Word;  -- /usr/include/elf.h:1244
      n_descsz : aliased Elf64_Word;  -- /usr/include/elf.h:1245
      n_type : aliased Elf64_Word;  -- /usr/include/elf.h:1246
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/elf.h:1247

  -- Known names of notes.   
  -- Solaris entries in the note section have this name.   
  -- Note entries for GNU systems have this name.   
  -- Defined types of notes for Solaris.   
  -- Value of descriptor (one word) is desired pagesize for the binary.   
  -- Defined note types for GNU systems.   
  -- ABI information.  The descriptor consists of words:
  --   word 0: OS descriptor
  --   word 1: major version of the ABI
  --   word 2: minor version of the ABI
  --   word 3: subminor version of the ABI
  -- 

  -- Known OSes.  These values can appear in word 0 of an
  --   NT_GNU_ABI_TAG note section entry.   

  -- Synthetic hwcap information.  The descriptor begins with two words:
  --   word 0: number of entries
  --   word 1: bitmask of enabled entries
  --   Then follow variable-length entries, one byte followed by a
  --   '\0'-terminated hwcap name string.  The byte gives the bit
  --   number to test if enabled, (1U << bit) & bitmask.   

  -- Build ID bits as generated by ld --build-id.
  --   The descriptor consists of any nonzero number of bytes.   

  -- Version note generated by GNU gold containing a version string.   
  -- Program property.   
  -- Note section name of program property.    
  -- Values used in GNU .note.gnu.property notes (NT_GNU_PROPERTY_TYPE_0).   
  -- Stack size.   
  -- No copy relocation on protected data symbol.   
  -- Processor-specific semantics, lo  
  -- Processor-specific semantics, hi  
  -- Application-specific semantics, lo  
  -- Application-specific semantics, hi  
  -- AArch64 specific GNU properties.   
  -- The x86 instruction sets indicated by the corresponding bits are
  --   used in program.  Their support in the hardware is optional.   

  -- The x86 instruction sets indicated by the corresponding bits are
  --   used in program and they must be supported by the hardware.    

  -- X86 processor-specific features used in program.   
  -- GNU_PROPERTY_X86_ISA_1_BASELINE: CMOV, CX8 (cmpxchg8b), FPU (fld),
  --   MMX, OSFXSR (fxsave), SCE (syscall), SSE and SSE2.   

  -- GNU_PROPERTY_X86_ISA_1_V2: GNU_PROPERTY_X86_ISA_1_BASELINE,
  --   CMPXCHG16B (cmpxchg16b), LAHF-SAHF (lahf), POPCNT (popcnt), SSE3,
  --   SSSE3, SSE4.1 and SSE4.2.   

  -- GNU_PROPERTY_X86_ISA_1_V3: GNU_PROPERTY_X86_ISA_1_V2, AVX, AVX2, BMI1,
  --   BMI2, F16C, FMA, LZCNT, MOVBE, XSAVE.   

  -- GNU_PROPERTY_X86_ISA_1_V4: GNU_PROPERTY_X86_ISA_1_V3, AVX512F,
  --   AVX512BW, AVX512CD, AVX512DQ and AVX512VL.   

  -- This indicates that all executable sections are compatible with
  --   IBT.   

  -- This indicates that all executable sections are compatible with
  --   SHSTK.   

  -- Move records.   
  -- Symbol value.   
  -- Size and index.   
  -- Symbol offset.   
  -- Repeat count.   
  -- Stride info.   
   type Elf32_Move is record
      m_value : aliased Elf32_Xword;  -- /usr/include/elf.h:1358
      m_info : aliased Elf32_Word;  -- /usr/include/elf.h:1359
      m_poffset : aliased Elf32_Word;  -- /usr/include/elf.h:1360
      m_repeat : aliased Elf32_Half;  -- /usr/include/elf.h:1361
      m_stride : aliased Elf32_Half;  -- /usr/include/elf.h:1362
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/elf.h:1363

  -- Symbol value.   
  -- Size and index.   
  -- Symbol offset.   
  -- Repeat count.   
  -- Stride info.   
   type Elf64_Move is record
      m_value : aliased Elf64_Xword;  -- /usr/include/elf.h:1367
      m_info : aliased Elf64_Xword;  -- /usr/include/elf.h:1368
      m_poffset : aliased Elf64_Xword;  -- /usr/include/elf.h:1369
      m_repeat : aliased Elf64_Half;  -- /usr/include/elf.h:1370
      m_stride : aliased Elf64_Half;  -- /usr/include/elf.h:1371
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/elf.h:1372

  -- Macro to construct move records.   
  -- Motorola 68k specific definitions.   
  -- Values for Elf32_Ehdr.e_flags.   
  -- m68k relocs.   
  -- Keep this the last entry.   
  -- Intel 80386 specific definitions.   
  -- i386 relocs.   
  -- Keep this the last entry.   
  -- SUN SPARC specific definitions.   
  -- Legal values for ST_TYPE subfield of st_info (symbol type).   
  -- Values for Elf64_Ehdr.e_flags.   
  -- SPARC relocs.   
  -- Additional Sparc64 relocs.   
  -- Keep this the last entry.   
  -- For Sparc64, legal values for d_tag of Elf64_Dyn.   
  -- MIPS R3000 specific definitions.   
  -- Legal values for e_flags field of Elf32_Ehdr.   
  -- Legal values for MIPS architecture level.   
  -- The following are unofficial names and should not be used.   
  -- Special section indices.   
  -- Legal values for sh_type field of Elf32_Shdr.   
  -- Legal values for sh_flags field of Elf32_Shdr.   
  -- Symbol tables.   
  -- MIPS specific values for `st_other'.   
  -- MIPS specific values for `st_info'.   
  -- Entries found in sections of type SHT_MIPS_GPTAB.   
  -- -G value used for compilation.   
  -- Not used.   
  -- First entry in section.   
  -- If this value were used for -G.   
  -- This many bytes would be used.   
  -- Subsequent entries in section.   
   type Elf32_gptab_struct1017 is record
      gt_current_g_value : aliased Elf32_Word;  -- /usr/include/elf.h:1750
      gt_unused : aliased Elf32_Word;  -- /usr/include/elf.h:1751
   end record
   with Convention => C_Pass_By_Copy;
   type Elf32_gptab_struct1018 is record
      gt_g_value : aliased Elf32_Word;  -- /usr/include/elf.h:1755
      gt_bytes : aliased Elf32_Word;  -- /usr/include/elf.h:1756
   end record
   with Convention => C_Pass_By_Copy;
   type Elf32_gptab (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            gt_header : aliased Elf32_gptab_struct1017;  -- /usr/include/elf.h:1752
         when others =>
            gt_entry : aliased Elf32_gptab_struct1018;  -- /usr/include/elf.h:1757
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;  -- /usr/include/elf.h:1758

  -- Entry found in sections of type SHT_MIPS_REGINFO.   
  -- General registers used.   
  -- Coprocessor registers used.   
  -- $gp register value.   
   type Elf32_RegInfo_array1022 is array (0 .. 3) of aliased Elf32_Word;
   type Elf32_RegInfo is record
      ri_gprmask : aliased Elf32_Word;  -- /usr/include/elf.h:1764
      ri_cprmask : aliased Elf32_RegInfo_array1022;  -- /usr/include/elf.h:1765
      ri_gp_value : aliased Elf32_Sword;  -- /usr/include/elf.h:1766
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/elf.h:1767

  -- Entries found in sections of type SHT_MIPS_OPTIONS.   
  -- Determines interpretation of the
  --				   variable part of descriptor.   

  -- Size of descriptor, including header.   
  -- Section header index of section affected,
  --				   0 for global options.   

  -- Kind-specific information.   
   type Elf_Options is record
      kind : aliased unsigned_char;  -- /usr/include/elf.h:1773
      size : aliased unsigned_char;  -- /usr/include/elf.h:1775
      section : aliased Elf32_Section;  -- /usr/include/elf.h:1776
      info : aliased Elf32_Word;  -- /usr/include/elf.h:1778
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/elf.h:1779

  -- Values for `kind' field in Elf_Options.   
  -- Values for `info' in Elf_Options for ODK_EXCEPTIONS entries.   
  -- Masks for `info' in Elf_Options for an ODK_HWPATCH entry.   
  -- Entry found in `.options' section.   
  -- Extra flags.   
  -- Extra flags.   
   type Elf_Options_Hw is record
      hwp_flags1 : aliased Elf32_Word;  -- /usr/include/elf.h:1824
      hwp_flags2 : aliased Elf32_Word;  -- /usr/include/elf.h:1825
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/elf.h:1826

  -- Masks for `info' in ElfOptions for ODK_HWAND and ODK_HWOR entries.   
  -- MIPS relocs.   
  -- Keep this the last entry.   
  -- Legal values for p_type field of Elf32_Phdr.   
  -- Special program header types.   
  -- Legal values for d_tag field of Elf32_Dyn.   
  -- The address of .got.plt in an executable using the new non-PIC ABI.   
  -- The base of the PLT in an executable using the new non-PIC ABI if that
  --   PLT is writable.  For a non-writable PLT, this is omitted or has a zero
  --   value.   

  -- An alternative description of the classic MIPS RLD_MAP that is usable
  --   in a PIE as it stores a relative offset from the address of the tag
  --   rather than an absolute address.   

  -- GNU-style hash table with xlat.   
  -- Legal values for DT_MIPS_FLAGS Elf32_Dyn entry.   
  -- Entries found in sections of type SHT_MIPS_LIBLIST.   
  -- Name (string table index)  
  -- Timestamp  
  -- Checksum  
  -- Interface version  
  -- Flags  
   type Elf32_Lib is record
      l_name : aliased Elf32_Word;  -- /usr/include/elf.h:1992
      l_time_stamp : aliased Elf32_Word;  -- /usr/include/elf.h:1993
      l_checksum : aliased Elf32_Word;  -- /usr/include/elf.h:1994
      l_version : aliased Elf32_Word;  -- /usr/include/elf.h:1995
      l_flags : aliased Elf32_Word;  -- /usr/include/elf.h:1996
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/elf.h:1997

  -- Name (string table index)  
  -- Timestamp  
  -- Checksum  
  -- Interface version  
  -- Flags  
   type Elf64_Lib is record
      l_name : aliased Elf64_Word;  -- /usr/include/elf.h:2001
      l_time_stamp : aliased Elf64_Word;  -- /usr/include/elf.h:2002
      l_checksum : aliased Elf64_Word;  -- /usr/include/elf.h:2003
      l_version : aliased Elf64_Word;  -- /usr/include/elf.h:2004
      l_flags : aliased Elf64_Word;  -- /usr/include/elf.h:2005
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/elf.h:2006

  -- Legal values for l_flags.   
  -- Entries found in sections of type SHT_MIPS_CONFLICT.   
   subtype Elf32_Conflict is Elf32_Addr;  -- /usr/include/elf.h:2021

  -- Version of flags structure.   
  -- The level of the ISA: 1-5, 32, 64.   
  -- The revision of ISA: 0 for MIPS V and below, 1-n otherwise.   
  -- The size of general purpose registers.   
  -- The size of co-processor 1 registers.   
  -- The size of co-processor 2 registers.   
  -- The floating-point ABI.   
  -- Processor-specific extension.   
  -- Mask of ASEs used.   
  -- Mask of general flags.   
   type Elf_MIPS_ABIFlags_v0 is record
      version : aliased Elf32_Half;  -- /usr/include/elf.h:2026
      isa_level : aliased unsigned_char;  -- /usr/include/elf.h:2028
      isa_rev : aliased unsigned_char;  -- /usr/include/elf.h:2030
      gpr_size : aliased unsigned_char;  -- /usr/include/elf.h:2032
      cpr1_size : aliased unsigned_char;  -- /usr/include/elf.h:2034
      cpr2_size : aliased unsigned_char;  -- /usr/include/elf.h:2036
      fp_abi : aliased unsigned_char;  -- /usr/include/elf.h:2038
      isa_ext : aliased Elf32_Word;  -- /usr/include/elf.h:2040
      ases : aliased Elf32_Word;  -- /usr/include/elf.h:2042
      flags1 : aliased Elf32_Word;  -- /usr/include/elf.h:2044
      flags2 : aliased Elf32_Word;  -- /usr/include/elf.h:2045
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/elf.h:2046

  -- Values for the register size bytes of an abi flags structure.   
  -- Masks for the ases word of an ABI flags structure.   
  -- Values for the isa_ext word of an ABI flags structure.   
  -- Masks for the flags1 word of an ABI flags structure.   
  -- Object attribute values.   
  -- Not tagged or not using any ABIs affected by the differences.   
  -- Using hard-float -mdouble-float.   
  -- Using hard-float -msingle-float.   
  -- Using soft-float.   
  -- Using -mips32r2 -mfp64.   
  -- Using -mfpxx.   
  -- Using -mips32r2 -mfp64.   
  -- Using -mips32r2 -mfp64 -mno-odd-spreg.   
  -- Maximum allocated FP ABI value.   
  -- HPPA specific definitions.   
  -- Legal values for e_flags field of Elf32_Ehdr.   
  -- Defined values for `e_flags & EF_PARISC_ARCH' are:   
  -- Additional section indices.   
  -- Legal values for sh_type field of Elf32_Shdr.   
  -- Legal values for sh_flags field of Elf32_Shdr.   
  -- Legal values for ST_TYPE subfield of st_info (symbol type).   
  -- HPPA relocs.   
  -- Legal values for p_type field of Elf32_Phdr/Elf64_Phdr.   
  -- Legal values for p_flags field of Elf32_Phdr/Elf64_Phdr.   
  -- Alpha specific definitions.   
  -- Legal values for e_flags field of Elf64_Ehdr.   
  -- Legal values for sh_type field of Elf64_Shdr.   
  -- These two are primerily concerned with ECOFF debugging info.   
  -- Legal values for sh_flags field of Elf64_Shdr.   
  -- Legal values for st_other field of Elf64_Sym.   
  -- Alpha relocs.   
  -- Keep this the last entry.   
  -- Magic values of the LITUSE relocation addend.   
  -- Legal values for d_tag of Elf64_Dyn.   
  -- PowerPC specific declarations  
  -- Values for Elf32/64_Ehdr.e_flags.   
  -- Cygnus local bits below  
  -- PowerPC relocations defined by the ABIs  
  -- PowerPC relocations defined for the TLS access ABI.   
  -- The remaining relocs are from the Embedded ELF ABI, and are not
  --   in the SVR4 ELF ABI.   

  -- Diab tool relocations.   
  -- GNU extension to support local ifunc.   
  -- GNU relocs used in PIC code sequences.   
  -- This is a phony reloc to handle any old fashioned TOC16 references
  --   that may still be in object files.   

  -- PowerPC specific values for the Dyn d_tag field.   
  -- PowerPC specific values for the DT_PPC_OPT Dyn entry.   
  -- PowerPC64 relocations defined by the ABIs  
  -- PowerPC64 relocations defined for the TLS access ABI.   
  -- Added when HA and HI relocs were changed to report overflows.   
  -- GNU extension to support local ifunc.   
  -- e_flags bits specifying ABI.
  --   1 for original function descriptor using ABI,
  --   2 for revised ABI without function descriptors,
  --   0 for unspecified or not using any features affected by the differences.   

  -- PowerPC64 specific values for the Dyn d_tag field.   
  -- PowerPC64 specific bits in the DT_PPC64_OPT Dyn entry.   
  -- PowerPC64 specific values for the Elf64_Sym st_other field.   
  -- ARM specific declarations  
  -- Processor specific flags for the ELF header e_flags field.   
  -- Other constants defined in the ARM ELF spec. version B-01.   
  -- NB. These conflict with values defined above.   
  -- Constants defined in AAELF.   
  -- Additional symbol types for Thumb.   
  -- ARM-specific values for sh_flags  
  -- ARM-specific program header flags  
  -- Processor specific values for the Phdr p_type field.   
  -- Processor specific values for the Shdr sh_type field.   
  -- AArch64 relocs.   
  -- ILP32 AArch64 relocs.   
  -- LP64 AArch64 relocs.   
  -- AArch64 specific values for the Dyn d_tag field.   
  -- AArch64 specific values for the st_other field.   
  -- ARM relocs.   
  -- Keep this the last entry.   
  -- C-SKY  
  -- ((S + A) >> 16) & 0xffff  
  -- ((GOT + A - P) >> 16) & 0xffff  
  -- ((S + A - GOT) >> 16) & 0xffff  
  -- (G >> 16) & 0xffff  
  -- (G >> 16) & 0xffff  
  -- (GOT + G * 4) & 0xffff  
  -- ((GOT + G * 4) >> 16) & 0xFFFF  
  -- C-SKY elf header definition.   
  -- C-SKY attributes section.   
  -- IA-64 specific declarations.   
  -- Processor specific flags for the Ehdr e_flags field.   
  -- Processor specific values for the Phdr p_type field.   
  -- Processor specific flags for the Phdr p_flags field.   
  -- Processor specific values for the Shdr sh_type field.   
  -- Processor specific flags for the Shdr sh_flags field.   
  -- Processor specific values for the Dyn d_tag field.   
  -- IA-64 relocations.   
  -- SH specific declarations  
  -- Processor specific flags for the ELF header e_flags field.   
  -- SH relocs.   
  -- Keep this the last entry.   
  -- S/390 specific definitions.   
  -- Valid values for the e_flags field.   
  -- Additional s390 relocs  
  -- Keep this the last entry.   
  -- CRIS relocations.   
  -- AMD x86-64 relocations.   
  -- 39 Reserved was R_X86_64_PC32_BND  
  -- 40 Reserved was R_X86_64_PLT32_BND  
  -- x86-64 sh_type values.   
  -- AM33 relocations.   
  -- M32R relocs.   
  -- M32R relocs use SHT_RELA.   
  -- MicroBlaze relocations  
  -- Legal values for d_tag (dynamic entry type).   
  -- Nios II relocations.   
  -- TILEPro relocations.   
  -- Relocs 56-59 are currently not defined.   
  -- TILE-Gx relocations.   
  -- Relocs 90-91 are currently not defined.   
  -- Relocs 104-105 are currently not defined.   
  -- RISC-V ELF Flags  
  -- RISC-V relocations.   
  -- BPF specific declarations.   
  -- Imagination Meta specific relocations.  
  -- Backward compatibility  
  -- GNU  
  -- PIC relocations  
  -- TLS relocations  
  -- NDS32 relocations.   
  -- ARCompact/ARCv2 specific relocs.   
end elf_h;
