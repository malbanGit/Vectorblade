;single swarm members attack?
; diverse banks, see "if else clauses"
;
; Boss "Insect Queen"
;
 if  CURRENT_BANK = 3 
;;;;;;; *****************************************
;;;;;;; * BANK 3 *
;;;;;;; *****************************************
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
subInitBoss2 
                    lda      lockPurchased 
                    ora      #ENEMY_DESTRUCTED_FLAG 
                    sta      lockPurchased 
; destroy scoopies!
                    ldd      #0 
                    sta      bossIntroStage 
                    std      scoopEnemy1 
                    std      scoopEnemy2 
                    sta      boss2Direction 
                    lda      #50 
                    sta      boss2Scale 
                    lda      #MAX_SHOT_OBJECTS 
                    jsr      initBossFight 
; done in bank 2
REPLACE_1_2_playerShotsDoneBoss02_varFrom0_0 
                    ldd      #0                           ; 
                    std      PLAYERSHOTS_DONE_A 
                    lda      difficulty 
                    anda     #$f 
                    sta      maxSwarmAttacker 
                    rts      

;
; .....................................................
;
initBoss2                                                 ;#isfunction  
                    bsr      subInitBoss2 
; no stars
; no bonus
; special is queen in the middle
; swarm bug appear to protect the queen
; 
; Boss  intro
REPLACE_1_2_initTitleRAM_varFrom0_22 
                    ldx      #0                           ; initTitleRAM 
                    jsr      jsrBank0X 
REPLACE_1_2_doBoss2Intro00_varFromIRQ0_9 
                    ldx      #0                           ; doBoss2Intro00 
                    jsr      jsrBank0_fromBank3_T1 
                    bsr      subInitBoss2 
                    jsr      clear_all_sound 
;
                    lda      diverseFlags 
                    ora      #%00000100                   ; flag for boss 2 
                    sta      diverseFlags 
REPLACE_1_2_adjustShotDamage_varFrom0_44                  ;  bank 0 replace 
                    ldx      #0                           ; adjustShotDamage 
                    jsr      jsrBank0X 
                    ldb      difficulty 
                    andb     #$f                          ; 
                    beq      easy6 
                    decb     
                    beq      normal6 
                    decb     
                    beq      hard6 
impossible6 
                    ldd      #BOSS2_HITPOINTS*3 
                    bra      difCont6 

normal6 
hard6 
                    ldd      #BOSS2_HITPOINTS*2 
                    bra      difCont6 

easy6 
                    ldd      #BOSS2_HITPOINTS 
difCont6 
                    std      bossHP 
                    ldd      #$6000 
                    std      bossPosY 
                    ldd      #1 
                    std      bulletSpawnAt                ; ensure the swarm does not spawn bullets 
; init boss fight 2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; init swarm enemyList
; MAX_SWARM_OBJECTS = 40
; swarmobject_list = bonusobject_list
; swarmobject_list_end = enemyobject_list_end 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                    lda      #MAX_SWARM_OBJECTS 
                    ldu      #swarmobject_list 
                    stu      enemylist_empty_head 
                    ldy      #ENEMY_DONE 
next_list_entry_swarm 
                    leax     SwarmEnemy,u 
                    stx      NEXT_ENEMY_OBJECT,u 
                    leau     ,x 
                    deca     
                    bne      next_list_entry_swarm 
                    leau     -SwarmEnemy,u 
                    sty      NEXT_ENEMY_OBJECT,u 
                    sty      enemylist_objects_head 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                    ldd      #enemies_done_boss2 
                    std      ENEMY_DONE_A 
                    ldd      #enemiesShots_done_boss2 
                    std      SHOTS_DONE_A 
; add one big bug -> the queen
                    lda      #30 
                    sta      boss2Scale 
                    lda      #1                           ; grow 
                    sta      boss2Direction 
boss2Loop                                                 ;#isfunction  
enemiesShots_done_boss2 
                    lds      #MY_STACK                    ; CBFC ; correct the stack to default address 
                    tst      sfx_pointer_1 
                    bne      noBackgroundNoiseQueen 
REPLACE_1_2_queenSoundData_varFromIRQ1_3 
                    ldx      #0                           ;queenSoundData 
                    stx      sfx_pointer_1 
noBackgroundNoiseQueen 
                    lda      boss2Direction 
                    beq      boss2Shrink 
                    cmpa     #2 
                    bge      bossSizingDone 
                    inc      boss2Scale 
                    lda      #50 
                    cmpa     boss2Scale 
                    bne      bossSizingDone 
                    lda      #2                           ; attack 
                    sta      boss2Direction 
                    bra      bossSizingDone 

boss2Shrink 
                    lda      boss2Scale 
                    cmpa     #45 
                    blt      dodecBoss2 
                    anda     #1 
                    bne      dodecBoss2_shot2 
; position of newly spawned antenna shots
                    ldd      #$803c 
                    std      bulletSpawnAt 
                    lda      #3 
                    sta      isBugShot 
                    jsr      spawnShot 
                    ldb      #$c4 
                    stb      bulletSpawnAt+1 
                    jsr      spawnShot 
                    bra      dodecBoss2 

dodecBoss2_shot2 
; position of newly spawned fang shots
                    ldd      #$180c 
                    std      bulletSpawnAt 
                    ldd      #3 
                    sta      isBugShot 
                    stb      shotSpeed 
                    jsr      spawnShot 
                    ldb      #$f2 
                    stb      bulletSpawnAt+1 
                    jsr      spawnShot 
                    bra      dodecBoss2 

dodecBoss2 
                    dec      boss2Scale 
                    lda      #30 
                    cmpa     boss2Scale 
                    ble      bossSizingDone 
                    lda      #1                           ; grow 
                    sta      boss2Direction 
bossSizingDone 
                    jsr      bossFightPlayerStuff 
; spawn a swarm member every x cycles -> endlessly!
 if  NO_SWARM = 1 
 else  
                    jsr      spawnSwarm 
 endif  
                    clr      bossWasHit 
                    RESET_LASER_SMALL  
                    lda      #DEFAULT_ENEMY_INTENSITY 
                    _INTENSITY_A  
                    jsr      calibrationSwarm 
                    clr      laserTag 
                    lds      enemylist_objects_head 
                    puls     d,pc                         ; (D = y,x) ; do all objects 
enemies_done_boss2 
                    lds      #MY_STACK                    ; CBFC ; correct the stack to default address 
                    clr      tmp2_tmp_unique 
                    COL_DETECT_ENEMY_BOSS2  testShot ,1 
                    COL_DETECT_ENEMY_BOSS2  test2Shot ,0 
                    clr      tmp2_tmp_unique 
; Boss fight done
                    LDA      #$98 
                    STA      <VIA_aux_cntl                ; Shift reg mode = 000 free disable, T1 PB7 enabled 
                    ldx      bossHP 
                    lbmi     extroBoss2 
bossFightNotDoneBoss2 
; spawn player shots after displyay
REPLACE_1_2_displayBoss2_varFrom0_9                       ;  bank 0 replace 
                    ldx      #0                           ; displayBoss2 
                    jsr      jsrBank0X 
; .
                    tst      laserEnemyPointer 
                    beq      backy1s_2 
                    inc      laserTag 
                    ldd      #backy1s 
                    std      backJump 
                    lds      laserEnemyPointer 
                    jmp      lasershotReEntry 

backy1s 
                    lda      gameScale 
                    sta      <VIA_t1_cnt_lo 
backy1s_2 
; .
                    lds      #MY_STACK                    ; CBFC ; correct the stack to default address 
                    jsr      calibrationZero7 
                    lda      #$7f 
                    _INTENSITY_A  
                    lds      shotlist_objects_head 
                    puls     d,pc                         ; jumps to enemiesShots_done_boss2 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
spawnSwarm                                                ;        #isfunction 
                    jsr      newEnemyObject               ; "create" (or rather get) new object 
                    cmpu     #OBJECT_LIST_COMPARE_ADDRESS 
                    bls      spawnSwarm_end 
                    ldd      #swarmBehaviour 
                    std      BEHAVIOUR,u 
                    lda      #SWARM_HP 
                    sta      SWARM_HIT_POINTS, u 
                    RANDOM_A  
                    ora      #%10000000 
                    cmpa     #-$58 
                    bgt      swarmyaok 
                    adda     #$28 
swarmyaok 
                    sta      Y_POS, u 
                    RANDOM_A2  
                    cmpa     #-$80+30 
                    bgt      xPosCorrect_1 
                    lda      #-$80+30 
xPosCorrect_1 
                    cmpa     #$7f-30 
                    blt      xPosCorrect_2 
                    lda      #$7f-30 
xPosCorrect_2 
                    sta      X_POS, u 
                    clr      SWARM_ANIM_POS, u 
                    clr      SWARM_ALL_PURPOSE, u         ;flash length 
                    inc      swarmCounter 
                    lda      swarmCounter 
                    anda     #%00000011 
                    lsla     
                    lsla     
                    lsla     
                    lsla     
                    sta      SWARM_MOVEMENT_INFO, u 
                    rts      

spawnSwarm_end 
                    ldu      #0 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Boss fight done
extroBoss2                                                ;#isfunction  
                    lda      #3 
                    sta      explosionCount 
                    ldx      #extro2PointerSUB 
                    stx      bossExtroPointer 
                    jmp      extroBoss 

extro2PointerSUB 
REPLACE_1_2_displayBoss2_varFrom0_8                       ;  bank 0 replace 
                    ldx      #0                           ; displayBoss2 
                    jmp      jsrBank0X 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 endif  
 if  CURRENT_BANK = 2 
;;;;;;; *****************************************
;;;;;;; * BANK 2 *
;;;;;;; *****************************************
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
displayBoss2 
displayBoss2_0_0                                          ;#isfunction  
                    sts      tmp4 
                    jsr      calibrationZero7 
                    lda      #$60 
                    _INTENSITY_A  
                    lds      playershotlist_objects_head 
                    puls     d,pc                         ; (D = y,x) ; do all objects 
playerShotsDoneBoss02 
                    lds      tmp4 
                    tst      bossWasHit 
                    beq      boss2NotHit 
                    jsr      Intensity_7F 
                    bra      intDoneBoss2 

boss2NotHit 
                    lda      #50 
                    suba     boss2Scale 
                    nega     
                    adda     #$3f 
                    jsr      Intensity_a 
intDoneBoss2 
                    jsr      bossDisplayHead 
displayQueenHeadOnly 
                    jsr      calibrationZero50 
                    clra     
                    ldb      gameScale 
                    sta      <VIA_shift_reg 
                    LDA      #$CC 
                    STA      VIA_cntl                     ;/BLANK low and /ZERO low 
                    stB      VIA_t1_cnt_lo 
                    ldd      #0 
                    std      <VIA_port_b 
                    lda      boss2Direction 
                    cmpa     #2 
                    blt      normalMoveBoss2 
                    bne      normalMoveBoss23 
                    ldb      bossPosY 
                    subb     #6 
                    stb      bossPosY 
                    cmpb     #-$33 
                    bgt      normalMoveBoss2 
                    lda      #3 
                    sta      boss2Direction 
normalMoveBoss23 
                    ldb      bossPosY 
                    addb     #2 
                    stb      bossPosY 
                    cmpb     #$60 
                    blt      normalMoveBoss2 
                    clr      boss2Direction 
normalMoveBoss2 
                    ldd      bossPosY 
                    MY_MOVE_TO_D_START  
                    dec      antennaDelayCounter 
                    bpl      antennaBoss2Stay_b2 
                    lda      #ANIMATION_DELAY 
                    sta      antennaDelayCounter 
                    inc      antennaAnimCounter 
antennaBoss2Stay_b2 
                    ldu      #QueenAnim 
                    lda      antennaAnimCounter 
                    asla     
                    ldu      a,u 
                    bne      boss2QueenOk_b2 
                    clr      antennaAnimCounter 
                    bra      antennaBoss2Stay_b2 

boss2QueenOk_b2 
                    lda      boss2Scale 
                    sta      VIA_t1_cnt_lo 
                    MY_MOVE_TO_B_END  
                    jsr      SMVB50_drawSmart 
                    ldd      bossPosY 
                    MY_MOVE_TO_D_START  
                    lda      boss2Scale 
                    sta      VIA_t1_cnt_lo 
                    ldb      bossPosY 
                    bpl      normalHeadBoss2 
                    cmpb     #-$20 
                    ble      mouthClosedQueen 
                    ldu      #QueenHead2 
                    bra      displayQueen 

mouthClosedQueen 
; test if player is hit by fangs
                    lda      playerXpos 
                    cmpa     #25 
                    bgt      playerNotHitBoss2 
                    cmpa     #-25 
                    blt      playerNotHitBoss2 
                    inc      playerWasHitFor 
playerNotHitBoss2 
                    ldu      #QueenHead3 
                    bra      displayQueen 

normalHeadBoss2 
                    ldu      #QueenHead 
displayQueen 
                    MY_MOVE_TO_B_END  
                    jmp      SMVB50_drawSmart 

 endif  
 if  CURRENT_BANK = 0 
;;;;;;; *****************************************
;;;;;;; * BANK 0 *
;;;;;;; *****************************************
doBoss2Intro00 
doBoss2Intro0_0                                           ;#isfunction  
                    lda      #ANIMATION_DELAY 
                    sta      antennaDelayCounter 
                    clr      antennaAnimCounter 
                    clr      songLoop 
                    lda      #-50 
                    sta      introBossX 
                    nega     
                    sta      introPlayerX 
                    lda      #150 
                    sta      scoopEnemy1 
REPLACE_1_2_boss2Music_varFromIRQ1_1 
                    ldu      #0                           ; ; boss2Music 
REPLACE_1_2_PLYINIT_varFromIRQ1_9 
                    ldx      #0                           ; PLYINIT 
                    jsr      jsrBank1_fromBank0_T1 
                    IRQ_TO_0_SHIFT  
boss2IntroLoop 
                    JSR      Wait_Recal_noShift           ; Vectrex BIOS recalibration 
;                    jsr      Intensity_5F 
                    jsr      Intensity_3F 
REPLACE_1_2_playAKSMusicNoLoop_varFromIRQ1_9 
                    ldx      #0                           ; playAKSMusicNoLoop 
                    jsr      jsrBank1_fromBank0_T1 
                    jsr      calibrationZero50 
                    LDy      #Boss2IntroList              ; address of data 
nextScenePart_b2: 
                    lda      #50 
                    sta      <VIA_t1_cnt_lo 
                    LDU      ,y++ 
                    beq      contBoss2Draw 
                    clra     
                    ldb      introBossX 
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    MY_MOVE_TO_D_END  
                    jsr      SMVB50_drawSmart 
                    BRA      nextScenePart_b2 

contBoss2Draw 
                    lda      bossIntroStage 
                    cmpa     #1 
                    beq      middleAntenna 
                    cmpa     #2 
                    beq      closedAntenna 
                    LDy      #AntennaOpened               ; address of data 
                    bra      antennaCont 

middleAntenna 
                    ldy      #AntennaMiddle 
                    bra      antennaCont 

closedAntenna 
                    LDy      #AntennaClosed               ; address of data 
; #0 open
; #1 half
; #2 closed
antennaCont 
nextScenePart_b2o: 
                    lda      #50 
                    sta      <VIA_t1_cnt_lo 
                    LDU      ,y++ 
                    beq      contBoss2ODraw 
                    clra     
                    ldb      introBossX 
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    MY_MOVE_TO_D_END  
                    jsr      SMVB50_drawSmart 
                    BRA      nextScenePart_b2o 

contBoss2ODraw 
                    bsr      drawBossPlayerOnly 
                    lda      Vec_Loop_Count+1 
                    anda     #%00000011 
                    bne      noPosChangeB2 
                    ldb      introBossX 
                    beq      noPosChangeB2 
                    inc      introBossX 
                    dec      introPlayerX 
noPosChangeB2 
                    ldb      scoopEnemy1 
                    beq      noWait_b2 
                    dec      scoopEnemy1 
                    lda      scoopEnemy1 
                    cmpa     #100 
                    bne      no100 
                    inc      bossIntroStage 
no100 
                    cmpa     #50 
                    bne      no50 
                    inc      bossIntroStage 
no50 
                    jmp      boss2IntroLoop 

noWait_b2 
REPLACE_1_2_getButtonState_varFromIRQ1_49 
                    ldx      #0                           ; getButtonState 
                    jsr      jsrBank1_fromBank0_T1 
                    ldb      current_button_state 
                    andb     #3 
                    CMPB     #$01                         ; pressed, but last time was unpressed 
                    lbne     boss2IntroLoop 
                    rts      

;...
; assuming Zero50 Calibration done
; uses animDelayCounter for animation decrease and counter
drawBossPlayerOnly 
                    jsr      Intensity_5F 
                    LDy      #BossPlayer                  ; address of data 
nextScenePlayerPart: 
                    ldd      #50 
                    stb      VIA_t1_cnt_lo 
                    ldb      introPlayerX 
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    LDU      ,y++ 
                    ldd      ,y 
                    beq      lastDrawBossPlayer 
                    MY_MOVE_TO_D_END  
                    jsr      SMVB50_drawSmart 
                    BRA      nextScenePlayerPart 

lastDrawBossPlayer 
                    lda      Vec_Loop_Count+1 
                    anda     #1 
                    bne      nonoBPChange 
                    tst      animDelayCounter             ; one global animation counter 
                    bne      noAnimChange_m1_bp 
                    lda      #5                           ; number of animation steps ANIMATION_DELAY 
                    sta      animDelayCounter 
noAnimChange_m1_bp 
                    dec      animDelayCounter 
nonoBPChange 
                    MY_MOVE_TO_D_END  
                    jsr      SMVB50_drawSmart 
                    jsr      Intensity_7F 
                    LDB      animDelayCounter             ; current animation frame 
                    LSLB                                  ; times two since it is a word pointer 
                    LDU      #PlayerShipAccelAnim         ; address of data 
                    LDU      b,U 
notEndYet_bp 
                    ldd      #50 
                    stb      VIA_t1_cnt_lo 
                    ldb      introPlayerX 
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    MY_MOVE_TO_D_END  
                    jmp      SMVB50_drawSmart 

;...
AntennaOpened 
                    DW       AntennaOpened_0              ; list of all single vectorlists in this 
                    DW       AntennaOpened_1 
                    DW       0 
AntennaOpened_0 
                    db       $75, $01, $42, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       -$15, $01, $7B, hi(SMVB50_startDraw_double), lo(SMVB50_startDraw_double) 
                    db       -$61, $01, -$1B, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $53, $01, $07, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
AntennaOpened_1 
                    db       $62, $01, -$17, hi(SMVB50_continue_tripple), lo(SMVB50_continue_tripple) 
                    db       $0F, $01, -$5B, hi(SMVB50_startDraw_tripple), lo(SMVB50_startDraw_tripple) 
                    db       -$76, $01, $3B, hi(SMVB50_startMove_double), lo(SMVB50_startMove_double) 
                    db       $6D, $01, -$2E, hi(SMVB50_startDraw_double), lo(SMVB50_startDraw_double) 
                    db       -$16, $01, $73, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
AntennaMiddle 
                    DW       AntennaMiddle_0              ; list of all single vectorlists in this 
                    DW       AntennaMiddle_1 
                    DW       0 
AntennaMiddle_0 
                    db       $75, $01, $42, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       -$23, $01, $6C, hi(SMVB50_startDraw_double), lo(SMVB50_startDraw_double) 
                    db       -$47, $01, -$2F, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $7A, $01, $32, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
AntennaMiddle_1 
                    db       $62, $01, -$17, hi(SMVB50_continue_tripple), lo(SMVB50_continue_tripple) 
                    db       $05, $01, -$57, hi(SMVB50_startDraw_tripple), lo(SMVB50_startDraw_tripple) 
                    db       -$71, $01, $66, hi(SMVB50_startMove_double), lo(SMVB50_startMove_double) 
                    db       $69, $01, -$5B, hi(SMVB50_startDraw_double), lo(SMVB50_startDraw_double) 
                    db       -$08, $01, $6F, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
AntennaClosed 
                    DW       AntennaClosed_0              ; list of all single vectorlists in this 
                    DW       AntennaClosed_1 
                    DW       0 
AntennaClosed_0 
                    db       $75, $01, $42, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       -$31, $01, $5E, hi(SMVB50_startDraw_double), lo(SMVB50_startDraw_double) 
                    db       -$47, $01, -$37, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $43, $01, $25, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
AntennaClosed_1 
                    db       $62, $01, -$17, hi(SMVB50_continue_tripple), lo(SMVB50_continue_tripple) 
                    db       -$03, $01, -$7F, hi(SMVB50_startDraw_double), lo(SMVB50_startDraw_double) 
                    db       -$56, $01, $56, hi(SMVB50_startMove_tripple), lo(SMVB50_startMove_tripple) 
                    db       $7B, $01, -$78, hi(SMVB50_startDraw_double), lo(SMVB50_startDraw_double) 
                    db       $01, $01, $6D, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss2IntroList 
                    DW       MantisMain_0                 ; list of all single vectorlists in this 
                    DW       MantisMain_1 
                    DW       MantisMain_2 
                    DW       MantisMain_3 
                    DW       0 
MantisMain_0 
                    db       $67, $01, $3F, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $05, $01, $0C, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $0A, $01, $07, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $08, $01, -$07 
                    db       $03, $01, -$06, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$03, $01, -$13, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$16, $01, -$1F, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$0D, $01, -$21 
                    db       -$11, $01, $27, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $24, $01, -$56, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $0E, $01, -$4C, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $42, $01, $05, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$0B, $01, $0C, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$21, $01, $0D, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$21, $01, $1C 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
MantisMain_1 
                    db       $64, $01, -$06, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $00, $01, $0D, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$11, $01, $29, hi(SMVB50_continue7_single), lo(SMVB50_continue7_single) 
                    db       -$1C, $01, $09 
                    db       -$04, $01, $0A 
                    db       -$10, $01, -$01 
                    db       -$14, $01, $16 
                    db       -$18, $01, $0E 
                    db       -$1F, $01, -$08 
                    db       -$0E, $01, -$13, hi(SMVB50_continue7_single), lo(SMVB50_continue7_single) 
                    db       -$0B, $01, -$24 
                    db       $11, $01, $16 
                    db       $1E, $01, $05 
                    db       $16, $01, -$10 
                    db       $06, $01, -$1F 
                    db       -$06, $01, -$1D 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
MantisMain_2 
                    db       $50, $01, -$4A, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       -$11, $01, $16, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$0B, $01, $24, hi(SMVB50_continue7_single), lo(SMVB50_continue7_single) 
                    db       $16, $01, -$1E 
                    db       $19, $01, -$0E 
                    db       $1B, $01, $03 
                    db       $11, $01, $10 
                    db       $13, $01, -$0B 
                    db       $06, $01, -$19 
                    db       -$0E, $01, -$10, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $1C, $01, -$4E, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $2F, $01, -$05, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $13, $01, $37, hi(SMVB50_continue5_single), lo(SMVB50_continue5_single) 
                    db       -$19, $01, $3D 
                    db       -$0E, $01, $08 
                    db       -$24, $01, $0E 
                    db       -$18, $01, -$06 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
MantisMain_3 
                    db       $43, $01, $00, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       -$09, $01, $2C, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $11, $01, $21, hi(SMVB50_continue6_single), lo(SMVB50_continue6_single) 
                    db       $16, $01, $0B 
                    db       $0E, $01, $00 
                    db       -$19, $01, $1B 
                    db       -$2F, $01, -$0B 
                    db       -$05, $01, -$0D 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
BossPlayer 
                    DW       BossPlayer_0                 ; list of all single vectorlists in this 
                    DW       BossPlayer_1 
                    DW       BossPlayer_2 
                    DW       BossPlayer_3 
                    DW       BossPlayer_4 
                    DW       BossPlayer_5 
                    DW       0 
BossPlayer_0 
                    db       -$6A, $01, $2C, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       -$06, $01, -$19, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $11, $01, -$06, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$58, $01, -$58, hi(SMVB50_startDraw_yEqx_single), lo(SMVB50_startDraw_yEqx_single) ; y is -$58 
                    db       -$03, $01, -$0D, hi(SMVB50_continue7_single), lo(SMVB50_continue7_single) 
                    db       $03, $01, $00 
                    db       $07, $01, $0B 
                    db       $5F, $01, $00 
                    db       $05, $01, $03 
                    db       $11, $01, $00 
                    db       $1B, $01, $00 
                    db       $06, $01, -$05, hi(SMVB50_continue3_single), lo(SMVB50_continue3_single) 
                    db       $00, $01, -$09 
                    db       -$06, $01, -$05 
                    db       -$26, $01, $10, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$06, $01, $03, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
BossPlayer_1 
                    db       -$4B, $01, $0B, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $1E, $01, -$01, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $06, $01, $02, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $04, $01, -$05 
                    db       -$04, $01, $05, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $1D, $01, -$03, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $06, $01, -$06, hi(SMVB50_continue3_single), lo(SMVB50_continue3_single) 
                    db       $00, $01, -$08 
                    db       -$06, $01, -$05 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
BossPlayer_2 
                    db       -$1A, $01, $32, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $01, $01, $02, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, $02, hi(SMVB50_continue5_single), lo(SMVB50_continue5_single) 
                    db       -$02, $01, $03 
                    db       -$0B, $01, $04 
                    db       -$03, $01, -$01 
                    db       -$08, $01, $03 
                    db       -$0B, $01, -$0F, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0B, $01, $06, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, $13, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$08, $01, $06 
                    db       -$5F, $01, $29, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
BossPlayer_3 
                    db       -$57, $01, $23, hi(SMVB50_continue_tripple), lo(SMVB50_continue_tripple) 
                    db       $27, $01, -$0B, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $05, $01, $03, hi(SMVB50_continue4_single), lo(SMVB50_continue4_single) 
                    db       $09, $01, $07 
                    db       $06, $01, $1C 
                    db       -$0C, $01, $0F 
                    db       $0B, $01, -$06, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $06, $01, $16, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $0B, $01, -$04, hi(SMVB50_continue3_single), lo(SMVB50_continue3_single) 
                    db       -$21, $01, $4F 
                    db       $00, $01, $05 
                    db       $03, $01, -$0B, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $00, $01, $09, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $36, $01, -$21, hi(SMVB50_continue5_single), lo(SMVB50_continue5_single) 
                    db       $05, $01, $03 
                    db       $21, $01, -$16 
                    db       $00, $01, -$06 
                    db       -$02, $01, -$03 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
BossPlayer_4 
                    db       -$47, $01, $4D, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $1B, $01, -$0E, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $05, $01, $03, hi(SMVB50_continue4_single), lo(SMVB50_continue4_single) 
                    db       $19, $01, -$0E 
                    db       $00, $01, -$05 
                    db       -$03, $01, -$03 
                    db       -$13, $01, $11, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$03, $01, $05, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$2C, $01, $3F, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$03, $01, $06, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$19, $01, $00, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $4E, $01, -$6E, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
BossPlayer_5 
                    db       -$42, $01, $33, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $11, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $21, $01, -$0E, hi(SMVB50_continue4_single), lo(SMVB50_continue4_single) 
                    db       $05, $01, -$08 
                    db       $00, $01, -$07 
                    db       -$0A, $01, -$02 
                    db       -$12, $01, -$0C, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$77, $01, -$58, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
PlayerShipAccelAnim 
                    DW       PlayerShipAccel_4 
                    DW       PlayerShipAccel_3 
                    DW       PlayerShipAccel_2 
                    DW       PlayerShipAccel_1 
                    DW       PlayerShipAccel_0            ; list of all single vectorlists in this 
                    DW       0 
PlayerShipAccel_0 
                    db       -$73, $01, $4A, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       -$1A, $01, $0B, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$07, $01, $03, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $ee, $01, $ee , hi(SMVB50_startDraw_xyStays_single), lo(SMVB50_startDraw_xyStays_single) ; y was -$07; x was $03, y now $ee 
                    db       -$15, $01, -$10, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $16, $01, -$08, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $0E, $01, -$05, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $1C, $01, -$0A, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$34, $01, -$02, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $06, $01, -$02, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $08, $01, -$03, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $19, $01, -$08, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
PlayerShipAccel_1 
                    db       -$7B, $01, $4C, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       -$13, $01, $09, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$0A, $01, $05, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$02, $01, $01, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$15, $01, -$0F, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0C, $01, -$05, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $17, $01, -$09, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $14, $01, -$08, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$2C, $01, -$04, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $02, $01, -$01, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $0C, $01, -$04, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $11, $01, -$06, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
PlayerShipAccel_2 
                    db       -$7F, $01, $4E, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       -$0E, $01, $06, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$1F, $01, -$09, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $05, $01, -$02, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $16, $01, -$09, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $14, $01, -$08, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$1B, $01, -$0B, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0E, $01, -$05, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
PlayerShipAccel_3 
                    db       -$6F, $01, $48, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       -$07, $01, $03, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$22, $01, $0F, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$06, $01, $03, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$1A, $01, -$0D, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $15, $01, -$09, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $32, $01, -$13, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $05, $01, -$02, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$3C, $01, $01, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $06, $01, -$02, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $22, $01, -$0D, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $07, $01, -$02, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
PlayerShipAccel_4 
                    db       -$71, $01, $49, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       -$1A, $01, $0B, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $09, $01, -$1B, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $13, $01, -$06, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$1C, $01, -$0C, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0F, $01, -$04, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
 endif  
