


; 1369 bytes left
; following is needed for VIDE:
; to replace "vars" in this bank with values from the other bank
; #genVarlist# varFrom1
;
CURRENT_BANK        EQU      3                            ; 
                    Bank     3 
                    include  "commonGround.i"
;
;***************************************************************************
; CODE SECTION
;***************************************************************************
; here the cartridge program starts off
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
first_init:                                               ;        #isfunction 
 if  RECORD_GAME_DATA = 1 
; for some reason the load is only triggered
; if two different buttons are pressed consecutevly and
; the second is held thru this test
                    clr      pauseSave 
                    clr      saveState 
                    ldd      #$a000+1024+1 
                    std      actionPointer 
                    JSR      Read_Btns                    ; get button status 
                    ldb      $C811                        ; button pressed - any 
                    cmpb     #0                           ; if button 2+3 are both pressed 
                    beq      noLoading 
; nop 2
REPLACE_1_2_loadGameFromFlash_varFromIRQ0_21 
                    ldx      #0                           ;loadGameFromFlash 
                    jmp      jmpBankIRQ0Shift 

noLoading 
 endif  
 if  NMI_HANDLER = 1 
                    lda      #$7e                         ; jmp 
                    sta      $CBFB 
                    ldd      #NMI_HANDLER_FUNCTION 
                    std      $CBFB+1 
 endif  
;
; .........
;
; test the wheel
;REPLACE_1_2_bandit_varFromIRQ1_132
;                    ldx      #0                           ; bandit
;                    jmp      jmpBankIRQ1Shift
;backFromBandit
;
                    lda      #$80 
                    sta      gameScale                    ; default 
                    clr      chosenStartLevel 
                    direct   $d0 
                    clr      Vec_Loop_Count 
                    clr      Vec_Loop_Count +1 
                    lda      #%01111111                   ; bit 7 = 0, each other "1" clears the IEflag, bit 6 = T1 
                    sta      <VIA_int_enable 
REPLACE_1_2_main00_varFrom0_3                             ;  bank 0 replace 
                    ldx      #0                           ; main00 
                    jmp      jmpBank0X 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; here upon "cartridge" start (after some inits in bank 0)
main1 
main_1: 
gameOver 
; remember the currently played max level - so we can start (chose to start) at that level
                    lda      difficulty 
                    anda     #$f 
                    beq      noRoll 
                    lda      #102 
                    sta      maxLevelReached 
                    bra      noNewMax 

noRoll 
                    lda      levelCount 
                    cmpa     maxLevelReached 
                    blo      noNewMax 
                    sta      maxLevelReached 
noNewMax 
                    jsr      clear_all_sound 
REPLACE_1_2_gameOver00_varFrom0_3                         ;  bank 0 replace 
                    ldx      #0                           ; gameOver00 
                    jmp      jmpBank0X 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; here after calibration (for now)
main11 
main_11: 
                    jsr      initGame 
 if  START_WITH_SHOP = 1 
REPLACE_1_2_doShop00_varFromIRQ1_7                        ;  bank 0 replace 
                    ldx      #0                           ; doShop00 
                    jsr      jsrBank1_fromBank3_T1 
                    jmp      afterDying 

 endif  
;
 if  SCOOPY_TEST = 1 
                    jsr      spawnEnemy 
                    ldd      #enemyPlayerControlledRightBehaviour 
                    std      BEHAVIOUR,u 
                    ldy      #enemy1Definition 
                    sty      ENEMY_STRUCT,u               ; hp get overwritten anyway - so we can store 16 bit 
                    stu      scoopEnemy1 
                    jsr      spawnEnemy 
                    ldd      #enemyPlayerControlledLeftBehaviour 
                    std      BEHAVIOUR,u 
                    ldy      #enemy1Definition 
                    sty      ENEMY_STRUCT,u               ; hp get overwritten anyway - so we can store 16 bit 
                    stu      scoopEnemy2 
                    clr      enemyCount 
 endif  
 if  TIMER_LEVEL = 1 
                    lda      difficulty 
                    anda     #%01000000 
                    beq      noTimerLevel2 
                    jsr      spawnEnemy 
                    ldd      #enemyPlayerControlledRightBehaviour 
                    std      BEHAVIOUR,u 
                    ldy      #enemy1Definition 
                    sty      ENEMY_STRUCT,u               ; hp get overwritten anyway - so we can store 16 bit 
                    stu      scoopEnemy1 
                    jsr      spawnEnemy 
                    ldd      #enemyPlayerControlledLeftBehaviour 
                    std      BEHAVIOUR,u 
                    ldy      #enemy1Definition 
                    sty      ENEMY_STRUCT,u               ; hp get overwritten anyway - so we can store 16 bit 
                    stu      scoopEnemy2 
                    clr      enemyCount 
noTimerLevel2 
 endif  
                    jsr      spawnStar                    ; one "star" spawn costs about 1200 cycles per round 
                    jmp      afterDying                   ; needed if first level is a boss level... 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; this is the actual game loop start
main12:                                                   ;#isfunction  
main_12: 
shots_done 
; and init stack there
                    lds      #MY_STACK                    ; CBFC ; correct the stack to default address 
; The T2 timer rest is different (real vectrex 8, emulator 5 *256)
; so the vectrex has time enough to spawn a new set of stars
; within the adjustStar routine -> the emulator does not
; so - here comes the addidtional RANDOM calls
;
; but that also means, that
; within one vectrex round, the cycle difference summarize to
; up to 768 cycles -> which emulation wise is horrible!
;;;;;;;;;;;;;;;;;;
; possibly in Move
;;;;;;;;;;;;;;;;;;
                    tst      animDelayCounter             ; one global animation counter 
                    bpl      noAnimChange_m1 
                    lda      #ANIMATION_DELAY 
                    sta      animDelayCounter 
noAnimChange_m1 
                    dec      animDelayCounter 
                    jsr      adjustStars 
;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;
; when not recal macro
                    ldb      <VIA_t2_hi 
                    stb      t2_rest 
                    clra                                  ; removes "DOT" in the middle 
                    sta      attackPatternInitiated 
                    sta      <VIA_shift_reg 
 if  BIOS_WR = 1 
                    JSR      Wait_Recal                   ; Vectrex BIOS recalibration 
 else  
                    LDA      #$20 
                    ldx      Vec_Loop_Count               ; recal counter, about 21 Minutes befor roll over 
                    leax     1,x 
                    stx      Vec_Loop_Count 
                    ldb      <VIA_t2_hi 
                    stb      t2_rest 
wr_wait 
                    BITA     <VIA_int_flags               ;Wait for timer t2 
                    BEQ      wr_wait 
                    LDD      #$3075                       ;Store refresh value 
                    STD      <VIA_t2_lo                   ;into timer t2 
                    LDD      #$CC 
                    STB      <VIA_cntl                    ;blank low and zero low 
                    STA      <VIA_shift_reg               ;clear shift register 
                    sta      <VIA_port_a                  ;clear D/A register 
                    LDD      #$0302 
                    STA      <VIA_port_b                  ;mux=1, disable mux 
                    STB      <VIA_port_b                  ;mux=1, enable mux 
                    LDB      #$01 
                    STB      <VIA_port_b                  ;disable mux 
 endif  
;                  MY_WAIT_RECAL
; in wait recal cosutom
; some "in move" stuff could be handled
;
;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; check which game stage we are in
; if "starting" do the intro, which "plays" the intro patterns and
; spawns enemies
                    ldx      currentLevelPointer 
                    lda      LEVEL_TYPE,x 
                    anda     #$f 
                    cmpa     #LEVEL_TYPE_FAILURE 
                    lbeq     isIntroNoBug 
                    SPECIAL_BIGGIES  
                    lda      lockPurchased 
                    bita     #GAMEPHASE_INTRO 
;                    cmpa     #GAMEPHASE_INTRO             ; new ships are still spawning, begining of a level...
                    beq      notInIntroPhase 
                    jsr      doIntro 
                    jmp      isIntroNoBug 

; bugs are only starting when intro phase is done
; and several other conditions are met
notInIntroPhase 
                    LEVEL_TIME_OUT  
                    BUG_SPANWING  
isIntroNoBug 
;
                    jsr      displayScore                 ; messsaging -> todo 
                    lda      #DEFAULT_ENEMY_INTENSITY 
                    _INTENSITY_A  
                    jsr      displayStaticBonus 
;
; draw the player ship
                    jsr      calibrationZero7 
                    lda      #PLAYER_YPOS 
                    ldb      gameScale 
                    stb      VIA_t1_cnt_lo 
                    ldb      playerXpos 
                    MY_MOVE_TO_D_START  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;
; THIS BLOCK CAN BE HANDLED IN SOME MOVE
;;;;;;
                    lda      lockPurchased                ; testing if all enemies are dead -> level done 
                    bita     #GAMEPHASE_INTRO             ; only testing, when in game, otherwise the start of a level would be the end (no enemies) 
;                    lda      game_phase                   ; testing if all enemies are dead -> level done
;                    cmpa     #GAMEPHASE_INGAME            ; only testing, when in game, otherwise the start of a level would be the end (no enemies)
                    bne      noEndGameTest 
                    tst      enemyCount                   ; is enemy count 0 
                    lbeq     nextLevel                    ; yes init next level 
noEndGameTest 
                    ldd      bulletSpawnAt 
                    beq      nowBulletSpawn 
                    jsr      spawnShot 
nowBulletSpawn 
                    ldd      #0 
                    std      bulletSpawnAt 
                    sta      isBugShot 
 if  UNDYING 
 else  
                    tst      playerWasHitFor 
                    beq      noPlayerHit 
; KA BOOM
                    jmp      playerDying 

 endif  
noPlayerHit 
 if  DRAW_FIGHTER_IN_BANK0 = 1 
REPLACE_1_2_doFighterPrep_varFromIRQ0_1 
                    ldx      #0                           ; doFighterPrep 
                    jsr      jsrBank0_fromBank3_Shift 
 else  
                    jsr      drawFighterPrep 
 endif  
;
; usage of DS (Stack) forbidden below!!!
; (in main loop)
;
; the object lists and smart draw use both stacks
; the object list uses DS as object list pointer
; and the smart draw uses "U" as User stack pointer
                    jmp      doMainBank0_m                ; returns to bonus_done 

bonus_done 
; laser stuff below costs about 100 cycles!
                    RESET_LASER                           ; must be exactly between player shots spawn and enemy drawn 
;
; does also shot initialization
; must happen before enemy display
; CAN HAPPEN IN MOVE
                    clr      in_moveFlag 
                    lds      starlist_objects_head 
                    puls     d,pc                         ; (D = y,x) ; do all objects 
stars_done 
                    lds      #MY_STACK                    ; CBFC ; correct the stack to default address 
                    jsr      calibrationZero7 
; clr laserTag ; ensure in enemy display this is 0 (for laser shot inhibitaion)
                    inc      lightningOn                  ; ensure first enemy resets intensity 
                    lds      enemylist_objects_head 
                    puls     d,pc                         ; (D = y,x) ; do all objects 
enemies_done 
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #6                           ; laser 
                    bne      noMainLaser 
                    tst      laserEnemyPointer 
                    beq      backy1 
                    inc      laserTag 
                    ldd      #backy1 
                    std      backJump 
                    lds      laserEnemyPointer 
                    jmp      lasershotReEntry 

backy1 
                    tst      laserEnemyPointerLeft 
                    beq      backy2 
                    inc      laserTag 
                    ldd      #backy2 
                    std      backJump 
                    lds      laserEnemyPointerLeft 
                    jmp      lasershotReEntry 

backy2 
                    tst      laserEnemyPointerRight 
                    beq      backy3 
                    inc      laserTag 
                    ldd      #backy3 
                    std      backJump 
                    lds      laserEnemyPointerRight 
                    jmp      lasershotReEntry 

backy3 
noMainLaser 
noLaserInGame 
                    LDD      #$0302 
                    CLR      <VIA_port_a                  ;clear D/A register 
                    STA      <VIA_port_b                  ;mux=1, disable mux 
                    STB      <VIA_port_b                  ;mux=1, enable mux 
                    STB      <VIA_port_b                  ;do it again 
                    LDB      #$01 
                    STB      <VIA_port_b                  ;disable mux 
; anti cranky "A" 18 cycles :-(
;    lda      #-50                           ; a = $18, b = $83 disable RAMP, muxsel=false, channel 1 (integrators offsets)
;    clrb
; stb       <VIA_port_b                    ; Clear D/A output
;    sta      <VIA_port_a                    ; Clear D/A output
; incb
; stb       <VIA_port_b                    ; Clear D/A output
                    lds      shotlist_objects_head 
                    lda      #$7f                         ; shots are always bright! 
                    _INTENSITY_A  
                    puls     d,pc 
 if  REDUCED_OBJECT_SIZE = 1 
enemyShotRefTable 
                    dw       shotobject1 
                    dw       shotobject2 
                    dw       shotobject3 
                    dw       shotobject4 
                    dw       shotobject5 
                    dw       shotobject6 
                    dw       shotobject7 
                    dw       shotobject8 
                    dw       shotobject9 
                    dw       shotobject10 
 endif  
;shots_done
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
addScore10000 
                    ldy      #player_score 
                    lda      multiplyer 
                    lsra     
                    lsra     
incAgain1 
                    inc      player_score_4 
                    deca     
                    bne      incAgain1 
                    ldu      #addScoreBack1 
                    jmp      compare10000 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
addScore25000 
                    ldy      #player_score 
                    lda      multiplyer 
                    lsra     
                    lsra     
incAgain2 
                    inc      player_score_4 
                    inc      player_score_4 
                    ldb      #5 
                    addb     player_score_3 
                    stb      player_score_3 
                    deca     
                    bne      incAgain2 
                    ldu      #addScoreBack12 
                    jmp      checkScore 

addScoreBack12 
                    ldu      #addScoreBack11 
                    jmp      checkScore 

addScoreBack11 
                    ldu      #addScoreBack1 
                    jmp      checkScore 

addScoreBack1 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
addScore1000 
                    ldy      #player_score 
                    lda      multiplyer 
                    lsra     
                    lsra     
incAgain3 
                    inc      player_score_3 
                    deca     
                    bne      incAgain3 
                    ldu      #addScoreBack1 
                    jmp      checkScore 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
addScore100 
                    ldy      #player_score 
                    lda      multiplyer 
                    lsra     
                    lsra     
incAgain2_ 
                    inc      player_score_2 
                    deca     
                    bne      incAgain2_ 
                    ldu      #addScoreBack1 
                    jmp      checkScore 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; display a complete
; "Main" round including falling bonus, score, fighter, fighter movement, ym, stars
displayAMainRound                                         ;#isfunction  
; ....... challenge bonus start
                    tst      animDelayCounter 
                    bpl      noAnimChange_m2 
                    lda      #ANIMATION_DELAY 
                    sta      animDelayCounter 
noAnimChange_m2 
                    dec      animDelayCounter 
                    clra     
                    sta      <VIA_shift_reg 
 if  IS_VIA_FAULTY_RESISTENT = 1 
REPLACE_1_2_myWaitRecal_varFrom0_1 
                    ldx      #0                           ; myWaitRecal 
                    jsr      jsrBank0X 
 else  
                    JSR      Wait_Recal                   ; Vectrex BIOS recalibration 
 endif  
REPLACE_1_2_JoyDigitalHorizontal00_varFrom0_3             ;  bank 0 replace 
                    ldx      #0                           ; JoyDigitalHorizontal00 
                    jsr      jsrBank0X 
                    tst      drunkTimer 
                    beq      notDrunken_mr 
                    dec      drunkTimer 
                    tst      >Vec_Joy_1_X 
                    beq      notDrunken_mr 
                    neg      >Vec_Joy_1_X 
notDrunken_mr 
                    jsr      displayScore                 ; messsaging -> todo 
                    lda      #DEFAULT_ENEMY_INTENSITY 
                    _INTENSITY_A  
                    jsr      displayStaticBonus 
; draw the player ship
                    jsr      calibrationZero7 
                    lda      gameScale 
                    sta      VIA_t1_cnt_lo 
                    lda      #PLAYER_YPOS 
                    ldb      playerXpos 
                    MY_MOVE_TO_D_START  
 if  DRAW_FIGHTER_IN_BANK0 = 1 
REPLACE_1_2_doFighterPrep_varFromIRQ0_2 
                    ldx      #0                           ; doFighterPrep 
                    jsr      jsrBank0_fromBank3_Shift 
 else  
                    jsr      drawFighterPrep 
 endif  
                    jsr      calibrationZero7 
                    lda      gameScale 
                    sta      VIA_t1_cnt_lo 
                    sts      backJump 
                    jmp      doMainBank0                  ; sound and bonus in bank 0 

bonus_doneChallenge 
                    clr      in_moveFlag                  ; just "in star" 
                    lds      starlist_objects_head        ; also calcs player movement "in move" 
                    puls     d,pc                         ; (D = y,x) ; do all objects 
stars_doneChallenge 
                    lds      backJump                     ; load stack, backJump here is a "tmp" 
; cleanup drawing
                    LDA      #$CC 
                    ldb      gameScale 
                    STA      <VIA_cntl                    ;/BLANK low and /ZERO low 
                    stB      <VIA_t1_cnt_lo 
                    ldd      #0 
                    std      <VIA_port_b 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; display a
; "Main" round including fighter, fighter movement, player movement
; no dying check!
; used e.g. when boss is defeated
displaySmallMainRound                                     ;#isfunction  
                    jsr      bossFightPlayerStuff 
REPLACE_1_2_doymsound100_varFromIRQ1_2 
                    ldx      #0                           ; doymsound100 
                    jsr      jsrBank1_fromBank3_T1 
REPLACE_1_2_JoyDigitalHorizontal00_varFrom0_4             ;  bank 0 replace 
                    ldx      #0                           ; JoyDigitalHorizontal00 
                    jmp      jsrBank0X 

                    tst      drunkTimer 
                    beq      notDrunken_mrs 
                    dec      drunkTimer 
                    tst      >Vec_Joy_1_X 
                    beq      notDrunken_mrs 
                    neg      >Vec_Joy_1_X 
notDrunken_mrs 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; sets up above "main" round (which isnt the main game loop)
; it is a everything BUT main game loop :-)
setUpMainRound                                            ;#isfunction  
                    jsr      initStars 
                    jsr      spawnStar                    ; one "star" spawn costs about 1200 cycles per round 
setUpMainRound_woStars                                    ;#isfunction  
; ensure empty shotlist
; and ensure that star routines do not
; go out of whack by testing for shots
                    ldd      #PLAYERSHOTS_DONE 
                    std      testShot 
                    std      test2Shot 
                    sty      playershotlist_objects_head 
                    ldd      #jmpBackBonusChallenge 
                    std      BONUS_DONE_A 
                    ldd      #stars_doneChallenge 
                    std      STARS_DONE_A 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; called from highscore, displays the enemies circliing
hsEnemyList 
                    lds      enemylist_objects_head 
                    puls     d,pc                         ; (D = y,x) ; do all objects 
enemyDonehsList 
REPLACE_1_2_enemiesDoneHS_varFromIRQ1_2 
                    ldx      #0                           ; enemiesDoneHS 
                    jmp      jmpBankIRQ1Shift 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; called from highscore, displays the stars
hsDoStarsList 
                    lds      starlist_objects_head 
                    puls     d,pc                         ; (D = y,x) ; do all objects 
starsDonehsList 
stars_done_hsList 
REPLACE_1_2_starsDoneIn02_varFromIRQ1_2 
                    ldx      #0                           ; starsDoneIn02 
                    jmp      jmpBankIRQ1Shift 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; called from highscoreedit, displays the stars
hsDoStars 
                    lds      starlist_objects_head 
                    puls     d,pc                         ; (D = y,x) ; do all objects 
starsDoneHs 
REPLACE_1_2_starsDoneIn0_varFromIRQ1_2 
                    ldx      #0                           ; 
                    jmp      jmpBankIRQ1Shift 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
nextLevel                                                 ;#isfunction  
 clr playerWasHitFor ; add V1.07 Gregg Woocock bug, player dead and level clear at the same time, leads to endless loop
REPLACE_1_2_levelDoneAchievementTest_varFrom0_1 
                    ldx      #0                           ;levelDoneAchievementTest 
                    jmp      jmpBank0X 

backFromlevelDoneAchievementTest 
                    lda      diamondCount 
                    cmpa     #SUPER_DIAMOND_BORDER 
                    blo      noSuperDiamonds 
                    bsr      setUpMainRound 
REPLACE_1_2_doSuperDiamond_varFromIRQ1_1 
                    ldx      #0                           ;doSuperDiamond 
                    jmp      jmpBankIRQ1Shift 

noSuperDiamonds 
                    clr      doWarpFailure 
nextLevelFailure 
                    ldx      currentLevelPointer 
                    lda      LEVEL_TYPE,x 
                    anda     #$f 
                    cmpa     #LEVEL_TYPE_BONUS 
                    lbne     noBonusLevel_nl 
;..................................................
;show CHALLENGE RESULT
                    bsr      setUpMainRound 
                    lda      lockPurchased 
                    ora      #ENEMY_DESTRUCTED_FLAG 
                    sta      lockPurchased 
                    lda      #100 
                    sta      levelEnemyCount 
                    lda      bonusSpawnCount 
                    cmpa     bonusHitCount 
                    beq      perfectBonusAchieved 
                    clr      perfectBonus 
REPLACE_1_2_ensureScoopiesSafety_varFrom0_1               ;  bank 0 replace 
                    ldx      #0                           ; ensureScoopiesSafety 
                    jsr      jsrBank0X 
                    bra      challengeDoneLoop 

perfectBonusAchieved 
; destroy player shots, since
; we reuse the space for FW
; if shots were handled in
; the stars -> crash can occur!
                    ldd      #0 
                    std      playershotlist_objects_head 
                    std      testShot 
                    std      test2Shot 
                    lda      #250 
                    sta      levelEnemyCount 
                    inc      perfectBonus 
                    lda      perfectBonus 
                    cmpa     #9 
                    ble      mulok 
                    lda      #9 
                    sta      perfectBonus 
mulok 
                    ldb      #1 
mulAgain 
                    deca     
                    beq      donMulAgain 
                    lslb     
                    bne      mulAgain 
donMulAgain 
                    clra     
                    tstb     
                    bne      bok 
                    ldd      #$0100 
bok 
                    tfr      d,x 
addScoreAgain 
                    pshs     x 
                    jsr      addScore1000                 ; perfect bonus! 
                    puls     x 
                    leax     -1,x 
                    bne      addScoreAgain 
REPLACE_1_2_afterChallengeAchievementTest_varFrom0_1 
                    ldx      #0                           ;afterChallengeAchievementTest 
                    jmp      jmpBank0X 

backFromChallengeAchievementTest 
REPLACE_1_2_ensureScoopiesSafety_varFrom0_2               ;  bank 0 replace 
                    ldx      #0                           ; ensureScoopiesSafety 
                    jsr      jsrBank0X 
REPLACE_1_2_backFromFireWorks_varFrom0_1 
                    ldd      #0                           ; backFromFireWorks ; explosions jump back to here after all have been rendered 
                    std      FW_PARTICLES_DONE_A 
; setup objects
                    lda      #FIREWOKRS_PARTICLE_COUNT 
                    ldu      #fwobject_list 
                    stu      fwlist_empty_head 
                    ldy      #FW_PARTICLES_DONE 
fw_next_list_exentry_1 
                    leax     VelocityParticle,u 
                    stx      FW_NEXT_OBJECT,u 
                    leau     ,x 
                    deca     
                    bne      fw_next_list_exentry_1 
                    leau     -VelocityParticle,u 
                    sty      FW_NEXT_OBJECT,u 
                    sty      fwlist_objects_head 
challengeDoneLoop 
                    jsr      displayAMainRound 
                    jsr      Intensity_3F 
REPLACE_1_2_displayChallengeResult00_varFrom0_3           ;  bank 0 replace 
                    ldx      #0                           ; displayChallengeResult00 
                    jsr      jsrBank0X 
                    dec      levelEnemyCount 
                    bne      challengeDoneLoop            ; and repeat "forever" 
; challenge show Bonus done
;..................................................
challengeResultDone 
;  lda lockPurchased
;  anda #$ff-ENEMY_DESTRUCTED_FLAG
;  sta lockPurchased
                    jsr      initNormalEnemies 
REPLACE_1_2_ensureScoopiesLoaded_varFrom0_1               ;  bank 0 replace 
                    ldx      #0                           ; ensureScoopiesLoaded 
                    jsr      jsrBank0X 
noBigBonus 
noBonusLevel_nl 
                    ldu      currentLevelPointer 
                    lda      LEVEL_TYPE,u 
                    bita     #LEVEL_TYPE_SHOP_AFTER 
                    beq      noShopAfter 
                    ldb      isDemoMode 
                    bne      noShopAfter 
SHOP_WAIT_TIMER     =        50 
                    lda      #SHOP_WAIT_TIMER 
                    sta      tmp16_tmp 
                    jsr      setUpMainRound_woStars 
shopWaitLoop 
                    jsr      displayAMainRound 
                    dec      tmp16_tmp 
                    bne      shopWaitLoop 
shopWaitDone 
REPLACE_1_2_doShop00_varFromIRQ1_18                       ;  bank 0 replace 
                    ldx      #0                           ; doShop00 
                    jsr      jsrBank1_fromBank3_T1 
                    ldu      currentLevelPointer 
                    lda      LEVEL_TYPE,u 
noShopAfter 
WARPLEN             =        170 
                    bita     #LEVEL_TYPE_WARP_AFTER 
                    lbeq     noWarpAfter 
                    jsr      initWarp 
                    lda      #WARPLEN                     ; 127 "rounds" for one warp sequence (2 1/2 s about) 
                    sta      tmp1 
 if  RECORD_GAME_DATA = 1 
                    inc      pauseSave 
 endif  
                    jsr      setUpMainRound_woStars 
REPLACE_1_2_warp1data_varFromIRQ1_1 
                    ldd      #0                           ;warp1data 
                    std      sfx_pointer_1 
REPLACE_1_2_warp1data_varFromIRQ1_2 
                    ldd      #0                           ;warp1data 
                    std      sfx_pointer_2 
REPLACE_1_2_warp1data_varFromIRQ1_3 
                    ldd      #0                           ;warp1data 
                    std      sfx_pointer_3 
inWarp 
                    dec      tmp1 
                    beq      warpDone 
                    lda      tmp1 
                    cmpa     #WARPLEN/2 
                    bhi      addWarp 
                    bne      noFailureTest 
                    RANDOM_B  
                    cmpb     #WARP_FAILURE_BORDER 
                    blo      noFailureTest 
                    lda      #1 
                    sta      doWarpFailure 
                    clr      currentLevelPointer          ; otherwise a second warp failure is not shown 
                    bra      afterDying 

noFailureTest 
                    lda      warpLen 
                    cmpa     #2 
                    blt      warplenDone                  ; not longer than 125 
                    dec      warpLen                      ; lem of a "star" i warp mode 
                    dec      warpLen 
                    bra      warplenDone 

addWarp 
                    lda      warpLen 
                    cmpa     #125 
                    bgt      warplenDone                  ; not longer than 125 
                    inc      warpLen 
                    inc      warpLen 
warplenDone 
                    jsr      displayAMainRound            ; usually the stars do the playermovement, the warp stars-> dont 
                    PLAYER_MOVEMENT_MOVE_BLOCK  
                    bra      inWarp                       ; and repeat forever 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
warpDone 
noWarpAfter 
; test
                    ldd      #0 
                    std      currentLevelPointer 
 if  DONT_INCREASE_LEVELS = 1 
 else  
                    inc      levelCount 
 endif  
 if  ENDLESS_DEMO = 1 
                    lda      levelCount 
                    cmpa     #103 
                    bne      dontmatter 
                    clr      levelCount 
                    inc      difficulty                   ; increase additional live when level count loops 
dontmatter 
                    cmpa     #83                          ; tribble trouble 
                    bne      noLevelChange 
                    inc      levelCount 
noLevelChange 
 endif  
                    ldd      levelsPlayed 
                    addd     #1 
                    std      levelsPlayed 
afterDying 
                    jsr      initLevel 
doFailure1 
                    jsr      spawnStar                    ; one "star" spawn costs about 1200 cycles per round 
                    jsr      spawnStar                    ; one "star" spawn costs about 1200 cycles per round 
                    jsr      spawnStar                    ; one "star" spawn costs about 1200 cycles per round 
                    jsr      spawnStar                    ; one "star" spawn costs about 1200 cycles per round 
                    jsr      spawnStar                    ; one "star" spawn costs about 1200 cycles per round 
; display LEVEL Info
;; level intro text
titletextIntensity  =        levelMaxEnemyShots 
titletextFadeDirection  =    levelBulletBorder 
titletextDisplayDone  =      levelBonusBorder 
                    clr      titletextIntensity 
                    clr      titletextFadeDirection       ; 0 is fade in 
                    clr      titletextDisplayDone         ; 0 = not done 
;; level intro text
                    clr      tmp1                         ; scale of "LEVEL" 
                    jsr      setUpMainRound 
                    lda      doWarpFailure 
                    bne      warpDoneLoop 
                    ldx      currentLevelPointer 
                    lda      LEVEL_TYPE,x 
                    cmpa     #LEVEL_TYPE_BOSS1 
                    beq      warpDoneLoop 
                    cmpa     #LEVEL_TYPE_BOSS2 
                    beq      warpDoneLoop 
                    cmpa     #LEVEL_TYPE_BOSS3 
                    beq      warpDoneLoop 
                    cmpa     #LEVEL_TYPE_BOSS4 
                    beq      warpDoneLoop 
 if  TEST_VOX = 1 
REPLACE_1_2_levelSpeech_varFromIRQ0_1 
                    ldx      #0                           ;levelSpeech 
                    jsr      jsrBank0_fromBank3_T1 
 endif  
warpDoneLoop 
                    lda      achievements + 3 
                    anda     #ACHIEVEMENT_FLAG_BYTE4_SPY_RANK1 
;<- v1.12                    beq      noShopTest 
                    beq      noShopTest 
; test Joystick Button

; fjfjfj
                                                          ; 
REPLACE_1_2_getButtonState_varFrom0_32                    ;  bank 0 replace 
                    ldx      #0                           ; getButtonState 
                    jsr      jsrBank0X 
; in a button state
                    anda     #%00001100                   ; if button 3+4 both pressed 
                    bne      noShopTest 
; enter shop
REPLACE_1_2_doShop00_varFromIRQ1_118                      ;  bank 0 replace 
                    ldx      #0                           ; doShop00 
                    jsr      jsrBank1_fromBank3_T1 
                    bra      afterDying 

noShopTest 
                    jsr      displayAMainRound 
                    jsr      Intensity_3F 
                    lda      tmp1 
                    inc      tmp1 
                    cmpa     #50 
                    blo      noDoubleInc 
                    inc      tmp1 
noDoubleInc 
                    cmpa     #100 
                    blo      noTrippleInc 
                    inc      tmp1 
noTrippleInc 
                    cmpa     #110 
                    bhi      noLevelDisplay1              ; nextLevelDone 
noLevelDisplay1 
                    cmpa     #200 
                    bhi      nextLevelDone 
                    ldx      currentLevelPointer 
                    lda      LEVEL_TYPE,x 
                    cmpa     #LEVEL_TYPE_BOSS1 
                    beq      noTitleInBoss 
                    cmpa     #LEVEL_TYPE_BOSS2 
                    beq      noTitleInBoss 
                    cmpa     #LEVEL_TYPE_BOSS3 
                    beq      noTitleInBoss 
                    cmpa     #LEVEL_TYPE_BOSS4 
                    beq      noTitleInBoss 
REPLACE_1_2_showLevelTitleStep_varFromIRQ0_1 
                    ldx      #0                           ; showLevelTitleStep 
                    jsr      jsrBank0_fromBank3_Shift 
noTitleInBoss 
                    lda      tmp1 
                    cmpa     #110 
                    bhi      warpDoneLoop 
                    tst      doWarpFailure 
                    beq      notDisplayWarpFailure 
REPLACE_1_2_drawWarpFailure_varFrom0_1                    ;  bank 0 replace 
                    ldx      #0                           ; drawWarpFailure 
                    jsr      jsrBank0X 
                    bra      warpDoneLoop 

notDisplayWarpFailure 
                    ldx      currentLevelPointer 
                    lda      LEVEL_TYPE,x 
                    anda     #$f 
                    cmpa     #LEVEL_TYPE_BOSS1 
 if  ENDLESS_DEMO = 1 
                    blo      ccc 
                    jmp      warpDone 

ccc 
 else  
                    bhs      doNotprintLevel 
 endif  
REPLACE_1_2_drawLevelString00_varFrom0_3                  ;  bank 0 replace 
                    ldx      #0                           ; drawLevelString00 
                    jsr      jsrBank0X 
                    ldx      currentLevelPointer 
                    lda      LEVEL_TYPE,x 
                    anda     #$f 
doNotprintLevel 
                    cmpa     #LEVEL_TYPE_BONUS 
                    bne      noBonusLevel 
REPLACE_1_2_drawBonusString00_varFrom0_3                  ;  bank 0 replace 
                    ldx      #0                           ; drawBonusString00 
                    jsr      jsrBank0X 
                    jmp      warpDoneLoop                 ;noKamikazeLevel 

noBonusLevel 
                    cmpa     #LEVEL_TYPE_KAMIKAZE 
                    bne      noKamikazeLevel 
REPLACE_1_2_drawKamikazeString00_varFrom0_3               ;  bank 0 replace 
                    ldx      #0                           ; drawKamikazeString00 
                    jsr      jsrBank0X 
                    jmp      warpDoneLoop                 ; 

noKamikazeLevel 
                    cmpa     #LEVEL_TYPE_BOSS1 
                    lblo     warpDoneLoop 
REPLACE_1_2_drawBossString00_varFrom0_3                   ;  bank 0 replace 
                    ldx      #0                           ; drawBossString00 
                    jsr      jsrBank0X 
noBossLevel1 
                    jmp      warpDoneLoop                 ; and repeat forever 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
nextLevelDone 
; reset levelstructure
; to max 5 stars
                    lda      doWarpFailure 
                    beq      noWarpFailureHere 
                    inc      doWarpFailure 
noWarpFailureHere 
                    jsr      initNormalJMPPointer 
                    jsr      initLevel 
                    ldx      currentLevelPointer 
                    lda      LEVEL_TYPE,x 
                    anda     #$f 
                    cmpa     #LEVEL_TYPE_BOSS1 
                    lbeq     initBoss1 
                    cmpa     #LEVEL_TYPE_BOSS2 
                    lbeq     initBoss2 
                    cmpa     #LEVEL_TYPE_BOSS3 
                    lbeq     initBoss3 
                    cmpa     #LEVEL_TYPE_BOSS4 
                    lbeq     initBoss4 
                    jsr      spawnStar                    ; one "star" spawn costs about 1200 cycles per round 
; ensure EXTRA is correct displayed on level start
                    lda      bonusCollect 
                    sta      bonusCollectSave 
                    sta      bonusDisplay                 ; ensure letter in air - will be displayed as collected after minestorm! 
 if  RECORD_GAME_DATA = 1 
                    tst      saveState 
                    bne      backFromContinuesSave        ; we are "playing back" -> so no saving 
REPLACE_1_2_saveGameToFlash_varFromIRQ0_1 
                    ldx      #0                           ;saveGameToFlash 
                    jmp      jmpBankIRQ0Shift 

backFromContinuesSave 
 endif  
                    jmp      main_12                      ; this is the actual game loop start 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DISPLAY_STATIC_BONUS  macro  _y,_x,list 
                    ldd      #lo(_y)*256 + lo(_x) 
                    MY_MOVE_TO_D_START  
                    ldu      #list 
                    lda      #OBJECT_SCALE 
                    sta      VIA_t1_cnt_lo 
                    MY_MOVE_TO_B_END  
                    jsr      SMVB_drawSmart               ; twice the speed ofdraw synced AND calibrated! 
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
displayStaticBonus                                        ;#isfunction  
; see also: BonusHomeCoordinates
                    lda      gameScale 
                    sta      VIA_t1_cnt_lo 
                    lda      bonusCollect 
                    anda     bonusDisplay 
                    bita     #1 
                    beq      tryBonusX 
;                    DISPLAY_STATIC_BONUS  $7d, $90, BonusEList
                    DISPLAY_STATIC_BONUS  $70, $90, BonusEList 
                    lda      bonusCollect 
                    anda     bonusDisplay 
tryBonusX 
                    bita     #2 
                    beq      tryBonusT 
;                    DISPLAY_STATIC_BONUS  $7d, ($90+20), BonusXList
                    DISPLAY_STATIC_BONUS  $60, $90, BonusXList 
                    lda      bonusCollect 
                    anda     bonusDisplay 
tryBonusT 
                    bita     #4 
                    beq      tryBonusR 
;                    DISPLAY_STATIC_BONUS  $7d, ($90+20+20), BonusTList
                    DISPLAY_STATIC_BONUS  $50, $90, BonusTList 
                    lda      bonusCollect 
                    anda     bonusDisplay 
tryBonusR 
                    bita     #8 
                    beq      tryBonusA 
;                    DISPLAY_STATIC_BONUS  $7d, ($90+20+20+20), BonusRList
                    DISPLAY_STATIC_BONUS  $40, $90, BonusRList 
                    lda      bonusCollect 
                    anda     bonusDisplay 
tryBonusA 
                    bita     #16 
                    beq      bonusDisplayDone 
;                    DISPLAY_STATIC_BONUS  $7d, ($90+20+20+20+20), BonusAList
                    DISPLAY_STATIC_BONUS  $30, $90, BonusAList 
bonusDisplayDone 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
initWarp                                                  ;#isfunction  
; ensure no scoop in warp
                    lda      lockPurchased 
                    ora      #ENEMY_DESTRUCTED_FLAG 
                    sta      lockPurchased 
                    lda      lockPurchased 
                    bita     #$10 
                    bne      scoopiesAreSave 
                    ldd      #0 
                    std      scoopEnemy1 
                    std      scoopEnemy2 
                    lda      lockPurchased 
                    anda     #%11011111 
                    sta      lockPurchased                ; switch off scoopy shielded 
                    bra      doNotKeepScoopies 

;
scoopiesAreSave 
REPLACE_1_2_ensureScoopiesSafety_varFrom0_3               ;  bank 0 replace 
                    ldx      #0                           ; ensureScoopiesSafety 
                    jsr      jsrBank0X 
doNotKeepScoopies 
;;;;;;;;;;;;;; expand starlist to be as high as 20 (times 4 = 80 stars)
; stars
                    lda      #MAX_STAR_OBJECTS_WARP 
                    ldu      #starobject_list 
                    stu      starlist_empty_head 
                    ldy      #STARS_DONE 
next_PS_list_entry_ig3_s 
                    leax     StarStruct,u 
                    stx      NEXT_STAR_OBJECT,u 
                    leau     ,x 
                    deca     
                    bne      next_PS_list_entry_ig3_s 
                    leau     -StarStruct,u 
                    sty      NEXT_STAR_OBJECT,u 
                    sty      starlist_objects_head 
                    clr      starCount 
spawmNextStar 
                    jsr      spawnStar 
                    ldd      #starWarpBehaviour 
                    std      BEHAVIOUR,x 
                    lda      starCount 
                    cmpa     #(MAX_STAR_OBJECTS_WARP -1)  ;minus one because start at 0 
                    bne      spawmNextStar 
                    lda      #1 
                    sta      warpLen                      ; size of stars 
                    lda      #3 
                    sta      warpSpeed                    ; speed of stars 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;
;
; all initialization that must be done for a
; single level
; expects currentLevelPointer to be set to the level
initLevel                                                 ;#isfunction  
                    ldd      #0 
                    sta      realEnemyCount 
                    std      suckerAddress 
 if  ENABLE_STAR_TACSCAN = 1 
                    sta      tacScan 
 endif  
                    lda      diverseFlags 
                    anda     #$ff-BIT_BIG_ENEMY_IN_PLAY 
                    sta      diverseFlags 
                    lda      lockPurchased                ; in warp = 1 
                    anda     #$ff-ENEMY_DESTRUCTED_FLAG 
                    sta      lockPurchased 
; if is failure level -> reinit failure
                    ldx      currentLevelPointer 
                    cmpx     #failureLevels 
                    blo      noFailure 
                    cmpx     #levels 
                    bhi      noFailure 
; last level was a failure :-)
                    lda      #3 
                    sta      doWarpFailure 
                    bra      levelGot1 

noFailure 
                    ldb      levelCount 
                    lslb     
                    clra     
                    ldx      #levels 
                    ldx      d,x 
                    bne      levelGot                     ; zero terminated list... 
                    clr      levelCount                   ; redo from start if 0 encountered 
; if at least ONCE level 100 reached, lock is "freed"
                    lda      shopAllowFlags 
                    ora      #SHOP_LOCK 
                    ora      #SHOP_LASER_WEAPON 
                    sta      shopAllowFlags 
noDownGradeMax 
                    inc      difficulty                   ; increase additional live when level count loops 
REPLACE_1_2_levelRollOverAchievementTest_varFromIRQ1_1 
                    ldx      #0                           ;levelRollOverAchievementTest 
                    jmp      jmpBankIRQ1Shift 

backFromlevelRollOverAchievementTest 
                    lda      difficulty 
                    anda     #%11 
                    ora      downgradeImmunity            ; insure immunity 2 is kept! (wheel spin) 
                    sta      downgradeImmunity 
                    lda      difficulty 
                    anda     #$f 
                    cmpa     #%11 
                    bls      notMaxDif 
                    lda      #%11 
                    ora      downgradeImmunity            ; insure immunity 2 is kept! (wheel spin) 
                    sta      downgradeImmunity 
notMaxDif 
                    lda      difficulty 
                    anda     #$f 
                    cmpa     #SUPER_IMPOSSIBLE 
                    bls      initLevel 
                    dec      difficulty 
                    bra      initLevel 

levelGot 
                    stx      currentLevelPointer 
levelGot1 
                    ldd      #stars_done 
                    std      STARS_DONE_A 
                    ldd      #50*15                       ;bonusTimerLength 
                    std      levelTimer 
                    lda      #100 
                    sta      levelMaxEnemy 
; when "normal" level, than here the maxmum enemies that can spawn
                    lda      LEVEL_TYPE,x 
                    bita     #LEVEL_APPEAR_AT_WAITING 
                    bne      directLevel 
                    anda     #$00001111 
                    bita     #LEVEL_TYPE_NORMAL 
                    bne      isNormalLevel 
                    bita     #LEVEL_TYPE_BIGGY 
                    beq      noNormalLevel 
isNormalLevel 
; go thru level struct and count enemies
                    ldx      LEVEL_INTRO_PATTERN, x 
                    beq      noNormalLevel 
                    clr      levelMaxEnemy 
nextEnemyCountInfo 
                    ldd      ,x++ 
                    beq      noNormalLevel 
                    ldd      ,x++ 
                    beq      noNormalLevel 
                    addb     levelMaxEnemy 
                    stb      levelMaxEnemy 
                    bra      nextEnemyCountInfo 

directLevel 
                    lda      LEVEL_ENEMY_COUNT,x 
                    sta      levelMaxEnemy 
noNormalLevel 
;                    lda      #GAMEPHASE_INTRO
;                    sta      game_phase
                    lda      lockPurchased                ; testing if all enemies are dead -> level done 
                    ora      #GAMEPHASE_INTRO             ; only testing, when in game, otherwise the start of a level would be the end (no enemies) 
                    sta      lockPurchased                ; testing if all enemies are dead -> level done 
                    ldx      currentLevelPointer 
                    clr      bugsSpawnedInLevel           ; 
                    lda      LEVEL_TYPE,x 
                    anda     #$f 
                    cmpa     #LEVEL_TYPE_BIGGY 
                    bne      isNoBugLevel 
                    lda      LEVEL_BUG_COUNT,x 
                    sta      bugsSpawnedInLevel           ; if != 0 than bug spawn 
                    lda      #16                          ; at most 16 enemies on screen - than the first bug can appear (more would slow down the game) 
                    sta      nextBugEnemyCount 
isNoBugLevel 
                    ldb      difficulty 
                    andb     #$f                          ; 
                    beq      easy3 
                    decb     
                    beq      normal3 
                    decb     
                    beq      hard3 
                    decb     
                    beq      impossible3 
superImpossible 
                    lda      #5                           ; very VERY little bonus 
                    bra      contimp3 

impossible3 
                    lda      LEVEL_BONUS_BORDER, x 
                    ldb      LEVEL_TYPE,x 
                    andb     #%00001111 
                    cmpb     #LEVEL_TYPE_BONUS 
                    beq      dontChangeBonusLevels1 
                    lsra     
                    adda     LEVEL_BONUS_BORDER, x 
contimp3 
dontChangeBonusLevels1 
                    sta      levelBonusBorder 
                    lda      #10 
                    sta      levelMaxAttackPatterns 
                    clra     
                    ldb      LEVEL_TYPE,x 
                    andb     #$f 
                    cmpb     #LEVEL_TYPE_BONUS 
                    beq      challengeNoShotIncrease1 
                    lda      #10 
challengeNoShotIncrease1 
                    sta      levelMaxEnemyShots 
                    sta      levelBulletBorder 
                    bra      difCont3 

normal3 
                    lda      LEVEL_MAX_ITEMS, x 
                    anda     #$f 
                    sta      levelMaxAttackPatterns 
                    lda      LEVEL_MAX_ITEMS, x 
                    lsra     
                    lsra     
                    lsra     
                    lsra     
                    sta      levelMaxEnemyShots 
                    lda      LEVEL_BULLET_BORDER, x 
                    sta      levelBulletBorder 
                    lda      LEVEL_BONUS_BORDER, x 
                    adda     #25 
                    sta      levelBonusBorder 
                    bra      difCont3 

easy3 
                    tst      bugsSpawnedInLevel 
                    beq      noBugsInThisLevel 
                    dec      bugsSpawnedInLevel           ; 1 bug less 
noBugsInThisLevel 
                    lda      LEVEL_MAX_ITEMS,x 
                    anda     #$f 
                    lsra   
 bne itemsOK
; V1.07
 inca ; at least 1!
itemsOK  
                    sta      levelMaxAttackPatterns 
                    lda      LEVEL_MAX_ITEMS,x 
                    lsra     
                    lsra     
                    lsra     
                    lsra     
                    lsra     
                    sta      levelMaxEnemyShots 
                    lda      LEVEL_BULLET_BORDER, x 
                    lsra     
                    sta      levelBulletBorder 
                    lda      LEVEL_BONUS_BORDER, x 
                    adda     #50 
                    sta      levelBonusBorder 
                    bra      difCont3 

hard3 
                    lda      LEVEL_MAX_ITEMS,x 
                    anda     #$f 
                    adda     #1 
                    sta      levelMaxAttackPatterns 
                    clra     
                    ldb      LEVEL_TYPE,x 
                    andb     #$f 
                    cmpb     #LEVEL_TYPE_BONUS 
                    beq      challengeNoShotIncrease2 
                    lda      LEVEL_MAX_ITEMS, x 
                    lsra     
                    lsra     
                    lsra     
                    lsra     
                    adda     #1 
challengeNoShotIncrease2 
                    sta      levelMaxEnemyShots 
                    lda      LEVEL_BULLET_BORDER, x 
                    adda     #1 
                    sta      levelBulletBorder 
                    lda      LEVEL_BONUS_BORDER, x 
                    ldb      LEVEL_TYPE,x 
                    andb     #%00001111 
                    cmpb     #LEVEL_TYPE_BONUS 
                    beq      dontChangeBonusLevels2 
                    lsra     
dontChangeBonusLevels2 
                    sta      levelBonusBorder 
difCont3 
                    tst      doWarpFailure 
                    beq      keepEnemyShots 
                    ldb      difficulty 
                    andb     #$f                          ; 
                    bne      noteasy3 
                    lda      #5 
                    bra      easyWarpDone 

noteasy3 
                    decb     
                    bne      notNormal3 
                    lda      #7 
                    bra      easyWarpDone 

notNormal3 
                    lda      #10 
easyWarpDone 
                    sta      levelMaxEnemyShots 
keepEnemyShots 
; .......................................................
                    ldx      LEVEL_INTRO_PATTERN,x 
                    ldd      LINE_PATTERN_INVERS,x 
                    std      inversePatttern              ; also stores patternEnemyCount 
                    ldx      LINE_PATTERN_DEF,x           ; start with pattern 0 of intro pattern for this level 
                    stx      introWaveCurrentPattern 
                    lda      P_DELAY_BETWEEN_ENEMIES,x 
                    sta      introWaveEnemyDelayCount 
initLevelContinue 
REPLACE_1_2_initLevelInt0_varFromIRQ0_1 
                    ldx      #0                           ; initLevelInt0 
                    jsr      jsrBank0_fromBank3_T1 
                    jsr      clear_all_sound 
REPLACE_1_2_adjustShotDamage_varFrom0_4                   ;  bank 0 replace 
                    ldx      #0                           ; adjustShotDamage 
                    jsr      jsrBank0X 
;                    ADJUST_SHOT_DAMAGE
; initialize the empty object list
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; enemies
                    jsr      initNormalEnemies 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                    jsr      initStars 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SHOTS
                    jsr      initNormalEnemyShots 
REPLACE_1_2_ensureScoopiesSafety_varFrom0_4               ;  bank 0 replace 
                    ldx      #0                           ; ensureScoopiesSafety 
                    jsr      jsrBank0X 
REPLACE_1_2_ensureScoopiesLoaded_varFrom0_2               ;  bank 0 replace 
                    ldx      #0                           ; ensureScoopiesLoaded 
                    jsr      jsrBank0X 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                    jsr      initPlayerShotList 
                    lda      doWarpFailure 
                    cmpa     #1 
                    lbeq     doFailure1 
                    cmpa     #2 
                    beq      doFailure2 
                    cmpa     #3 
                    beq      doFailure3 
doFailuressss 
                    clr      saucerCount 
                    rts      

;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
doFailure2                                                ;#isfunction  
                                                          ; random failure level load 
; init "failure" bugs
; go main
; now the actual failure level
;
; change of plans - there are NO different failure levels
;                    ldy      #failureLevels
;                    RANDOM_A
;                    lda      #0
;                    lsla
;                    ldy      a,y
                    ldy      #failureLevel1 
                    sty      currentLevelPointer 
doFailure3 
                    ldy      currentLevelPointer 
                    lda      LEVEL_BUG_COUNT,y 
                    lda      levelCount 
                    lsra     
                    lsra     
                    lsra     
                    inca     
                    cmpa     #12 
                    blo      bugFailureOk 
                    lda      #12 
bugFailureOk 
                    ldb      doWarpFailure 
                    cmpb     #3 
                    bne      notSecondFailure 
                    ldb      difficulty 
                    andb     #$f                          ; 
                    bne      not_easy3 
                    lda      joystickDir                  ; reload left over enemies 
notSecondFailure 
not_easy3 
                    sta      nextBugEnemyCount 
                    lds      #MY_STACK                    ; CBFC ; correct the stack to default address 
spawnNextFailureBug 
                    jsr      spawnEnemy 
                    beq      noBugSpawnFailure 
                    ldy      currentLevelPointer 
                    ldx      LEVEL_BUG_DEFINITION,y 
                    stx      ENEMY_STRUCT,u               ; 
                    lda      BUG_ENEMY_HP ,x 
                    ldb      difficulty 
                    bne      noBugHpChange_Failure 
;easy4
                    lsra     
noBugHpChange_Failure 
                    sta      BUG_ENEMY_HITPOINTS,u        ; all 8 bits 
                    ldd      #0 
                    sta      ALL_PURPOSE,u 
                    std      MY_PATTERN,u 
                    sta      ANIM_POSITION,u 
                    sta      BUG_SHOT_DELAY,u 
                    sta      BUG_APPEARING_INTENSITY, u 
                    RANDOM_B  
                    RANDOM_A  
                    anda     #%01111111                   ; only spawn in upper half of screen 
                    std      Y_POS,u 
                    sta      Y_POS16, u 
                    stb      X_POS16, u 
                    clr      Y_POS16+1, u 
                    clr      X_POS16+1, u 
                    ldd      #failureBehaviour            ; perhaps first Bug entry behaviour ("beam in") 
                    std      BEHAVIOUR,u 
                    dec      nextBugEnemyCount 
                    bne      spawnNextFailureBug 
;;; bug init done
noBugSpawnFailure 
;                    lda      #GAMEPHASE_INGAME            ; only testing, when in game, otherwise the start of a level would be the end (no enemies)
;                    sta      game_phase                   ; testing if all enemies are dead -> level done
                    lda      lockPurchased                ; testing if all enemies are dead -> level done 
                    anda     #$ff - GAMEPHASE_INTRO       ; only testing, when in game, otherwise the start of a level would be the end (no enemies) 
                    sta      lockPurchased                ; testing if all enemies are dead -> level done 
                    jmp      main12 

;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; all inits needed for a completely new game
initGame                                                  ;#isfunction  
REPLACE_1_2_initGame0_varFromIRQ0_1 
                    ldx      #0                           ; initGame0 
                    jsr      jsrBank0_fromBank3_T1 
                    jsr      initNormalBonus 
                    RESET_LASER  
 if  TIMER_LEVEL = 1 
                    lda      difficulty 
                    anda     #%01000000 
                    beq      noTimerLevel1 
                    lda      #4 
                    sta      playerNumberOfBulletsPerShot 
                    ldd      #950 
                    std      playerSpeed 
                    std      playerShotSpeed 
                    ldb      #10 
                    stb      playerMaxShotInAir 
                    ldb      diverseFlags 
                    orb      #BIT_FLAG_AUTOFIRE 
                    stb      diverseFlags 
                    lda      #%00011111                   ; scoopy lock, no lose of power 
                    sta      lockPurchased                ; lock + warp lock 
                    bra      noAchievmentBonus 

noTimerLevel1 
 endif  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; return addresses for (pul draws)
; in game!
REPLACE_1_2_initAchievementValues_varFromIRQ0_1 
                    ldx      #0                           ; initAchievementValues 
                    jsr      jsrBank0_fromBank3_T1 
 if  TIMER_LEVEL = 1 
noAchievmentBonus 
 endif  
 if  TESTING = 1 
                    lda      #START_SHOT_WIDTH            ; 6 max 
                    sta      playerNumberOfBulletsPerShot 
 endif  
                    ldb      isDemoMode 
                    beq      noDemo 
; init scoopies
                    jsr      spawnEnemy 
                    ldd      #enemyPlayerControlledRightBehaviour 
                    std      BEHAVIOUR,u 
                    ldy      #enemy1Definition 
                    sty      ENEMY_STRUCT,u               ; hp get overwritten anyway - so we can store 16 bit 
                    stu      scoopEnemy1 
                    jsr      spawnEnemy 
                    ldd      #enemyPlayerControlledLeftBehaviour 
                    std      BEHAVIOUR,u 
                    ldy      #enemy1Definition 
                    sty      ENEMY_STRUCT,u               ; hp get overwritten anyway - so we can store 16 bit 
                    stu      scoopEnemy2 
                    clr      enemyCount 
REPLACE_1_2_ensureScoopiesSafety_varFrom0_5               ;  bank 0 replace 
                    ldx      #0                           ; ensureScoopiesSafety 
                    jsr      jsrBank0X 
REPLACE_1_2_initDemo_varFromIRQ0_1 
                    ldx      #0                           ; initDemo 
                    jsr      jsrBank0_fromBank3_T1 
noDemo 
 if  PLAYER_SHIELD_START = 0 
 else  
                    ldb      #PLAYER_SHIELD_START 
                    stb      playerBonusActive 
 endif  
reinitJumpBacks 
                    jsr      initNormalJMPPointer 
                    jmp      initLevel 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
beQuiet 
QUIET 
clear_all_sound                                           ;#isfunction  
                    ldd      #0 
                    std      sfx_pointer_3 
                    std      sfx_pointer_2 
                    std      sfx_pointer_1 
                    CLR      Vec_Music_Flag               ; no music is playing ->0 (is placed in rottist! 
                    JSR      Init_Music_Buf               ; shadow regs 
                    JMP      Do_Sound                     ; ROM function that does the sound playing, here used to clear all regs 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
playerDying                                               ;#isfunction  
; init player explosion
; clear drunken
                    clr      drunkTimer 
                    lda      lockPurchased 
                    anda     #%11011111 
                    sta      lockPurchased                ; switch off scoopy shielded 
                    INIT_PLAYER_EXPLOSION  
                    ldd      #jmpBack3BonusDying          ; bank0 jump back to bank 1 
                    std      BONUS_DONE_A 
                    ldd      #enemies_done_dying 
                    std      ENEMY_DONE_A 
                    ldd      #shots_done_dying 
                    std      SHOTS_DONE_A 
                    ldd      #stars_done_dying 
                    std      STARS_DONE_A 
;
                    lda      multiplyer 

                    anda     #MULTIPLY_0_AND 
                    ora      #MULTIPLY_1_OR 
                    sta      multiplyer 
                    lda      #$80 
                    std      player_score_80 
                    clr      saucerCount                  ; ensure no warp failure 
                    clr      playerAnim 
                    clr      playerBonusActive 
                    lda      #ANIMATION_DELAY 
                    sta      playAnimDelayCounter 
                    clr      current_button_state 
                    clr      Vec_Joy_1_X 
REPLACE_1_2_lastExplosionData_varFromIRQ1_1 
                    ldx      #0                           ;lastExplosionData 
                    stx      sfx_pointer_1 
                    stx      sfx_pointer_2 
                    stx      sfx_pointer_3 
                    clr      in_moveFlag                  ; doesnt make sense here - player dying is not moving at all 
                    clr      playerBonusActive            ; doesn't make sense here - while player is dying - no need for new attack patterns 
                    ldd      #0 
                    std      scoopEnemy1 
                    std      scoopEnemy2 
 if  DO_DYING_BONUS = 1 
                    lda      diverseFlags 
                    anda     #BIT_FLAG_IS_BOSSFIGHT_ANY 
                    bne      isBossFightNoDeatchBonus 
REPLACE_1_2_initDeathBonus_varFromIRQ0_1 
                    ldx      #0                           ; initDeathBonus 
                    jmp      jmpBankIRQ0Shift 

isBossFightNoDeatchBonus 
returnDeathBonus 
 endif  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; not using "main" function, because fighter is not drawn
main_dying:                                               ;#isfunction  
                    tst      animDelayCounter 
                    bpl      noAnimChange_m3 
                    lda      #ANIMATION_DELAY 
                    sta      animDelayCounter 
noAnimChange_m3 
                    dec      animDelayCounter 
; when not recal macro
 if  IS_VIA_FAULTY_RESISTENT = 1 
REPLACE_1_2_myWaitRecal_varFrom0_2 
                    ldx      #0                           ; myWaitRecal 
                    jsr      jsrBank0X 
 else  
                    JSR      Wait_Recal                   ; Vectrex BIOS recalibration 
 endif  
                    jsr      Intensity_3F 
                    lda      diverseFlags 
                    anda     #BIT_FLAG_IS_BOSSFIGHT_ANY 
                    cmpa     #%00000010 
                    bne      noboss1DisplayInDying 
REPLACE_1_2_displayBoss1_varFrom0_3                       ;  bank 0 replace 
                    ldx      #0                           ; displayBoss1 
bossDisplay_01 
                    jsr      jsrBank0X 
                    bra      noadditionalDisplay 

noboss1DisplayInDying 
                    cmpa     #%00000100 
                    bne      noboss2DisplayInDying 
REPLACE_1_2_displayBoss2_varFrom0_3                       ;  bank 0 replace 
                    ldx      #0                           ; displayBoss2 
                    bra      bossDisplay_01 

noboss2DisplayInDying 
                    cmpa     #%00000110 
                    bne      noboss3DisplayInDying 
REPLACE_1_2_displayBoss3_varFrom0_3                       ;  bank 0 replace 
                    ldx      #0                           ; displayBoss3 
                    bra      bossDisplay_01 

noboss3DisplayInDying 
                    cmpa     #%00001000 
                    bne      noboss4DisplayInDying 
REPLACE_1_2_displayBoss4_varFrom0_3                       ;  bank 0 replace 
                    ldx      #0                           ; displayBoss4 
                    bra      bossDisplay_01 

noboss4DisplayInDying 
                    clr      attackPatternInitiated 
                    jsr      displayScore                 ; messsaging 
                    lda      #DEFAULT_ENEMY_INTENSITY 
                    _INTENSITY_A  
                    jsr      displayStaticBonus 
noadditionalDisplay 
; draw the player ship
; optimization pending (in Move etc)
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
                    jsr      doPlayerExplosion 
;
; usage of DS (Stack) forbidden below!!!
; (in main loop)
;
; the object lists and smart draw use both stacks
; the object list uses DS as object list pointer
; and the smart draw uses "U" as User stack pointer
                    jmp      doMainBank0 

bonus_done_dying 
                    RESET_LASER  
                    lds      enemylist_objects_head 
                    puls     d,pc                         ; (D = y,x) ; do all objects 
enemies_done_dying 
                    LDb      #$98 
                    STb      <VIA_aux_cntl                ; ensure mode is correct for "ordinary" drawings... 
shots_done_dying 
                    lds      starlist_objects_head 
                    puls     d,pc                         ; (D = y,x) ; do all objects 
stars_done_dying 
                    lds      #MY_STACK                    ; CBFC ; correct the stack to default address 
                    jmp      main_dying                   ; and repeat forever 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
dyingDone 
 if  DO_DYING_BONUS = 1 
                    ldu      #bonusobject1 + BEHAVIOUR 
                    lda      #MAX_BONUS_OBJECTS 
nextBonusBehaviourTest 
                    ldx      ,u 
REPLACE_1_2_risingBonusBehaviour_varFrom0_0               ;  bank 0 replace 
                    cmpx     #0                           ; risingBonusBehaviour 
                    bhi      noBehaviorChange 
REPLACE_1_2_fallingBonusBehaviour_varFrom0_0              ;  bank 0 replace 
                    ldx      #0                           ;fallingBonusBehaviour 
                    stx      ,u 
noBehaviorChange 
                    leau     BonusStruct,u 
                    deca     
                    bne      nextBonusBehaviourTest 
 endif  
                    lda      enemyCount 
                    sta      joystickDir 
                    dec      playerLives 
                    lda      playerLives 
                    cmpa     # '0'
                    bne      notGameOver 
REPLACE_1_2_gameOverFinalScoring_varFromIRQ1_1 
                    ldx      #0                           ; gameOverFinalScoring 
                    jmp      jmpBankIRQ1Shift 

;                    lbeq     gameOver
; reduce player shot stats if possible
; after a death
notGameOver 
; ensure EXTRA is displayed correctly
                    lda      bonusCollect 
                    sta      bonusDisplay 
; boss death random level go back (1-4)
                    lda      diverseFlags 
                    anda     #BIT_FLAG_IS_BOSSFIGHT_ANY 
 if  BOSS_FIGHT_DEATH_JUMP = 1 
                    clra     
 endif  
                    beq      noBossDeathFight 
                    RANDOM_A  
                    anda     #%00000011 
                    inca     
                    nega     
                    adda     levelCount 
                    sta      levelCount 
REPLACE_1_2_showBossDeath_varFromIRQ0_1 
                    ldx      #0                           ;showBossDeath 
                    jmp      jmpBankIRQ0T1 

backFromBothDeathMessage 
noBossDeathFight 
                    lda      lockPurchased 
                    anda     #%00001111 
                    deca     
                    bmi      noLock 
                    dec      lockPurchased 
                    bra      lockPurchased_jmp 

noLock 
; switch off autofire
                    lda      diverseFlags 
                    anda     #%11111110 
                    sta      diverseFlags 
 if  AUTO_FIRE = 1 
                    inc      diverseFlags 
 endif  
; reduce timer
                    ldd      bonusTimerLength 
                    subd     #250                         ; sub five seconds 
                    cmpd     #250 
                    bgt      timerOkHere 
                    ldd      #250                         ; min Value 5s 
timerOkHere 
                    std      bonusTimerLength 
; reduce shot type
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #1 
                    ble      noShotReduce 
                    dec      playerNumberOfBulletsPerShot 
noShotReduce 
; reduce shot count in air
                    lda      playerMaxShotInAir 
                    cmpa     #1 
                    ble      noShotReduce2 
                    dec      playerMaxShotInAir 
noShotReduce2 
; reduce shot speed
                    lda      playerShotSpeed 
                    cmpa     #MIN_PLAYER_SPEED 
                    ble      noShotReduce3 
                    ldd      #-SPEED_DELTA 
                    addd     playerShotSpeed 
                    std      playerShotSpeed 
                    ADJUST_SHOT_RADIUS  
noShotReduce3 
; reduce player Speed
                    lda      playerSpeed 
                    cmpa     #MIN_PLAYER_SPEED 
                    ble      noShotReduce4 
                    ldd      #-SPEED_DELTA 
                    addd     playerSpeed 
                    std      playerSpeed 
noShotReduce4 
; reduce shotpower
                    dec      bulletDamageAdjust 
                    bpl      bulletAdjustOk 
                    clr      bulletDamageAdjust 
bulletAdjustOk 
reinitLevelStartFromDodger 
lockPurchased_jmp 
; BONUS
 if  DO_DYING_BONUS = 1 
                    lda      diverseFlags 
                    anda     #BIT_FLAG_IS_BOSSFIGHT_ANY 
                    beq      thisWasNoBossFight 
                    jsr      initNormalBonus 
thisWasNoBossFight 
 else  
; todo
; what on boss death?
                    jsr      initNormalBonus 
 endif  
                    jsr      reinitJumpBacks 
                    jmp      afterDying                   ; reinit current level - 

;***************************************************************************
; u must be preloaded with explosion struct pointer
doBossExplosion                                           ;#isfunction  
                    lda      EX_START_SIZE,u              ; * If the scale factor for the explosion 
                    cmpa     EX_MAX_SIZE,u                ; * has not surpassed the max value, then 
                    bhi      bossEntrype__Ret 
                    lsla     
                    nega     
                    adda     #$6f 
                    _INTENSITY_A  
                    ldb      gameScale 
                    stb      VIA_t1_cnt_lo 
                    ldd      EXPLOSION_POS,u 
                    MY_MOVE_TO_D_START  
                    ldb      EX_START_SIZE,u              ; * If the scale factor for the explosion 
                    bra      bossEntrype 

bossEntrype__Ret 
                    rts      

;***************************************************************************
doPlayerExplosion                                         ;#isfunction  
; position to explosion
                    ldu      #playerExplosionSpace 
                    ldb      EX_START_SIZE,u              ; * If the scale factor for the explosion 
                    cmpb     EX_MAX_SIZE,u                ; * has not surpassed the max value, then 
                    lbhs     dyingDone                    ; stack is "autocorrected" when level starts 
bossEntrype 
                    addb     #SPEED_ADD                   ; 
                    stb      EX_START_SIZE,u              ; 
                    clra     
                    sta      <VIA_shift_reg 
                    ldb      #63 / ANGLE_ADD 
                    stb      tmp8Count 
                    ldb      #ANGLE_ROT_ADD               ; 
                    andb     #%00111111                   ; max 63 
                    stb      EX_STEP,u                    ; 
                    stb      tmp8 
next_exangle_rot_ob_scale 
                    jsr      getCircleCoordinate 
                    std      tmp16_pos 
                    nega     
                    negb     
                    std      tmp16_neg 
                    ldb      playerXpos,u                 ; 
                    lda      tmp8Count 
                    mul      
                    andb     #%00001111 
                    addb     EX_START_SIZE,u              ; 
                    STb      <VIA_t1_cnt_lo 
                    MY_MOVE_TO_A_END  
; get position of dot and move there
                    ldd      tmp16_pos 
                    MY_MOVE_TO_D_START  
                    adda     playerXpos,u                 ; 
                    adda     tmp8Count 
                    anda     #7 
                    adda     #3 
                    sta      <VIA_t1_cnt_lo 
                    lda      playerXpos,u                 ; 
                    adda     tmp8Count 
                    anda     #$7 
                    asla     
                    ldx      #AnimList 
                    ldx      a,x 
                    MY_MOVE_TO_A_END  
                    Draw_VLp_lessGap                      ;DRAW_VLP 
                    ldb      playerXpos,u                 ; 
                    lda      tmp8Count 
                    mul      
                    andb     #%00001111 
                    addb     EX_START_SIZE,u              ; 
                    stb      <VIA_t1_cnt_lo 
                    ldd      tmp16_neg 
; return to center of explosion
                    MY_MOVE_TO_D_START  
                    ldb      #ANGLE_ADD 
                    addb     tmp8 
                    andb     #%00111111                   ; max 63 
                    stb      tmp8 
                    dec      tmp8Count 
                    lbpl     next_exangle_rot_ob_scale 
; complete explosion done
                    ldb      gameScale 
                    stB      VIA_t1_cnt_lo 
                    LDa      #$CC 
                    STA      VIA_cntl                     ;/BLANK low and /ZERO low 
                    ldd      #0 
                    std      <VIA_port_b 
                    MY_MOVE_TO_A_END  
exitExplosionSub 
                    rts      

;***************************************************************************
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
initNormalBonus                                           ;#isfunction  
                    lda      #MAX_BONUS_OBJECTS 
                    ldu      #bonusobject_list 
                    stu      bonuslist_empty_head 
                    ldy      #BONUS_DONE 
next_list_entry_igb2_boss 
                    leax     BonusStruct,u 
                    stx      NEXT_BONUS_OBJECT,u 
                    leau     ,x 
                    deca     
                    bne      next_list_entry_igb2_boss 
                    leau     -BonusStruct,u 
                    sty      NEXT_BONUS_OBJECT,u 
                    sty      bonuslist_objects_head 
                    sta      bonusCount 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
initNormalJMPPointer                                      ;#isfunction  
                    ldd      #jmpBack1BonusIngame 
                    std      BONUS_DONE_A 
                    ldd      #enemies_done 
                    std      ENEMY_DONE_A 
                    ldd      #shots_done 
                    std      SHOTS_DONE_A 
REPLACE_1_2_playerShotsDoneMain_varFrom0_0                ;  bank 0 replace 
                    ldd      #0                           ; 
                    std      PLAYERSHOTS_DONE_A 
                    rts      

initStars                                                 ;#isfunction  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; stars
                    lda      #MAX_STAR_OBJECTS 
                    ldu      #starobject_list 
                    stu      starlist_empty_head 
                    ldy      #STARS_DONE 
next_PS_list_entry_ig3_s1 
                    leax     StarStruct,u 
                    stx      NEXT_STAR_OBJECT,u 
                    leau     ,x 
                    deca     
                    bne      next_PS_list_entry_ig3_s1 
                    leau     -StarStruct,u 
                    sty      NEXT_STAR_OBJECT,u 
                    sty      starlist_objects_head 
                    clr      starCount 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
initNormalEnemies                                         ;#isfunction  
                    lda      #MAX_ENEMY_OBJECTS 
                    ldu      #enemyobject_list 
                    stu      enemylist_empty_head 
                    ldy      #ENEMY_DONE 
next_list_entry_ig 
                    leax     EnemyStruct,u 
                    stx      NEXT_ENEMY_OBJECT,u 
                    clr      BIT_MASK,u 
                    leau     ,x 
                    deca     
                    bne      next_list_entry_ig 
                    leau     -EnemyStruct,u 
                    sty      NEXT_ENEMY_OBJECT,u 
                    sty      enemylist_objects_head 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
initNormalEnemyShots                                      ;#isfunction  
; SHOTS
                    lda      #MAX_SHOT_OBJECTS 
                    ldu      #shotobject_list 
                    stu      shotlist_empty_head 
                    ldy      #SHOTS_DONE 
next_list_entry_ig2 
                    leax     ShotStruct,u 
                    stx      NEXT_SHOT_OBJECT,u 
                    leau     ,x 
                    deca     
                    bne      next_list_entry_ig2 
                    leau     -ShotStruct,u 
                    sty      NEXT_SHOT_OBJECT,u 
                    sty      shotlist_objects_head 
                    sta      shotCount 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
initPlayerShotList                                        ;#isfunction  
; player shots
                    lda      #MAX_PLAYERSHOT_OBJECTS 
                    ldu      #playershotobject_list 
                    stu      playershotlist_empty_head 
                    ldy      #PLAYERSHOTS_DONE 
next_PS_list_entry_ig3 
                    leax     PlayerShotStruct,u 
                    stx      NEXT_PLAYERSHOT_OBJECT,u 
                    leau     ,x 
                    deca     
                    bne      next_PS_list_entry_ig3 
                    leau     -PlayerShotStruct,u 
                    sty      NEXT_PLAYERSHOT_OBJECT,u 
                    sty      playershotlist_objects_head 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
initRandomBossExplosion 
REPLACE_1_2_explosion1Data_varFromIRQ1_3 
                    ldx      #0                           ;explosion1Data 
                    lda      sfx_pointer_3 
                    bne      sound2 
                    stx      sfx_pointer_3 
                    bra      soundDone 

sound2 
                    lda      sfx_pointer_2 
                    bne      sound1 
                    stx      sfx_pointer_2 
                    bra      soundDone 

sound1 
                    stx      sfx_pointer_1 
soundDone 
                    lda      #1 
                    sta      EX_START_SIZE,u              ; position 
                    RANDOM_A  
                    anda     #%00111111                   ; max 64 
                    ora      #%00001111                   ; min 15 
                    sta      EX_MAX_SIZE,u                ; position 
                    clr      EX_STEP,u                    ; start at 0 
                    RANDOM_A  
                    anda     #%00011111 
                    adda     bossPosY 
                    bvc      notOOBbe1 
                    lda      bossPosY 
notOOBbe1 
                    RANDOM_B  
                    andb     #%00011111 
                    addb     bossPosX 
                    bvc      notOOBbe2 
                    ldb      bossPosX 
notOOBbe2 
                    std      EXPLOSION_POS,u 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bossFightPlayerStuff                                      ;#isfunction  
                    clra     
                    sta      in_moveFlag                  ; boss has no stars, so this should be irrelevant 
                    sta      <VIA_shift_reg 
 if  IS_VIA_FAULTY_RESISTENT = 1 
REPLACE_1_2_myWaitRecal_varFrom0_3 
                    ldx      #0                           ; myWaitRecal 
                    jsr      jsrBank0X 
 else  
                    JSR      Wait_Recal                   ; Vectrex BIOS recalibration 
 endif  
                    tst      animDelayCounter             ; one global animation counter 
                    bpl      noAnimChange_m1_b2 
                    lda      #ANIMATION_DELAY 
                    sta      animDelayCounter 
noAnimChange_m1_b2 
                    dec      animDelayCounter 
                    clr      attackPatternInitiated       ; boss has no single enemies , so this should be irrelevant 
                    lda      #DEFAULT_ENEMY_INTENSITY 
                    _INTENSITY_A  
; draw the player ship
; optimization pending (in Move etc)
                    jsr      calibrationZero7 
                    lda      #PLAYER_YPOS 
                    ldb      gameScale 
                    stb      VIA_t1_cnt_lo 
                    ldb      playerXpos 
                    MY_MOVE_TO_D_START  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; THIS BLOCK CAN BE HANDLED IN SOME MOVE
;;;;;;
;todo one set of stars
; than following macros are included "free"
                    PLAYER_MOVEMENT_MOVE_BLOCK            ; normally this is done in "stars" - here we have to do it "manually" 
                    lda      #BOSS1_Y_LOW 
                    sta      enemyMINY 
                    INITIALZE_SHOT_TEST_MOVE_BLOCK_1      ; normally this is done in "stars" - here we have to do it "manually" 
                    INITIALZE_SHOT_TEST_MOVE_BLOCK_2      ; normally this is done in "stars" - here we have to do it "manually" 
 if  UNDYING 
 else  
                    tst      playerWasHitFor 
                    beq      noPlayerHit_b1 
                    clr      allowBossShots 
                    jsr      initPlayerShotList 
                    jmp      playerDying 

 endif  
noPlayerHit_b1 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 if  DRAW_FIGHTER_IN_BANK0 = 1 
REPLACE_1_2_doFighterPrep_varFromIRQ0_6 
                    ldx      #0                           ; doFighterPrep 
                    jmp      jsrBank0_fromBank3_Shift 

 else  
drawFighterPrep 
                    DRAW_FIGHTER_PREP  
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
draw_scooping 
                    DRAW_SCOOP_HERE  
                    rts      

 endif  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
initBossFight                                             ;        in A number of shots to initialize 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SHOTS - boss is allowed to fire more than 10 shots!
;                    lda      #MAX_SHOT_OBJECTS_BOSS
                    ldu      #shotobject_list 
                    stu      shotlist_empty_head 
                    ldy      #SHOTS_DONE 
next_list_entry_ig2_b1 
                    leax     ShotStruct,u 
                    stx      NEXT_SHOT_OBJECT,u 
                    leau     ,x 
                    deca     
                    bne      next_list_entry_ig2_b1 
                    leau     -ShotStruct,u 
                    sty      NEXT_SHOT_OBJECT,u 
                    sty      shotlist_objects_head 
;;;;;;;;;;;;;;
                    lda      #2 
                    sta      shotSpeed 
                    jsr      initLevelContinue 
                    clr      bossMoveDir 
; ensure no scoop in boss
                    lda      playerBonusActive 
                    anda     #BITFIELD_NOT_SCOOP 
                    sta      playerBonusActive 
                    lda      #1 
                    sta      allowBossShots 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
isBoss1             =        shotCount 
extroBoss                                                 ;#isfunction  
 clr playerWasHitFor ; add V1.13 Sandy
                    clr      isBoss1 
                    lda      diverseFlags 
                    anda     #BIT_FLAG_IS_BOSSFIGHT_ANY 
                    cmpa     #%00000010 
                    bne      notBoss1 
                    inc      isBoss1 
notBoss1 
                    lda      diverseFlags 
                    anda     #%11100001 
                    sta      diverseFlags 
                    lda      lockPurchased 
                    anda     #%11011111 
                    sta      lockPurchased                ; switch off scoopy shielded 
                    clr      allowBossShots 
                    jsr      initPlayerShotList 
                    jsr      addScore25000 
                    lda      #10 
                    sta      boss3ShieldCount 
                    ldd      #300 
                    std      bossTimer 
                    ldu      #bossExplosionSpace1 
                    jsr      initRandomBossExplosion 
                    ldu      #bossExplosionSpace2 
                    jsr      initRandomBossExplosion 
                    ldu      #bossExplosionSpace3 
                    jsr      initRandomBossExplosion 
loopyboss3End 
; hack to circumvent player from shooting!
                    sta      current_button_state 
                    jsr      bossFightPlayerStuff 
REPLACE_1_2_JoyDigitalHorizontal00_varFrom0_5             ;  bank 0 replace 
                    ldx      #0                           ; JoyDigitalHorizontal00 
                    jsr      jsrBank0X 
                    tst      drunkTimer 
                    beq      notDrunken_mrbo 
                    dec      drunkTimer 
                    tst      >Vec_Joy_1_X 
                    beq      notDrunken_mrbo 
                    neg      >Vec_Joy_1_X 
notDrunken_mrbo 
REPLACE_1_2_doymsound100_varFromIRQ1_3 
                    ldx      #0                           ; doymsound100 
                    jsr      jsrBank1_fromBank3_T1 
                    ldd      bossTimer 
                    cmpd     #80 
                    blt      noexplosions 
                    ldx      bossExtroPointer 
                    jsr      ,x 
                    jsr      calibrationZero7 
                    lda      explosionCount 
                    cmpa     #2 
                    beq      only2Explosions 
; draw Explosion
; optimization pending (in Move etc)
                    ldu      #bossExplosionSpace1 
                    ldb      EX_START_SIZE,u              ; position 
                    cmpb     EX_MAX_SIZE,u                ; * has not surpassed the max value, then 
                    blo      exp1BossCorrect 
                    jsr      initRandomBossExplosion 
exp1BossCorrect 
                    jsr      doBossExplosion 
only2Explosions 
                    ldu      #bossExplosionSpace2 
                    ldb      EX_START_SIZE,u              ; position 
                    cmpb     EX_MAX_SIZE,u                ; * has not surpassed the max value, then 
                    blo      exp2BossCorrect 
                    jsr      initRandomBossExplosion 
exp2BossCorrect 
                    jsr      doBossExplosion 
                    ldu      #bossExplosionSpace3 
                    ldb      EX_START_SIZE,u              ; position 
                    cmpb     EX_MAX_SIZE,u                ; * has not surpassed the max value, then 
                    blo      exp3BossCorrect 
                    jsr      initRandomBossExplosion 
exp3BossCorrect 
                    jsr      doBossExplosion 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                    bra      endOfEndOfBossDisplay 

noexplosions 
REPLACE_1_2_displayBossResult00_varFrom0_1 
                    ldx      #0                           ;displayBossResult00 
                    jsr      jsrBank0X 
endOfEndOfBossDisplay 
                    ldx      bossTimer 
                    leax     -1,x 
                    stx      bossTimer 
                    bne      loopyboss3End 
                    lda      isBoss1 
                    bne      doBlackHoleInit 
blackHoleInitDone 
; initialize the empty object list
; finish everything and go on to next level
                    jsr      initNormalBonus 
                    jsr      initNormalJMPPointer 
                    jsr      initNormalEnemies 
                    clra     
                    sta      tmp1 
                    jmp      noBonusLevel_nl 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
doBlackHoleInit 
                                                          ; shrink boss 
                                                          ; & explode 
                    ldd      #0 
                    std      bossPosY 
loopyboss3End_1 
; hack to circumvent player from shooting!
                    jsr      bossFightPlayerStuff 
REPLACE_1_2_JoyDigitalHorizontal00_varFrom0_15            ;  bank 0 replace 
                    ldx      #0                           ; JoyDigitalHorizontal00 
                    jsr      jsrBank0X 
                    tst      drunkTimer 
                    beq      notDrunken_mrbo3 
                    dec      drunkTimer 
                    tst      >Vec_Joy_1_X 
                    beq      notDrunken_mrbo3 
                    neg      >Vec_Joy_1_X 
notDrunken_mrbo3 
REPLACE_1_2_doymsound100_varFromIRQ1_123 
                    ldx      #0                           ; doymsound100 
                    jsr      jsrBank1_fromBank3_T1 
                    dec      boss1Scale 
                    bmi      preHoleDone 
REPLACE_1_2_displayBoss1_varFrom0_61                      ;  bank 0 replace 
                    ldx      #0                           ; displayBoss1 
                    jsr      jsrBank0X 
                    bra      loopyboss3End_1 

preHoleDone 
REPLACE_1_2_doBoss1Explosion_varFrom0_1                   ;  bank 0 replace 
                    ldx      #0                           ; doBoss1Explosion 
                    jsr      jsrBank0X 
REPLACE_1_2_doBoss1Explosion_varFrom0_2                   ;  bank 0 replace 
                    ldx      #0                           ; doBoss1Explosion 
                    jsr      jsrBank0X 
REPLACE_1_2_doBoss1Explosion_varFrom0_3                   ;  bank 0 replace 
                    ldx      #0                           ; doBoss1Explosion 
                    jsr      jsrBank0X 
                    bra      blackHoleInitDone 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
BIOS_SIN_TABLE      =        $FC6D 
; entry an angle 0-63 - which means 0-360 in b
; result in D (signed values) (y,x coordinate)
; a = y = sin, b = x = cos (which is acually mathematically wrong)
getCircleCoordinate 
                    ldy      #BIOS_SIN_TABLE 
                    bitb     #%00100000                   ; is bit 5 set if so > 180 
                    beq      notBig 
                    subb     #$20 
                    lda      b,y 
                    lsra                                  ; half it 
                    nega                                  ; >180 -> sin is negative 
; cos start
                    leay     $10,y                        ; prepare cosinus 
                    cmpb     #$10 
                    blo      cosNegative 
                    subb     #$20 
cosPositive 
                    ldb      b,y 
                    lsrb     
                    rts      

notBig 
                    lda      b,y 
                    lsra                                  ; half it 
                    leay     $10,y                        ; prepare cosinus 
                    cmpb     #$10 
                    blo      cosPositive 
                    subb     #$20 
cosNegative 
                    ldb      b,y 
                    lsrb     
                    negb     
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
spawnAll42 
                    ldd      bonusSpawnPosition 
                    subb     #32 
                    pshs     d 
doSpawnEnemyAgain 
                    RANDOM_B  
                    andb     #%00111111 
                    addb     1,s 
                    bvs      set7f_2 
                    bra      ok63_2 

set7f_2 
                    ldb      #$7e 
ok63_2 
                    RANDOM_A  
                    anda     #%00011111 
                    nega     
                    adda     ,s 
                    std      bonusSpawnPosition 
                    jsr      spawnEnemy 
                    beq      enemySpawningDone            ; savety measure 
                    ldd      bonusSpawnPosition 
                    std      Y_POS,u                      ; set start pos 
                    lda      #-1 
                    sta      ALL_PURPOSE ,u               ; negative means this enemy is an explosion 
                    ldd      #fallCashBehaviour           ;fallCashBehaviour 
                    std      BEHAVIOUR,u 
                    clr      ANIM_POSITION,u 
                    bra      doSpawnEnemyAgain 

enemySpawningDone 
                    leas     2,s 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;***************************************************************************
; DATA SECTION
;***************************************************************************
;-----------------------------------------------------------------------------
damagePlus 
                    db       "DAMAGE+", $80
cashDouble 
                    db       "CASH X2", $80
multi2String 
                    db       "SCORE X2", $80
multi5String 
                    db       "SCORE X5", $80
immunity1String 
                    db       "IMMUN 1", $80
immunity2String 
                    db       "IMMUN 2", $80
timerString 
                    db       "TIMER+", $80
rankAllString 
                    db       "RANK + ?", $80
rankString 
                    db       "RANK", $80
;rankNegativeString
;                    db       "rank-", $80
cashbombString 
diamonbombString 
                    db       "BOMB", $80
extraBullet 
                    db       "BULLET+", $80
extraBulletMiss 
                    db       "bullet-", $80
extraSpeed 
                    db       "SPEED+", $80
extraSlow 
                    db       "speed-", $80
extraGunSpeed 
                    db       "RATE+", $80
slowerGunSpeed 
                    db       "rate-", $80
smartBombAdded 
                    db       "BOMB+", $80
cash5 
                    db       "CASH $5", $80
cash200 
                    db       "CASH $200", $80
cash20 
                    db       "CASH $20", $80
cash50 
                    db       "CASH $50", $80
extraArmor 
                    db       "ARMOR", $80
extraShield 
                    db       "SHIELD", $80
extraScoop 
                    db       "SCOOP", $80
extraShot1 
                    db       "SHOT 1", $80
extraShot2 
                    db       "SHOT 2", $80
extraShot3 
                    db       "SHOT 3", $80
;extraShot4
;                    db       "SHOT 4", $80
MineDisplayString 
                    db       "MINES",$80
TribbleString 
                    db       "TRIBBLE",$80
SecretString 
                    db       "SECRET!",$80
AchieveString 
                    db       "TRIUMPH!",$80
extraLifeString 
                    db       "LIFE+",$80
drunkenString 
                    db       "DRUNKEN",$80
autofireString 
                    db       "AUTOFIRE",$80
DemoString 
                    db       "DEMO!",$80
DrunkenMasterString 
                    db       "DRUNKARD!",$80
;-----------------------------------------------------------------------------
 if  IS_VIA_FAULTY_RESISTENT = 1 
myMovetod 
                    MY_MOVE_TO_D_START  
                    MY_MOVE_TO_B_END  
                    rts      

 endif  
;-----------------------------------------------------------------------------
displaySpriteCalibration 
                    jsr      calibrationZero7 
                    lda      gameScale 
                    sta      VIA_t1_cnt_lo 
                    clra     
                    sta      <VIA_shift_reg 
                    ldd      #$1040 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    JSR      myMovetod                    ;Moveto_d 
 else  
                    JSR      Moveto_d 
 endif  
                    lda      #OBJECT_SCALE 
                    sta      VIA_t1_cnt_lo 
                    ldu      #SM_Fighter_0 
                    jsr      SMVB_drawSmart               ; twice the speed ofdraw synced AND calibrated! 
                    jsr      calibrationZero7 
                    clra     
                    sta      <VIA_shift_reg 
                    ldd      #$10f8 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    JSR      myMovetod                    ;Moveto_d 
 else  
                    JSR      Moveto_d 
 endif  
                    lda      #OBJECT_SCALE 
                    sta      VIA_t1_cnt_lo 
                    ldu      #BugSin_0 
;...
                    ldd      #backFromBugPrintCalib 
                    std      ENEMY_DONE_A 
                    tfr      s,y 
                    lds      #ENEMY_DONE 
                    clra     
                    pulu     b,x,pc 
backFromBugPrintCalib 
                    jsr      calibrationZero7 
                    clra     
                    sta      <VIA_shift_reg 
                    ldd      #$10c0 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    JSR      myMovetod                    ;Moveto_d 
 else  
                    JSR      Moveto_d 
 endif  
                    lda      #OBJECT_SCALE 
                    sta      VIA_t1_cnt_lo 
                    ldu      #Bug_Destroyer 
;...
                    ldd      #backFromBugPrintCalib2 
                    std      ENEMY_DONE_A 
                    lds      #ENEMY_DONE 
                    clra     
                    pulu     b,x,pc 
backFromBugPrintCalib2 
                    tfr      y,s 
                    rts      

;-----------------------------------------------------------------------------
                    include  "enemyShotColDetectBoss.asm" ; macros
                    include  "boss4Code.asm"
                    include  "boss3Code.asm"
                    include  "boss2Code.asm"
                    include  "boss1Code.asm"
                    include  "addScore.asm"
                    include  "font_5.asm"
                    include  "smartlist/drawListScale7Normal.asm"
                    include  "fighter.asm"
                    include  "messenger.asm"
                    include  "enemies/enemiesLow.asm"
                    include  "bonus.asm"
                    include  "object.asm"
                    include  "playerExplosion.asm"
                    include  "dodger.asm"
                    include  "f_Levels.asm"
                    include  "enemies/enemiesHi.asm"
                    include  "drawSubs.asm"
;-----------------------------------------------------------------------------
displaySwarmCalibration 
                    LDA      #$80 
                    STA      <VIA_aux_cntl                ; Shift reg mode = 000 free disable, T1 PB7 enabled 
                    jsr      calibrationSwarm 
                    ldd      #0 
                    MY_MOVE_TO_D_START  
                    INIT_DRAW_6_MOVE_END  ( (-$12 )*256 + ( $3C) ) 
                    LINE_DRAW_6_x  ( ( $7f )*256 + ( $00-40) ) 
                    LINE_DRAW_6_x  ( (-$1B-10 )*256 + (-$32) ) 
                    LINE_DRAW_6_x  ( ( $28 )*256 + ( $06) ) 
                    LINE_DRAW_6_x  ( ( $00 )*256 + (-$20-20) ) 
                    LINE_DRAW_6_x  ( (-$28 )*256 + ( $06+30) ) 
                    LINE_DRAW_6_x  ( ( $1B+20 )*256 + (-$32) ) 
                    LINE_DRAW_6_x  ( (-$7f )*256 + ( $00+40) ) 
                    LINE_DRAW_6_x  ( ( $12 +7)*256 + ( $3C) ) 
                    DEINIT_DRAW_6  
                    rts      
