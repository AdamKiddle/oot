glabel func_80889B5C
/* 001FC 80889B5C 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 00200 80889B60 AFA40018 */  sw      $a0, 0x0018($sp)           
/* 00204 80889B64 8FAE0018 */  lw      $t6, 0x0018($sp)           
/* 00208 80889B68 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 0020C 80889B6C AFA5001C */  sw      $a1, 0x001C($sp)           
/* 00210 80889B70 00A02025 */  or      $a0, $a1, $zero            ## $a0 = 00000000
/* 00214 80889B74 85C5001C */  lh      $a1, 0x001C($t6)           ## 0000001C
/* 00218 80889B78 00052A03 */  sra     $a1, $a1,  8               
/* 0021C 80889B7C 0C00B2D0 */  jal     Flags_GetSwitch
              
/* 00220 80889B80 30A500FF */  andi    $a1, $a1, 0x00FF           ## $a1 = 00000000
/* 00224 80889B84 1040000A */  beq     $v0, $zero, .L80889BB0     
/* 00228 80889B88 8FA40018 */  lw      $a0, 0x0018($sp)           
/* 0022C 80889B8C 3C058089 */  lui     $a1, %hi(func_80889BC0)    ## $a1 = 80890000
/* 00230 80889B90 0C222658 */  jal     func_80889960              
/* 00234 80889B94 24A59BC0 */  addiu   $a1, $a1, %lo(func_80889BC0) ## $a1 = 80889BC0
/* 00238 80889B98 8FA4001C */  lw      $a0, 0x001C($sp)           
/* 0023C 80889B9C 0C020120 */  jal     func_80080480              
/* 00240 80889BA0 8FA50018 */  lw      $a1, 0x0018($sp)           
/* 00244 80889BA4 8FB80018 */  lw      $t8, 0x0018($sp)           
/* 00248 80889BA8 240F00C8 */  addiu   $t7, $zero, 0x00C8         ## $t7 = 000000C8
/* 0024C 80889BAC A70F0168 */  sh      $t7, 0x0168($t8)           ## 00000168
.L80889BB0:
/* 00250 80889BB0 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 00254 80889BB4 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 00258 80889BB8 03E00008 */  jr      $ra                        
/* 0025C 80889BBC 00000000 */  nop

