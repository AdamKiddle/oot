glabel func_808B818C
/* 00A7C 808B818C 3C0E808C */  lui     $t6, %hi(func_808B81A0)    ## $t6 = 808C0000
/* 00A80 808B8190 25CE81A0 */  addiu   $t6, $t6, %lo(func_808B81A0) ## $t6 = 808B81A0
/* 00A84 808B8194 AC8E0204 */  sw      $t6, 0x0204($a0)           ## 00000204
/* 00A88 808B8198 03E00008 */  jr      $ra                        
/* 00A8C 808B819C A4800216 */  sh      $zero, 0x0216($a0)         ## 00000216

