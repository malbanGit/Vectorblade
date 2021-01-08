; in order to make rrom for the VecFever saving mechanism
; i moved the "wheel of fortune" from bank 1 to bank 2 (area above $b000)
; some calling changes had to be made..
;#############################################################################
;#############################################################################
;#############################################################################
; BANK 2
                    bss      
                    org      starobject_list 
DELAY_RESET         EQU      5 
extraStage          ds       1                            ;9 
stackSave           ds       2                            ;11 
spinSpeed           ds       2                            ;18 ; "add" per round to angle, is 16 bit, each round the adder is added and after usage the hi byte set to 0 
spinSpeedAdder      ds       2                            ;16 
stackSafe           ds       2                            ;23 
rewardStringSelected  ds     2                            ;38 
save1               ds       2                            ;28 
save2               ds       2                            ;30 
save3               ds       2                            ;32 
angle               ds       2                            ;2 
angleUse            ds       2                            ;4 
wheelIntoStage      ds       1                            ;20 
wheelIntroSize      ds       1                            ;21 
spinTemp            ds       1                            ;24 
wheelStage          ds       1                            ;25 
ySpinOffset         ds       1                            ;26 
delayCounter        ds       1                            ;13 
; with SAVING enabled we only have 26 space!
diskLineCount       ds       2                            ;6 
imageStart          ds       2                            ;8 
lastLatch           ds       1                            ;33 
yLatch              ds       1                            ;34 
isPressed           ds       1                            ;35 
nextXCoord          ds       1                            ;12 
linePrinting        ds       1                            ;19 
cheeseCounter       ds       1                            ;14 
wheelStarted        ds       1                            ;36 
wheelTmp            ds       2                            ;40 
angleTmp            ds       2                            ;42 
                    code     
MAX_STEP_WIDTH      =        8 
STEP_WIDTH          =        2 
STEP_WIDTH1         =        1 
INC_ANGLE           =        2 
;........
bandit2 
 if  RECORD_GAME_DATA = 1 
                    RANDOM_A  
                    anda     #%00000111 
                    lsla     
                    lsla     
                    ldu      #bandit_Strings_normalMode 
                    tst      difficulty 
                    bpl      isNormalMode 
                    ldu      #bandit_Strings_hardcoreMode 
isNormalMode 
                    leau     a,u 
                    leau     2,u 
                    ldu      ,u 
                    stu      rewardStringSelected 
                    lda      #3 
                    sta      extraStage 
                    ldd      Vec_Str_Ptr 
                    std      save1 
                    ldd      Vec_Text_HW 
                    std      save2 
                    ldd      backJump 
                    std      save3 
                    bra      extraLoop 

 endif  
; IRQ_TO_0_SHIFT
                    ldd      Vec_Str_Ptr 
                    std      save1 
                    ldd      Vec_Text_HW 
                    std      save2 
                    ldd      backJump 
                    std      save3 
                    clr      extraStage 
                    clr      isPressed 
                    clr      lastLatch 
                    clr      wheelStarted 
SPINTIME            =        50 
                    lda      #SPINTIME 
                    sta      spinTemp 
                    clr      tmp1 
                    ldd      #$700                        ; speed of 5,0 
                    std      spinSpeedAdder 
                    clr      spinSpeed 
                    clr      spinSpeed+1 
                    ldd      #8*STEP_WIDTH*2              ; 8 font lines (actually only 7 - this is a buffer) * step with * 2 (because of 2 coordinates) 
                    std      angle 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; EXTRA
extraLoop 
                    jsr      my_wait_recal                ; Wait_Recal ; Vectrex BIOS recalibration 
 if  VECFEVER = 1 
REPLACE_1_2_doymsound100_varFromIRQ0_201 
                    ldx      #0                           ; doymsound100 
                    jsr      jsrBank0_fromBank2_T1 
 else  
REPLACE_1_2_doymsound100_varFromIRQ1_201 
                    ldx      #0                           ; doymsound100 
                    jsr      jsrBank1_fromBank2_T1 
 endif  
                    jsr      Intensity_5F 
                    lda      #8 
                    sta      cheeseCounter 
; not working!
                    ldd      spinSpeedAdder 
                    addd     spinSpeed 
                    std      spinSpeed 
                    ldb      spinSpeed 
                    clr      spinSpeed 
                    lslb                                  ; times two - two coordinates 
                    sex      
                    addd     angle 
                    cmpd     #256*2 + 8*MAX_STEP_WIDTH*2 
                    blo      d_is_ok 
                    subd     #256*2 
d_is_ok 
                    std      angle 
                    std      angleUse 
stageSelect 
                    lda      extraStage 
                    cmpa     #1 
                    lbeq     spinThatWheel 
                    cmpa     #2 
                    lbeq     doWheel 
                    cmpa     #3 
                    beq      displayWinning 
                    cmpa     #4 
                    beq      extraLoop 
; 0 display extra "level"
displayExtra 
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
                    cmpa     #120 
                    bhi      extraLoopDone 
                    jsr      drawExtra 
                    bra      extraLoop 

extraLoopDone 
                    inc      extraStage 
                    clr      wheelStage 
                    bra      extraLoop 

wheelResult 
; ***********************************************************************
                    inc      extraStage 
                    bra      extraLoop 

displayWinning 
                    lda      gameScale 
                    sta      VIA_t1_cnt_lo 
                    ldu      rewardStringSelected 
                    ldd      #$f850 
                    std      Vec_Text_HW 
                    ldd      #$40d0 
                    jsr      syncPrintStrd                ;Print_Str_d 
                    JSR      getButtonState               ; get button status 
                    anda     #%1111                       ; button 4 unpause 
                    cmpa     #%1111 
                    lbeq     noButtonPressedSpin 
                    jsr      waitButtonRelease 
REWARD_LASER        =        0*2 
REWARD_MONEY        =        1*2 
REWARD_SECRET       =        2*2 
REWARD_EQUIP        =        3*2 
REWARD_LIVES        =        4*2 
REWARD_POWER        =        5*2 
REWARD_LOCK         =        6*2 
REWARD_IMMUNE       =        7*2 
REWARD_SCORE        =        8*2 
REWARD_TIME         =        9*2 
REWARD_BOMBS        =        10*2 
                    ldu      rewardStringSelected 
                    lda      7,u                          ; load reward number as in "defines" 
REPLACE_1_2_rewardTable_varFromIRQ0_12 
                    ldu      #0                           ;rewardTable 
                    leau     a,u 
REPLACE_1_2_doWheelReward_varFromIRQ0_1 
                    ldx      #0                           ;doWheelReward 
                    jmp      jmpBankIRQ0Shift 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
goBackBandint 
                    ldd      save1 
                    std      Vec_Str_Ptr 
                    ldd      save2 
                    std      Vec_Text_HW 
                    ldd      save3 
                    std      backJump 
REPLACE_1_2_initStars_varFrom1_201 
                    ldx      #0                           ; initStars 
                    jsr      jsrBank1X 
REPLACE_1_2_spawnStar_varFrom1_202 
                    ldx      #0                           ; spawnStar 
                    jsr      jsrBank1X 
                    lds      bulletSpawnAt 
                    clr      bulletSpawnAt 
                    clr      bulletSpawnAt+1 
REPLACE_1_2_backFromBandit_varFrom0_3 
                    ldx      #0                           ; backFromBandit 
                    jmp      jmpBankIRQ2X 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; SPIN
spinThatWheel 
                    LDd      #$98*256 + %10000001 
                    STa      <VIA_aux_cntl                ;Shift reg mode = 110 (shift out under system clock), T1 PB7 disabled, one shot mode 
                    STb      <VIA_port_b                  ;[4]disable RAMP, disable mux 
                    lda      wheelStage 
                    beq      doSpin 
                    cmpa     #1 
                    beq      doSpinThe 
                    cmpa     #2 
                    beq      doSpinTheWheel 
                    cmpa     #3 
                    beq      doPressButtons 
initWheel 
                    clr      wheelStage                   ; new, started, stopping -> win 
                    inc      extraStage 
                    jmp      stageSelect 

doSpin 
                    dec      spinTemp 
                    lbeq     nextSpinner 
                    ldx      #spinString 
                    lda      #$5a 
                    sta      ySpinOffset 
                    jsr      displayCenterRotatedString 
                    jmp      extraLoop 

doSpinThe 
                    lda      #$7f 
                    sta      <VIA_t1_cnt_lo 
                    ldd      #$fa78 
                    std      Vec_Text_HW 
                    ldd      #$60d0 
                    ldu      #spinString 
                    jsr      syncPrintStrd                ;Print_Str_d 
                    dec      spinTemp 
                    lbeq     nextSpinner 
                    ldx      #theString 
                    lda      #$40 
                    sta      ySpinOffset 
                    jsr      displayCenterRotatedString 
                    jmp      extraLoop 

doSpinTheWheel 
                    lda      #$7f 
                    sta      <VIA_t1_cnt_lo 
                    ldd      #$fa78 
                    std      Vec_Text_HW 
                    ldd      #$60d0 
                    ldu      #spinString 
                    jsr      syncPrintStrd                ;Print_Str_d 
                    ldb      #$CC                         ; zero the integrators 
                    stb      <VIA_cntl                    ; store zeroing values to cntl 
                    ldd      #$40c8 
                    ldu      #theString 
                    jsr      syncPrintStrd                ;Print_Str_d 
                    dec      spinTemp 
                    beq      nextSpinner 
                    ldx      #wheelString 
                    lda      #$20 
                    sta      ySpinOffset 
                    jsr      displayCenterRotatedString 
                    jmp      extraLoop 

doPressButtons 
                    lda      #$7f 
                    sta      <VIA_t1_cnt_lo 
                    ldd      #$fa78 
                    std      Vec_Text_HW 
                    ldd      #$60d0 
                    ldu      #spinString 
                    jsr      syncPrintStrd                ;Print_Str_d 
                    ldb      #$CC                         ; zero the integrators 
                    stb      <VIA_cntl                    ; store zeroing values to cntl 
                    ldd      #$40c8 
                    ldu      #theString 
                    jsr      syncPrintStrd                ;Print_Str_d 
                    ldb      #$CC                         ; zero the integrators 
                    stb      <VIA_cntl                    ; store zeroing values to cntl 
                    ldd      #$20c8 
                    ldu      #wheelString 
                    jsr      syncPrintStrd                ;Print_Str_d 
                    ldd      #$e060 
                    std      Vec_Text_HW 
                    ldb      #$CC                         ; zero the integrators 
                    stb      <VIA_cntl                    ; store zeroing values to cntl 
                    ldd      #$e0a0 
                    ldu      #wheelMessage1 
                    jsr      syncPrintStrd 
                    ldb      #$CC                         ; zero the integrators 
                    stb      <VIA_cntl                    ; store zeroing values to cntl 
                    ldd      #$d0c0 
                    ldu      #wheelMessage2 
                    jsr      syncPrintStrd 
                    JSR      getButtonState               ; get button status 
                    anda     #%1111                       ; button 4 unpause 
                    cmpa     #%1111 
                    beq      noButtonPressedSpin 
                    jsr      waitButtonRelease 
                    bra      initWheelSpin 

noButtonPressedSpin 
                    jmp      extraLoop 

nextSpinner 
                    lda      #SPINTIME 
                    sta      spinTemp 
                    inc      wheelStage 
                    jmp      spinThatWheel 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; wheel
spinString 
                    db       " SPIN  ", $80
theString 
                    db       "  THE  ", $80
wheelString 
                    db       " WHEEL ", $80
wheelMessage1 
                    db       "BUTTON TO START", $80
wheelMessage2 
                    db       "AND STOP!", $80
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
initWheelSpin 
                    ldd      #$00                         ; speed of 5,0 
                    std      spinSpeedAdder 
                    sta      yLatch 
                    ldd      #8*STEP_WIDTH*2              ; 8 font lines (actually only 7 - this is a buffer) * step with * 2 (because of 2 coordinates) 
                    std      angle 
                    inc      extraStage 
                    jmp      extraLoop 

doWheel 
;isPressed
                    JSR      getButtonState               ; get button status 
                    anda     #%1111                       ; button 4 unpause 
                    cmpa     #%1111 
                    beq      noButtonPressedWheel 
                    lda      #1 
                    sta      isPressed 
                    bra      contWheel 

noButtonPressedWheel 
                    lda      isPressed 
                    beq      contWheel 
                    clr      isPressed 
                    lda      wheelStarted 
                    beq      doStartWheel 
                    cmpa     #1                           ; wheel running 
                    lda      #2                           ; stopped 
                    sta      wheelStarted 
                    bra      contWheel 

doStartWheel 
                    lda      #1                           ; started 
                    sta      wheelStarted 
                    ldd      #$500                        ; speed of 5,0 
                    std      spinSpeedAdder 
contWheel 
                    lda      wheelStarted 
                    cmpa     #2 
                    bne      noBreaks 
                    ldd      spinSpeedAdder 
                    lbeq     wheelResult 
; only descellerate when "latch" is moving
; -> insures halt on a string
                    lda      lastLatch 
                    beq      noBreaks 
                    ldd      spinSpeedAdder 
                    subd     #$10 
                    bpl      storeBreaks 
                    ldd      #0 
storeBreaks 
                    std      spinSpeedAdder 
noBreaks 
                    lda      lastLatch 
                    beq      noLastLatch 
                    lda      yLatch 
                    bne      noLastLatch 
; when the latch is hit!
 if  VECFEVER = 1 
REPLACE_1_2_noiseOnlyDeAccelData_varFromIRQ0_201 
                    ldx      #0                           ;noiseOnlyDeAccelData 
                    stx      sfx_pointer_2 
 else  
REPLACE_1_2_noiseOnlyDeAccelData_varFromIRQ1_201 
                    ldx      #0                           ;noiseOnlyDeAccelData 
                    stx      sfx_pointer_2 
 endif  
noLastLatch 
                    lda      #$90 
                    sta      <VIA_t1_cnt_lo               ; length of 7,5 letters 
                    ldd      #$7f 
                    jsr      MoveToD 
                    ldb      #$80                         ; 3 
                    stb      <VIA_aux_cntl 
                    lda      yLatch 
                    ldb      #$f0 
                    sta      lastLatch 
                    jsr      drawLineD 
                    clr      yLatch 
                    ldb      #$CC                         ; zero the integrators 
                    stb      <VIA_cntl                    ; store zeroing values to cntl 
nextCheese 
                    ldx      #bandit_Strings_normalMode 
                    tst      difficulty 
                    bpl      noHardcore 
                    ldx      #bandit_Strings_hardcoreMode 
noHardcore 
                    lda      cheeseCounter 
                    deca     
                    lsla     
                    lsla     
                    leax     a,x 
                    stx      wheelTmp 
                    ldx      ,x 
;  change intensity in dependence how close to the "needle" we are ( 3 o'clock)
                    ldd      angleUse                     ; can be up to $220 
                    cmpd     #$200 
                    blo      notToHigh 
                    subd     #$200 
notToHigh 
                    MY_LSR_D                              ; 0-255 
                    MY_LSR_D                              ; 0-127 
                    cmpb     #32 
                    bhi      notOk 
                    negb     
                    addb     #64                          ; point "dark" is 9 o'clock 
notOk 
                    negb     
                    addb     #96                          ; point zero is 3 o'clock 
                    bmi      notNeg 
                    negb     
notNeg 
                    addb     #$4f 
                    tfr      b,a 
                    _INTENSITY_A  
                    bsr      displayCheese 
                    ldd      angleUse 
                    cmpd     #$200 
                    blo      allOk 
                    subd     #$200 
allOk 
                    subd     #96-25 
                    bmi      noLatch 
                    cmpd     #10 
                    bhi      noLatch 
                    stb      yLatch 
                    ldx      wheelTmp 
                    ldx      2,x 
                    stx      rewardStringSelected 
noLatch 
                    ldd      angleUse 
                    addd     #32*1*2 
                    cmpd     #256*2 + 8*STEP_WIDTH*2 
                    blo      angleOk 
                    subd     #256*2 
angleOk 
                    std      angleUse 
                    dec      cheeseCounter 
                    lbne      nextCheese 
                    jmp      extraLoop 

                    direct   $d0 
FONT_LENGTH_BIOS    EQU      80 
FONT_START_BIOS     EQU      Char_Table -$20              ; // space is 1 
FONT_END_BIOS       EQU      Char_Table_End -$20 
; ***********************************************************************
;
; in x pointer to string
; angle in "angle"
; fixed string length of "7"
; expects zeroed on entry
; expects IRQ set by T1
; leaves with VIA_aux set to $18 ("normal" is $98)
; y used for circle data
; u used for chartable
displayCheese 
;;;;;;;;;;;;;;
; these can be done "once" per all cheeses
;                    IRQ_TO_0_T1  
                    LDU      #FONT_START_BIOS             ;Point to start of chargen bitmaps 
                    LDd      #$18*256 + %10000001 
                    STa      <VIA_aux_cntl                ;Shift reg mode = 110 (shift out under system clock), T1 PB7 disabled, one shot mode 
                    STb      <VIA_port_b                  ;[4]disable RAMP, disable mux 
;;;;;;;;;;;;;;
                    ldy      #wheelcircleData 
                    ldd      angleUse 
                    subd     #6 
                    anda     #1                           ; modulo 256 
                    std      angleTmp 
                    leay     d,y 
;                    leay     -6,y 
nextCheeseStringLine 
                    LDD      #$CE80                       ;Blank low, zero high? 
                    sta      <VIA_cntl                    ; store zeroing values to cntl 
                    lda      ,y                           ; y coordinate 
                    sta      <VIA_port_a                  ;Y To D/A output 
                    STB      <VIA_port_b                  ;ramp off set mux to channel 0, Enable mux (set y) 
                    incb                                  ; B = $81 
                    STB      <VIA_port_b                  ;Disable RAMP, set mux to channel 0, disable mux 
                    lda      1,y 
                    STa      <VIA_port_a                  ;Send it to the D/A (X) 
                    LDA      #$01                         ;both to ORB, both ENABLE RAMP, mux off 
                    STA      <VIA_port_b                  ;[4]enable RAMP, disable mux 
                    nop      4 
                    bra      startShift2 

nextChar2 
                    lda      a,u 
                    STA      <VIA_shift_reg               ;[+4]rasterout of char bitmap "row" thru shift out in shift register 
startShift2 
                    lda      ,x+                          ;[6] 
                    bpl      nextChar2 
                    ldb      #$CC                         ; zero the integrators 
                    stb      <VIA_cntl                    ; store zeroing values to cntl 
;                    leay     -STEP_WIDTH1*2,y               ;[3] 
                    ldd      angleTmp 
                    addd     #-STEP_WIDTH1*2 
                    anda     #1 
                    std      angleTmp 
                    ldy      #wheelcircleData 
                    leay     d,y 
                    cmpu     #FONT_END_BIOS 
                    beq      cheeseStringDone 
                    leax     -7,x                         ; start of String 
                    LEAU     FONT_LENGTH_BIOS, u          ;Point to next "row" of font bitmap 
                    lda      #%10000010 
                    clr      <VIA_port_a 
                    sta      <VIA_port_b 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    inca     
                    sta      <VIA_port_b 
 else  
                    inc      <VIA_port_b 
 endif  
                    BRA      nextCheeseStringLine 

cheeseStringDone 
                    ldd      #%10000001 
                    STb      <VIA_port_b                  ;[4]disable RAMP, disable mux 
                    sta      <VIA_shift_reg               ; 0 to shift 
;                    IRQ_TO_0_SHIFT  
                    ldb      #$80                         ; 3 
                    stb      <VIA_aux_cntl 
                    lda      #7*18+9 
                    sta      <VIA_t1_cnt_lo               ; length of 7,5 letters 
                    ldy      #wheelcircleData 
                    ldd      angleUse 
                    addd     #1*STEP_WIDTH*2 
                    anda     #1 
                    pshs     d 
                    ldd      d,y 
                    pshs     d 
                    bsr      drawLineDLater 
                    ldd      2,s                          ; angle of start coordinate of short draw 
                    addd     # -(STEP_WIDTH*7+2) *2 
                    anda     #1 
                    leay     d,y                          ; y pointing to end coordinate of short draw 
                    ldd      ,s                           ; start coordinate of short draw 
                    leas     4,s 
                                                          ; leay -(STEP_WIDTH*7+1) *2,y 
                    nega     
                    negb     
                    adda     ,y 
                    addb     1,y 
                    bsr      drawLineD 
                    ldb      #$CC                         ; zero the integrators 
                    stb      <VIA_cntl                    ; store zeroing values to cntl 
                    ldy      #wheelcircleData 
                    ldd      angleUse 
                    addd     #-(STEP_WIDTH*7+1) *2 
                    anda     #1 
;                    leay     d,y 
;                    leay     -(STEP_WIDTH*7+1) *2,y 
                    ldd      d,y 
                    bsr      drawLineDLater 
                    ldb      #$CC                         ; zero the integrators 
                    stb      <VIA_cntl                    ; store zeroing values to cntl 
                    rts      

 if  IS_VIA_FAULTY_RESISTENT = 1 
drawLineD 
                    sta      <VIA_port_a                  ; 4 
                    clra     
                    sta      <VIA_port_b                  ; 4 
                    inca     
                    nop      
                    sta      <VIA_port_b                  ; 4 
                    stb      <VIA_port_a                  ; 5 
                    ldd      #$ee                         ; light OFF, ZERO OFF 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    lda      #$40 
                    stb      <VIA_cntl                    ; 
cheeseLine1: 
                    bita     <VIA_int_flags 
                    beq      cheeseLine1 
                    rts      

drawLineDLater 
                    sta      <VIA_port_a                  ; 4 
                    clra     
                    sta      <VIA_port_b                  ; 4 
                    nop      
                    inca     
                    sta      <VIA_port_b                  ; 4 
                    stb      <VIA_port_a                  ; 5 
                    ldd      #$ce                         ; light OFF, ZERO OFF 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    stb      <VIA_cntl                    ; 
                    ldd      #$40ee 
                    nop      4                            ; don't draw near the center... 
                    stb      <VIA_cntl                    ; 
cheeseLine2: 
                    bita     <VIA_int_flags 
                    beq      cheeseLine2 
                    ldb      #$ce                         ; light OFF, ZERO OFF 
                    stb      <VIA_cntl                    ; 
                    rts      

                    inca     
                    sta      <VIA_port_b 
 else  
drawLineD 
                    sta      <VIA_port_a                  ; 4 
                    clr      <VIA_port_b                  ; 4 
                    nop      
                    inc      <VIA_port_b                  ; 4 
                    stb      <VIA_port_a                  ; 5 
                    ldd      #$ee                         ; light OFF, ZERO OFF 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    lda      #$40 
                    stb      <VIA_cntl                    ; 
cheeseLine1: 
                    bita     <VIA_int_flags 
                    beq      cheeseLine1 
                    rts      

drawLineDLater 
                    sta      <VIA_port_a                  ; 4 
                    clr      <VIA_port_b                  ; 4 
                    nop      
                    inc      <VIA_port_b                  ; 4 
                    stb      <VIA_port_a                  ; 5 
                    ldd      #$ce                         ; light OFF, ZERO OFF 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    stb      <VIA_cntl                    ; 
                    ldd      #$40ee 
                    nop      4                            ; don't draw near the center... 
                    stb      <VIA_cntl                    ; 
cheeseLine2: 
                    bita     <VIA_int_flags 
                    beq      cheeseLine2 
                    ldb      #$ce                         ; light OFF, ZERO OFF 
                    stb      <VIA_cntl                    ; 
                    rts      

 endif  
; display start / selected reward on latch
bandit_Strings_normalMode 
                    dw       _banditLaser, _banditEquip 
                    dw       _banditMoney, _banditLives 
                    dw       _banditSecret, _banditPower 
                    dw       _banditEquip, _banditLock 
                    dw       _banditLives, _banditImmune 
                    dw       _banditPower, _banditLaser 
                    dw       _banditLock, _banditMoney 
                    dw       _banditImmune, _banditSecret 
bandit_Strings_hardcoreMode 
                    dw       _banditLaser,_banditEquip 
                    dw       _banditBombs,_banditTime 
                    dw       _banditSecret,_banditPower 
                    dw       _banditEquip,_banditScore 
                    dw       _banditTime,_banditImmune 
                    dw       _banditPower, _banditLaser 
                    dw       _banditScore, _banditBombs 
                    dw       _banditImmune, _banditSecret 
_banditStrings 
_banditLaser        db       " LASER", $80,REWARD_LASER
_banditMoney        db       " MONEY", $80,REWARD_MONEY
_banditSecret       db       "SECRET", $80,REWARD_SECRET
_banditEquip        db       " EQUIP", $80,REWARD_EQUIP
_banditLives        db       " LIVES", $80,REWARD_LIVES
_banditPower        db       " POWER", $80,REWARD_POWER
_banditLock         db       "  LOCK", $80,REWARD_LOCK
_banditImmune       db       "IMMUNE", $80,REWARD_IMMUNE
_banditScore        db       " SCORE", $80,REWARD_SCORE
_banditTime         db       "  TIME", $80,REWARD_TIME
_banditBombs        db       " BOMBS", $80,REWARD_BOMBS
OFFSET_TO_CENTER_STRING  =   -6 
; in x pointer to string
; angle in "angle"
; fixed string length of "7"
; expects zeroed on entry
; expects IRQ set by T1
; leaves with VIA_aux set to $18 ("normal" is $98)
; y used for circle data
; u used for chartable
displayCenterRotatedString 
; string is printed with "angleUse" angle
; the beam is positioned to that angle +/- some offsets
                    ldb      #$CC                         ; zero the integrators 
                    stb      <VIA_cntl                    ; store zeroing values to cntl 
                    LDb      #%10000001 
                    STb      <VIA_port_b                  ;[4]disable RAMP, disable mux 
                    sts      stackSafe 
                    clr      linePrinting 
;;;;;;;;;;;;;;
                    LDU      #FONT_START_BIOS             ;Point to start of chargen bitmaps 
;;;;;;;;;;;;;;
 if  IS_VIA_FAULTY_RESISTENT = 1 
nextRotateStringLine 
                    lda      #$98                         ; 0 = shift, 
                    sta      <VIA_aux_cntl 
                    lda      #$7f 
                    sta      <VIA_t1_cnt_lo               ; length of 7,5 letters 
                    lda      ySpinOffset 
                    sta      <VIA_port_a                  ; 4 
                    clra     
                    sta      <VIA_port_b                  ; 4 
                    WAIT8    
                    inca     
                    sta      <VIA_port_b                  ; 4 
                    ldd      #$ce                         ; light OFF, ZERO OFF 
                    sta      <VIA_port_a                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    stb      <VIA_cntl                    ; 
; prepare the "real" angle of the string
                    lda      #3*18+9                      ; 3,5 characters 
                    sta      <VIA_t1_cnt_lo               ; length of 7,5 letters 
                    ldy      #wheelcircleData 
                    ldd      angleUse 
                    anda     #1 
                    std      angleTmp 
                    leay     d,y 
                    lds      #printAngleOffsets 
                    lda      #$40 
movetoWaitLoopstwOffset: 
                    bita     <VIA_int_flags 
                    beq      movetoWaitLoopstwOffset 
; get angle to start printing the current line
                    ldb      linePrinting 
                    inc      linePrinting 
                    aslb     
                    ldd      b,s 
                    addd     angleTmp 
                    anda     #1 
                    std      angleTmp 
;                    lda      a,s 
                    ldy      #wheelcircleData 
                    leay     d,y 
;                    leay     a,y 
                    ldd      ,y 
;;;;;;;;;;; move to that position
                    sta      <VIA_port_a                  ; 4 
                    clra     
                    sta      <VIA_port_b                  ; 4 
                    nop      4 
                    inca     
                    sta      <VIA_port_b                  ; 4 
                    stb      <VIA_port_a                  ; 5 
                    ldd      #$ce                         ; light OFF, ZERO OFF 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    stb      <VIA_cntl                    ; 
; prepare the "real" angle of the string
                    ldy      #wheelcircleData 
                    ldd      angleUse 
                    anda     #1 
                    leay     d,y 
                    lda      #$40 
movetoWaitLoopstw: 
                    bita     <VIA_int_flags 
                    beq      movetoWaitLoopstw 
;;;;;;;;;;;
                    LDb      #%10000001 
                    STb      <VIA_port_b                  ;[4]disable RAMP, disable mux 
                    LDa      #$18 
                    STa      <VIA_aux_cntl                ;Shift reg mode = 110 (shift out under system clock), T1 PB7 disabled, one shot mode 
;                    IRQ_TO_0_T1  
; load the real angle
; print one line of string
                    LDD      #$CE80                       ;Blank low, zero high? 
                    sta      <VIA_cntl                    ; store zeroing values to cntl 
                    lda      ,y                           ; y coordinate 
; inverse - since we are going to "center" from the current position
                    nega     
                    sta      <VIA_port_a                  ;Y To D/A output 
                    STB      <VIA_port_b                  ;ramp off set mux to channel 0, Enable mux (set y) 
                    nop      4 
                    incb                                  ; B = $81 
                    STB      <VIA_port_b                  ;Disable RAMP, set mux to channel 0, disable mux 
                    lda      1,y 
                    nega     
                    STa      <VIA_port_a                  ;Send it to the D/A (X) 
                    LDA      #$01                         ;both to ORB, both ENABLE RAMP, mux off 
                    STA      <VIA_port_b                  ;[4]enable RAMP, disable mux 
                    bra      startShift3 

nextChar3 
                    lda      a,u 
                    STA      <VIA_shift_reg               ;[+4]rasterout of char bitmap "row" thru shift out in shift register 
startShift3 
                    lda      ,x+                          ;[6] 
                    bpl      nextChar3 
                    ldb      #$CC                         ; zero the integrators 
                    stb      <VIA_cntl                    ; store zeroing values to cntl 
                    cmpu     #FONT_END_BIOS 
                    beq      stringRotatePrintDone 
                    leax     -8,x                         ; start of String 
                    LEAU     FONT_LENGTH_BIOS, u          ;Point to next "row" of font bitmap 
                    lda      #%10000001 
                    clr      <VIA_port_a 
                    sta      <VIA_port_b 
                    jmp      nextRotateStringLine 

stringRotatePrintDone 
                    lds      stackSafe 
                    rts      

 else  
nextRotateStringLine 
                    lda      #$98                         ; 0 = shift, 
                    sta      <VIA_aux_cntl 
                    lda      #$7f 
                    sta      <VIA_t1_cnt_lo               ; length of 7,5 letters 
                    lda      ySpinOffset 
                    sta      <VIA_port_a                  ; 4 
                    clr      <VIA_port_b                  ; 4 
                    nop      4 
                    inc      <VIA_port_b                  ; 4 
                    ldd      #$ce                         ; light OFF, ZERO OFF 
                    sta      <VIA_port_a                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    stb      <VIA_cntl                    ; 
; prepare the "real" angle of the string
                    lda      #3*18+9                      ; 3,5 characters 
                    sta      <VIA_t1_cnt_lo               ; length of 7,5 letters 
                    ldy      #wheelcircleData 
                    ldd      angleUse 
                    anda     #1 
                    std      angleTmp 
                    leay     d,y 
                    lds      #printAngleOffsets 
                    lda      #$40 
movetoWaitLoopstwOffset: 
                    bita     <VIA_int_flags 
                    beq      movetoWaitLoopstwOffset 
; get angle to start printing the current line
                    ldb      linePrinting 
                    inc      linePrinting 
                    aslb     
                    ldd      b,s 
                    addd     angleTmp 
                    anda     #1 
                    std      angleTmp 
;                    lda      a,s 
                    ldy      #wheelcircleData 
                    leay     d,y 
;                    leay     a,y 
                    ldd      ,y 
;;;;;;;;;;; move to that position
                    sta      <VIA_port_a                  ; 4 
                    clr      <VIA_port_b                  ; 4 
                    nop      4 
                    inc      <VIA_port_b                  ; 4 
                    stb      <VIA_port_a                  ; 5 
                    ldd      #$ce                         ; light OFF, ZERO OFF 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    stb      <VIA_cntl                    ; 
; prepare the "real" angle of the string
                    ldy      #wheelcircleData 
                    ldd      angleUse 
                    anda     #1 
                    leay     d,y 
                    lda      #$40 
movetoWaitLoopstw: 
                    bita     <VIA_int_flags 
                    beq      movetoWaitLoopstw 
;;;;;;;;;;;
                    LDb      #%10000001 
                    STb      <VIA_port_b                  ;[4]disable RAMP, disable mux 
                    LDa      #$18 
                    STa      <VIA_aux_cntl                ;Shift reg mode = 110 (shift out under system clock), T1 PB7 disabled, one shot mode 
;                    IRQ_TO_0_T1  
; load the real angle
; print one line of string
                    LDD      #$CE80                       ;Blank low, zero high? 
                    sta      <VIA_cntl                    ; store zeroing values to cntl 
                    lda      ,y                           ; y coordinate 
; inverse - since we are going to "center" from the current position
                    nega     
                    sta      <VIA_port_a                  ;Y To D/A output 
                    STB      <VIA_port_b                  ;ramp off set mux to channel 0, Enable mux (set y) 
                    nop      4 
                    incb                                  ; B = $81 
                    STB      <VIA_port_b                  ;Disable RAMP, set mux to channel 0, disable mux 
                    lda      1,y 
                    nega     
                    STa      <VIA_port_a                  ;Send it to the D/A (X) 
                    LDA      #$01                         ;both to ORB, both ENABLE RAMP, mux off 
                    STA      <VIA_port_b                  ;[4]enable RAMP, disable mux 
                    bra      startShift3 

nextChar3 
                    lda      a,u 
                    STA      <VIA_shift_reg               ;[+4]rasterout of char bitmap "row" thru shift out in shift register 
startShift3 
                    lda      ,x+                          ;[6] 
                    bpl      nextChar3 
                    ldb      #$CC                         ; zero the integrators 
                    stb      <VIA_cntl                    ; store zeroing values to cntl 
                    cmpu     #FONT_END_BIOS 
                    beq      stringRotatePrintDone 
                    leax     -8,x                         ; start of String 
                    LEAU     FONT_LENGTH_BIOS, u          ;Point to next "row" of font bitmap 
                    lda      #%10000001 
                    clr      <VIA_port_a 
                    sta      <VIA_port_b 
                    jmp      nextRotateStringLine 

stringRotatePrintDone 
                    lds      stackSafe 
                    rts      

 endif  
printAngleOffsets 
                    dw       -6, -4, -2, 0, 2, 4, 6 
