; bank 3
;score display is realized as a "message" system
;
;Score is the default message but there can be others
;
; Configuarble Blinking scrolling in from left, right top button!
;
; uses five font
; 
; font can be colorized (per line top/bottom
; Calib X,Y
; color table
; text
; effect: Blink, intensity, colorCycle
; mode: multi line (text scrolls in out vertically)
; default text (score)
;
font5Def 
                    dw       font5a_line1 
                    db       1 
                    db       font5a_line2- font5a_line1 
; 12
colorCycleData 
                    db       $50, $48, $40, $38, $30 
                    db       $28, $30, $38, $40, $48, $50, $48, $40, $38, $30 
;
MESSAGE_TEXT_HEIGHT  =       $f8 
MESSAGE_TEXT_WIDTH  =        $50 
; output "here" one line of a string
; return to beginning with one step down
; pointer to string in "Vec_Str_Ptr"
; size in Vec_Text_Height / Vec_Text_Width
; start of font in x (correct line) in font bit map
_PRINT_STRING_LINE  macro    
                    STB      <VIA_port_b                  ;Update RAMP, set mux to channel 1 
                    decb     
                    stb      <VIA_port_b                  ;Enable mux 
                    LDD      #$8081 
                    STB      <VIA_port_b                  ;Disable RAMP, set mux to channel 0 
                    STA      <VIA_port_b                  ;Enable mux 
                    LDA      #MESSAGE_TEXT_WIDTH          ;Get text width 
                    STB      <VIA_port_b                  ;Disable RAMP, set mux to channel 0 
                    STA      <VIA_port_a                  ;Send it to the D/A 
                    LDa      #$01 
                    LDU      Vec_Str_Ptr                  ;Point to start of text string 
                    STA      <VIA_port_b                  ;Enable RAMP, disable mux 
                    BRA      LF4CB_5\? 

LF4C7_5\? 
                    LDA      A,X                          ;Get bitmap from chargen table 
                    STA      <VIA_shift_reg               ;Save in shift register 
LF4CB_5\? 
                    LDA      ,U+                          ;Get next character 
                    BPL      LF4C7_5\?                    ;Go back if not terminator 
                    LDA      #$01 
                    STb      <VIA_port_b                  ;disable RAMP, disable mux 
                    NEG      <VIA_port_a                  ;Negate text width to D/A 
                    STA      <VIA_port_b                  ;Enable RAMP, disable mux 
                    CMPX     #FONT_END                    ; Check for last row 
                    BEQ      outHere\?                    ;Branch if last row 
                    LEAX     FONT_LENGTH,X                ;Point to next chargen row 
                    TFR      U,D                          ;Get string length 
                    SUBD     Vec_Str_Ptr 
                    SUBB     #$02                         ; - 2 
                    ASLB                                  ; * 2 
                    BRN      LF4EB_5\?                    ;Delay a moment 
LF4EB_5\? 
                    LDA      #$81 
                    NOP      
                    DECB     
                    BNE      LF4EB_5\?                    ;Delay some more in a loop 
                    STA      <VIA_port_b                  ;Disable RAMP, disable mux 
                    LDB      #MESSAGE_TEXT_HEIGHT         ;Get text height 
                    STB      <VIA_port_a                  ;Store text height in D/A 
                    deca     
                    sta      <VIA_port_b                  ;Enable mux 
                    LDD      #$8101 
                    NOP                                   ;Wait a moment 
                    STA      <VIA_port_b                  ;disable RAMP, disable mux 
                    CLR      <VIA_port_a                  ;Clear D/A 
                    STB      <VIA_port_b                  ;Enable RAMP, disable mux 
                    STA      <VIA_port_b                  ;Disable RAMP, disable mux 
outHere\? 
                    endm     
; string pointer in        Vec_Str_Ptr         
; in D position
PREPARE_PRINT_STRING_LINE  macro  
                    stu      Vec_Str_Ptr 
                    LDX      #FONT_START_A                ;Point to start of chargen bitmaps 
                    MY_MOVE_TO_D_END  
                    LDD      #$1883                       ;$8x = disable RAMP? 
                    CLR      <VIA_port_a                  ;Clear D/A output 
                    STA      <VIA_aux_cntl                ;Shift reg mode = 110, T1 PB7 enabled 
                    endm     
FINISH_PRINT_STRING_LINE  macro  
                    LDA      #$98 
                    STA      <VIA_aux_cntl                ;T1->PB7 enabled 
                    endm     
PRINT_STRING_LINE_1  macro   
                    _PRINT_STRING_LINE  
                    endm     
PRINT_STRING_LINE   macro    
                    LDB      #$03                         ;$0x = enable RAMP? 
                    _PRINT_STRING_LINE  
                    endm     
; all other states are checked "in move"
testNextState1 
                    lda      #$5f 
                    _INTENSITY_A_8  
;                    ldd      #$7f10 
                    ldd      #$7010 
                    MY_MOVE_TO_D_START  
                    ldd      messageState                 ; a = messageState, b = messageTimer 
                    cmpa     #MESSAGE_STATE_SCROLL_NORMAL_OUT 
                    bne      testNextState2 
                    lda      messageTimer 
                    dec      messageTimer 
                    lbpl     scrollOut 
                    lda      #MESSAGE_STATE_SCROLL_MESSAGE_IN 
                    sta      messageState 
                    lda      #10 
                    sta      messageTimer 
                    jmp      scrollOut 

testNextState2 
                    cmpa     #MESSAGE_STATE_SCROLL_MESSAGE_IN 
                    bne      testNextState3 
                    ldu      messagePointer 
                    lda      messageTimer 
                    dec      messageTimer 
                    lbpl     scrollIn 
                    lda      #MESSAGE_STATE_STAY_TIMED 
                    sta      messageState 
                    lda      #50 
                    sta      messageTimer 
                    jmp      scrollIn 

testNextState3 
                    cmpa     #MESSAGE_STATE_SCROLL_MESSAGE_OUT 
                    bne      testNextState4 
                    ldu      messagePointer 
                    lda      messageTimer 
                    dec      messageTimer 
                    lbpl     scrollOut 
                    lda      #MESSAGE_STATE_SCROLL_NORMAL_IN 
                    sta      messageState 
                    lda      #10 
                    sta      messageTimer 
                    jmp      scrollOut 

testNextState4 
                    cmpa     #MESSAGE_STATE_SCROLL_NORMAL_IN 
                    bne      testNextState5 
                    lda      messageTimer 
                    dec      messageTimer 
                    lbpl     scrollIn 
                    lda      #MESSAGE_STATE_STAY 
                    sta      messageState 
                    lda      #0 
                    sta      messageTimer 
                    jmp      scrollIn 

;
; ------------------------------------------------------
;
displayScore 
                    ldu      #player_score                ; score isdefault 
                    lda      gameScale                    ; movement scale 
                    sta      VIA_t1_cnt_lo 
                    lda      messageState                 ; check message state 
                    cmpa     #MESSAGE_STATE_STAY          ; if normal "score" jump to color cycle 
                    beq      normalMessageCont 
                    cmpa     #MESSAGE_STATE_STAY_TIMED    ; a "timed" message is stable 
                    lbne     testNextState1               ; not? than check next possible state 
                    ldu      messagePointer               ; get the current message 
                    dec      messageTimer                 ; checkif timer expired 
                    bne      normalMessageCont 
                    lda      #MESSAGE_STATE_SCROLL_MESSAGE_OUT ; if expired - scroll this message out! 
                    sta      messageState                 ; save new message state 
                    lda      #10                          ; in steps of 2 (keeping 2 rounds each) 
                    sta      messageTimer                 ; save timer 
                                                          ; jmp normalMessageCont ; -> also jump to color cycling 
testNextState5 
normalMessageCont 
                    lda      colorCycleCount 
                    ldb      Vec_Loop_Count+1 
                    andb     #%00000011 
                    bne      noColorCycle 
                    inc      colorCycleCount 
                    cmpa     #9                           ; 
                    blo      noReset 
                    clra     
                    sta      colorCycleCount 
noReset 
noColorCycle 
                    ldy      #colorCycleData 
                    leay     a,y 
                    lda      ,y+ 
                    _INTENSITY_A_8  
                    ldd      #$7010 
                    MY_MOVE_TO_D_START  
                    lda      #5 
                    sta      tmp2_tmp 
                    PREPARE_PRINT_STRING_LINE  
anotherLine 
                    _PRINT_STRING_LINE  
                    lda      ,y+                          ; y pointer to color ta 
                    _INTENSITY_A_8                        ; intensity 8 keeps ramp to disabled! 
                    CLR      <VIA_port_a                  ; needed aftr intensity setting! 
                    LDB      #$03                         ;$0x = enable RAMP? 
                    dec      tmp2_tmp 
                    bne      anotherLine 
                    FINISH_PRINT_STRING_LINE  
                    jmp      calibrationZero7 

;scroll position is messageTimer/2
; scroll message is in U
; scrolling is out in the top
; scrolling is in from top
scrollOut 
                    negb     
                    addb     #10 
scrollIn 
intLineTest 
                    LDX      #FONT_START_A                ;Point to start of chargen bitmaps 
                    stu      Vec_Str_Ptr 
                    lsrb     
                                                          ; that many lines we "skip" 
                                                          ; prepare String 
                    cmpb     #0 
                    bne      test_1 
                    lda      #5 
                    bra      do_line_start 

test_1 
                    cmpb     #1 
                    bne      test_2 
                    LEAX     FONT_LENGTH,X                ;Point to next chargen row 
                    lda      #4 
                    bra      do_line_start 

test_2 
                    cmpb     #2 
                    bne      test_3 
                    LEAX     2*FONT_LENGTH,X              ;Point to next chargen row 
                    lda      #3 
                    bra      do_line_start 

test_3 
                    cmpb     #3 
                    bne      test_4 
                    LEAX     3*FONT_LENGTH,X              ;Point to next chargen row 
                    lda      #2 
                    bra      do_line_start 

test_4 
                    cmpb     #4 
                    bne      test_5 
                    LEAX     4*FONT_LENGTH,X              ;Point to next chargen row 
                    lda      #1 
                    bra      do_line_start 

test_5 
                    MY_MOVE_TO_D_END  
                    bra      do0Lines 

do_line_start 
                    sta      tmp2_tmp 
                    MY_MOVE_TO_D_END  
                    LDD      #$1883                       ;$8x = disable RAMP? 
                    CLR      <VIA_port_a                  ;Clear D/A output 
                    STA      <VIA_aux_cntl                ;Shift reg mode = 110, T1 PB7 enabled 
do_line 
                    _PRINT_STRING_LINE  
                    LDB      #$03                         ;$0x = enable RAMP? 
                    dec      tmp2_tmp 
                    bne      do_line 
do0Lines 
                    FINISH_PRINT_STRING_LINE  
                    jmp      calibrationZero7 
