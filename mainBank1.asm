; 362 bytes free
; following is needed for VIDE
; to replace "vars" in this bank with values from the other bank
; #genVarlist# varFromIRQ1
;
CURRENT_BANK        EQU      1                            ; 
                    Bank     1 
                    include  "commonGround.i"
;FEHLER
;
;***************************************************************************
; CODE SECTION
;***************************************************************************
; INCLUDE  "VBTitle/drawRoutines.i"      
Wait_Recal_noShift                                        ;#isfunction  
 if  VECFEVER = 1 

REPLACE_1_2_bank0WaitRecal_varFromIRQ0_14 
                    ldx      #0                           ;bank0WaitRecal 
                    jmp      jsrBank0X 

 else
                    LDX      Vec_Loop_Count               ;Increment loop counter 
                    LEAX     1,X 
                    STX      Vec_Loop_Count 
                    jSR      DP_to_D0                     ;DP to I/O 
                    _ZERO_VECTOR_BEAM  
                    LDA      #$20 
LF19E_1:            BITA     <VIA_int_flags               ;Wait for timer t2 
                    BEQ      LF19E_1 
                    LDD      $C83D                        ;Store refresh value 
                    STD      <VIA_t2_lo                   ;into timer t2 
; Recalibrate without shift
                    lda      #$ff 
                    sta      <VIA_t1_cnt_lo 
                    ldd      #$7f7f 
                    MY_MOVE_TO_D_START  
                    LDa      #$CC 
                    MY_MOVE_TO_B_END  
                    STa      <VIA_cntl                    ;blank low and zero low 
                    ldd      #$8080 
                    MY_MOVE_TO_D_START  
                    LDa      #$CC 
                    MY_MOVE_TO_B_END  
                    STa      <VIA_cntl                    ;blank low and zero low 
                    LDD      #$0302 
                    CLR      <VIA_port_a                  ;clear D/A register 
                    STA      <VIA_port_b                  ;mux=1, disable mux 
                    STB      <VIA_port_b                  ;mux=1, enable mux 
                    STB      <VIA_port_b                  ;do it again 
                    LDB      #$01 
                    STB      <VIA_port_b                  ;disable mux 
                                                          ; TODO JMP Recalibrate 
                    rts      
 endif
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
returnFromShop 
REPLACE_1_2_exitshopAchievementTest_varFrom0_1            ;  bank 2 replace 
                    ldx      #0                           ; exitshopAchievementTest 
                    jmp      jmpBankIRQ2X 

backFromexitshopAchievementTest 
TestRankAdvance 
                    lda      rankCollected 
                    anda     #%00111111 
                    cmpa     #%00111111 
                    lbne     noFullRank 
                    clr      rankCollected 
                    lda      officerRankTmp 
                    cmpa     #13 
                    bhs      testSpecialRank 
                    inc      officerRankTmp 
; todo play promotion jingle!
                    ldx      #promotionData               ; 
                    stx      sfx_pointer_2 
doPromotion14 
                    lda      #150                         ; 3 seconds 
                    sta      laserTmp2 
promotion_loop 
                    jSR      Wait_Recal_noShift           ; Vectrex BIOS recalibration 
                    IRQ_TO_0_T1  
                    jsr      do_ym_sound2 
                    jsr      Intensity_5F 
                    ldu      #promotionText 
                                                          ; ensure shift irq 
                    IRQ_TO_0_SHIFT  
                    lda      #$7f 
                    sta      VIA_t1_cnt_lo 
                    ldd      ,u++ 
                    jsr      syncPrintStrd 
                    _ZERO_VECTOR_BEAM  
                                                          ; todo 
                                                          ; play some fireworks! 
REPLACE_1_2_printOneRank_varFrom0_1                       ;  bank 2 replace 
                    ldx      #0                           ; printOneRank 
                    jsr      jsrBank2_fromT1_1 
                    IRQ_TO_0_SHIFT  
                    dec      laserTmp2 
                    bne      promotion_loop 
                    bra      noFullRank 

testSpecialRank                                           ;        not done yet 
                    lda      achievements + 1 
                    bita     #ACHIEVEMENT_FLAG_BYTE2_ALL 
                    beq      noGreatDefenderYet 
                    lda      #14 
                    sta      officerRankTmp 
                    bra      doPromotion14 

noGreatDefenderYet 
                    lda      #225                         ; x seconds 
                    sta      laserTmp2 
                    ldd      #$fa40 
                    std      Vec_Text_HW 
promotion_denied_loop 
                    jSR      Wait_Recal_noShift           ; Vectrex BIOS recalibration 
                    jsr      Intensity_5F 
                    ldu      #promotionDeniedText 
                                                          ; ensure shift irq 
                    IRQ_TO_0_SHIFT  
                    lda      #$7f 
                    sta      VIA_t1_cnt_lo 
                    ldd      ,u++ 
                    jsr      syncPrintStrd 
               ;;     _ZERO_VECTOR_BEAM  
                    ldu      #promotionDeniedText2 
                    ldd      ,u++ 
                    jsr      syncPrintStrd 
                    _ZERO_VECTOR_BEAM  
                    dec      laserTmp2 
                    bne      promotion_denied_loop 
; 2500 CASH
                    ldu      playerCashW 
                    leau     2500,u 
                    stu      playerCashW 
; 100000 Points
                    jsr      addScore100000 
noFullRank 
                    ldd      #$f850 
                    std      Vec_Text_Height 
REPLACE_1_2_adjustShotDamage_varFrom0_51                  ;  bank 0 replace 
                    ldx      #0                           ; adjustShotDamage 
                    jmp      jsrBank2_from1_SHIFT 

;                    ADJUST_SHOT_DAMAGE   
;                    rts                                   ; return to main game 
REPLACE_1_2_ReturnFromRankCheck_varFrom0_1                ;  bank 2 replace 
                    ldx      #0                           ; ReturnFromRankCheck 
                    jmp      jmpBankIRQ2X 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
promotionText 
                    db       $30,$a0, "You are promoted to:", $80
promotionDeniedText 
                    db       $30,$a0, "You can't be promoted!", $80
promotionDeniedText2 
                    db       $20,$a0, "How about a raise instead?", $80
; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
go_state            =        scoopEnemy1 
secretCount         =        enemyCount 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DO_ONE_SOUND_TICK   macro    
                    lda      Vec_Loop_Count+1 
                    anda     #%00000111 
                    bne      noNewSound\? 
                    ldx      #BonusCountdownData          ; spawnXData 
                    stx      sfx_pointer_2 
noNewSound\? 
                    endm     
doOneSoundTick 
                    DO_ONE_SOUND_TICK  
                    rts      

;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
gameOverFinalScoring                                      ;#isfunction  
                    jsr      beQuiet 
REPLACE_1_2_initTitleRAM_varFrom0_521                     ;  bank 0 replace 
                    ldx      #0                           ; initTitleRAM 
                    jsr      jsrBank2_from1_SHIFT 
                    clr      songLoop 
                    ldu      #candleMusic                 ; ; titleMusic 
                    jsr      PLYINIT 
                    lda      #$80 
                    sta      player_score_80              ; removed possible "x2" 
                    clr      go_state 
                    inc      go_state 
                    ldd      #250                         ; 5 sec 
                    std      tmp16_tmp 
                    std      tmp16_tmp2 
REPLACE_1_2_calcHitPercentage_varFromIRQ0_14 
                    ldx      #0                           ;calcHitPercentage 
                    jsr      jsrBank0X 
REPLACE_1_2_getSecretCount_varFromIRQ0_13 
                    ldx      #0                           ;getSecretCount 
                    jsr      jsrBank0X 
; result in secretCount
                    lda      #1 
                    adda     officerRankTmp 
                    lsla     
                    lsla     
                    sta      multiplyer 
allgameOverDone     =        shotCount 
                    clr      allgameOverDone 
; init some kind of sound
REPLACE_1_2_initCandle_varFromIRQ0_1 
                    ldx      #0                           ; initCandle 
                    jsr      jsrBank0X 
; loop for game Over display
; display in stages
;
MIN_DISPLAY         =        75                           ; 75 ; 1.5 sec 
;
GO_DISPLAY_ONLY     =        0 
GO_DISPLAY_CANDLE   =        1 
GO_START_PERCENT_N_SUM  =    2 
GO_SHOW_PERCENT_N_SUM  =     3 
GO_START_SECRETS_N_SUM  =    4 
GO_SHOW_SECRETS_N_SUM  =     5 
GO_START_LEVELS_N_SUM  =     6 
GO_SHOW_LEVELS_N_SUM  =      7 
GO_START_FINALY_N_SUM  =     8 
GO_SHOW_FINALY_N_SUM  =      9 
;
go_loop 
                    lda      gameScale 
                    sta      <VIA_t1_cnt_lo 
                    ldb      go_state 
                    cmpb     #GO_SHOW_FINALY_N_SUM +1 
                    beq      go_nostateChange             ; finish game over sequence, no state changes anymore 
                    ldd      tmp16_tmp2 
                    subd     #1 
                    std      tmp16_tmp2 
                    ldd      tmp16_tmp                    ; count down for displayed "value" 
                    subd     #1 
                    std      tmp16_tmp 
; if either tmp or tmp2 is still positive
; than no state changes
                    bpl      go_nostateChange 
                    ldd      tmp16_tmp2 
                    bpl      go_nostateChange 
; minimum display time for one result
                    ldd      #MIN_DISPLAY 
                    std      tmp16_tmp2 
                    inc      go_state 
                    lda      go_state 
                    cmpa     #GO_DISPLAY_CANDLE 
                    bne      go_nostateChange 
                    ldd      #250 
                    std      tmp16_tmp2 
go_nostateChange 
                    IRQ_TO_0_SHIFT  
                    jsr      Wait_Recal_noShift 
                    jsr      PLY_PLAY 
                    jsr      do_ym_sound2 
                    lda      go_state 
                    cmpa     #1 
                    ble      backFromGameOver0 
REPLACE_1_2_showGameOver_varFromIRQ0_1 
                    ldx      #0                           ; showGameOver 
                    jmp      jmpBankIRQ0Shift 

backFromGameOver0 
                    ldb      go_state 
                    beq      go_loop 
                    cmpb     #GO_DISPLAY_CANDLE 
                    bne      noCandleStart 
REPLACE_1_2_drawCandleStepComplete_varFromIRQ0_1 
                    ldx      #0                           ; drawCandleStepComplete 
                    jsr      jsrBank0X 
                    jmp      go_loop 

; ..........................
noCandleStart 
; HIT PERCENT
                    ldb      go_state 
                    cmpb     #GO_START_PERCENT_N_SUM 
                    bne      go_notState1 
; MUST BE REMOVED!
; ldd #1200
; std playerShotCountW
; ldd #120 ; percent
; stb      tmp_div1 
; std levelsPlayed
; lda      #5
; adda     officerRankTmp 
; lsla     
; lsla     
; sta      multiplyer 
                    ldb      tmp_div1 
                    clra     
                    MY_LSL_D  
                    std      tmp16_tmp 
                    beq      noPercent 
                    ldd      playerShotCountW 
                    cmpd     #200 
                    bhi      percentOk                    ; only check when at least 100 shots fired 
noPercent 
                    inc      go_state 
percentOk 
                    inc      go_state 
; ..........................
go_notState1 
                    ldb      go_state 
                    cmpb     #GO_SHOW_PERCENT_N_SUM 
                    bne      go_notState2 
                    tst      tmp16_tmp 
                    bmi      noScreAdd1 
REPLACE_1_2_addScore100_varFrom1_1                        ;  bank 2 replace 
                    ldx      #0                           ; addScore100 
                    jsr      jsrBank3_fromShift_1 
                    jsr      doOneSoundTick 
; check score again, since multiplyer can be greater 10!
REPLACE_1_2_addScoreBack1_varFrom1_1                      ;  bank 2 replace 
                    ldu      #0                           ; addScoreBack1 
REPLACE_1_2_checkScore_varFrom1_1                         ;  bank 2 replace 
                    ldx      #0                           ; checkScore 
                    jsr      jsrBank3_fromShift_1 
noScreAdd1 
                    ldd      #$2090 
                    ldu      #go_percent 
                    jsr      syncPrintStrd 
                    lda      Vec_Loop_Count+1 
                    anda     #1 
                    bne      slowDownPercent              ; slowDown 
                    dec      tmp_div1 
slowDownPercent 
                    ldb      tmp_div1 
                    clra     
                    ldu      #StringOutputBuffer_4 
                    jsr      wordToDecString 
                    ldu      #StringOutputBuffer_4 
                    jsr      leadingZeroToSpace 
                    ldd      #$2020 
                    jsr      syncPrintStrd 
;
; ..........................
go_notState2 
; HIT SECRETS
; not counted down - they are added in one go and shown in one go!
                    ldb      go_state 
                    cmpb     #GO_START_SECRETS_N_SUM 
                    bne      go_notState3 
                    lda      secretCount 
                    bne      secretOk 
noSecret 
                    inc      go_state 
                    inc      go_state 
                    bra      go_notState3 

secretOk 
goadd_again 
                    lda      secretCount 
                    beq      addingDone 
                    dec      secretCount 
REPLACE_1_2_addScore10000_varFrom1_1                      ;  bank 2 replace 
                    ldx      #0                           ; addScore10000 
                    jsr      jsrBank3_fromShift_1 
                    jsr      doOneSoundTick 
; check score again, since multiplyer can be greater 10!
REPLACE_1_2_addScoreBack1_varFrom1_2                      ;  bank 2 replace 
                    ldu      #0                           ; addScoreBack1 
REPLACE_1_2_checkScore_varFrom1_2                         ;  bank 2 replace 
                    ldx      #0                           ; checkScore 
                    jsr      jsrBank3_fromShift_1 
                    bra      goadd_again 

addingDone 
REPLACE_1_2_getSecretCount_varFromIRQ0_132 
                    ldx      #0                           ;getSecretCount 
                    jsr      jsrBank0X 
; result in secretCount
                    ldd      #150                         ; wait 3 seconds 
                    std      tmp16_tmp 
                    inc      go_state 
; ..........................
go_notState3 
                    ldb      go_state 
                    cmpb     #GO_SHOW_SECRETS_N_SUM 
                    bne      go_notState4 
                    ldu      #go_secret 
                    ldd      #$2090 
                    jsr      syncPrintStrd 
                    lda      secretCount 
                    lsla     
                    ldu      #se_bo 
                    ldu      a,u 
                    ldd      #$2020 
                    jsr      syncPrintStrd 
;
; ..........................
go_notState4 
; HIT LEVELS PLAED
                    ldb      go_state 
                    cmpb     #GO_START_LEVELS_N_SUM 
                    bne      go_notState5 
                    ldd      levelsPlayed 
                    MY_LSL_D  
                    std      tmp16_tmp 
                    bne      noDoubleInc_gol 
                    inc      go_state 
noDoubleInc_gol 
                    inc      go_state 
; ..........................
go_notState5 
                    ldb      go_state 
                    cmpb     #GO_SHOW_LEVELS_N_SUM 
                    bne      go_notState6 
; half the multi player + but "add" 1000
; -> add 500 per level!
                    lda      Vec_Loop_Count+1 
                    anda     #1 
                    bne      slowDownLevels               ; slowDown 
                    tst      tmp16_tmp 
                    bmi      noScreAdd2 
                    lda      multiplyer 
                    pshs     a 
                    lsra     
                    lsra     
                    inca     
                    lsra     
                    lsla     
                    lsla     
                    sta      multiplyer 
REPLACE_1_2_addScore1000_varFrom1_11                      ;  bank 2 replace 
                    ldx      #0                           ; addScore1000 
                    jsr      jsrBank3_fromShift_1 
                    puls     a 
                    sta      multiplyer 
                    jsr      doOneSoundTick 
; check score again, since multiplyer can be greater 10!
REPLACE_1_2_addScoreBack1_varFrom1_11                     ;  bank 2 replace 
                    ldu      #0                           ; addScoreBack1 
REPLACE_1_2_checkScore_varFrom1_11                        ;  bank 2 replace 
                    ldx      #0                           ; checkScore 
                    jsr      jsrBank3_fromShift_1 
slowDownLevels 
noScreAdd2 
                    ldd      #$2090 
                    ldu      #go_levels 
                    jsr      syncPrintStrd 
                    ldd      tmp16_tmp 
                    MY_LSR_D  
                    cmpd     #0 
                    bpl      levelsOk 
                    ldd      #0 
levelsOk 
                    ldu      #StringOutputBuffer_4 
                    jsr      wordToDecString 
                    ldu      #StringOutputBuffer_4 
                    jsr      leadingZeroToSpace 
                    ldd      #$2020 
                    jsr      syncPrintStrd 
;
; ..........................
go_notState6 
                    ldb      go_state 
                    cmpb     #GO_START_FINALY_N_SUM 
                    bne      go_notState7 
                    ldd      #100 
                    std      tmp16_tmp 
                    inc      go_state 
; ..........................
go_notState7 
                    ldb      go_state 
                    cmpb     #GO_SHOW_FINALY_N_SUM 
                    bls      go_notdone 
                    lda      Vec_Loop_Count+1 
                    anda     #%00100000 
                    beq      go_lightOn 
                    clra     
                    jsr      Intensity_a 
                    bra      contLight 

go_lightOn 
                    lda      #$3f 
                    jsr      Intensity_a 
contLight 
                    ldu      #go_pressButton 
                    ldd      #$90a0 
                    jsr      syncPrintStrd 
                    JSR      getButtonState               ; get button status 
                    anda     #%1111                       ; button 4 unpause 
                    cmpa     #%1111 
                    beq      go_notdone 
                    bsr      waitButtonRelease 
                    bra      done_scoring 

waitButtonRelease 
                    JSR      getButtonState               ; get button status 
                    anda     #%1111                       ; button 4 unpause 
                    cmpa     #%1111 
                    bne      waitButtonRelease 
                    rts      

; ..........................
go_notdone 
                    lda      #$3f 
                    jsr      Intensity_a 
; MULTIPLYER
                    ldd      #$e090 
                    ldu      #go_multi 
                    jsr      syncPrintStrd 
                    ldb      multiplyer 
                    lsrb     
                    lsrb     
                    clra     
                    ldu      #StringOutputBuffer_4 
                    jsr      wordToDecString 
                    ldu      #StringOutputBuffer_4 
                    bsr      leadingZeroToSpace 
                    ldd      #$e038 
                    jsr      syncPrintStrd 
; 
; SCORE
                    ldd      #$c090 
                    ldu      #go_score 
                    jsr      syncPrintStrd 
                    ldd      #$c020 
                    ldu      #player_score 
                    jsr      syncPrintStrd 
; 
                    jmp      go_loop 

done_scoring 
; if played a saved game,  no high score / achievements possible!
                    lda      flashAvailable 
                    anda     #SAVEGAME_IS_ACTIVE_BIT      ; game available 
                    bne      backFromEndOfGameAchievementTest 
                    lda      secretFlags 
                    ora      inGameSecrets 
                    sta      secretFlags 
REPLACE_1_2_endOfGameAchievementTest_varFrom0_1           ;  bank 2 replace 
                    ldx      #0                           ; endOfGameAchievementTest 
                    jmp      jmpBankIRQ2X 

backFromEndOfGameAchievementTest 
REPLACE_1_2_gameOver_varFrom1_11 
                    ldx      #0 
                    jmp      jmpBankIRQ3X                 ; gameOver 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; strng in u
; trashes d. keeps u
leadingZeroToSpace 
                    clra     
againlsz1 
                    ldb      # '0'
                    cmpb     a,u 
                    bne      outHerelsp 
                    ldb      # ' '
                    stb      a,u 
                    inca     
                    bra      againlsz1 

outHerelsp 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
go_percent 
                    db       "HIT PERCENTAGE:", $80
go_score 
                    db       "FINAL SCORE:", $80
go_multi 
                    db       "RANK MULTIPLIER: x", $80
go_secret 
                    db       "SECRET BONUS:", $80
go_levels 
                    db       "LEVELS PLAYED:", $80
go_pressButton 
                    db       "PRESS ANY BUTTON", $80
se_bo 
                    dw       sebo0, sebo1, sebo2, sebo3, sebo4, sebo5, sebo6, sebo7 
sebo0               db       "   ",$80
sebo1               db       "10000",$80
sebo2               db       "20000",$80
sebo3               db       "30000",$80
sebo4               db       "40000",$80
sebo5               db       "50000",$80
sebo6               db       "60000",$80
sebo7               db       "70000",$80
;***************************************************************************
; player routines from different vabks accessable
playAKSMusic 
playAKSMusicNoLoop 
                    jsr      PLY_PLAY 
                    jmp      do_ym_sound2 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
offsetAndScales                                           ;        for mini diamonds 
                    db       $00,$70, $10 
                    db       $25,$67, $08 
                    db       $35,$43, $13 
                    db       $55,$30, $11 
                    db       $78,$90, $14 
                    db       $82,$a8, $07 
                    db       $a8,$90, $09 
                    db       $c5,$55, $11 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
doSuperDiamond                                            ;#isfunction  
; display superDiamond Intro
                    clr      diamondCount 
                    lda      #100                         ; 2 seconds 
                    sta      levelEnemyCount 
SuperDiamondIntroLoop 
REPLACE_1_2_displayAMainRound_varFrom1_81 
                    ldx      #0                           ; displayAMainRound 
                    jsr      jsrBank3_fromShift_1 
                    jsr      Intensity_3F 
REPLACE_1_2_displaySuperDiamondsIntro_varFrom0_3          ;  bank 0 replace 
                    ldx      #0                           ; displaySuperDiamondsIntro 
                    jsr      jsrBank2_from1_SHIFT 
                    dec      levelEnemyCount 
                    bne      SuperDiamondIntroLoop        ; and repeat "forever" 
;..................................................
SuperDiamondIntroDone 
                    lda      #ANIMATION_DELAY 
                    sta      animDelayCounter 
                    clr      superDiamondAnimCounter 
                    ldd      #$7f00 
                    std      superDiamondPosition 
                    LDA      #1 
                    STA      superDiamondAnimCounter2 
 if  VECFEVER = 1 
; BIT_FLAG_PLAY_YM    =        %10000000 
                    lda      playSoundFlags 
                    ora      #BIT_FLAG_PLAY_YM 
                    sta      playSoundFlags 
REPLACE_1_2_Diamond3Adata_varFromIRQ0_10 
                    ldx      #0                           ;Diamond3Adata 
                    stx      sfx_pointer_1 
REPLACE_1_2_Diamond3Bdata_varFromIRQ0_10 
                    ldx      #0                           ;Diamond3Bdata 
                    stx      sfx_pointer_2 
REPLACE_1_2_Diamond3Cdata_varFromIRQ0_10 
                    ldx      #0                           ;Diamond3Cdata 
                    stx      sfx_pointer_3 
 else  
                    ldx      #Diamond3Adata 
                    stx      sfx_pointer_1 
                    ldx      #Diamond3Bdata 
                    stx      sfx_pointer_2 
                    ldx      #Diamond3Cdata 
                    stx      sfx_pointer_3 
 endif  
;..................................................
SuperDiamondMainLoop: 
REPLACE_1_2_displayAMainRound_varFrom1_82 
                    ldx      #0                           ; displayAMainRound 
                    jsr      jsrBank3_fromShift_1 
 if  VECFEVER = 1 
REPLACE_1_2_doymsound100_varFromIRQ0_592 
                    ldx      #0                           ;doymsound100 
                    jsr      jsrBank0X 
 endif  
                    JSR      Intensity_5F                 ; Sets the intensity of the 
                    lda      #8 
                    sta      tmp1 
                    ldy      #offsetAndScales 
loopLittleOnes 
                    ldu      #SimpleDiamond 
                    LDd      superDiamondPosition         ; Text position relative Y 
                    suba     ,y+ 
                    subb     ,y+ 
                    tfr      d,x 
                    ldb      #$60 
                    lda      ,y+ 
                    JSR      draw_synced_list             ; Vectrex BIOS print routine 
                    _ZERO_VECTOR_BEAM  
                    dec      tmp1 
                    bne      loopLittleOnes 
                                                          ; vector beam to $5f 
againSD 
                    CLRA     
                    LDB      superDiamondAnimCounter      ; current animation frame 
                    ASLB                                  ; times two since it is a word pointer 
                    ROLA     
                    LDU      #SuperDiamondAnim            ; address of data 
                    LDU      d,U 
                    bne      animOkSD 
                    clr      superDiamondAnimCounter 
                    bra      againSD 

animOkSD 
                    LDx      superDiamondPosition         ; Text position relative Y 
                    ldd      #$4060                       ; scale positioning 
                                                          ;lda #$40 ; scale move in list 
                    JSR      draw_synced_list             ; Vectrex BIOS print routine 
                    dec      superDiamondAnimCounter2 
                    BNE      SuperDiamondMainLoop 
                    LDA      #1 
                    STA      superDiamondAnimCounter2 
                    INC      superDiamondAnimCounter 
                    LDx      superDiamondPosition         ; Text position relative Y 
                    leax     -$300,x 
                    stx      superDiamondPosition 
                    cmpx     #-$7a00 
;                    let      some other diamonds fall? 
                    bgt      SuperDiamondMainLoop         ; and repeat forever 
endofSuperDiamondFall 
;..................................................
; EXTRO
                    lda      #100                         ; 2 seconds 
                    sta      levelEnemyCount 
SuperDiamondExtroLoop 
 if  VECFEVER = 1 
REPLACE_1_2_doymsound100_varFromIRQ0_595 
                    ldx      #0                           ;doymsound100 
                    jsr      jsrBank0X 
 endif  
REPLACE_1_2_displayAMainRound_varFrom1_84 
                    ldx      #0                           ; displayAMainRound 
                    jsr      jsrBank3_fromShift_1 
                    jsr      Intensity_3F 
REPLACE_1_2_displaySuperDiamondsExtro_varFrom0_5          ;  bank 0 replace 
                    ldx      #0                           ; displaySuperDiamondsExtro 
                    jsr      jsrBank2_from1_SHIFT 
                    dec      levelEnemyCount 
                    bne      SuperDiamondExtroLoop        ; and repeat "forever" 
 if  VECFEVER = 1 
; BIT_FLAG_PLAY_YM    =        %10000000 
                    lda      playSoundFlags 
                    anda     #$ff-BIT_FLAG_PLAY_YM 
                    sta      playSoundFlags 
 endif  
                    jsr      beQuiet 
; 5000 CASH
                    ldu      playerCashW 
                    leau     5000,u 
                    stu      playerCashW 
; 100000 Points
                    bsr      addScore100000 
;..................................................
; go back
REPLACE_1_2_noSuperDiamonds_varFrom1_5 
                    ldx      #0                           ; noSuperDiamonds 
                    jmp      jmpBankIRQ3X 

;..................................................
addScore100000                                            ;#isfunction  
REPLACE_1_2_addScore25000_varFrom1_1 
                    ldx      #0                           ; addScore25000 
                    jsr      jsrBank3_fromShift_1 
REPLACE_1_2_addScore25000_varFrom1_2 
                    ldx      #0                           ; addScore25000 
                    jsr      jsrBank3_fromShift_1 
REPLACE_1_2_addScore25000_varFrom1_3 
                    ldx      #0                           ; addScore25000 
                    jsr      jsrBank3_fromShift_1 
REPLACE_1_2_addScore25000_varFrom1_4 
                    ldx      #0                           ; addScore25000 
                    jmp      jsrBank3_fromShift_1 

;.............................................................................
;.............................................................................
;.............................................................................
                    struct   BHEmitter 
                    ds       START_ANGLE, 1 
                    ds       FILLER1,1 
                    ds       BEHAVIOUR, 2 
                    ds       NEXT_OBJECT, 2 
                    ds       FILLER2, 3 
                    end struct 
                    struct   BHParticle 
                    ds       BH_SCALE, 1 
                    ds       BH_ANGLE, 1 
                    ds       BH_BEHAVIOUR, 2 
                    ds       BH_NEXT_OBJECT, 2 
                    ds       BH_ANIM_COUNTER, 0           ; for fighter 
                    ds       BH_VLIST, 1                  ; index - not the list itself 
                    ds       BH_LISTSCALE, 1 
                    ds       BH_REMAIN, 1 
                    end struct 
;.............................................................................
;.............................................................................
BH_NEW_OBJECT       macro    
                    ldy      bh_plist_empty_head 
                    cmpy     #OBJECT_LIST_COMPARE_ADDRESS 
                    bls      bhcs_done_no\? 
                                                          ; set the new empty head 
                    ldd      NEXT_OBJECT,y                ; the next in out empty list will be the new 
                    std      bh_plist_empty_head          ; head of our empty list 
                                                          ; load last of current object list 
; the old head is always our next
                    ldd      bh_plist_objects_head 
                    std      NEXT_OBJECT,y 
; newobject is always head
                    sty      bh_plist_objects_head 
                    inc      bhCount                      ; and remember that we created a new object 
bhcs_done_no\? 
                    endm     
BH_UPDATE_EMPTY_LIST  macro  
                    dec      bhCount 
                    ldy      bh_plist_empty_head          ; set u free, as new free head 
                    sty      NEXT_OBJECT,x                ; load to u the next linked list element 
                    stx      bh_plist_empty_head 
                    endm     
;.............................................................................
; must be called from RollOver place
levelRollOverAchievementTest                              ;#isfunction  
; as good a place as any other
; do a roll over intermission
; ---  jsr rollOverIntermission
                    IRQ_TO_0_SHIFT  
                    ldd      #0 
                    std      sfx_pointer_1 
                    std      sfx_pointer_2 
                    std      sfx_pointer_3 
                    std      introWaveCurrentPattern 
                    JSR      getButtonState               ; get button status 
; init black hole
;?                    ldd      #bh_pobject_list_end 
                    clr      animCounterBL 
                    clr      animStepBL 
                    clr      bhCount 
                    ldd      #rollOverLoop                ; explosions jump back to here after all have been rendered 
                    std      BH_PARTICLES_DONE_A 
; setup objects
                    lda      #PARTICLE_BH_MAX_COUNT 
                    ldu      #bh_pobject_list 
                    stu      bh_plist_empty_head 
                    ldy      #BH_PARTICLES_DONE 
bh_next_list_exentry 
                    leax     BHParticle,u 
                    stx      BH_NEXT_OBJECT,u 
                    leau     ,x 
                    deca     
                    bne      bh_next_list_exentry 
                    leau     -BHParticle,u 
                    sty      BH_NEXT_OBJECT,u 
                    sty      bh_plist_objects_head 
                    jsr      buildBlackHoleEmitter 
                    lda      #60                          ;0 ; start angle 
                    sta      START_ANGLE,u 
;
                    jsr      buildBlackHoleEmitter 
                    lda      #160                         ;137 ; start angle 
                    sta      START_ANGLE,u 
; --- emitt ship
                    BH_NEW_OBJECT  
                    cmpy     #OBJECT_LIST_COMPARE_ADDRESS 
                    bls      bhnoNewBHParticleFighter 
                    RANDOM_B  
                    andb     #%10001111 
                    tfr      b,a 
                    addb     START_ANGLE+u_offset1,s      ; start angle 
                    lda      #%1111 
                    sta      BH_LISTSCALE, y              ; pseudo random object size! 
                    adda     #$80                         ; start scale 
                    std      BH_SCALE,y 
                    ldd      #bhParticleBehaviourFighter 
                    std      BEHAVIOUR, y 
                    lda      #50 
                    sta      BH_REMAIN , y 
                    clr      BH_ANIM_COUNTER, y 
bhnoNewBHParticleFighter 
; ---
;
                    sts      bulletSpawnAt 
rollOverLoop 
                    ldd      sfx_pointer_1 
                    bne      nosfx1End 
                    ldx      #blackhole1Data              ; 
                    stx      sfx_pointer_1 
nosfx1End 
                    ldd      sfx_pointer_2 
                    bne      nosfx2End 
                    ldx      #blackhole2Data              ; 
                    stx      sfx_pointer_2 
nosfx2End 
                    ldd      sfx_pointer_3 
                    bne      nosfx3End 
                    ldx      #blackhole3Data              ; 
                    stx      sfx_pointer_3 
nosfx3End 
                    lds      bulletSpawnAt 
                    jSR      Wait_Recal_noShift           ; Vectrex BIOS recalibration 
                    jsr      do_ym_sound2 
                    ldd      introWaveCurrentPattern 
                    addd     #1 
                    std      introWaveCurrentPattern 
                    cmpd     #150 
                    blo      noButtonTest 
                    JSR      getButtonState               ; get button status 
                    andb     #%00000011 
                    cmpb     #1 
                    beq      exitRollOverIntermission 
noButtonTest 
                    dec      animCounterBL 
                    bpl      bhnostepChange 
                    lda      #ANIMDELAY 
                    sta      animCounterBL 
                    dec      animStepBL 
                    dec      animStepBL 
                    bpl      bhnostepChange 
                    lda      #MAX_ANIM 
                    sta      animStepBL 
bhnostepChange 
; pointer to circle data - is a constant!
                    ldy      #bhcircleData 
                    lds      bh_plist_objects_head 
                    puls     d,pc                         ; (D = y,x) ; do all objects 
blackHoleFinished 
                    lds      bulletSpawnAt 
REPLACE_1_2_doBHText_varFromIRQ0_2 
                    ldx      #0                           ; doBHText 
                    jmp      jmpBankIRQ0Shift 

returnFromBHText 
exitRollOverIntermission 
; after the black hole it is necessary to reInit Bonus stuff
REPLACE_1_2_initNormalBonus_varFrom1_4 
                    ldx      #0                           ; initNormalBonus 
                    jsr      jsrBank3_fromShift_1 
                    IRQ_TO_0_T1  
; if played a saved game,  no high score / achievements possible!
                    lda      flashAvailable 
                    anda     #SAVEGAME_IS_ACTIVE_BIT      ; game available 
                    lbne     rollOverCheckDone 
;---
;ACHIEVEMENT_FLAG_BYTE3_BLADEMASTER_RANK5 = %00000001 ; checked each roll over
;ACHIEVEMENT_FLAG_BYTE3_BLADEMASTER_RANK4 = %00000010
;ACHIEVEMENT_FLAG_BYTE3_BLADEMASTER_RANK3 = %00000100
;ACHIEVEMENT_FLAG_BYTE3_BLADEMASTER_RANK2 = %00001000
;ACHIEVEMENT_FLAG_BYTE3_BLADEMASTER_RANK1 = %00010000
;- player easy thru: Blademaster Rank 5 rewards -> chose to start at normal / buy laser in shop
;- player normal thru: Blademaster Rank 4 -> chose to start at hard
;- player hard thru: Blademaster Rank 3 -> chose to start at impossible
;- player impossible thru: Blademaster Rank 2 -> chose to start at super impossible
;- player super impossible thru: Blademaster Rank 1 -> congrats!
                    lda      achievements + 2 
                    bita     #ACHIEVEMENT_FLAG_BYTE3_BLADEMASTER_RANK5 
                    bne      rollOver5Done 
                    ldb      difficulty 
                    cmpb     #1 
                    bne      rollOverCheckDone 
displayBlademasterRank5Achievement 
;                    lda      achievements + 2 
                    ora      #ACHIEVEMENT_FLAG_BYTE3_BLADEMASTER_RANK5 
                    sta      achievements + 2 
                    ldb      #A_BLADEMASTER_RANK_5 
REPLACE_1_2_displayAchievement_varFrom0_5 
                    ldx      #0                           ; displayAchievement 
                    jsr      jsrBank2_fromT1_1 
                    bra      rollOverCheckDone 

rollOver5Done 
;                    lda      achievements + 2 
                    bita     #ACHIEVEMENT_FLAG_BYTE3_BLADEMASTER_RANK4 
                    bne      rollOver4Done 
                    ldb      difficulty 
                    cmpb     #2 
                    bne      rollOverCheckDone 
displayBlademasterRank4Achievement 
;                    lda      achievements + 2 
                    ora      #ACHIEVEMENT_FLAG_BYTE3_BLADEMASTER_RANK4 
                    sta      achievements + 2 
                    ldb      #A_BLADEMASTER_RANK_4 
REPLACE_1_2_displayAchievement_varFrom0_4 
                    ldx      #0                           ; displayAchievement 
                    jsr      jsrBank2_fromT1_1 
                    bra      rollOverCheckDone 

rollOver4Done 
;                    lda      achievements + 2 
                    bita     #ACHIEVEMENT_FLAG_BYTE3_BLADEMASTER_RANK3 
                    bne      rollOver3Done 
                    ldb      difficulty 
                    cmpb     #3 
                    bne      rollOverCheckDone 
displayBlademasterRank3Achievement 
;                    lda      achievements + 2 
                    ora      #ACHIEVEMENT_FLAG_BYTE3_BLADEMASTER_RANK3 
                    sta      achievements + 2 
                    ldb      #A_BLADEMASTER_RANK_3 
REPLACE_1_2_displayAchievement_varFrom0_3 
                    ldx      #0                           ; displayAchievement 
                    jsr      jsrBank2_fromT1_1 
                    bra      rollOverCheckDone 

rollOver3Done 
;                    lda      achievements + 2 
                    bita     #ACHIEVEMENT_FLAG_BYTE3_BLADEMASTER_RANK2 
                    bne      rollOver2Done 
                    ldb      difficulty 
                    cmpb     #4 
                    bne      rollOverCheckDone 
displayBlademasterRank2Achievement 
;                    lda      achievements + 2 
                    ora      #ACHIEVEMENT_FLAG_BYTE3_BLADEMASTER_RANK2 
                    sta      achievements + 2 
                    ldb      #A_BLADEMASTER_RANK_2 
REPLACE_1_2_displayAchievement_varFrom0_2 
                    ldx      #0                           ; displayAchievement 
                    jsr      jsrBank2_fromT1_1 
                    bra      rollOverCheckDone 

rollOver2Done 
;                    lda      achievements + 2 
                    bita     #ACHIEVEMENT_FLAG_BYTE3_BLADEMASTER_RANK1 
                    bne      rollOver1Done 
                    ldb      difficulty 
                    cmpb     #5 
                    bne      rollOverCheckDone 
displayBlademasterRank1Achievement 
;                    lda      achievements + 2 
                    ora      #ACHIEVEMENT_FLAG_BYTE3_BLADEMASTER_RANK1 
                    sta      achievements + 2 
                    ldb      #A_BLADEMASTER_RANK_1 
REPLACE_1_2_displayAchievement_varFrom0_1 
                    ldx      #0                           ; displayAchievement 
                    jsr      jsrBank2_fromT1_1 
rollOver1Done 
rollOverCheckDone 
REPLACE_1_2_backFromlevelRollOverAchievementTest_varFrom1_1 
                    ldx      #0                           ; backFromlevelRollOverAchievementTest 
                    jmp      jmpBank3_from1 

;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; complete Black Hole!
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; circleData
PARTICLE_BH_MAX_COUNT  =     80                           ; max with below RAM 
ANIMDELAY           =        3 
MAX_ANIM            =        24                           ; double of anim steps, since its a word pointer 
animCounterBL       =        starlist_empty_head 
animStepBL          =        starlist_empty_head+1 
BH_PARTICLES_DONE_A  =       STARS_DONE_A                 ; 
BH_PARTICLES_DONE   =        BH_PARTICLES_DONE_A-2 
bh_plist_empty_head  =       enemylist_empty_head 
bh_plist_objects_head  =     enemylist_objects_head 
bhCount             =        enemyCount 
bh_pobject_list     =        shotobject_list 
bh_pobject_list_end  =       bh_pobject_list + BHParticle*(PARTICLE_BH_MAX_COUNT) 
bhnewObject                                               ;#isfunction  
                    ldu      bh_plist_empty_head 
                    cmpu     #OBJECT_LIST_COMPARE_ADDRESS 
                    bls      bhcs_done_no 
                                                          ; set the new empty head 
                    ldd      NEXT_OBJECT,u                ; the next in out empty list will be the new 
                    std      bh_plist_empty_head          ; head of our empty list 
                                                          ; load last of current object list 
; the old head is always our next
                    ldd      bh_plist_objects_head 
                    std      NEXT_OBJECT,u 
; newobject is always head
                    stu      bh_plist_objects_head 
                    inc      bhCount                      ; and remember that we created a new object 
bhcs_done_no 
                    rts      

; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bhdestroyPObject                                          ;#isfunction  
; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; in ds+u_offset1 pointer to the object that must be removed
; destroys x, y 
; puls from ds the next object behaviour
; 
; this version is called at the end of an explosion called by "behaviours"
;
                    leax     u_offset1,s                  ; x -> pointer object struture (correction of offset) 
                    cmpx     bh_plist_objects_head        ; is it the first? 
                    bne      bhwas_not_first_enem         ; no -> jump 
bhwas_first_enem 
                    lds      NEXT_OBJECT,x                ; s pointer to next objext 
                    sts      bh_plist_objects_head        ; the next object will be the first 
                    dec      bhCount 
                    bra      bhpRemoveDone 

bhwas_not_first_enem                                      ;      find previous, go thru all objects from first and look where "I" am the next... 
                    ldy      bh_plist_objects_head        ; start at list head 
bhtry_next_enem 
                    cmpx     NEXT_OBJECT,y                ; am I the next object of the current investigated list element 
                    beq      bhfound_next_switch_enem     ; jup -> jump 
                    ldy      NEXT_OBJECT,y                ; otherwise load the next as new current 
                    bra      bhtry_next_enem              ; and search further 

bhfound_next_switch_enem 
                    lds      NEXT_OBJECT,x                ; we load "our" next object to s 
                    sts      NEXT_OBJECT,y                ; and store our next in the place of our previous next and thus eleminate ourselfs 
                    BH_UPDATE_EMPTY_LIST                  ; and clean up the empties 
bhpRemoveDone 
; do a clean ending - which is usually done at the end of "SmartDraw"
                    lda      #$7f 
                    STa      <VIA_t1_cnt_lo 
                    _ZERO_VECTOR_BEAM  
                    ldy      #bhcircleData 
                    MY_MOVE_TO_A_END  
                    puls     d,pc                         ; (D = y,x, X = vectorlist) 
; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
buildBlackHoleEmitter 
                    bsr      bhnewObject 
                    cmpu     #OBJECT_LIST_COMPARE_ADDRESS 
                    bls      bhnoNewBHEmitter 
                    ldd      #blackHoleEmitterBehaviour 
                    std      BEHAVIOUR, u 
bhnoNewBHEmitter 
                    rts      

;...........................................................................
blackHoleEmitterBehaviour 
                    RANDOM_A  
                    cmpa     #40 
                    bhi      bhnoNewBHParticle 
                    BH_NEW_OBJECT  
                    cmpy     #OBJECT_LIST_COMPARE_ADDRESS 
                    bls      bhnoNewBHParticle 
                    RANDOM_B  
                    andb     #%10001111 
                    tfr      b,a 
                    addb     START_ANGLE+u_offset1,s      ; start angle 
                    anda     #%0111 
                    sta      BH_LISTSCALE, y              ; pseudo random object size! 
                    bne      bhnoZero 
                    lda      #5 
                    sta      BH_LISTSCALE, y              ; start object scale 
bhnoZero 
                    adda     #$80                         ; start scale 
                    std      BH_SCALE,y 
                    ldd      #bhParticleBehaviour 
                    std      BEHAVIOUR, y 
                    lda      #50 
                    sta      BH_REMAIN , y 
                    RANDOM_A  
                    anda     #%11 
                    asla     
                    sta      BH_VLIST, y 
bhnoNewBHParticle 
                    ldy      #bhcircleData 
                    lds      NEXT_OBJECT+u_offset1,s      ; preload next user stack 
                    puls     d,pc 
;...........................................................................
bhParticleBehaviour 
; position to scale in A
                    sta      <VIA_t1_cnt_lo 
                    clra     
; angle in B
                    MY_LSL_D  
                    anda     #1                           ; modulo 512 
                    ldd      d,y 
                    asra     
                    asra     
                    suba     #150 
                    adda     BH_REMAIN+u_offset1,s 
                    adda     BH_REMAIN+u_offset1,s 
                    adda     BH_REMAIN+u_offset1,s 
                    adda     BH_REMAIN+u_offset1,s 
                    sta      tmp1 
                    MY_MOVE_TO_D_START  
                    inc      BH_ANGLE+u_offset1,s 
; scale reduce in relation to scale (further out -> slower)
; if scale > 100, than only each 4th round...
                    lda      BH_SCALE+u_offset1,s 
                    cmpa     #110 
                    blo      smaller100 
                    ldb      Vec_Loop_Count+1 
                    andb     #%11                         ; at first reduce scaling only each 4th round 
                    bne      noScaling 
                    dec      BH_SCALE+u_offset1,s 
                    bra      noScaling 

smaller100 
                    ldb      Vec_Loop_Count+1 
                    andb     #1 
                    bne      noSpeedUp 
                    inc      BH_ANGLE+u_offset1,s 
noSpeedUp 
                    cmpa     #80 
                    bhi      nospeeding 
                    ldb      Vec_Loop_Count+1 
                    andb     #1 
                    beq      nospeeding 
                    inc      BH_ANGLE+u_offset1,s 
nospeeding 
                    cmpa     #60 
                    blo      smaller80 
                    ldb      Vec_Loop_Count+1 
                    andb     #$01 
                    bne      noScaling 
                    dec      BH_SCALE+u_offset1,s 
                    bra      noScaling 

smaller80 
                    ldb      Vec_Loop_Count+1 
                    andb     #1 
                    bne      noSpeedUp3 
                    inc      BH_ANGLE+u_offset1,s 
noSpeedUp3 
                    cmpa     #30 
                    blo      smaller60 
                    dec      BH_SCALE+u_offset1,s 
                    bra      noScaling 

smaller60 
                    inc      BH_ANGLE+u_offset1,s 
                    dec      BH_SCALE+u_offset1,s 
                    dec      BH_SCALE+u_offset1,s 
INNERMOST_CIRCLE    =        20 
                    cmpa     #INNERMOST_CIRCLE 
                    bhi      noScaling 
                    lda      #INNERMOST_CIRCLE 
                    sta      BH_SCALE+u_offset1,s 
                    dec      BH_REMAIN+u_offset1,s 
                    lbeq     bhdestroyPObject 
                    inc      BH_ANGLE+u_offset1,s 
                    inc      BH_ANGLE+u_offset1,s 
; brightness in relation to scale (further out less bright)
; disappear at scale XXX
; object depending 
noScaling 
; object scaling
                    lda      BH_LISTSCALE+u_offset1,s     ; start angle 
                    sta      <VIA_t1_cnt_lo 
                    lda      BH_VLIST+u_offset1,s         ; preload next user stack 
                    ldu      #debrisList2 
                    leau     a,u 
                    ldu      ,u 
                    ldb      animStepBL 
; load smartlist address to U
                    ldu      b,u 
                    lda      BH_SCALE+u_offset1,s 
                    nega     
                    adda     #147 
                    bpl      noInOverflow 
                    lda      #127 
noInOverflow 
                    ldb      BH_REMAIN+u_offset1,s 
                    cmpb     #50 
                    beq      intok 
                    tfr      b,a 
                    asla     
                    bra      intremain 

intok 
                    ldb      tmp1 
                    subb     #30 
                    asrb     
                    stb      tmp1 
                    suba     tmp1 
intremain 
                    lds      NEXT_OBJECT+u_offset1,s      ; preload next user stack 
                    MY_MOVE_TO_B_END  
                    _INTENSITY_A  
                    clra     
                    pulu     b,x,pc 
bhParticleBehaviourFighter 
; position to scale in A
                    sta      <VIA_t1_cnt_lo 
                    clra     
; angle in B
                    MY_LSL_D  
                    anda     #1                           ; modulo 512 
                    ldd      d,y 
                    asra     
                    asra     
                    suba     #150 
                    adda     BH_REMAIN+u_offset1,s 
                    adda     BH_REMAIN+u_offset1,s 
                    adda     BH_REMAIN+u_offset1,s 
                    adda     BH_REMAIN+u_offset1,s 
                    sta      tmp1 
                    MY_MOVE_TO_D_START  
                    inc      BH_ANGLE+u_offset1,s 
; scale reduce in relation to scale (further out -> slower)
; if scale > 100, than only each 4th round...
                    lda      BH_SCALE+u_offset1,s 
                    cmpa     #110 
                    blo      smaller100_f 
                    ldb      Vec_Loop_Count+1 
                    andb     #%111                        ; at first reduce scaling only each 4th round 
                    bne      noScaling_f 
                    dec      BH_SCALE+u_offset1,s 
                    bra      noScaling_f 

smaller100_f 
                    ldb      Vec_Loop_Count+1 
                    andb     #1 
                    bne      noSpeedUp_f 
                    inc      BH_ANGLE+u_offset1,s 
noSpeedUp_f 
                    cmpa     #80 
                    bhi      nospeeding_f 
                    ldb      Vec_Loop_Count+1 
                    andb     #11 
                    beq      nospeeding_f 
                    inc      BH_ANGLE+u_offset1,s 
nospeeding_f 
                    cmpa     #60 
                    blo      smaller80_f 
                    ldb      Vec_Loop_Count+1 
                    andb     #$01 
                    bne      noScaling_f 
                    dec      BH_SCALE+u_offset1,s 
                    bra      noScaling_f 

smaller80_f 
                    ldb      Vec_Loop_Count+1 
                    andb     #1 
                    bne      noSpeedUp3_f 
                    inc      BH_ANGLE+u_offset1,s 
noSpeedUp3_f 
                    cmpa     #30 
                    blo      smaller60_f 
                    dec      BH_SCALE+u_offset1,s 
                    bra      noScaling_f 

smaller60_f 
                    inc      BH_ANGLE+u_offset1,s 
                    dec      BH_SCALE+u_offset1,s 
                    dec      BH_SCALE+u_offset1,s 
                    cmpa     #INNERMOST_CIRCLE 
                    bhi      noScaling_f 
                    lda      #INNERMOST_CIRCLE 
                    sta      BH_SCALE+u_offset1,s 
                    dec      BH_REMAIN+u_offset1,s 
                    lbeq     blackHoleFinished            ;bhdestroyPObject 
                    inc      BH_ANGLE+u_offset1,s 
                    inc      BH_ANGLE+u_offset1,s 
; brightness in relation to scale (further out less bright)
; disappear at scale XXX
; object depending 
noScaling_f 
; object scaling
                    lda      BH_LISTSCALE+u_offset1,s     ; start angle 
                    sta      <VIA_t1_cnt_lo 
                    ldu      #SpinningFighter 
                    ldb      BH_ANIM_COUNTER+u_offset1,s  ; preload next user stack 
                    lda      animCounterBL 
                    cmpa     #ANIMDELAY 
                    bne      noNewAnimFighter 
                    incb     
                    stb      BH_ANIM_COUNTER+u_offset1,s  ; preload next user stack 
                    lslb     
                    ldu      b,u 
                    bne      uIsOk 
                    clrb     
                    stb      BH_ANIM_COUNTER+u_offset1,s  ; preload next user stack 
                    ldu      #SpinningFighter 
noNewAnimFighter 
                    lslb     
; load smartlist address to U
                    ldu      b,u 
uIsOk 
                    lda      BH_SCALE+u_offset1,s 
                    nega     
                    adda     #147 
                    bpl      noInOverflow_f 
                    lda      #127 
noInOverflow_f 
                    ldb      BH_REMAIN+u_offset1,s 
                    cmpb     #50 
                    beq      intok_f 
                    tfr      b,a 
                    asla     
                    bra      intremain_f 

intok_f 
                    ldb      tmp1 
                    subb     #30 
                    asrb     
                    stb      tmp1 
                    suba     tmp1 
; sta tmp
intremain_f 
                    lds      NEXT_OBJECT+u_offset1,s      ; preload next user stack 
                    MY_MOVE_TO_B_END  
                    _INTENSITY_A  
                    clra     
                    pulu     b,x,pc 
bhcircleData 
                    db       $7F, $00                     ; 0degrees: 0 
                    db       $7E, $FD                     ; 1degrees: 1 
                    db       $7E, $FA                     ; 2degrees: 2 
                    db       $7E, $F7                     ; 3degrees: 4 
                    db       $7E, $F4                     ; 4degrees: 5 
                    db       $7E, $F1                     ; 5degrees: 7 
                    db       $7D, $EE                     ; 6degrees: 8 
                    db       $7D, $EB                     ; 7degrees: 9 
                    db       $7C, $E8                     ; 8degrees: 11 
                    db       $7B, $E5                     ; 9degrees: 12 
                    db       $7B, $E2                     ; 10degrees: 14 
                    db       $7A, $DE                     ; 1degrees: 15 
                    db       $79, $DB                     ; 2degrees: 16 
                    db       $78, $D9                     ; 3degrees: 18 
                    db       $77, $D6                     ; 4degrees: 19 
                    db       $76, $D3                     ; 5degrees: 21 
                    db       $75, $D0                     ; 6degrees: 22 
                    db       $74, $CD                     ; 7degrees: 23 
                    db       $72, $CA                     ; 8degrees: 25 
                    db       $71, $C7                     ; 9degrees: 26 
                    db       $6F, $C4                     ; 20degrees: 28 
                    db       $6E, $C2                     ; 1degrees: 29 
                    db       $6C, $BF                     ; 2degrees: 31 
                    db       $6B, $BC                     ; 3degrees: 32 
                    db       $69, $BA                     ; 4degrees: 33 
                    db       $67, $B7                     ; 56degrees: 35 
                    db       $65, $B5                     ; 6degrees: 36 
                    db       $63, $B2                     ; 7degrees: 38 
                    db       $61, $B0                     ; 8degrees: 39 
                    db       $5F, $AD                     ; 9degrees: 40 
                    db       $5D, $AB                     ; 30degrees: 42 
                    db       $5B, $A9                     ; 1degrees: 43 
                    db       $59, $A6                     ; 2degrees: 45 
                    db       $57, $A4                     ; 3degrees: 46 
                    db       $54, $A2                     ; 4degrees: 48 
                    db       $52, $A0                     ; 5degrees: 49 
                    db       $50, $9E                     ; 6degrees: 50 
                    db       $4D, $9C                     ; 7degrees: 52 
                    db       $4B, $9A                     ; 8degrees: 53 
                    db       $48, $98                     ; 9degrees: 55 
                    db       $46, $97                     ; 40degrees: 56 
                    db       $43, $95                     ; 1degrees: 57 
                    db       $40, $93                     ; 2degrees: 59 
                    db       $3E, $92                     ; 3degrees: 60 
                    db       $3B, $90                     ; 4degrees: 62 
                    db       $38, $8F                     ; 5degrees: 63 
                    db       $35, $8D                     ; 6degrees: 64 
                    db       $32, $8C                     ; 7degrees: 66 
                    db       $30, $8B                     ; 8degrees: 67 
                    db       $2D, $8A                     ; 9degrees: 69 
                    db       $2A, $89                     ; 50degrees: 70 
                    db       $27, $88                     ; 1degrees: 72 
                    db       $24, $87                     ; 2degrees: 73 
                    db       $21, $86                     ; 3degrees: 74 
                    db       $1E, $85                     ; 4degrees: 76 
                    db       $1B, $84                     ; 5degrees: 77 
                    db       $18, $84                     ; 6degrees: 79 
                    db       $15, $83                     ; 7degrees: 80 
                    db       $11, $83                     ; 8degrees: 81 
                    db       $0E, $82                     ; 9degrees: 83 
                    db       $0B, $82                     ; 60degrees: 84 
                    db       $08, $82                     ; 1degrees: 86 
                    db       $05, $82                     ; 2degrees: 87 
                    db       $02, $82                     ; 2degrees: 88 
                    db       $00, $82                     ; 3degrees: 90 
                    db       $FD, $82                     ; 4degrees: 91 
                    db       $F9, $82                     ; 5degrees: 93 
                    db       $F6, $82                     ; 6degrees: 94 
                    db       $F3, $82                     ; 7degrees: 95 
                    db       $F0, $83                     ; 8degrees: 97 
                    db       $ED, $83                     ; 9degrees: 98 
                    db       $EA, $84                     ; 70degrees: 100 
                    db       $E7, $84                     ; 1degrees: 101 
                    db       $E4, $85                     ; 2degrees: 103 
                    db       $E1, $86                     ; 3degrees: 104 
                    db       $DE, $86                     ; 4degrees: 105 
                    db       $DB, $87                     ; 5degrees: 107 
                    db       $D8, $88                     ; 6degrees: 108 
                    db       $D5, $89                     ; 7degrees: 110 
                    db       $D2, $8A                     ; 8degrees: 111 
                    db       $CF, $8C                     ; 9degrees: 112 
                    db       $CC, $8D                     ; 90degrees: 114 
                    db       $C9, $8E                     ; 1degrees: 115 
                    db       $C6, $90                     ; 2degrees: 117 
                    db       $C4, $91                     ; 3degrees: 118 
                    db       $C1, $93                     ; 4degrees: 119 
                    db       $BE, $94                     ; 5degrees: 121 
                    db       $BC, $96                     ; 6degrees: 122 
                    db       $B9, $98                     ; 7degrees: 124 
                    db       $B6, $99                     ; 8degrees: 125 
                    db       $B4, $9B                     ; 9degrees: 127 
                    db       $B1, $9D                     ; 100degrees: 128 
                    db       $AF, $9F                     ; 1degrees: 129 
                    db       $AD, $A1                     ; 2degrees: 131 
                    db       $AA, $A3                     ; 3degrees: 132 
                    db       $A8, $A5                     ; 4degrees: 134 
                    db       $A6, $A8                     ; 5degrees: 135 
                    db       $A4, $AA                     ; 6degrees: 136 
                    db       $A2, $AC                     ; 7degrees: 138 
                    db       $A0, $AE                     ; 8degrees: 139 
                    db       $9E, $B1                     ; 9degrees: 141 
                    db       $9C, $B3                     ; 110degrees: 142 
                    db       $9A, $B6                     ; 1degrees: 143 
                    db       $98, $B8                     ; 2degrees: 145 
                    db       $96, $BB                     ; 3degrees: 146 
                    db       $95, $BE                     ; 4degrees: 148 
                    db       $93, $C0                     ; 5degrees: 149 
                    db       $91, $C3                     ; 6degrees: 151 
                    db       $90, $C6                     ; 7degrees: 152 
                    db       $8E, $C9                     ; 8degrees: 153 
                    db       $8D, $CB                     ; 9degrees: 155 
                    db       $8C, $CE                     ; 120degrees: 156 
                    db       $8B, $D1                     ; 1degrees: 158 
                    db       $8A, $D4                     ; 2degrees: 159 
                    db       $88, $D7                     ; 3degrees: 160 
                    db       $87, $DA                     ; 4degrees: 162 
                    db       $87, $DD                     ; 5degrees: 163 
                    db       $86, $E0                     ; 6degrees: 165 
                    db       $85, $E3                     ; 7degrees: 166 
                    db       $84, $E6                     ; 8degrees: 167 
                    db       $84, $E9                     ; 9degrees: 169 
                    db       $83, $EC                     ; 130degrees: 170 
                    db       $83, $EF                     ; 1degrees: 172 
                    db       $82, $F2                     ; 2degrees: 173 
                    db       $82, $F6                     ; 3degrees: 175 
                    db       $82, $F9                     ; 4degrees: 176 
                    db       $82, $FC                     ; 5degrees: 177 
                    db       $82, $FF                     ; 6degrees: 179 
                    db       $82, $01                     ; 7degrees: 180 
                    db       $82, $04                     ; 8degrees: 182 
                    db       $82, $07                     ; 9degrees: 183 
                    db       $82, $0A                     ; 140degrees: 184 
                    db       $82, $0E                     ; degrees: 186 
                    db       $83, $11                     ; degrees: 187 
                    db       $83, $14                     ; degrees: 189 
                    db       $84, $17                     ; degrees: 190 
                    db       $84, $1A                     ; degrees: 191 
                    db       $85, $1D                     ; degrees: 193 
                    db       $86, $20                     ; degrees: 194 
                    db       $87, $23                     ; degrees: 196 
                    db       $87, $26                     ; degrees: 197 
                    db       $88, $29                     ; degrees: 199 
                    db       $8A, $2C                     ; degrees: 200 
                    db       $8B, $2F                     ; degrees: 201 
                    db       $8C, $32                     ; degrees: 203 
                    db       $8D, $35                     ; degrees: 204 
                    db       $8E, $37                     ; degrees: 206 
                    db       $90, $3A                     ; degrees: 207 
                    db       $91, $3D                     ; degrees: 208 
                    db       $93, $40                     ; degrees: 210 
                    db       $95, $42                     ; degrees: 211 
                    db       $96, $45                     ; degrees: 213 
                    db       $98, $48                     ; degrees: 214 
                    db       $9A, $4A                     ; degrees: 215 
                    db       $9C, $4D                     ; degrees: 217 
                    db       $9E, $4F                     ; degrees: 218 
                    db       $A0, $52                     ; degrees: 220 
                    db       $A2, $54                     ; degrees: 221 
                    db       $A4, $56                     ; degrees: 223 
                    db       $A6, $58                     ; degrees: 224 
                    db       $A8, $5B                     ; degrees: 225 
                    db       $AA, $5D                     ; degrees: 227 
                    db       $AD, $5F                     ; degrees: 228 
                    db       $AF, $61                     ; degrees: 230 
                    db       $B1, $63                     ; degrees: 231 
                    db       $B4, $65                     ; degrees: 232 
                    db       $B6, $67                     ; degrees: 234 
                    db       $B9, $68                     ; degrees: 235 
                    db       $BC, $6A                     ; degrees: 237 
                    db       $BE, $6C                     ; degrees: 238 
                    db       $C1, $6D                     ; degrees: 239 
                    db       $C4, $6F                     ; degrees: 241 
                    db       $C6, $70                     ; degrees: 242 
                    db       $C9, $72                     ; degrees: 244 
                    db       $CC, $73                     ; degrees: 245 
                    db       $CF, $74                     ; degrees: 247 
                    db       $D2, $76                     ; degrees: 248 
                    db       $D5, $77                     ; degrees: 249 
                    db       $D8, $78                     ; degrees: 251 
                    db       $DB, $79                     ; degrees: 252 
                    db       $DE, $7A                     ; degrees: 254 
                    db       $E1, $7A                     ; degrees: 255 
                    db       $E4, $7B                     ; degrees: 256 
                    db       $E7, $7C                     ; degrees: 258 
                    db       $EA, $7C                     ; degrees: 259 
                    db       $ED, $7D                     ; degrees: 261 
                    db       $F0, $7D                     ; degrees: 262 
                    db       $F3, $7E                     ; degrees: 263 
                    db       $F6, $7E                     ; degrees: 265 
                    db       $F9, $7E                     ; degrees: 266 
                    db       $FD, $7E                     ; degrees: 268 
                    db       $00, $7E                     ; degrees: 269 
                    db       $02, $7E                     ; degrees: 271 
                    db       $05, $7E                     ; degrees: 272 
                    db       $08, $7E                     ; degrees: 273 
                    db       $0B, $7E                     ; degrees: 275 
                    db       $0E, $7E                     ; degrees: 276 
                    db       $11, $7D                     ; degrees: 278 
                    db       $15, $7D                     ; degrees: 279 
                    db       $18, $7C                     ; degrees: 280 
                    db       $1B, $7C                     ; degrees: 282 
                    db       $1E, $7B                     ; degrees: 283 
                    db       $21, $7A                     ; degrees: 285 
                    db       $24, $79                     ; degrees: 286 
                    db       $27, $78                     ; degrees: 287 
                    db       $2A, $77                     ; degrees: 289 
                    db       $2D, $76                     ; degrees: 290 
                    db       $30, $75                     ; degrees: 292 
                    db       $32, $74                     ; degrees: 293 
                    db       $35, $73                     ; degrees: 295 
                    db       $38, $71                     ; degrees: 296 
                    db       $3B, $70                     ; degrees: 297 
                    db       $3E, $6E                     ; degrees: 299 
                    db       $40, $6D                     ; degrees: 300 
                    db       $43, $6B                     ; degrees: 302 
                    db       $46, $69                     ; degrees: 303 
                    db       $48, $68                     ; degrees: 304 
                    db       $4B, $66                     ; degrees: 306 
                    db       $4D, $64                     ; degrees: 307 
                    db       $50, $62                     ; degrees: 309 
                    db       $52, $60                     ; degrees: 310 
                    db       $54, $5E                     ; degrees: 312 
                    db       $57, $5C                     ; degrees: 313 
                    db       $59, $5A                     ; degrees: 314 
                    db       $5B, $57                     ; degrees: 316 
                    db       $5D, $55                     ; degrees: 317 
                    db       $5F, $53                     ; degrees: 319 
                    db       $61, $50                     ; degrees: 320 
                    db       $63, $4E                     ; degrees: 321 
                    db       $65, $4B                     ; degrees: 323 
                    db       $67, $49                     ; degrees: 324 
                    db       $69, $46                     ; degrees: 326 
                    db       $6B, $44                     ; degrees: 327 
                    db       $6C, $41                     ; degrees: 328 
                    db       $6E, $3E                     ; degrees: 330 
                    db       $6F, $3C                     ; degrees: 331 
                    db       $71, $39                     ; degrees: 333 
                    db       $72, $36                     ; degrees: 334 
                    db       $74, $33                     ; degrees: 336 
                    db       $75, $30                     ; degrees: 337 
                    db       $76, $2D                     ; degrees: 338 
                    db       $77, $2A                     ; degrees: 340 
                    db       $78, $27                     ; degrees: 341 
                    db       $79, $25                     ; degrees: 343 
                    db       $7A, $22                     ; degrees: 344 
                    db       $7B, $1E                     ; degrees: 345 
                    db       $7B, $1B                     ; degrees: 347 
                    db       $7C, $18                     ; degrees: 348 
                    db       $7D, $15                     ; degrees: 350 
                    db       $7D, $12                     ; degrees: 351 
                    db       $7E, $0F                     ; degrees: 352 
                    db       $7E, $0C                     ; degrees: 354 
                    db       $7E, $09                     ; degrees: 355 
                    db       $7E, $06                     ; degrees: 357 
                    db       $7E, $03                     ; degrees: 358 
                    db       $7F, $00                     ; degrees: 0 
debrisList2 
                    dw       threeDebris 
                    dw       quadDebris 
                    dw       twoDebris 
                    dw       four2Debris 
quadDebris 
                    DW       quadDebris_12 
                    DW       quadDebris_11 
                    DW       quadDebris_10 
                    DW       quadDebris_9 
                    DW       quadDebris_8 
                    DW       quadDebris_7 
                    DW       quadDebris_6 
                    DW       quadDebris_5 
                    DW       quadDebris_4 
                    DW       quadDebris_3 
                    DW       quadDebris_2 
                    DW       quadDebris_1 
                    DW       quadDebris_0                 ; list of all single vectorlists in this 
                    DW       0 
quadDebris_0 
                    db       $2A, $01, -$23, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $0E, $01, $46, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$70, $01, $1C, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $0E, $01, -$7E 
                    db       $54, $01, $1C 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
quadDebris_1 
                    db       $35, $01, -$0B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$14, $01, $44, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$70, $01, -$1B, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $47, $01, -$69 
                    db       $3D, $01, $40 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
quadDebris_2 
                    db       $35, $01, $0F, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$32, $01, $33, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$57, $01, -$4C, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $70, $01, -$3C 
                    db       $19, $01, $55 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
quadDebris_3 
                    db       $28, $01, $25, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$44, $01, $17, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$29, $01, -$6C, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $7E, $01, -$01 
                    db       -$11, $01, $56 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
quadDebris_4 
                    db       $12, $01, $34, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$47, $01, -$0C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0E, $01, -$73, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $71, $01, $3A 
                    db       -$38, $01, $45 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
quadDebris_5 
                    db       -$08, $01, $36, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$39, $01, -$2B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $41, $01, -$5F, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $49, $01, $67 
                    db       -$51, $01, $23 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
quadDebris_6 
                    db       -$20, $01, $2C, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$1F, $01, -$41, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $66, $01, -$36, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $11, $01, $7E 
                    db       -$58, $01, -$07 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
quadDebris_7 
                    db       -$31, $01, $18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $03, $01, -$47, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $73, $01, -$01, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$2B, $01, $77 
                    db       -$4B, $01, -$2F 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
quadDebris_8 
                    db       -$37, $01, -$02, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $24, $01, -$3D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $67, $01, $35, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$5E, $01, $55 
                    db       -$2D, $01, -$4D 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
quadDebris_9 
                    db       -$30, $01, -$1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $3D, $01, -$26, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $42, $01, $5F, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$7B, $01, $20 
                    db       -$04, $01, -$59 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
quadDebris_10 
                    db       -$1E, $01, -$2E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $47, $01, -$05, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0F, $01, $72, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$7C, $01, -$1D 
                    db       $26, $01, -$50 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
quadDebris_11 
                    db       -$05, $01, -$36, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $42, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$29, $01, $6C, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$60, $01, -$53 
                    db       $47, $01, -$35 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
quadDebris_12 
                    db       $15, $01, -$33, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $2D, $01, $38, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$56, $01, $4D, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$2E, $01, -$76 
                    db       $57, $01, -$0F 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
threeDebris 
                    DW       threeDebris_12 
                    DW       threeDebris_11 
                    DW       threeDebris_10 
                    DW       threeDebris_9 
                    DW       threeDebris_8 
                    DW       threeDebris_7 
                    DW       threeDebris_6 
                    DW       threeDebris_5 
                    DW       threeDebris_4 
                    DW       threeDebris_3 
                    DW       threeDebris_2 
                    DW       threeDebris_1 
                    DW       threeDebris_0                ; list of all single vectorlists in this 
                    DW       0 
threeDebris_0 
                    db       -$2F, $01, -$31, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $5D, $01, $10, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0F, $01, $52, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$4E, $01, -$62 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
threeDebris_1 
                    db       -$13, $01, -$41, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $4B, $01, $39, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$33, $01, $42, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$18, $01, -$7B 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
threeDebris_2 
                    db       $0E, $01, -$43, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $27, $01, $56, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$4C, $01, $22, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $25, $01, -$78 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
threeDebris_3 
                    db       $2B, $01, -$35, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$05, $01, $5F, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$53, $01, -$05, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $58, $01, -$5A 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
threeDebris_4 
                    db       $3E, $01, -$1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$2F, $01, $52, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$48, $01, -$2B, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $77, $01, -$27 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
threeDebris_5 
                    db       $44, $01, $06, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$51, $01, $31, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$2B, $01, -$47, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $7C, $01, $16 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
threeDebris_6 
                    db       $39, $01, $24, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$5E, $01, $07, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$05, $01, -$53, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $63, $01, $4C 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
threeDebris_7 
                    db       $22, $01, $3B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$57, $01, -$26, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $23, $01, -$4C, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $34, $01, $72 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
threeDebris_8 
                    db       $03, $01, $44, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$3B, $01, -$4A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $41, $01, -$33, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$06, $01, $7D 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
threeDebris_9 
                    db       -$1D, $01, $3D, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$12, $01, -$5C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $52, $01, -$0F, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$40, $01, $6B 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
threeDebris_10 
                    db       -$36, $01, $29, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1B, $01, -$5B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $4F, $01, $19, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$6A, $01, $42 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
threeDebris_11 
                    db       -$43, $01, $0B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $42, $01, -$44, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $3B, hi(SMVB_continue_yEqx_single), lo(SMVB_continue_yEqx_single) ; y was $3B 
                    db       -$7D, $01, $09, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
threeDebris_12 
                    db       -$40, $01, -$16, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $59, $01, -$1D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $19, $01, $50, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$72, $01, -$33 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
twoDebris 
                    DW       twoDebris_12 
                    DW       twoDebris_11 
                    DW       twoDebris_10 
                    DW       twoDebris_9 
                    DW       twoDebris_8 
                    DW       twoDebris_7 
                    DW       twoDebris_6 
                    DW       twoDebris_5 
                    DW       twoDebris_4 
                    DW       twoDebris_3 
                    DW       twoDebris_2 
                    DW       twoDebris_1 
                    DW       twoDebris_0                  ; list of all single vectorlists in this 
                    DW       0 
twoDebris_0 
                    db       -$2D, $01, $0E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $59, $01, -$1D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
twoDebris_1 
                    db       -$2E, $01, -$09, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $5C, $01, $10, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
twoDebris_2 
                    db       -$25, $01, -$1D, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $4A, $01, $39, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
twoDebris_3 
                    db       -$13, $01, -$2B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $27, $01, $55, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
twoDebris_4 
                    db       $03, $01, -$2F, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$05, $01, $5D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
twoDebris_5 
                    db       $18, $01, -$28, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$2F, $01, $50, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
twoDebris_6 
                    db       $28, $01, -$18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$4F, $01, $31, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
twoDebris_7 
                    db       $2F, $01, -$03, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$5D, $01, $07, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
twoDebris_8 
                    db       $2B, $01, $13, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$56, $01, -$25, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
twoDebris_9 
                    db       $1D, $01, $25, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$3B, $01, -$49, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
twoDebris_10 
                    db       $08, $01, $2E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$12, $01, -$5B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
twoDebris_11 
                    db       -$0E, $01, $2D, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1B, $01, -$5A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
twoDebris_12 
                    db       -$21, $01, $21, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $41, $01, -$43, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
four2Debris 
                    DW       four2Debris_12 
                    DW       four2Debris_11 
                    DW       four2Debris_10 
                    DW       four2Debris_9 
                    DW       four2Debris_8 
                    DW       four2Debris_7 
                    DW       four2Debris_6 
                    DW       four2Debris_5 
                    DW       four2Debris_4 
                    DW       four2Debris_3 
                    DW       four2Debris_2 
                    DW       four2Debris_1 
                    DW       four2Debris_0                ; list of all single vectorlists in this 
                    DW       0 
four2Debris_0 
                    db       $38, $01, -$36, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, $6D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$28, $01, -$36, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$48, $01, -$09 
                    db       $70, $01, -$2E 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
four2Debris_1 
                    db       $4B, $01, -$16, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$33, $01, $61, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0A, $01, -$43, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$3C, $01, -$29 
                    db       $79, $01, $0B 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
four2Debris_2 
                    db       $4C, $01, $0F, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$59, $01, $3E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $15, $01, -$3F, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$21, $01, -$41 
                    db       $65, $01, $42 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
four2Debris_3 
                    db       $3C, $01, $31, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$6C, $01, $0D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $31, $01, -$2E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$49, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $3B, $01, $6A, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
four2Debris_4 
                    db       $1F, $01, $48, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$66, $01, -$27, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $01, -$12, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $22, $01, -$41 
                    db       $04, $01, $7A 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
four2Debris_5 
                    db       -$06, $01, $4E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$48, $01, -$52, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $41, $01, $0E, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $3C, $01, -$29 
                    db       -$35, $01, $6D 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
four2Debris_6 
                    db       -$29, $01, $42, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$1B, $01, -$6A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $34, $01, $2B, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $48, $01, -$09 
                    db       -$61, $01, $48 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
four2Debris_7 
                    db       -$43, $01, $27, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1A, $01, -$6A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $ee, $01, $3E, hi(SMVB_startDraw_yStays_single), lo(SMVB_startDraw_yStays_single) ; y was $1A 
                    db       $43, $01, $1A, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$77, $01, $12 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
four2Debris_8 
                    db       -$4E, $01, $03, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $49, $01, -$51, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$06, $01, $43, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $30, $01, $36 
                    db       -$73, $01, -$28 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
four2Debris_9 
                    db       -$46, $01, -$21, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $66, $01, -$27, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$25, $01, $39, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $11, $01, $46 
                    db       -$52, $01, -$58 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
four2Debris_10 
                    db       -$2F, $01, -$3E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $6C, $01, $0D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$3A, $01, $21, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$12, $01, $47 
                    db       -$20, $01, -$75 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
four2Debris_11 
                    db       -$0D, $01, -$4D, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $5A, $01, $3E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$43, $01, $02, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$30, $01, $37 
                    db       $19, $01, -$77 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
four2Debris_12 
                    db       $18, $01, -$4A, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $33, $01, $61, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$3C, $01, -$1E, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$44, $01, $1A 
                    db       $4D, $01, -$5D 
                    db       $00, $01, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
SpinningFighter 
                    DW       SpinningFighter_0            ; list of all single vectorlists in this 
                    DW       SpinningFighter_1 
                    DW       SpinningFighter_2 
                    DW       SpinningFighter_3 
                    DW       SpinningFighter_4 
                    DW       SpinningFighter_5 
                    DW       SpinningFighter_6 
                    DW       SpinningFighter_7 
                    DW       SpinningFighter_8 
                    DW       SpinningFighter_9 
                    DW       SpinningFighter_10 
                    DW       SpinningFighter_11 
                    DW       SpinningFighter_12 
                    DW       SpinningFighter_13 
                    DW       0 
SpinningFighter_0 
                    db       -$09, $01, $21, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$19, $01, $18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$17, $01, -$2E, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $19, $01, $0B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$16, $01, $23, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $38, $01, $00 
                    db       $19, $01, -$18, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$24, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $18, $01, -$16, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $23, $01, -$04 
                    db       $18, $01, -$07 
                    db       -$18, $01, -$07 
                    db       -$23, $01, -$04 
                    db       -$18, $01, -$16 
                    db       -$19, $01, -$18 
                    db       $3D, $01, $18, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$24, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0B, $01, -$18, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$38, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $16, $01, $23, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$18, $01, $0A 
                    db       $03, $01, $0C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$14, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
SpinningFighter_1 
                    db       -$16, $01, $1A, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$21, $01, $0B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$01, $01, -$34, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $12, $01, $15, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$23, $01, $16, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $32, $01, $18 
                    db       $21, $01, -$0B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$20, $01, -$0F, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1F, $01, -$0A, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $21, $01, $0C 
                    db       $19, $01, $04 
                    db       -$13, $01, -$11 
                    db       -$1E, $01, -$12 
                    db       -$0C, $01, -$1F 
                    db       -$0C, $01, -$20 
                    db       $2D, $01, $30, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$21, $01, -$10, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $15, $01, -$10, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$33, $01, -$19, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $05, $01, $29, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$1A, $01, -$01 
                    db       -$03, $01, $0C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$12, $01, -$09, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
SpinningFighter_2 
                    db       -$1F, $01, $0E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$23, $01, -$05, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $16, $01, -$2F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $07, $01, $1B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$29, $01, $04, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $23, $01, $2C 
                    db       $22, $01, $05, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$16, $01, -$1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $20, $01, $05, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $19, $01, $18 
                    db       $14, $01, $0F 
                    db       -$09, $01, -$17 
                    db       -$13, $01, -$1E 
                    db       $02, $01, -$21 
                    db       $03, $01, -$22 
                    db       $14, $01, $3F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$17, $01, -$1D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1A, $01, -$06, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$23, $01, -$2C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0E, $01, $27, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$17, $01, -$0C 
                    db       -$07, $01, $0A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$0D, $01, -$10, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
SpinningFighter_3 
                    db       -$22, $01, -$01, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$1D, $01, -$13, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $28, $01, -$21, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$06, $01, $1B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$27, $01, -$0E, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $0D, $01, $37 
                    db       $1D, $01, $13, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$08, $01, -$23, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1B, $01, $12, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $0B, $01, $21 
                    db       $0C, $01, $16 
                    db       $02, $01, -$19 
                    db       -$04, $01, -$23 
                    db       $10, $01, -$1C 
                    db       $12, $01, -$1E 
                    db       -$0A, $01, $41, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$08, $01, -$23, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1A, $01, $05, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$0C, $01, -$36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1E, $01, $1D, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$0F, $01, -$15 
                    db       -$0B, $01, $05, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$04, $01, -$13, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
SpinningFighter_4 
                    db       -$1E, $01, -$10, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$12, $01, -$1E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $32, $01, -$0C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$10, $01, $16, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1E, $01, -$1D, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$0C, $01, $36 
                    db       $12, $01, $1E, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $08, $01, -$23, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $10, $01, $1C, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$04, $01, $23 
                    db       $02, $01, $19 
                    db       $0C, $01, -$16 
                    db       $0B, $01, -$21 
                    db       $1B, $01, -$12 
                    db       $1D, $01, -$13 
                    db       -$25, $01, $36, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $08, $01, -$23, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $15, $01, $10, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $0D, $01, -$37, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$27, $01, $0E, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$05, $01, -$1A 
                    db       -$0C, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $04, $01, -$13, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
SpinningFighter_5 
                    db       -$14, $01, -$1C, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$03, $01, -$22, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $32, $01, $0B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$18, $01, $0C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0E, $01, -$27, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$23, $01, $2C 
                    db       $03, $01, $23, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $17, $01, -$1D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $02, $01, $21, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$13, $01, $1E 
                    db       -$09, $01, $17 
                    db       $14, $01, -$0F 
                    db       $19, $01, -$18 
                    db       $20, $01, -$05 
                    db       $23, $01, -$05 
                    db       -$39, $01, $21, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $16, $01, -$1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0C, $01, $17, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $23, $01, -$2C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$29, $01, -$04, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $07, $01, -$19 
                    db       -$0B, $01, -$05, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $0D, $01, -$10, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
SpinningFighter_6 
                    db       -$06, $01, -$22, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $0C, $01, -$20, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $29, $01, $1F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$1C, $01, $01, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $05, $01, -$29, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$33, $01, $19 
                    db       -$0C, $01, $20, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $21, $01, -$10, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0C, $01, $1F, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$1E, $01, $12 
                    db       -$13, $01, $11 
                    db       $19, $01, -$04 
                    db       $21, $01, -$0C 
                    db       $1F, $01, $0A 
                    db       $21, $01, $0B 
                    db       -$41, $01, $04, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $20, $01, -$0F, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $01, $01, $1A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $32, $01, -$18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$23, $01, -$16, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $12, $01, -$13 
                    db       -$08, $01, -$0A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $12, $01, -$09, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
SpinningFighter_7 
                    db       $09, $01, -$21, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $19, $01, -$18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $17, $01, $2E, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$19, $01, -$0B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $16, $01, -$23, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$38, $01, $00 
                    db       -$19, $01, $18, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $24, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$18, $01, $16, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$23, $01, $04 
                    db       -$18, $01, $07 
                    db       $18, $01, $07 
                    db       $23, $01, $04 
                    db       $18, $01, $16 
                    db       $19, $01, $18 
                    db       -$3D, $01, -$18, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $24, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0B, $01, $18, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $38, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$16, $01, -$23, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $18, $01, -$0A 
                    db       -$03, $01, -$0C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $14, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
SpinningFighter_8 
                    db       $16, $01, -$1A, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $21, $01, -$0B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $01, $01, $34, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$12, $01, -$15, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $23, $01, -$16, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$32, $01, -$18 
                    db       -$21, $01, $0B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $20, $01, $0F, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1F, $01, $0A, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$21, $01, -$0C 
                    db       -$19, $01, -$04 
                    db       $13, $01, $11 
                    db       $1E, $01, $12 
                    db       $0C, $01, $1F 
                    db       $0C, $01, $20 
                    db       -$2D, $01, -$30, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $21, $01, $10, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$15, $01, $10, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $33, $01, $19, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$05, $01, -$29, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $1A, $01, $01 
                    db       $03, $01, -$0C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $12, $01, $09, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
SpinningFighter_9 
                    db       $1F, $01, -$0E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $23, $01, $05, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$16, $01, $2F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$07, $01, -$1B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $29, $01, -$04, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$23, $01, -$2C 
                    db       -$22, $01, -$05, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $16, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$20, $01, -$05, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$19, $01, -$18 
                    db       -$14, $01, -$0F 
                    db       $09, $01, $17 
                    db       $13, $01, $1E 
                    db       -$02, $01, $21 
                    db       -$03, $01, $22 
                    db       -$14, $01, -$3F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $17, $01, $1D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1A, $01, $06, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $23, $01, $2C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0E, $01, -$27, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $17, $01, $0C 
                    db       $07, $01, -$0A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $0D, $01, $10, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
SpinningFighter_10 
                    db       $22, $01, $01, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1D, $01, $13, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$28, $01, $21, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $06, $01, -$1B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $27, $01, $0E, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$0D, $01, -$37 
                    db       -$1D, $01, -$13, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $08, $01, $23, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1B, $01, -$12, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$0B, $01, -$21 
                    db       -$0C, $01, -$16 
                    db       -$02, $01, $19 
                    db       $04, $01, $23 
                    db       -$10, $01, $1C 
                    db       -$12, $01, $1E 
                    db       $0A, $01, -$41, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $08, $01, $23, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1A, $01, -$05, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $0C, $01, $36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1E, $01, -$1D, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $0F, $01, $15 
                    db       $0B, $01, -$05, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $04, $01, $13, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
SpinningFighter_11 
                    db       $1E, $01, $10, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $12, $01, $1E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$32, $01, $0C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $10, $01, -$16, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1E, $01, $1D, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $0C, $01, -$36 
                    db       -$12, $01, -$1E, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$08, $01, $23, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$10, $01, -$1C, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $04, $01, -$23 
                    db       -$02, $01, -$19 
                    db       -$0C, $01, $16 
                    db       -$0B, $01, $21 
                    db       -$1B, $01, $12 
                    db       -$1D, $01, $13 
                    db       $25, $01, -$36, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$08, $01, $23, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$15, $01, -$10, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$0D, $01, $37, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $27, $01, -$0E, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $05, $01, $1A 
                    db       $0C, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$04, $01, $13, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
SpinningFighter_12 
                    db       $14, $01, $1C, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $03, $01, $22, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$32, $01, -$0B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $18, $01, -$0C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0E, $01, $27, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $23, $01, -$2C 
                    db       -$03, $01, -$23, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$17, $01, $1D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$02, $01, -$21, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $13, $01, -$1E 
                    db       $09, $01, -$17 
                    db       -$14, $01, $0F 
                    db       -$19, $01, $18 
                    db       -$20, $01, $05 
                    db       -$23, $01, $05 
                    db       $39, $01, -$21, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$16, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0C, $01, -$17, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$23, $01, $2C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $29, $01, $04, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$07, $01, $19 
                    db       $0B, $01, $05, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$0D, $01, $10, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
SpinningFighter_13 
                    db       $06, $01, $22, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$0C, $01, $20, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$29, $01, -$1F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $1C, $01, -$01, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$05, $01, $29, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $33, $01, -$19 
                    db       $0C, $01, -$20, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$21, $01, $10, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0C, $01, -$1F, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $1E, $01, -$12 
                    db       $13, $01, -$11 
                    db       -$19, $01, $04 
                    db       -$21, $01, $0C 
                    db       -$1F, $01, -$0A 
                    db       -$21, $01, -$0B 
                    db       $41, $01, -$04, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$20, $01, $0F, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$01, $01, -$1A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$32, $01, $18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $23, $01, $16, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$12, $01, $13 
                    db       $08, $01, $0A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$12, $01, $09, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_rts3), lo(SMVB_rts3) 
LineDraw 
                    db       $00, $01, -$3E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $ee, $01, $7C, hi(SMVB_startDraw_yStays_single), lo(SMVB_startDraw_yStays_single) ; y was $00, now $ee 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
gotItDraw 
                    db       -$18, $01, $17, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $3A, $01, $2B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
achiLineStart       =        laserLowestYRight 
achiLineCount       =        laserLowestYLeft 
achiLinePos         =        laserEnemyPointerRight 
lastAchiDir         =        bonusTimerLength 
achievementYOffset  =        bulletDamage 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LDD_CURRENT_SECONDARY_POS  macro  posx 
                    lda      achiLinePos 
                    ldb      #posx 
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
beQuiet                                                   ;#isfunction  
                    ldd      #0 
                    std      sfx_pointer_3 
                    std      sfx_pointer_2 
                    std      sfx_pointer_1 
                    sta      Vec_Music_Flag               ; no music is playing ->0 (is placed in rottist! 
                    JSR      Init_Music_Buf               ; shadow regs 
                    JMP      Do_Sound                     ; ROM function that does the sound playing, here used to clear all regs 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
displayAchievementReturn 
                    JSR      getButtonState               ; get button status 
                    anda     #%1111                       ; button 4 unpause 
                    cmpa     #%1111 
                    bne      displayAchievementReturn 
                    bra      displayAchievementLoop 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SCROLL_MAX_OFFSET   =        40 
doAchiements1                                             ;#isfunction  
                    bsr      beQuiet 
                    lda      #1 
                    sta      songLoop 
                    JSR      getButtonState               ; get button status 
                    anda     #%1111                       ; button 4 unpause 
                    cmpa     #%1111 
                    bne      doAchiements1 
                    ldu      #echoMusic                   ; echoMusic 
                    jsr      PLYINIT 
                    clra     
                    sta      <VIA_shift_reg 
                    lda      #36 +2 
                    sta      achiLineStart 
                    IRQ_TO_0_SHIFT  
                    clr      achievementYOffset 
displayAchievementLoop 
                    ldb      achievementYOffset 
                    beq      noOffsetChange 
                    bmi      positiveChange 
                    dec      achievementYOffset 
                    dec      achievementYOffset 
                    bra      noOffsetChange 

positiveChange 
                    inc      achievementYOffset 
                    inc      achievementYOffset 
noOffsetChange 
                    jSR      Wait_Recal_noShift           ; Vectrex BIOS recalibration 
                    jsr      PLY_PLAY 
                    jsr      do_ym_sound2 
                    jsr      calibrationZero7 
                    lda      achiLineStart 
                    cmpa     #$24 +2 
                    beq      noBottomArrow 
                    jsr      Intensity_3F 
                    lda      achievementYOffset 
                    bpl      noIntensityDown 
                    jsr      Intensity_7F 
noIntensityDown 
                    lda      gameScale 
                    sta      <VIA_t1_cnt_lo 
                    ldd      #$a060 
                    jsr      MoveToD 
                    lda      #7 
                    sta      <VIA_t1_cnt_lo 
                    ldu      #arrowDown 
                    jsr      SMVB_drawSmart 
noBottomArrow 
                    tst      achiLineStart 
                    beq      noTopArrow 
                    jsr      Intensity_3F 
                    lda      achievementYOffset 
                    cmpa     #1 
                    blt      noIntensityUp 
                    jsr      Intensity_7F 
noIntensityUp 
                    lda      gameScale 
                    sta      <VIA_t1_cnt_lo 
                    ldd      #$5460 
                    jsr      MoveToD 
                    lda      #7 
                    sta      <VIA_t1_cnt_lo 
                    ldu      #arrowUp 
                    jsr      SMVB_drawSmart 
noTopArrow 
                    jsr      Intensity_3F 


 if ADDITIONAL_INPUT = 1
 ldb additionalFlags
 andb #BIT_INPUT_VARIANT
 bne noAchievJoy
 endif
REPLACE_1_2_queryJoystick_varFromIRQ0_1 
                    ldx      #0                           ; queryJoystick 
                    jsr      jsrBank0X 
noAchievJoy
                    lda      Vec_Joy_1_Y 
                    beq      clearAchiChange 
                    cmpa     lastAchiDir 
                    beq      noJoyAchiChange 
                    tst      Vec_Joy_1_Y 
                    bpl      achiDirDown 
                    sta      lastAchiDir 
                    lda      #-SCROLL_MAX_OFFSET 
                    sta      achievementYOffset 
                    inc      achiLineStart 
                    lda      achiLineStart 
                    adda     #0 
                    ldx      #achivementPointers 
                    ldb      #8 
                    mul      
                    ldd      d,x 
                    bne      noJoyAchiChange 
                    clr      achievementYOffset 
                    dec      achiLineStart 
                    bra      noJoyAchiChange 

achiDirDown 
                    sta      lastAchiDir 
                    lda      #SCROLL_MAX_OFFSET 
                    sta      achievementYOffset 
                    dec      achiLineStart 
                    bpl      noJoyAchiChange 
                    clr      achiLineStart 
                    clr      achievementYOffset 
                    bra      noJoyAchiChange 

clearAchiChange 
                    sta      lastAchiDir 
noJoyAchiChange 

                    JSR      getButtonState               ; get button status 
                    bita     #8                           ; button 4 return 
                    lbeq     exitAchievements 

 if ADDITIONAL_INPUT = 1
 ldb additionalFlags
 andb #BIT_INPUT_VARIANT
 beq noAchievJoy_22
                    bita     #2                          ; button 2 (remap) help 
                    bne      continueAchievements 
 bra doachievHelp
noAchievJoy_22
 endif


                    bita     #1                           ; button 1 help 
                    bne      continueAchievements 
doachievHelp
REPLACE_1_2_showASHelp_varFromIRQ0_1 
                    ldx      #0                           ;showASHelp 
                    jmp      jmpBank0X 

continueAchievements 
                    lda      #$5f 
                    _INTENSITY_A  
                    lda      gameScale 
                    sta      VIA_t1_cnt_lo 
                    ldd      #$f850 
                    std      Vec_Text_HW 
                    ldd      #$68c0 
; adda achievementYOffset
                    ldu      #achiString                  ; 
                    jsr      syncPrintStrd 
;                    _ZERO_VECTOR_BEAM  
                    ldd      #$fb30 
                    std      Vec_Text_HW 
                    ldy      #achivementPointers 
                    lda      achiLineStart 
                    ldb      #8 
                    mul      
                    leay     d,y 
                    ldu      ,y++ 
                    ldd      #$4090 -$1800 
                    adda     achievementYOffset 
                    jsr      syncPrintStrd 
;                    _ZERO_VECTOR_BEAM  
                    ldd      #$f090+$2000 
                    ldu      #whenString 
                    adda     achievementYOffset 
                    jsr      syncPrintStrd                ;Print5Strd 
;                    _ZERO_VECTOR_BEAM  
                    ldd      #$e0a0 +$2000 
                    ldu      ,y++ 
                    adda     achievementYOffset 
                    jsr      syncPrintStrd 
;                    _ZERO_VECTOR_BEAM  
                    ldd      #$c090 +$2000 
                    ldu      #rewardsString 
                    adda     achievementYOffset 
                    jsr      syncPrintStrd                ;Print5Strd 
;                    _ZERO_VECTOR_BEAM  
                    ldd      #$b0a0 +$2000 
                    ldu      ,y++ 
                    adda     achievementYOffset 
                    jsr      syncPrintStrd 
                    _ZERO_VECTOR_BEAM  
                                                          ; draw line at 0,0 
                                                          ; draw check / uncheck 
                    IRQ_TO_0_SHIFT  
                    ldb      #$ce                         ; light OFF, ZERO OFF 
                    stb      <VIA_cntl                    ; 
                    clrb     
                    lda      #$18 
                    ldu      #achievements 
                    lda      ,y+ 
                    lda      a,u 
                    anda     ,y+ 
                    beq      noAchievementReached 
                    ldb      gameScale 
                    stb      <VIA_t1_cnt_lo 
                    ldd      #$3e80 -$1800 
                    adda     achievementYOffset 
                    jsr      MoveToD 
;                    MY_MOVE_TO_D_START  
                    ldu      #gotItDraw 
                    ldb      #7 
                    stb      <VIA_t1_cnt_lo 
;                    MY_MOVE_TO_A_END  
                    jsr      SMVB_drawSmart 
                    _ZERO_VECTOR_BEAM  
                    ldb      gameScale 
                    stb      <VIA_t1_cnt_lo 
                    ldd      #$2040 -$0000 
                    adda     achievementYOffset 
                    jsr      MoveToD 
;                    MY_MOVE_TO_D_START  
                    ldu      #Trophy 
                    ldb      #7 
                    stb      <VIA_t1_cnt_lo 
;                    MY_MOVE_TO_A_END  
                    jsr      SMVB_drawSmart 
 ;;                   _ZERO_VECTOR_BEAM  
; IRQ_TO_0_T1 ; drawing needs
noAchievementReached 
                    jmp      displayAchievementLoop 

exitAchievements 
REPLACE_1_2_fromGameOver_varFrom0_11 
                    ldx      #0                           ; 
                    jmp      jmpBankIRQ2X                 ; fromGameOver main00 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Button 1-4
; returns in B the current button state in relation to last button state
; bit 0 represents current button state
; bit 1 last button state
; 1 = pressed
; 0 = not pressed
; in a state of current button 1-4
; bit == 0 = pressed
; bit == 1 = not pressed
; a = xxxx 0000
;          4321 - buttons



 if ADDITIONAL_INPUT = 1
getButtonState:                                           ;#isfunction  
; save last states, and shift the old current one bit
; query buttons from psg
                    LDA      #$0E                         ;Sound chip register 0E to port A 
                    STA      <VIA_port_a 
                    LDD      #$9981                       ;sound BDIR on, BC1 on, mux off 
                    sta      <VIA_port_b                  ; VIA Port B = 99, mux disabled, RAMP disabled, BC1/BDIR = 11 (Latch address) 
                    NOP                                   ;pause 
                    STB      <VIA_port_b                  ; VIA Port B = 81, mux disabled, RAMP disabled, BC1/BDIR = 00 (PSG inactive) 
                    CLR      <VIA_DDR_a                   ;DDR A to input 
                    LDD      #$8981                       ;sound BDIR off, BC1 on, mux off 
                    STA      <VIA_port_b                  ; VIA Port B = 89, mux disabled, RAMP disabled, BC1/BDIR = 01 (PSG Read) 
                    NOP                                   ;pause 
                    LDA      <VIA_port_a                  ;Read buttons 
                    STB      <VIA_port_b                  ; VIA Port B = 81, mux disabled, RAMP disabled, BC1/BDIR = 00 (PSG inactive) 
                    LDB      #$FF 
                    STB      <VIA_DDR_a                   ;DDR A to output 
; query done, in A current button state directly from psg

 ldb additionalFlags
 andb #BIT_INPUT_VARIANT
 beq defaultInput_B ; beq


;;;;;;;;;;;;;;;;;
; conversion start
;;;;;;;;;;;;;;;;;

; insert x,y movement for button 2,3
; map 2+3 to button 3 (pause)
; map button 1 to button 2 bomb

 clrb
 bita #2
 beq goleft
 bita #4
 beq goRight
 bra JoyDone_b


goleft
                    ldb      #-10 
 bra JoyDone_b
goRight
                    ldb      #10 
JoyDone_b

                    stb      Vec_Joy_1_X 
 negb
                    stb      Vec_Joy_1_Y 
 tfr a,b
 ora #1+2+4 ; delete button 1+2+3
 bitb #1 ; button 1
 bne noSuperbomb_b
 anda #$f-2; add superbomb
noSuperbomb_b
 andb #2+4
 bne noPauseMode_b 
 anda #$f-4  ; add pause mode
noPauseMode_b
;;;;;;;;;;;;;;;;;
; conversion end
;;;;;;;;;;;;;;;;;

                    ldb      current_button_state 
                    stb      last_button_state 
                    lslb     
                    anda     #$f                          ; only joystick 1 button 4
                    bita     #$8;8 
                    bne      noButtonPressed_lt 
                    incb     
noButtonPressed_lt: 
                    stb      current_button_state 
                    andb     #3 
                    rts      




defaultInput_B
                    ldb      current_button_state 
                    stb      last_button_state 
                    lslb     
                    anda     #$f                          ; only joystick 1 
                    cmpa     #$0f 
                    beq      noButtonPressed 
                    incb     
noButtonPressed: 
                    stb      current_button_state 
                    andb     #3 
                    rts      




 else

getButtonState:                                           ;#isfunction  
; save last states, and shift the old current one bit
; query buttons from psg
                    LDA      #$0E                         ;Sound chip register 0E to port A 
                    STA      <VIA_port_a 
                    LDD      #$9981                       ;sound BDIR on, BC1 on, mux off 
                    sta      <VIA_port_b                  ; VIA Port B = 99, mux disabled, RAMP disabled, BC1/BDIR = 11 (Latch address) 
                    NOP                                   ;pause 
                    STB      <VIA_port_b                  ; VIA Port B = 81, mux disabled, RAMP disabled, BC1/BDIR = 00 (PSG inactive) 
                    CLR      <VIA_DDR_a                   ;DDR A to input 
                    LDD      #$8981                       ;sound BDIR off, BC1 on, mux off 
                    STA      <VIA_port_b                  ; VIA Port B = 89, mux disabled, RAMP disabled, BC1/BDIR = 01 (PSG Read) 
                    NOP                                   ;pause 
                    LDA      <VIA_port_a                  ;Read buttons 
                    STB      <VIA_port_b                  ; VIA Port B = 81, mux disabled, RAMP disabled, BC1/BDIR = 00 (PSG inactive) 
                    LDB      #$FF 
                    STB      <VIA_DDR_a                   ;DDR A to output 
; query done, in A current button state directly from psg
                    ldb      current_button_state 
                    stb      last_button_state 
                    lslb     
                    anda     #$f                          ; only joystick 1 
                    cmpa     #$0f 
                    beq      noButtonPressed 
                    incb     
noButtonPressed: 
                    stb      current_button_state 
                    andb     #3 
                    rts      
 endif



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; word in D
; pointer to highest CSA in U (5 +$80)
; keeps u
wordToDecString                                           ;#isfunction  
; init U
                    clr      0,u 
                    clr      1,u 
                    clr      2,u 
                    clr      3,u 
                    clr      4,u 
test10000Again 
                    cmpd     #9999 
                    bls      notOver10000 
                    subd     #10000 
                    inc      0,u 
                    bra      test10000Again 

notOver10000 
test1000Again 
                    cmpd     #999 
                    bls      notOver1000 
                    subd     #1000 
                    inc      1,u 
                    bra      test1000Again 

notOver1000 
test100Again 
                    cmpd     #99 
                    bls      notOver100 
                    subd     #100 
                    inc      2,u 
                    bra      test100Again 

notOver100 
test10Again 
                    cmpd     #9 
                    bls      notOver10 
                    subd     #10 
                    inc      3,u 
                    bra      test10Again 

notOver10 
                    addb     4,u 
                    addb     # '0'
                    stb      4,u 
                    ldb      3,u 
                    addb     # '0'
                    stb      3,u 
                    ldb      2,u 
                    addb     # '0'
                    stb      2,u 
                    ldb      1,u 
                    addb     # '0'
                    stb      1,u 
                    ldb      0,u 
                    addb     # '0'
                    stb      0,u 
                    lda      #$80 
                    sta      5,u                          ; printable string 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 if  IS_VIA_FAULTY_RESISTENT = 1 
MoveToD 
                    STA      <VIA_port_a                  ;Store Y in D/A register 
                    LDA      #$CE                         ;Blank low, zero high? 
                    STA      <VIA_cntl                    ; 
                    CLRA     
                    STA      <VIA_port_b                  ;Enable mux ; hey dis si "break integratorzero 440" 
                    WAIT6    
                    inca     
                    sta      <VIA_port_b                  ;Disable mux 
                    deca     
                    STB      <VIA_port_a                  ;Store X in D/A register 
                    STA      <VIA_t1_cnt_hi               ;enable timer 
                    MY_MOVE_TO_A_END  
                    rts      

MoveToD_Start 
                    STA      <VIA_port_a                  ;Store Y in D/A register 
                    LDA      #$CE                         ;Blank low, zero high? 
                    STA      <VIA_cntl                    ; 
                    CLRA     
                    STA      <VIA_port_b                  ;Enable mux 
                    WAIT4    
                    inca     
                    sta      <VIA_port_b                  ;Disable mux 
                    deca     
                    STB      <VIA_port_a                  ;Store X in D/A register 
                    STA      <VIA_t1_cnt_hi               ;enable timer 
                    rts      

 else  
MoveToD 
                    STA      <VIA_port_a                  ;Store Y in D/A register 
                    LDA      #$CE                         ;Blank low, zero high? 
                    STA      <VIA_cntl                    ; 
                    CLRA     
                    STA      <VIA_port_b                  ;Enable mux ; hey dis si "break integratorzero 440" 
                    WAIT6    
                    INC      <VIA_port_b                  ;Disable mux 
                    STB      <VIA_port_a                  ;Store X in D/A register 
                    STA      <VIA_t1_cnt_hi               ;enable timer 
                    MY_MOVE_TO_A_END  
                    rts      

MoveToD_Start 
                    STA      <VIA_port_a                  ;Store Y in D/A register 
                    LDA      #$CE                         ;Blank low, zero high? 
                    STA      <VIA_cntl                    ; 
                    CLRA     
                    STA      <VIA_port_b                  ;Enable mux 
                    WAIT6    
                    INC      <VIA_port_b                  ;Disable mux 
                    STB      <VIA_port_a                  ;Store X in D/A register 
                    STA      <VIA_t1_cnt_hi               ;enable timer 
                    rts      

 endif  
DrawLined 
                    sta      <VIA_port_a                  ; 4 
                    clra     
                    sta      <VIA_port_b                  ; 4 
                    inca     
                    WAIT4    
                    sta      <VIA_port_b 
                    deca     
                    stb      <VIA_port_a                  ; 5 
                    ldb      #$ee                         ; light ON, ZERO OFF 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    stb      <VIA_cntl                    ; 
                    ldd      #$40ce 
FlagWaitdld: 
                    bita     <VIA_int_flags 
                    beq      FlagWaitdld 
                    WAIT8    
                    stb      <VIA_cntl                    ; 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;ZERO ing the integrators takes time. Measures at my vectrex show e.g.:
;If you move the beam with a to x = -127 and y = -127 at diffferent scale values, the time to reach zero:
;- scale $ff -> zero 110 cycles
;- scale $7f -> zero 75 cycles
;- scale $40 -> zero 57 cycles
;- scale $20 -> zero 53 cycles
ZERO_DELAY          EQU      5                            ; delay 7 counter is exactly 111 cycles delay between zero SETTING and zero unsetting (in moveto_d) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;U = address of vectorlist
;X = (y,x) position of vectorlist (this will be point 0,0), positioning on screen
;A = scalefactor "Move" (after sync)
;B = scalefactor "Vector" (vectors in vectorlist)
;
;     mode, rel y, rel x,                                             
;     mode, rel y, rel x,                                             
;     .      .      .                                                
;     .      .      .                                                
;     mode, rel y, rel x,                                             
;     0x02
; where mode has the following meaning:         
; negative draw line                    
; 0 move to specified endpoint                              
; 1 sync (and move to list start and than to place in vectorlist)      
; 2 end
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
draw_synced_list_noshift:                                 ;#isfunction  
draw_synced_list 
                    pshs     d 
;                    pshs     a                            ; remember out different scale factors 
;                    pshs     b 
                                                          ; first list entry (first will be a sync + moveto_d, so we just stay here!) 
                    lda      ,u+                          ; this will be a "1" 
sync: 
                    deca                                  ; test if real sync - or end of list (2) 
                    bne      drawdone                     ; if end of list -> jump 
; zero integrators
                    ldb      #$CC                         ; zero the integrators 
                    stb      <VIA_cntl                    ; store zeroing values to cntl 
                    ldb      #ZERO_DELAY                  ; and wait for zeroing to be actually done 
; reset integrators
                    clr      <VIA_port_a                  ; reset integrator offset 
                    lda      #%10000010 
; wait that zeroing surely has the desired effect!
zeroLoop: 
                    sta      <VIA_port_b                  ; while waiting, zero offsets 
                    decb     
                    bne      zeroLoop 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    inca     
                    sta      <VIA_port_b 
 else  
                    inc      <VIA_port_b 
 endif  
; unzero is done by moveto_d
                    lda      1,s                          ; scalefactor move 
                    sta      <VIA_t1_cnt_lo               ; to timer t1 (lo= 
                    tfr      x,d                          ; load our coordinates of "entry" of vectorlist 
; uses shift
; and resets the shift interrupt flag (and does not set again :-(
; 
;                    jsr      Moveto_d                     ; move there 
; replace with shift invariant movetod
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    lda      ,s                           ; scale factor vector 
                    sta      <VIA_t1_cnt_lo               ; to timer T1 (lo) 
                    MY_MOVE_TO_A_END  
moveTo: 
                    ldd      ,u++                         ; do our "internal" moveto d 
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    MY_MOVE_TO_A_END  
nextListEntry: 
                    lda      ,u+                          ; load next "mode" byte 
                    beq      moveTo                       ; if 0, than we should move somewhere 
                    bpl      sync                         ; if still positive it is a 1 pr 2 _> goto sync 
; now we should draw a vector 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    lda      ,u                           ;++ ;Get next coordinate pair 
                    STA      <VIA_port_a                  ;Send Y to A/D 
                    clrb     
                    stb      <VIA_port_b                  ;Enable mux 
                    LDA      #$ee                         ;prepare for blank disabled 
                    incb     
                    stb      <VIA_port_b                  ;Disable mux 
                    ldb      1,u                          ;++ ;Get next coordinate pair 
                    STB      <VIA_port_a                  ;Send X to A/D 
 else  
; now we should draw a vector 
                    ldd      ,u                           ;++ ;Get next coordinate pair 
                    STA      <VIA_port_a                  ;Send Y to A/D 
                    CLR      <VIA_port_b                  ;Enable mux 
                    LDA      #$ee                         ;prepare for blank disabled 
                    INC      <VIA_port_b                  ;Disable mux 
                    STB      <VIA_port_a                  ;Send X to A/D 
 endif  
                    LDB      #$40                         ;B-reg = T1 interrupt bit 
                    CLR      <VIA_t1_cnt_hi               ;Clear T1H 
; blank disabled
                    sta      <VIA_cntl                    ; [4] ZERO disabled, and BLANK disabled 
                    leau     2 ,u                         ;Get next coordinate pair 
setPatternLoop: 
                    BITB     <VIA_int_flags               ;Wait for T1 to time out 
                    beq      setPatternLoop               ; wait till line is finished 
                    LDA      #$ce                         ;prepare for blank disabled 
; blank enabled
                    sta      <VIA_cntl                    ; [4] ZERO disabled, and BLANK disabled 
                    bra      nextListEntry 

drawdone: 
                    puls     d,pc                         ; correct stack and go back 
;                    rts      
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
arrowDown 
                    db       -$50, $01, $50, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $50, $01, $50, hi(SMVB_continue_newY_eq_oldX_single), lo(SMVB_continue_newY_eq_oldX_single) ; y is $50 
                    db       $00, $01, -$50, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
arrowUp 
                    db       $50, $01, $50, hi(SMVB_startDraw_yEqx_single), lo(SMVB_startDraw_yEqx_single) ; y is $50 
                    db       -$50, $01, $50, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$50, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
achiString 
                    db       "ACHIEVEMENTS",$80
whenString 
                    db       "WHEN:",$80
rewardsString 
                    db       "REWARD:",$80
Trophy                                                    ;        rotated 
                    db       $23, $01, $56, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$16, $01, $24, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$4D, $01, -$41, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$12, $01, -$3B, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $14, $01, -$1D 
                    db       -$28, $01, -$15 
                    db       -$4B, $01, $2F 
                    db       $38, $01, -$68, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$01, $01, $5F, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $22, $01, $12 
                    db       $15, $01, -$22 
                    db       $33, $01, -$13 
                    db       $64, $01, $1B, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$10, $01, $29, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $22, $01, $15 
                    db       -$38, $01, $68, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$22, $01, -$13, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$57, $01, -$5B, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $1F, $01, -$45, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $55, $01, $0E, hi(SMVB_startDraw_tripple), lo(SMVB_startDraw_tripple) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
achivementPointers: 
                    dw       all_t,all_n,all_r, 1*256+ ACHIEVEMENT_FLAG_BYTE2_ALL 
                    dw       falc_t,falc_n,falc_r, 5*256+ ACHIEVEMENT_FLAG_BYTE6_MINESTORM_FALCON 
                    dw       drun_t,drun_n,drun_r, 5*256+ ACHIEVEMENT_FLAG_BYTE6_MINESTORM_DRUNKEN 
                    dw       blr1_t,blr1_n,blr1_r, 2*256+ ACHIEVEMENT_FLAG_BYTE3_BLADEMASTER_RANK1 
                    dw       blr2_t,blr2_n,blr2_r, 2*256+ ACHIEVEMENT_FLAG_BYTE3_BLADEMASTER_RANK2 
                    dw       blr3_t,blr3_n,blr3_r, 2*256+ ACHIEVEMENT_FLAG_BYTE3_BLADEMASTER_RANK3 
                    dw       blr4_t,blr4_n,blr4_r, 2*256+ ACHIEVEMENT_FLAG_BYTE3_BLADEMASTER_RANK4 
                    dw       blr5_t,blr5_n,blr5_r, 2*256+ ACHIEVEMENT_FLAG_BYTE3_BLADEMASTER_RANK5 
                    dw       spr1_t,spr1_n,spr1_r, 3*256+ ACHIEVEMENT_FLAG_BYTE4_SPY_RANK1 
                    dw       spr2_t,spr2_n,spr2_r, 3*256+ ACHIEVEMENT_FLAG_BYTE4_SPY_RANK2 
                    dw       spr3_t,spr3_n,spr3_r, 3*256+ ACHIEVEMENT_FLAG_BYTE4_SPY_RANK3 
                    dw       spr4_t,spr4_n,spr4_r, 3*256+ ACHIEVEMENT_FLAG_BYTE4_SPY_RANK4 
                    dw       chr1_t,chr1_n,chr4_r, 4*256+ ACHIEVEMENT_FLAG_BYTE5_CHALLENGER_RANK1 
                    dw       chr2_t,chr2_n,chr4_r, 4*256+ ACHIEVEMENT_FLAG_BYTE5_CHALLENGER_RANK2 
                    dw       chr3_t,chr3_n,chr4_r, 4*256+ ACHIEVEMENT_FLAG_BYTE5_CHALLENGER_RANK3 
                    dw       chr4_t,chr4_n,chr4_r, 4*256+ ACHIEVEMENT_FLAG_BYTE5_CHALLENGER_RANK4 
                    dw       mnr1_t,mnr1_n,mnr1_r, 1*256+ ACHIEVEMENT_FLAG_BYTE2_COLLECTOR_RANK1 
                    dw       mnr2_t,mnr2_n,mnr2_r, 1*256+ ACHIEVEMENT_FLAG_BYTE2_COLLECTOR_RANK2 
                    dw       mnr3_t,mnr3_n,mnr5_r, 1*256+ ACHIEVEMENT_FLAG_BYTE2_COLLECTOR_RANK3 
                    dw       mnr4_t,mnr4_n,mnr5_r, 1*256+ ACHIEVEMENT_FLAG_BYTE2_COLLECTOR_RANK4 
                    dw       mnr5_t,mnr5_n,mnr5_r, 1*256+ ACHIEVEMENT_FLAG_BYTE2_COLLECTOR_RANK5 
                    dw       scr1_t,scr1_n,scr5_r, 0*256+ ACHIEVEMENT_FLAG_BYTE1_SCORER_RANK1 
                    dw       scr2_t,scr2_n,scr5_r, 0*256+ ACHIEVEMENT_FLAG_BYTE1_SCORER_RANK2 
                    dw       scr3_t,scr3_n,scr5_r, 0*256+ ACHIEVEMENT_FLAG_BYTE1_SCORER_RANK3 
                    dw       scr4_t,scr4_n,scr5_r, 0*256+ ACHIEVEMENT_FLAG_BYTE1_SCORER_RANK4 
                    dw       scr5_t,scr5_n,scr5_r, 0*256+ ACHIEVEMENT_FLAG_BYTE1_SCORER_RANK5 
                    dw       snr1_t,snr1_n,snr3_r, 0*256+ ACHIEVEMENT_FLAG_BYTE1_SNIPER_RANK1 
                    dw       snr2_t,snr2_n,snr3_r, 0*256+ ACHIEVEMENT_FLAG_BYTE1_SNIPER_RANK2 
                    dw       snr3_t,snr3_n,snr3_r, 0*256+ ACHIEVEMENT_FLAG_BYTE1_SNIPER_RANK3 
                    dw       ofr1_t,ofr1_n,ofr1_r, 3*256+ ACHIEVEMENT_FLAG_BYTE4_OFFICER_RANK1 
                    dw       ofr2_t,ofr2_n,ofr2_r, 3*256+ ACHIEVEMENT_FLAG_BYTE4_OFFICER_RANK2 
                    dw       ofr3_t,ofr3_n,ofr3_r, 3*256+ ACHIEVEMENT_FLAG_BYTE4_OFFICER_RANK3 
                    dw       ofr4_t,ofr4_n,ofr4_r, 3*256+ ACHIEVEMENT_FLAG_BYTE4_OFFICER_RANK4 
                    dw       loss_t,loss_n,loss_r, 4*256+ ACHIEVEMENT_FLAG_BYTE5_BIGGEST_LOSS 
                    dw       greed_t,greed_n,greed_r, 1*256+ ACHIEVEMENT_FLAG_BYTE2_GREEDY 
                    dw       life_t,life_n,life_r, 1*256+ ACHIEVEMENT_FLAG_BYTE2_9LIVES 
                    dw       blas_t,blas_n,blas_r, 2*256+ ACHIEVEMENT_FLAG_BYTE3_LASER 
                    dw       quad_t,quad_n,quad_r, 2*256+ ACHIEVEMENT_FLAG_BYTE3_QUADRO 
                    dw       trpl_t,trpl_n,trpl_r, 2*256+ ACHIEVEMENT_FLAG_BYTE3_TRIPPLE 
                    dw       0 
falc_t              db       "FALCON-STORM", $80
falc_n              db       "FAST MINESTORM", $80
falc_r              db       "START WITH +1 SHOT", $80
drun_t              db       "DRUNKEN-STORM", $80
drun_n              db       "DRUNKEN MINESTORM", $80
drun_r              db       "ENABLED: DROP TRIPLE SHOT", $80
snr3_t 
                    db       "SNIPER RANK 3", $80
snr3_n 
                    db       "ACCURACY > 90%", $80
snr3_r 
                    db       "BULLET +1", $80
snr2_t 
                    db       "SNIPER RANK 2", $80
snr2_n 
                    db       "ACCURACY > 100%", $80
snr1_t 
                    db       "SNIPER RANK 1", $80
snr1_n 
                    db       "ACCURACY > 120%", $80
scr5_t 
                    db       "SCORER RANK 5", $80
scr5_n 
                    db       "SCORE > 100000", $80
scr5_r 
                    db       "SPEED +1", $80
scr4_t 
                    db       "SCORER RANK 4", $80
scr4_n 
                    db       "SCORE > 500000", $80
scr3_t 
                    db       "SCORER RANK 3", $80
scr3_n 
                    db       "SCORE > 1000000", $80
scr2_t 
                    db       "SCORER RANK 2", $80
scr2_n 
                    db       "SCORE > 2500000", $80
scr1_t 
                    db       "SCORER RANK 1", $80
scr1_n 
                    db       "SCORE > 5000000", $80
mnr5_t 
                    db       "MONEY COLLECTOR RANK 5", $80
mnr5_n 
                    db       "MONEY > 5000", $80
mnr5_r 
                    db       "+100 MONEY", $80
mnr4_t 
                    db       "MONEY COLLECTOR RANK 4", $80
mnr4_n 
                    db       "MONEY > 10000", $80
mnr3_t 
                    db       "MONEY COLLECTOR RANK 3", $80
mnr3_n 
                    db       "MONEY > 25000", $80
mnr2_t 
                    db       "MONEY COLLECTOR RANK 2", $80
mnr2_n 
                    db       "MONEY > 50000", $80
mnr2_r 
                    db       "+200 MONEY", $80
mnr1_t 
                    db       "MONEY COLLECTOR RANK 1", $80
mnr1_n 
                    db       "MONEY ROLLOVER", $80
mnr1_r 
                    db       "+250 MONEY", $80
greed_t 
                    db       "GREEDY", $80
greed_n 
                    db       "SPEED, RATE, BULLET - MAXED", $80
greed_r 
                    db       "START WITH +1 SHOT", $80
life_t 
                    db       "LIVELY", $80
life_n 
                    db       "HAVE 9 LIVES", $80
life_r 
                    db       "BONUS DROP LIFE ENABLED", $80
all_t 
                    db       "ALL", $80
all_n 
                    db       "COLLECT ALL ACHIEVEMENTS", $80
all_r 
                    db       "NEW RANK: GREAT DEFENDER", $80
blr5_t 
                    db       "BLADEMASTER RANK 5", $80
blr5_n 
                    db       "COMPLETE EASY", $80
blr5_r 
                    db       "ENABLED: BUY LASER & NORMAL", $80
blr4_t 
                    db       "BLADEMASTER RANK 4", $80
blr4_n 
                    db       "COMPLETE NORMAL", $80
blr4_r 
                    db       "ENABLED: START AT HARD", $80
blr3_t 
                    db       "BLADEMASTER RANK 3", $80
blr3_n 
                    db       "COMPLETE HARD", $80
blr3_r 
                    db       "ENABLED: START AT ABSURD", $80
blr2_t 
                    db       "BLADEMASTER RANK 2", $80
blr2_n 
                    db       "COMPLETE ABSURD", $80
blr2_r 
                    db       "ENABLED: START AT MANIAC", $80
blr1_t 
                    db       "BLADEMASTER RANK 1", $80
blr1_n 
                    db       "COMPLETE MANIAC", $80
blr1_r 
                    db       "NOTHING - YOU DON'T NEED ANYTHING", $80
trpl_t 
                    db       "TRIPLE", $80
trpl_n 
                    db       "GET TRIPLE SHOT", $80
trpl_r 
                    db       "NOTHING", $80
quad_t 
                    db       "QUADRO", $80
quad_n 
                    db       "GET QUAD SHOT", $80
quad_r 
                    db       "ENABLED: BUY TRIPLE SHOT", $80
blas_t 
                    db       "LASER", $80
blas_n 
                    db       "GET LASER SHOT", $80
blas_r 
                    db       "ENABLED: BUY BLASTER SHOT", $80
ofr4_t 
                    db       "OFFICER RANK 4", $80
ofr4_n 
                    db       "REACH LIEUTENANT", $80
ofr4_r 
                    db       "START WITH ARMOR", $80
ofr3_t 
                    db       "OFFICER RANK 3", $80
ofr3_n 
                    db       "REACH ADMIRAL", $80
ofr3_r 
                    db       "ENABLED: BUY RANK", $80
ofr2_t 
                    db       "OFFICER RANK 2", $80
ofr2_n 
                    db       "REACH ADMIRAL 1 SILVER STAR", $80
ofr2_r 
                    db       "START WITH AUTOFIRE", $80
ofr1_t 
                    db       "OFFICER RANK 1", $80
ofr1_n 
                    db       "REACH ADMIRAL 3 GOLD STAR", $80
ofr1_r 
                    db       "START WITH TIMER +10s", $80
spr4_t 
                    db       "SPY RANK 4", $80
spr4_n 
                    db       "DISCOVER 2 SECRETS", $80
spr4_r 
                    db       "START WITH SUPER BOMB", $80
spr3_t 
                    db       "SPY RANK 3", $80
spr3_n 
                    db       "DISCOVER 4 SECRETS", $80
spr3_r 
                    db       "START MINESTORM WITH 2x", $80
spr2_t 
                    db       "SPY RANK 2", $80
spr2_n 
                    db       "DISCOVER 6 SECRETS", $80
spr2_r 
                    db       "ENABLED: BUY SUPER BOMB", $80
spr1_t 
                    db       "SPY RANK 1", $80
spr1_n 
                    db       "DISCOVER 7 SECRETS", $80
spr1_r 
                    db       "GET POCKET SHOP (BUTTON 3+4)", $80
chr4_t 
                    db       "CHALLENGER RANK 4", $80
chr4_n 
                    db       "GET 2000 BONUS", $80
chr4_r 
                    db       "RATE +1", $80
chr3_t 
                    db       "CHALLENGER RANK 3", $80
chr3_n 
                    db       "GET 8000 BONUS", $80
chr2_t 
                    db       "CHALLENGER RANK 2", $80
chr2_n 
                    db       "GET 16000 BONUS", $80
chr1_t 
                    db       "CHALLENGER RANK 1", $80
chr1_n 
                    db       "GET 256000 BONUS", $80
loss_t 
                    db       "GREATEST LOSS", $80
loss_n 
                    db       "DROP FROM LASER TO 1 SHOT", $80
loss_r 
                    db       "ENABLED: BUY IMMUNITY 1", $80
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;***************************************************************************
hsMusic: 
                    dw       vtkhsSong                    ; music to play 
                    dw       hsMusic                      ; next music piece 
vtkhsSong 
                    include  "music/hiscoreAKS.asm"
echoMusic: 
                    dw       vtkechoSong                  ; music to play 
                    dw       echoMusic                    ; next music piece 
vtkechoSong 
                    include  "music/echoesAKS.asm"
introMusic:                                               ;        
                    dw       vtkintroSong                 ; music to play 
                    dw       introMusic                   ; next music piece 
vtkintroSong 
                    include  "music/galagaAKS.asm"
titleMusic:                                               ;        
 if  NMI_HANDLER = 1 
 else  
                    dw       vtktitleSong                 ; music to play 
                    dw       titleMusic                   ; next music piece 
vtktitleSong 
                    include  "music/VTK_TitleMusicAKS.asm"
 endif  
;.......
boss1Music:                                               ;        
                    dw       vtkBoss1                     ; music to play 
                    dw       0                            ; next music piece 
vtkBoss1 
                    include  "music/BossMAKS.asm"
;.......
boss2Music 
                    dw       vtkBoss2                     ; music to play 
                    dw       0                            ; next music piece 
vtkBoss2 
                    include  "music/BossZAKS.asm"
;.......
boss3Music 
                    dw       vtkBoss3                     ; music to play 
                    dw       0                            ; next music piece 
vtkBoss3 
                    include  "music/BossRAKS.asm"
;.......
boss4Music 
                    dw       vtkBoss4                     ; music to play 
                    dw       0                            ; next music piece 
vtkBoss4 
                    include  "music/BossXAKS.asm"
;.......
dodgerIntroMusic 
                    dw       minIntro                     ; music to play 
                    dw       0                            ; next music piece 
minIntro 
                    include  "music/MstormAKS.asm"
;.......
candleMusic 
                    dw       chandleNoise                 ; music to play 
                    dw       0                            ; next music piece 
chandleNoise 
                    include  "music/CandleAKS.asm"
;.......
                    include  "sound.asm"
                    include  "arkosPlayerAllChannel.i"
                    include  "font_5.asm"
                    include  "printStringSync2.asm"
                    include  "objectEnemyBank1.asm"
                    include  "titlePic.asm"
                    include  "shop.asm"


 if  VECFEVER = 1 


Saucer 
                    db       $0A, $01, -$3A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0A, $01, -$3A, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$21, $01, -$3D 
                    db       -$29, $01, -$39 
                    db       $15, $01, -$47 
                    db       -$33, $01, -$42 
                    db       -$4D, $01, $4E 
                    db       -$19, $01, $2C 
                    db       -$15, $01, $2A, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $0A, $01, $37 
                    db       -$18, $01, $39 
                    db       -$05, $01, $25 
                    db       $05, $01, $25 
                    db       $18, $01, $39 
                    db       -$0A, $01, $37 
                    db       $15, $01, $2A, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $19, $01, $2C 
                    db       $4D, $01, $4E 
                    db       $33, $01, -$42 
                    db       -$15, $01, -$47 
                    db       $29, $01, -$39 
                    db       $21, $01, -$3D 
                    db       -$29, $01, -$70, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       -$14, $01, $64, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $42, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $14, $01, $64, hi(SMVB_continue_single), lo(SMVB_continue_single) 
; only for very cranky?
;                    db       -$29, $01, -$10, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
 endif



 if  VECFEVER = 1 
MARKK_8000                                                ;        actually this is 7ef0 
                    org      $7ff0 
                    ds       16 
this_is_8000 
FONTWDTH            equ      $5f 
;***************************************************************************
; MAGIC CARTHEADER SECTION
;      DO NOT CHANGE THIS STRUCT
;***************************************************************************
                    ORG      $8030 
                    fcb      "ThGS"                       ; magic handshake marker
v4ecartversion      fdb      $0001                        ; I always have a version 
                                                          ; in comm. structs 
v4ecartflags        fdb      $00C0                        ; v4e flags: 
                                                          ; $8000 + always set by v4e 
                                                          ; $4000 - hiscore entry supported 
                                                          ; $2000 - enable cart as ram 
                                                          ; $1000 - supply default font 
                                                          ; $0800 - 1: fast menu switch supported 
                                                          ; set to 0 if hiscore entry 
                                                          ; $0700 + v4e timing bits: 
                                                          ; 0 - heuristic 
                                                          ; 1 - zero 
                                                          ; 2 - one 
                                                          ; 3 - two 
                                                          ; 4 - three 
                                                          ; $0080 - populate storage upon start 
                                                          ; $0040 - 1: extension calls used 
                                                          ; $0020 - gpios used (@7ffe) 
                                                          ; $0010 - free for future use 
                                                          ; $0008 - 1:screensaver enabled 
                                                          ; $0003 - font size 
                                                          ; 
                                                          ; first the variables for the v4e font system 
                                                          ; 
v4efontptr          fdb      0                            ; supplied by app: 
                                                          ; if != 0: the cart uses this 
                                                          ; ptr to supply a font and to 
                                                          ; optimize strings; 
v4efontwidth        fcb      FONTWDTH                     ; supplied by app: 
                                                          ; the cart stores a system 
                                                          ; font at v4efontptr+0x20 and 
                                                          ; adds v4efontwidth per line 
                                                          ; ..must be at least $3f 
v4efontlastchar     fcb      $7e                          ; supplied by cart:($5e or $7e) 
                                                          ; last char supplied by v4e 
                                                          ; (first one is always 0x20) 
v4estringlists      fdb      0                            ; if !=0 a ptr to a list of ptrs 
                                                          ; containing lists of constant 
                                                          ; strings that can be optimized 
                                                          ; for a given font (0 == end 
                                                          ; of lists) 
                                                          ; 
                                                          ; now the variables for the v4e store/load area 
                                                          ; 
v4eStorageArea      fdb      storage_area-0x8000          ;+0x4000 ; pointer to the area - 0: unused 
v4eStorageSize      fdb      storage_area_end - storage_area ; and its size 
v4eStorageLoaded    fdb      0                            ; set by v4e: return size for a load 
                                                          ; e.g. if set to zero in compile an != 0 
                                                          ; at the start shows whether something was 
                                                          ; loaded via 'populate storage upon start' 
v4eStorageID        fcb      "VBA2"                       ; 4 bytes storage identifier
                                                          ; 
                                                          ; end of v4e cart header 
                                                          ; 
storage_area 
                    db       0                            ; $7b ; calibrationValue6 
                    db       0                            ; $23 ; calibrationValue7 
                    db       0                            ; $23 ; calibrationValue16 
                    db       0                            ; $54 ; calibrationValue40 
                    db       0                            ; $56 ; calibrationValue50 
                    db       $80                          ; gameScale 
                    db       0                            ; shopAllowFlags 
                    db       0                            ; additionalFlags 
 if  LEVEL_SELECT = 1 
;ACHIEVEMENT_FLAG_BYTE3_BLADEMASTER_RANK5 = %00000001 ; checked each roll over
;ACHIEVEMENT_FLAG_BYTE3_BLADEMASTER_RANK4 = %00000010
;ACHIEVEMENT_FLAG_BYTE3_BLADEMASTER_RANK3 = %00000100
;ACHIEVEMENT_FLAG_BYTE3_BLADEMASTER_RANK2 = %00001000
;ACHIEVEMENT_FLAG_BYTE3_BLADEMASTER_RANK1 = %00010000
                    db       0,0,%01111111,0,0,0          ;%00000111 ; achievements 
 else  
; switches tripple shot on!
                    db       0,0,0,0,0,0                  ; achievements 
 endif                                                    ; LEVEL_SELECT = 1 
                    db       0                            ; secretFlags 
                    db       0                            ; maxLevelReached 
normal_HS 
; highscore
                    db       "MAL", $00,$00,$04,$00, $00  ; 3 Name, 4*2 bcd, 1 level
                    db       "TOM", $00,$00,$03,$00, $00
                    db       "VTK", $00,$00,$02,$00, $00
                    db       "ALX", $00,$00,$01,$00, $00
hardcore_HS 
                    db       "MAL", $00,$00,$04,$00, $00  ; 3 Name, 4*2 bcd, 1 level
                    db       "TOM", $00,$00,$03,$00, $00
                    db       "VTK", $00,$00,$02,$00, $00
                    db       "ALX", $00,$00,$01,$00, $00
gameSaveArea 
                    ds       1025,$ff                     ; save game storage fpr VecFever? 
storage_area_end 
;b000
; db $0C, $00, $00, $00, $00, $00, $00, $00, $3F, $00, $00, $00, $00, $00, $00, $00, $00, $10, $7F, $00, $00, $14, $00, $00, $01, $96, $00, $00, $00, $01, $00, $00, $00, $00, $4F, $00, $03, $5E, $0F, $19, $00, $00, $00, $F8, $50, $02, $EE, $00, $00, $08, $0A, $08, $1A, $05, $7B, $04, $AD, $11, $F0, $00, $E8, $00, $30, $75, $00, $00, $00, $00, $00, $00, $3F, $00, $00, $00, $00, $00, $00, $00, $08, $00, $8E, $E2, $00, $C9, $BF, $00, $00, $00, $00, $30, $30, $30, $30, $36, $36, $30, $80, $80, $80, $00, $50, $00, $00, $03, $00, $00, $00, $00, $DF, $04, $00, $00, $00, $00, $00, $5A, $00, $3B, $01, $F4, $01, $F4, $04, $02, $02, $0D, $00, $7C, $02, $00, $C9, $8B, $C9, $7E, $01, $C9, $D4, $C9, $BF, $00, $CB, $63, $C8, $36, $00, $C8, $FE, $C8, $32, $00, $C9, $6E, $C8, $34, $00, $01, $00, $00, $00, $00, $65, $68, $61, $56, $80, $00, $82, $00, $00, $00, $00, $00, $00, $00, $04, $B0, $4F, $00, $00, $20, $20, $33, $80, $04, $00, $00, $18, $B4, $00, $00, $61, $27, $30, $30, $00, $01, $34, $80, $00, $00, $21, $CD, $E9, $B7, $FF, $00, $00, $37, $AF, $C1, $97, $D9, $CB, $F9, $00, $0A, $00, $00, $7F, $7F, $00, $00, $7F, $00, $00, $00, $01, $02, $03, $18, $30, $01, $F4, $A0, $DC, $00, $00, $80, $00, $00, $64, $00, $00, $00, $00, $00, $00, $00, $01, $00, $03, $00, $00, $90, $00, $7F, $30, $6E, $3E, $C9, $0A, $83, $00, $19, $17, $02, $74, $DD, $3B, $6E, $3E, $C9, $16, $12, $3E, $22, $86, $02, $C5, $73, $F8, $00, $22, $C9, $22, $6A, $43, $30, $C9, $30, $B2, $34, $89, $5D, $39, $C9, $2E, $23, $70, $63, $52, $71, $00, $65, $69, $AA, $B7, $C9, $3A, $C9, $45, $C5, $B5, $06, $63, $16, $30, $1A, $4E, $C9, $46, $12, $2F, $00, $D6, $B0, $53, $FE, $A6, $6A, $C9, $C9, $52, $67, $47, $66, $67, $18, $9C, $25, $90, $1E, $2A, $C8, $32, $26, $E2, $57, $6E, $AD, $E2, $83, $19, $55, $35, $C9, $76, $08, $8C, $50, $90, $5F, $03, $C9, $5E, $04, $06, $93, $D9, $55, $35, $C9, $66, $14, $07, $C2, $67, $55, $35, $C8, $34, $1E, $0D, $C9, $7E, $CB, $FB, $C6, $AA, $F7, $55, $55, $C6, $55, $F7, $2A, $AA, $C6, $A0, $F7, $55, $55, $A7, $84, $E6, $84, $E8, $84, $C4, $40, $26, $F8, $39, $55, $B7, $2A, $AA, $86, $30, $B7, $B0, $00, $F6, $00, $00, $F8, $00, $00, $C5, $40, $26, $F6, $39, $F8, $39, $C9, $C3, $BE, $EA, $76, $98, $20, $6E, $63, $67, $35, $0A, $60, $82, $18, $5E, $16, $C8, $30, $2D, $00, $02, $00, $01, $60, $00, $8A, $CB, $10, $08, $FF, $00, $2E, $4E, $02, $C6, $52, $8C, $C9, $E9, $30, $9C, $C6, $6F, $8B, $AB, $01, $8E, $AE, $00, $39, $FF, $00, $2E, $55, $F1, $D9, $52, $8C, $C9, $FE, $30, $9C, $D9, $C5, $01, $60, $01, $8E, $AE, $00, $39, $FF, $00, $2E, $55, $10, $B7, $52, $8C, $CA, $13, $31, $60, $B7, $7E, $00, $00, $01, $8E, $AE, $00, $39, $FF, $00, $31, $2F, $F2, $D8, $52, $8C, $CA, $28, $31, $60, $D8, $E4, $FF, $C8, $01, $8E, $AE, $00, $39, $FF, $00, $31, $2F, $33, $3D, $52, $8C, $CA, $3D, $31, $60, $3B, $45, $8B, $AB, $08, $8A, $CB, $01, $39, $FF, $00, $31, $2F, $D6, $07, $52, $8C, $CA, $52, $31, $60, $07, $78, $83, $60, $00, $8E, $AE, $00, $39, $FF, $00, $31, $2F, $4E, $F2, $52, $8C, $CA, $67, $30, $9C, $F7, $00, $00, $49, $08, $8E, $A4, $02, $39, $FF, $00, $2E, $4E, $26, $60, $52, $8C, $CA, $7C, $30, $9C, $3D, $00, $83, $60, $21, $8A, $CB, $10, $39, $FF, $00, $2E, $4E, $4E, $53, $52, $8C, $CA, $91, $30, $9C, $45, $00, $4F, $4D, $08, $8E, $A4, $01, $39, $FF, $00, $2E, $4E, $36, $31, $52, $8C, $CA, $A6, $30, $9C, $2B, $00, $00, $00, $08, $8E, $A4, $01, $39, $FF, $00, $2E, $4E, $66, $62, $52, $8C, $CA, $BB, $30, $9C, $55, $00, $00, $00, $08, $8E, $A4, $02, $39, $FF, $00, $2E, $4E, $36, $43, $52, $8C, $CA, $D0, $30, $9C, $48, $00, $2A, $AA, $08, $8E, $A4, $03, $39, $FF, $00, $2E, $4E, $36, $60, $52, $8C, $CA, $E5, $30, $9C, $62, $00, $BF, $B6, $08, $8E, $A4, $01, $39, $FF, $00, $2E, $4E, $C8, $9C, $39, $8E, $CA, $FA, $C7, $66, $32, $67, $DF, $39, $A7, $32, $B2, $B7, $FE, $3F, $00, $04, $6F, $AE, $6B, $69, $3E, $CB, $0F, $06, $57, $77, $BB, $94, $56, $19, $F7, $7F, $77, $72, $2E, $00, $E7, $6E, $96, $F8, $92, $B7, $CB, $24, $DF, $BE, $95, $64, $43, $23, $6B, $01, $7B, $A4, $6A, $B4, $00, $51, $1A, $F6, $66, $30, $5E, $CB, $39, $A2, $5D, $3E, $36, $2F, $7B, $EB, $5E, $54, $D3, $32, $37, $00, $B3, $45, $32, $63, $20, $F6, $CB, $4E, $20, $D4, $F7, $2E, $D4, $56, $03, $00, $3F, $00, $42, $22, $00, $B0, $6C, $00, $7B, $B7, $00, $C8, $30, $B3, $76, $18, $B7, $00, $27, $26, $0A, $33, $D6, $75, $EC, $00, $7F, $5B, $2F, $4C, $A7, $72, $CB, $6D, $2F, $B5, $0E, $02, $7F, $FA, $A7, $E4, $CB, $77, $7F, $B0, $09, $00, $1F, $5B, $A7, $72, $CB, $81, $1F, $4D, $0E, $02, $44, $38, $A7, $E4, $CB, $8B, $44, $37, $09, $02, $34, $72, $E4, $7C, $CB, $95, $52, $5D, $27, $BB, $5F, $AD, $22, $53, $CB, $9F, $34, $DE, $6D, $63, $77, $33, $BC, $9F, $CB, $A9, $FF, $81, $D6, $E6, $5A, $65, $79, $82, $CB, $B3, $16, $C9, $D4, $2D, $00, $02, $00, $01, $CB, $BD, $8A, $CB, $10, $08, $FF, $00, $2E, $4E, $C8, $36, $2B, $37, $B7, $45, $36, $34, $44, $32, $2F, $76, $63, $27, $43, $9D, $CF, $B1, $3C, $36, $2E, $23, $7F, $01, $6D, $22, $20, $F5, $6F, $BF, $22, $6D, $1B, $F3, $30, $F3, $80, $F3, $00, $05, $23, $B6, $20, $20, $20, $20, $85, $94, $03, $15, $C8, $32, $04, $6E, $86, $EB, $85, $D1, $7E, $00, $26, $00, $00
;  db $0C, $00, $00, $00, $00, $00, $00, $00, $3F, $00, $00, $00, $00, $00, $00, $00, $00, $00, $7F, $02, $09, $00, $FA, $00, $00, $19, $01, $00, $00, $01, $00, $00, $00, $00, $15, $00, $64, $4E, $01, $E9, $00, $00, $00, $F8, $50, $02, $EE, $00, $00, $05, $CB, $05, $DB, $03, $3C, $02, $69, $0F, $A0, $00, $E5, $09, $30, $75, $00, $00, $00, $00, $00, $00, $3F, $00, $00, $00, $00, $00, $00, $00, $01, $09, $93, $95, $09, $C9, $E5, $FE, $FF, $00, $00, $30, $30, $30, $30, $30, $32, $30, $80, $00, $00, $75, $30, $00, $04, $FF, $25, $C9, $FA, $00, $37, $00, $00, $00, $00, $00, $00, $01, $00, $03, $27, $10, $03, $E8, $0A, $04, $03, $E8, $00, $7C, $01, $00, $C9, $D8, $C9, $CB, $04, $CA, $78, $C9, $E5, $07, $CB, $89, $C8, $36, $00, $C8, $FC, $C8, $32, $00, $C9, $74, $C8, $34, $00, $01, $00, $99, $01, $00, $00, $00, $00, $00, $80, $00, $02, $00, $00, $7F, $00, $00, $00, $00, $04, $AE, $AF, $00, $00, $20, $20, $33, $80, $00, $00, $B8, $B9, $BA, $BB, $BC, $BD, $BE, $30, $30, $30, $30, $31, $80, $00, $00, $7E, $A7, $A7, $86, $C8, $00, $00, $CE, $CF, $D0, $D1, $D2, $78, $96, $01, $01, $00, $00, $01, $05, $00, $00, $00, $E6, $90, $02, $0A, $02, $01, $08, $10, $00, $FA, $A6, $0D, $00, $00, $80, $00, $00, $1E, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $7E, $87, $FC, $FD, $FE, $FF, $C9, $08, $02, $00, $04, $05, $06, $07, $C9, $19, $0A, $0B, $C9, $14, $0E, $0F, $10, $11, $12, $13, $14, $15, $00, $17, $C9, $20, $1A, $1B, $1C, $C9, $2E, $1F, $20, $21, $22, $23, $C9, $2C, $26, $27, $28, $29, $2A, $00, $2C, $2D, $2E, $2F, $C9, $38, $C9, $43, $34, $35, $36, $37, $38, $39, $3A, $3B, $C9, $44, $3E, $3F, $00, $41, $42, $43, $44, $45, $46, $C9, $C9, $50, $4A, $4B, $4C, $4D, $4E, $4F, $50, $51, $52, $53, $C9, $5C, $56, $57, $58, $59, $5A, $5B, $C9, $6D, $5E, $5F, $C9, $68, $62, $63, $64, $65, $66, $67, $68, $69, $00, $6B, $C8, $32, $6E, $6F, $70, $C9, $82, $73, $74, $75, $76, $77, $C9, $7C, $7A, $7B, $7C, $7D, $7E, $00, $C9, $84, $82, $83, $84, $85, $C9, $97, $C9, $8C, $8A, $8B, $8C, $8D, $8E, $8F, $C9, $94, $92, $93, $00, $95, $96, $97, $C9, $9C, $9A, $C9, $AC, $9D, $9E, $9F, $C8, $34, $A2, $A3, $00, $03, $CB, $FC, $C8, $2E, $3F, $20, $3B, $2A, $F5, $27, $D5, $02, $68, $73, $A1, $C9, $A4, $2F, $C8, $DD, $AB, $6C, $68, $E2, $58, $C6, $73, $A1, $C9, $B1, $0F, $3F, $E7, $E7, $CC, $BB, $B7, $53, $4D, $73, $A1, $C9, $BE, $0F, $45, $16, $1E, $76, $D7, $90, $0D, $70, $73, $A1, $C8, $2E, $3F, $D2, $38, $69, $1C, $E0, $0E, $82, $3E, $5D, $85, $C9, $FA, $34, $5A, $01, $01, $35, $C6, $0E, $2F, $00, $00, $00, $00, $00, $2D, $01, $82, $10, $5E, $0D, $CA, $B7, $35, $D8, $06, $31, $00, $00, $00, $00, $00, $08, $00, $34, $00, $2D, $01, $7C, $7C, $59, $F8, $C8, $30, $7C, $38, $7C, $38, $00, $08, $00, $93, $AF, $01, $00, $24, $00, $B8, $CB, $00, $84, $59, $F8, $CA, $0F, $00, $00, $84, $F4, $2E, $2F, $01, $93, $47, $01, $01, $09, $60, $B1, $E2, $CF, $FB, $51, $12, $CA, $24, $35, $CA, $95, $5A, $80, $27, $1B, $8B, $4C, $00, $02, $00, $60, $B5, $45, $7C, $83, $59, $F8, $CA, $39, $7C, $38, $83, $C8, $58, $59, $01, $93, $AF, $01, $03, $2C, $00, $B8, $CB, $00, $7B, $59, $F8, $CA, $4E, $00, $00, $7B, $0C, $6D, $6E, $00, $93, $47, $01, $04, $12, $60, $B1, $E2, $F5, $2D, $50, $D4, $CA, $8D, $B5, $68, $EC, $FE, $8C, $60, $13, $8B, $9C, $20, $39, $FF, $17, $B5, $45, $F1, $0E, $50, $D4, $CA, $CC, $B8, $EF, $F0, $CC, $80, $27, $1A, $8B, $44, $00, $39, $FF, $17, $B8, $CB, $00, $84, $59, $F8, $CA, $63, $00, $00, $84, $F4, $54, $4B, $01, $93, $47, $01, $07, $1B, $60, $B1, $E2, $3D, $85, $59, $F8, $CA, $A2, $3D, $B3, $85, $AB, $C1, $C2, $01, $93, $7B, $01, $08, $26, $60, $B5, $45, $00, $CD, $CE, $CF, $CA, $E1, $D2, $D3, $D4, $D5, $D6, $D7, $D8, $D9, $DA, $DB, $DC, $DD, $00, $DF, $E0, $E1, $E2, $E3, $E4, $CA, $F6, $E7, $E8, $E9, $EA, $EB, $EC, $ED, $EE, $EF, $F0, $F1, $F2, $00, $F4, $F5, $F6, $F7, $F8, $F9, $CB, $0B, $FC, $FD, $FE, $FF, $00, $01, $02, $03, $04, $05, $06, $07, $00, $09, $0A, $0B, $0C, $0D, $0E, $CB, $20, $11, $12, $13, $14, $15, $16, $17, $18, $19, $1A, $1B, $1C, $00, $00, $1F, $20, $21, $22, $23, $CB, $35, $26, $27, $28, $29, $2A, $2B, $2C, $2D, $2E, $2F, $30, $31, $00, $33, $34, $35, $36, $37, $38, $CB, $4A, $3B, $3C, $3D, $3E, $3F, $40, $41, $42, $43, $44, $45, $46, $00, $48, $49, $4A, $4B, $4C, $4D, $CB, $5F, $50, $51, $52, $53, $54, $55, $56, $57, $58, $59, $5A, $5B, $00, $5D, $5E, $32, $60, $20, $F6, $CB, $74, $65, $66, $67, $68, $69, $6A, $03, $00, $6D, $00, $6F, $70, $00, $72, $73, $00, $75, $76, $00, $C8, $30, $7A, $7B, $7C, $7D, $7E, $7F, $80, $81, $82, $83, $84, $85, $00, $87, $88, $7C, $27, $A6, $60, $CB, $93, $7C, $90, $00, $2E, $93, $94, $95, $96, $CB, $9D, $99, $9A, $9B, $9C, $9D, $9E, $9F, $A0, $CB, $A7, $A3, $A4, $A5, $A6, $A7, $A8, $A9, $AA, $CB, $B1, $AD, $AE, $AF, $B0, $B1, $B2, $B3, $B4, $CB, $BB, $B7, $B8, $B9, $BA, $BB, $BC, $82, $E9, $CB, $C5, $CA, $0F, $35, $D8, $06, $31, $00, $00, $CB, $CF, $00, $08, $00, $34, $00, $2D, $01, $82, $CB, $D9, $85, $C9, $FA, $34, $5A, $01, $01, $35, $CB, $E3, $2F, $00, $00, $00, $00, $00, $2D, $01, $C8, $36, $57, $36, $20, $20, $20, $0C, $90, $78, $C2, $60, $83, $78, $B2, $78, $CB, $00, $EC, $2F, $71, $FC, $00, $00, $07
; - 
; -----------------------------------------------------------
; - 
saveGameToVecFever                                        ;#isfunction  
 if  VECFEVER_FAKE = 1 
                    rts      

 endif  
saveUREG            =        starobject_list              ; 
saveSREG            =        starobject_list+2            ; 
bank0flashUserRAM   =        starobject_list+4            ; 
                    lda      flashAvailable 
                    anda     #SAVEGAME_AVAILABLE_BIT 
                    bne      saveGameIsAvailable 
saveGameIsAvailable 
                    stu      saveUREG 
                    sts      saveSREG 
                    jsr      buildShadowramFever          ; ensure the current highscore is shadowed 
SAVE_GAME_MARKER    =        12                           ;some number != 0 and != ff 
                    ldx      #gameSaveArea-storage_area 
                    lda      #SAVE_GAME_MARKER 
                    sta      ,x+ 
; write all RAM
                    ldu      #$c800 
writeNextRAMByteVF 
                    lda      ,u+ 
                    sta      ,x+ 
                    cmpu     #$cc00 
                    blo      writeNextRAMByteVF 
; jsr romifyShadowRamFever
                    ldu      #StoreHiscoreFnc             ; copy the vf switching function into place 
                    ldx      #bank0flashUserRAM 
                    lda      #1+StoreHiscoreFncEnd-StoreHiscoreFnc 
                    jsr      Move_Mem_a 
                    ldy      #$4000                       ; the 'store data' command 
                    jsr      bank0flashUserRAM            ; up up and away 
; reinit stars
; spawn 1 star!
REPLACE_1_2_initStars_varFrom1_321 
                    ldx      #0                           ; initStars 
                    jsr      jsrBank3_fromShift_1 
REPLACE_1_2_spawnStar_varFrom1_331 
                    ldx      #0                           ; spawnStar 
                    jsr      jsrBank3_fromShift_1 
; todo jump to the right "save Game spot!" (pause?)
                    lda      flashAvailable 
                    ora      # SAVEGAME_AVAILABLE_BIT     ; game available 
                    sta      flashAvailable 
REPLACE_1_2_pauseLoop_varFrom0_33                         ;  bank 2 replace 
                    ldx      #0                           ; pauseLoop 
                    jmp      jmpBank2_from1 

; - 
; -----------------------------------------------------------
; - 
loadGameFromVecFever                                      ;#isfunction  
 if  VECFEVER_FAKE = 1 
                    rts      

 endif  
                    ldx      #gameSaveArea 
                    lda      ,x+ 
                    cmpa     #SAVE_GAME_MARKER 
                    bne      loadGameFailed 
                    ldx      #gameSaveArea 
                    lda      ,x+ 
                    ldu      #$c800 
                    ldb      flashAvailable 
readNextRAMByteVF 
                    lda      ,x+ 
; skip ram places which must be kept intact
                    cmpu     #Ram_Options_Start 
                    blo      copyOk1 
                                                          ; higher than options 
                    cmpu     #Ram_Options_End 
                    bhs      copyOk1 
; no ram overwrite
                    leau     1,u 
                    bra      notCopy1 

copyOk1 
                    sta      ,u+ 
notCopy1 
                    cmpu     #$cc00 
                    blo      readNextRAMByteVF 
                    stb      flashAvailable 
                    lda      flashAvailable 
                    ora      # SAVEGAME_IS_ACTIVE_BIT     ; no game available 
                    sta      flashAvailable 
; reinit stars
; spawn 1 star!
REPLACE_1_2_initStars_varFrom1_421 
                    ldx      #0                           ; initStars 
                    jsr      jsrBank3_fromShift_1 
REPLACE_1_2_spawnStar_varFrom1_431 
                    ldx      #0                           ; spawnStar 
                    jsr      jsrBank3_fromShift_1 
; todo jump to the right "save Game spot!" (pause?)
REPLACE_1_2_pauseLoop_varFrom0_433                        ;  bank 2 replace 
                    ldx      #0                           ; pauseLoop 
                    jmp      jmpBank2_from1 

loadGameFailed 
REPLACE_1_2_optionsLoop_varFrom0_413                      ;  bank 2 replace 
                    ldx      #0                           ; optionsLoop 
                    jmp      jmpBank2_from1 

; todo
; - 
; -----------------------------------------------------------
; - 
checkForSavedGameFever 
                    lda      gameSaveArea 
                    cmpa     #SAVE_GAME_MARKER 
                    beq      yesAvailable 
                    lda      flashAvailable 
                    anda     #$ff - SAVEGAME_AVAILABLE_BIT ; no game available 
                    sta      flashAvailable 
                    rts      

yesAvailable 
                    lda      flashAvailable 
                    ora      #SAVEGAME_AVAILABLE_BIT      ; game available 
                    sta      flashAvailable 
; copy to shadow
                    rts      

; - 
; -----------------------------------------------------------
; - 
;....
; run once in the beginning
buildShadowramFever 
 if  VECFEVER_FAKE = 1 
                    rts      

 endif  
                    ldx      #storage_area 
                    ldu      #0 
continueShadowramCopy_Fever 
                    lda      ,x+ 
                    sta      ,u+ 
                    cmpx     #storage_area_end+1 
                    bne      continueShadowramCopy_Fever 
                    rts      

;....
copyOptionsToShadowram 
 if  VECFEVER_FAKE = 1 
                    rts      

 endif  
                    ldb      #OptionStruct 
                    ldx      #Ram_Options_Start 
                    ldu      #0 
nextOptionCopy_Fever 
                    lda      ,x+ 
                    sta      ,u+ 
                    decb     
                    bne      nextOptionCopy_Fever 
                    rts      

;....
copyHighScoreToShadowram 
 if  VECFEVER_FAKE = 1 
                    rts      

 endif  
                    ldb      #Ram_HardcoreScore_End - Ram_HighScore_Start 
                    ldx      #Ram_HighScore_Start 
                    ldu      #0+OptionStruct 
nextOptionCopy_Fever2 
                    lda      ,x+ 
                    sta      ,u+ 
                    decb     
                    bne      nextOptionCopy_Fever2 
                    rts      

;....
optionsToVectrexRAM 
 if  VECFEVER_FAKE = 1 
                    rts      

 endif  
; copy options data
                    ldx      #storage_area 
                    ldu      #Ram_Options_Start 
copyOptionsLoopFever 
                    lda      ,x+ 
                    sta      ,u+ 
                    cmpu     #Ram_Options_End 
                    blo      copyOptionsLoopFever 
                    lda      additionalFlags 
                    anda     #%00001111 
                    sta      additionalFlags 
                    rts      

;....
highscoreToVectrexRAM 
 if  VECFEVER_FAKE = 1 
                    rts      

 endif  
                    ldx      #storage_area 
                    ldu      #Ram_HighScore_Start 
                    leax     OptionStruct,x 
                    ldb      #HighScoreEntry*4 *2 
copyHSLoop 
                    lda      ,x+ 
                    sta      ,u+ 
                    decb     
                    bne      copyHSLoop 
                    rts      

;....
gobackFever 
 if  VECFEVER_FAKE = 1 
                    rts      

 endif  
;
;   Immediately back to menu
;
                    ldu      #ramfunctiondata             ; copy the vec4ever switching function into place 
                    ldx      #ramfunction 
                    lda      #1+ramfuncend-ramfunctiondata 
                    jsr      Move_Mem_a 
                    ldx      #$1000                       ; the 'switch back to menu' command 
                    jmp      ramfunction                  ; up up and away 

;v4e_192k_store
;                ldx     v4eStorageSize
;                ldu     #0
;                ldy     #ram_storage
;v4e_store_copy  lda     ,y+                     ; copy 6809 ram into vf shadow ram
;                sta     ,u+
;                leax    -1,x
;                bne     v4e_store_copy     
romifyShadowRamFever 
 if  VECFEVER_FAKE = 1 
                    rts      

 endif  
                    ldu      #StoreHiscoreFnc             ; copy the vf switching function into place 
                    ldx      #ramfunction 
                    lda      #1+StoreHiscoreFncEnd-StoreHiscoreFnc 
                    jsr      Move_Mem_a 
                    ldy      #$4000                       ; the 'store data' command 
                    jmp      ramfunction                  ; up up and away 

;
; the function below does the magic handshake with the cart,
; then waits for the new cart data to appear in the cart address
; space and jumps back to the v4e cart
;
StoreHiscoreFnc 
                    sta      $7ff0                        ; notify vf via write 
                    lda      ,y                           ; and put command on the bus 
                    ldd      # "g "
v4eloop             cmpd     $0                           ; while the cart is working there is only one data byte 
                    bne      v4eloop                      ; header just in case 
                    rts      

StoreHiscoreFncEnd 
;
; the function below does the magic handshake with the cart,
; then waits for the new cart data to appear in the cart address
; space and jumps back to the menu
;
ramfunctiondata 
                    stb      $7ff0                        ; notify the cart uProc via write 
                    ldb      ,x                           ; put command on the bus 
                    ldx      #0 
                    ldd      # "g "
ramloop             cmpd     0,x                          ; while the cart is setting up itself there is only one data byte 
                    bne      ramloop                      ; available, so check for .two. known and different ones 
                    leax     $D,x                         ; 0-A: "GCE xxxx",$80 / B+C: music pointer (could contain a zero..) 
ramloop2            lda      ,x+                          ; look for end of menu cart header 
                    bne      ramloop2 
                    tfr      x,pc                         ; return to menu code data 
ramfuncend 
; org $8100 
;this_is_8100
 endif  
                    include  "smartlist/drawListScale7NoShift.asm" ; still used by title pic and highscoee
                    include  "smartlist/drawListScale16NoShift.asm" ;still used by ABC
                    include  "highscore.asm"
                    include  "highScoreEdit.asm"
                    include  "enemies/enemyOther.asm"
                    include  "superdiamond.i"
bandit 
; bandit must not use the "default" stack, since we are IN the bonus handling
                    sts      bulletSpawnAt                ; save stack at "indestructable position" 
                    lds      #MY_STACK-2                  ; CBFC ; correct the stack to default address 
                    jsr      beQuiet 
 if  VECFEVER = 1 
REPLACE_1_2_jingledata_varFromIRQ0_21                     ;  bank 2 replace 
                    ldx      #0                           ;jingledata 
                    stx      sfx_pointer_1 
REPLACE_1_2_bandit2_varFrom0_1                            ;  bank 2 replace 
                    ldx      #0                           ; bandit2 
                    jmp      jmpBankIRQ2X 

 else  
                    ldd      #jingledata 
                    std      sfx_pointer_1 
REPLACE_1_2_bandit2_varFrom0_1                            ;  bank 2 replace 
                    ldx      #0                           ; bandit2 
                    jmp      jmpBankIRQ2X 

jingledata: 
                    DB       $EF, $5C, $02, $00, $8F, $8F, $8F, $8E, $8E, $AF 
                    DB       $E0, $01, $8F, $8F, $8F, $8E, $8E, $AF, $93, $01 
                    DB       $8F, $8F, $8F, $8E, $8E, $AF, $E0, $01, $8F, $8F 
                    DB       $8F, $8E, $8E, $AF, $93, $01, $8F, $8F, $8F, $8E 
                    DB       $8E, $AF, $2E, $01, $8F, $8F, $8F, $8E, $8E, $8E 
                    DB       $8E, $8D, $AD, $31, $01, $AD, $34, $01, $AD, $31 
                    DB       $01, $AC, $2E, $01, $AC, $2B, $01, $AC, $28, $01 
                    DB       $AC, $2B, $01, $AB, $2E, $01, $AB, $31, $01, $AB 
                    DB       $34, $01, $AB, $31, $01, $AA, $2E, $01, $AA, $2B 
                    DB       $01, $AA, $28, $01, $AA, $2B, $01, $A9, $2E, $01 
                    DB       $A9, $31, $01, $A9, $34, $01, $A9, $31, $01, $A8 
                    DB       $2E, $01, $A8, $2B, $01, $A8, $28, $01, $A8, $2B 
                    DB       $01, $A7, $2E, $01, $A7, $31, $01, $A7, $34, $01 
                    DB       $A7, $31, $01, $A6, $2E, $01, $A6, $2B, $01, $A6 
                    DB       $28, $01, $A6, $2B, $01, $A5, $2E, $01, $A5, $31 
                    DB       $01, $A5, $34, $01, $A5, $31, $01, $A4, $2E, $01 
                    DB       $A4, $2B, $01, $A4, $28, $01, $A4, $2B, $01, $A3 
                    DB       $2E, $01, $A3, $31, $01, $A3, $34, $01, $A3, $31 
                    DB       $01, $A2, $2E, $01, $A2, $2B, $01, $A2, $28, $01 
                    DB       $A2, $2B, $01, $A1, $2E, $01, $A1, $31, $01, $A1 
                    DB       $34, $01, $A1, $31, $01, $A0, $2E, $01, $A0, $2B 
                    DB       $01, $A0, $28, $01, $A0, $2B, $01, $A0, $2E, $01 
                    DB       $A0, $31, $01, $A0, $34, $01, $A0, $31, $01, $A0 
                    DB       $2E, $01, $A0, $2B, $01, $A0, $28, $01, $A0, $2B 
                    DB       $01, $A0, $2E, $01, $A0, $31, $01, $A0, $34, $01 
                    DB       $A0, $31, $01, $A0, $2E, $01, $A0, $2B, $01, $A0 
                    DB       $28, $01, $A0, $2B, $01, $A0, $2E, $01, $A0, $31 
                    DB       $01, $A0, $34, $01, $A0, $31, $01, $A0, $2E, $01 
                    DB       $A0, $2B, $01, $A0, $28, $01, $A0, $2B, $01, $A0 
                    DB       $2E, $01, $A0, $31, $01, $D0, $20 
extraDATENd 
                    db       0 
 endif  
