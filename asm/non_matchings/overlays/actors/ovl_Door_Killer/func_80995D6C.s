.late_rodata
glabel jtbl_809960E4
.word L80995DD8
.word L80995DF4
.word L80995DF4
.word L80995DF4
.word L80995DF4
.word 0x00000000, 0x00000000

.text
glabel func_80995D6C
/* 0111C 80995D6C 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 01120 80995D70 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 01124 80995D74 00803025 */  or      $a2, $a0, $zero            ## $a2 = 00000000
/* 01128 80995D78 342117A4 */  ori     $at, $at, 0x17A4           ## $at = 000117A4
/* 0112C 80995D7C AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 01130 80995D80 AFA5001C */  sw      $a1, 0x001C($sp)           
/* 01134 80995D84 00A12021 */  addu    $a0, $a1, $at              
/* 01138 80995D88 90C5021C */  lbu     $a1, 0x021C($a2)           ## 0000021C
/* 0113C 80995D8C 0C026062 */  jal     Object_IsLoaded
              
/* 01140 80995D90 AFA60018 */  sw      $a2, 0x0018($sp)           
/* 01144 80995D94 1040001D */  beq     $v0, $zero, .L80995E0C     
/* 01148 80995D98 8FA60018 */  lw      $a2, 0x0018($sp)           
/* 0114C 80995D9C 00C02025 */  or      $a0, $a2, $zero            ## $a0 = 00000000
/* 01150 80995DA0 8FA5001C */  lw      $a1, 0x001C($sp)           
/* 01154 80995DA4 0C265737 */  jal     func_80995CDC              
/* 01158 80995DA8 AFA60018 */  sw      $a2, 0x0018($sp)           
/* 0115C 80995DAC 8FA60018 */  lw      $a2, 0x0018($sp)           
/* 01160 80995DB0 84CE001C */  lh      $t6, 0x001C($a2)           ## 0000001C
/* 01164 80995DB4 31CF00FF */  andi    $t7, $t6, 0x00FF           ## $t7 = 00000000
/* 01168 80995DB8 2DE10005 */  sltiu   $at, $t7, 0x0005           
/* 0116C 80995DBC 10200013 */  beq     $at, $zero, .L80995E0C     
/* 01170 80995DC0 000F7880 */  sll     $t7, $t7,  2               
/* 01174 80995DC4 3C018099 */  lui     $at, %hi(jtbl_809960E4)       ## $at = 80990000
/* 01178 80995DC8 002F0821 */  addu    $at, $at, $t7              
/* 0117C 80995DCC 8C2F60E4 */  lw      $t7, %lo(jtbl_809960E4)($at)  
/* 01180 80995DD0 01E00008 */  jr      $t7                        
/* 01184 80995DD4 00000000 */  nop
glabel L80995DD8
/* 01188 80995DD8 3C188099 */  lui     $t8, %hi(func_80995A84)    ## $t8 = 80990000
/* 0118C 80995DDC 3C198099 */  lui     $t9, %hi(DoorKiller_DrawDoor)    ## $t9 = 80990000
/* 01190 80995DE0 27185A84 */  addiu   $t8, $t8, %lo(func_80995A84) ## $t8 = 80995A84
/* 01194 80995DE4 27395EC4 */  addiu   $t9, $t9, %lo(DoorKiller_DrawDoor) ## $t9 = 80995EC4
/* 01198 80995DE8 ACD80280 */  sw      $t8, 0x0280($a2)           ## 00000280
/* 0119C 80995DEC 10000007 */  beq     $zero, $zero, .L80995E0C   
/* 011A0 80995DF0 ACD90134 */  sw      $t9, 0x0134($a2)           ## 00000134
glabel L80995DF4
/* 011A4 80995DF4 3C088099 */  lui     $t0, %hi(DoorKiller_RubbleFall)    ## $t0 = 80990000
/* 011A8 80995DF8 3C098099 */  lui     $t1, %hi(DoorKiller_DrawRubble)    ## $t1 = 80990000
/* 011AC 80995DFC 250851C4 */  addiu   $t0, $t0, %lo(DoorKiller_RubbleFall) ## $t0 = 809951C4
/* 011B0 80995E00 25295F1C */  addiu   $t1, $t1, %lo(DoorKiller_DrawRubble) ## $t1 = 80995F1C
/* 011B4 80995E04 ACC80280 */  sw      $t0, 0x0280($a2)           ## 00000280
/* 011B8 80995E08 ACC90134 */  sw      $t1, 0x0134($a2)           ## 00000134
.L80995E0C:
/* 011BC 80995E0C 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 011C0 80995E10 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 011C4 80995E14 03E00008 */  jr      $ra                        
/* 011C8 80995E18 00000000 */  nop
