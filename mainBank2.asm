; following is needed for VIDE
; to replace "vars" in this bank with values from the other bank
; #genVarlist# varFrom0
;
CURRENT_BANK        EQU      2                            ; 
                    Bank     2 
                    include  "commonGround.i"
optionsMenu 
                    db       $40, $c0 , "DIFFICULTY",$80
afterDifficult 
                    db       $30, $c0 , "MODE",$80
                    db       $20, $c0 , "CALIBRATE",$80
                    db       $10, $c0 , "RESET",$80
                    db       $00, $c0 , "SECRETS",$80
afterSecrets 
                    db       -$40, $c0 , "BACK",$80
                    dw       0 
OPTION_DIFFICULTY   =        0 
OPTION_MODE         =        1 
OPTION_CALIBRATE    =        2 
OPTION_RESET        =        3                            ; 
OPTION_SECRETS      =        4                            ; 
OPTION_BACK         =        5 
MAX_OPTION          =        OPTION_BACK 
                    dw       dif_hc 
difficultyStrings2 
                    dw       dif_e 
                    dw       dif_n 
                    dw       dif_h 
                    dw       dif_i 
                    dw       dif_s 
dif_e 
                    db       "EASY", $80
                    dw       0 
dif_n 
                    db       "NORMAL", $80
                    dw       0 
dif_h 
                    db       "HARD", $80
                    dw       0 
dif_i 
                    db       "ABSURD", $80
                    dw       0 
dif_s 
                    db       "MANIAC", $80
                    dw       0 
dif_hc 
                    db       "HARDCORE", $80
                    dw       0 
 if  TIMER_LEVEL 
dif_tt 
                    db       "TIME TRIAL", $80
                    dw       0 
 endif  
;
;***************************************************************************
; CODE SECTION
;***************************************************************************
main_0_0:                                                 ;#isfunction  
main00 
                    clr      isDemoMode 
; init VecVox
 if  TEST_VOX = 1 
REPLACE_1_2_voxInit_varFromIRQ0_1 
                    ldx      #0                           ;voxInit 
                    jsr      jsrBank0_fromBank2_Shift 
 endif  
                    lda      #DEFAULT_DIFFICULTY 
                    sta      difficulty 
; if not done before -> do calibration -> than a warm reset
                    lda      #%10110011 
                    sta      random_seed 
                    lda      #%01100111 
                    sta      random_seed2 
                    lds      #MY_STACK                    ; CBFC correct the stack to default address (Overwriting IRQ vectors etc) 
                    lda      #1 
                    sta      current_button_state 
                    sta      last_button_state 
                    clr      additionalFlags 
REPLACE_1_2_checkFlash_varFromIRQ0_1 
                    ldx      #0                           ;checkFlash 
                    jsr      jsrBank0_fromBank2_Shift 
 if  VECFEVER = 1 
 else  
                    lda      flashAvailable 
                    anda     #FLASH_AVAILABLE_BIT 
                    bne      doFlashInit 
REPLACE_1_2_displayFlashError_varFromIRQ0_12 
                    ldx      #0                           ;displayFlashError 
                    jmp      jmpBankIRQ0Shift 

doFlashInit 
REPLACE_1_2_initFlash_varFromIRQ0_1 
                    ldx      #0                           ;initFlash 
                    jsr      jsrBank0_fromBank2_Shift 
 endif  
                    clr      joystickDir 
fromGameOver 
                    lds      #MY_STACK                    ; CBFC correct the stack to default address (Overwriting IRQ vectors etc) 
                    lda      #1 
                    sta      current_button_state 
                    sta      last_button_state 
                    lda      diverseFlags 
                    ora      #%00000010 
                    sta      diverseFlags 
againB1 
                    JSR      Read_Btns                    ; get button status 
                    ldb      $C811                        ; button pressed - any 
                    andb     #$ff 
                    bne      againB1 
                    lda      additionalFlags 
                    anda     #BIT_RAN_CALIBRATION 
                    lbne     main01                       ; calibration was already done! 
REPLACE_1_2_showFirstHelp_varFromIRQ0_1 
                    ldx      #0                           ;showFirstHelp 
                    jmp      jmpBankIRQ0Shift 

;***************************************************************************
LoadDisk 
                    db       -$42, $01, $44, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, $10, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0A, $01, $00, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $00, $01, -$10 
                    db       $0A, $01, $00 
                    db       -$0C, $01, -$4F, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       $00, $01, $5B, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $5B, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $00, $01, -$5B, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$5B, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $57, $01, $37, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       $00, $01, $18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$30, $01, $00, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $00, $01, -$18 
                    db       $30, $01, $00 
                    db       $07, $01, $23, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$3F, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$69, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $3F, $01, $00 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
;***************************************************************************
beQuiet 
                    ldd      #0 
                    std      sfx_pointer_3 
                    std      sfx_pointer_2 
                    std      sfx_pointer_1 
                    CLR      Vec_Music_Flag               ; no music is playing ->0 (is placed in rottist! 
                    JSR      Init_Music_Buf               ; shadow regs 
                    jmp      Do_Sound                     ; ROM function that does the sound playing, here used to clear all regs 
;                    rts      

exitOptions 
                    lda      difficulty 
                    cmpa     #HARDCORE 
                    bne      notHardcore 
                    lda      #$80 
                    sta      difficulty 
notHardcore 
                    jmp      fromGameOver 

doOptions 
 if  MAX_LEVEL_SELECT_ALLOWED = 1 
                    lda      #100 
                    sta      maxLevelReached 
 endif  
                    bsr      beQuiet 
                    clr      optionDir 
                    LDA      #1                           ; 
                    STA      Vec_Joy_Mux_1_X              ; 
                    LDA      #3                           ; 
                    STA      Vec_Joy_Mux_1_Y              ; 
                    lda      #OPTION_BACK                 ;4 ; default on BACK 
                    sta      selectedOption 
optionsLoop 
                    lda      selectedOption 
                    cmpa     #OPTION_DIFFICULTY 
                    bne      noJoy 
                    lda      Vec_Joy_1_X 
                    beq      noLevelChange 
                    bmi      levelDec 
levelInc 
                    inc      chosenStartLevel 
                    lda      chosenStartLevel 
                    cmpa     maxLevelReached 
                    blo      noLevelChange 
                    lda      maxLevelReached 
                    sta      chosenStartLevel 
                    bra      noLevelChange 

levelDec 
                    dec      chosenStartLevel 
                    lda      chosenStartLevel 
                    bpl      noLevelChange 
                    clr      chosenStartLevel 
noLevelChange 
noJoy 
                    JSR      Read_Btns                    ; get button status 
                    lda      $C811 
                    lbeq     noButtonPressedOptions 

 if ADDITIONAL_INPUT = 1
 bita #2
 bne goleft_O
 bita #4
 bne goRight_O
 bra JoyDone_O1
goleft_O
                    ldb      #-10 
 bra JoyDone_O
goRight_O
                    ldb      #10 
JoyDone_O
 endif
                    stb      Vec_Joy_1_Y 
; do not reakt on buttons that we just mapped
 jmp noButtonPressedOptions_buttonwaspressed

JoyDone_O1
                    bita     #1 
                    beq      noOptionHelp 
REPLACE_1_2_showOptionHelp_varFromIRQ0_1 
                    ldx      #0                           ;showOptionHelp 
                    jmp      jmpBankIRQ0Shift 

noOptionHelp 
                    bita     #2 
                    beq      noMH 
                    jsr      beQuiet 
                    jmp      displayTitlePic1 

noMH 
                    lda      selectedOption 
                    cmpa     #OPTION_BACK 
                    lbeq     exitOptions 
                    cmpa     #OPTION_RESET 
                    lbeq     doReset 
                    cmpa     #OPTION_SECRETS 
                    lbeq     doSecrets 
                    cmpa     #OPTION_CALIBRATE 
                    lbeq     doCalib0 
                    cmpa     #OPTION_MODE 
                    lbeq     doMode 
                    cmpa     #OPTION_DIFFICULTY 
                    bne      notDifficultOption 
                    inc      difficulty 
                    lda      difficulty 
                    anda     #$f 
                    cmpa     #SUPER_IMPOSSIBLE 
                    bls      diffOc 
                    lda      difficulty 
                    anda     #$f0 
                    sta      difficulty 
                    bra      difOk 

diffOc 
                    cmpa     #SUPER_IMPOSSIBLE 
                    bne      notSuperImpossible 
                    ldb      achievements + 2 
                    bitb     #ACHIEVEMENT_FLAG_BYTE3_BLADEMASTER_RANK2 
                    bne      difOk 
                    ldb      difficulty 
                    andb     #$f0 
                    stb      difficulty 
notSuperImpossible 
                    cmpa     #IMPOSSIBLE 
                    bne      notImpossible 
                    ldb      achievements + 2 
                    bitb     #ACHIEVEMENT_FLAG_BYTE3_BLADEMASTER_RANK3 
                    bne      difOk 
                    ldb      difficulty 
                    andb     #$f0 
                    stb      difficulty 
notImpossible 
                    cmpa     #HARD 
                    bne      notHard 
                    ldb      achievements + 2 
                    bitb     #ACHIEVEMENT_FLAG_BYTE3_BLADEMASTER_RANK4 
                    bne      difOk 
                    ldb      difficulty 
                    andb     #$f0 
                    stb      difficulty 
notHard 
                    cmpa     #NORMAL 
                    bne      notNormal 
                    ldb      achievements + 2 
                    bitb     #ACHIEVEMENT_FLAG_BYTE3_BLADEMASTER_RANK5 
                    bne      difOk 
                    ldb      difficulty 
                    andb     #$f0 
                    stb      difficulty 
notNormal 
                    cmpa     #EASY 
                    bne      notEasy 
                    ldb      difficulty 
                    andb     #$f0 
                    addb     #SUPER_IMPOSSIBLE 
                    stb      difficulty 
notEasy 
difOk 
notDifficultOption 
noButtonPressedOptions 
                                                          ; jsr Joy_Digital 
                    jsr      JoyDigitalHorizontal00 
                    jsr      JoyDigitalVertical00 
noButtonPressedOptions_buttonwaspressed 
                    lda      Vec_Joy_1_Y 
                    beq      noChangeSelPos 
                    bmi      selPosAdvance 
                    lda      optionDir 
                    bmi      noChangeSelPos2 
                    lda      selectedOption 
 if ADDITIONAL_INPUT = 1
                    beq      toggleInput 
 else
                    beq      noChangeSelPos 
 endif


                    dec      selectedOption 
                    lda      #-1 
                    sta      optionDir 
                    bra      noChangeSelPos2 
 if ADDITIONAL_INPUT = 1

toggleInput
REPLACE_1_2_toggleInputOption_varFromIRQ0_1 
                    ldx      #0                           ;toggleInputOption 
                    jmp      jmpBankIRQ0Shift 
 endif
doMode 
                    ldb      difficulty 
                    bpl      selectHardcore 
; here either negative 
; or != 0 positive
 if  TIMER_LEVEL = 1 
                    bmi      makeTimerTrial 
makeNormal 
                    andb     #$f 
                    bra      stroeDif2 

makeTimerTrial 
                    andb     #$f 
                    orb      #%01000000 
                    bra      stroeDif2 

 endif  
                    andb     #$f 
stroeDif2 
                    stb      difficulty 
                    bra      noChangeSelPos2 

selectHardcore 
                    orb      #$80 
                    stb      difficulty 
                    bra      noChangeSelPos2 

selPosAdvance 
                    lda      optionDir 
                    cmpa     #1 
                    beq      noChangeSelPos2 
                    lda      selectedOption 
                    cmpa     #MAX_OPTION 
                    beq      saveGameCheck                ; noChangeSelPos 
                    inc      selectedOption 
                    lda      #1 
                    sta      optionDir 
                    bra      noChangeSelPos2 

saveGameCheck 
 if  RECORD_GAME_DATA = 1 
                    bra      doNotLoadAfterAll 

 endif  
                    lda      flashAvailable 
                    anda     # SAVEGAME_AVAILABLE_BIT     ; no game available 
                    lbeq     noChangeSelPos 
; save game is availabel and "asked for
REPLACE_1_2_showLoadMessage_varFromIRQ0_54 
                    ldx      #0                           ;showLoadMessage 
                    jsr      jsrBank0_fromBank2_Shift 
                    cmpu     #3                           ; yes 
                    bne      doNotLoadAfterAll 
 if  ALLOW_SAVING = 1 
 if  VECFEVER = 1 
REPLACE_1_2_loadGameFromVecFever_varFromIRQ1_1 
                    ldx      #0                           ;loadGameFromVecFever 
                    jmp      jmpBankIRQ1Shift 

 else  
REPLACE_1_2_loadGameFromFlash_varFromIRQ0_123 
                    ldx      #0                           ;loadGameFromFlash 
                    jmp      doShiftIRQ 

 endif  
 endif  
doNotLoadAfterAll 
noChangeSelPos 
                    clr      optionDir 
noChangeSelPos2 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    JSR      my_wait_recal                ;Wait_Recal 
 else  
                    JSR      Wait_Recal 
 endif  
                    ldd      #$8100 
                    std      <VIA_port_b 
                    deca     
                    sta      <VIA_port_b 
                    ldb      >calibrationValue16 
                    lda      additionalFlags 
                    anda     #%00000001 
                    bne      buzzVectrex16 
                    lda      #$82 
                    std      <VIA_port_b 
                    ldd      #$83FF                       ; 2 cycles 
                    stb      <VIA_port_a 
                    sta      <VIA_port_b 
                    bra      calibDone16 

buzzVectrex16 
                    lda      #$82 
                    std      <VIA_port_b 
                    ldd      #$83FF                       ; 2 cycles 
                    stb      <VIA_port_a 
                    nop      2 
                    sta      <VIA_port_b 
calibDone16 
                    jsr      Intensity_3F 
                    lda      #16                          ;OBJECT_SCALE 
                    sta      stringScale 
                    clr      currentPrintedOption 
; ------ print Menu Start
                    ldu      #optionsMenu 
printVectorStringList7 
modeCheckDone 
                    lda      currentPrintedOption 
                    cmpa     selectedOption 
                    bne      notSelected1 
                    jsr      Intensity_5F 
notSelected1 
                    lda      gameScale 
                    sta      <VIA_t1_cnt_lo 
                    ldd      ,u++ 
                    jsr      printOneVectorString_D 
                    _ZERO_VECTOR_BEAM  
                    lda      currentPrintedOption 
                    cmpa     selectedOption 
                    bne      notSelected2 
                    jsr      Intensity_3F 
notSelected2 
                    inc      currentPrintedOption 
                    ldd      ,u 
                    bne      printVectorStringList7 
optionPrintDone 
; output new MODE
                    _ZERO_VECTOR_BEAM  
                    lda      gameScale 
                    sta      <VIA_t1_cnt_lo 
                    ldu      #dif_n 
                    lda      difficulty 
                    bpl      notHardcoreMode 
                    ldu      #dif_hc 
notHardcoreMode 
 if  TIMER_LEVEL 
                    lda      difficulty 
                    anda     #%01000000 
                    beq      noTimeTrial 
                    ldu      #dif_tt 
noTimeTrial 
 endif  
                    ldd      #$3010 
                    bsr      printOneVectorString_D 
                    _ZERO_VECTOR_BEAM  
                    lda      gameScale 
                    sta      <VIA_t1_cnt_lo 
                    lda      difficulty 
                    anda     #0x0f 
                    lsla     
                    ldu      #difficultyStrings2 
                    ldu      a,u 
                    ldd      #$4010 
                    bsr      printOneVectorString_D 
                    _ZERO_VECTOR_BEAM  
                    lda      gameScale 
                    sta      <VIA_t1_cnt_lo 
                    ldb      chosenStartLevel 
                    incb     
; change with Joy left right
                    sex      
                    ldu      #levelConversionString 
                    jsr      wordToDecString 
                    leau     2,u 
                    jsr      leadingZeroToSpace 
                    ldd      #$4095 
                    ldu      #levelConversionString +2 
                    bsr      printOneVectorString_D 
                    _ZERO_VECTOR_BEAM  
 if  ALLOW_SAVING = 1 
                    lda      flashAvailable 
                    anda     # SAVEGAME_AVAILABLE_BIT     ; no game available 
                    lbeq     optionsLoop 
                    lda      gameScale 
                    sta      <VIA_t1_cnt_lo 
                    ldd      #$a8c8 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    jsr      my_Moveto_d                  ; Moveto_d 
 else  
                    JSR      Moveto_d 
 endif  
                    lda      #7 
                    sta      <VIA_t1_cnt_lo 
                    ldu      #LoadDisk 
                    jsr      SMVB_drawSmart 
 endif  
; ------ print Menu End
                    jmp      optionsLoop 

; in U pointer to string
; in D position
printOneVectorString_D 
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    lda      stringScale 
                    sta      <VIA_t1_cnt_lo 
                    ldy      #Alphabet-64                 ; font starts at 32, *2 because of 16 bit pointer 
                    lda      #-1 
                    MY_MOVE_TO_B_END  
                    sta      <VIA_port_a 
                    clra     
                    sta      <VIA_port_b 
                    ldb      ,u+ 
nextLetter2_72_2 
                    lslb                                  ; must be d, because otherwise it could be "negative" 
                    ldx      d,y 
                    Draw_VLp_lessGap7  
                    ldb      ,u+ 
                    bpl      nextLetter2_72_2 
donePrintVectorString3_72 
                    rts      

 if  IS_VIA_FAULTY_RESISTENT = 1 
my_Moveto_d 
myMovetod 
                    MY_MOVE_TO_D_START  
                    MY_MOVE_TO_B_END  
                    rts      

myWaitRecal 
 endif  
my_wait_recal 
                    MY_WAIT_RECAL  
                    rts      

doCalib0 
REPLACE_1_2_initCalibration1_varFromIRQ0_1                ;  bank 1 replace 
                    ldx      #0                           ; initCalibration1 
                    jmp      jmpBankIRQ0Shift 

;;main_01 
main01 
                    lda      #25                          ; wait 1/2 second until button reacts again 
                    sta      buttonWait 
                    jsr      beQuiet 
                    jsr      initTitleRAM 
                    lda      additionalFlags 
                    anda     #BIT_TITLE_SEEN 
                    bne      noTitleTitle 
displayTitlePic1 
 if  SKIP_TITLE_SCREEN = 1 
 else  
REPLACE_1_2_displayTitlePicture_varFromIRQ1_1             ;  bank 1 replace 
                    ldx      #0                           ; displayTitlePicture 
                    jsr      jsrBank1_fromBank2_T1 
 endif  
noTitleTitle 
                    lda      #1 
                    sta      songLoop 
REPLACE_1_2_titleMusic_varFromIRQ1_1 
                    ldu      #0                           ; titleMusic 
REPLACE_1_2_PLYINIT_varFromIRQ1_1 
                    ldx      #0                           ; PLYINIT 
                    jsr      jsrBank1_fromBank2_T1 
REPLACE_1_2_initAllTitle_varFromIRQ0_1 
                    ldx      #0                           ; initAllTitle 
                    jsr      jsrBank0_fromBank2_T1 
Titleloop1 
title_0_0                                                 ;#isfunction  
                    RANDOM_A                              ; random number of random inits (till player hits a button) 
                    RANDOM_A2  
                    clra     
                    dec      buttonWait 
                    bpl      bwok 
                    clr      buttonWait 
bwok 
                    sta      <VIA_shift_reg 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    JSR      my_wait_recal                ;Wait_Recal 
 else  
                    JSR      Wait_Recal 
 endif  
REPLACE_1_2_playAKSMusic_varFromIRQ1_1 
                    ldx      #0                           ; playAKSMusic 
                    jsr      jsrBank1_fromBank2_T1 
                    JSR      Read_Btns                    ; get button status 
                    tst      buttonWait 
                    bne      doNotStartGame 


 if ADDITIONAL_INPUT = 1
 ldb additionalFlags
 andb #BIT_INPUT_VARIANT
 beq defaultTitleInput

                    ldb      $C811                        ; button pressed - any 
                    andb     #$f                          ; is button 1 
                    beq      doNotStartGame 

 cmpb #1
 lbeq doStartGame
 cmpb #2
 lbeq doOptions
 cmpb #4
 lbeq HighScoreTest_Start
 cmpb #8
 lbeq doAchiements


defaultTitleInput
 endif


                    lda      joystickDir 
                    beq      doNotStartGame2 
                    ldb      $C811                        ; button pressed - any 
                    andb     #$f                          ; is button 1 
                    beq      doNotStartGame 
                    cmpa     #RIGHT 
                    lbeq     doOptions                    ; doCalib0 
                    cmpa     #LEFT 
                    lbeq     doAchiements                 ;majorHavocB2 
                    cmpa     #UP 
                    beq      doStartGame 
                    cmpa     #DOWN 
                    lbeq     HighScoreTest_Start 
; if no direction, but a button was pressed - display help
doNotStartGame2 
                    ldb      $C811                        ; button pressed - any 
                    andb     #$7                          ; is button 1 
                    beq      doNotStartGame 
REPLACE_1_2_showTitleHelp_varFromIRQ0_1 
                    ldx      #0                           ;showTitleHelp 
                    jmp      jmpBankIRQ0Shift 

doStartGame 
REPLACE_1_2_readyPlayerOne_varFromIRQ0_1                  ;  bank 1 replace 
                    ldx      #0                           ;readyPlayerOne 
                    jsr      jsrBank0_fromBank2_T1 
REPLACE_1_2_main11_varFrom1_1                             ;  bank 1 replace 
                    ldx      #0                           ; main11 
                    jmp      jmpBank1X 

doNotStartGame 
REPLACE_1_2_oneVBTitleStep_varFromIRQ0_1 
                    ldx      #0                           ; oneVBTitleStep 
                    jsr      jsrBank0_fromBank2_Shift 
                    jmp      title_0_0 

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
 if  RECORD_GAME_DATA = 1 
                    tst      saveState 
                    bne      loadButtonData 
                    tfr      a,b 
                    stb      buttonTmp 
REPLACE_1_2_putOneInputByte_varFromIRQ0_1 
                    ldx      #0                           ;putOneInputByte 
                    jsr      jsrBank0_fromBank2_T1 
                    lda      buttonTmp 
                    bra      contButton 

loadButtonData 
REPLACE_1_2_getOneInputByte_varFromIRQ0_1 
                    ldx      #0                           ;getOneInputByte 
                    jsr      jsrBank0_fromBank2_T1 
                    tfr      b,a 
contButton 
 endif  


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
 andb #2+4+8+1 ; all four buttons
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
                    bne      noButtonPressed
                    incb     
 bra  noButtonPressed

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
 if  RECORD_GAME_DATA = 1 
                    tst      saveState 
                    bne      loadButtonData 
                    tfr      a,b 
                    stb      buttonTmp 
REPLACE_1_2_putOneInputByte_varFromIRQ0_1 
                    ldx      #0                           ;putOneInputByte 
                    jsr      jsrBank0_fromBank2_T1 
                    lda      buttonTmp 
                    bra      contButton 

loadButtonData 
REPLACE_1_2_getOneInputByte_varFromIRQ0_1 
                    ldx      #0                           ;getOneInputByte 
                    jsr      jsrBank0_fromBank2_T1 
                    tfr      b,a 
contButton 
 endif  
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
;
JoyDigitalHorizontal00                                    ;#isfunction  
Joy_Digital_horizontal_0_0 
 if ADDITIONAL_INPUT = 1


 ldb additionalFlags
 andb #BIT_INPUT_VARIANT
 beq defaultInput_J ; beq
 

 ldb current_button_state
 pshs b
 jsr getButtonState
 puls b
 stb current_button_state



 bra contInput_J
defaultInput_J
 endif
                    QUERY_JOYSTICK_HORIZINTAL  
contInput_J
 if  RECORD_GAME_DATA = 1 
                    tst      saveState 
                    bne      loadJoyData 
                    ldb      Vec_Joy_1_X 
                    stb      buttonTmp 
REPLACE_1_2_putOneInputByte_varFromIRQ0_2 
                    ldx      #0                           ;putOneInputByte 
                    jsr      jsrBank0_fromBank2_T1 
                    ldb      buttonTmp 
                    stb      Vec_Joy_1_X 
                    rts      

loadJoyData 
REPLACE_1_2_getOneInputByte_varFromIRQ0_2 
                    ldx      #0                           ;getOneInputByte 
                    jsr      jsrBank0_fromBank2_T1 
                    ldb      buttonTmp 
                    stb      Vec_Joy_1_X 
 endif  
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
JoyDigitalVertical00                                      ;#isfunction  
Joy_Digital_vertical_0_0 
                    QUERY_JOYSTICK_VERTICAL  
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
adjustShotDamage 
ReturnFromRankCheck 
                    ADJUST_SHOT_DAMAGE  
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
msRating 
                    db       $40, $a0, "RATING:", $80
                    dw       0 
DodgerResultListSnail 
                    db       -$38, $a0, "100 MONEY ", $80
                    db       $10, $a0, "SNAIL", $80
                    db       -$20, $a0, "1000 BONUS", $80
                    dw       0 
DodgerResultListTurtle 
                    db       -$38, $a0, "200 MONEY ", $80
                    db       $10, $a0, "TURTLE", $80
                    db       -$20, $a0, "2000 BONUS", $80
                    dw       0 
DodgerResultListNormal 
                    db       -$38, $a0, "500 MONEY ", $80
                    db       $10, $a0, "BORING", $80
                    db       -$20, $a0, "5000 BONUS", $80
                    dw       0 
DodgerResultListRABBIT 
                    db       -$38, $a0, "1000 MONEY", $80
                    db       $10, $a0, "RABBIT", $80
                    db       -$20, $a0, "50000 BONUS", $80
                    dw       0 
DodgerResultListFalcon 
                    db       -$38, $a0, "5000 MONEY", $80
                    db       $10, $a0, "FALCON", $80
                    db       -$20, $a0, "100000 BONUS", $80
                    dw       0 
DodgerResultDiamond 
                    db       -$38, $a0, "NO MONEY  ", $80
                    db       $10, $a0, "DIAMOND CHASER", $80
                    db       -$20, $a0, "NO BONUS", $80
                    dw       0 
DodgerResultListBad 
                    db       $40, $a0, "MINESTORM!",$80
                    db       $10, $a0, "MISSION ABORTED",$80
                    dw       0 
dodgeResultStringPointer 
                    dw       DodgerResultListSnail 
                    dw       DodgerResultListTurtle 
                    dw       DodgerResultListNormal 
                    dw       DodgerResultListRABBIT 
                    dw       DodgerResultListFalcon 
                    dw       DodgerResultDiamond 
displayMinestormResult00                                  ;#isfunction  
displayMinestormResult_0_0 
                    jsr      Reset0Ref 
                    jsr      Intensity_3F 
                    lda      #STRING_SCALE 
                    sta      stringScale 
                    tst      dodgerGotKilled 
                    beq      dodgerNotKilledDisplay 
                    ldu      #DodgerResultListBad 
                    bra      nextDodgerResultString 

dodgerNotKilledDisplay 
                    ldu      #msRating 
                    jsr      printVectorStringList 
                    lda      dodgeResult 
                    lsla     
                    ldu      #dodgeResultStringPointer 
                    ldu      a,u 
                    lda      isDiamondRun 
                    bne      isDiamondRunNoMoney 
                    lda      difficulty 
                    bpl      notHardcoreMine 
isDiamondRunNoMoney 
                    leau     13,u                         ; size of money - minestorm in hardcore receives no money! 
notHardcoreMine 
nextDodgerResultString 
                    jmp      printVectorStringList 

displaySuperDiamondsExtro 
                    jsr      Reset0Ref 
; display PERFECT
                    lda      #STRING_SCALE 
                    sta      stringScale 
                    ldu      #DiamondsExtroStrings 
                    jmp      printVectorStringList 

DiamondsExtroStrings 
                    db       $10, $a8, "100000 POINTS", $80
                    dw       0 
displaySuperDiamondsIntro                                 ;#isfunction  
                    jsr      Reset0Ref 
                    lda      #STRING_SCALE 
                    sta      stringScale 
                    ldu      #DiamondsIntoStrings 
                    jmp      printVectorStringList 

DiamondsIntoStrings 
                    db       $10, $a8, "SUPER DIAMOND!", $80
                    dw       0 
calibTest 
                    db       $40,$d0, "STRAIGHTEN",$80
                    db       $20,$d0, "  THIS",$80
                    db       $00,$d0, "  TEXT!",$80,0,0
displayCalibrationText 
                    jsr      Reset0Ref 
                    lda      #STRING_SCALE 
                    sta      stringScale 
                    ldu      #calibTest 
                    jmp      printVectorStringList 

challengeResultGood 
                    db       $30, $a0 , "PERFECT!",$80
                    db       $00, $a0 , "BONUS",$80
                    dw       0 
challengeResultBad 
                    db       $30, $a0 , "ENEMIES HIT: ", $80
                    db       $00, $a0 , "BONUS ", $80
                    dw       0 
bossResult 
                    db       $30, $a0 , "BOSS",$80
                    db       $30, $00 , "DEFEATED!",$80
                    db       $0, $a0 , "BONUS",$80
                    db       $0, $10 , "25000!",$80
                    dw       0 
s1                  db       "1000",$80
s2                  db       "2000",$80
s3                  db       "4000",$80
s4                  db       "8000",$80
s5                  db       "16000",$80
s6                  db       "32000",$80
s7                  db       "64000",$80
s8                  db       "128000",$80
s9                  db       "256000",$80
perfectStringList 
                    dw       s1,s2,s3,s4,s5,s6,s7,s8,s9 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; resturns with x = 0 
; when bonus display is finished
displayChallengeResult00                                  ;#isfunction  
displayChallengeResult_0_0                                ;#isfunction  
                    jsr      Reset0Ref 
                    jsr      Intensity_3F 
                    lda      #STRING_SCALE 
                    sta      stringScale 
                    lda      bonusSpawnCount 
                    cmpa     bonusHitCount 
                    lbne     notPerfectChallengeResult 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
perfectChallengeResult 
                    ldu      #challengeResultGood 
                    jsr      printVectorStringList 
                    ldu      #perfectStringList 
                    lda      perfectBonus 
                    deca     
                    lsla     
                    leau     a,u 
                    ldu      ,u 
                    lda      gameScale 
                    sta      VIA_t1_cnt_lo 
                    ldd      #$0020 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    jsr      my_Moveto_d                  ; Moveto_d 
 else  
                    JSR      Moveto_d 
 endif  
                    lda      stringScale 
                    sta      VIA_t1_cnt_lo 
                    jsr      printVectorString 
                    _ZERO_VECTOR_BEAM  
                    lda      #$60 
                    sta      VIA_t1_cnt_lo 
                    lda      Vec_Loop_Count+1 
                    anda     #%00011111 
                    bne      nothingNew 
; launch rocket
; Launch a rocket on the press of a button
                    jsr      newFWObject 
                    cmpu     #OBJECT_LIST_COMPARE_ADDRESS 
                    bls      noRLNewEmitter 
                    ldd      #rocketEmitterBehaviour 
                    std      FW_BEHAVIOUR, u 
                    ldd      #$0000 
                    std      FW_Y_POS, U                  ; current POS 16 bit 
;                    ldd      #0 
                    std      FW_X_POS, U                  ; current POS 
;                    clra     
                    RANDOM_B  
                    orb      #%00100000 
                    std      FW_Y_VEL, u 
                    RANDOM_B  
                    sex      
                    std      FW_X_VEL, u 
                    RANDOM_B  
                    andb     #%00111111                   ; slightly different age 
                    orb      #%00010000 
                    stb      FW_AGE,U 
noRLNewEmitter 
nothingNew 
                    ldu      fwlist_objects_head 
                    pulu     d,pc                         ; (D = y,x) ; do all objects 
backFromFireWorks 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
notPerfectChallengeResult 
                    ldb      bonusHitCount 
                    lda      #10 
                    mul      
                    ldu      #StringOutputBuffer_4 
                    jsr      wordToDecString 
                    ldu      #challengeResultBad 
                    jsr      printVectorStringList 
                    ldu      #StringOutputBuffer_4 
                    jsr      leadingAddu 
                    jsr      printVectorString 
                    _ZERO_VECTOR_BEAM  
                    clra     
                    ldb      bonusHitCount 
                    ldu      #StringOutputBuffer_4 
                    jsr      wordToDecString 
                    lda      gameScale 
                    sta      VIA_t1_cnt_lo 
                    ldd      #$300a 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    jsr      my_Moveto_d                  ; Moveto_d 
 else  
                    JSR      Moveto_d 
 endif  
                    lda      stringScale 
                    sta      VIA_t1_cnt_lo 
                    ldu      #StringOutputBuffer_4 
                    jsr      leadingAddu 
                    jmp      printVectorString 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
displayBossResult00                                       ;#isfunction  
                    jsr      Reset0Ref 
                    jsr      Intensity_3F 
                    lda      #STRING_SCALE 
                    sta      stringScale 
                    ldu      #bossResult 
                    jmp      printVectorStringList 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
drawMinestormString00 
drawMinestormString_0_0 
                    jsr      Reset0Ref 
                    lda      tmp1 
                    sta      <VIA_t1_cnt_lo 
                    ldd      #$1081 
                    ldu      #MineStorm_String 
                    tst      isDiamondRun 
                    beq      noDiamondRunDisplay 
                    ldu      #DiamondStorm_String 
noDiamondRunDisplay 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    jsr      my_Moveto_d                  ; Moveto_d 
 else  
                    JSR      Moveto_d 
 endif  
                    jsr      printVectorString 
                    _ZERO_VECTOR_BEAM  
                    ldd      #$b081 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    jsr      my_Moveto_d                  ; Moveto_d 
 else  
                    JSR      Moveto_d 
 endif  
                    ldu      #Storm_String 
                    jmp      printVectorString 

DiamondStorm_String 
                    db       "DIAMOND", $80
MineStorm_String 
                    db       " MINE", $80
Storm_String 
                    db       " STORM", $80
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
drawWarpFailure                                           ;#isfunction  
                    jsr      Reset0Ref 
                    lda      tmp1 
                    sta      <VIA_t1_cnt_lo 
                    ldd      #$3081 
                    ldu      #warpFailure_string1 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    jsr      my_Moveto_d                  ; Moveto_d 
 else  
                    JSR      Moveto_d 
 endif  
                    jsr      printVectorString 
                    _ZERO_VECTOR_BEAM  
                    lda      tmp1 
                    sta      <VIA_t1_cnt_lo 
                    ldd      #$d081 
                    ldu      #warpFailure_string2 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    jsr      my_Moveto_d                  ; Moveto_d 
 else  
                    JSR      Moveto_d 
 endif  
                    jmp      printVectorString 

warpFailure_string1 
                    db       " WARP", $80
warpFailure_string2 
                    db       "FAILURE", $80
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
drawLevelString00 
drawLevelString_0_0                                       ;#isfunction  
                    jsr      Reset0Ref 
                    lda      tmp1 
                    sta      <VIA_t1_cnt_lo 
                    ldd      #$1081 
                    ldu      #level_string 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    jsr      my_Moveto_d                  ; Moveto_d 
 else  
                    JSR      Moveto_d 
 endif  
                    jsr      printVectorString 
                    jsr      fillLevelString 
                    jsr      printVectorString 
                    jmp      Reset0Ref 

doRTS 
                    rts      

level_string 
                    db       "LEVEL ", $80
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
drawExtra                                                 ;#isfunction  
                    jsr      Reset0Ref 
                    lda      tmp1 
                    sta      <VIA_t1_cnt_lo 
                    ldd      #$1081 
                    ldu      #extraString 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    jsr      my_Moveto_d                  ; Moveto_d 
 else  
                    JSR      Moveto_d 
 endif  
                    jmp      printVectorString 

extraString 
                    db       " EXTRA", $80
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
drawBonusString_0_0                                       ;#isfunction  
drawBonusString00                                         ;#isfunction  
                    ldu      #Bonus_string 
drawString_0_0 
                    jsr      Reset0Ref 
                    lda      tmp1 
                    suba     #20 
                    bmi      doRTS 
                    sta      <VIA_t1_cnt_lo 
                    ldd      #$b081 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    jsr      my_Moveto_d                  ; Moveto_d 
 else  
                    JSR      Moveto_d 
 endif  
                    jmp      printVectorString 

Bonus_string 
                    db       "CHALLENGE", $80
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
drawKamikazeString00                                      ;#isfunction  
drawKamikazeString_0_0                                    ;#isfunction  
                    ldu      #Kamikaze_string 
                    bra      drawString_0_0 

Kamikaze_string 
                    db       "KAMIKAZE!", $80
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
drawBossString00                                          ;#isfunction  
drawBossString_0_0                                        ;#isfunction  
                    ldu      #boss_string 
                    bra      drawString_0_0 

boss_string 
                    db       " BOSS!", $80
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; word in D
; pointer to highest CSA in U (5 +$80)
; keeps u
wordToDecString 
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
outHerelsp 
                    rts      

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; strng in u
; trashes d. keeps u
leadingAddu 
againlsz2 
                    ldb      # '0'
                    cmpb     ,u 
                    bne      outHerelsp 
                    leau     1,u 
                    inca     
                    bra      againlsz2 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
initTitleRAM                                              ;#isfunction  
; MAX_ENEMY_OBJECTS_TITLE   =        10
; enemyobject_list_title    ds       EnemyStruct*(MAX_ENEMY_OBJECTS_TITLE +1) 
; enemyobject_list_title_end  ds     0 
; enemies
                    lda      #MAX_ENEMY_OBJECTS_TITLE 
                    ldu      #enemyobject_list_title 
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

;***************************************************************************
; x = in csa score [7 byte] msb first
; u = out bcd [4 byte] msb first
csa_to_bcd                                                ;#isfunction  
                    ldb      #4 
                    clr      ,u 
                    bra      doOnly7_cb 

next_byte_c_b: 
                    lda      ,x+ 
                    anda     #%00001111                   ; safety 
                    lsla     
                    lsla     
                    lsla     
                    lsla     
                    sta      ,u 
doOnly7_cb 
                    lda      ,x+ 
                    anda     #%00001111                   ; safety 
                    ora      ,u 
                    sta      ,u+ 
                    decb     
                    bne      next_byte_c_b 
                    rts      

;***************************************************************************
; u = in bcd [4 byte] msb first
; x = out csa score [7 byte] msb first
bcd_to_csa                                                ;#isfunction  
                    ldb      #4 
                    bra      doOnly7_bc 

next_byte_b_c: 
                    lda      ,u 
                    lsra     
                    lsra     
                    lsra     
                    lsra     
                    sta      ,x+ 
doOnly7_bc 
                    lda      ,u+ 
                    anda     #%00001111 
                    sta      ,x+ 
                    decb     
                    bne      next_byte_b_c 
                    rts      

;***************************************************************************
; unsigned!
; u = in csa score [7 byte] msb first
; x = in csa score [7 byte] msb first
; return a = $ff if u<x
; return a = 1 if u>x
; return a = 0 if u=x
; flags are set corresponingly
compare_csa                                               ;#isfunction  
                    ldb      #7 
next_compare_cc: 
                    lda      ,u+ 
                    cmpa     ,x+ 
                    bhi      return_u_greater_x 
                    blo      return_u_smaller_x 
                    decb     
                    bne      next_compare_cc 
return_u_equal_x 
                    lda      #$00 
                    rts      

return_u_smaller_x 
                    lda      #$ff 
                    rts      

return_u_greater_x 
                    lda      #$01 
                    rts      

;***************************************************************************
; unsigned!
; u = in bcd score [4 byte] msb first
; x = in csa score [7 byte] msb first
; return a = $ff if u<x
; return a = 1 if u>x
; return a = 0 if u=x
; flags are set corresponingly
;
; uses: StringOutputBuffer
compare_csa_bcd                                           ;#isfunction  
                    pshs     x 
                    ldx      #StringOutputBuffer 
                    bsr      bcd_to_csa 
                    ldu      #StringOutputBuffer 
                    puls     x 
                    bra      compare_csa 

highScoreSeekDone 
                    lda      tmp1 
                    cmpa     #4 
                    bne      done_hsd 
                    lda      #$ff 
done_hsd 
                    rts      

;***************************************************************************
; compares the last acchieved score (in player_score - csa 6 msb first)
; to all highscore in highScoreTable (5 bcd scores)
; if high score is valid, the scores get copied to the correct places
; 
; leaves with a = place achieved 0-4
; or $ff for no highscore
test_highscore                                            ;#isfunction  
                    lda      #4 
                    sta      tmp1 
                    ldu      #highScoreTableEnd-5         ; (pointer to last bsd highscore) 
                    lda      difficulty 
                    bmi      testNext_highscore_th 
                    leau     -(HighScoreEntry * 4),u 
testNext_highscore_th: 
                    ldx      #player_score 
                    pshs     x,u 
                    bsr      compare_csa_bcd 
                    puls     x,u 
                    bmi      newHighscore 
                    bra      highScoreSeekDone 

newHighscore 
; if not last position, copy this position to one further
                    lda      tmp1 
                    cmpa     #4 
                    beq      only_new_score_copy 
; copy score (and name) in table to one position lower
                    ldd      -3,u                         ; old name 
                    std      -3+8,u 
                    lda      -1,u 
                    sta      -1+8,u 
                    ldd      ,u                           ; score 
                    std      0+8,u 
                    ldd      2,u 
                    std      2+8,u 
                    lda      4,u 
                    sta      4+8,u                        ; level 
only_new_score_copy: 
; copy my score to this position (and keep the old name)
                    ldx      #player_score 
                                                          ; convert X to bcd 
                    pshs     u 
                    jsr      csa_to_bcd 
                    lda      levelCount 
                    inca     
                    sta      ,u 
                    puls     u 
                    leau     -8,u                         ; one score earlier 
                    dec      tmp1 
                    bne      testNext_highscore_th 
                    clra     
                    rts      

;***************************************************************************
playerScoreRemoveAscii 
                    lda      #7 
                    ldu      #player_score_6 
againasciicon 
                    ldb      ,u 
                    subb     # '0'
                    stb      ,u+ 
                    deca     
                    bne      againasciicon 
                    rts      

;***************************************************************************
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; do game over sequence
; check high score
; enter highscore / save
; jump to title
; achievments?
gameOver00                                                ;#isfunction  
gameOver0_0                                               ;#isfunction  
                    jsr      initTitleRAM 
REPLACE_1_2_titleMusic_varFromIRQ1_2 
                    ldu      #0                           ; ; titleMusic 
REPLACE_1_2_PLYINIT_varFromIRQ1_2 
                    ldx      #0                           ; PLYINIT 
                    jsr      jsrBank1_fromBank2_T1 
REPLACE_1_2_readHighscore_varFromIRQ0_223 
                    ldx      #0                           ; readHighscore 
                    jsr      jsrBank0_fromBank2_Shift 
                    bsr      playerScoreRemoveAscii 
; if played a saved game,  no high score possible!
                    lda      flashAvailable 
                    anda     #SAVEGAME_IS_ACTIVE_BIT      ; game available 
                    lbne     fromGameOver 
                    bsr      test_highscore 
                    tsta                                  ; in a ff for no HS, or new place (0-3) 
                    bmi      no_hs_acchieved              ; if negative - no score 
                    sta      highScorePosition 
; convert highscore from csa to asci
                    ldx      #player_score 
                    ldb      #7 
nexthsa 
                    decb     
                    bmi      donehsa 
                    lda      ,x+ 
                    adda     # '0'
                    sta      -1,x 
                    bra      nexthsa 

donehsa 
; remove space
                    ldx      #player_score 
                    ldb      #7 
nexthsa2 
                    decb     
                    bmi      donehsa2 
                    lda      ,x+ 
                    cmpa     # '0'
                    bne      donehsa2 
                    lda      # ' '
                    sta      -1,x 
                    bra      nexthsa2 

donehsa2 
REPLACE_1_2_HighScoreTest_varFromIRQ1_2 
                    ldx      #0                           ; HighScoreTest 
                    jmp      jmpBankIRQ1Shift 

backFromHighScoreEdit 
REPLACE_1_2_editPlayerInitials_varFromIRQ1_2 
                    ldx      #0                           ;editPlayerInitials ; pointer to initials 
                    lda      highScorePosition            ; place 
                    ldu      #highScoreBlock 
                    ldb      difficulty 
                    bpl      notHardcore_hs 
                    ldu      #Ram_HardcoreScore_Start 
notHardcore_hs 
                    lsla                                  ; one hs entry is 8 bytes -> times 8 
                    lsla     
                    lsla     
                    leau     a,u 
; copy initials
                    ldd      ,x++ 
                    std      ,u++ 
                    ldb      ,x+ 
                    stb      ,u+ 
REPLACE_1_2_saveBlockOnChange_varFromIRQ0_4 
                    ldx      #0                           ;saveBlockOnChange 
                    jsr      jsrBank0_fromBank2_Shift 
 if  VECFEVER = 1 
REPLACE_1_2_hsMusic_varFromIRQ1_222 
                    ldu      #0                           ; ; hsMusic 
REPLACE_1_2_PLYINIT_varFromIRQ1_222 
                    ldx      #0                           ; PLYINIT 
                    jsr      jsrBank1_fromBank2_T1 
 endif  
REPLACE_1_2_showHighscore_varFromIRQ1_2 
                    ldx      #0                           ;showHighscore 
                    clr      songLoop 
                    jsr      jsrBank1_fromBank2_T1 
no_hs_acchieved 
REPLACE_1_2_saveBlockOnChange_varFromIRQ0_5 
                    ldx      #0                           ;saveBlockOnChange 
                    jsr      jsrBank0_fromBank2_Shift 
                    jmp      fromGameOver                 ;main_0_0 

gameOverLoop 
                    clra     
                    sta      <VIA_shift_reg 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    JSR      my_wait_recal                ;Wait_Recal 
 else  
                    JSR      Wait_Recal 
 endif  
REPLACE_1_2_playAKSMusic_varFromIRQ1_2 
                    ldx      #0                           ; playAKSMusic 
                    jsr      jsrBank1_fromBank2_T1 
                    ldd      #$f850 
                    sta      Vec_Text_HW 
                    jsr      Intensity_5F 
                    jsr      calibrationZero7 
                    lda      gameScale 
                    sta      VIA_t1_cnt_lo 
                    ldd      #$f850 
                    sta      Vec_Text_HW 
                    ldd      #$60d0 
                    ldu      #pauseString                 ;pauseString 
                    jsr      Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    bra      gameOverLoop 

;***************************************************************************
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
suckRandomMoney                                           ;#isfunction  
                    ldu      playerCashW 
                    cmpu     #50 
                    blo      dontsuckitup 
suckitup 
                    lda      #-$70 
                    ldb      playerXpos 
                    std      bonusSpawnPosition 
                    jsr      spawnBonus 
                    cmpx     #OBJECT_LIST_COMPARE_ADDRESS ; no bonus left 
                    bls      resetBonusSpawm_2_ab 
                    ldd      bonusSpawnPosition 
                    std      Y_POS,x                      ; set start pos 
                    RANDOM_B  
                    andb     #%00000011 
                    bne      okrand_a 
                    incb     
okrand_a 
                    addb     #9 
                    aslb     
; one of
; BONUS_MONEY_5       =        10*2 
; BONUS_MONEY_20      =        11*2 
; BONUS_MONEY_50      =        12*2 
; ldb #BONUS_MONEY_200
; todo - check if enough money?
                    ldu      playerCashW 
                    leau     -5,u 
                    cmpb     #10*2 
                    beq      reduceDone 
                    leau     -15,u 
                    cmpb     #11*2 
                    beq      reduceDone 
                    leau     -30,u 
reduceDone 
                    stu      playerCashW 
                    jsr      BonusDecided 
                    ldd      #bonusSuckedBehaviour 
                    std      BEHAVIOUR,x 
resetBonusSpawm_2_ab 
dontsuckitup 
                    ldd      #0 
                    std      bonusSpawnPosition 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
spawnRandomMoney                                          ;#isfunction  
; while bonus can be spawned - spawn $200
                    ldd      bonusSpawnPosition 
                    subb     #31 
                    pshs     d 
doSpawnBonusAgain 
                    RANDOM_B  
                    andb     #%00111111 
                    addb     1,s 
                    RANDOM_A  
                    anda     #%00011111 
                    nega     
                    adda     ,s 
                    std      bonusSpawnPosition 
                    jsr      spawnBonus 
                    cmpx     #OBJECT_LIST_COMPARE_ADDRESS ; no bonus left 
                    bls      resetBonusSpawm_2_a 
                    ldd      bonusSpawnPosition 
                    std      Y_POS,x                      ; set start pos 
                    RANDOM_B  
                    andb     #%00000011 
                    bne      okrand 
                    incb     
okrand 
                    addb     #9 
                    aslb     
; one of
;BONUS_MONEY_5       =        10*2 
;BONUS_MONEY_20      =        11*2 
;BONUS_MONEY_50      =        12*2 
; ldb #BONUS_MONEY_200
                    jsr      BonusDecided 
                    bra      doSpawnBonusAgain 

resetBonusSpawm_2_a 
                    leas     2,s 
                    ldd      #0 
                    std      bonusSpawnPosition 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
spawnMoney200                                             ;#isfunction  
; while bonus can be spawned - spawn $200
                    ldd      bonusSpawnPosition 
                    subb     #31 
                    pshs     d 
doSpawnBonusAgain22 
                    RANDOM_B  
                    andb     #%00111111 
                    addb     1,s 
                    RANDOM_A  
                    anda     #%00011111 
                    nega     
                    adda     ,s 
                    std      bonusSpawnPosition 
                    jsr      spawnBonus 
                    cmpx     #OBJECT_LIST_COMPARE_ADDRESS ; no bonus left 
                    bls      resetBonusSpawm_2 
                    ldd      bonusSpawnPosition 
                    std      Y_POS,x                      ; set start pos 
                    ldb      #BONUS_MONEY_200 
                    tst      difficulty 
                    bpl      spawn200MoneyOk 
                    ldb      #BONUS_TIMER 
spawn200MoneyOk 
                    jsr      BonusDecided 
                    bra      doSpawnBonusAgain22 

resetBonusSpawm_2 
                    leas     2,s 
                    ldd      #0 
                    std      bonusSpawnPosition 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
doSpawnBonus0_0                                           ;#isfunction  
                    tst      rankDrop 
                    beq      noRankDrop 
                    jsr      spawnBonus 
                    cmpx     #OBJECT_LIST_COMPARE_ADDRESS ; no bonus left 
                    bls      resetBonusSpawm 
                    ldd      bonusSpawnPosition 
                    std      Y_POS,x                      ; set start pos 
                    jsr      initRank 
                    bra      resetBonusSpawm 

noRankDrop 
                    RANDOM_A  
                    cmpa     levelBonusBorder             ; how "often" a bonus should spawn 
                    bhs      resetBonusSpawm 
                    jsr      spawnBonus 
                    cmpx     #OBJECT_LIST_COMPARE_ADDRESS ; no bonus left 
                    bls      resetBonusSpawm 
                    ldd      bonusSpawnPosition 
                    std      Y_POS,x                      ; set start pos 
                    jsr      initBonus 
resetBonusSpawm 
                    ldd      #0 
                    std      bonusSpawnPosition 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bossDisplayHead                                           ;#isfunction  
                    ldb      Vec_Loop_Count+1 
                    andb     #1 
                    beq      noOddRound0_b1 
                    JSR      Joy_Digital_horizontal_0_0 
                    tst      drunkTimer 
                    beq      notDrunken_bd 
                    dec      drunkTimer 
                    tst      >Vec_Joy_1_X 
                    beq      notDrunken_bd 
                    neg      >Vec_Joy_1_X 
notDrunken_bd 
                    bra      oddEvenDoneMain0_b1 

noOddRound0_b1 
                    JSR      getButtonState               ; get button status 
                    lda      diverseFlags 
                    anda     #BIT_FLAG_IS_BOSSFIGHT_ANY 
                    beq      noNewPlayerShot0_b1          ; boss fight finished 
;;;;;;
; new player shot
                    tst      allowBossShots 
                    beq      noNewPlayerShot0_b1 
                    lda      diverseFlags 
                    anda     #BIT_FLAG_AUTOFIRE 
                    beq      normalFireBoss 
                    andb     #1 
                    bne      doAutoFireBoss 
normalFireBoss 
                    ldb      current_button_state 
                    andb     #3 
                    CMPB     #$01                         ; pressed, but last time was unpressed 
                    bne      noNewPlayerShot0_b1 
                    beq      doNormalFireBoss 
doAutoFireBoss 
; restricted autofire
; but only if last was pressed
                    ldb      current_button_state 
                    andb     #3 
                    CMPB     #$01                         ; pressed, but last time was unpressed 
                    beq      doNormalFireBoss 
                    lda      Vec_Loop_Count+1 
                    anda     #%111                        ; only each fourth round 
                    bne      noNewPlayerShot0_b1 
doNormalFireBoss 
                    jsr      spawnPlayerShot 
                    ADD_SHOT  
noNewPlayerShot0_b1 
 if  TEST_VOX = 1 
REPLACE_1_2_voxSpeak_varFromIRQ0_2 
                    ldx      #0                           ;voxSpeak 
                    jsr      jsrBank0_fromBank2_Shift 
 endif  
oddEvenDoneMain0_b1 
;;;;;;;;;;;;
REPLACE_1_2_doymsound100_varFromIRQ1_2 
                    ldx      #0                           ; doymsound100 
                    jsr      jsrBank1_fromBank2_T1 
;;;;;;;;;;;;
                    lda      explosionSound               ; test if last game round an explosion was "released" 
                    beq      noExplosionSoundTodo_b1 
                    cmpa     #2 
                    bhs      explosionSoundDo_b1 
enemyHitSoundDo_b1 
                    lda      playSoundFlags 
                    anda     #%11000000 
                    bne      doTheSound_b1 
REPLACE_1_2_spawnXData_varFromIRQ1_2 
                    ldx      #0                           ; spawnXData 
                    stx      sfx_pointer_2 
                    bra      doTheSound_b1 

explosionSoundDo_b1 
                    lda      playSoundFlags 
                    anda     #%11000000 
                    bne      doTheSound_b1 
REPLACE_1_2_explosion1Data_varFromIRQ1_2 
                    ldx      #0                           ; explosion1Data 
                    stx      sfx_pointer_3 
doTheSound_b1 
                    ADD_HIT  
                    clr      explosionSound               ; and clear flag for this game round 
noExplosionSoundTodo_b1 
;;;;;;;;;;;;
                    rts      

;***************************************************************************
; game loop "0"-part including 
; joystick movement (handling expected to be done elsewhere (in Move)
; buttons (can pause + spawn shots)
; does sound sfx
; spawn bonus
; spawn shot
; draw player shots
; draw bonus
gameLoopPart0_m                                           ;#isfunction  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; thing to do in odd rounds
; saves about 80 cyles and does no harm
; even round is done in bank 0
; since there the shots are processed
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                    lda      #$7f 
                    _INTENSITY_A  
                    lda      gameScale 
                    sta      <VIA_t1_cnt_lo 
                    lds      playershotlist_objects_head 
                    puls     d,pc                         ; (D = y,x) ; do all objects 
playerShotsDoneMain 
                    lds      #MY_STACK                    ; CBFC ; correct the stack to default address 
                    clr      tacScan 
                    ldb      isDemoMode 
                    beq      noDemo 

; a button press "breaks" demo

 if ADDITIONAL_INPUT = 1
 ldy Vec_Joy_1_X ; this is so that in "button only" mode, the current values are saved!
                    JSR      getButtonState               ; get button status 
 sty Vec_Joy_1_X
 else
                    JSR      getButtonState               ; get button status 
 endif


                    anda     #%00001111 
                    cmpa     #%00001111 
                    lbne     main00 


                    ldd      Vec_Loop_Count 
                    cmpd     #50*150 
                    lbgt     main00                       ; restart VB 
                    cmpb     #100 
                    bne      noDemoMessage 
REPLACE_1_2_DemoString_varFrom1_1                         ;  bank 1 replace 
                    ldd      #0                           ;DemoString 
                    INIT_MESSAGE_D  
noDemoMessage 
                    andb     #%00011111 
                    bne      noDirChangeDemo 
                    RANDOM_A                              ; this does not change 28 
                    bpl      demoLeft 
demoRight 
                    lda      #10 
                    bra      storeA_demo 

demoLeft 
                    lda      #-10 
storeA_demo
                    sta      Vec_Joy_1_X 

noDirChangeDemo 
; get joystivk
; todo change direction each "xx" seconds
; check vecloop count if = XXs -> exit demo
; check message -> display new "DEMO" message
 if  ENABLE_STAR_TACSCAN = 1 
;;;;;
; react on joystick like in Tac/Scan
                    ldb      #-1 
                    lda      Vec_Joy_1_X 
                    beq      noAdjustTacScan_dem 
                    bpl      adjustTacScanDone_dem 
                    negb     
                    bra      adjustTacScanDone_dem 

adjustTacScanDone_dem 
                    stb      tacScan 
noAdjustTacScan_dem 
 endif  
                    ldb      #3                           ; button always pressed in demo 
                    stb      current_button_state 
                    bra      doAutoFire 

noDemo 


                    ldb      Vec_Loop_Count+1 
                    andb     #1 
                    beq      noOddRound_m0 
                    JSR      Joy_Digital_horizontal_0_0 
                    tst      drunkTimer 
                    beq      notDrunken_nd 
                    dec      drunkTimer 
                    tst      >Vec_Joy_1_X 
                    beq      notDrunken_nd 
                    neg      >Vec_Joy_1_X 
notDrunken_nd 
 if  ENABLE_STAR_TACSCAN = 1 
;;;;;
; react on joystick like in Tac/Scan
                    ldb      #-1 
                    lda      Vec_Joy_1_X 
                    beq      noAdjustTacScan 
                    bpl      adjustTacScanDone 
                    negb     
                    bra      adjustTacScanDone 

adjustTacScanDone 
                    stb      tacScan 
noAdjustTacScan 
 endif  
;;;;;
                    bra      oddEvenDoneMain0_m 

noOddRound_m0 
;                    JSR      getButtonState               ; get button status 
 if ADDITIONAL_INPUT = 1
 ldy Vec_Joy_1_X ; this is so that in "button only" mode, the current values are saved!
                    JSR      getButtonState               ; get button status 
 sty Vec_Joy_1_X
 else
                    JSR      getButtonState               ; get button status 
 endif




                    bita     #4                           ; button 3 pause 
                    lbeq     pause_0_0 
                    bita     #2                           ; button 2 bomb 
                    lbeq     executeSmartBomb 
; new player shot
continueFireButton
                    lda      diverseFlags 
                    anda     #BIT_FLAG_AUTOFIRE 
                    beq      normalFire 
                    andb     #1 
                    bne      doAutoFire 
normalFire 
                    ldb      current_button_state 
                    andb     #3 
                    CMPB     #$01                         ; pressed, but last time was unpressed 
                    bne      noNewPlayerShot_m 
                    beq      doNormalFire 
doAutoFire 
; restricted autofire
; but only if last was pressed
                    ldb      current_button_state 
                    andb     #3 
                    CMPB     #$01                         ; pressed, but last time was unpressed 
                    beq      doNormalFire 
                    lda      Vec_Loop_Count+1 
                    anda     #%111                        ; only each fourth round 
                    bne      noNewPlayerShot_m 
doNormalFire 
                    jsr      spawnPlayerShot 
                    ADD_SHOT  
backFromPause
noNewPlayerShot_m 
;;;; VOX CALL
 if  TEST_VOX = 1 
REPLACE_1_2_voxSpeak_varFromIRQ0_1 
                    ldx      #0                           ;voxSpeak 
                    jsr      jsrBank0_fromBank2_Shift 
 endif  
;;;;;;
smartBombReturn 
oddEvenDoneMain0_m 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
REPLACE_1_2_doymsound100_varFromIRQ1_4 
                    ldx      #0                           ; doymsound100 
                    jsr      jsrBank1_fromBank2_T1 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                    ldd      bonusSpawnPosition 
                    beq      noBonusSpwan_m 
; todo can be inlined
                    jsr      doSpawnBonus0_0 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
noBonusSpwan_m 
                    clr      rankDrop 
                    lda      explosionSound               ; test if last game round an explosion was "released" 
                    beq      noExplosionSoundTodo_m 
                    cmpa     #2 
                    bhs      explosionSoundDo_m 
enemyHitSoundDo_m 
                    lda      playSoundFlags 
                    anda     #%11000000 
                    bne      doTheSound_m 
REPLACE_1_2_spawnXData_varFromIRQ1_4 
                    ldx      #0                           ; spawnXData 
                    stx      sfx_pointer_2 
                    bra      doTheSound_m 

explosionSoundDo_m 
                    lda      playSoundFlags 
                    anda     #%11000000 
                    bne      doTheSound_m 
REPLACE_1_2_explosion1Data_varFromIRQ1_4 
                    ldx      #0                           ; explosion1Data 
                    stx      sfx_pointer_3 
doTheSound_m 
                    ADD_HIT  
                    clr      explosionSound               ; and clear flag for this game round 
noExplosionSoundTodo_m 
playerShotsDoneM 
                    lda      #DEFAULT_ENEMY_INTENSITY 
                    _INTENSITY_A  
                    lds      bonuslist_objects_head 
                    puls     d,pc 
; jumps to jmpBack1BonusIngame
; which finishes the 0 part
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CircleList1: 
                    DB       $00, -$12, -$6C              ; pattern, y, x 
                    DB       $FF, +$24, +$00              ; pattern, y, x 
                    DB       $FF, +$18, +$06              ; pattern, y, x 
                    DB       $FF, +$18, +$12              ; pattern, y, x 
                    DB       $FF, +$18, +$1E              ; pattern, y, x 
                    DB       $FF, +$0C, +$24              ; pattern, y, x 
                    DB       $FF, +$00, +$24              ; pattern, y, x 
                    DB       $FF, -$0C, +$24              ; pattern, y, x 
                    DB       $FF, -$18, +$1E              ; pattern, y, x 
                    DB       $FF, -$18, +$12              ; pattern, y, x 
                    DB       $FF, -$18, +$06              ; pattern, y, x 
                    DB       $FF, -$24, +$00              ; pattern, y, x 
                    DB       $FF, -$18, -$06              ; pattern, y, x 
                    DB       $FF, -$18, -$12              ; pattern, y, x 
                    DB       $FF, -$18, -$1E              ; pattern, y, x 
                    DB       $FF, -$0C, -$24              ; pattern, y, x 
                    DB       $FF, +$00, -$24              ; pattern, y, x 
                    DB       $FF, +$0C, -$24              ; pattern, y, x 
                    DB       $FF, +$18, -$1E              ; pattern, y, x 
                    DB       $FF, +$18, -$12              ; pattern, y, x 
                    DB       $FF, +$18, -$06              ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; end end boss explodes like a smart bomb
doBoss1Explosion 
                    _ZERO_VECTOR_BEAM  
                    jsr      Intensity_7F 
                    lda      #10 
                    sta      tmp1 
; takes about 360000 cycles (2/3 second !!!)
loopy1_1 
                    lda      tmp1 
                    inca     
                    inca     
                    sta      tmp1 
                    bmi      outhere_1 
                    sta      <VIA_t1_cnt_lo 
                    ldx      #CircleList1 
                    LDB      #$CE 
                    STB      VIA_cntl                     ;/BLANK low and /ZERO low 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    JSR      my_Draw_VLp                  ;Wait_Recal 
 else  
                    JSR      Draw_VLp 
 endif  
                    _ZERO_VECTOR_BEAM  
                    bra      loopy1_1 

outhere_1 
                    rts      

 if  IS_VIA_FAULTY_RESISTENT = 1 
my_Draw_VLp 
myDrawVLp 
                    LDD      1,X                          ;Get next coordinate pair 
                    STA      <VIA_port_a                  ;Send Y to A/D 
                    clra     
                    sta      <VIA_port_b                  ;Enable mux 
                    inca     
                    sta      <VIA_port_b                  ;Disable mux 
                    LDA      ,X                           ;Get pattern byte? 
                    STB      <VIA_port_a                  ;Send X to A/D 
                    STA      <VIA_shift_reg               ;Store pattern in shift register 
                    clra                                  ;B-reg = T1 interrupt bit 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    LDb      #$40                         ;B-reg = T1 interrupt bit 
                    LEAX     3,X                          ;Advance to next point in list 
_LF425:             BITB     <VIA_int_flags               ;Wait for T1 to time out 
                    BEQ      _LF425 
                    NOP                                   ;Wait a moment more 
                    STA      <VIA_shift_reg               ;Clear shift register (blank output) 
                    LDA      ,X                           ;Get next pattern byte 
                    BLE      myDrawVLp                    ;Go back if high bit of pattern is set 
                    rts      

 endif  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
executeSmartBomb                                          ;#isfunction  
                    ldd      Vec_Loop_Count 
                    cmpd     #0050                        ; bomb only each two seconds - Vec_Loop_Count is reseted! 
                    lblo     smartBombReturn 
                    tst      smartBombsAvailable 
 if  UNLIMITED_BOMBS = 1 
 else  
                    lbeq     smartBombReturn 
 endif  
                    dec      smartBombsAvailable 
                    bsr      doBoss1Explosion 
                    ldd      #0 
                    std      Vec_Loop_Count 
; remove ALL enemy shots!
; SHOTS 
                    lda      #MAX_SHOT_OBJECTS 
                    ldu      #shotobject_list 
                    stu      shotlist_empty_head 
                    ldy      #SHOTS_DONE 
next_list_entry_ig2bb 
                    leax     ShotStruct,u 
                    stx      NEXT_SHOT_OBJECT,u 
                    leau     ,x 
                    deca     
                    bne      next_list_entry_ig2bb 
                    leau     -ShotStruct,u 
                    sty      NEXT_SHOT_OBJECT,u 
                    sty      shotlist_objects_head 
                    sta      shotCount 
; go thru all enemy objects that are still "normal" enemies (no shield)
; do shields have all purpuse = -1?
; - no, because they can "flash"
; and swith their behaviour to "fallDiamondBehaviour"
; respect "attacker" flag
                    lda      lockPurchased 
                    bita     #ENEMY_DESTRUCTED_FLAG 
                    lbne     smartBombReturn              ; in warp, enemy list is not available 
                    ldu      enemylist_objects_head 
handleEnemiesLoop_SB 
                    cmpu     #ENEMY_DONE 
                    lbeq     smartBombReturn              ;allEnemiesHandled_SB 
;
; sort out all enemies which should not be 
; "exploded"
                    lda      ALL_PURPOSE,u 
                    lbmi     nextEnemy_SB                 ; negative is Explosion 
                    ldx      BEHAVIOUR,u 
REPLACE_1_2_enemyPlayerControlledRightBehaviour_varFrom1_31 ;  bank 1 replace 
                    cmpx     #0                           ;enemyPlayerControlledRightBehaviour 
                    lbeq     nextEnemy_SB 
REPLACE_1_2_enemyPlayerControlledLeftBehaviour_varFrom1_31 ;  bank 1 replace 
                    cmpx     #0                           ;enemyPlayerControlledLeftBehaviour 
                    lbeq     nextEnemy_SB 
; off screen enemies do not explode
REPLACE_1_2_enemyDelayBehaviour_varFrom1_1                ;  bank 1 replace 
                    cmpx     #0                           ;enemyDelayBehaviour 
                    beq      nextEnemy_SB 
; handle shield enemies
                    ldx      ENEMY_STRUCT,u 
REPLACE_1_2_enemy3Definition_varFrom1_41                  ;  bank 1 replace 
                    cmpx     #0                           ;enemy3Definition 
                    beq      nextEnemy_SB 
REPLACE_1_2_enemySW3DefinitionShield_varFrom1_41          ;  bank 1 replace 
                    cmpx     #0                           ;enemySW3DefinitionShield 
                    beq      nextEnemy_SB 
                    ldx      BEHAVIOUR,u 
; check for elite enemies and
; reduce "only" 100 HP
; moneySuckerBehaviour
; megaFiendBehaviour
REPLACE_1_2_moneySuckerBehaviour_varFrom1_41              ;  bank 1 replace 
                    cmpx     #0                           ;moneySuckerBehaviour 
                    bne      noMoneySuckerSB 
isMegaFiend 
                    ldd      BIG_HP,u 
                    subd     #100 
                    std      BIG_HP,u 
; if still alive 
                    bpl      nextEnemy_SB 
; if dead
                    lda      #-1 
                    sta      ALL_PURPOSE ,u               ; negative means this enemy is an explosion 
                    bra      wasNotAttacker_SB 

noMoneySuckerSB 
REPLACE_1_2_megaFiendBehaviour_varFrom1_42                ;  bank 1 replace 
                    cmpx     #0                           ;megaFiendBehaviour 
                    beq      isMegaFiend 
bugEnemy_SB 
                    inc      bonusHitCount 
                    lda      #-1 
                    sta      ALL_PURPOSE ,u               ; negative means this enemy is an explosion 
                    ldx      BEHAVIOUR,u 
REPLACE_1_2_enemySingleAttackAbsolutBehaviour_varFrom1_41 ;  bank 1 replace 
                    cmpx     #0                           ;enemySingleAttackAbsolutBehaviour 
                    beq      wasAttacker_SB 
REPLACE_1_2_enemySingleAttackRelativeBehaviour_varFrom1_41 ;  bank 1 replace 
                    cmpx     #0                           ;enemySingleAttackRelativeBehaviour 
                    bne      wasNotAttacker_SB 
wasAttacker_SB 
                    dec      attackPatternCount 
wasNotAttacker_SB 
                    pshs     u,x 
                    ADD_POINTS_ENEMY_DESTROY  
                    puls     u,x 
; test if enemy is bug, if so get correct position
REPLACE_1_2_lastNormalEnemyAddress_varFrom1_2             ;  bank 1 replace 
                    cmpx     #0                           ; lastNormalEnemyAddress 
                    blo      normalEnemy_SB 
; bug enemy - change positions
                    lda      Y_POS16,u 
                    ldb      X_POS16,u 
                    std      Y_POS,u 
normalEnemy_SB 
REPLACE_1_2_enemyExplosionBehaviour_varFrom1_52           ;  bank 1 replace 
                    ldd      #0                           ;enemyExplosionBehaviour 
                    std      BEHAVIOUR,u 
                    clr      ANIM_POSITION,u 
; take just "any" enemy to show explosion, from bank 0 we do not have access to enemy draw lists
REPLACE_1_2_Enemy1Right_varFrom1_1                        ;  bank 1 replace 
                    ldx      #0                           ;Enemy1Right 
                    stx      SMARTLIST_ORG,u 
                    lda      #9                           ; scale 
                    sta      EXPLOSION_SCALE,u 
                    lda      #$7f                         ; intensity 
                    sta      EXPLOSION_INTENSITY,u 
nextEnemy_SB 
                    ldu      NEXT_ENEMY_OBJECT,u 
                    jmp      handleEnemiesLoop_SB 

allEnemiesHandled_SB 
                    jmp      smartBombReturn 

;***************************************************************************
PrintBonusHere 
                    ldd      #backFromBonusPrintShop 
                    std      BONUS_DONE_A 
                    tfr      s,y 
                    lds      #BONUS_DONE 
                    ldu      ,u                           ; always take anim 0 as "fixed" (no animation) 
                    clra     
                    pulu     b,x,pc 
backFromBonusPrintShop 
                    tfr      y,s 
                    rts      

;***************************************************************************
; only do sound
; bonus objects 
; nothing else
gameLoopPart0                                             ;#isfunction  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 if  TEST_VOX = 1 
REPLACE_1_2_voxSpeak_varFromIRQ0_21 
                    ldx      #0                           ;voxSpeak 
                    jsr      jsrBank0_fromBank2_Shift 
 endif  
 if  VECFEVER = 1 
; BIT_FLAG_PLAY_YM    =        %10000000 
                    lda      playSoundFlags 
                    bmi      no1SoundHere 
 endif  
REPLACE_1_2_doymsound100_varFromIRQ1_5 
                    ldx      #0                           ; doymsound100 
                    jsr      jsrBank1_fromBank2_T1 
no1SoundHere 
                    lda      diverseFlags 
                    anda     #BIT_FLAG_IS_BOSSFIGHT_ANY 
                    lbne     jmpBack3BonusDying 
                    jmp      playerShotsDoneM 

;***************************************************************************
                    include  "font_5.asm"                 ; include here, since otherwise a label is not known below
; k
Print5Strd 
Print5_Str_d 
                    MY_MOVE_TO_D_START  
Print5_Str_d_inMove 
                    STU      Vec_Str_Ptr                  ;Save string pointer 
                    LDX      #FONT_START_A                ;Point to start of chargen bitmaps 
                    MY_MOVE_TO_D_END  
Print5_Str_Here 
                    LDD      #$1883                       ;$8x = enable RAMP? 
                    CLR      <VIA_port_a                  ;Clear D/A output 
                    STA      <VIA_aux_cntl                ;Shift reg mode = 110, T1 PB7 enabled 
LF4A5_5: 
                    STB      <VIA_port_b                  ;Update RAMP, set mux to channel 1 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    decb     
                    stb      <VIA_port_b                  ;Enable mux 
 else  
                    dec      <VIA_port_b                  ;Enable mux 
 endif  
                    LDD      #$8081 
                                                          ; nop 
                    STB      <VIA_port_b                  ;Enable RAMP, set mux to channel 0 
                    STA      <VIA_port_b                  ;Enable mux 
                    nop                                   ; IMPORTANT! 
                    stb      <VIA_port_b                  ;Enable RAMP, disable mux 
                    LDA      Vec_Text_Width               ;Get text width 
                    STA      <VIA_port_a                  ;Send it to the D/A 
                    LDD      #$0100 
                    LDU      Vec_Str_Ptr                  ;Point to start of text string 
                    STA      <VIA_port_b                  ;Disable RAMP, disable mux 
                    BRA      LF4CB_5 

LF4C7_5: 
                    LDA      A,X                          ;Get bitmap from chargen table 
                    STA      <VIA_shift_reg               ;Save in shift register 
LF4CB_5: 
                    LDA      ,U+                          ;Get next character 
                    BPL      LF4C7_5                      ;Go back if not terminator 
                    LDA      #$81 
                    STA      <VIA_port_b                  ;Enable RAMP, disable mux 
                    NEG      <VIA_port_a                  ;Negate text width to D/A 
                    LDA      #$01 
                    STA      <VIA_port_b                  ;Disable RAMP, disable mux 
                    CMPX     #FONT_END                    ; Check for last row 
                    BEQ      LF50A_5                      ;Branch if last row 
                    LEAX     FONT_LENGTH,X                ;Point to next chargen row 
                    TFR      U,D                          ;Get string length 
                    SUBD     Vec_Str_Ptr 
                    SUBB     #$02                         ; - 2 
                    ASLB                                  ; * 2 
                    BRN      LF4EB_5                      ;Delay a moment 
LF4EB_5: 
                    LDA      #$81 
                    NOP      
                    DECB     
                    BNE      LF4EB_5                      ;Delay some more in a loop 
                    STA      <VIA_port_b                  ;Enable RAMP, disable mux 
                    LDB      Vec_Text_Height              ;Get text height 
                    STB      <VIA_port_a                  ;Store text height in D/A 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    deca     
                    sta      <VIA_port_b                  ;Enable mux 
 else  
                    dec      <VIA_port_b                  ;Enable mux 
 endif  
                    LDD      #$8101 
                    NOP                                   ;Wait a moment 
                    STA      <VIA_port_b                  ;Enable RAMP, disable mux 
                    CLR      <VIA_port_a                  ;Clear D/A 
                    STB      <VIA_port_b                  ;Disable RAMP, disable mux 
                    STA      <VIA_port_b                  ;Enable RAMP, disable mux 
                    LDB      #$03                         ;$0x = disable RAMP? 
                    BRA      LF4A5_5                      ;Go back for next scan line 

LF50A_5: 
;                    LDA      #$98 
;                    STA      <VIA_aux_cntl                ;T1->PB7 enabled 
                    LDD      #$98CC 
                    STD      <VIA_aux_cntl                ;T1->PB7 enabled 
; _ZERO_VECTOR_BEAM
                    RTS      

;***************************************************************************
achievmentMessages 
                    dw       stringSniperRank3 
                    dw       stringSniperRank2 
                    dw       stringSniperRank1 
                    dw       stringScoreRank5 
                    dw       stringScoreRank4 
                    dw       stringScoreRank3 
                    dw       stringScoreRank2 
                    dw       stringScoreRank1 
                    dw       stringCollectorRank5 
                    dw       stringCollectorRank4 
                    dw       stringCollectorRank3 
                    dw       stringCollectorRank2 
                    dw       stringCollectorRank1 
                    dw       stringGreedy 
                    dw       string9Lives 
                    dw       stringAll 
                    dw       stringBladeMasterRank5 
                    dw       stringBladeMasterRank4 
                    dw       stringBladeMasterRank3 
                    dw       stringBladeMasterRank2 
                    dw       stringBladeMasterRank1 
                    dw       stringTripple 
                    dw       stringQuadro 
                    dw       stringLaser 
                    dw       stringOfficerRank4 
                    dw       stringOfficerRank3 
                    dw       stringOfficerRank2 
                    dw       stringOfficerRank1 
                    dw       stringSpyRank4 
                    dw       stringSpyRank3 
                    dw       stringSpyRank2 
                    dw       stringSpyRank1 
                    dw       stringChallengeRank4 
                    dw       stringChallengeRank3 
                    dw       stringChallengeRank2 
                    dw       stringChallengeRank1 
                    dw       stringLoss 
                    dw       stringFalcon 
                    dw       stringDrunken 
;
stringSniperRank3 
                    db       "SNIPER RANK 3!", $80
stringSniperRank2 
                    db       "SNIPER RANK 2!", $80
stringSniperRank1 
                    db       "SNIPER RANK 1!", $80
stringScoreRank5 
                    db       "SCORER RANK 5!", $80
stringScoreRank4 
                    db       "SCORER RANK 4!", $80
stringScoreRank3 
                    db       "SCORER RANK 3!", $80
stringScoreRank2 
                    db       "SCORER RANK 2!", $80
stringScoreRank1 
                    db       "SCORER RANK 1!", $80
stringCollectorRank5 
                    db       "MONEY RANK 5!", $80
stringCollectorRank4 
                    db       "MONEY RANK 4!", $80
stringCollectorRank3 
                    db       "MONEY RANK 3!", $80
stringCollectorRank2 
                    db       "MONEY RANK 2!", $80
stringCollectorRank1 
                    db       "MONEY RANK 1!", $80
stringGreedy 
                    db       "GREEDY!", $80
string9Lives 
                    db       "LIVELY!", $80
stringAll 
                    db       "ALL!", $80
stringBladeMasterRank5 
                    db       "BLADE RANK 5!", $80
stringBladeMasterRank4 
                    db       "BLADE RANK 4!", $80
stringBladeMasterRank3 
                    db       "BLADE RANK 3!", $80
stringBladeMasterRank2 
                    db       "BLADE RANK 2!", $80
stringBladeMasterRank1 
                    db       "BLADE RANK 1!", $80
stringTripple 
                    db       "TRIPLE!", $80
stringQuadro 
                    db       "QUADRO!", $80
stringLaser 
                    db       "LASER!", $80
stringOfficerRank4 
                    db       "OFFICER RANK 4", $80
stringOfficerRank3 
                    db       "OFFICER RANK 3", $80
stringOfficerRank2 
                    db       "OFFICER RANK 2", $80
stringOfficerRank1 
                    db       "OFFICER RANK 1", $80
stringSpyRank4 
                    db       "SPY RANK 4!", $80
stringSpyRank3 
                    db       "SPY RANK 3!", $80
stringSpyRank2 
                    db       "SPY RANK 2!", $80
stringSpyRank1 
                    db       "SPY RANK 1!", $80
stringChallengeRank4 
                    db       "BONUS RANK 4", $80
stringChallengeRank3 
                    db       "BONUS RANK 3", $80
stringChallengeRank2 
                    db       "BONUS RANK 2", $80
stringChallengeRank1 
                    db       "BONUS RANK 1", $80
stringLoss 
                    db       "BIGGEST LOSS!", $80
stringFalcon 
                    db       "FALCON-STORM", $80
stringDrunken 
                    db       "DRUNKEN-STORM", $80
stringAchievement 
                    db       "ACHIEVEMENT!", $80
;***************************************************************************
; print big firework for achievement
; in y address of acievement
; called when no other objects besides scoopies are "needed"
; e.g. before a level init!
printAchievement                                          ;#isfunction  
; init fireworks, this time we have SPACE enough
                    pshs     y 
                    lda      #$30 
                    sta      stringScale 
                    SCOOPY_SAVE  
;.........initFireworks
                    ldd      #backFromFireWorks2          ; explosions jump back to here after all have been rendered 
                    std      FW_PARTICLES_DONE_A 
; setup objects
                    lda      #FIREWOKRS_PARTICLE_COUNT 
                    ldu      #fwobject_list 
                    stu      fwlist_empty_head 
                    ldy      #FW_PARTICLES_DONE 
fw_next_list_exentry_1_2 
                    leax     VelocityParticle,u 
                    stx      FW_NEXT_OBJECT,u 
                    leau     ,x 
                    deca     
                    bne      fw_next_list_exentry_1_2 
                    leau     -VelocityParticle,u 
                    sty      FW_NEXT_OBJECT,u 
                    sty      fwlist_objects_head 
achievementCounter  =        laserEnemyPointer 
                    ldd      #250 
                    std      achievementCounter 
;.........
achievmentLoop 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    JSR      my_wait_recal                ;Wait_Recal 
 else  
                    JSR      Wait_Recal 
 endif  
                    jsr      Intensity_3F 
REPLACE_1_2_doymsound100_varFromIRQ1_100 
                    ldx      #0                           ; doymsound100 
                    jsr      jsrBank1_fromBank2_T1 
                    lda      gameScale 
                    sta      VIA_t1_cnt_lo 
                    ldd      #$40c0 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    JSR      my_Moveto_d                  ;Moveto_d 
 else  
                    JSR      Moveto_d 
 endif  
                    jsr      calibrateString 
                    ldu      #stringAchievement 
                    lda      #STRING_SCALE                ; stringScale 
                    sta      VIA_t1_cnt_lo 
                    jsr      printVectorString 
                    _ZERO_VECTOR_BEAM  
                    lda      gameScale 
                    sta      VIA_t1_cnt_lo 
                    ldd      #$10c0 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    JSR      my_Moveto_d                  ;Moveto_d 
 else  
                    JSR      Moveto_d 
 endif  
                    ldu      [,s] 
                    lda      #STRING_SCALE                ; stringScale 
                    sta      VIA_t1_cnt_lo 
                    jsr      printVectorString 
                    _ZERO_VECTOR_BEAM  
                    lda      #$60 
                    sta      VIA_t1_cnt_lo 
                    lda      Vec_Loop_Count+1 
                    anda     #%00011111 
                    bne      nothingNew_Ach 
; launch rocket
; Launch a rocket on the press of a button
                    jsr      newFWObject 
                    cmpu     #OBJECT_LIST_COMPARE_ADDRESS 
                    bls      noRLNewEmitter_Ach 
                    ldd      #rocketEmitterBehaviour 
                    std      FW_BEHAVIOUR, u 
                    ldd      #$9000 
                    std      FW_Y_POS, U                  ; current POS 16 bit 
                    lda      #0 
                    std      FW_X_POS, U                  ; current POS 
;                    clra     
                    RANDOM_B  
                    orb      #%00100000 
                    std      FW_Y_VEL, u 
                    RANDOM_B  
                    sex      
                    std      FW_X_VEL, u 
                    RANDOM_B  
                    andb     #%00111111                   ; slightly different age 
                    orb      #%00010000 
                    stb      FW_AGE,U 
noRLNewEmitter_Ach 
nothingNew_Ach 
                    ldu      fwlist_objects_head 
                    pulu     d,pc                         ; (D = y,x) ; do all objects 
backFromFireWorks2 
                    ldd      achievementCounter 
                    subd     #1 
                    std      achievementCounter 
                    lbne     achievmentLoop 
; order up - working?
                    lda      #MAX_ENEMY_OBJECTS 
                    ldu      #enemyobject_list 
                    stu      enemylist_empty_head 
                    ldy      #ENEMY_DONE 
next_list_entry_igb2 
                    leax     EnemyStruct,u 
                    stx      NEXT_ENEMY_OBJECT,u 
                    clr      BIT_MASK,u 
                    leau     ,x 
                    deca     
                    bne      next_list_entry_igb2 
                    leau     -EnemyStruct,u 
                    sty      NEXT_ENEMY_OBJECT,u 
                    sty      enemylist_objects_head 
                    SCOOPY_LOAD  
                    puls     y,pc 
;***************************************************************************
doAchiements 
REPLACE_1_2_doAchiements1_varFromIRQ1_1 
                    ldx      #0                           ; doAchiements1 
                    jmp      jmpBankIRQ1Shift 

;***************************************************************************
HighScoreTest_Start 
 ldb #3
 stb current_button_state
REPLACE_1_2_showHighscoreMusic_varFromIRQ1_1 

                    ldx      #0                           ; showHighscoreMusic HighScoreTest 
                    jsr      jsrBank1_fromBank2_T1 
                    jmp      fromGameOver 

;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
RANDOM_A_MAX        macro    
                    RANDOM_A  
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
_ZERO_VECTOR_BEAM3  macro    
                    ldd      #15*256 
                    std      <VIA_t1_cnt_lo 
                    lda      #$ff 
                    sta      <VIA_shift_reg 
                    lda      TWINKLE +u_offset1,s 
                    sta      <VIA_t1_cnt_lo 
                    ldd      #0 
                    std      <VIA_port_b 
                    sta      <VIA_shift_reg 
                    LDb      #$CC                         ; BLANK false, ZERO true 
                    STB      <VIA_cntl                    ;/BLANK low and /ZERO low 
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
_ZERO_VECTOR_BEAM2  macro    
                    ldd      #%00110000 
                    sta      <VIA_shift_reg 
                    LDb      #$CC                         ; BLANK false, ZERO true 
                    STB      <VIA_cntl                    ;/BLANK low and /ZERO low 
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
TWINKLE_AND         =        %00111111 
TWINKLE_OR          =        %00001111                    ; lowest twinkle brightness 
simpleStarBehaviour2Bank2                                 ;#isfunction  
                    lda      TWINKLE +u_offset1,s 
                    sta      <VIA_t1_cnt_lo 
                    _INTENSITY_A  
                    ldd      Y1_POS+u_offset1,s 
                    MY_MOVE_TO_D_START  
                    lda      TWINKLE +u_offset1,s 
                    lsra     
                    lsra     
                    lsra     
                    lsra     
                    bne      addyeah 
                    lda      #1 
addyeah 
                    adda     TWINKLE +u_offset1,s 
                    sta      TWINKLE +u_offset1,s 
                    cmpa     #$7f 
                    blo      constar2 
                    lda      #8 
                    sta      TWINKLE +u_offset1,s 
                    RANDOM_A_MAX  
                    sta      Y1_POS+u_offset1,s 
                    RANDOM_A_MAX  
                    sta      Y2_POS+u_offset1,s 
                    RANDOM_A_MAX  
                    sta      Y3_POS+u_offset1,s 
                    RANDOM_A_MAX  
                    sta      Y4_POS+u_offset1,s 
                    RANDOM_A_MAX  
                    sta      X1_POS+u_offset1,s 
                    RANDOM_A_MAX  
                    sta      X2_POS+u_offset1,s 
                    RANDOM_A_MAX  
                    sta      X3_POS+u_offset1,s 
                    RANDOM_A_MAX  
                    sta      X4_POS+u_offset1,s 
                    jmp      endit 

constar2 
                    MY_MOVE_TO_B_END  
                    _ZERO_VECTOR_BEAM3  
; 2 ;;;
                    ldd      Y2_POS+u_offset1,s 
                    MY_MOVE_TO_D_START  
                    tst      in_moveFlag 
                    bne      firstStars_a 
                    PLAYER_MOVEMENT_MOVE_BLOCK  
firstStars_a 
                    MY_MOVE_TO_B_END  
                    _ZERO_VECTOR_BEAM3  
; 3 ;;;
                    ldd      Y3_POS+u_offset1,s 
                    MY_MOVE_TO_D_START  
                    tst      in_moveFlag 
 if  USE_NEW_SHOTS = 1 
                    bne      firstStars_b 
 else  
                    lbne     firstStars_b 
 endif  
                    INITIALZE_SHOT_TEST_MOVE_BLOCK_1  
firstStars_b 
                    MY_MOVE_TO_B_END  
                    _ZERO_VECTOR_BEAM3  
; 4 ;;;
                    ldd      Y4_POS+u_offset1,s 
                    MY_MOVE_TO_D_START  
                    tst      in_moveFlag 
 if  USE_NEW_SHOTS = 1 
                    bne      firstStars_c 
 else  
                    lbne     firstStars_c 
 endif  
                    inc      in_moveFlag 
                    INITIALZE_SHOT_TEST_MOVE_BLOCK_2  
firstStars_c 
                    MY_MOVE_TO_B_END  
                    _ZERO_VECTOR_BEAM3  
; end 
                    lda      gameScale 
                    sta      VIA_t1_cnt_lo 
REPLACE_1_2_backToStarBehaviour_varFrom1_1 
                    ldx      #0                           ; backToStarBehaviour 
                    jmp      jmpBank1X 

endit 
                    MY_MOVE_TO_B_END  
                    _ZERO_VECTOR_BEAM  
                    ldd      #0 
                    std      <VIA_port_b 
                    lda      gameScale 
                    sta      VIA_t1_cnt_lo 
REPLACE_1_2_backToStarBehaviour_varFrom1_2 
                    ldx      #0                           ; backToStarBehaviour 
                    jmp      jmpBank1X 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
simpleStarBehaviourHSBank2                                ;#isfunction  
                    lda      RADIUS +u_offset1,s 
                    sta      <VIA_t1_cnt_lo 
                    cmpa     #$7f 
                    blo      intOk 
                    lda      #$7f 
intOk 
                    _INTENSITY_A  
                    ldd      Y1_POS+u_offset1,s 
                    MY_MOVE_TO_D_START  
                    lda      RADIUS +u_offset1,s 
                    lsra     
                    lsra     
                    lsra     
                    lsra     
                    lsra     
                    bne      addyeahHS 
                    lda      #1 
addyeahHS 
                    adda     RADIUS +u_offset1,s 
                    sta      RADIUS +u_offset1,s 
                    cmpa     #$af                         ;af 
                    blo      constar2HS 
                    RANDOM_A_MAX  
                    anda     #%00001111 
                    sta      RADIUS +u_offset1,s 
                    RANDOM_A_MAX  
                    sta      Y1_POS+u_offset1,s 
                    RANDOM_A_MAX  
                    sta      Y2_POS+u_offset1,s 
                    RANDOM_A_MAX  
                    sta      Y3_POS+u_offset1,s 
                    RANDOM_A_MAX  
                    sta      Y4_POS+u_offset1,s 
                    RANDOM_A_MAX  
                    sta      X1_POS+u_offset1,s 
                    RANDOM_A_MAX  
                    sta      X2_POS+u_offset1,s 
                    RANDOM_A_MAX  
                    sta      X3_POS+u_offset1,s 
                    RANDOM_A_MAX  
                    sta      X4_POS+u_offset1,s 
                    jmp      enditHS 

constar2HS 
                    MY_MOVE_TO_B_END  
                    _ZERO_VECTOR_BEAM2  
; 2 ;;;
                    ldd      Y2_POS+u_offset1,s 
                    MY_MOVE_TO_D_START  
                    tst      in_moveFlag 
                    bne      firstStars_aHS 
firstStars_aHS 
                    MY_MOVE_TO_B_END  
                    _ZERO_VECTOR_BEAM2  
; 3 ;;;
                    ldd      Y3_POS+u_offset1,s 
                    MY_MOVE_TO_D_START  
                    tst      in_moveFlag 
 if  USE_NEW_SHOTS = 1 
                    bne      firstStars_bHS 
 else  
                    bne      firstStars_bHS 
 endif  
firstStars_bHS 
                    MY_MOVE_TO_B_END  
                    _ZERO_VECTOR_BEAM2  
; 4 ;;;
                    ldd      Y4_POS+u_offset1,s 
                    MY_MOVE_TO_D_START  
                    tst      in_moveFlag 
 if  USE_NEW_SHOTS = 1 
                    bne      firstStars_cHS 
 else  
                    bne      firstStars_cHS 
 endif  
                    inc      in_moveFlag 
firstStars_cHS 
                    MY_MOVE_TO_B_END  
                    _ZERO_VECTOR_BEAM2  
; end 
                    lda      gameScale 
                    sta      VIA_t1_cnt_lo 
REPLACE_1_2_backToStarBehaviourHS_varFrom1_1 
                    ldx      #0                           ; backToStarBehaviourHS 
                    jmp      jmpBank1X 

enditHS 
                    MY_MOVE_TO_B_END  
                    _ZERO_VECTOR_BEAM  
                    ldd      #0 
                    std      <VIA_port_b 
                    lda      gameScale 
                    sta      VIA_t1_cnt_lo 
REPLACE_1_2_backToStarBehaviourHS_varFrom1_2 
                    ldx      #0                           ; backToStarBehaviourHS 
                    jmp      jmpBank1X 

endOfGameAchievementTest                                  ;#isfunction  
                    ldb      #-1 
;..........................................................
; scoring
;ACHIEVEMENT_FLAG_BYTE1_SCORER_RANK5 = %00001000 ; checked at the end of each game
;ACHIEVEMENT_FLAG_BYTE1_SCORER_RANK4 = %00010000
;ACHIEVEMENT_FLAG_BYTE1_SCORER_RANK3 = %00100000
;ACHIEVEMENT_FLAG_BYTE1_SCORER_RANK2 = %01000000
;ACHIEVEMENT_FLAG_BYTE1_SCORER_RANK1 = %10000000
;- score: 100000: Scorer Rank 5: player speed +1
;- score: 500000: Scorer Rank 4: player speed +1
;- score: 1000000: Scorer Rank 3: player speed +1
;- score: 2500000: Scorer Rank 2: player speed +1
;- score: 5000000: Scorer Rank 1: player speed +1
checkScore5 
                    lda      achievements + 0 
                    bita     #ACHIEVEMENT_FLAG_BYTE1_SCORER_RANK5 
                    bne      checkScore4 
                    lda      player_score_6 
                    cmpa     # '0'
                    bhi      displayScoreAchievementRank5 
                    lda      player_score_5 
                    cmpa     # '0'
                    lble     scoreCheckDone               ; no achievement 
displayScoreAchievementRank5 
                    lda      achievements + 0 
                    ora      #ACHIEVEMENT_FLAG_BYTE1_SCORER_RANK5 
                    sta      achievements + 0 
                    ldb      #A_SCORE_RANK5 
                    jsr      displayAchievement 
checkScore4 
                    lda      achievements + 0 
                    bita     #ACHIEVEMENT_FLAG_BYTE1_SCORER_RANK4 
                    bne      checkScore3 
                    lda      player_score_6 
                    cmpa     # '0'
                    bhi      displayScoreAchievementRank4 
                    lda      player_score_5 
                    cmpa     # '4'
                    ble      scoreCheckDone               ; no achievement 
displayScoreAchievementRank4 
                    lda      achievements + 0 
                    ora      #ACHIEVEMENT_FLAG_BYTE1_SCORER_RANK4 
                    sta      achievements + 0 
                    ldb      #A_SCORE_RANK4 
                    jsr      displayAchievement 
checkScore3 
                    lda      achievements + 0 
                    bita     #ACHIEVEMENT_FLAG_BYTE1_SCORER_RANK3 
                    bne      checkScore2 
                    lda      player_score_6 
                    cmpa     # '0'
                    ble      scoreCheckDone               ; no achievement 
displayScoreAchievementRank3 
                    lda      achievements + 0 
                    ora      #ACHIEVEMENT_FLAG_BYTE1_SCORER_RANK3 
                    sta      achievements + 0 
                    ldb      #A_SCORE_RANK3 
                    jsr      displayAchievement 
checkScore2 
                    lda      achievements + 0 
                    bita     #ACHIEVEMENT_FLAG_BYTE1_SCORER_RANK2 
                    bne      checkScore1 
                    lda      player_score_6 
                    cmpa     # '2'
                    bhi      displayScoreAchievementRank2 ; 
                    cmpa     # '1'
                    ble      scoreCheckDone 
                    lda      player_score_5 
                    cmpa     # '4'
                    ble      scoreCheckDone 
displayScoreAchievementRank2 
                    lda      achievements + 0 
                    ora      #ACHIEVEMENT_FLAG_BYTE1_SCORER_RANK2 
                    sta      achievements + 0 
                    ldb      #A_SCORE_RANK2 
                    jsr      displayAchievement 
checkScore1 
                    lda      achievements + 0 
                    bita     #ACHIEVEMENT_FLAG_BYTE1_SCORER_RANK1 
                    bne      scoreCheckDone 
                    lda      player_score_6 
                    cmpa     # '4'
                    ble      scoreCheckDone               ; no achievement 
displayScoreAchievementRank1 
                    lda      achievements + 0 
                    ora      #ACHIEVEMENT_FLAG_BYTE1_SCORER_RANK1 
                    sta      achievements + 0 
                    ldb      #A_SCORE_RANK1 
                    jsr      displayAchievement 
;..........................................................
scoreCheckDone 
;..........................................................
;ACHIEVEMENT_FLAG_BYTE1_SNIPER_RANK3 = %00000001 ; checked at the end of each game
;ACHIEVEMENT_FLAG_BYTE1_SNIPER_RANK2 = %00000010
;ACHIEVEMENT_FLAG_BYTE1_SNIPER_RANK1 = %00000100
;hit percentage (min 1000 shots) above 90% - Sniper Ranke 3 - start with bullet +1
;hit percentage (min 1000 shots) above 100% - Sniper Ranke 2 - start with bullet +1
;hit percentage (min 1000 shots) above 120% - Sniper Ranke 1 - start with bullet +1
                    ldd      playerShotCountW 
                    cmpd     #1000 
                    blo      sniperCheckDone              ; only check when at least 1000 shots fired 
REPLACE_1_2_calcHitPercentage_varFromIRQ0_1 
                    ldx      #0                           ;calcHitPercentage 
                    jsr      jsrBank0_fromBank2_Shift 
;                    jsr      calcHitPercentage 
                    lda      achievements + 0 
                    bita     #ACHIEVEMENT_FLAG_BYTE1_SNIPER_RANK3 
                    bne      checkSniper2 
                    lda      tmp_div1                     ; remembered! 
                    cmpa     #90 
                    blo      sniperCheckDone              ; no achievement 
displaySniperAchievementRank3 
                    lda      achievements + 0 
                    ora      #ACHIEVEMENT_FLAG_BYTE1_SNIPER_RANK3 
                    sta      achievements + 0 
                    ldb      #A_SNIPER_RANK3 
                    jsr      displayAchievement 
checkSniper2 
                    lda      achievements + 0 
                    bita     #ACHIEVEMENT_FLAG_BYTE1_SNIPER_RANK2 
                    bne      checkSniper1 
                    lda      tmp_div1                     ; remembered! 
                    cmpa     #100 
                    blo      sniperCheckDone              ; no achievement 
displaySniperAchievementRank2 
                    lda      achievements + 0 
                    ora      #ACHIEVEMENT_FLAG_BYTE1_SNIPER_RANK2 
                    sta      achievements + 0 
                    ldb      #A_SNIPER_RANK2 
                    jsr      displayAchievement 
checkSniper1 
                    lda      achievements + 0 
                    bita     #ACHIEVEMENT_FLAG_BYTE1_SNIPER_RANK1 
                    bne      sniperCheckDone 
                    lda      tmp_div1                     ; remembered! 
                    cmpa     #120 
                    blo      sniperCheckDone              ; no achievement 
displaySniperAchievementRank1 
                    lda      achievements + 0 
                    ora      #ACHIEVEMENT_FLAG_BYTE1_SNIPER_RANK1 
                    sta      achievements + 0 
                    ldb      #A_SNIPER_RANK1 
                    jsr      displayAchievement 
sniperCheckDone 
;...
;ACHIEVEMENT_FLAG_BYTE4_OFFICER_RANK4 = %00000001 ; checked on officer level up! (after shop)
;ACHIEVEMENT_FLAG_BYTE4_OFFICER_RANK3 = %00000010
;ACHIEVEMENT_FLAG_BYTE4_OFFICER_RANK2 = %00000100
;ACHIEVEMENT_FLAG_BYTE4_OFFICER_RANK1 = %00001000
;ACHIEVEMENT_FLAG_BYTE4_SPY_RANK4  = %00010000 ; check when secret is discovered
;ACHIEVEMENT_FLAG_BYTE4_SPY_RANK3  = %00100000
;ACHIEVEMENT_FLAG_BYTE4_SPY_RANK2  = %01000000
;ACHIEVEMENT_FLAG_BYTE4_SPY_RANK1  = %10000000
;- Rank:  LIEUTENANT: Officer Rank 4: start game with armor
;- score: ADMIRAL: Officer Rank 3: enable shop buy RANK (1000)
;- score: ADMIRAL 1 SILVER STAR: Officer Rank 2:  start with autofire
;- score: ADMIRAL 3 GOLD STAR: Officer Rank 1: start with timer +10s
;(found in one game!)
;- secrets: discover 2 secrets: SPY RANK 4: start with one super bomb
;- secrets: discover 4 secrets: SPY RANK 3: start dodger permanently with x2
;- secrets: discover 6 secrets: SPY RANK 2: buy bomb permanently added to shop
;- secrets: discover all secrets: SUPER SPY: get a "pocket shop" (press button 1 at the end of level -> enter shop)
checkOfficer4 
                    lda      achievements + 3 
                    bita     #ACHIEVEMENT_FLAG_BYTE4_OFFICER_RANK4 
                    bne      Officer4CheckDone 
                    lda      officerRankTmp               ; remembered! 
                    cmpa     #1 
                    blo      OfficerCheckDone             ; no achievement 
displayOfficerAchievementRank4 
                    lda      achievements + 3 
                    ora      #ACHIEVEMENT_FLAG_BYTE4_OFFICER_RANK4 
                    sta      achievements + 3 
                    ldb      #A_OFFICER_RANK4 
                    jsr      displayAchievement 
Officer4CheckDone 
checkOfficer3 
                    lda      achievements + 3 
                    bita     #ACHIEVEMENT_FLAG_BYTE4_OFFICER_RANK3 
                    bne      Officer3CheckDone 
                    lda      officerRankTmp               ; remembered! 
                    cmpa     #4                           ; Admiral 
                    blo      OfficerCheckDone             ; no achievement 
displayOfficerAchievementRank3 
                    lda      achievements + 3 
                    ora      #ACHIEVEMENT_FLAG_BYTE4_OFFICER_RANK3 
                    sta      achievements + 3 
                    ldb      #A_OFFICER_RANK3 
                    jsr      displayAchievement 
Officer3CheckDone 
checkOfficer2 
                    lda      achievements + 3 
                    bita     #ACHIEVEMENT_FLAG_BYTE4_OFFICER_RANK2 
                    bne      Officer2CheckDone 
                    lda      officerRankTmp               ; remembered! 
                    cmpa     #8                           ; Admiral Silver 
                    blo      OfficerCheckDone             ; no achievement 
displayOfficerAchievementRank2 
                    lda      achievements + 3 
                    ora      #ACHIEVEMENT_FLAG_BYTE4_OFFICER_RANK2 
                    sta      achievements + 3 
                    ldb      #A_OFFICER_RANK2 
                    jsr      displayAchievement 
Officer2CheckDone 
checkOfficer1 
                    lda      achievements + 3 
                    bita     #ACHIEVEMENT_FLAG_BYTE4_OFFICER_RANK1 
                    bne      Officer1CheckDone 
                    lda      officerRankTmp               ; remembered! 
                    cmpa     #13                          ; Admiral 3 gold 
                    blo      OfficerCheckDone             ; no achievement 
displayOfficerAchievementRank1 
                    lda      achievements + 3 
                    ora      #ACHIEVEMENT_FLAG_BYTE4_OFFICER_RANK1 
                    sta      achievements + 3 
                    ldb      #A_OFFICER_RANK1 
                    jsr      displayAchievement 
Officer1CheckDone 
OfficerCheckDone 
;                    jsr      getSecretCount 
REPLACE_1_2_getSecretCount_varFromIRQ0_1 
                    ldx      #0                           ;getSecretCount 
                    jsr      jsrBank0_fromBank2_Shift 
secretCount         =        enemyCount 
checkSpy4 
                    lda      achievements + 3 
                    bita     #ACHIEVEMENT_FLAG_BYTE4_SPY_RANK4 
                    bne      Spy4CheckDone 
                    cmpb     #2                           ; 
                    blo      SpyCheckDone                 ; no achievement 
displaySpyAchievementRank4 
                    lda      achievements + 3 
                    ora      #ACHIEVEMENT_FLAG_BYTE4_SPY_RANK4 
                    sta      achievements + 3 
                    ldb      #A_SPY_RANK4 
                    jsr      displayAchievement 
                    ldb      secretCount 
Spy4CheckDone 
checkSpy3 
                    lda      achievements + 3 
                    bita     #ACHIEVEMENT_FLAG_BYTE4_SPY_RANK3 
                    bne      Spy3CheckDone 
                    cmpb     #4                           ; 
                    blo      SpyCheckDone                 ; no achievement 
displaySpyAchievementRank3 
                    lda      achievements + 3 
                    ora      #ACHIEVEMENT_FLAG_BYTE4_SPY_RANK3 
                    sta      achievements + 3 
                    ldb      #A_SPY_RANK3 
                    jsr      displayAchievement 
                    ldb      secretCount 
Spy3CheckDone 
checkSpy2 
                    lda      achievements + 3 
                    bita     #ACHIEVEMENT_FLAG_BYTE4_SPY_RANK2 
                    bne      Spy2CheckDone 
                    cmpb     #6                           ; 
                    blo      SpyCheckDone                 ; no achievement 
displaySpyAchievementRank2 
                    lda      achievements + 3 
                    ora      #ACHIEVEMENT_FLAG_BYTE4_SPY_RANK2 
                    sta      achievements + 3 
                    ldb      #A_SPY_RANK2 
                    jsr      displayAchievement 
                    ldb      secretCount 
Spy2CheckDone 
checkSpy1 
                    lda      achievements + 3 
                    bita     #ACHIEVEMENT_FLAG_BYTE4_SPY_RANK1 
                    bne      Spy1CheckDone 
                    cmpb     #7                           ; 
                    blo      SpyCheckDone                 ; no achievement 
displaySpyAchievementRank1 
                    lda      achievements + 3 
                    ora      #ACHIEVEMENT_FLAG_BYTE4_SPY_RANK1 
                    sta      achievements + 3 
                    ldb      #A_SPY_RANK1 
                    jsr      displayAchievement 
Spy1CheckDone 
SpyCheckDone 
checkAll 
;ACHIEVEMENT_FLAG_BYTE2_ALL    = %10000000 ; checked at the end of each game
;- get them all (highest ranks on all): new RANK Officer GREAT DEFENDER!
                    lda      achievements + 0 
                    cmpa     #%11111111 
                    bne      notAll 
                    lda      achievements + 1 
                    cmpa     #%01111111 
                    bne      notAll 
                    lda      achievements + 2 
                    cmpa     #%11111111 
                    bne      notAll 
                    lda      achievements + 3 
                    cmpa     #%11111111 
                    bne      notAll 
                    lda      achievements + 4 
                    cmpa     #%11111000 
                    blo      notAll 
                    lda      achievements + 5 
                    anda     #%00000011 
                    cmpa     #%00000011 
                    bne      notAll 
displayAllAchievements 
                    lda      achievements + 1 
                    ora      #ACHIEVEMENT_FLAG_BYTE2_ALL 
                    sta      achievements + 1 
                    ldb      #A_ALL 
                    jsr      displayAchievement 
notAll 
REPLACE_1_2_backFromEndOfGameAchievementTest_varFromIRQ1_2 
                    ldx      #0                           ; backFromEndOfGameAchievementTest 
                    jmp      jmpBankIRQ1Shift 

;.............................................................................
;.............................................................................
;.............................................................................
afterChallengeAchievementTest                             ;#isfunction  
; if played a saved game,  no high score / achievements possible!
                    lda      flashAvailable 
                    anda     #SAVEGAME_IS_ACTIVE_BIT      ; game available 
                    bne      BonusCheckDone 
;ACHIEVEMENT_FLAG_BYTE5_CHALLENGER_RANK4 = %00001000 ; check after challenge
;ACHIEVEMENT_FLAG_BYTE5_CHALLENGER_RANK3 = %00010000
;ACHIEVEMENT_FLAG_BYTE5_CHALLENGER_RANK2 = %00100000
;ACHIEVEMENT_FLAG_BYTE5_CHALLENGER_RANK1 = %01000000
;- challenge: get 2000 bonus: Challenger Rank 4 -> start with rate
;- challenge: get 8000 bonus: Challenger Rank 3 -> start with rate
;- challenge: get 16000 bonus: Challenger Rank 2 -> start with rate
;- challenge: get 256000 bonus: Challenger Rank 1 -> start with rate
                                                          ;perfectBonus = 9 -> 256000 
                    ldb      isDemoMode 
                    bne      BonusCheckDone 
checkBonusRank4 
                    lda      achievements + 4 
                    bita     #ACHIEVEMENT_FLAG_BYTE5_CHALLENGER_RANK4 
                    bne      Bonus4CheckDone 
                    ldb      perfectBonus 
                    cmpb     #2                           ; 2000 
                    blo      BonusCheckDone               ; no achievement 
displayBonusAchievementRank4 
                    lda      achievements + 4 
                    ora      #ACHIEVEMENT_FLAG_BYTE5_CHALLENGER_RANK4 
                    sta      achievements + 4 
                    ldb      #A_BONUS_RANK4 
                    jsr      displayAchievement 
Bonus4CheckDone 
checkBonusRank3 
                    lda      achievements + 4 
                    bita     #ACHIEVEMENT_FLAG_BYTE5_CHALLENGER_RANK3 
                    bne      Bonus3CheckDone 
                    ldb      perfectBonus 
                    cmpb     #4                           ; 8000 
                    blo      BonusCheckDone               ; no achievement 
displayBonusAchievementRank3 
                    lda      achievements + 4 
                    ora      #ACHIEVEMENT_FLAG_BYTE5_CHALLENGER_RANK3 
                    sta      achievements + 4 
                    ldb      #A_BONUS_RANK3 
                    jsr      displayAchievement 
Bonus3CheckDone 
checkBonusRank2 
                    lda      achievements + 4 
                    bita     #ACHIEVEMENT_FLAG_BYTE5_CHALLENGER_RANK2 
                    bne      Bonus2CheckDone 
                    ldb      perfectBonus 
                    cmpb     #5                           ; 16000 
                    blo      BonusCheckDone               ; no achievement 
displayBonusAchievementRank2 
                    lda      achievements + 4 
                    ora      #ACHIEVEMENT_FLAG_BYTE5_CHALLENGER_RANK2 
                    sta      achievements + 4 
                    ldb      #A_BONUS_RANK2 
                    jsr      displayAchievement 
Bonus2CheckDone 
checkBonusRank1 
                    lda      achievements + 4 
                    bita     #ACHIEVEMENT_FLAG_BYTE5_CHALLENGER_RANK1 
                    bne      Bonus1CheckDone 
                    ldb      perfectBonus 
                    cmpb     #9                           ; 256000 
                    blo      BonusCheckDone               ; no achievement 
displayBonusAchievementRank1 
                    lda      achievements + 4 
                    ora      #ACHIEVEMENT_FLAG_BYTE5_CHALLENGER_RANK1 
                    sta      achievements + 4 
                    ldb      #A_BONUS_RANK1 
                    jsr      displayAchievement 
Bonus1CheckDone 
BonusCheckDone 
REPLACE_1_2_backFromChallengeAchievementTest_varFrom1_1 
                    ldx      #0                           ; backFromChallengeAchievementTest 
                    jmp      jmpBank1X 

;.............................................................................
;.............................................................................
;.............................................................................
leaveDodgerAchievementTest                                ;#isfunction  
                    lda      flashAvailable 
                    anda     #SAVEGAME_IS_ACTIVE_BIT      ; game available 
                    lbne     dodgerAchievementGoBack 
; no achievement if killed!
                    tst      dodgerGotKilled 
                    bne      drunkenCheckDone 
checkFalcon 
                    lda      achievements + 5 
                    bita     #ACHIEVEMENT_FLAG_BYTE6_MINESTORM_FALCON 
                    bne      checkDrunken 
                    lda      dodgeResult 
                    cmpa     #4                           ; for is falcon 
                    bne      falconCheckDone              ; no achievement 
                    lda      achievements + 5 
                    ora      #ACHIEVEMENT_FLAG_BYTE6_MINESTORM_FALCON 
                    sta      achievements + 5 
                    ldb      #A_FALCON 
                    jsr      displayAchievement 
falconCheckDone 
checkDrunken 
                    lda      achievements + 5 
                    bita     #ACHIEVEMENT_FLAG_BYTE6_MINESTORM_DRUNKEN 
                    bne      drunkenCheckDone 
                    lda      drunkTimer 
                    beq      drunkenCheckDone             ; no achievement 
                    lda      achievements + 5 
                    ora      #ACHIEVEMENT_FLAG_BYTE6_MINESTORM_DRUNKEN 
                    sta      achievements + 5 
                    ldb      #A_DRUNKEN 
                    jsr      displayAchievement 
dodgerAchievementGoBack 
drunkenCheckDone 
REPLACE_1_2_dodgerAchievementBack_varFrom1_1 
                    ldx      #0                           ; dodgerAchievementBack 
                    jmp      jmpBank1X 

;.............................................................................
;.............................................................................
;.............................................................................
enterShopAchievementTest                                  ;#isfunction  
;
;ACHIEVEMENT_FLAG_BYTE2_COLLECTOR_RANK5 = %00000001 ; checked at the start of each shop
;ACHIEVEMENT_FLAG_BYTE2_COLLECTOR_RANK4 = %00000010
;ACHIEVEMENT_FLAG_BYTE2_COLLECTOR_RANK3 = %00000100
;ACHIEVEMENT_FLAG_BYTE2_COLLECTOR_RANK2 = %00001000
;ACHIEVEMENT_FLAG_BYTE2_COLLECTOR_RANK1 = %00010000
;
;- achievements Money collector Rank 5-> 5000 reward: + 100 credits startup
;- achievements Money collector Rank 4-> 10000 reward: + 200 credits startup
;- achievements Money collector Rank 3-> 25000 reward: + 300 credits startup
;- achievements Money collector Rank 2-> 50000 reward: + 500 credits startup
;- bug money -> discover BUG money roll over!, Money collector Rank 1 reward: + 750 credits on startup
                    lda      flashAvailable 
                    anda     #SAVEGAME_IS_ACTIVE_BIT      ; game available 
                    lbne     shopAchievementsBack 
checkMoney5 
                    lda      achievements + 1 
                    bita     #ACHIEVEMENT_FLAG_BYTE2_COLLECTOR_RANK5 
                    bne      checkMoney4 
                    ldd      playerCashW 
                    cmpd     #5000 
                    blo      moneyCheckDone               ; no achievement 
displayMoneyAchievementRank5 
                    lda      achievements + 1 
                    ora      #ACHIEVEMENT_FLAG_BYTE2_COLLECTOR_RANK5 
                    sta      achievements + 1 
                    ldb      #A_MONEY_RANK5 
                    jsr      displayAchievement 
checkMoney4 
                    lda      achievements + 1 
                    bita     #ACHIEVEMENT_FLAG_BYTE2_COLLECTOR_RANK4 
                    bne      checkMoney3 
                    ldd      playerCashW 
                    cmpd     #10000 
                    blo      moneyCheckDone               ; no achievement 
displayMoneyAchievementRank4 
                    lda      achievements + 1 
                    ora      #ACHIEVEMENT_FLAG_BYTE2_COLLECTOR_RANK4 
                    sta      achievements + 1 
                    ldb      #A_MONEY_RANK4 
                    jsr      displayAchievement 
checkMoney3 
                    lda      achievements + 1 
                    bita     #ACHIEVEMENT_FLAG_BYTE2_COLLECTOR_RANK3 
                    bne      checkMoney2 
                    ldd      playerCashW 
                    cmpd     #25000 
                    blo      moneyCheckDone               ; no achievement 
displayMoneyAchievementRank3 
                    lda      achievements + 1 
                    ora      #ACHIEVEMENT_FLAG_BYTE2_COLLECTOR_RANK3 
                    sta      achievements + 1 
                    ldb      #A_MONEY_RANK3 
                    jsr      displayAchievement 
checkMoney2 
                    lda      achievements + 1 
                    bita     #ACHIEVEMENT_FLAG_BYTE2_COLLECTOR_RANK2 
                    bne      checkMoney1 
                    ldd      playerCashW 
                    cmpd     #50000 
                    blo      moneyCheckDone               ; no achievement 
displayMoneyAchievementRank2 
                    lda      achievements + 1 
                    ora      #ACHIEVEMENT_FLAG_BYTE2_COLLECTOR_RANK2 
                    sta      achievements + 1 
                    ldb      #A_MONEY_RANK2 
                    jsr      displayAchievement 
; checking rollover
; because of the firework, no in game check!
moneyCheckDone 
checkMoney1 
                    lda      achievements + 1 
                    bita     #ACHIEVEMENT_FLAG_BYTE2_COLLECTOR_RANK1 
                    bne      moneyCheckDone2 
                    lda      diverseFlags 
                    bita     #BIT_FLAG_CASH_ROLLOVER 
                    beq      moneyCheckDone2 
displayMoneyAchievementRank1 
                    lda      achievements + 1 
                    ora      #ACHIEVEMENT_FLAG_BYTE2_COLLECTOR_RANK1 
                    sta      achievements + 1 
                    ldb      #A_MONEY_RANK1 
                    jsr      displayAchievement 
moneyCheckDone2 
                    lda      diverseFlags 
                    anda     #$ff - BIT_FLAG_CASH_ROLLOVER 
                    sta      diverseFlags 
; jmp backFromenterShopAchievementTest
shopAchievementsBack 
REPLACE_1_2_backFromenterShopAchievementTest_varFromIRQ1_2 
                    ldx      #0                           ; backFromenterShopAchievementTest 
                    jmp      jmpBankIRQ1Shift 

;.............................................................................
;.............................................................................
;.............................................................................
exitshopAchievementTest                                   ;#isfunction  
                    lda      flashAvailable 
                    anda     #SAVEGAME_IS_ACTIVE_BIT      ; game available 
                    bne      livesIs9Done 
;ACHIEVEMENT_FLAG_BYTE2_GREEDY = %00100000 ; check when collected / bought
;ACHIEVEMENT_FLAG_BYTE2_9LIVES = %01000000 ; checked when a live is bought
;- achievement when speed, rate, bullet are all full GREEDY -> start with 2 shot!
;- reach 9 lives: enable bonus drop "LIVE" 
greedyTest 
                    lda      achievements + 1 
                    bita     #ACHIEVEMENT_FLAG_BYTE2_GREEDY 
                    bne      greedyDone 
                    lda      playerMaxShotInAir 
                    cmpa     #MAX_PLAYERSHOT_OBJECTS 
                    bne      greedyDone 
                    ldd      playerShotSpeed 
                    cmpd     #MAX_SHOT_SPEED 
                    blt      greedyDone 
                    ldd      playerSpeed 
                    cmpd     #MAX_PLAYER_SPEED 
                    blt      greedyDone 
displayGreedyAchievement 
                    lda      achievements + 1 
                    ora      #ACHIEVEMENT_FLAG_BYTE2_GREEDY 
                    sta      achievements + 1 
                    ldb      #A_GREEDY 
                    jsr      displayAchievement 
greedyDone 
livesIs9Test 
                    lda      achievements + 1 
                    bita     #ACHIEVEMENT_FLAG_BYTE2_9LIVES 
                    bne      livesIs9Done 
                    lda      playerLives 
                    cmpa     # '9'
                    bne      livesIs9Done 
displayLive9Achievement 
                    lda      achievements + 1 
                    ora      #ACHIEVEMENT_FLAG_BYTE2_9LIVES 
                    sta      achievements + 1 
                    ldb      #A_9LIVES 
                    jsr      displayAchievement 
livesIs9Done 
REPLACE_1_2_backFromexitshopAchievementTest_varFromIRQ1_2 
                    ldx      #0                           ; backFromexitshopAchievementTest 
                    jmp      jmpBankIRQ1Shift 

levelDoneAchievementTest                                  ;#isfunction  
                    lda      flashAvailable 
                    anda     #SAVEGAME_IS_ACTIVE_BIT      ; game available 
                    lbne     aLossDone 
                    ldb      isDemoMode 
                    lbne     aLossDone 
;ACHIEVEMENT_FLAG_BYTE3_TRIPPLE = %00100000 ; checked on EXTRA
;ACHIEVEMENT_FLAG_BYTE3_QUADRO  = %01000000
;ACHIEVEMENT_FLAG_BYTE3_LASER   = %10000000
;- weapon get tripple shot:     Weapon trippler -> unlock buy tripple weapon in shop
;- weapon get quad shot:     Weapon Quadrupel -> unlock buy quad weapon in shop
;- weapon get blaster shot:     Weapon Blaster -> unlock buy blaster weapon in shop
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; do shop waeapon "allows" here
;; instead of in the bonus cathc routine
;; otherwise by dying these two
;; can "drif" appart!
                    lda      playerNumberOfBulletsPerShot 
                    ldb      #0 
                    cmpa     #6 
                    bne      notLaserAllow_1 
                    ldb      #%00000111 
                    bra      storeAllowed_1 

notLaserAllow_1 
                    cmpa     #5 
                    bne      notBlasterAllow_1 
                    ldb      #%00000011 
                    bra      storeAllowed_1 

notBlasterAllow_1 
                    cmpa     #4 
                    bne      notFourAllow_1 
                    ldb      #%00000001 
                    bra      storeAllowed_1 

notFourAllow_1 
storeAllowed_1 
                    orb      shopAllowFlags 
                    stb      shopAllowFlags 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                    lda      achievements + 2 
                    bita     #ACHIEVEMENT_FLAG_BYTE3_TRIPPLE 
                    bne      aTrippleDone 
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #3 
                    bne      aTrippleDone 
displayTrippleAchievement 
                    lda      achievements + 2 
                    ora      #ACHIEVEMENT_FLAG_BYTE3_TRIPPLE 
                    sta      achievements + 2 
                    ldb      #A_TRIPPLE 
                    bsr      displayAchievement 
aTrippleDone 
                    lda      achievements + 2 
                    bita     #ACHIEVEMENT_FLAG_BYTE3_QUADRO 
                    bne      aQuadroDone 
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #4 
                    bne      aQuadroDone 
displayQuadroAchievement 
                    lda      achievements + 2 
                    ora      #ACHIEVEMENT_FLAG_BYTE3_QUADRO 
                    sta      achievements + 2 
                    ldb      #A_QUADRO 
                    bsr      displayAchievement 
aQuadroDone 
                    lda      achievements + 2 
                    bita     #ACHIEVEMENT_FLAG_BYTE3_LASER 
                    bne      aLaserDone 
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #6 
                    bne      aLaserDone 
displayLserAchievement 
                    lda      achievements + 2 
                    ora      #ACHIEVEMENT_FLAG_BYTE3_LASER 
                    sta      achievements + 2 
                    ldb      #A_LASER 
                    bsr      displayAchievement 
aLaserDone 
;ACHIEVEMENT_FLAG_BYTE5_BIGGEST_LOSS     = %10000000 ; check on shot on collect
;- weapon drops from laser to 1 shot: Biggest loss! -> unlock buy weapon immunity 1 in shop for 100 
                    lda      achievements + 4 
                    bita     #ACHIEVEMENT_FLAG_BYTE5_BIGGEST_LOSS 
                    bne      aLossDone 
                    lda      inGameSecrets 
                    anda     #BIGGEST_LOSS_FLAG 
                    beq      aLossDone 
displayLossAchievement 
                    lda      achievements + 4 
                    ora      #ACHIEVEMENT_FLAG_BYTE5_BIGGEST_LOSS 
                    sta      achievements + 4 
                    ldb      #A_LOSS 
                    bsr      displayAchievement 
aLossDone 
REPLACE_1_2_backFromlevelDoneAchievementTest_varFrom1_1 
                    ldx      #0                           ; backFromlevelDoneAchievementTest 
                    jmp      jmpBank1X 

;.............................................................................
; in b #No of achievement 
displayAchievement                                        ;#isfunction  
                    ldy      #achievmentMessages 
                    leay     b,y                          ;in u pointer to current achievement string (from bank 2) 
                    PLAY_ACHIEVEMENT_JINGLE  
                    jmp      printAchievement 

;.............................................................................
optCalibText 
                    db       "STRAIGHTEN THIS TOO!",$80
printCalibrationOptionText 
                    clr      currentPrintedOption 
; ------ print Menu Start
                    ldu      #optCalibText 
                    lda      gameScale 
                    sta      <VIA_t1_cnt_lo 
                    ldd      #$12c8 
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    lda      #16 
                    sta      <VIA_t1_cnt_lo 
                    ldy      #Alphabet-64                 ; font starts at 32, *2 because of 16 bit pointer 
                    clra     
                    MY_MOVE_TO_B_END  
nextLetter2_7_c 
                    ldb      ,u+ 
                    bmi      donePrintVectorString3_7_c 
                    lslb                                  ; must be d, because otherwise it could be "negative" 
                    ldx      d,y 
                    Draw_VLp_lessGap7  
                    bra      nextLetter2_7_c 

donePrintVectorString3_7_c 
                    _ZERO_VECTOR_BEAM  
                    rts      

;.............................................................................
doReset 
REPLACE_1_2_doReset_varFromIRQ0_11 
                    ldx      #0                           ; doReset 
                    jmp      jmpBankIRQ0Shift 

;.............................................................................
doSecrets 
                    lda      #0 
                    pshs     a 
secretLoop 
                    lda      achievements+4 
; V1.07 corrected, was after beq
                    anda     #%00000111 
                    beq      noSecretsYet 
                    cmpa     ,s 
                    beq      secretLoopDone 
                    lda      ,s 
                    lsla     
                    ldx      #secretMessagePointer2 
                    ldx      a,x 
                    jsr      jsrBank0_fromBank2_Shift 
                    inc      ,s 
                    bra      secretLoop 

secretLoopDone 
                    puls     a 
                    jmp      optionsLoop 

noSecretsYet 
REPLACE_1_2_showSecretMessageNone_varFromIRQ0_11 
                    ldx      #0 
                    jsr      jsrBank0_fromBank2_Shift 
                    bra      secretLoopDone 

;.............................................................................
secretMessagePointer2 
REPLACE_0_2_showSecretMessage1_varFromIRQ0_11 
                    dw       0 
REPLACE_0_2_showSecretMessage2_varFromIRQ0_11 
                    dw       0 
REPLACE_0_2_showSecretMessage3_varFromIRQ0_11 
                    dw       0 
REPLACE_0_2_showSecretMessage4_varFromIRQ0_11 
                    dw       0 
REPLACE_0_2_showSecretMessage5_varFromIRQ0_11 
                    dw       0 
REPLACE_0_2_showSecretMessage6_varFromIRQ0_11 
                    dw       0 
REPLACE_0_2_showSecretMessage7_varFromIRQ0_11 
                    dw       0 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
printOneRank 
                    ldu      #rankPointer 
                    lda      officerRankTmp 
                    lsla     
                    ldu      a,u 
                    ldd      #$10a0 
                    jmp      syncPrintStrd 

                    include  "pause.asm"
                    include  "printStringSync2.asm"
;***************************************************************************
                    include  "addScore.asm"
                    include  "boss1Code.asm"
                    include  "boss2Code.asm"
                    include  "boss3Code.asm"
                    include  "boss4Code.asm"
;***************************************************************************
                    include  "smartlist/drawListScale7Normal.asm"
                    include  "smartlist/drawListScale50Normal.asm"
                    include  "enemies/boss1.asm"
                    include  "enemies/boss2.asm"
                    include  "enemies/boss3.asm"
                    include  "enemies/boss4.asm"
                    include  "objectBonus.asm"
                    include  "bonus.asm"
                    include  "vectorString.asm"
                    include  "objectPlayerShots.asm"
                    include  "fireworks.asm"
                    include  "saveScoopies.asm"           ; uses a macro below, therefor we must laod it here
waitButtonRelease 
                    JSR      getButtonState               ; get button status 
                    anda     #%1111                       ; button 4 unpause 
                    cmpa     #%1111 
                    bne      waitButtonRelease 
                    rts      

MoveToD 
                    STA      <VIA_port_a                  ;Store Y in D/A register 
                    LDA      #$CE                         ;Blank low, zero high? 
                    STA      <VIA_cntl                    ; 
                    CLRA     
                    STA      <VIA_port_b                  ;Enable mux 
                    WAIT6    
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    inca     
                    sta      <VIA_port_b                  ;Disable mux 
                    deca     
 else  
                    inc      <VIA_port_b                  ;Enable mux 
 endif  
                    STB      <VIA_port_a                  ;Store X in D/A register 
                    STA      <VIA_t1_cnt_hi               ;enable timer 
                    MY_MOVE_TO_A_END  
                    rts      

wheelcircleData 
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
                    include  "wheel.asm"
