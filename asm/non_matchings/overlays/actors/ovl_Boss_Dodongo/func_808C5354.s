glabel func_808C5354
/* 041C4 808C5354 27BDFFD0 */  addiu   $sp, $sp, 0xFFD0           ## $sp = FFFFFFD0
/* 041C8 808C5358 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 041CC 808C535C AFB00018 */  sw      $s0, 0x0018($sp)           
/* 041D0 808C5360 AFA50034 */  sw      $a1, 0x0034($sp)           
/* 041D4 808C5364 848E0194 */  lh      $t6, 0x0194($a0)           ## 00000194
/* 041D8 808C5368 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 041DC 808C536C 5DC0000E */  bgtzl   $t6, .L808C53A8            
/* 041E0 808C5370 861901C0 */  lh      $t9, 0x01C0($s0)           ## 000001C0
/* 041E4 808C5374 8C980190 */  lw      $t8, 0x0190($a0)           ## 00000190
/* 041E8 808C5378 3C0F808C */  lui     $t7, %hi(func_808C5578)    ## $t7 = 808C0000
/* 041EC 808C537C 25EF5578 */  addiu   $t7, $t7, %lo(func_808C5578) ## $t7 = 808C5578
/* 041F0 808C5380 51F80009 */  beql    $t7, $t8, .L808C53A8       
/* 041F4 808C5384 861901C0 */  lh      $t9, 0x01C0($s0)           ## 000001C0
/* 041F8 808C5388 0C231530 */  jal     func_808C54C0              
/* 041FC 808C538C 00000000 */  nop
/* 04200 808C5390 8FA40034 */  lw      $a0, 0x0034($sp)           
/* 04204 808C5394 0C00CB1F */  jal     func_80032C7C              
/* 04208 808C5398 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 0420C 808C539C 10000044 */  beq     $zero, $zero, .L808C54B0   
/* 04210 808C53A0 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 04214 808C53A4 861901C0 */  lh      $t9, 0x01C0($s0)           ## 000001C0
.L808C53A8:
/* 04218 808C53A8 57200041 */  bnel    $t9, $zero, .L808C54B0     
/* 0421C 808C53AC 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 04220 808C53B0 8E090190 */  lw      $t1, 0x0190($s0)           ## 00000190
/* 04224 808C53B4 3C08808C */  lui     $t0, %hi(func_808C3224)    ## $t0 = 808C0000
/* 04228 808C53B8 25083224 */  addiu   $t0, $t0, %lo(func_808C3224) ## $t0 = 808C3224
/* 0422C 808C53BC 1509001C */  bne     $t0, $t1, .L808C5430       
/* 04230 808C53C0 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
/* 04234 808C53C4 8E07045C */  lw      $a3, 0x045C($s0)           ## 0000045C
/* 04238 808C53C8 00025180 */  sll     $t2, $v0,  6               
.L808C53CC:
/* 0423C 808C53CC 00EA1821 */  addu    $v1, $a3, $t2              
/* 04240 808C53D0 90660016 */  lbu     $a2, 0x0016($v1)           ## 00000016
/* 04244 808C53D4 24420001 */  addiu   $v0, $v0, 0x0001           ## $v0 = 00000001
/* 04248 808C53D8 00021400 */  sll     $v0, $v0, 16               
/* 0424C 808C53DC 30CB0002 */  andi    $t3, $a2, 0x0002           ## $t3 = 00000000
/* 04250 808C53E0 11600010 */  beq     $t3, $zero, .L808C5424     
/* 04254 808C53E4 00021403 */  sra     $v0, $v0, 16               
/* 04258 808C53E8 8C650024 */  lw      $a1, 0x0024($v1)           ## 00000024
/* 0425C 808C53EC 8CA40000 */  lw      $a0, 0x0000($a1)           ## 00000000
/* 04260 808C53F0 308C0010 */  andi    $t4, $a0, 0x0010           ## $t4 = 00000000
/* 04264 808C53F4 15800002 */  bne     $t4, $zero, .L808C5400     
/* 04268 808C53F8 308D0004 */  andi    $t5, $a0, 0x0004           ## $t5 = 00000000
/* 0426C 808C53FC 11A00009 */  beq     $t5, $zero, .L808C5424     
.L808C5400:
/* 04270 808C5400 30CEFFFD */  andi    $t6, $a2, 0xFFFD           ## $t6 = 00000000
/* 04274 808C5404 A06E0016 */  sb      $t6, 0x0016($v1)           ## 00000016
/* 04278 808C5408 240F0002 */  addiu   $t7, $zero, 0x0002         ## $t7 = 00000002
/* 0427C 808C540C A60F01C0 */  sh      $t7, 0x01C0($s0)           ## 000001C0
/* 04280 808C5410 0C230A6C */  jal     func_808C29B0              
/* 04284 808C5414 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 04288 808C5418 24180032 */  addiu   $t8, $zero, 0x0032         ## $t8 = 00000032
/* 0428C 808C541C 10000023 */  beq     $zero, $zero, .L808C54AC   
/* 04290 808C5420 A61801DA */  sh      $t8, 0x01DA($s0)           ## 000001DA
.L808C5424:
/* 04294 808C5424 28410013 */  slti    $at, $v0, 0x0013           
/* 04298 808C5428 5420FFE8 */  bnel    $at, $zero, .L808C53CC     
/* 0429C 808C542C 00025180 */  sll     $t2, $v0,  6               
.L808C5430:
/* 042A0 808C5430 8E07045C */  lw      $a3, 0x045C($s0)           ## 0000045C
/* 042A4 808C5434 3C0A808C */  lui     $t2, %hi(func_808C2FAC)    ## $t2 = 808C0000
/* 042A8 808C5438 90E30016 */  lbu     $v1, 0x0016($a3)           ## 00000016
/* 042AC 808C543C 30790002 */  andi    $t9, $v1, 0x0002           ## $t9 = 00000000
/* 042B0 808C5440 1320001A */  beq     $t9, $zero, .L808C54AC     
/* 042B4 808C5444 3068FFFD */  andi    $t0, $v1, 0xFFFD           ## $t0 = 00000000
/* 042B8 808C5448 A0E80016 */  sb      $t0, 0x0016($a3)           ## 00000016
/* 042BC 808C544C 8E020190 */  lw      $v0, 0x0190($s0)           ## 00000190
/* 042C0 808C5450 8E09045C */  lw      $t1, 0x045C($s0)           ## 0000045C
/* 042C4 808C5454 254A2FAC */  addiu   $t2, $t2, %lo(func_808C2FAC) ## $t2 = 808C2FAC
/* 042C8 808C5458 11420005 */  beq     $t2, $v0, .L808C5470       
/* 042CC 808C545C 8D250024 */  lw      $a1, 0x0024($t1)           ## 00000024
/* 042D0 808C5460 3C0B808C */  lui     $t3, %hi(func_808C2ECC)    ## $t3 = 808C0000
/* 042D4 808C5464 256B2ECC */  addiu   $t3, $t3, %lo(func_808C2ECC) ## $t3 = 808C2ECC
/* 042D8 808C5468 55620011 */  bnel    $t3, $v0, .L808C54B0       
/* 042DC 808C546C 8FBF001C */  lw      $ra, 0x001C($sp)           
.L808C5470:
/* 042E0 808C5470 0C018D74 */  jal     CollisionCheck_GetSwordDamage              
/* 042E4 808C5474 8CA40000 */  lw      $a0, 0x0000($a1)           ## 00000000
/* 042E8 808C5478 1040000C */  beq     $v0, $zero, .L808C54AC     
/* 042EC 808C547C A3A20027 */  sb      $v0, 0x0027($sp)           
/* 042F0 808C5480 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 042F4 808C5484 0C00BE0A */  jal     Audio_PlayActorSound2
              
/* 042F8 808C5488 24053806 */  addiu   $a1, $zero, 0x3806         ## $a1 = 00003806
/* 042FC 808C548C 0C230A1F */  jal     func_808C287C              
/* 04300 808C5490 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 04304 808C5494 240C0005 */  addiu   $t4, $zero, 0x0005         ## $t4 = 00000005
/* 04308 808C5498 A60C01C0 */  sh      $t4, 0x01C0($s0)           ## 000001C0
/* 0430C 808C549C 93AE0027 */  lbu     $t6, 0x0027($sp)           
/* 04310 808C54A0 860D0194 */  lh      $t5, 0x0194($s0)           ## 00000194
/* 04314 808C54A4 01AE7823 */  subu    $t7, $t5, $t6              
/* 04318 808C54A8 A60F0194 */  sh      $t7, 0x0194($s0)           ## 00000194
.L808C54AC:
/* 0431C 808C54AC 8FBF001C */  lw      $ra, 0x001C($sp)           
.L808C54B0:
/* 04320 808C54B0 8FB00018 */  lw      $s0, 0x0018($sp)           
/* 04324 808C54B4 27BD0030 */  addiu   $sp, $sp, 0x0030           ## $sp = 00000000
/* 04328 808C54B8 03E00008 */  jr      $ra                        
/* 0432C 808C54BC 00000000 */  nop
