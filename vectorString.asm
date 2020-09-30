; bank 2
                    include  "abc.i"
 if  IS_VIA_FAULTY_RESISTENT = 1 
;
; .......................................................................................................
;
Draw_VLpMe          macro    
start\? 
                    LDa      1,X                          ;Get next coordinate pair 
                    STA      <VIA_port_a                  ;Send Y to A/D 
                    clrb     
                    stb      <VIA_port_b                  ;Enable mux 
                    LDA      ,X                           ;Get pattern byte? 
                    incb     
                    stb      <VIA_port_b                  ;Disable mux 
                    LDb      2,X                          ;Get next coordinate pair 
                    STB      <VIA_port_a                  ;Send X to A/D 
                    STA      <VIA_shift_reg               ;Store pattern in shift register 
                    CLR      <VIA_t1_cnt_hi               ;Clear T1H 
                    LEAX     3,X                          ;Advance to next point in list 
                    LDb      #$40                         ;B-reg = T1 interrupt bit 
                    LDA      ,X                           ;Get next pattern byte 
LF425\?             BITB     <VIA_int_flags               ;Wait for T1 to time out 
                    BEQ      LF425\? 
                                                          ; NOP 2 ;Wait a moment more 
                    CLR      <VIA_shift_reg               ;Clear shift register (blank output) 
                    tsta     
                    BLE      start\?                      ;Go back if high bit of pattern is set 
                    endm     
;
; .......................................................................................................
;
Draw_VLpMe_split    macro    
                    lda      ,x+ 
                    beq      doMove\? 
doDraw\? 
                    LDD      ,X                           ;Get next coordinate pair 
                    STA      <VIA_port_a                  ;Send Y to A/D 
                    clra     
                    sta      <VIA_port_b                  ;Enable mux 
                    inca     
                    sta      <VIA_port_b                  ;Disable mux 
                    deca     
                    STB      <VIA_port_a                  ;Send X to A/D 
                    DEC      <VIA_shift_reg               ;Store pattern in shift register 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    LEAX     2,X                          ;Advance to next point in list 
                    LDb      #$40                         ;B-reg = T1 interrupt bit 
                    lda      ,x+ 
                    beq      willMove\? 
                    bpl      willEnd\? 
willDraw\? 
                    clra     
LF425_1\?           BITB     <VIA_int_flags               ;Wait for T1 to time out 
                    beq      LF425_1\? 
                    sta      <VIA_shift_reg               ;Clear shift register (blank output) 
                    bra      doDraw\? 

willMove\? 
LF425_2\?           BITB     <VIA_int_flags               ;Wait for T1 to time out 
                    BEQ      LF425_2\? 
                    sta      <VIA_shift_reg               ;Clear shift register (blank output) 
doMove\? 
                    LDD      ,X                           ;Get next coordinate pair 
                    STA      <VIA_port_a                  ;Send Y to A/D 
                    clra     
                    sta      <VIA_port_b                  ;Enable mux 
                    inca     
                    sta      <VIA_port_b                  ;Disable mux 
                    deca     
                    STB      <VIA_port_a                  ;Send X to A/D 
                    STA      <VIA_t1_cnt_hi               ;Clear T1H 
                    LEAX     2,X                          ;Advance to next point in list 
                    LDb      #$40                         ;B-reg = T1 interrupt bit 
                    lda      ,x+ 
                    beq      willMove2\? 
                    bpl      willEnd\? 
willDraw2\? 
LF425_3\?           BITB     <VIA_int_flags               ;Wait for T1 to time out 
                    beq      LF425_3\? 
                    bra      doDraw\? 

willMove2\? 
LF425_4\?           BITB     <VIA_int_flags               ;Wait for T1 to time out 
                    beq      LF425_4\? 
                    bra      doMove\? 

willEnd\? 
                    clra     
LF425_5\?           BITB     <VIA_int_flags               ;Wait for T1 to time out 
                    BEQ      LF425_5\? 
                    sta      <VIA_shift_reg               ;Clear shift register (blank output) 
                    endm     
;
; .....................................................
;
calibrateString 
                    ldd      #$8100 
                    std      <VIA_port_b 
                    deca     
                    sta      <VIA_port_b 
                    ldb      >calibrationValueString 
                    lda      additionalFlags 
                    anda     #%00000001 
                    bne      buzzVectrexString21 
                    lda      #$82 
                    std      <VIA_port_b 
                    ldd      #$83FF 
                    stb      <VIA_port_a 
                    sta      <VIA_port_b 
                    rts      

;
; .....................................................
;
Draw_VLp_lessGap7o  macro    
                    LDD      1,X                          ;Get next coordinate pair 
                    tst      ,x 
                    bne      shiftOn2\? 
shiftOff\? 
                    clr      <VIA_shift_reg 
                    STA      <VIA_port_a                  ;Send Y to A/D 
                    clra     
                    sta      <VIA_port_b                  ;Enable mux 
                    inca     
                    sta      <VIA_port_b                  ;Disable mux 
                    STB      <VIA_port_a                  ;Send X to A/D 
                    deca     
                    STa      <VIA_t1_cnt_hi               ;Clear T1H 
                    LEAX     3,X                          ;Advance to next point in list 
                    tst      ,X                           ;Get next pattern byte 
                    bgt      macroEnd\? 
                    LDD      1,X                          ;Get next coordinate pair 
shiftOn\? 
                    clr      <VIA_shift_reg 
shiftOn2\? 
                    STA      <VIA_port_a                  ;Send Y to A/D 
                    clra     
                    sta      <VIA_port_b                  ;Enable mux 
                    deca     
                    nop      2 
                    sta      <VIA_port_b                  ;Disable mux 
                    LDA      #%11111111                   ;,X ;Get pattern byte 
                    STB      <VIA_port_a                  ;Send X to A/D 
                    ldb      #0 
                    STB      <VIA_t1_cnt_hi               ;Clear T1H 
                    STA      <VIA_shift_reg               ;Store pattern in shift register 
                    LEAX     3,X                          ;Advance to next point in list 
                    LDD      1,X                          ;Get next coordinate pair 
                    tst      ,X 
                    bmi      shiftOn\? 
                    beq      shiftOff\? 
macroEnd\? 
                    STB      <VIA_shift_reg               ;Clear shift register (blank output) 
                    endm     
;
; .....................................................
;
 else  
;
; .....................................................
;
Draw_VLpMe          macro    
start\? 
                    LDD      1,X                          ;Get next coordinate pair 
                    STA      <VIA_port_a                  ;Send Y to A/D 
                    CLR      <VIA_port_b                  ;Enable mux 
                    LDA      ,X                           ;Get pattern byte? 
                    INC      <VIA_port_b                  ;Disable mux 
                    STB      <VIA_port_a                  ;Send X to A/D 
                    STA      <VIA_shift_reg               ;Store pattern in shift register 
                    CLR      <VIA_t1_cnt_hi               ;Clear T1H 
                    LEAX     3,X                          ;Advance to next point in list 
                    LDb      #$40                         ;B-reg = T1 interrupt bit 
                    LDA      ,X                           ;Get next pattern byte 
LF425\?             BITB     <VIA_int_flags               ;Wait for T1 to time out 
                    BEQ      LF425\? 
                                                          ; NOP 2 ;Wait a moment more 
                    CLR      <VIA_shift_reg               ;Clear shift register (blank output) 
                    tsta     
                    BLE      start\?                      ;Go back if high bit of pattern is set 
                    endm     
;
; .....................................................
;
Draw_VLpMe_split    macro    
                    lda      ,x+ 
                    beq      doMove\? 
doDraw\? 
                    LDD      ,X                           ;Get next coordinate pair 
                    STA      <VIA_port_a                  ;Send Y to A/D 
                    clra     
                    sta      <VIA_port_b                  ;Enable mux 
                    INC      <VIA_port_b                  ;Disable mux 
                    STB      <VIA_port_a                  ;Send X to A/D 
                    DEC      <VIA_shift_reg               ;Store pattern in shift register 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    LEAX     2,X                          ;Advance to next point in list 
                    LDb      #$40                         ;B-reg = T1 interrupt bit 
                    lda      ,x+ 
                    beq      willMove\? 
                    bpl      willEnd\? 
willDraw\? 
                    clra     
LF425_1\?           BITB     <VIA_int_flags               ;Wait for T1 to time out 
                    beq      LF425_1\? 
                    sta      <VIA_shift_reg               ;Clear shift register (blank output) 
                    bra      doDraw\? 

willMove\? 
LF425_2\?           BITB     <VIA_int_flags               ;Wait for T1 to time out 
                    BEQ      LF425_2\? 
                    sta      <VIA_shift_reg               ;Clear shift register (blank output) 
doMove\? 
                    LDD      ,X                           ;Get next coordinate pair 
                    STA      <VIA_port_a                  ;Send Y to A/D 
                    clra     
                    sta      <VIA_port_b                  ;Enable mux 
                    INC      <VIA_port_b                  ;Disable mux 
                    STB      <VIA_port_a                  ;Send X to A/D 
                    STA      <VIA_t1_cnt_hi               ;Clear T1H 
                    LEAX     2,X                          ;Advance to next point in list 
                    LDb      #$40                         ;B-reg = T1 interrupt bit 
                    lda      ,x+ 
                    beq      willMove2\? 
                    bpl      willEnd\? 
willDraw2\? 
LF425_3\?           BITB     <VIA_int_flags               ;Wait for T1 to time out 
                    beq      LF425_3\? 
                    bra      doDraw\? 

willMove2\? 
LF425_4\?           BITB     <VIA_int_flags               ;Wait for T1 to time out 
                    beq      LF425_4\? 
                    bra      doMove\? 

willEnd\? 
                    clra     
LF425_5\?           BITB     <VIA_int_flags               ;Wait for T1 to time out 
                    BEQ      LF425_5\? 
                    sta      <VIA_shift_reg               ;Clear shift register (blank output) 
                    endm     
;
; .....................................................
;
calibrateString 
                    ldd      #$8100 
                    std      <VIA_port_b 
                    dec      <VIA_port_b 
                    ldb      >calibrationValueString 
                    lda      additionalFlags 
                    anda     #%00000001 
                    bne      buzzVectrexString21 
                    lda      #$82 
                    std      <VIA_port_b 
                    ldd      #$83FF 
                    stb      <VIA_port_a 
                    sta      <VIA_port_b 
                    rts      

;
; .....................................................
;
Draw_VLp_lessGap7o  macro    
                    LDD      1,X                          ;Get next coordinate pair 
                    tst      ,x 
                    bne      shiftOn2\? 
shiftOff\? 
                    clr      <VIA_shift_reg 
                    STA      <VIA_port_a                  ;Send Y to A/D 
                    clra     
                    sta      <VIA_port_b                  ;Enable mux 
                    inca     
                    sta      <VIA_port_b                  ;Disable mux 
                    STB      <VIA_port_a                  ;Send X to A/D 
                    deca     
                    STa      <VIA_t1_cnt_hi               ;Clear T1H 
                    LEAX     3,X                          ;Advance to next point in list 
                    tst      ,X                           ;Get next pattern byte 
                    bgt      macroEnd\? 
                    LDD      1,X                          ;Get next coordinate pair 
shiftOn\? 
                    clr      <VIA_shift_reg 
shiftOn2\? 
                    STA      <VIA_port_a                  ;Send Y to A/D 
                    CLR      <VIA_port_b                  ;Enable mux 
                    LDA      #%11111111                   ;,X ;Get pattern byte 
                    INC      <VIA_port_b                  ;Disable mux 
                    STB      <VIA_port_a                  ;Send X to A/D 
                    ldb      #0 
                    STB      <VIA_t1_cnt_hi               ;Clear T1H 
                    STA      <VIA_shift_reg               ;Store pattern in shift register 
                    LEAX     3,X                          ;Advance to next point in list 
                    LDD      1,X                          ;Get next coordinate pair 
                    tst      ,X 
                    bmi      shiftOn\? 
                    beq      shiftOff\? 
macroEnd\? 
                    STB      <VIA_shift_reg               ;Clear shift register (blank output) 
                    endm     
;
; .....................................................
;
 endif  
;
; .....................................................
;
buzzVectrexString21 
                    lda      #$82 
                    std      <VIA_port_b 
                    ldd      #$83FF                       ; 2 cycles 
                    stb      <VIA_port_a 
                    nop      2 
                    sta      <VIA_port_b 
                    rts      

;
; .......................................................................................................
;
; print string (list)
; in gameScale positioning scale
; in stringScale vector scale
; in U pointer to string struct (posy,posx, text,$80) - end with 0,0 = y,x
; starts with zeroing
; no end zeroing!
printVectorStringList 
                    _ZERO_VECTOR_BEAM  
printVectorStringListNonZero 
; calibrate Text
                    ldd      #$8100 
                    std      <VIA_port_b 
                    deca     
                    sta      <VIA_port_b 
                    ldb      >calibrationValueString 
                    lda      additionalFlags 
                    anda     #%00000001 
                    bne      buzzVectrexString 
                    lda      #$82 
                    std      <VIA_port_b 
                    ldd      #$83FF                       ; 2 cycles 
                    stb      <VIA_port_a 
                    sta      <VIA_port_b 
                    bra      doneCalibrateString 

buzzVectrexString 
                    lda      #$82 
                    std      <VIA_port_b 
                    ldd      #$83FF                       ; 2 cycles 
                    stb      <VIA_port_a 
                    nop      2 
                    sta      <VIA_port_b 
doneCalibrateString 
; calibrate Text
                    lda      gameScale 
                    sta      VIA_t1_cnt_lo 
                    ldd      ,u++ 
                    MY_MOVE_TO_D_START                    ;jsr Moveto_d 
                    lda      stringScale 
                    sta      VIA_t1_cnt_lo 
                    MY_MOVE_TO_A_END  
                    bsr      printVectorString 
                    ldd      ,u 
                    bne      printVectorStringList 
endOfStringPrinting 
                    rts      

;
; .....................................................
;
printVectorStringList2 
                    _ZERO_VECTOR_BEAM  
; calibrate Text
                    ldd      #$8100 
                    std      <VIA_port_b 
                    deca     
                    sta      <VIA_port_b 
                    ldb      >calibrationValueString 
                    lda      additionalFlags 
                    anda     #%00000001 
                    bne      buzzVectrexString2 
                    lda      #$82 
                    std      <VIA_port_b 
                    ldd      #$83FF                       ; 2 cycles 
                    stb      <VIA_port_a 
                    sta      <VIA_port_b 
                    bra      doneCalibrateString2 

buzzVectrexString2 
                    lda      #$82 
                    std      <VIA_port_b 
                    ldd      #$83FF                       ; 2 cycles 
                    stb      <VIA_port_a 
                    nop      2 
                    sta      <VIA_port_b 
doneCalibrateString2 
; calibrate Text
                    lda      gameScale 
                    sta      VIA_t1_cnt_lo 
                    ldd      ,u++ 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    jsr      my_Moveto_d                  ; Moveto_d 
 else  
                    JSR      Moveto_d 
 endif  
                    lda      stringScale 
                    sta      VIA_t1_cnt_lo 
                    bsr      printVectorString2 
                    ldd      ,u 
                    bne      printVectorStringList2 
donePrintVectorString2 
                    rts      

;
; .....................................................
;
; prints HERE
; string in U
; as Vector string
; scal set beforehand
donePrintVectorString 
                    rts      

printVectorString 
                    ldy      #Alphabet-64                 ; font starts at 32, *2 because of 16 bit pointer 
nextLetter: 
                    ldb      ,u+ 
                    bmi      donePrintVectorString 
                    clra     
                    lslb     
                    ldx      d,y 
                    Draw_VLp_lessGap  
                    bra      nextLetter 

donePrintVectorString3 
                    rts      

;
; .....................................................
;
printVectorString2 
                    ldy      #Alphabet-64                 ; font starts at 32, *2 because of 16 bit pointer 
nextLetter2: 
                    ldb      ,u+ 
                    bmi      donePrintVectorString3 
                    clra     
                    lslb     
                    ldx      d,y 
                    Draw_VLp_lessGap2  
                    bra      nextLetter2 

;
; .....................................................
;
