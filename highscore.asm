; bank 1
SKULL_Y_POS         =        -$6c 
HS_YPOS             =        $4c                          ;40 
HS_XPOS             =        $b0 
HIGH_SCORE_ZERO_POS  =       (HS_YPOS)*256+lo(HS_XPOS) 
mov_y               =        _tmpY 
mov_x               =        _tmpX                        ; _tmpY+1 
;
initShowHighScore 
                    clra     
                    sta      tmpButtonMode 
                    ldu      #highScoreBlock 
                    ldb      difficulty 
                    bpl      normnalHSMode 
                    leau     HighScoreEntry * 4, u        ; hardcore 
                    inca     
normnalHSMode 
                    stu      tmpHiStart 
                    sta      tmpHiMode 
REPLACE_1_2_initTitleRAM_varFrom0_11 
                    ldx      #0                           ; 
                    jsr      jsrBank2_from1_SHIFT         ; initTitleRAM 
                    jsr      initStars_hs 
REPLACE_1_2_starsDonehsList_varFrom1_2 
                    ldd      #0                           ;starsDonehsList 
                    std      STARS_DONE_A 
                    lda      #-1 
                    sta      doWarpFailure                ; indication for star type warpfailure (!=0) and indication for short stars (negative) 
; star behaviour at simpleStarBehaviourHSBank2
; spawn 4 star objects
                    lda      #4 
                    pshs     a 
spawnNextHSStar 
REPLACE_1_2_spawnStar_varFrom1_10 
                    ldx      #0                           ;spawnStar 
                    jsr      jsrBank3_fromShift_1 
                    dec      ,s 
                    bne      spawnNextHSStar 
                    puls     a 
;..................
; init 8 enemies
                    lda      #8 
                    pshs     a 
                    ldy      #hsEnemyDef 
spawnNextHSEnemy 
REPLACE_1_2_spawnEnemy_varFrom1_1 
                    ldx      #0                           ;spawnEnemy 
                    jsr      jsrBank3_fromShift_1 
                    cmpu     #0 
                    beq      enemyOverAndOut 
REPLACE_1_2_enemyHS1Behaviour_varFrom1_1 
                    ldd      #0                           ; enemyHS1Behaviour 
                    std      BEHAVIOUR,u 
                    ldd      ,y++                         ; 
                    std      ENEMY_STRUCT,u               ; 
                    ldd      ,y++                         ; 
                    std      Y_POS,u 
                    sta      Y_POS16,u 
                    stb      X_POS16,u 
                    clr      Y_POS16+1,u 
                    clr      X_POS16+1,u 
                    lda      ,y+ 
                    sta      POSITION, u 
                    deca     
                    sta      ANIM_POSITION,u 
                    dec      ,s 
                    bne      spawnNextHSEnemy 
enemyOverAndOut 
                    puls     a 
;..................
REPLACE_1_2_enemyDonehsList_varFrom1_1 
                    ldd      #0                           ;enemyDonehsList 
                    std      ENEMY_DONE_A 
                    rts      

; -----------------------------------------------------------------------------------
hsEnemyDef 
REPLACE_0_2_enemySW4Definition1_varFrom1_1 
                    dw       0, $6870                     ; enemy, position 
                    db       DOWN                         ; direction 
REPLACE_0_2_enemyTR2Definition1_varFrom1_1 
                    dw       0, $0070                     ; enemy, position 
                    db       DOWN                         ; direction 
REPLACE_0_2_enemyTR3Definition1_varFrom1_1                ;enemyTR3Definition1  
                    dw       0, $8090                     ; enemy, position 
                    db       UP                           ; direction 
REPLACE_0_2_enemySW1Definition1_varFrom1_1 
                    dw       0, $0090                     ; enemy, position 
                    db       UP                           ; direction 
REPLACE_0_2_enemy1Definition_varFrom1_1 
                    dw       0, $6890                     ; enemy, position 
                    db       RIGHT                        ; direction 
REPLACE_0_2_enemySin3Definition_varFrom1_1 
                    dw       0, $6800                     ; enemy, position 
                    db       RIGHT                        ; direction 
REPLACE_0_2_enemySin1Definition_varFrom1_1 
                    dw       0, $8070                     ; enemy, position 
                    db       LEFT                         ; direction 
REPLACE_0_2_enemy2Definition_varFrom1_1 
                    dw       0, $8000                     ; enemy, position 
                    db       LEFT                         ; direction 
; -----------------------------------------------------------------------------------
; called from title screen - also initializes music, and loops music
showHighscoreMusic                                        ;#isfunction  
                    lda      #1 
                    sta      songLoop 
                    ldu      #hsMusic 
                    jsr      PLYINIT 
; called from after highscore edit - to display the complete table
; music is already playing, and not looping!
; -----------------------------------------------------------------------------------
; -----------------------------------------------------------------------------------
; -----------------------------------------------------------------------------------
showHighscore                                             ;#isfunction  
                    jsr      initShowHighScore 
; a)  hs stars 
; b) enemies circling the score
                    IRQ_TO_0_SHIFT  
edithighscoreinner 
edit_highscore_inner 
                    tst      animDelayCounter             ; one global animation counter 
                    bpl      noAnimChange_hs 
                    lda      #ANIMATION_DELAY 
                    sta      animDelayCounter 
noAnimChange_hs 
                    dec      animDelayCounter 
                    sts      saveStack 
REPLACE_1_2_hsDoStarsList_varFrom1_1 
                    ldx      #0                           ; hsDoStarsList 
                    jmp      jmpBankIRQ3X 

starsDoneIn02 
REPLACE_1_2_hsEnemyList_varFrom1_1 
                    ldx      #0                           ; hsEnemyList 
                    jmp      jmpBankIRQ3X 

enemiesDoneHS 
                    lds      saveStack                    ; CBFC ; correct the stack to default address 
                    tst      songOver 
                    lbeq     exitHighScore 
                    jsr      Wait_Recal_noShift 
                    jsr      PLYPLAYNOLOOP2 
                    jsr      doymsound100 
                    jsr      Intensity_5F 
                    jsr      calibrationZero16 
                    ldd      #HIGH_SCORE_ZERO_POS 
                    std      mov_y 
                    lda      #4 
                    sta      tmp_count 
                    lda      tmpHiMode 
                    beq      next_score_entry_edit 
                    lda      gameScale 
                    sta      <VIA_t1_lch_lo 
                    ldd      #SKULL_Y_POS * 256 
                    MY_MOVE_TO_D_START  
                    lda      #15                          ;6 
                    sta      <VIA_t1_lch_lo 
                    MY_MOVE_TO_A_END  
                    ldu      #Skull 
                    jsr      SMVB16_drawSmart 
next_score_entry_edit 
                    lda      gameScale 
                    sta      <VIA_t1_cnt_lo 
                    ldd      mov_y                        ; the current move vector 
                    MY_MOVE_TO_D_START  
; move player initials from the highscore block to a printable position
                    lda      #4 
                    suba     tmp_count 
                    lsla     
                    lsla     
                    lsla                                  ; times 8 
                    ldu      tmpHiStart                   ;#highScoreBlock 
                    leau     a,u 
                    ldy      #player_score 
                    ldd      ,u++                         ; first two ascii of score 
                    std      ,y 
                    lda      ,u+ 
                    ldb      #$80 
                    std      2,y 
; initials move done
                    lda      mov_x 
                    adda     #75 
                    sta      mov_x 
                    lda      #MAX_SCALE 
                    sta      <VIA_t1_lch_lo 
                    MY_MOVE_TO_A_END  
                    jsr      nextLetterPrintVector        ; print initals 
                    lda      gameScale 
                    sta      <VIA_t1_cnt_lo 
; put to be displayed bcd score as csa score into player score
; player_score
                    ldd      mov_y                        ; the current move vector 
                    MY_MOVE_TO_D_START  
; move the player score from the highscore block to a printable position
                    lda      #4 
                    suba     tmp_count 
                    lsla     
                    lsla     
                    lsla                                  ; times 8 
                    adda     #3 
                    ldu      tmpHiStart                   ; #highScoreBlock 
                    leau     a,u 
                    ldx      #player_score 
                    bsr      bcd_to_csaASCII 
                    ldx      #player_score 
; clear front zeros
                    lda      #-1 
nextSpaceLoop 
                    inca     
                    ldb      a,x 
                    cmpb     # '0'
                    bne      spaceloopDone 
                    ldb      # ' '
                    stb      a,x 
                    bra      nextSpaceLoop 

spaceloopDone 
                    lda      #$80 
                    sta      player_score_80 
                    lda      mov_y 
                    suba     #50 
                    sta      mov_y 
                    lda      #HS_XPOS 
                    sta      mov_x 
                    ldy      #player_score 
                    lda      #MAX_SCALE 
                    sta      <VIA_t1_lch_lo 
                    MY_MOVE_TO_A_END  
                    jsr      nextLetterPrintVector        ; print initals 
                    dec      tmp_count 
                    lbne     next_score_entry_edit 
                    jsr      getButtonState               ; is a button pressed? 
                    lbeq     edit_highscore_inner 
                    bita     #1 
                    bne      noHelpHSPure 
REPLACE_1_2_showHSPureHelp_varFromIRQ0_1 
                    ldx      #0                           ;showHSPureHelp 
                    jmp      jmpBank0X 

;***************************************************************************
; u = in bcd [4 byte] msb first
; x = out csa score [7 byte] msb first
bcd_to_csaASCII                                           ;#isfunction  
                    ldb      #4 
                    bra      doOnly7_bc 

next_byte_b_c: 
                    lda      ,u 
                    lsra     
                    lsra     
                    lsra     
                    lsra     
                    adda     # '0'
                    sta      ,x+ 
doOnly7_bc 
                    lda      ,u+ 
                    anda     #%00001111 
                    adda     # '0'
                    sta      ,x+ 
                    decb     
                    bne      next_byte_b_c 
                    rts      

noHelpHSPure 
check_buttons_edit 
                    cmpa     tmpButtonMode 
                    lbeq     edit_highscore_inner 
                    sta      tmpButtonMode 
                    bita     #2                           ; button 2 switches HS mode 
                    bne      noModeSwitch 
                    clra     
                    ldu      #highScoreBlock 
                    ldb      tmpHiMode 
                    bne      normnalHSMode2 
                    leau     HighScoreEntry * 4, u        ; hardcore 
                    inca     
normnalHSMode2 
                    stu      tmpHiStart 
                    sta      tmpHiMode 
                    jmp      edit_highscore_inner 

noModeSwitch 
                    cmpb     #3                           ; same aslast state 
                    lbeq     edit_highscore_inner 
                    cmpb     #2                           ; as released - possibly from highscore return 
                    lbeq     edit_highscore_inner 
                    ldb      #3 
                    stb      last_button_state 
                    stb      current_button_state 
; restore player hs
exitHighScore 
                    rts      

SCORE_SIZE          =        16 
Skull 
                    db       $00, $01, -$50, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       $3C, $01, $00, hi(SMVB16_continue7_single), lo(SMVB16_continue7_single) 
                    db       $3C, $01, -$3C 
                    db       $64, $01, $28 
                    db       $14, $01, $50 
                    db       -$14, $01, $50 
                    db       -$64, $01, $28 
                    db       -$3C, $01, -$3C 
                    db       -$3C, $01, $00, hi(SMVB16_continue2_single), lo(SMVB16_continue2_single) 
                    db       $00, $01, -$28 
                    db       $3C, $01, $00, hi(SMVB16_startMove_single), lo(SMVB16_startMove_single) 
                    db       $ee, $01, -$28, hi(SMVB16_startDraw_newY_eq_oldX_single), lo(SMVB16_startDraw_newY_eq_oldX_single) ; y was $00, now $ee 
                    db       $50, $01, $14, hi(SMVB16_continue3_single), lo(SMVB16_continue3_single) 
                    db       -$28, $01, $3C 
                    db       $28, $01, $28 
                    db       $00, $01, -$64, hi(SMVB16_continue_double), lo(SMVB16_continue_double) 
                    db       -$28, $01, $28, hi(SMVB16_continue3_single), lo(SMVB16_continue3_single) 
                    db       $28, $01, $3C 
                    db       -$50, $01, $14 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts), lo(SMVB16_lastDraw_rts) 
