glabel func_80061C18
/* AD8DB8 80061C18 90A20013 */  lbu   $v0, 0x13($a1)
/* AD8DBC 80061C1C 908E0012 */  lbu   $t6, 0x12($a0)
/* AD8DC0 80061C20 01C27824 */  and   $t7, $t6, $v0
/* AD8DC4 80061C24 31F80038 */  andi  $t8, $t7, 0x38
/* AD8DC8 80061C28 13000010 */  beqz  $t8, .L80061C6C
/* AD8DCC 80061C2C 00000000 */   nop   
/* AD8DD0 80061C30 90830013 */  lbu   $v1, 0x13($a0)
/* AD8DD4 80061C34 90B90012 */  lbu   $t9, 0x12($a1)
/* AD8DD8 80061C38 306A0002 */  andi  $t2, $v1, 2
/* AD8DDC 80061C3C 00794024 */  and   $t0, $v1, $t9
/* AD8DE0 80061C40 31090038 */  andi  $t1, $t0, 0x38
/* AD8DE4 80061C44 11200009 */  beqz  $t1, .L80061C6C
/* AD8DE8 80061C48 00000000 */   nop   
/* AD8DEC 80061C4C 11400002 */  beqz  $t2, .L80061C58
/* AD8DF0 80061C50 304B0004 */   andi  $t3, $v0, 4
/* AD8DF4 80061C54 15600005 */  bnez  $t3, .L80061C6C
.L80061C58:
/* AD8DF8 80061C58 304C0002 */   andi  $t4, $v0, 2
/* AD8DFC 80061C5C 11800005 */  beqz  $t4, .L80061C74
/* AD8E00 80061C60 306D0004 */   andi  $t5, $v1, 4
/* AD8E04 80061C64 51A00004 */  beql  $t5, $zero, .L80061C78
/* AD8E08 80061C68 8CAE0000 */   lw    $t6, ($a1)
.L80061C6C:
/* AD8E0C 80061C6C 03E00008 */  jr    $ra
/* AD8E10 80061C70 24020001 */   li    $v0, 1

.L80061C74:
/* AD8E14 80061C74 8CAE0000 */  lw    $t6, ($a1)
.L80061C78:
/* AD8E18 80061C78 8C8F0000 */  lw    $t7, ($a0)
/* AD8E1C 80061C7C 00001025 */  move  $v0, $zero
/* AD8E20 80061C80 15CF0003 */  bne   $t6, $t7, .L80061C90
/* AD8E24 80061C84 00000000 */   nop   
/* AD8E28 80061C88 03E00008 */  jr    $ra
/* AD8E2C 80061C8C 24020001 */   li    $v0, 1

.L80061C90:
/* AD8E30 80061C90 03E00008 */  jr    $ra
/* AD8E34 80061C94 00000000 */   nop   
