glabel BossGoma_Update
/* 04980 8091A390 27BDFFC8 */  addiu   $sp, $sp, 0xFFC8           ## $sp = FFFFFFC8
/* 04984 8091A394 AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 04988 8091A398 AFB00020 */  sw      $s0, 0x0020($sp)           
/* 0498C 8091A39C AFA5003C */  sw      $a1, 0x003C($sp)           
/* 04990 8091A3A0 848F0194 */  lh      $t7, 0x0194($a0)           ## 00000194
/* 04994 8091A3A4 848201D2 */  lh      $v0, 0x01D2($a0)           ## 000001D2
/* 04998 8091A3A8 240E0001 */  addiu   $t6, $zero, 0x0001         ## $t6 = 00000001
/* 0499C 8091A3AC 25F80001 */  addiu   $t8, $t7, 0x0001           ## $t8 = 00000001
/* 049A0 8091A3B0 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 049A4 8091A3B4 A48E01B8 */  sh      $t6, 0x01B8($a0)           ## 000001B8
/* 049A8 8091A3B8 10400003 */  beq     $v0, $zero, .L8091A3C8     
/* 049AC 8091A3BC A4980194 */  sh      $t8, 0x0194($a0)           ## 00000194
/* 049B0 8091A3C0 2459FFFF */  addiu   $t9, $v0, 0xFFFF           ## $t9 = FFFFFFFF
/* 049B4 8091A3C4 A49901D2 */  sh      $t9, 0x01D2($a0)           ## 000001D2
.L8091A3C8:
/* 049B8 8091A3C8 860201D4 */  lh      $v0, 0x01D4($s0)           ## 000001D4
/* 049BC 8091A3CC 10400002 */  beq     $v0, $zero, .L8091A3D8     
/* 049C0 8091A3D0 2448FFFF */  addiu   $t0, $v0, 0xFFFF           ## $t0 = FFFFFFFF
/* 049C4 8091A3D4 A60801D4 */  sh      $t0, 0x01D4($s0)           ## 000001D4
.L8091A3D8:
/* 049C8 8091A3D8 860201D6 */  lh      $v0, 0x01D6($s0)           ## 000001D6
/* 049CC 8091A3DC 10400002 */  beq     $v0, $zero, .L8091A3E8     
/* 049D0 8091A3E0 2449FFFF */  addiu   $t1, $v0, 0xFFFF           ## $t1 = FFFFFFFF
/* 049D4 8091A3E4 A60901D6 */  sh      $t1, 0x01D6($s0)           ## 000001D6
.L8091A3E8:
/* 049D8 8091A3E8 8E190190 */  lw      $t9, 0x0190($s0)           ## 00000190
/* 049DC 8091A3EC A60001B4 */  sh      $zero, 0x01B4($s0)         ## 000001B4
/* 049E0 8091A3F0 8FA5003C */  lw      $a1, 0x003C($sp)           
/* 049E4 8091A3F4 0320F809 */  jalr    $ra, $t9                   
/* 049E8 8091A3F8 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 049EC 8091A3FC 860B01B6 */  lh      $t3, 0x01B6($s0)           ## 000001B6
/* 049F0 8091A400 860A0032 */  lh      $t2, 0x0032($s0)           ## 00000032
/* 049F4 8091A404 15600005 */  bne     $t3, $zero, .L8091A41C     
/* 049F8 8091A408 A60A00B6 */  sh      $t2, 0x00B6($s0)           ## 000000B6
/* 049FC 8091A40C 0C00B638 */  jal     Actor_MoveForward
              
/* 04A00 8091A410 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 04A04 8091A414 10000003 */  beq     $zero, $zero, .L8091A424   
/* 04A08 8091A418 3C01C3C8 */  lui     $at, 0xC3C8                ## $at = C3C80000
.L8091A41C:
/* 04A0C 8091A41C A60001B6 */  sh      $zero, 0x01B6($s0)         ## 000001B6
/* 04A10 8091A420 3C01C3C8 */  lui     $at, 0xC3C8                ## $at = C3C80000
.L8091A424:
/* 04A14 8091A424 44813000 */  mtc1    $at, $f6                   ## $f6 = -400.00
/* 04A18 8091A428 C6040028 */  lwc1    $f4, 0x0028($s0)           ## 00000028
/* 04A1C 8091A42C 3C0141F0 */  lui     $at, 0x41F0                ## $at = 41F00000
/* 04A20 8091A430 240C0005 */  addiu   $t4, $zero, 0x0005         ## $t4 = 00000005
/* 04A24 8091A434 4606203C */  c.lt.s  $f4, $f6                   
/* 04A28 8091A438 8FA4003C */  lw      $a0, 0x003C($sp)           
/* 04A2C 8091A43C 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 04A30 8091A440 24060000 */  addiu   $a2, $zero, 0x0000         ## $a2 = 00000000
/* 04A34 8091A444 4500000E */  bc1f    .L8091A480                 
/* 04A38 8091A448 240D0001 */  addiu   $t5, $zero, 0x0001         ## $t5 = 00000001
/* 04A3C 8091A44C 3C0141F0 */  lui     $at, 0x41F0                ## $at = 41F00000
/* 04A40 8091A450 44810000 */  mtc1    $at, $f0                   ## $f0 = 30.00
/* 04A44 8091A454 3C0142A0 */  lui     $at, 0x42A0                ## $at = 42A00000
/* 04A48 8091A458 44814000 */  mtc1    $at, $f8                   ## $f8 = 80.00
/* 04A4C 8091A45C 44060000 */  mfc1    $a2, $f0                   
/* 04A50 8091A460 44070000 */  mfc1    $a3, $f0                   
/* 04A54 8091A464 8FA4003C */  lw      $a0, 0x003C($sp)           
/* 04A58 8091A468 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 04A5C 8091A46C AFAC0014 */  sw      $t4, 0x0014($sp)           
/* 04A60 8091A470 0C00B92D */  jal     Actor_UpdateBgCheckInfo              
/* 04A64 8091A474 E7A80010 */  swc1    $f8, 0x0010($sp)           
/* 04A68 8091A478 10000009 */  beq     $zero, $zero, .L8091A4A0   
/* 04A6C 8091A47C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
.L8091A480:
/* 04A70 8091A480 44810000 */  mtc1    $at, $f0                   ## $f0 = 0.00
/* 04A74 8091A484 3C0142A0 */  lui     $at, 0x42A0                ## $at = 42A00000
/* 04A78 8091A488 44815000 */  mtc1    $at, $f10                  ## $f10 = 80.00
/* 04A7C 8091A48C 44070000 */  mfc1    $a3, $f0                   
/* 04A80 8091A490 AFAD0014 */  sw      $t5, 0x0014($sp)           
/* 04A84 8091A494 0C00B92D */  jal     Actor_UpdateBgCheckInfo              
/* 04A88 8091A498 E7AA0010 */  swc1    $f10, 0x0010($sp)          
/* 04A8C 8091A49C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
.L8091A4A0:
/* 04A90 8091A4A0 0C24670E */  jal     func_80919C38              
/* 04A94 8091A4A4 8FA5003C */  lw      $a1, 0x003C($sp)           
/* 04A98 8091A4A8 0C24685B */  jal     func_8091A16C              
/* 04A9C 8091A4AC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 04AA0 8091A4B0 0C2468BA */  jal     func_8091A2E8              
/* 04AA4 8091A4B4 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 04AA8 8091A4B8 0C2467A0 */  jal     func_80919E80              
/* 04AAC 8091A4BC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 04AB0 8091A4C0 860E01BE */  lh      $t6, 0x01BE($s0)           ## 000001BE
/* 04AB4 8091A4C4 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 04AB8 8091A4C8 55C00021 */  bnel    $t6, $zero, .L8091A550     
/* 04ABC 8091A4CC 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 04AC0 8091A4D0 0C2467E3 */  jal     func_80919F8C              
/* 04AC4 8091A4D4 8FA5003C */  lw      $a1, 0x003C($sp)           
/* 04AC8 8091A4D8 8FA4003C */  lw      $a0, 0x003C($sp)           
/* 04ACC 8091A4DC 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 04AD0 8091A4E0 34211E60 */  ori     $at, $at, 0x1E60           ## $at = 00011E60
/* 04AD4 8091A4E4 260607BC */  addiu   $a2, $s0, 0x07BC           ## $a2 = 000007BC
/* 04AD8 8091A4E8 00812821 */  addu    $a1, $a0, $at              
/* 04ADC 8091A4EC AFA5002C */  sw      $a1, 0x002C($sp)           
/* 04AE0 8091A4F0 0C01767D */  jal     CollisionCheck_SetAC
              ## CollisionCheck_setAC
/* 04AE4 8091A4F4 AFA60028 */  sw      $a2, 0x0028($sp)           
/* 04AE8 8091A4F8 8FA4003C */  lw      $a0, 0x003C($sp)           
/* 04AEC 8091A4FC 8FA5002C */  lw      $a1, 0x002C($sp)           
/* 04AF0 8091A500 0C017713 */  jal     CollisionCheck_SetOC
              ## CollisionCheck_setOC
/* 04AF4 8091A504 8FA60028 */  lw      $a2, 0x0028($sp)           
/* 04AF8 8091A508 8E020190 */  lw      $v0, 0x0190($s0)           ## 00000190
/* 04AFC 8091A50C 3C0F8092 */  lui     $t7, %hi(func_80919150)    ## $t7 = 80920000
/* 04B00 8091A510 25EF9150 */  addiu   $t7, $t7, %lo(func_80919150) ## $t7 = 80919150
/* 04B04 8091A514 11E2000D */  beq     $t7, $v0, .L8091A54C       
/* 04B08 8091A518 3C188092 */  lui     $t8, %hi(func_80918FBC)    ## $t8 = 80920000
/* 04B0C 8091A51C 27188FBC */  addiu   $t8, $t8, %lo(func_80918FBC) ## $t8 = 80918FBC
/* 04B10 8091A520 1302000A */  beq     $t8, $v0, .L8091A54C       
/* 04B14 8091A524 3C088092 */  lui     $t0, %hi(func_80919704)    ## $t0 = 80920000
/* 04B18 8091A528 25089704 */  addiu   $t0, $t0, %lo(func_80919704) ## $t0 = 80919704
/* 04B1C 8091A52C 15020004 */  bne     $t0, $v0, .L8091A540       
/* 04B20 8091A530 8FA4003C */  lw      $a0, 0x003C($sp)           
/* 04B24 8091A534 860901D4 */  lh      $t1, 0x01D4($s0)           ## 000001D4
/* 04B28 8091A538 55200005 */  bnel    $t1, $zero, .L8091A550     
/* 04B2C 8091A53C 8FBF0024 */  lw      $ra, 0x0024($sp)           
.L8091A540:
/* 04B30 8091A540 8FA5002C */  lw      $a1, 0x002C($sp)           
/* 04B34 8091A544 0C0175E7 */  jal     CollisionCheck_SetAT
              ## CollisionCheck_setAT
/* 04B38 8091A548 8FA60028 */  lw      $a2, 0x0028($sp)           
.L8091A54C:
/* 04B3C 8091A54C 8FBF0024 */  lw      $ra, 0x0024($sp)           
.L8091A550:
/* 04B40 8091A550 8FB00020 */  lw      $s0, 0x0020($sp)           
/* 04B44 8091A554 27BD0038 */  addiu   $sp, $sp, 0x0038           ## $sp = 00000000
/* 04B48 8091A558 03E00008 */  jr      $ra                        
/* 04B4C 8091A55C 00000000 */  nop
