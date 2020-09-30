; diverse banks, see "if else clauses"
 if  CURRENT_BANK = 3 
;
; Boss "Death star"
;
LASER_TIME          =        200 
BETWEEN_TIME        =        60 
BOSS_Y_POSSITION_4  =        $40                          ; $60 
;;;;;;; *****************************************
;;;;;;; * BANK 3 *
;;;;;;; *****************************************
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
coldetectBoss3_4 
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #6                           ; laser 
                    beq      xCheckOnly_laser_34 
; "non" shots have ypos set to max ($7f) therefore below test is always met and goes to noHit
; we do not need to test the shot itself for validity!
; yTest
; for "easyness" - just we say here if 
; y pos of shot is >= enemyPos than we hit!
;
                    lda      bossPosY                     ; pos of boss2, boss start at the top 
                    suba     #$28 
                    sta      enemyMINY 
                    ldb      bossPosY                     ; pos of boss2, boss start at the top 
                    sex      
; subd #$28; reduce by some offset to get the "mouth" part
                    std      tmp3_tmp 
                    ldb      T_YPOS, y 
                    sex      
                    subd     tmp3_tmp 
                    bpl      nonNegb2_34 
                    std      tmp3_tmp 
                    clra     
                    clrb     
                    subd     tmp3_tmp 
nonNegb2_34 
                    cmpd     #$28 
                    bhi      notHit_34 
;;;;; y done
xCheckOnly_34 
; xTest
                    ldb      bossPosX 
                    addb     #$80                         ; x coordinate enemy now 0 based in b 0-255 
; test center
                    stb      tmp1 
                    addb     #BOSS3_HIT_X_OFFSET 
                    bcc      testOnB3_1_34 
                    ldb      #$ff 
testOnB3_1_34 
                    cmpb     T_XPOS0_MINUS_1_RADIUS , y 
                    blo      notHit_34                    ; enemy is on left side of shot 
; in b 0 based enemy pos 
                    subb     #2*BOSS3_HIT_X_OFFSET 
                    bcc      testOnB3_2_34 
                    ldb      #$00 
testOnB3_2_34 
                    cmpb     T_XPOS0_PLUS_1_RADIUS , y 
                    bhi      notHit_34                    ; enemy is on right side of shot 
                    inc      tmp2_tmp_unique 
                    jmp      removeCurrentShotAndObjectBoss 

;..........
notHit_34 
                    jmp      [backJump] 

xCheckOnly_laser_34 
                    lda      bossPosY                     ; pos of boss2, boss start at the top 
                    suba     #$20                         ; reduce by some offset to get the "mouth" part 
; for laser cut off
                    sta      laserTmp 
                    clr      laserTmp2                    ; main laser only 
                    bra      xCheckOnly_34 

;
; .....................................................
;
subInitBoss4                                              ;#isfunction  
                    lda      lockPurchased 
                    ora      #ENEMY_DESTRUCTED_FLAG 
                    sta      lockPurchased 
; destroy scoopies!
                    ldd      #0 
                    sta      displayExplosions 
                    std      scoopEnemy1 
                    std      scoopEnemy2 
                    lda      #MAX_SHOT_OBJECTS_BOSS 
                    jsr      initBossFight 
REPLACE_1_2_playerShotsDoneBoss04_varFrom0_0 
                    ldd      #0                           ; 
                    std      PLAYERSHOTS_DONE_A 
; enemies
                    lda      #MAX_ENEMY_OBJECTS_BOSS4 
                    ldu      #enemyobject_list 
                    stu      enemylist_empty_head 
                    ldy      #ENEMY_DONE 
next_list_entry_igb4 
                    leax     EnemyStruct,u 
                    stx      NEXT_ENEMY_OBJECT,u 
                    clr      BIT_MASK,u 
                    leau     ,x 
                    deca     
                    bne      next_list_entry_igb4 
                    leau     -EnemyStruct,u 
                    sty      NEXT_ENEMY_OBJECT,u 
                    sty      enemylist_objects_head 
                    clr      boss4WeaponActive 
                    clr      allowBossShots 
; quick hack - zero 2 laser shots
                    ldu      #boss4laserData 
                    ldd      #0 
                    std      ,u++ 
                    std      ,u++ 
                    std      ,u++ 
                    std      ,u++ 
                    std      ,u++ 
                    std      ,u++ 
                    ldu      #boss4explosionData 
                    std      ,u++ 
                    std      ,u++ 
                    std      ,u++ 
                    std      ,u++ 
                    std      ,u++ 
                    std      ,u++ 
                    stb      signFlag 
                    stb      b4_divide_tmp 
                    std      b4_tmp1 
                    stb      b4_tmp2 
                    lda      #6 
                    sta      levelBulletBorder 
                    sta      lukeX 
                    rts      

;
; .....................................................
;
initBoss4                                                 ;#isfunction  
; Boss  intro
                    bsr      subInitBoss4 
REPLACE_1_2_initTitleRAM_varFrom0_19 
                    ldx      #0                           ; initTitleRAM 
                    jsr      jsrBank0X 
REPLACE_1_2_boss4Intro_varFromIRQ0_9 
                    ldx      #0                           ; boss4Intro 
                    jsr      jsrBank0_fromBank3_T1 
                    jsr      subInitBoss4 
                    inc      displayExplosions 
                    inc      allowBossShots 
; initialize boss fight 3 for real
; done in bank 0
                    ldd      #BOSS_Y_POSSITION_4*256 
                    std      bossPosY 
                    lda      diverseFlags 
                    ora      #%00001000                   ; boss flag 
                    sta      diverseFlags 
REPLACE_1_2_adjustShotDamage_varFrom0_42                  ;  bank 0 replace 
                    ldx      #0                           ; adjustShotDamage 
                    jsr      jsrBank0X 
                    ldb      difficulty 
                    andb     #$f                          ; 
                    beq      easy8 
                    decb     
                    beq      normal8 
                    decb     
                    beq      hard8 
impossible8 
                    ldd      #BOSS4_HITPOINTS*3 
                    bra      difCont8 

normal8 
hard8 
                    ldd      #BOSS4_HITPOINTS*2 
                    bra      difCont8 

easy8 
                    ldd      #BOSS4_HITPOINTS 
difCont8 
                    std      bossHP 
                    ldd      #enemies_done_boss4 
                    std      ENEMY_DONE_A 
                    ldd      #enemiesShots_done_boss4 
                    std      SHOTS_DONE_A 
                    clr      boss4ShotStage 
                    lda      #100                         ; 2s 
                    sta      boss4ShotStageDelayCounter 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
main1Boss4:                                               ;#isfunction  
enemiesShots_done_boss4 
                    lds      #MY_STACK                    ; CBFC ; correct the stack to default address 
; initialize all "round" stuff for player
                    jsr      bossFightPlayerStuff 
                    ldd      bulletSpawnAt 
                    beq      nowBulletSpawnb4 
                    jsr      spawnShot 
nowBulletSpawnb4 
                    ldd      #0 
                    std      bulletSpawnAt 
                    sta      isBugShot 
                    clr      bossWasHit 
                    RESET_LASER_SMALL  
                    ldy      #testShot 
                    ldx      ,y 
                    beq      backToTestBoss4_1 
                    ldd      #backToTestBoss4_1 
                    std      backJump 
                    jmp      coldetectBoss3_4 

backToTestBoss4_1 
                    ldy      #test2Shot 
                    ldx      ,y 
                    beq      backToTestBoss4_2 
                    ldd      #backToTestBoss4_2 
                    std      backJump 
                    jmp      coldetectBoss3_4 

backToTestBoss4_2 
; check for boss death
                    ldx      bossHP 
                    lbmi     extroBoss4 
; display boss in bank 0
REPLACE_1_2_displayBoss4_varFrom0_4 
                    ldx      #0                           ;displayBoss4 
                    jsr      jsrBank0X 
                    dec      boss4ShotStageDelayCounter 
                    bne      continueCurrentStageBoss4 
; do fight!
                    inc      boss4ShotStage 
                    lda      #25 
                    sta      boss4ShotStageDelayCounter 
                    lda      boss4ShotStage 
                    deca     
                    beq      not10 
                    lda      #10 
                    sta      boss4ShotStageDelayCounter 
not10 
continueCurrentStageBoss4 
                    ldb      gameScale 
                    stB      VIA_t1_cnt_lo 
                    jsr      Reset0Ref                    ; claibration reset 
                    lda      boss4ShotStage 
; stage 0: waiting for weapon initialze
                    beq      nothingSpecialAtAll 
                    deca     
; stage 1: start rotating
                    beq      startRotateWeapon 
; stage 2-8: switch on supporting lasers
                    ldd      bossPosY 
                    adda     #17 +12+1 
                    addb     #28 +16 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    JSR      myMovetod                    ;Moveto_d 
 else  
                    JSR      Moveto_d 
 endif  
                    lda      boss4ShotStage 
                    cmpa     #8 
                    ble      weaponLinesOnly 
                    lda      #8 
weaponLinesOnly 
                    deca     
                    sta      boss4ShotLineCounter 
doWeaponLines 
                    ldb      #50 / 2 
                    stB      VIA_t1_cnt_lo 
                    ldx      #WeaponList 
Draw_VLpWeapon: 
; DRAW
                    LDD      ,X++                         ;Get next coordinate pair 
                    STA      <VIA_port_a                  ;Send Y to A/D 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    clra     
                    sta      <VIA_port_b                  ;Enable mux 
                    inca     
                    sta      <VIA_port_b                  ;Disable mux 
 else  
                    CLR      <VIA_port_b                  ;Enable mux 
                    NOP      
                    INC      <VIA_port_b                  ;Disable mux 
 endif  
                    STB      <VIA_port_a                  ;Send X to A/D 
                    ldd      #%11111111 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    stb      <VIA_shift_reg 
                    LDD      -2,X                         ;Get next coordinate pair 
                    nega     
                    negb     
                    nop      8 
                    clr      <VIA_shift_reg 
; MOVE BACK
                    STA      <VIA_port_a                  ;Send Y to A/D 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    clra     
                    sta      <VIA_port_b                  ;Enable mux 
                    inca     
                    sta      <VIA_port_b                  ;Disable mux 
 else  
                    CLR      <VIA_port_b                  ;Enable mux 
                    NOP      
                    INC      <VIA_port_b                  ;Disable mux 
 endif  
                    STB      <VIA_port_a                  ;Send X to A/D 
                    clr      <VIA_t1_cnt_hi               ;Clear T1H 
                    nop      5 
                    dec      boss4ShotLineCounter 
                    bne      Draw_VLpWeapon 
                    _ZERO_VECTOR_BEAM  
;..........
                    lda      boss4ShotStage 
                    cmpa     #9 
                    blo      nothingSpecialAtAll 
; stage: 9 prepare laser, next stage 4 seconds
                    lbeq     initBoss4LaserPhase 
                    cmpa     #10 
; stage: 10 start firing
                    lbeq     laserFireStage 
; stage 11: reset to stage 0
                    clr      boss4ShotStage 
                    clr      boss4WeaponActive 
                    jsr      initVader 
                    bra      nothingSpecialAtAll 

;laserIsReady 
; fire shots each ## rounds
startRotateWeapon 
                    lda      #1 
                    sta      boss4WeaponActive 
nothingSpecialAtAll 
                    jsr      handleBossLaserShots 
                    jsr      calibrationZero7 
                    jsr      drawLuke 
                    _ZERO_VECTOR_BEAM  
                    lda      gameScale 
                    sta      <VIA_t1_cnt_lo 
; jsr drawVader vader is enemy
                    lda      #DEFAULT_ENEMY_INTENSITY 
                    _INTENSITY_A  
                    lds      enemylist_objects_head 
                    puls     d,pc                         ; (D = y,x) ; do all objects _> jumps to enemies_done_boss4 
;
; .....................................................
;
enemyVader 
                    dw       VaderAngle8Table 
                    db       2 
                    dw       VaderAnimTable 
                    db       1,TYPE_DONT_WAIT 
VaderAngle8Table 
VaderAnimTable 
                    dw       VaderList 
                    dw       VaderList 
                    dw       VaderList 
                    dw       VaderList 
                    dw       VaderList 
                    dw       VaderList 
                    dw       VaderList 
                    dw       VaderList 
                    dw       0 
VaderList 
Vader 
                    db       -$26, $01, -$39, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $5F, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $13, $01, $39, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$13, $01, $39 
                    db       -$13, $01, $4D 
                    db       $43, $01, -$26, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$73, $01, $73, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$5F, $01, $00 
                    db       -$73, $01, -$73 
                    db       $43, $01, $26, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$13, $01, -$4D, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$13, $01, -$39 
                    db       $13, $01, -$39 
                    db       $13, $01, -$4D 
                    db       -$43, $01, $26, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $73, $01, -$73, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $5F, $01, $00 
                    db       $73, $01, $73 
                    db       -$43, $01, -$26, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $13, $01, $4D, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, $72, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$5F, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $f0, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
XWing 
                    db       -$2B, $01, -$1A, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $0A, $01, $44, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0C, $01, -$06, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $09, $01, -$12 
                    db       $0B, $01, -$5A 
                    db       $0D, $01, $58 
                    db       $04, $01, $12 
                    db       $12, $01, $08 
                    db       $06, $01, -$46 
                    db       $03, $01, $4C, hi(SMVB_continue6_single), lo(SMVB_continue6_single) 
                    db       -$15, $01, $04 
                    db       -$18, $01, $1A 
                    db       -$1E, $01, -$1A 
                    db       -$0E, $01, -$02 
                    db       $00, $01, -$4B 
                    db       $f0, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
initVader                                                 ;#isfunction  
vaderIntroPattern   =        vaderLoopyPattern            ;entry8 
                    tst      bonusSpawnCount 
                    bne      noSpawnBoss4 
                    lda      #-1 
                    sta      patternDelayCounter 
                    lda      #1 
                    sta      introWaveEnemyDelayCount 
                    ldx      #vaderIntroPattern 
                    stx      introWaveCurrentPattern 
                    jsr      doIntro 
; only one enemy - can do it hardcoded!
                    ldx      enemylist_objects_head 
                    ldd      #enemyIntroPatternBehaviourVader 
                    std      2,x 
noSpawnBoss4 
                    rts      

;
;..............................................
;
drawLuke                                                  ;#isfunction  
                    lda      lukeX 
                    bmi      lukeIsNeg 
                    nega     
lukeIsNeg 
                    adda     #$2f 
                    jsr      Intensity_a 
                    lda      #gameScale 
                    sta      <VIA_t1_cnt_lo 
                    lda      Vec_Loop_Count+1 
                    anda     #1 
                    beq      noLukeDec 
                    dec      lukeX 
noLukeDec 
                    ldb      lukeX 
                    cmpb     #-40 
                    bgt      lukeOk 
                    cmpb     #-80 
                    bgt      lukeInvisible 
                    ldb      #40 
                    stb      lukeX 
lukeOk 
                    addb     bossPosX 
                    lda      bossPosY 
                    suba     #23 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    JSR      myMovetod                    ;Moveto_d 
 else  
                    JSR      Moveto_d 
 endif  
                    lda      #5 
                    sta      <VIA_t1_cnt_lo 
                    ldu      #XWing 
                    jmp      SMVB_drawSmart 

lukeInvisible 
                    rts      

;
;..............................................
;
laserFireStage 
                    ldb      difficulty 
                    andb     #$f 
                    beq      noextendedLaser 
; deca
; beq noextendedLaser2
;
;
;
; salvae
;                    ldu      #boss4laserData 
;                    lda      boss4ShotStageDelayCounter 
;                    cmpa     #LASER_TIME - 5 
;                    beq      fireLaser 
;
;                    cmpa     #LASER_TIME - 5 -BETWEEN_TIME/2-BETWEEN_TIME/2-BETWEEN_TIME/2 
;                    beq      fireLaser 
;
;
;
;                    leau     4,u 
;                    cmpa     #LASER_TIME - 5 -BETWEEN_TIME/2 
;                    beq      fireLaser 
;
;                    cmpa     #LASER_TIME - 5 -BETWEEN_TIME/2-BETWEEN_TIME/2-BETWEEN_TIME/2-BETWEEN_TIME/2 
;                    beq      fireLaser 
;
;
;                    leau     4,u 
;                    cmpa     #LASER_TIME - 5 -BETWEEN_TIME/2-BETWEEN_TIME/2 
;                    beq      fireLaser 
;                    jmp      nothingSpecialAtAll 
noextendedLaser2 
; salvae
                    ldu      #boss4laserData 
                    lda      boss4ShotStageDelayCounter 
                    cmpa     #LASER_TIME - 5 
                    beq      fireLaser 
                    cmpa     #LASER_TIME - 5 -BETWEEN_TIME/2-BETWEEN_TIME/2-BETWEEN_TIME/2 
                    beq      fireLaser 
                    leau     4,u 
                    cmpa     #LASER_TIME - 5 -BETWEEN_TIME/2 
                    beq      fireLaser 
                    leau     4,u 
                    cmpa     #LASER_TIME - 5 -BETWEEN_TIME/2-BETWEEN_TIME/2 
                    beq      fireLaser 
                    jmp      nothingSpecialAtAll 

noextendedLaser 
                    ldu      #boss4laserData 
                    lda      boss4ShotStageDelayCounter 
                    cmpa     #LASER_TIME - 5 
                    beq      fireLaser 
                    leau     4,u 
                    cmpa     #LASER_TIME - 5 -BETWEEN_TIME 
                    beq      fireLaser 
                    leau     4,u 
                    cmpa     #LASER_TIME - 5 -BETWEEN_TIME-BETWEEN_TIME 
                    beq      fireLaser 
                    jmp      nothingSpecialAtAll 

fireLaser                                                 ;#isfunction  
                    lda      #$81 
                    asra     
                    ldb      playerXpos 
                    asrb                                  ; half the player pos 
                    std      boss4LaserTarget,u 
                    lda      bossPosY 
                    clr      boss4shotMax,u 
                    lda      #-20 
                    sta      boss4shotMin,u 
                    jmp      nothingSpecialAtAll 

;
;..............................................
;
handleBossLaserShots                                      ;#isfunction  
                    ldu      #boss4laserData 
                    ldd      ,u 
                    beq      noLaser1 
                    bsr      boss4FireLaser 
noLaser1 
                    leau     4,u 
                    ldd      ,u 
                    beq      noLaser2 
                    bsr      boss4FireLaser 
noLaser2 
                    leau     4,u 
                    ldd      ,u 
                    beq      noLaser3 
                    bsr      boss4FireLaser 
noLaser3 
                    rts      

;
;..............................................
;
; input U pointer to laser struct
boss4FireLaser                                            ;#isfunction  
                    ldb      gameScale 
                    stB      VIA_t1_cnt_lo 
                                                          ; get lazer start 
                    ldd      bossPosY 
                    adda     #17 +12+1 
                    addb     #28 +16 
                    std      boss4LaserStartTmp 
                    asra     
                    sta      maxYSum                      ; start of weapon pos (1/2) 
                    asrb     
                    nega     
                    negb     
                    adda     boss4LaserTarget,u 
                    addb     boss4LaserTarget+1,u 
                    std      boss4LaserTargetTmp 
                    ldd      boss4LaserStartTmp 
                    stb      b4_tmp2 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    jsr      myMovetod 
 else  
                    jsr      Moveto_d 
 endif  
                    ldb      gameScale 
                    bpl      okAsislaser 
                    ldb      #$ff 
                    bra      storeHere 

okAsislaser 
                    decb     
                    aslb     
storeHere 
                    stB      VIA_t1_cnt_lo 
                    lda      boss4shotMax,u 
                    pshs     a 
                    ldd      boss4LaserTargetTmp 
                    jsr      clipDToMax 
                    std      boss4LaserStartTmp 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    jsr      myMovetod 
 else  
                    jsr      Moveto_d 
 endif  
                    ldb      b4_tmp2 
                    asrb     
                    stb      b4_tmp2 
                    ldb      boss4LaserStartTmp+1 
                    addb     b4_tmp2 
                    stb      b4_tmp2 
                    lda      maxYSum 
                    adda     boss4LaserStartTmp 
                    sta      maxYSum                      ; start of laser which is LIT 
                    puls     a 
                                                          ; get laser End 
                    lda      boss4shotMin,u 
                    pshs     a 
                    ldb      gameScale 
                    bpl      okAsislaser2 
                    ldb      #$ff 
                    bra      storeHere2 

okAsislaser2 
                    decb     
                    aslb     
storeHere2 
                    stB      VIA_t1_cnt_lo 
                    ldd      boss4LaserTargetTmp 
                    suba     boss4LaserStartTmp 
                    subb     boss4LaserStartTmp+1 
                    bsr      clipDToMax 
                    std      boss4LaserStartTmp 
                    STA      <VIA_port_a                  ;Send Y to A/D 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    clra     
                    sta      <VIA_port_b                  ;Enable mux 
                    inca     
                    sta      <VIA_port_b                  ;Disable mux 
 else  
                    CLR      <VIA_port_b                  ;Enable mux 
                    NOP      
                    INC      <VIA_port_b                  ;Disable mux 
 endif  
                    STB      <VIA_port_a                  ;Send X to A/D 
                    LDD      #$FF00                       ;Shift reg=$FF (solid line), T1H=0 
                    STA      <VIA_shift_reg               ;Put pattern in shift register 
                    STB      <VIA_t1_cnt_hi               ;Set T1H (scale factor?) 
                    LDD      #$0040                       ;B-reg = T1 interrupt bit 
LF3F4_b4:           BITB     <VIA_int_flags               ;Wait for T1 to time out 
                    BEQ      LF3F4_b4 
                    NOP                                   ;Wait a moment more 
                    STA      <VIA_shift_reg               ;Clear shift register (blank output) 
                    _ZERO_VECTOR_BEAM  
                    ldb      boss4LaserStartTmp+1 
                    addb     b4_tmp2 
                    stb      b4_tmp2 
                    puls     a 
                    lda      boss4LaserStartTmp 
                    adda     maxYSum 
                    sta      maxYSum                      ; end of laser which is LIT 
; in maxYSum is the start position of the "lit" laser part
BOSS4_LASER_YEND    =        -$40 
                    cmpa     #BOSS4_LASER_YEND 
                    bgt      nomaxOverflow 
                    bsr      boss4InitGroundExplosion 
                    inc      boss4shotMin,u 
                    inc      boss4shotMin,u 
                    bpl      doneLser 
                    bra      noMinDec 

BOSS3_LASER_LENGTH  =        -40 
nomaxOverflow 
                    lda      boss4shotMin,u 
                    cmpa     #BOSS3_LASER_LENGTH 
                    blt      noMinDec 
                    dec      boss4shotMin,u 
                    dec      boss4shotMin,u 
                    bra      noMaxDec 

noMinDec 
                    dec      boss4shotMax,u 
                    dec      boss4shotMax,u 
noMaxDec 
                    rts      

doneLser 
                    ldd      #0 
                    std      ,u 
                    rts      

; bra nothingSpecialAtAll
;
;..............................................
;
; in u current laser pointer
; explosion pointer is u + 8
boss4InitGroundExplosion                                  ;#isfunction  
; ypos is player "ground"
; x pos = boss4LaserTargetTmp+1
;
; struct Boss4GroundExplosion
;    ds ExPosy, 1
;    ds ExPosx, 1
;    ds ExSizeCounter, 1
;    ds ExSize, 1
; end struct
;
;
; end current laser
                    ldd      ExPosy+(Boss4LaserBeam * BOSS4_LASER_COUNT),u 
                    bne      exIsInit 
                    ldb      b4_tmp2                      ; this is double scale 
                    aslb     
                    lda      #$80 
                    std      ExPosy+(Boss4LaserBeam * BOSS4_LASER_COUNT),u 
                    lda      #5                           ; min explosion size 
                    sta      ExSize+(Boss4LaserBeam * BOSS4_LASER_COUNT),u 
exIsInit 
                    rts      

;
;..............................................
;
; in "d"
clipDToMax                                                ;#isfunction  
; resulting y is always boss4shotMax, that is the delta of the first move gap
                    nega                                  ; assuming boss4shotMax is alsways negative 
                    clr      b4_tmp1 
                    sta      b4_tmp1+1                    ; clear space for DIF, and set dif value 
; sta signFlag ; assuming always moving down -> thus negative
                    clr      signFlag 
                    lda      2,s 
                    bpl      maxShotPos 
                    nega     
maxShotPos 
; in a abs(delta)
                    tstb                                  ; x value 
                    bpl      bPosb4_1 
                    inc      signFlag 
                    negb     
; bvc bPosb4_1 ; $80 has overflow set -> 
; ldb #$7f
bPosb4_1 
                    mul      
; in d = abs(Ydelta) * abs(x)
; new X = sign * (d/abs(y))
                    bsr      difDByTmp 
                    lda      signFlag 
                    bita     #1 
                    beq      bPosB4_2 
                    negb     
bPosB4_2 
                    lda      2,s                          ; new y is the max 
                    rts      

;
;..............................................
;
;-------------------------------------------------------------------------------------------
;***************************************************************************
; divides D by tmp1, result in B
; uses divide_tmp as storage
; only 8 bit in tmp1, but must be manually poked to tmp1 + 1
; sign is correctly handled
;
; can probably be optimized like hell
; perhaps only nearing the result
; using 2 shifts and a plus
; might be worth a try,
; see vectrex emulator for algorithm...
; could be implemented with a tabel, which in turn
; could be caclulated on the fly... (upon startup)
;
; this makro divides exact, but slow
MY_DIV_D_BY_TMP1_TO_B_UNSIGNED  macro  
                    CLR      b4_divide_tmp 
                    TST      b4_tmp1+1 
                    BEQ      divide_by_zero\? 
                    DEC      b4_divide_tmp 
                    CMPD     #0 
                    BPL      divide_next\? 
divide_next1\?: 
                    INC      b4_divide_tmp 
                    ADDD     b4_tmp1 
                    BMI      divide_next1\? 
divide_by_zero1\?: 
                    LDB      b4_divide_tmp 
                    NEGB     
                    BRA      divide_end\? 

divide_next\?: 
                    INC      b4_divide_tmp 
                    SUBD     b4_tmp1 
                    BPL      divide_next\? 
divide_by_zero\?: 
                    LDB      b4_divide_tmp 
divide_end\?: 
                    endm     
difDByTmp 
                    MY_DIV_D_BY_TMP1_TO_B_UNSIGNED  
                    rts      

;
;..............................................
;
initBoss4LaserPhase                                       ;#isfunction  
                    lda      #LASER_TIME                  ; laser fires x second 
                    sta      boss4ShotStageDelayCounter 
                    inc      boss4ShotStage 
                    inc      boss4WeaponActive 
                    jmp      nothingSpecialAtAll 

;
;..............................................
;
;
;..............................................
;
WeaponList: 
                    DB       -$03*2, -$32*2               ; y, x 
                    DB       -$0B*2, -$3F*2               ; y, x 
                    DB       -$1E*2, -$3E*2               ; y, x 
                    DB       -$2F*2, -$32*2               ; y, x 
                    DB       -$37*2, -$1E*2               ; y, x 
                    DB       -$2F*2, -$10*2               ; y, x 
                    DB       -$0A*2, -$1E*2               ; y, x 
                    DB       -$1C*2, -$11*2               ; y, x 
enemies_done_boss4 
                    lda      #$7f 
                    _INTENSITY_A  
                    lds      shotlist_objects_head 
                    puls     d,pc                         ; jumpsto enemiesShots_done_boss4, which is: main1Boss4 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Boss fight done
extroBoss4                                                ;#isfunction  
                    lda      #2 
                    sta      explosionCount 
                    lda      #-1 
                    sta      boss4WeaponActive 
                    ldx      #extro4PointerSUB 
                    stx      bossExtroPointer 
                    jmp      extroBoss 

extro4PointerSUB 
REPLACE_1_2_displayFullDeathstar_varFrom0_2 
                    ldx      #0                           ;displayFullDeathstar 
                    jmp      jsrBank0X 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 endif  
 if  CURRENT_BANK = 2 
;;;;;;; *****************************************
;;;;;;; * BANK 2 *
;;;;;;; *****************************************
displayBoss4 
displayBoss4_0_0                                          ;#isfunction  
                    jsr      calibrationZero7 
                    sts      tmp4 
                    lda      #$60 
                    _INTENSITY_A  
                    lds      playershotlist_objects_head 
                    puls     d,pc                         ; (D = y,x) ; do all objects 
playerShotsDoneBoss04 
                    lds      tmp4 
; check if boss was hit (change intensity)
                    tst      bossWasHit 
                    beq      boss4NotHit 
                    jsr      Intensity_7F 
                    bra      intDoneBoss4 

boss4NotHit 
                    jsr      Intensity_3F 
intDoneBoss4 
                    jsr      bossDisplayHead 
                    jsr      calibrationZero50 
                    clra     
                    sta      <VIA_shift_reg 
                    ldd      #0 
                    std      <VIA_port_b 
                    ldd      bossPosY 
;                    bsr      displayFullDeathstar 
;                    rts      
displayFullDeathstar 
;.....................
                    jsr      calibrationZero50 
                    clra     
                    sta      <VIA_shift_reg 
                    LDy      #deathStarSceneData          ; address of data 
nextBoss4Part_a 
                    ldu      ,y++ 
                    beq      headDoneBoss4 
                    ldb      gameScale 
                    stB      VIA_t1_cnt_lo 
                    ldd      bossPosY 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    jsr      my_Moveto_d                  ; Moveto_d 
 else  
                    JSR      Moveto_d 
 endif  
                    lda      #50 
                    sta      VIA_t1_cnt_lo 
                    jsr      SMVB50_drawSmart 
                    bra      nextBoss4Part_a 

headDoneBoss4 
                    tst      boss4WeaponActive 
                    bmi      noWeaponAtall4 
;.....................
                    ldb      gameScale 
                    stB      VIA_t1_cnt_lo 
                    ldd      bossPosY 
                    adda     #17 
                    addb     #28 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    jsr      my_Moveto_d                  ; Moveto_d 
 else  
                    JSR      Moveto_d 
 endif  
                    LDy      #deathStarWeaponAnim 
                    lda      boss4WeaponActive 
                    beq      noBoss4Anim 
                    cmpa     #1 
                    bne      fastestBoss4Weapon 
                    tst      animDelayCounter 
                    bne      notAnimNextBoss4 
fastestBoss4Weapon 
                    inc      boss4WeaponAnimCounter 
notIncingBoss4Weapon 
                    lda      boss4WeaponAnimCounter 
                    lsla     
                    ldu      a,y 
                    bne      notAnimNextBoss4 
noBoss4Anim 
                    clr      boss4WeaponAnimCounter 
notAnimNextBoss4 
                    lda      boss4WeaponAnimCounter 
                    lsla     
                    ldu      a,y 
                    lda      #50 
                    sta      VIA_t1_cnt_lo 
                    jsr      SMVB50_drawSmart 
noWeaponAtall4 
                    tst      displayExplosions 
                    bne      handleBossExplosions 
noEplisionsBoss4 
                    _ZERO_VECTOR_BEAM  
                    rts      

;
;..............................................
;
handleBossExplosions                                      ;#isfunction  
                    lda      gameScale 
                    sta      <VIA_t1_cnt_lo 
                    ldu      #boss4explosionData 
                    ldd      ExPosy,u 
                    beq      trySecondExplosion 
                    sex      
                    addd     #$80 
                    std      b4_tmp1 
                    ldb      playerXpos 
                    sex      
                    addd     #$80 
                    subd     b4_tmp1 
                    MY_LSR_D  
                    bpl      noNegpb4 
                    negb     
noNegpb4 
                    stb      b4_tmp1 
                    ldb      ExSize,u 
                    asrb     
                    cmpb     b4_tmp1 
                    blo      notHItpv4 
                    inc      playerWasHitFor 
notHItpv4 
                    ldd      ExPosy,u 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    jsr      my_Moveto_d                  ; Moveto_d 
 else  
                    JSR      Moveto_d 
 endif  
                    lda      ExSize,u 
                    inca     
                    sta      ExSize,u 
                    cmpa     #50 
                    lbhi     removeFirstExplosion 
                    sta      <VIA_t1_cnt_lo 
                    asla     
                    nega     
                    adda     #$7f 
                    jsr      Intensity_a 
                    ldu      #circleHalf 
                    jsr      SMVB50_drawSmart 
trySecondExplosion 
                    ldu      #boss4explosionData+Boss4GroundExplosion 
                    ldd      ExPosy,u 
                    beq      tryThirdExplosion 
                    sex      
                    addd     #$80 
                    std      b4_tmp1 
                    ldb      playerXpos 
                    sex      
                    addd     #$80 
                    subd     b4_tmp1 
                    MY_LSR_D  
                    bpl      noNegpb4_2 
                    negb     
noNegpb4_2 
                    stb      b4_tmp1 
                    ldb      ExSize,u 
                    asrb     
                    cmpb     b4_tmp1 
                    blo      notHItpv4_2 
                    inc      playerWasHitFor 
notHItpv4_2 
                    ldd      ExPosy,u 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    jsr      my_Moveto_d                  ; Moveto_d 
 else  
                    JSR      Moveto_d 
 endif  
                    lda      ExSize,u 
                    inca     
                    sta      ExSize,u 
                    cmpa     #50 
                    bhi      removeSecondExplosion 
                    sta      <VIA_t1_cnt_lo 
                    asla     
                    nega     
                    adda     #$7f 
                    jsr      Intensity_a 
                    ldu      #circleHalf 
                    jsr      SMVB50_drawSmart 
tryThirdExplosion 
                    ldu      #boss4explosionData+2*Boss4GroundExplosion 
                    ldd      ExPosy,u 
                    lbeq     noEplisionsBoss4 
                    sex      
                    addd     #$80 
                    std      b4_tmp1 
                    ldb      playerXpos 
                    sex      
                    addd     #$80 
                    subd     b4_tmp1 
                    MY_LSR_D  
                    bpl      noNegpb4_3 
                    negb     
noNegpb4_3 
                    stb      b4_tmp1 
                    ldb      ExSize,u 
                    asrb     
                    cmpb     b4_tmp1 
                    blo      notHItpv4_3 
                    inc      playerWasHitFor 
notHItpv4_3 
                    ldd      ExPosy,u 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    jsr      my_Moveto_d                  ; Moveto_d 
 else  
                    JSR      Moveto_d 
 endif  
                    lda      ExSize,u 
                    inca     
                    sta      ExSize,u 
                    cmpa     #50 
                    bhi      removeThirdExplosion 
                    sta      <VIA_t1_cnt_lo 
                    asla     
                    nega     
                    adda     #$7f 
                    jsr      Intensity_a 
                    ldu      #circleHalf 
                    jsr      SMVB50_drawSmart 
                    jmp      noEplisionsBoss4 

removeThirdExplosion 
                    ldd      #0 
                    std      ExPosy,u 
                    jmp      noEplisionsBoss4 

removeSecondExplosion 
                    ldd      #0 
                    std      ExPosy,u 
                    bra      tryThirdExplosion 

removeFirstExplosion 
                    ldd      #0 
                    std      ExPosy,u 
                    jmp      trySecondExplosion 

;
; .....................................................
;
circleHalf 
                    db       $00, $01, -$6C, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $12, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $18, $01, $06, hi(SMVB50_continue7_single), lo(SMVB50_continue7_single) 
                    db       $18, $01, $12 
                    db       $18, $01, $1E 
                    db       $0C, $01, $24 
                    db       $00, $01, $24 
                    db       -$0C, $01, $24 
                    db       -$18, $01, $1E 
                    db       -$18, $01, $12, hi(SMVB50_continue3_single), lo(SMVB50_continue3_single) 
                    db       -$18, $01, $06 
                    db       -$12, $01, $00 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
 endif  
 if  CURRENT_BANK = 0 
;;;;;;; *****************************************
;;;;;;; * BANK 0 *
;;;;;;; *****************************************
boss4Intro 
                    inc      boss4WeaponActive 
                    ldd      #$3000 
                    std      bossPosY 
                    clr      boss4WeaponAnimCounter 
REPLACE_1_2_boss4Music_varFromIRQ1_1 
                    ldu      #0                           ; ; boss4Music 
REPLACE_1_2_PLYINIT_varFromIRQ1_19 
                    ldx      #0                           ; PLYINIT 
                    jsr      jsrBank1_fromBank0_T1 
                    clr      songLoop 
                    lda      #-50 
                    sta      introBossX 
                    nega     
                    sta      introPlayerX 
                    IRQ_TO_0_SHIFT  
                    lda      #150 
                    sta      scoopEnemy1 
boss4IntroLoop 
                    JSR      Wait_Recal_noShift           ; Vectrex BIOS recalibration 
;                    jsr      Intensity_5F 
                    jsr      Intensity_3F 
REPLACE_1_2_playAKSMusicNoLoop_varFromIRQ1_19 
                    ldx      #0                           ; playAKSMusicNoLoop 
                    jsr      jsrBank1_fromBank0_T1 
                    jsr      calibrationZero50 
                    LDy      #Boss4IntroList              ; address of data 
nextScenePart_b4: 
                    lda      #50 
                    sta      VIA_t1_cnt_lo 
                    LDU      ,y++ 
                    beq      contBoss4Draw 
                    clra     
                    ldb      introBossX 
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    MY_MOVE_TO_D_END  
                    jsr      SMVB50_drawSmart 
                    BRA      nextScenePart_b4 

contBoss4Draw 
; twinkler
                    clra     
                    ldb      introBossX 
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    RANDOM_A  
                    anda     #%00011111 
                    ldu      #Boss4IntroTwinklerAnim 
                    lsla     
                    ldu      a,u 
                    MY_MOVE_TO_D_END  
                    jsr      SMVB50_drawSmart 
                    RANDOM_A  
                    clra     
                    ldb      introBossX 
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    anda     #%00011111 
                    ldu      #Boss4IntroTwinklerAnim 
                    lsla     
                    ldu      a,u 
                    MY_MOVE_TO_D_END  
                    jsr      SMVB50_drawSmart 
                    RANDOM_A  
                    clra     
                    ldb      introBossX 
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    anda     #%00011111 
                    ldu      #Boss4IntroTwinklerAnim 
                    lsla     
                    ldu      a,u 
                    MY_MOVE_TO_D_END  
                    jsr      SMVB50_drawSmart 
                    RANDOM_A  
                    anda     #%00011111 
                    ldu      #Boss4IntroTwinklerAnim 
                    lsla     
                    ldu      a,u 
                    clra     
                    ldb      introBossX 
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    MY_MOVE_TO_D_END  
                    jsr      SMVB50_drawSmart 
                    jsr      drawBossPlayerOnly 
                    lda      Vec_Loop_Count+1 
                    anda     #%00000011 
                    bne      noPosChangeB4 
                    ldb      introBossX 
                    beq      noPosChangeB4 
                    inc      introBossX 
                    dec      introPlayerX 
noPosChangeB4 
                    ldb      scoopEnemy1 
                    beq      noWait_b4 
                    dec      scoopEnemy1 
                    jmp      boss4IntroLoop 

noWait_b4 
REPLACE_1_2_getButtonState_varFromIRQ1_19 
                    ldx      #0                           ; getButtonState 
                    jsr      jsrBank1_fromBank0_T1 
                    ldb      current_button_state 
                    andb     #3 
                    CMPB     #$01                         ; pressed, but last time was unpressed 
                    lbne     boss4IntroLoop 
                    rts      

Boss4IntroList 
                    DW       Boss4IntroList_0             ; list of all single vectorlists in this 
                    DW       Boss4IntroList_1 
                    DW       Boss4IntroList_2 
                    DW       Boss4IntroList_3 
                    DW       Boss4IntroList_4 
                    DW       0 
Boss4IntroList_0 
                    db       $6B, $01, $16, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $00, $01, -$21, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $ce, $01, -$0B, hi(SMVB50_startMove_yStays_single), lo(SMVB50_startMove_yStays_single) ; y was $00, now $ce 
                    db       $ee, $01, -$04, hi(SMVB50_startDraw_yStays_single), lo(SMVB50_startDraw_yStays_single) ; y was $00, now $ee 
                    db       $ce, $01, -$09, hi(SMVB50_startMove_yStays_single), lo(SMVB50_startMove_yStays_single) ; y was $00, now $ce 
                    db       $ee, $01, -$35, hi(SMVB50_startDraw_yStays_single), lo(SMVB50_startDraw_yStays_single) ; y was $00, now $ee 
                    db       -$0B, $01, $08, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $00, $01, -$12, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss4IntroList_1 
                    db       $66, $01, -$14, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $00, $01, $4C, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$32, $01, $00, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       -$1E, $01, $02, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $00, $01, $0B, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$10, $01, -$01, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $00, $01, $0C, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$16, $01, $00, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $ee, $01, -$09, hi(SMVB50_startDraw_newY_eq_oldX_single), lo(SMVB50_startDraw_newY_eq_oldX_single) ; y was $00, now $ee 
                    db       -$22, $01, -$0C, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $00, $01, -$02, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $10, $01, -$05, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $00, $01, -$0B, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $0D, $01, -$0E, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $00, $01, -$13, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $12, $01, -$0B, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $14, $01, $0E 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss4IntroList_2 
                    db       $75, $01, $03, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $00, $01, $0A, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $0E, $01, $01, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $00, $01, -$03, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $0C, $01, -$07, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $00, $01, -$0D, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $08, $01, -$0A, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$21, $01, -$26, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$32, $01, -$09, hi(SMVB50_continue6_single), lo(SMVB50_continue6_single) 
                    db       -$1F, $01, $19 
                    db       $00, $01, $41 
                    db       $1D, $01, $23 
                    db       $00, $01, $2A 
                    db       -$19, $01, -$12 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss4IntroList_3 
                    db       $1E, $01, $59, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $00, $01, -$53, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $ce, $01, -$13, hi(SMVB50_startMove_yStays_single), lo(SMVB50_startMove_yStays_single) ; y was $00, now $ce 
                    db       $ee, $01, -$1A, hi(SMVB50_startDraw_yStays_single), lo(SMVB50_startDraw_yStays_single) ; y was $00, now $ee 
                    db       -$22, $01, $37, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $00, $01, -$33, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $0A, $01, -$06, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $00, $01, $27, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $ce, $01, $0A, hi(SMVB50_startMove_yStays_single), lo(SMVB50_startMove_yStays_single) ; y was $00, now $ce 
                    db       $ee, $01, $1C, hi(SMVB50_startDraw_yStays_single), lo(SMVB50_startDraw_yStays_single) ; y was $00, now $ee 
                    db       $3E, $01, $5F, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $00, $01, -$10, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $0D, $01, -$1F, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $2C, $01, $10, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, -$21, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $ce, $01, $2E, hi(SMVB50_startMove_yStays_single), lo(SMVB50_startMove_yStays_single) ; y was $00, now $ce 
                    db       $ee, $01, $3B, hi(SMVB50_startDraw_yStays_single), lo(SMVB50_startDraw_yStays_single) ; y was $00, now $ee 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss4IntroList_4 
                    db       $71, $01, $52, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $21, $01, -$09, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$04, $01, $11, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$28, $01, $0E, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$0B, $01, -$02, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $00, $01, -$17, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$29, $01, -$13, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $29, $01, $04, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, -$1E, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $2B, $01, -$25, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$16, $01, $02, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$0B, $01, -$0F, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $00, $01, $79, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$5C, $01, -$0E, hi(SMVB50_continue4_single), lo(SMVB50_continue4_single) 
                    db       -$54, $01, -$3F 
                    db       -$36, $01, -$76 
                    db       $00, $01, -$3C 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss4IntroTwinklerAnim 
                    DW       Boss4IntroTwinkler_0         ; list of all single vectorlists in this 
                    DW       Boss4IntroTwinkler_1 
                    DW       Boss4IntroTwinkler_2 
                    DW       Boss4IntroTwinkler_3 
                    DW       Boss4IntroTwinkler_4 
                    DW       Boss4IntroTwinkler_5 
                    DW       Boss4IntroTwinkler_6 
                    DW       Boss4IntroTwinkler_7 
                    DW       Boss4IntroTwinkler_8 
                    DW       Boss4IntroTwinkler_9 
                    DW       Boss4IntroTwinkler_10 
                    DW       Boss4IntroTwinkler_11 
                    DW       Boss4IntroTwinkler_12 
                    DW       Boss4IntroTwinkler_13 
                    DW       Boss4IntroTwinkler_14 
                    DW       Boss4IntroTwinkler_15 
                    DW       Boss4IntroTwinkler_16 
                    DW       Boss4IntroTwinkler_17 
                    DW       Boss4IntroTwinkler_18 
                    DW       Boss4IntroTwinkler_19 
                    DW       Boss4IntroTwinkler_20 
                    DW       Boss4IntroTwinkler_21 
                    DW       Boss4IntroTwinkler_22 
                    DW       Boss4IntroTwinkler_23 
                    DW       Boss4IntroTwinkler_24 
                    DW       Boss4IntroTwinkler_25 
                    DW       Boss4IntroTwinkler_26 
                    DW       Boss4IntroTwinkler_27 
                    DW       Boss4IntroTwinkler_28 
                    DW       Boss4IntroTwinkler_29 
                    DW       Boss4IntroTwinkler_30 
                    DW       Boss4IntroTwinkler_30        ; 32 easy MOD 
                    DW       0 
Boss4IntroTwinkler_0 
                    db       -$04, $01, -$72, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $00, $01, $0B, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss4IntroTwinkler_1 
                    db       $1C, $01, -$69, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $00, $01, -$07, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss4IntroTwinkler_2 
                    db       $07, $01, -$46, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $00, $01, -$06, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss4IntroTwinkler_3 
                    db       $01, $01, -$52, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $00, $01, -$10, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss4IntroTwinkler_4 
                    db       $27, $01, -$78, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $00, $01, $18, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss4IntroTwinkler_5 
                    db       $1B, $01, -$6B, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $00, $01, $04, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss4IntroTwinkler_6 
                    db       $0F, $01, -$60, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $00, $01, $0D, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss4IntroTwinkler_7 
                    db       $18, $01, -$54, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $00, $01, $0B, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss4IntroTwinkler_8 
                    db       $22, $01, -$48, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $00, $01, $09, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss4IntroTwinkler_9 
                    db       $44, $01, -$7D, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $00, $01, $02, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss4IntroTwinkler_10 
                    db       $44, $01, -$63, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $00, $01, $10, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss4IntroTwinkler_11 
                    db       $7F, $01, -$2F, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $00, $01, -$0E, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss4IntroTwinkler_12 
                    db       $75, $01, -$57, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $00, $01, $0D, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss4IntroTwinkler_13 
                    db       $7F, $01, -$4D, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $00, $01, -$11, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss4IntroTwinkler_14 
                    db       $4C, $01, -$41, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $00, $01, -$04, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss4IntroTwinkler_15 
                    db       $3F, $01, -$4B, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $00, $01, -$16, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss4IntroTwinkler_16 
                    db       $34, $01, -$54, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $00, $01, -$1D, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss4IntroTwinkler_17 
                    db       $46, $01, -$70, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $00, $01, -$07, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss4IntroTwinkler_18 
                    db       $6B, $01, -$31, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $00, $01, -$23, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss4IntroTwinkler_19 
                    db       $6B, $01, -$49, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $00, $01, -$04, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss4IntroTwinkler_20 
                    db       $6B, $01, -$50, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $00, $01, -$02, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss4IntroTwinkler_21 
                    db       $78, $01, -$52, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $00, $01, -$05, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss4IntroTwinkler_22 
                    db       $6B, $01, -$56, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $00, $01, $02, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss4IntroTwinkler_23 
                    db       $5D, $01, -$55, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $00, $01, $04, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss4IntroTwinkler_24 
                    db       $66, $01, -$64, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $00, $01, -$04, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss4IntroTwinkler_25 
                    db       $6B, $01, -$66, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $00, $01, $04, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss4IntroTwinkler_26 
                    db       $6B, $01, -$6C, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $00, $01, -$05, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss4IntroTwinkler_27 
                    db       $7F, $01, -$6F, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $00, $01, $05, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss4IntroTwinkler_28 
                    db       $5C, $01, -$30, hi(SMVB50_continue_tripple), lo(SMVB50_continue_tripple) 
                    db       $00, $01, $07, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss4IntroTwinkler_29 
                    db       $7A, $01, -$41, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $00, $01, $14, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss4IntroTwinkler_30 
                    db       $7F, $01, -$2C, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $00, $01, $0B, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 endif  
