.late_rodata
glabel D_80A12ECC
 .word 0xC61C4000
glabel D_80A12ED0
 .word 0xC4A14000
glabel D_80A12ED4
 .word 0xC5728000

.text
glabel func_80A120CC
/* 004AC 80A120CC 27BDFF98 */  addiu   $sp, $sp, 0xFF98           ## $sp = FFFFFF98
/* 004B0 80A120D0 AFBF0044 */  sw      $ra, 0x0044($sp)           
/* 004B4 80A120D4 AFB20040 */  sw      $s2, 0x0040($sp)           
/* 004B8 80A120D8 AFB1003C */  sw      $s1, 0x003C($sp)           
/* 004BC 80A120DC AFB00038 */  sw      $s0, 0x0038($sp)           
/* 004C0 80A120E0 F7B40030 */  sdc1    $f20, 0x0030($sp)          
/* 004C4 80A120E4 3C0180A1 */  lui     $at, %hi(D_80A12ECC)       ## $at = 80A10000
/* 004C8 80A120E8 C4242ECC */  lwc1    $f4, %lo(D_80A12ECC)($at)  
/* 004CC 80A120EC C4860080 */  lwc1    $f6, 0x0080($a0)           ## 00000080
/* 004D0 80A120F0 00808825 */  or      $s1, $a0, $zero            ## $s1 = 00000000
/* 004D4 80A120F4 00A09025 */  or      $s2, $a1, $zero            ## $s2 = 00000000
/* 004D8 80A120F8 46062032 */  c.eq.s  $f4, $f6                   
/* 004DC 80A120FC 8CB01C44 */  lw      $s0, 0x1C44($a1)           ## 00001C44
/* 004E0 80A12100 3C014348 */  lui     $at, 0x4348                ## $at = 43480000
/* 004E4 80A12104 45010009 */  bc1t    .L80A1212C                 
/* 004E8 80A12108 00000000 */  nop
/* 004EC 80A1210C C6020028 */  lwc1    $f2, 0x0028($s0)           ## 00000028
/* 004F0 80A12110 44814000 */  mtc1    $at, $f8                   ## $f8 = 200.00
/* 004F4 80A12114 C4800028 */  lwc1    $f0, 0x0028($a0)           ## 00000028
/* 004F8 80A12118 46081281 */  sub.s   $f10, $f2, $f8             
/* 004FC 80A1211C 460A003C */  c.lt.s  $f0, $f10                  
/* 00500 80A12120 00000000 */  nop
/* 00504 80A12124 45020006 */  bc1fl   .L80A12140                 
/* 00508 80A12128 8622018C */  lh      $v0, 0x018C($s1)           ## 0000018C
.L80A1212C:
/* 0050C 80A1212C 0C00B55C */  jal     Actor_Kill
              
/* 00510 80A12130 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00514 80A12134 100000B3 */  beq     $zero, $zero, .L80A12404   
/* 00518 80A12138 8FBF0044 */  lw      $ra, 0x0044($sp)           
/* 0051C 80A1213C 8622018C */  lh      $v0, 0x018C($s1)           ## 0000018C
.L80A12140:
/* 00520 80A12140 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 00524 80A12144 5040000A */  beql    $v0, $zero, .L80A12170     
/* 00528 80A12148 4600103C */  c.lt.s  $f2, $f0                   
/* 0052C 80A1214C 1041004B */  beq     $v0, $at, .L80A1227C       
/* 00530 80A12150 3C0F0001 */  lui     $t7, 0x0001                ## $t7 = 00010000
/* 00534 80A12154 24010003 */  addiu   $at, $zero, 0x0003         ## $at = 00000003
/* 00538 80A12158 1041002C */  beq     $v0, $at, .L80A1220C       
/* 0053C 80A1215C 3C0141A0 */  lui     $at, 0x41A0                ## $at = 41A00000
/* 00540 80A12160 4481A000 */  mtc1    $at, $f20                  ## $f20 = 20.00
/* 00544 80A12164 10000051 */  beq     $zero, $zero, .L80A122AC   
/* 00548 80A12168 96390088 */  lhu     $t9, 0x0088($s1)           ## 00000088
/* 0054C 80A1216C 4600103C */  c.lt.s  $f2, $f0                   
.L80A12170:
/* 00550 80A12170 3C01C42F */  lui     $at, 0xC42F                ## $at = C42F0000
/* 00554 80A12174 45020026 */  bc1fl   .L80A12210                 
/* 00558 80A12178 3C0141A0 */  lui     $at, 0x41A0                ## $at = 41A00000
/* 0055C 80A1217C C6020024 */  lwc1    $f2, 0x0024($s0)           ## 00000024
/* 00560 80A12180 44818000 */  mtc1    $at, $f16                  ## $f16 = 20.00
/* 00564 80A12184 3C0142C8 */  lui     $at, 0x42C8                ## $at = 42C80000
/* 00568 80A12188 4602803C */  c.lt.s  $f16, $f2                  
/* 0056C 80A1218C 00000000 */  nop
/* 00570 80A12190 45030013 */  bc1tl   .L80A121E0                 
/* 00574 80A12194 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 00578 80A12198 44819000 */  mtc1    $at, $f18                  ## $f18 = 1.00
/* 0057C 80A1219C 3C0180A1 */  lui     $at, %hi(D_80A12ED0)       ## $at = 80A10000
/* 00580 80A121A0 4612103C */  c.lt.s  $f2, $f18                  
/* 00584 80A121A4 00000000 */  nop
/* 00588 80A121A8 4503000D */  bc1tl   .L80A121E0                 
/* 0058C 80A121AC 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 00590 80A121B0 C600002C */  lwc1    $f0, 0x002C($s0)           ## 0000002C
/* 00594 80A121B4 C4242ED0 */  lwc1    $f4, %lo(D_80A12ED0)($at)  
/* 00598 80A121B8 3C0180A1 */  lui     $at, %hi(D_80A12ED4)       ## $at = 80A10000
/* 0059C 80A121BC 4600203C */  c.lt.s  $f4, $f0                   
/* 005A0 80A121C0 00000000 */  nop
/* 005A4 80A121C4 45030006 */  bc1tl   .L80A121E0                 
/* 005A8 80A121C8 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 005AC 80A121CC C4262ED4 */  lwc1    $f6, %lo(D_80A12ED4)($at)  
/* 005B0 80A121D0 4606003C */  c.lt.s  $f0, $f6                   
/* 005B4 80A121D4 00000000 */  nop
/* 005B8 80A121D8 4500000C */  bc1f    .L80A1220C                 
/* 005BC 80A121DC 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
.L80A121E0:
/* 005C0 80A121E0 4481A000 */  mtc1    $at, $f20                  ## $f20 = 1.00
/* 005C4 80A121E4 44051000 */  mfc1    $a1, $f2                   
/* 005C8 80A121E8 26240024 */  addiu   $a0, $s1, 0x0024           ## $a0 = 00000024
/* 005CC 80A121EC 4406A000 */  mfc1    $a2, $f20                  
/* 005D0 80A121F0 0C01E107 */  jal     Math_ApproachF
              
/* 005D4 80A121F4 3C074120 */  lui     $a3, 0x4120                ## $a3 = 41200000
/* 005D8 80A121F8 4406A000 */  mfc1    $a2, $f20                  
/* 005DC 80A121FC 2624002C */  addiu   $a0, $s1, 0x002C           ## $a0 = 0000002C
/* 005E0 80A12200 8E05002C */  lw      $a1, 0x002C($s0)           ## 0000002C
/* 005E4 80A12204 0C01E107 */  jal     Math_ApproachF
              
/* 005E8 80A12208 3C074120 */  lui     $a3, 0x4120                ## $a3 = 41200000
.L80A1220C:
/* 005EC 80A1220C 3C0141A0 */  lui     $at, 0x41A0                ## $at = 41A00000
.L80A12210:
/* 005F0 80A12210 4481A000 */  mtc1    $at, $f20                  ## $f20 = 20.00
/* 005F4 80A12214 0C00CFC8 */  jal     Rand_CenteredFloat
              
/* 005F8 80A12218 4600A306 */  mov.s   $f12, $f20                 
/* 005FC 80A1221C C6280024 */  lwc1    $f8, 0x0024($s1)           ## 00000024
/* 00600 80A12220 4600A306 */  mov.s   $f12, $f20                 
/* 00604 80A12224 46080280 */  add.s   $f10, $f0, $f8             
/* 00608 80A12228 0C00CFC8 */  jal     Rand_CenteredFloat
              
/* 0060C 80A1222C E7AA0058 */  swc1    $f10, 0x0058($sp)          
/* 00610 80A12230 C6300028 */  lwc1    $f16, 0x0028($s1)          ## 00000028
/* 00614 80A12234 4600A306 */  mov.s   $f12, $f20                 
/* 00618 80A12238 46100480 */  add.s   $f18, $f0, $f16            
/* 0061C 80A1223C 0C00CFC8 */  jal     Rand_CenteredFloat
              
/* 00620 80A12240 E7B2005C */  swc1    $f18, 0x005C($sp)          
/* 00624 80A12244 C624002C */  lwc1    $f4, 0x002C($s1)           ## 0000002C
/* 00628 80A12248 240EFFFF */  addiu   $t6, $zero, 0xFFFF         ## $t6 = FFFFFFFF
/* 0062C 80A1224C AFAE0018 */  sw      $t6, 0x0018($sp)           
/* 00630 80A12250 46040180 */  add.s   $f6, $f0, $f4              
/* 00634 80A12254 AFA00014 */  sw      $zero, 0x0014($sp)         
/* 00638 80A12258 AFA00010 */  sw      $zero, 0x0010($sp)         
/* 0063C 80A1225C 02402025 */  or      $a0, $s2, $zero            ## $a0 = 00000000
/* 00640 80A12260 E7A60060 */  swc1    $f6, 0x0060($sp)           
/* 00644 80A12264 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 00648 80A12268 27A60058 */  addiu   $a2, $sp, 0x0058           ## $a2 = FFFFFFF0
/* 0064C 80A1226C 0C00A935 */  jal     EffectSsEnFire_SpawnVec3f              
/* 00650 80A12270 24070064 */  addiu   $a3, $zero, 0x0064         ## $a3 = 00000064
/* 00654 80A12274 1000000D */  beq     $zero, $zero, .L80A122AC   
/* 00658 80A12278 96390088 */  lhu     $t9, 0x0088($s1)           ## 00000088
.L80A1227C:
/* 0065C 80A1227C 01F27821 */  addu    $t7, $t7, $s2              
/* 00660 80A12280 8DEF1DE4 */  lw      $t7, 0x1DE4($t7)           ## 00001DE4
/* 00664 80A12284 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00668 80A12288 31F80003 */  andi    $t8, $t7, 0x0003           ## $t8 = 00000000
/* 0066C 80A1228C 57000004 */  bnel    $t8, $zero, .L80A122A0     
/* 00670 80A12290 3C0141A0 */  lui     $at, 0x41A0                ## $at = 41A00000
/* 00674 80A12294 0C00BE0A */  jal     Audio_PlayActorSound2
              
/* 00678 80A12298 240538D7 */  addiu   $a1, $zero, 0x38D7         ## $a1 = 000038D7
/* 0067C 80A1229C 3C0141A0 */  lui     $at, 0x41A0                ## $at = 41A00000
.L80A122A0:
/* 00680 80A122A0 4481A000 */  mtc1    $at, $f20                  ## $f20 = 20.00
/* 00684 80A122A4 00000000 */  nop
/* 00688 80A122A8 96390088 */  lhu     $t9, 0x0088($s1)           ## 00000088
.L80A122AC:
/* 0068C 80A122AC 33280001 */  andi    $t0, $t9, 0x0001           ## $t0 = 00000000
/* 00690 80A122B0 51000054 */  beql    $t0, $zero, .L80A12404     
/* 00694 80A122B4 8FBF0044 */  lw      $ra, 0x0044($sp)           
/* 00698 80A122B8 86290188 */  lh      $t1, 0x0188($s1)           ## 00000188
/* 0069C 80A122BC 55200051 */  bnel    $t1, $zero, .L80A12404     
/* 006A0 80A122C0 8FBF0044 */  lw      $ra, 0x0044($sp)           
/* 006A4 80A122C4 8622018C */  lh      $v0, 0x018C($s1)           ## 0000018C
/* 006A8 80A122C8 26300024 */  addiu   $s0, $s1, 0x0024           ## $s0 = 00000024
/* 006AC 80A122CC 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 006B0 80A122D0 10400005 */  beq     $v0, $zero, .L80A122E8     
/* 006B4 80A122D4 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 006B8 80A122D8 10410007 */  beq     $v0, $at, .L80A122F8       
/* 006BC 80A122DC 24010003 */  addiu   $at, $zero, 0x0003         ## $at = 00000003
/* 006C0 80A122E0 14410032 */  bne     $v0, $at, .L80A123AC       
/* 006C4 80A122E4 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
.L80A122E8:
/* 006C8 80A122E8 02402825 */  or      $a1, $s2, $zero            ## $a1 = 00000000
/* 006CC 80A122EC 24060005 */  addiu   $a2, $zero, 0x0005         ## $a2 = 00000005
/* 006D0 80A122F0 0C00CFA2 */  jal     func_80033E88              
/* 006D4 80A122F4 24070002 */  addiu   $a3, $zero, 0x0002         ## $a3 = 00000002
.L80A122F8:
/* 006D8 80A122F8 8E2700C4 */  lw      $a3, 0x00C4($s1)           ## 000000C4
/* 006DC 80A122FC 3C014100 */  lui     $at, 0x4100                ## $at = 41000000
/* 006E0 80A12300 44814000 */  mtc1    $at, $f8                   ## $f8 = 8.00
/* 006E4 80A12304 240A0001 */  addiu   $t2, $zero, 0x0001         ## $t2 = 00000001
/* 006E8 80A12308 240B01F4 */  addiu   $t3, $zero, 0x01F4         ## $t3 = 000001F4
/* 006EC 80A1230C 240C000A */  addiu   $t4, $zero, 0x000A         ## $t4 = 0000000A
/* 006F0 80A12310 AFAC001C */  sw      $t4, 0x001C($sp)           
/* 006F4 80A12314 AFAB0018 */  sw      $t3, 0x0018($sp)           
/* 006F8 80A12318 AFAA0010 */  sw      $t2, 0x0010($sp)           
/* 006FC 80A1231C AFA00020 */  sw      $zero, 0x0020($sp)         
/* 00700 80A12320 02402025 */  or      $a0, $s2, $zero            ## $a0 = 00000000
/* 00704 80A12324 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 00708 80A12328 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000024
/* 0070C 80A1232C 0C00CC98 */  jal     func_80033260              
/* 00710 80A12330 E7A80014 */  swc1    $f8, 0x0014($sp)           
/* 00714 80A12334 00008025 */  or      $s0, $zero, $zero          ## $s0 = 00000000
.L80A12338:
/* 00718 80A12338 0C00CFC8 */  jal     Rand_CenteredFloat
              
/* 0071C 80A1233C 4600A306 */  mov.s   $f12, $f20                 
/* 00720 80A12340 C62A0024 */  lwc1    $f10, 0x0024($s1)          ## 00000024
/* 00724 80A12344 4600A306 */  mov.s   $f12, $f20                 
/* 00728 80A12348 460A0400 */  add.s   $f16, $f0, $f10            
/* 0072C 80A1234C E7B00058 */  swc1    $f16, 0x0058($sp)          
/* 00730 80A12350 C6320080 */  lwc1    $f18, 0x0080($s1)          ## 00000080
/* 00734 80A12354 0C00CFC8 */  jal     Rand_CenteredFloat
              
/* 00738 80A12358 E7B2005C */  swc1    $f18, 0x005C($sp)          
/* 0073C 80A1235C C624002C */  lwc1    $f4, 0x002C($s1)           ## 0000002C
/* 00740 80A12360 240DFFFF */  addiu   $t5, $zero, 0xFFFF         ## $t5 = FFFFFFFF
/* 00744 80A12364 AFAD0018 */  sw      $t5, 0x0018($sp)           
/* 00748 80A12368 46040180 */  add.s   $f6, $f0, $f4              
/* 0074C 80A1236C AFA00014 */  sw      $zero, 0x0014($sp)         
/* 00750 80A12370 AFA00010 */  sw      $zero, 0x0010($sp)         
/* 00754 80A12374 02402025 */  or      $a0, $s2, $zero            ## $a0 = 00000000
/* 00758 80A12378 E7A60060 */  swc1    $f6, 0x0060($sp)           
/* 0075C 80A1237C 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 00760 80A12380 27A60058 */  addiu   $a2, $sp, 0x0058           ## $a2 = FFFFFFF0
/* 00764 80A12384 0C00A935 */  jal     EffectSsEnFire_SpawnVec3f              
/* 00768 80A12388 2407012C */  addiu   $a3, $zero, 0x012C         ## $a3 = 0000012C
/* 0076C 80A1238C 26100001 */  addiu   $s0, $s0, 0x0001           ## $s0 = 00000001
/* 00770 80A12390 24010005 */  addiu   $at, $zero, 0x0005         ## $at = 00000005
/* 00774 80A12394 1601FFE8 */  bne     $s0, $at, .L80A12338       
/* 00778 80A12398 00000000 */  nop
/* 0077C 80A1239C 3C0E80A1 */  lui     $t6, %hi(func_80A1241C)    ## $t6 = 80A10000
/* 00780 80A123A0 25CE241C */  addiu   $t6, $t6, %lo(func_80A1241C) ## $t6 = 80A1241C
/* 00784 80A123A4 10000016 */  beq     $zero, $zero, .L80A12400   
/* 00788 80A123A8 AE2E0168 */  sw      $t6, 0x0168($s1)           ## 00000168
.L80A123AC:
/* 0078C 80A123AC 8E2700C4 */  lw      $a3, 0x00C4($s1)           ## 000000C4
/* 00790 80A123B0 3C014100 */  lui     $at, 0x4100                ## $at = 41000000
/* 00794 80A123B4 44814000 */  mtc1    $at, $f8                   ## $f8 = 8.00
/* 00798 80A123B8 240F0003 */  addiu   $t7, $zero, 0x0003         ## $t7 = 00000003
/* 0079C 80A123BC 241800C8 */  addiu   $t8, $zero, 0x00C8         ## $t8 = 000000C8
/* 007A0 80A123C0 2419000A */  addiu   $t9, $zero, 0x000A         ## $t9 = 0000000A
/* 007A4 80A123C4 AFB9001C */  sw      $t9, 0x001C($sp)           
/* 007A8 80A123C8 AFB80018 */  sw      $t8, 0x0018($sp)           
/* 007AC 80A123CC AFAF0010 */  sw      $t7, 0x0010($sp)           
/* 007B0 80A123D0 AFA00020 */  sw      $zero, 0x0020($sp)         
/* 007B4 80A123D4 02402025 */  or      $a0, $s2, $zero            ## $a0 = 00000000
/* 007B8 80A123D8 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000001
/* 007BC 80A123DC 0C00CC98 */  jal     func_80033260              
/* 007C0 80A123E0 E7A80014 */  swc1    $f8, 0x0014($sp)           
/* 007C4 80A123E4 02402025 */  or      $a0, $s2, $zero            ## $a0 = 00000000
/* 007C8 80A123E8 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000001
/* 007CC 80A123EC 24060028 */  addiu   $a2, $zero, 0x0028         ## $a2 = 00000028
/* 007D0 80A123F0 0C01AEB6 */  jal     Audio_PlaySoundAtPosition
              
/* 007D4 80A123F4 24072802 */  addiu   $a3, $zero, 0x2802         ## $a3 = 00002802
/* 007D8 80A123F8 0C00B55C */  jal     Actor_Kill
              
/* 007DC 80A123FC 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
.L80A12400:
/* 007E0 80A12400 8FBF0044 */  lw      $ra, 0x0044($sp)           
.L80A12404:
/* 007E4 80A12404 D7B40030 */  ldc1    $f20, 0x0030($sp)          
/* 007E8 80A12408 8FB00038 */  lw      $s0, 0x0038($sp)           
/* 007EC 80A1240C 8FB1003C */  lw      $s1, 0x003C($sp)           
/* 007F0 80A12410 8FB20040 */  lw      $s2, 0x0040($sp)           
/* 007F4 80A12414 03E00008 */  jr      $ra                        
/* 007F8 80A12418 27BD0068 */  addiu   $sp, $sp, 0x0068           ## $sp = 00000000