glabel func_8097FF9C
/* 0292C 8097FF9C 27BDFF78 */  addiu   $sp, $sp, 0xFF78           ## $sp = FFFFFF78
/* 02930 8097FFA0 AFBF004C */  sw      $ra, 0x004C($sp)           
/* 02934 8097FFA4 AFB00048 */  sw      $s0, 0x0048($sp)           
/* 02938 8097FFA8 AFA40088 */  sw      $a0, 0x0088($sp)           
/* 0293C 8097FFAC AFA5008C */  sw      $a1, 0x008C($sp)           
/* 02940 8097FFB0 8CB00000 */  lw      $s0, 0x0000($a1)           ## 00000000
/* 02944 8097FFB4 3C068098 */  lui     $a2, %hi(D_809827C8)       ## $a2 = 80980000
/* 02948 8097FFB8 24C627C8 */  addiu   $a2, $a2, %lo(D_809827C8)  ## $a2 = 809827C8
/* 0294C 8097FFBC 27A40064 */  addiu   $a0, $sp, 0x0064           ## $a0 = FFFFFFDC
/* 02950 8097FFC0 240701D6 */  addiu   $a3, $zero, 0x01D6         ## $a3 = 000001D6
/* 02954 8097FFC4 0C031AB1 */  jal     func_800C6AC4              
/* 02958 8097FFC8 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 0295C 8097FFCC 0C024F46 */  jal     func_80093D18              
/* 02960 8097FFD0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 02964 8097FFD4 8E0202C0 */  lw      $v0, 0x02C0($s0)           ## 000002C0
/* 02968 8097FFD8 8FAA0088 */  lw      $t2, 0x0088($sp)           
/* 0296C 8097FFDC 3C18DB06 */  lui     $t8, 0xDB06                ## $t8 = DB060000
/* 02970 8097FFE0 244F0008 */  addiu   $t7, $v0, 0x0008           ## $t7 = 00000008
/* 02974 8097FFE4 AE0F02C0 */  sw      $t7, 0x02C0($s0)           ## 000002C0
/* 02978 8097FFE8 37180020 */  ori     $t8, $t8, 0x0020           ## $t8 = DB060020
/* 0297C 8097FFEC AC580000 */  sw      $t8, 0x0000($v0)           ## 00000000
/* 02980 8097FFF0 25480198 */  addiu   $t0, $t2, 0x0198           ## $t0 = 00000198
/* 02984 8097FFF4 8D070000 */  lw      $a3, 0x0000($t0)           ## 00000198
/* 02988 8097FFF8 24190020 */  addiu   $t9, $zero, 0x0020         ## $t9 = 00000020
/* 0298C 8097FFFC 240B0040 */  addiu   $t3, $zero, 0x0040         ## $t3 = 00000040
/* 02990 80980000 240C0001 */  addiu   $t4, $zero, 0x0001         ## $t4 = 00000001
/* 02994 80980004 AFAC0018 */  sw      $t4, 0x0018($sp)           
/* 02998 80980008 AFAB0014 */  sw      $t3, 0x0014($sp)           
/* 0299C 8098000C AFB90010 */  sw      $t9, 0x0010($sp)           
/* 029A0 80980010 AFA0001C */  sw      $zero, 0x001C($sp)         
/* 029A4 80980014 8D0D0004 */  lw      $t5, 0x0004($t0)           ## 0000019C
/* 029A8 80980018 240F0040 */  addiu   $t7, $zero, 0x0040         ## $t7 = 00000040
/* 029AC 8098001C 240E0020 */  addiu   $t6, $zero, 0x0020         ## $t6 = 00000020
/* 029B0 80980020 AFAE0024 */  sw      $t6, 0x0024($sp)           
/* 029B4 80980024 AFAF0028 */  sw      $t7, 0x0028($sp)           
/* 029B8 80980028 25430178 */  addiu   $v1, $t2, 0x0178           ## $v1 = 00000178
/* 029BC 8098002C AFAD0020 */  sw      $t5, 0x0020($sp)           
/* 029C0 80980030 8C780000 */  lw      $t8, 0x0000($v1)           ## 00000178
/* 029C4 80980034 240C0080 */  addiu   $t4, $zero, 0x0080         ## $t4 = 00000080
/* 029C8 80980038 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 029CC 8098003C AFB8002C */  sw      $t8, 0x002C($sp)           
/* 029D0 80980040 8C790004 */  lw      $t9, 0x0004($v1)           ## 0000017C
/* 029D4 80980044 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 029D8 80980048 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 029DC 8098004C AFB90030 */  sw      $t9, 0x0030($sp)           
/* 029E0 80980050 8C6B0008 */  lw      $t3, 0x0008($v1)           ## 00000180
/* 029E4 80980054 AFAC0038 */  sw      $t4, 0x0038($sp)           
/* 029E8 80980058 AFA20060 */  sw      $v0, 0x0060($sp)           
/* 029EC 8098005C 0C02541A */  jal     Draw_TwoTexScrollEnvColor              
/* 029F0 80980060 AFAB0034 */  sw      $t3, 0x0034($sp)           
/* 029F4 80980064 8FA90060 */  lw      $t1, 0x0060($sp)           
/* 029F8 80980068 3C0EDA38 */  lui     $t6, 0xDA38                ## $t6 = DA380000
/* 029FC 8098006C 35CE0002 */  ori     $t6, $t6, 0x0002           ## $t6 = DA380002
/* 02A00 80980070 AD220004 */  sw      $v0, 0x0004($t1)           ## 00000004
/* 02A04 80980074 8E0202C0 */  lw      $v0, 0x02C0($s0)           ## 000002C0
/* 02A08 80980078 3C058098 */  lui     $a1, %hi(D_809827E0)       ## $a1 = 80980000
/* 02A0C 8098007C 24A527E0 */  addiu   $a1, $a1, %lo(D_809827E0)  ## $a1 = 809827E0
/* 02A10 80980080 244D0008 */  addiu   $t5, $v0, 0x0008           ## $t5 = 00000008
/* 02A14 80980084 AE0D02C0 */  sw      $t5, 0x02C0($s0)           ## 000002C0
/* 02A18 80980088 AC4E0000 */  sw      $t6, 0x0000($v0)           ## 00000000
/* 02A1C 8098008C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 02A20 80980090 240601E5 */  addiu   $a2, $zero, 0x01E5         ## $a2 = 000001E5
/* 02A24 80980094 0C0346A2 */  jal     Matrix_NewMtx              
/* 02A28 80980098 AFA2005C */  sw      $v0, 0x005C($sp)           
/* 02A2C 8098009C 8FA3005C */  lw      $v1, 0x005C($sp)           
/* 02A30 809800A0 3C190600 */  lui     $t9, 0x0600                ## $t9 = 06000000
/* 02A34 809800A4 27394F90 */  addiu   $t9, $t9, 0x4F90           ## $t9 = 06004F90
/* 02A38 809800A8 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 02A3C 809800AC 8E0202C0 */  lw      $v0, 0x02C0($s0)           ## 000002C0
/* 02A40 809800B0 3C18DE00 */  lui     $t8, 0xDE00                ## $t8 = DE000000
/* 02A44 809800B4 3C0CD838 */  lui     $t4, 0xD838                ## $t4 = D8380000
/* 02A48 809800B8 244F0008 */  addiu   $t7, $v0, 0x0008           ## $t7 = 00000008
/* 02A4C 809800BC AE0F02C0 */  sw      $t7, 0x02C0($s0)           ## 000002C0
/* 02A50 809800C0 AC590004 */  sw      $t9, 0x0004($v0)           ## 00000004
/* 02A54 809800C4 AC580000 */  sw      $t8, 0x0000($v0)           ## 00000000
/* 02A58 809800C8 8E0202C0 */  lw      $v0, 0x02C0($s0)           ## 000002C0
/* 02A5C 809800CC 358C0002 */  ori     $t4, $t4, 0x0002           ## $t4 = D8380002
/* 02A60 809800D0 240D0040 */  addiu   $t5, $zero, 0x0040         ## $t5 = 00000040
/* 02A64 809800D4 244B0008 */  addiu   $t3, $v0, 0x0008           ## $t3 = 00000008
/* 02A68 809800D8 AE0B02C0 */  sw      $t3, 0x02C0($s0)           ## 000002C0
/* 02A6C 809800DC 3C068098 */  lui     $a2, %hi(D_809827F8)       ## $a2 = 80980000
/* 02A70 809800E0 24C627F8 */  addiu   $a2, $a2, %lo(D_809827F8)  ## $a2 = 809827F8
/* 02A74 809800E4 27A40064 */  addiu   $a0, $sp, 0x0064           ## $a0 = FFFFFFDC
/* 02A78 809800E8 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 02A7C 809800EC 240701E9 */  addiu   $a3, $zero, 0x01E9         ## $a3 = 000001E9
/* 02A80 809800F0 AC4D0004 */  sw      $t5, 0x0004($v0)           ## 00000004
/* 02A84 809800F4 0C031AD5 */  jal     func_800C6B54              
/* 02A88 809800F8 AC4C0000 */  sw      $t4, 0x0000($v0)           ## 00000000
/* 02A8C 809800FC 8FBF004C */  lw      $ra, 0x004C($sp)           
/* 02A90 80980100 8FB00048 */  lw      $s0, 0x0048($sp)           
/* 02A94 80980104 27BD0088 */  addiu   $sp, $sp, 0x0088           ## $sp = 00000000
/* 02A98 80980108 03E00008 */  jr      $ra                        
/* 02A9C 8098010C 00000000 */  nop

