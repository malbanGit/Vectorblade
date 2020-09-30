; bank 3 + bank 0
 if  CURRENT_BANK = 3 
                    struct   DodgerObject 
                    ds       Y_POS,1 
                    ds       X_POS,1 
                    ds       BEHAVIOUR,2                  ; PC 
                    ds       NEXT_ENEMY_OBJECT,2          ; positive = end of list 
                    ds       Y_POS16,2                    ; D current position for calculation only , Y is pos, y low is addy 
                    ds       X_POS16,2                    ; D current position for calculation only 
                    ds       DODGER_FALLSPEED,2 
                    ds       DODGER_SIZE,1 
                    ds       DODGER_ORG_LIST,2 
                    end struct 
;
; .....................................................
;
RESTORE_MULIPLYER   macro    
                    ldd      oldTimer 
                    std      multTimer 
                    lda      oldMultiplyer 
                    sta      multiplyer 
                    ldd      oldString 
                    std      scoreExtraBuffer-1 
                    lda      oldString+2 
                    sta      scoreExtraBuffer+1 
                    endm     
;
; .....................................................
;
startDodger1 
startDodger_1 
 if  RECORD_GAME_DATA = 1 
                    inc      pauseSave 
 endif  
                    lds      #MY_STACK                    ; CBFC ; correct the stack to default address 
REPLACE_1_2_ensureScoopiesSafety_varFrom0_6               ;  bank 0 replace 
                    ldx      #0                           ; ensureScoopiesSafety 
                    jsr      jsrBank0X 
                    jsr      setUpMainRound 
                    jsr      initNormalBonus 
; mightbe moved from here on
; ensure deinit warp
; always save these!
oldMultiplyer       =        introWaveEnemyDelayCount     ; 1 
oldTimer            =        introWaveCurrentPattern      ; 2 
                    ldd      multTimer 
                    std      oldTimer 
                    lda      multiplyer 
                    sta      oldMultiplyer 
                    ldd      scoreExtraBuffer-1 
                    std      oldString 
                    lda      scoreExtraBuffer+1 
                    sta      oldString+2 
                    lda      inGameSecrets 
                    anda     #SECRET_ORDERED_RANKS 
                    beq      noTimes5x 
                    ldd      #$7000                       ; does not matter, time is not reduced anyway 
                    std      multTimer 

 lda multiplyer
 anda #IMUNITY_BITS ; keep immunity bits, delete multiplyer
 ora #MULTIPLY_5_OR ; set times 5
 sta      multiplyer 

;                    lda      #5 
;                    sta      multiplyer 
                    ldd      # "x5"
                    std      scoreExtraBuffer-1 
                    lda      #$80 
                    sta      scoreExtraBuffer+1 
                    bra      noTimes2x 

noTimes5x 
; check acchievement!
                    lda      achievements + 3 
                    anda     #ACHIEVEMENT_FLAG_BYTE4_SPY_RANK3 
                    bne      doMulti2 
noPermanentMulti2 
; check secret
                    lda      inGameSecrets 
                    anda     #SECRET_3_RATE_SUCKERS 
                    beq      noTimes2x 
doMulti2 

                    lda      multiplyer 
 anda #MULTIPLY_5_OR ; is current multiplyer 5?
 cmpa #MULTIPLY_5_OR
 beq  doNotReplaceHigherMultiplyer

                    ldd      #$7000 
                    std      multTimer 

 lda  multiplyer 
 anda #IMUNITY_BITS ; keep immunity bits, delete multiplyer
 ora #MULTIPLY_2_OR ; set times 2
 sta      multiplyer 
                    ldd      # "x2"
                    std      scoreExtraBuffer-1 
                    lda      #$80 
                    sta      scoreExtraBuffer+1 
doNotReplaceHigherMultiplyer 
noTimes2x 
                    lda      #0 
                    sta      starCount 
                                                          ; jsr initStars 
                                                          ; l jsr initLevel 
                    clr      tmp1                         ; scale of "LEVEL" 
                    inc      levelCount 
                    lda      levelCount 
                    sta      levelCountSave 
                    lda      bonusCollect 
                    sta      bonusCollectSave 
                    sta      bonusDisplay                 ; ensure letter in air - will be displayed as collected after minestorm! 
                    clr      isDiamondRun 
                    RANDOM_A  
                    cmpa     #5 
                    bhi      noDiamondRun 
                    sta      isDiamondRun 
noDiamondRun 
 if  DIAMOND_STORM = 1 
                    inc      isDiamondRun 
 endif  
                    clr      songLoop 
; UP TO HERE!
REPLACE_1_2_dodgerIntroMusic_varFromIRQ1_71 
                    ldu      #0                           ; ; dodgerIntroMusic 
REPLACE_1_2_PLYINIT_varFromIRQ1_71 
                    ldx      #0                           ; PLYINIT 
                    jsr      jsrBank1_fromBank3_T1 
dodgerIntroLoop 
REPLACE_1_2_PLYPLAYNOLOOP2_varFromIRQ1_71 
                    ldx      #0                           ; PLYPLAYNOLOOP2 playAKSMusicNoLoop 
                    jsr      jsrBank1_fromBank3_T1 
                    tst      songOver 
                    beq      dodgerIntroDone 
; stay till music ends - keep minestrom "small"
                    tst      drunkTimer 
                    beq      notDrunken_mrs2 
                    inc      drunkTimer                   ; reverse the drunkt timer reduction of "displayAMainRound" 
                                                          ; otherwise we NEVER get a drunken minestorm! 
notDrunken_mrs2 
                    jsr      displayAMainRound 
                    jsr      Intensity_3F 
                    lda      tmp1 
                    inc      tmp1 
                    cmpa     #50 
                    blo      noDoubleIncDodger 
                    inc      tmp1 
noDoubleIncDodger 
                    cmpa     #80 
                    blo      noTrippleIncDodger 
                    inc      tmp1 
noTrippleIncDodger 
                    cmpa     #100 
                    blo      dodgerIntroNotDone 
                    dec      tmp1 
                    dec      tmp1 
                    dec      tmp1 
dodgerIntroNotDone 
REPLACE_1_2_drawMinestormString00_varFrom0_6              ;  bank 0 replace 
                    ldx      #0                           ; drawMinestormString00 
                    jsr      jsrBank0X 
                    bra      dodgerIntroLoop              ; and repeat forever 

dodgerIntroDone 
                    jsr      initDodger 
;                    lda      #$7f 
;                    sta      gameScale 
                    jsr      spawnStar                    ; one "star" spawn costs about 1200 cycles per round 
                    jsr      spawnStar                    ; one "star" spawn costs about 1200 cycles per round 
                    ldd      #0 
                    std      Vec_Loop_Count 
MSloop1 
dodgerMain: 
                    clra                                  ; removes "DOT" in the middle 
                    sta      <VIA_shift_reg 
 if  IS_VIA_FAULTY_RESISTENT = 1 
REPLACE_1_2_myWaitRecal_varFrom0_5 
                    ldx      #0                           ; myWaitRecal 
                    jsr      jsrBank0X 
 else  
                    JSR      Wait_Recal                   ; Vectrex BIOS recalibration 
 endif  
REPLACE_1_2_doymsound100_varFromIRQ1_32 
                    ldx      #0                           ; doymsound100 
                    jsr      jsrBank1_fromBank3_T1 
                    tst      dodgerGotKilled 
                    beq      notDeadYetDodger 
                    lda      playerExplosionSpace+EX_START_SIZE 
                    lsla     
                    lsla     
                    nega     
                    adda     #$6f 
                    _INTENSITY_A  
                    jsr      calibrationZero7 
                    lda      #PLAYER_YPOS 
                    ldb      gameScale 
                    stb      VIA_t1_cnt_lo 
                    ldb      playerXpos 
                    MY_MOVE_TO_D_START  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                    ldu      #playerExplosionSpace 
                    ldb      EX_START_SIZE,u              ; * If the scale factor for the explosion 
                    cmpb     EX_MAX_SIZE,u                ; * has not surpassed the max value, then 
                    lbhs     dyingDoneDodger 
                    jsr      doPlayerExplosion 
                    jmp      skipBecauseOfDeath 

notDeadYetDodger 
                    tst      sfx_pointer_3 
                    bne      noBackgroundNoiseDodger 
REPLACE_1_2_backgrounddata_varFromIRQ1_3 
                    ldx      #0                           ;backgrounddata 
                    stx      sfx_pointer_3 
noBackgroundNoiseDodger 
;..................... joyport 
REPLACE_1_2_getButtonState_varFrom0_3                     ;  bank 0 replace 
                    ldx      #0                           ; getButtonState 
                    jsr      jsrBank0X 
; in a state of current button 1-4
; bit == 0 = pressed
; bit == 1 = not pressed
; a = xxxx 0000
;          4321 - buttons
                    bita     #%00000001 
                    bne      noMSHelp 
REPLACE_1_2_showMSHelp_varFromIRQ0_3 
                    ldx      #0                           ;showMSHelp 
                    jmp      jmpBankIRQ0Shift 

noMSHelp 
                    bita     #%00001000 
                    bne      noAccelDodge                 ; button 4 not pressed 
                    tst      sfx_pointer_2 
; bne noAccelNoiseDodger
REPLACE_1_2_noiseOnlyData_varFromIRQ1_3 
                    ldx      #0                           ;noiseOnlyData 
                    stx      sfx_pointer_2 
noAccelNoiseDodger 
                    ldd      dodgerAccel 
                    addd     #10 
MAX_MINSTORM_SPEED_HI  =     7 
                    cmpa     #MAX_MINSTORM_SPEED_HI       ; 
                    blo      accelOk 
                    bra      noAccelDodge 

accelOk 
                    std      dodgerAccel 
                    bra      accelDoneDodge 

noAccelDodge 
                    bita     #%00000100 
                    bne      accelDoneDodge               ; button 3 not pressed 
                    tst      sfx_pointer_2 
; bne noDeAccelNoiseDodger
REPLACE_1_2_noiseOnlyDeAccelData_varFromIRQ1_3 
                    ldx      #0                           ; noiseOnlyDeAccelData 
                    stx      sfx_pointer_2 
noDeAccelNoiseDodger 
                    ldd      dodgerAccel 
                    subd     #10 
                    std      dodgerAccel 
                    subd     #$0100                       ; min speed is one 
                    bpl      accelDoneDodge 
                    ldd      #$0100 
                    std      dodgerAccel 
accelDoneDodge 
                    tst      dodgerFinishedIndicator 
                    bne      noProgress 
                    lda      multiplyer 
 anda #MULTIPLY_5_ALL_AND
 lsra
 lsra
                    sta      tmp1_tmp 
                    ldd      dodgerAccel 
                    MY_LSL_D  
                    MY_LSL_D  
                    tfr      a,b 
                    mul      
                    ldx      #0 
incAgain1_d 
                    leax     d,x 
                    dec      tmp1_tmp 
                    bne      incAgain1_d 
                    tfr      x,d 
                    ldy      #player_score 
                    ldu      #addScoreBackDodger1 
; only 1/8th score?
                    MY_LSR_D  
                    MY_LSR_D  
                    MY_LSR_D  
                    MY_LSR_D  
                    jmp      addScore_d 

addScoreBackDodger1 
                    ldd      dodgerAccel 
                    MY_LSR_D  
                    MY_LSR_D  
                    MY_LSR_D  
                    addd     dodgerProgress 
                    lbcs     dodgerFinished1 
                    std      dodgerProgress 
noProgress 
                                                          ; PLAYER_MOVEMENT_MOVE_BLOCK 
REPLACE_1_2_JoyDigitalHorizontal00_varFrom0_2             ;  bank 0 replace 
                    ldx      #0                           ; JoyDigitalHorizontal00 
                    jsr      jsrBank0X 
                    tst      drunkTimer 
                    beq      notDrunken_dodger 
                    tst      >Vec_Joy_1_X 
                    beq      notDrunken_dodger 
                    neg      >Vec_Joy_1_X 
notDrunken_dodger 
;..................... joyport done
                    JSR      Intensity_5F                 ; Sets the intensity of the 
                                                          ; vector beam to $5f 
 if  DRAW_FIGHTER_IN_BANK0 = 1 
REPLACE_1_2_drawPlayerDodger_varFromIRQ0_5                ;  bank 0 replace 
                    ldx      #0                           ; drawPlayerDodger 
                    jsr      jsrBank0_fromBank3_Shift 
 else  
                    jsr      drawPlayerDodger 
 endif  
skipBecauseOfDeath 
                    jsr      displayScore                 ; messsaging -> todo 
                    JSR      Intensity_5F                 ; Sets the intensity of the 
                    tst      dodgerFinishedIndicator 
                    beq      testNewEnemies 
                    tst      enemyCount 
                    lbeq     dodgerFinished2 
                    bra      noNewEnemies 

testNewEnemies 
                    lda      dodgerProgress 
                    lsra     
                    lsra     
                    lsra     
                    lsra     
                    lsra                                  ; divide by 32 
                    adda     #3 
                    cmpa     enemyCount 
                    blo      noNewSpawn                   ; slowly increas mines falling 
                    jsr      spawnEnemy 
                    beq      noNewSpawn 
; init "asteroid"
                    jsr      initAsteroidU 
noNewEnemies 
noNewSpawn 
; USING U!!!
                    jsr      precalcMines 
; show distance meter
                    ldd      #$907f 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    JSR      myMovetod                    ;Moveto_d 
 else  
                    JSR      Moveto_d 
 endif  
                    lda      dodgerProgress 
                    sta      VIA_t1_cnt_lo 
                    ldd      #$7f00 
 if  IS_VIA_FAULTY_RESISTENT = 1 
;Draw_Line_d 
                    STA      <VIA_port_a                  ;Send Y to A/D 
                    stb      <VIA_port_b                  ;Enable mux 
                    incb     
                    stb      <VIA_port_b                  ;Disable mux 
                    decb     
                    STB      <VIA_port_a                  ;Send X to A/D 
                    LDa      #$FF                         ;Shift reg=$FF (solid line), T1H=0 
                    STA      <VIA_shift_reg               ;Put pattern in shift register 
                    STB      <VIA_t1_cnt_hi               ;Set T1H (scale factor?) 
                    LDa      #$40                         ;B-reg = T1 interrupt bit 
L_F3F4: 
                    BITa     <VIA_int_flags               ;Wait for T1 to time out 
                    BEQ      L_F3F4 
                    NOP                                   ;Wait a moment more 
                    STb      <VIA_shift_reg               ;Clear shift register (blank output) 
                    _ZERO_VECTOR_BEAM  
 else  
                    jsr      Draw_Line_d 
 endif  
                    ldb      gameScale 
                    stB      VIA_t1_cnt_lo 
                    ldu      enemylist_objects_head 
                    pulu     d,pc                         ; (D = y,x) ; do all objects 
dodger_done 
                    clr      in_moveFlag                  ; just "in star" 
                    lds      starlist_objects_head        ; also calcs player movement "in move" 
                    puls     d,pc                         ; (D = y,x) ; do all objects 
stars_doneDodger 
                    lds      #MY_STACK                    ; CBFC ; correct the stack to default address 
                    jmp      dodgerMain                   ; and repeat forever 

;***************************************************************************
initDodger                                                ;#isfunction  
; initialize the empty "dodger" object list 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; enemies
                    clr      dodgerFinishedIndicator 
                    clr      starCount 
                    jsr      initStars 
                    ldd      #stars_doneDodger 
                    std      STARS_DONE_A 
                    lda      #MAX_DODGE_OBJECTS 
                    ldu      #dodgeObject_list 
                    stu      enemylist_empty_head 
                    ldy      #ENEMY_DONE 
next_list_entry_dodger 
                    leax     DodgerObject,u 
                    stx      NEXT_ENEMY_OBJECT,u 
                    leau     ,x 
                    deca     
                    bne      next_list_entry_dodger 
                    leau     -DodgerObject,u 
                    sty      NEXT_ENEMY_OBJECT,u 
                    sty      enemylist_objects_head 
;
                    ldd      #dodger_done 
                    std      ENEMY_DONE_A 
                    lda      #63 
                    sta      dodgerAngle1 
                    sta      dodgerAngle2 
                    sta      dodgerAngle3 
                    sta      dodgerAngle4 
;
                    ldd      #$0100 
                    std      dodgerAccel 
                    clra     
                    std      testShot                     ; that in stars no shots are tested! 
                    std      test2Shot 
                    std      playershotlist_objects_head 
                    std      dodgerProgress 
                    sta      enemyCount 
                    sta      dodgerGotKilled 
                    rts      

MINE1               equ      $ee3d 
MINE2               equ      $ee53 
MINE3               equ      $ee6f 
MINE4               equ      $ee8e 
;ROT_MINE1     ;  'DUMB' MINE
;ROT_MINE2   ;  'MAGNETIC' MINE
;ROT_MINE3   ;  'DUMB FIRE-BALL' MINE
;ROT_MINE4   ;  'MAGNETIC FIRE-BALL' MINE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; angle in dodgerAngle(s)
precalcMines 
                    ldb      #$c8 
                    tfr      b,dp 
                    lda      Vec_Loop_Count+1 
                    anda     #%00000001 
                    beq      doM3 
                    dec      dodgerAngle1 
                    bpl      noDodgerAngleOverflow1 
                    lda      #63 
                    sta      dodgerAngle1 
noDodgerAngleOverflow1 
                    lda      dodgerAngle1 
                    ldx      #MINE1 
                    ldu      #ROT_MINE1 
                    jsr      Rot_VL_Mode 
                    dec      dodgerAngle2 
                    bpl      noDodgerAngleOverflow2 
                    lda      #63 
                    sta      dodgerAngle2 
noDodgerAngleOverflow2 
                    lda      dodgerAngle2 
                    ldx      #MINE2 
                    ldu      #ROT_MINE2 
                    jsr      Rot_VL_Mode 
                    lda      #$d0 
                    tfr      a,dp 
                    rts      

doM3 
                    dec      dodgerAngle3 
                    bpl      noDodgerAngleOverflow3 
                    lda      #63 
                    sta      dodgerAngle3 
noDodgerAngleOverflow3 
                    lda      dodgerAngle3 
                    ldx      #MINE3 
                    ldu      #ROT_MINE3 
                    jsr      Rot_VL_Mode 
doM4 
                    dec      dodgerAngle4 
                    bpl      noDodgerAngleOverflow4 
                    lda      #63 
                    sta      dodgerAngle4 
noDodgerAngleOverflow4 
                    lda      dodgerAngle4 
                    ldx      #MINE4 
                    ldu      #ROT_MINE4 
                    jsr      Rot_VL_Mode 
                    lda      #$d0 
                    tfr      a,dp 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
mineList 
                    DW       ROT_MINE1, ROT_MINE2, ROT_MINE3, ROT_MINE4 
initAsteroidU 
                    ldd      #dodgerBehaviour 
                    std      BEHAVIOUR,u 
; random!
                    RANDOM_A  
                    anda     #%00000110 
                    ldx      #mineList 
                    ldx      a,x 
                    RANDOM_A  
                    anda     #%00011111 
                    sta      DODGER_SIZE,u 
                    tst      isDiamondRun 
                    bne      isDiamondRunDodger 
                    RANDOM_A  
                    cmpa     #5 
                    bhi      noDiamond 
isDiamondRunDodger 
                    ldx      #DodgerDiamond 
                    lda      #$10/2 
                    sta      DODGER_SIZE,u 
noDiamond 
mineInitDone 
                    stx      DODGER_ORG_LIST,u 
                    lda      #$7f 
                    RANDOM_B  
                    std      Y_POS, u 
                    sta      Y_POS16,u 
                    stb      X_POS16,u 
                    sta      Y_POS16+1,u 
                    stb      X_POS16+1,u 
                    RANDOM_A  
                    anda     #%00000001 
notToBigDodgerSpeed 
                    RANDOM_B  
                    orb      #%01010101                   ; min speed 
                    std      DODGER_FALLSPEED, u 
                    rts      

dodgerFinished1 
                    lda      #1 
                    sta      dodgerFinishedIndicator 
                    jmp      noProgress 

resultValues 
                    dw       1                            ; 1* 1000 score 
                    dw       100                          ; 100 cash 
                    dw       2                            ; 2* 1000 score 
                    dw       200                          ; 200 cash 
                    dw       5                            ; 5* 1000 score 
                    dw       500                          ; 500 cash 
                    dw       50                           ; 50* 1000 score 
                    dw       1000                         ; 1000 cash 
                    dw       100                          ; 100* 1000 score 
                    dw       5000                         ; 5000 cash 
dodgerFinished2 
                    ldd      Vec_Loop_Count 
                    clr      dodgeResult 
                    cmpd     #$800 
                    bhi      dogdgeResultDone 
                    inc      dodgeResult 
                    cmpd     #$400 
                    bhi      dogdgeResultDone 
                    inc      dodgeResult 
                    cmpd     #$240 
                    bhi      dogdgeResultDone 
                    inc      dodgeResult 
                    cmpd     #$200 
                    bhi      dogdgeResultDone 
                    inc      dodgeResult 
dogdgeResultDone 
; for testing
; lda #4
; sta dodgeResult
; clr dodgerGotKilled
                    tst      dodgerGotKilled 
                    bne      dyingDoneDodger 
;returnFromMinorHavoc 
                    lda      dodgeResult 
                    lsla     
                    lsla     
                    ldx      #resultValues 
                    leax     a,x 
                    ldd      ,x 
                    std      Vec_Loop_Count 
                    tst      isDiamondRun 
                    beq      doScore 
                    lda      #5 
                    sta      dodgeResult 
                    bra      noScore 

doScore 
                    ldd      2,x                          ; add chash 
                    addd     playerCashW 
                    std      playerCashW 
addAgainDodgerScore 
                    jsr      addScore1000 
                    dec      Vec_Loop_Count+1 
                    bne      addAgainDodgerScore 
dyingDoneDodger 
noScore 
                    RESTORE_MULIPLYER  
                    ldd      #0 
                    std      sfx_pointer_3 
                    std      sfx_pointer_2 
                    std      sfx_pointer_1 
                    CLR      Vec_Music_Flag               ; no music is playing ->0 (is placed in rottist! 
                    JSR      Init_Music_Buf               ; shadow regs 
                    JSR      Do_Sound                     ; ROM function that does the sound playing, here used to clear all regs 
                                                          ; was killed 
                    jsr      setUpMainRound 
                    jsr      initNormalBonus 
                    lda      #100 
                    sta      levelEnemyCount 
                    lda      dodgerFinishedIndicator 
                    beq      dogderDoneLoop 
                    tst      dodgerGotKilled 
                    bne      dogderDoneLoop 
REPLACE_1_2_MineStorm1Data_varFromIRQ1_1                  ;  bank 1 replace 
                    ldx      #0                           ; MineStorm1Data 
                    stx      sfx_pointer_1 
dogderDoneLoop 
                    tst      drunkTimer 
                    beq      notDrunken_mrs2_2 
                    inc      drunkTimer                   ; reverse the drunkt timer reduction of "displayAMainRound" 
                                                          ; otherwise we NEVER get a drunken minestorm! 
notDrunken_mrs2_2 
                    jsr      displayAMainRound 
                    jsr      Intensity_3F 
REPLACE_1_2_displayMinestormResult00_varFrom0_1           ;  bank 0 replace 
                    ldx      #0                           ; displayMinestormResult00 
                    jsr      jsrBank0X 
                    dec      levelEnemyCount 
                    bmi      dodgerResultDone 
                    bra      dogderDoneLoop               ; and repeat "forever" 

                                                          ; display results 
                                                          ; reinit game 
                                                          ; go back to game 
dodgerResultDone 
                    ADJUST_SHOT_RADIUS  
                    lda      levelCountSave 
                    sta      levelCount 
                    lda      bonusCollectSave 
                    sta      bonusCollect 
                    clr      doWarpFailure 
                    ldd      #$f850 
                    std      Vec_Text_HW 
REPLACE_1_2_leaveDodgerAchievementTest_varFrom0_1         ;  bank 0 replace 
                    ldx      #0                           ; leaveDodgerAchievementTest 
                    jmp      jmpBank0X 

dodgerAchievementBack 
                    jmp      reinitLevelStartFromDodger 

 if  DRAW_FIGHTER_IN_BANK0 = 1 
 else  
drawPlayerDodger 
                    jsr      calibrationZero7 
                    lda      #PLAYER_YPOS 
                    ldb      gameScale 
                    stb      VIA_t1_cnt_lo 
                    ldb      playerXpos 
                    MY_MOVE_TO_D_START  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; draws the fighter (anim) and all that goes with it (armor, shield or scoop)
; only one addition at any given time at once
                    lda      #OBJECT_SCALE 
                    sta      VIA_t1_cnt_lo 
;                    ldu      #SM_Fighter_Anim 
                    lda      playerNumberOfBulletsPerShot 
                    deca     
                    lsla     
                    ldu      #SM_Fighter_AnimList 
                    ldu      a,u 
                    dec      playAnimDelayCounter 
                    bpl      animCounterFighterOk_dodge 
                    lda      #ANIMATION_DELAY 
                    sta      playAnimDelayCounter 
                    inc      playerAnim 
                    lda      playerAnim 
                    asla     
                    ldx      a,u 
                    beq      resetAnim_dodge 
                    tfr      x,u 
                    bra      drawFighter_dodge 

resetAnim_dodge 
                    clr      playerAnim 
animCounterFighterOk_dodge 
                    lda      playerAnim 
                    asla     
                    ldu      a,u 
drawFighter_dodge 
                    MY_MOVE_TO_B_END  
                    jsr      SMVB_drawSmart               ; twice the speed ofdraw synced AND calibrated! 
; draw cleanup
                    LDA      #$CC 
                    ldb      gameScale 
                    STA      VIA_cntl                     ;/BLANK low and /ZERO low 
                    stB      VIA_t1_cnt_lo 
                    ldd      #0 
                    std      <VIA_port_b 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                    rts      

 endif  
 else  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 if  DRAW_FIGHTER_IN_BANK0 = 1 
drawPlayerDodger 
                    jsr      calibrationZero7 
                    lda      #PLAYER_YPOS 
                    ldb      gameScale 
                    stb      VIA_t1_cnt_lo 
                    ldb      playerXpos 
                    MY_MOVE_TO_D_START  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; draws the fighter (anim) and all that goes with it (armor, shield or scoop)
; only one addition at any given time at once
                    lda      #OBJECT_SCALE 
                    sta      VIA_t1_cnt_lo 
;                    ldu      #SM_Fighter_Anim 
                    lda      playerNumberOfBulletsPerShot 
                    deca     
                    lsla     
                    ldu      #SM_Fighter_AnimList 
                    ldu      a,u 
                    dec      playAnimDelayCounter 
                    bpl      animCounterFighterOk_dodge 
                    lda      #ANIMATION_DELAY 
                    sta      playAnimDelayCounter 
                    inc      playerAnim 
                    lda      playerAnim 
                    asla     
                    ldx      a,u 
                    beq      resetAnim_dodge 
                    tfr      x,u 
                    bra      drawFighter_dodge 

resetAnim_dodge 
                    clr      playerAnim 
animCounterFighterOk_dodge 
                    lda      playerAnim 
                    asla     
                    ldu      a,u 
drawFighter_dodge 
                    MY_MOVE_TO_B_END  
                    jsr      SMVB_drawSmart               ; twice the speed ofdraw synced AND calibrated! 
; draw cleanup
                    LDA      #$CC 
                    ldb      gameScale 
                    STA      VIA_cntl                     ;/BLANK low and /ZERO low 
                    stB      VIA_t1_cnt_lo 
                    ldd      #0 
                    std      <VIA_port_b 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                    rts      

 endif  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
doTexterStep 
                    lda      textIntensity 
                    jsr      Intensity_a 
                    tst      textFadeDirection 
                    beq      goBrighter 
goDarker 
                    dec      textIntensity 
                    dec      textIntensity 
                    bpl      continueDisplayText 
                    inc      textIntensity 
                    inc      textIntensity 
                    clr      textFadeDirection 
                    ldu      textPointer 
                    leau     2,u 
                    stu      textPointer 
                    ldd      ,u 
                    bne      continueDisplayText 
                    inc      textDisplayDone 
                    bra      continueDisplayText 

goBrighter 
                    inc      textIntensity 
                    inc      textIntensity 
                    bpl      continueDisplayText 
                    dec      textIntensity 
                    dec      textIntensity 
                    dec      textFadeDirection 
                    bra      continueDisplayText 

                    bra      continueDisplayText 

continueDisplayText 
; first thing in test routine is 
; MoveTo which uses T1, which clears T1 interrupt
; upon entry -> make sure SR interrupt is set, so we
; do not do a bankswitch
; ( after move is finished, autmatically T1 IRQ is set again
;   so the text output can be done with SR)
                    IRQ_TO_0_SHIFT  
                    lda      #$7f 
                    sta      VIA_t1_cnt_lo 
                    ldu      [textPointer] 
                    ldd      ,u++ 
                    jsr      syncPrintStrd 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
doBHText 
                    clr      textIntensity 
                    clr      textFadeDirection            ; 0 is fade in 
                    clr      textDisplayDone              ; 0 = not done 
                    ldd      #blackhole_texts 
                    std      textPointer 
                    lda      #$30 
                    sta      Vec_Text_Width 
                    lda      #-$a 
                    sta      Vec_Text_Height 
dodger_loop2 
                    jSR      Wait_Recal_noShift           ; Vectrex BIOS recalibration 
REPLACE_1_2_doymsound100_varFromIRQ1_112 
                    ldx      #0                           ; doymsound100 
                    jsr      jsrBank1_fromBank0_T1 
                    JSR      Read_Btns                    ; get button status 
                    ldb      $C811                        ; button pressed - any 
                    andb     #8                           ; button 2 
                    bne      stagetwo12 
                    jsr      doTexterStep 
                    tst      textDisplayDone 
                    beq      dodger_loop2 
stagetwo12 
                    ldd      #$f850 
                    std      Vec_Text_HW 
REPLACE_1_2_returnFromBHText_varFromIRQ1_2 
                    ldx      #0                           ; returnFromBHText 
                    jmp      jmpBankIRQ1Shift 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
blackhole_texts 
                    dw       dodger_nh1 
                    dw       dodger_nh2 
                    dw       dodger_nh3 
                    dw       dodger_nh4 
                    dw       dodger_nh5 
                    dw       dodger_nh6 
                    dw       0 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
dodger_nh1 
                    db       $30,$a0, "  THE BARG IS DESTROYED IN A ", $80
dodger_nh2 
                    db       $30,$a0, "      GIGANTIC EXPLOSION!", $80
dodger_nh3 
                    db       $30,$a0-10, "  CREATING A BLACK HOLE ... ", $80
dodger_nh4 
                    db       $30,$a0-30, "       YOU ARE SUCKED INTO IT!", $80
dodger_nh5 
                    db       $30,$a0-30, " ... AND EXPERIENCE TIME TRAVEL ...", $80
dodger_nh6 
                    db       $30,$a0-30, "  ... TO A TIME YOU KNOW WELL ...", $80
;
;
                    include  "font_5.asm"
                    include  "printStringSync2.asm"
                    include  "fighter.asm"
 endif  
