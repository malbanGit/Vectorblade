;;;;;;; *****************************************
;;;;;;; * BANK 0 *
;;;;;;; *****************************************
;***************************************************************************
;
; must be made prettier
; and better discernable
; 
; also to be done position calibration for potential overlay 
;
; for now this is a "plaything"
calString1          db       "CALIBRATION", $80
questionVectrex 
                    db       "IS YOUR VECTREX A", $80
buzzVectrex 
                    db       "BUZZ", $80
nobuzzVectrex 
                    db       "NO BUZZ", $80
buttonToConfirm 
                    db       "BUTTON 4 TO CONFIRM", $80
; a display list in y
buzzOrNoBuzz                                              ;#isfunction  
showbuzzOrNoBuzzLoop 
                    clra     
                    sta      <VIA_shift_reg 
                    JSR      Wait_Recal_noShift           ; Vectrex BIOS recalibration 
                    lda      #$4f 
                    jsr      Intensity_a 
                    _LDD     -2 ,$38 
                    std      Vec_Text_HW 
                    lda      gameScale 
                    sta      <VIA_t1_cnt_lo 
                    IRQ_TO_0_SHIFT  
                    ldd      #$50bc 
                    ldu      #questionVectrex 
                    jsr      syncPrintStrd 
                    _ZERO_VECTOR_BEAM  
                    ldd      #$3098 
                    ldu      #buzzVectrex 
                    jsr      syncPrintStrd 
                    _ZERO_VECTOR_BEAM  
                    ldd      #$3010 
                    ldu      #nobuzzVectrex 
                    jsr      syncPrintStrd 
                    _ZERO_VECTOR_BEAM  
                    ldd      #$d0b0 
                    ldu      #buttonToConfirm 
                    jsr      syncPrintStrd 
                    _ZERO_VECTOR_BEAM  
                    lda      additionalFlags 
                    anda     #1 
                    bne      isNoBuzz 
isBuzz 
; draw lines
REPLACE_1_2_drawBuzzBox_varFromIRQ1_1 
                    ldx      #0                           ; drawBuzzBox 
                    jsr      jsrBank1X 
                    bra      buzzdrawDone 

isNoBuzz 
REPLACE_1_2_drawNoBuzzBox_varFromIRQ1_1 
                    ldx      #0                           ; drawNoBuzzBox 
                    jsr      jsrBank1X 
buzzdrawDone 
                    jSR      queryJoystick                ;Joy_Digital 
                    LDA      Vec_Joy_1_X 
                    BEQ      noJoyChange 
                    bpl      buzGoRight 
                    lda      additionalFlags 
                    anda     #%11111110 
                    sta      additionalFlags 
                    bra      noJoyChange 

buzGoRight 
                    lda      additionalFlags 
                    ora      #1 
                    sta      additionalFlags 
noJoyChange 
                    JSR      Read_Btns                    ; get button status 
                    ldb      $C811                        ; button pressed - any 
                    andb     #1                           ; button 4 
                    beq      noCalibHelp1 
                    ldy      #displayList1 
                    jsr      showMESSAGE 
                    ldy      #displayList2 
                    jsr      showMESSAGE 
                    lbeq     showbuzzOrNoBuzzLoop 
noCalibHelp1 
                    ldb      $C811                        ; button pressed - any 
                    andb     #8                           ; button 4 
                    lbeq     showbuzzOrNoBuzzLoop         ; 
                    rts      

;
; .....................................................
;
initCalibration1                                          ;#isfunction  
                    jsr      buzzOrNoBuzz 
; for boss display we must init a shot list
REPLACE_1_2_initPlayerShotList_varFrom1_1 
                    ldx      #0                           ; initPlayerShotList 
                    jsr      jsrBank3_from0_SHIFT 
;
REPLACE_1_2_playerShotsDoneBoss01_varFrom0_1 
                    ldd      #0                           ; playerShotsDoneBoss01 
                    std      PLAYERSHOTS_DONE_A 
                    clr      calibrationStage 
; enable joystick - values destroyed "in game"
                    lda      #1 
                    sta      $C81F 
                    lda      #3 
                    sta      $C820 
                    clra     
                    sta      leftSmallGunAnimStart 
                    sta      rightSmallGunAnimStart 
                    sta      leftBigGunAnimStart 
                    sta      rightBigGunAnimStart 
                    sta      tmp1 
                    sta      eyeLeftAnimCounter 
                    ldd      #0 
                    std      bossPosY 
; loop thru all calibrations
nextCalibration 
                    CLR      Vec_Music_Flag               ; no music is playing ->0 (is placed in rottist! 
                    JSR      Init_Music_Buf               ; shadow regs 
                    JSR      Do_Sound                     ; ROM function that does the sound playing, here used to clear all regs 
                    clr      calibButton 
                    jsr      calibrationLopp              ; size 
                    inc      calibrationStage 
                    ldx      #calibrationSubs 
                    lda      calibrationStage 
                    lsla     
                    ldd      a,x 
                    bne      nextCalibration 
                    lda      additionalFlags 
                    ora      #BIT_RAN_CALIBRATION 
                    sta      additionalFlags 
                    jsr      saveBlockOnChange 
againB 
                    JSR      Read_Btns                    ; get button status 
                    ldb      $C80f                        ;11 ; button pressed - any 
                    andb     #$08                         ; button 4 return 
                    bne      againB 
                    clr      Vec_Loop_Count 
REPLACE_1_2_main01_varFrom0_3                             ;  bank 0 replace 
                    ldx      #0                           ; main01 
                    jmp      jmpBankIRQ2X 

;
; .....................................................
;
calib50                                                   ;#isfunction  
                    ldb      $C811                        ; button pressed - any 
                    andb     #1 
                    beq      noBossHelp 
                    ldy      #displayListBoss 
                    jsr      showMESSAGE 
                    jmp      calibrationLopp              ; and repeat forever 

noBossHelp 
                    ldx      #calibrationValue50 
                    jsr      adjustCalibration 
                    lda      #DEFAULT_ENEMY_INTENSITY 
                    jsr      Intensity_a 
                    lda      #BOSS_SPRITE_SCALE 
                    sta      boss1Scale 
                    ldd      #$20f6 
                    std      bossPosY 
                    lda      diverseFlags 
                    ora      #BIT_FLAG_IS_BOSSFIGHT_ANY 
                    sta      diverseFlags 
REPLACE_1_2_displayBoss1L_varFrom0_7                      ;  bank 0 replace 
                    ldx      #0                           ; displayBoss1 
                    jsr      jsrBank2_fromShift_0 
                    clra     
                    sta      <VIA_shift_reg 
                    jmp      calibrationLopp              ; and repeat forever 

;
; .....................................................
;
calibText                                                 ;#isfunction  
                    ldb      $C811                        ; button pressed - any 
                    andb     #1 
                    beq      noTextHelp 
                    ldy      #displayList3 
                    jsr      showMESSAGE 
                    ldy      #displayList4 
                    jsr      showMESSAGE 
                    jmp      calibrationLopp              ; and repeat forever 

noTextHelp 
; reference line!
                    lda      #DEFAULT_ENEMY_INTENSITY 
                    jsr      Intensity_a 
                    ldd      #$5240 
                    jsr      MoveToD 
                    ldd      #$0080 
                    jsr      DrawLined 
                    ldx      #calibrationValueString 
                    jsr      adjustCalibration 
REPLACE_1_2_displayCalibrationText_varFrom0_0             ;  bank 0 replace 
                    ldx      #0                           ;displayCalibrationText 
                    jsr      jsrBank2_fromShift_0 
                    jmp      calibrationLopp              ; and repeat forever 

;
; .....................................................
;
calib16                                                   ;#isfunction  
                    ldb      $C811                        ; button pressed - any 
                    andb     #1 
                    beq      noTextHelp2 
                    ldy      #displayList4 
                    jsr      showMESSAGE 
                    jmp      calibrationLopp              ; and repeat forever 

noTextHelp2 
                    lda      #DEFAULT_ENEMY_INTENSITY 
                    jsr      Intensity_a 

                    ldd      #$6640 
                    jsr      MoveToD 
                    ldd      #$0080 
                    jsr      DrawLined 

                    ldx      #calibrationValue16 
                    jsr      adjustCalibration 
REPLACE_1_2_displayHSCalibrationText_varFromIRQ1_3        ;  bank 0 replace 
                    ldx      #0                           ;displayHSCalibrationText 
                    jsr      jsrBank1_fromBank0_T1 
                    lda      gameScale 
                    sta      <VIA_t1_cnt_lo 
                    ldd      #$1040 
                    jsr      MoveToD 
                    ldd      #$0080 
                    jsr      DrawLined 
                    _ZERO_VECTOR_BEAM  
REPLACE_1_2_printCalibrationOptionText_varFrom0_3         ;  bank 0 replace 
                    ldx      #0                           ; printCalibrationOptionText 
                    jsr      jsrBank2_fromShift_0 
                    IRQ_TO_0_T1  
                    jmp      calibrationLopp              ; and repeat forever 

;
; .....................................................
;
calib09                                                   ;#isfunction  
                    ldb      $C811                        ; button pressed - any 
                    andb     #1 
                    beq      noNormalHelp 
                    ldy      #displayListNormal 
                    jsr      showMESSAGE 
                    jmp      calibrationLopp              ; and repeat forever 

noNormalHelp 
                    ldx      #calibrationValue7 
                    bsr      adjustCalibration 
                    lda      #DEFAULT_ENEMY_INTENSITY 
                    _INTENSITY_A  
REPLACE_1_2_displaySpriteCalibration_varFrom1_1 
                    ldx      #0                           ; displaySpriteCalibration 
                    jsr      jsrBank3_from0_SHIFT 
                    jmp      calibrationLopp              ; and repeat forever 

;
; .....................................................
;
calibSwarm                                                ;#isfunction  
                    ldb      $C811                        ; button pressed - any 
                    andb     #1 
                    beq      noSwarmHelp 
                    ldy      #displayListSwarm 
                    jsr      showMESSAGE 
                    jmp      calibrationLopp              ; and repeat forever 

noSwarmHelp 
                    lda      #DEFAULT_ENEMY_INTENSITY 
                    jsr      Intensity_a 
                    ldx      #calibrationValue6 
                    bsr      adjustCalibration 
REPLACE_1_2_displaySwarmCalibration_varFrom1_1 
                    ldx      #0                           ; displaySwarmCalibration 
                    jsr      jsrBank3_from0_SHIFT 
                    jmp      calibrationLopp              ; and repeat forever 

;
; .....................................................
;
adjustCalibration 
                    lda      Vec_Loop_Count+1 
                    anda     #1 
                    beq      joyDoneSwarm 
                    LDA      Vec_Joy_1_Y 
                    BEQ      joyDoneSwarm 
                    BMI      left_moveSwarm 
right_moveSwarm: 
                    dec      ,x 
                    bra      joyDoneSwarm 

left_moveSwarm: 
                    inc      ,x 
                    bra      joyDoneSwarm 

joyDoneSwarm 
                    lda      $C811 
                    anda     #2                           ; button 2 
                    beq      buttonsDone1_6 
                    inc      ,x 
                    bra      buttonsDone__16 

buttonsDone1_6 
                    lda      $C811 
                    anda     #4                           ; button 3 
                    beq      buttonsDone__16 
                    dec      ,x 
buttonsDone__16 
                    rts      

;
; .....................................................
;
calibSize                                                 ;#isfunction  
                    ldb      $C811                        ; button pressed - any 
                    andb     #1 
                    beq      noSizeHelp 
                    ldy      #displayListSize 
                    jsr      showMESSAGE 
                    jmp      calibrationLopp              ; and repeat forever 

noSizeHelp 
                    lda      #DEFAULT_ENEMY_INTENSITY 
                    jsr      Intensity_a 
                    lda      Vec_Loop_Count+1 
                    anda     #1 
                    beq      joyDoneCalibSize 
; react to joystick input
                    LDA      Vec_Joy_1_Y 
                    BEQ      joyDoneCalibSize 
                    BMI      left_moveSize 
right_moveSize 
                    inc      gameScale 
                    lda      gameScale 
                    cmpa     #$a0 
                    bls      joyDoneCalibSize 
                    lda      #$a0 
                    sta      gameScale 
                    bra      joyDoneCalibSize 

left_moveSize 
                    dec      gameScale 
                    lda      gameScale 
                    cmpa     #$60 
                    bhs      joyDoneCalibSize 
                    lda      #$60 
                    sta      gameScale 
                    bra      joyDoneCalibSize 

joyDoneCalibSize 
; display sizings
                    _ZERO_VECTOR_BEAM  
                    jsr      Reset_Pen 
                    lda      gameScale 
                    sta      <VIA_t1_cnt_lo 
                    lda      Vec_0Ref_Enable 
                    pshs     a 
                    clr      Vec_0Ref_Enable 
                    ldd      #$7f7f 
                    jsr      MoveToD 
                    ldd      #$8000 
                    jsr      DrawLined 
                    ldd      #$8000 
                    jsr      DrawLined 
                    ldd      #$80 
                    jsr      DrawLined 
                    ldd      #$80 
                    jsr      DrawLined 
                    ldd      #$7f00 
                    jsr      DrawLined 
                    ldd      #$7f00 
                    jsr      DrawLined 
                    ldd      #$7f 
                    jsr      DrawLined 
                    ldd      #$7f 
                    jsr      DrawLined 
                    puls     a 
                    sta      Vec_0Ref_Enable 
                    _ZERO_VECTOR_BEAM  
                    ldd      # "00"
                    std      player_score 
                    std      player_score+2 
                    std      player_score+4 
                    lda      #$80 
                    sta      player_score+6 
                    lda      gameScale 
                    ldx      #player_score 
                    jsr      Add_Score_a 
                    jsr      Strip_Zeros 
                    ldd      #$00d0 
                    ldu      #player_score 
                    jsr      Print_Str_d 
                    bra      calibrationLopp              ; and repeat forever 

;
; .....................................................
;
calibrationSubs 
                    dw       calibText                    ; scale 25 
                    dw       calib16 
                    dw       calibSize 
                    dw       calibSwarm 
                    dw       calib50 
                    dw       calib09 
                    dw       0 
;
; .....................................................
;
calibrationLopp 
                    clra     
                    sta      <VIA_shift_reg 
                    JSR      Wait_Recal_noShift           ; Vectrex BIOS recalibration 
                    lda      #$4f 
                    _INTENSITY_A  
                    IRQ_TO_0_SHIFT  
                    lda      #-2 
                    sta      Vec_Text_Height 
                    lda      #$80 
                    sta      <VIA_t1_cnt_lo 
                    ldd      #$90b8 
                    ldu      #calString1 
                    jsr      sync_Print_Str_d_fixed_8 
                    _ZERO_VECTOR_BEAM  
                    IRQ_TO_0_SHIFT  
                    jSR      queryJoystick                ;Joy_Digital 
                    JSR      Read_Btns                    ; get button status 
                    ldb      $C811                        ; button pressed - any 
                                                          ; if any button pressed - finish 
                    andb     #8                           ; button 4 
                    beq      no_button                    ; 
buttonPressed 
                    lda      #1 
                    sta      tmp1 
                    bra      buttonPressedDone 

no_button: 
                    tst      tmp1 
                    beq      buttonPressedDone 
                    clr      tmp1 
                    inc      calibButton                  ; only counts as pressed, when pressed and RELEASED! 
                    rts      

buttonPressedDone 
                    ldx      #calibrationSubs 
                    lda      calibrationStage 
                    lsla     
                    jmp      [a,x] 

;
; .....................................................
;
MoveToD 
                    STA      <VIA_port_a                  ;Store Y in D/A register 
                    LDA      #$CE                         ;Blank low, zero high? 
                    STA      <VIA_cntl                    ; 
                    CLRA     
                    STA      <VIA_port_b                  ;Enable mux 
                    nop      
                    nop      
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    inca     
                    sta      <VIA_port_b                  ;Disable mux 
                    deca     
 else  
                    INC      <VIA_port_b                  ;Disable mux 
 endif  
                    STB      <VIA_port_a                  ;Store X in D/A register 
                    STA      <VIA_t1_cnt_hi               ;enable timer 
                    MY_MOVE_TO_A_END  
                    rts      

;
; .....................................................
;
DrawLined 
                    sta      <VIA_port_a                  ; 4 
                    clra     
                    sta      <VIA_port_b                  ; 4 
                    inca     
                    nop      2 
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
                    nop      4 
                    stb      <VIA_cntl                    ; 
                    rts      

;
; .....................................................
;
