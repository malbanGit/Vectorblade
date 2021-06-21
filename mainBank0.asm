;before is free for any "shit"
;
;a000 4k save game
;b000 4k highscore saves
; about 9k free
; xxxx bytes free
; following is needed for VIDE
; to replace "vars" in this bank with values from the other bank
; #genVarlist# varFromIRQ0
;
CURRENT_BANK        EQU      0                            ; 
                    Bank     0 
                    include  "commonGround.i"
;
;***************************************************************************
; CODE SECTION
;***************************************************************************
queryJoystick:                                            ;#isfunction  
                    QUERY_JOYSTICK  
                    rts      

;***************************************************************************
bank0WaitRecal
Wait_Recal_noShift 
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
                                                          ; TODO JMP Recalibrate 
                    rts      

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

;
;ZERO ing the integrators takes time. Measures at my vectrex show e.g.:
;If you move the beam with a to x = -127 and y = -127 at diffferent scale values, the time to reach zero:
;- scale $ff -> zero 110 cycles
;- scale $7f -> zero 75 cycles
;- scale $40 -> zero 57 cycles
;- scale $20 -> zero 53 cycles
ZERO_DELAY          EQU      7                            ; delay 7 counter is exactly 111 cycles delay between zero SETTING and zero unsetting (in moveto_d) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;U = address of vectorlist
;X = (y,x) position of vectorlist (this will be point 0,0), positioning on screen
;B = scalefactor "Move" (after sync)
;A = scalefactor "Vector" (vectors in vectorlist)
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
draw_synced_list 
draw_synced_list_noshift:                                 ;#isfunction  
                    pshs     a                            ; remember out different scale factors 
                    pshs     b 
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
                    inc      <VIA_port_b                  ;Enable mux 
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
                    MY_MOVE_TO_A_END  
                    lda      ,s                           ; scale factor vector 
                    sta      <VIA_t1_cnt_lo               ; to timer T1 (lo) 
moveTo: 
                    ldd      ,u++                         ; do our "internal" moveto d 
                    beq      nextListEntry                ; there was a move 0,0, if so 
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    MY_MOVE_TO_A_END  
nextListEntry: 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    lda      ,u+                          ; load next "mode" byte 
                    beq      moveTo                       ; if 0, than we should move somewhere 
                    bpl      sync                         ; if still positive it is a 1 pr 2 _> goto sync 
; now we should draw a vector
                    lda      ,u+                          ;Get next coordinate pair 
                    STA      <VIA_port_a                  ;Send Y to A/D 
                    clrb     
                    stb      <VIA_port_b                  ;Enable mux 
                    incb     
                    LDA      #$ee                         ;prepare for blank disabled 
                    stb      <VIA_port_b                  ;Disable mux 
                    ldb      ,u+                          ;Get next coordinate pair 
 else  
                    lda      ,u+                          ; load next "mode" byte 
                    beq      moveTo                       ; if 0, than we should move somewhere 
                    bpl      sync                         ; if still positive it is a 1 pr 2 _> goto sync 
; now we should draw a vector
                    ldd      ,u++                         ;Get next coordinate pair 
                    STA      <VIA_port_a                  ;Send Y to A/D 
                    CLR      <VIA_port_b                  ;Enable mux 
                    LDA      #$ee                         ;prepare for blank disabled 
                    INC      <VIA_port_b                  ;Disable mux 
 endif  
                    STB      <VIA_port_a                  ;Send X to A/D 
                    LDB      #$40                         ;B-reg = T1 interrupt bit 
                    CLR      <VIA_t1_cnt_hi               ;Clear T1H 
; blank disabled
                    sta      <VIA_cntl                    ; [4] ZERO disabled, and BLANK disabled 
setPatternLoop: 
                    BITB     <VIA_int_flags               ;Wait for T1 to time out 
                    beq      setPatternLoop               ; wait till line is finished 
                    LDA      #$ce                         ;prepare for blank disabled 
                    nop      
; blank enabled
                    sta      <VIA_cntl                    ; [4] ZERO disabled, and BLANK disabled 
                    bra      nextListEntry 

drawdone: 
                    puls     d                            ; correct stack and go back 
drawdone0: 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; no scale factors set in function
; in u just the address of the list
; if starting with sync -> it will return to zero first!
; will NOT zero on exit
;
; uses set scale for everything
draw_synced_list_fromzero__noshift:                       ;#isfunction  
                                                          ; first list entry (first will be a sync + moveto_d, so we just stay here!) 
                    lda      ,u+                          ; this will be a "1" 
                    beq      moveTo0 
; bne drawTo0 ; first can in this sync list even be a draw
sync0: 
                    deca                                  ; test if real sync - or end of list (2) 
                    bne      drawdone0                    ; if end of list -> jump 
; zero integrators
                    ldb      #$CC                         ; zero the integrators 
                    stb      <VIA_cntl                    ; store zeroing values to cntl 
                    ldb      #ZERO_DELAY                  ; and wait for zeroing to be actually done 
; reset integrators
                    clr      <VIA_port_a                  ; reset integrator offset 
                    lda      #%10000010 
; wait that zeroing surely has the desired effect!
zeroLoop0: 
                    sta      <VIA_port_b                  ; while waiting, zero offsets 
                    decb     
                    bne      zeroLoop0 
                    inca     
                    sta      <VIA_port_b 
moveTo0: 
                    ldd      ,u++                         ; do our "internal" moveto d 
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    LDb      #$ce                         ;prepare for blank disabled 
                    MY_MOVE_TO_A_END  
nextListEntry0: 
                    stb      <VIA_cntl                    ; [4] ZERO disabled, and BLANK disabled 
                    lda      ,u+                          ; load next "mode" byte 
                    beq      moveTo0                      ; if 0, than we should move somewhere 
                    bpl      sync0                        ; if still positive it is a 1 pr 2 _> goto sync 
drawTo0 
 if  IS_VIA_FAULTY_RESISTENT = 1 
; now we should draw a vector
                    lda      ,u+                          ;Get next coordinate pair 
                    STA      <VIA_port_a                  ;Send Y to A/D 
                    clrb     
                    stb      <VIA_port_b                  ;Enable mux 
                    LDA      #$ee                         ;prepare for blank disabled 
                    incb     
                    stb      <VIA_port_b                  ;Disable mux 
                    ldb      ,u+                          ;Get next coordinate pair 
 else  
; now we should draw a vector
                    ldd      ,u++                         ;Get next coordinate pair 
                    STA      <VIA_port_a                  ;Send Y to A/D 
                    CLR      <VIA_port_b                  ;Enable mux 
                    LDA      #$ee                         ;prepare for blank disabled 
                    INC      <VIA_port_b                  ;Disable mux 
 endif  
                    STB      <VIA_port_a                  ;Send X to A/D 
                    LDB      #$40                         ;B-reg = T1 interrupt bit 
                    CLR      <VIA_t1_cnt_hi               ;Clear T1H 
; blank disabled
                    sta      <VIA_cntl                    ; [4] ZERO disabled, and BLANK disabled 
setPatternLoop0: 
                    BITB     <VIA_int_flags               ;Wait for T1 to time out 
                    beq      setPatternLoop0              ; wait till line is finished 
                    LDb      #$ce                         ;prepare for blank disabled 
; blank enabled
; WAIT4 ; this closes some gaps in sync draw - but isobviously slower!
;;;                    sta      <VIA_cntl                    ; [4] ZERO disabled, and BLANK disabled
                    bra      nextListEntry0 

;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
playerOneOffsetDifference  =  playerAnim 
playerOneOffsetCurrent  =    playAnimDelayCounter 
readyPlayerOne                                            ;#isfunction  
; "in instruction" bankswitch not supported by VIDE
                    ldd      #0 
                    std      sfx_pointer_3 
                    std      sfx_pointer_2 
                    std      sfx_pointer_1 
                    CLR      Vec_Music_Flag               ; no music is playing ->0 (is placed in rottist! 
                    JSR      Init_Music_Buf               ; shadow regs 
                    JSR      Do_Sound                     ; ROM function that does the sound playing, here used to clear all regs 
                    ldd      #100 
                    std      tmp16_tmp 
                    lda      #$7f 
                    sta      <VIA_t1_cnt_lo 
                    lda      #-2 
                    sta      Vec_Text_Height 
                    IRQ_TO_0_SHIFT  
                    lda      #42 
                    sta      playerOneOffsetDifference 
                    ldx      #ReadyPlayerOneData 
                    stx      sfx_pointer_1 
rpl1Loop 
                    jsr      Wait_Recal_noShift           ; Vectrex BIOS recalibration 
                    jsr      do_ym_sound2 
                    jsr      Intensity_5F 
                    ldu      #rpoString 
                    lda      playerOneOffsetDifference 
                    adda     playerOneOffsetDifference 
                    adda     playerOneOffsetDifference    ; starting three above! 
                    sta      playerOneOffsetCurrent       ; starting three above! 
                    dec      playerOneOffsetDifference 
                    bpl      nodifinc 
                    inc      playerOneOffsetDifference 
nodifinc 
                    ldd      #$2098 
                    tst      playerOneOffsetDifference 
                    beq      normalPrint 
                    bsr      sync_Print_Str_d_fixed_8_offsets 
                    bra      contPrint 

normalPrint 
                    jsr      sync_Print_Str_d_fixed_8 
contPrint 
                    ldd      tmp16_tmp 
                    subd     #1 
                    std      tmp16_tmp 
                    bne      rpl1Loop 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
sync_Print_Str_d_fixed_8_offsets 
; put move position on stack put it so, that we can load "d" directly from stack
                    pshs     d 
                    STU      Vec_Str_Ptr                  ;Save string pointer 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                    LDX      #FONT_START_A_8              ;Point to start of chargen bitmaps 
                    lda      #$cc 
                    sta      <VIA_cntl                    ; store zeroing values to cntl 
next_line_a_8_of: 
; zero
                    ldd      #(%10000010)*256+$00         ; zero the integrators 
; reset integrators
                                                          ;;;; clr <VIA_port_a ; reset integrator offset 
                                                          ; lda #%10000010 
; wait that zeroing surely has the desired effect!
                    stb      <VIA_port_a 
                    sta      <VIA_port_b 
                    ldb      #ZERO_DELAY_P                ; and wait for zeroing to be actually done 
                    inca     
                    sta      <VIA_port_b 
zeroLoop_a_8_of: 
                                                          ;;;; sta <VIA_port_b ; while waiting, zero offsets 
                    decb     
                    bne      zeroLoop_a_8_of 
                                                          ;;;; inc <VIA_port_b 
                    ldd      ,s 
;;;;;;;
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    LDU      Vec_Str_Ptr                  ;Point to start of text string 
                    MY_MOVE_TO_A_END  
                    lda      playerOneOffsetCurrent 
                    clrb     
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    lda      playerOneOffsetCurrent 
                    suba     playerOneOffsetDifference 
                    sta      playerOneOffsetCurrent 
                    MY_MOVE_TO_A_END  
;;;;;;;
Print_Str_a_8_of: 
                    LDD      #$1881                       ;AUX: b→ORB: $8x = Disable RAMP, Disable Mux, mux sel = 01 (int offsets) 
                    STB      <VIA_port_b                  ;ramp off/on set mux to channel 1 
                    STA      <VIA_aux_cntl                ;Shift reg mode = 110 (shift out under system clock), T1 PB7 disabled, one shot mode 
                    CLR      <VIA_port_a                  ;Clear D/A output 
                                                          ; first entry here, ramp is disabled 
                                                          ; if there was a jump from below 
                                                          ; ramp will be enabled by next line 
PLAYERONESIZE       =        0x58 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    decb     
                    stb      <VIA_port_b                  ;Enable mux 
                    incb     
                    stb      <VIA_port_b                  ;Disable mux 
                    ldd      #PLAYERONESIZE*256+01 
 else  
                    dec      <VIA_port_b                  ;Enable mux 
                    ldd      #PLAYERONESIZE*256+01 
                    INC      <VIA_port_b                  ;Disable mux 
 endif  
                    STA      <VIA_port_a                  ;Send it to the D/A 
                    STb      <VIA_port_b                  ;[4]enable RAMP, disable mux (start moving) 
                    BRA      LF4CB_a8_of                  ;[3] 

; one letter is drawn (one row that is) in 18 cycles
; 13 cycles overhead
; ramp is thus active for #ofLetters*18 + 13 cycles
LF4C7_a8_of: 
                    LDA      A,X                          ;[+5]Get bitmap from chargen table 
                    STA      <VIA_shift_reg               ;[+4]rasterout of char bitmap "row" thru shift out in shift register 
LF4CB_a8_of: 
                    LDA      ,U+                          ;[+6]Get next character 
                    BPL      LF4C7_a8_of                  ;[+3]Go back if not terminator 
                    CMPX     #FONT_END_8                  ;[4]Check for last row 
                    BEQ      LF50A_a8_of                  ;[3]Branch if last row 
                    LEAX     <FONT_LENGTH_8,X             ;[3]Point to next chargen row 
                    LDD      #$98cc 
                    STD      <VIA_aux_cntl                ;PB7 enabled 
                    lda      Vec_Text_Height 
                    adda     ,s 
                    sta      ,s 
                    jmp      next_line_a_8_of             ;Go back for next scan line 

LF50A_a8_of: 
                    ldd      #$98 
                    sta      <VIA_shift_reg 
                    STb      <VIA_aux_cntl                ;T1→PB7 enabled 
                    puls     d ,pc                        ; all done, correct stack 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
rpoString 
                    db       "READY PLAYER ONE!", $80
gopoString 
                    db       "GAME OVER", $80
buttonString 
                    db       "PRESS BUTTON", $80
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
showGameOver                                              ;#isfunction  
                    lda      gameScale 
                    sta      <VIA_t1_cnt_lo 
                    lda      #-2 
                    sta      Vec_Text_Height 
                    IRQ_TO_0_SHIFT  
                    jsr      Intensity_5F 
                    ldu      #gopoString 
                    ldd      #$50b8 
                    jsr      sync_Print_Str_d_fixed_8 
; return to caller
REPLACE_1_2_backFromGameOver0_varFromIRQ1_1 
                    ldx      #0                           ; backFromGameOver0 
                    jmp      jmpBankIRQ1Shift 

; not needed?
;showButtonToContinue ;#isfunction
;                    lda      #$7f
;                    sta      <VIA_t1_cnt_lo
;                    lda      #-2
;                    sta      Vec_Text_Height
;                    lda      #-2
;                    sta      Vec_Text_Width
;                    IRQ_TO_0_SHIFT
;                    jsr      Intensity_5F
;                    ldu      #buttonString
;                    ldd      #$b0b0
;                    jsr      sync_Print_Str_d_fixed_8
; return to caller
;REPLACE_1_2_backshowButton_varFromIRQ1_1
;                    ldx      #0                           ; backshowButton
;                    jmp      jmpBankIRQ1Shift
FontRow1_8: 
                    DB       %00111000, %00000000, %00111000, %01101100, %00000000 
                    DB       %00010000, %11000100, %01110000, %00110000, %00011000, %00110000 
                    DB       %00000000, %00000000, %00000000, %00000000, %00000000, %00000100 
                    DB       %00111000, %00011000, %01111100, %01111110, %00011100, %11111100 
                    DB       %00111100, %11111110, %01111000, %01111100, %00000000, %00000000 
                    DB       %00001100, %00000000, %01100000, %00111100, %00111000, %00111000 
                    DB       %11111100, %00111100, %11111000, %11111110, %11111110, %00111110 
                    DB       %11000110, %01111110, %00000110, %11000110, %11000000, %11000110 
                    DB       %11000110, %01111100, %11111100, %01111100, %11111100, %01111000 
                    DB       %01111110, %11000110, %11000110, %11000110, %11000110, %01100110 
                    DB       %11111110, %00111100, %10000000, %01111000, %00010000, %00000000 
                    DB       %00010000, %00111000, %00010000, %00010000, %00010000, %11111110 
FontRow2_8: 
                    DB       %01000100, %00000000, %00111000, %01101100, %01101100 
                    DB       %01111100, %11001100, %11011000, %00110000, %00110000, %00011000 
                    DB       %00010000, %00010000, %00000000, %00000000, %00000000, %00001100 
                    DB       %01001100, %00111000, %11000110, %00001100, %00111100, %11000000 
                    DB       %01100000, %11000110, %11000100, %11000110, %00110000, %00110000 
                    DB       %00011000, %00000000, %00110000, %01100110, %01000100, %01101100 
                    DB       %11000110, %01100110, %11001100, %11000000, %11000000, %01100000 
                    DB       %11000110, %00011000, %00000110, %11001100, %11000000, %11101110 
                    DB       %11100110, %11000110, %11000110, %11000110, %11000110, %11001100 
                    DB       %00011000, %11000110, %11000110, %11000110, %11101110, %01100110 
                    DB       %00001110, %00110000, %11000000, %00011000, %00111000, %00000000 
                    DB       %00111000, %00111000, %00110000, %00011000, %00111000, %10000010 
FontRow3_8: 
                    DB       %10011010, %00000000, %00111000, %01001000, %11111110 
                    DB       %11010000, %00011000, %11011000, %01100000, %01100000, %00001100 
                    DB       %01010100, %00010000, %00000000, %00000000, %00000000, %00011000 
                    DB       %11000110, %00011000, %00001110, %00011000, %01101100, %11111100 
                    DB       %11000000, %00001100, %11100100, %11000110, %00110000, %00110000 
                    DB       %00110000, %01111100, %00011000, %00000110, %10011010, %11000110 
                    DB       %11000110, %11000000, %11000110, %11000000, %11000000, %11000000 
                    DB       %11000110, %00011000, %00000110, %11011000, %11000000, %11111110 
                    DB       %11110110, %11000110, %11000110, %11000110, %11000110, %11000000 
                    DB       %00011000, %11000110, %11000110, %11010110, %01111100, %01100110 
                    DB       %00011100, %00110000, %01100000, %00011000, %01101100, %00000000 
                    DB       %01111100, %00111000, %01111110, %11111100, %01111100, %10000010 
FontRow4_8: 
                    DB       %10100010, %00000000, %00110000, %00000000, %01101100 
                    DB       %01111100, %00110000, %01110010, %00000000, %01100000, %00001100 
                    DB       %00111000, %01111100, %00000000, %01111100, %00000000, %00110000 
                    DB       %11000110, %00011000, %00111100, %00111100, %11001100, %00000110 
                    DB       %11111100, %00011000, %01111000, %01111110, %00000000, %00000000 
                    DB       %01100000, %00000000, %00001100, %00001100, %10101010, %11000110 
                    DB       %11111100, %11000000, %11000110, %11111100, %11111100, %11001110 
                    DB       %11111110, %00011000, %00000110, %11110000, %11000000, %11111110 
                    DB       %11111110, %11000110, %11000110, %11000110, %11001110, %01111100 
                    DB       %00011000, %11000110, %11101110, %11111110, %00111000, %00111100 
                    DB       %00111000, %00110000, %00110000, %00011000, %00000000, %00000000 
                    DB       %11111110, %11111110, %11111110, %11111110, %00000000, %10000010 
FontRow5_8: 
                    DB       %10011010, %00000000, %00110000, %00000000, %11111110 
                    DB       %00010110, %01100000, %11011110, %00000000, %01100000, %00001100 
                    DB       %01010100, %00010000, %00110000, %00000000, %00000000, %01100000 
                    DB       %11000110, %00011000, %01111000, %00000110, %11111110, %00000110 
                    DB       %11000110, %00110000, %10011110, %00000110, %00110000, %00110000 
                    DB       %00110000, %01111100, %00011000, %00011000, %10011100, %11111110 
                    DB       %11000110, %11000000, %11000110, %11000000, %11000000, %11000110 
                    DB       %11000110, %00011000, %00000110, %11111000, %11000000, %11010110 
                    DB       %11011110, %11000110, %11111100, %11011110, %11111000, %00000110 
                    DB       %00011000, %11000110, %01111100, %11111110, %01111100, %00011000 
                    DB       %01110000, %00110000, %00011000, %00011000, %00000000, %00000000 
                    DB       %00111000, %01111100, %01111110, %11111100, %01111100, %10000010 
FontRow6_8: 
                    DB       %01000100, %00000000, %00000000, %00000000, %01101100 
                    DB       %01111100, %11001100, %11001100, %00000000, %00110000, %00011000 
                    DB       %00010000, %00010000, %00110000, %00000000, %00110000, %11000000 
                    DB       %01100100, %00011000, %11100000, %11000110, %00001100, %11000110 
                    DB       %11000110, %00110000, %10000110, %00001100, %00110000, %00110000 
                    DB       %00011000, %00000000, %00110000, %00000000, %01000000, %11000110 
                    DB       %11000110, %01100110, %11001100, %11000000, %11000000, %01100110 
                    DB       %11000110, %00011000, %11000110, %11011100, %11000000, %11000110 
                    DB       %11001110, %11000110, %11000000, %11001100, %11011100, %11000110 
                    DB       %00011000, %11000110, %00111000, %11101110, %11101110, %00011000 
                    DB       %11100000, %00110000, %00001100, %00011000, %00000000, %00000000 
                    DB       %00111000, %00111000, %00110000, %00011000, %00111000, %10000010 
FontRow7_8: 
                    DB       %00111000, %00000000, %00110000, %00000000, %00000000 
                    DB       %00010000, %10001100, %01110110, %00000000, %00011000, %00110000 
                    DB       %00000000, %00000000, %01100000, %00000000, %00110000, %10000000 
                    DB       %00111000, %01111110, %11111110, %01111100, %00001100, %01111100 
                    DB       %01111100, %00110000, %01111100, %01111000, %00000000, %01100000 
                    DB       %00001100, %00000000, %01100000, %00011000, %00111000, %11000110 
                    DB       %11111100, %00111100, %11111000, %11111110, %11000000, %00111110 
                    DB       %11000110, %01111110, %01111100, %11001110, %11111110, %11000110 
                    DB       %11000110, %01111100, %11000000, %01111010, %11001110, %01111100 
                    DB       %00011000, %01111100, %00010000, %11000110, %11000110, %00011000 
                    DB       %11111110, %00111100, %00000100, %01111000, %00000000, %11111110 
                    DB       %00111000, %00010000, %00010000, %00010000, %00010000, %11111110 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; zero delay is needed for zeroing to work correctly
; depends on the distance of the current integrator position to actual zero point
; experiment with my vectri:
;ZERO ing the integrators takes time. Measures at my vectrex show e.g.:
;If you move the beam with a to x = -127 and y = -127 at diffferent scale values, the time to reach zero:
;- scale $ff -> zero 110 cycles
;- scale $7f -> zero 75 cycles
;- scale $40 -> zero 57 cycles
;- scale $20 -> zero 53 cycles
ZERO_DELAY_P        EQU      2                            ; delay 7 counter is exactly 111 cycles delay between zero SETTING and zero unsetting (in moveto_d) 
                    direct   $d0 
FONT_LENGTH_8       EQU      ((FontRow2_8-FontRow1_8)) 
FONT_START_A_8      EQU      FontRow1_8 + 1 -$20          ; // space is 1 
FONT_END_8          EQU      FONT_START_A_8+6*FONT_LENGTH_8 
sync_Print_Str_d_fixed_8 
sync_Print_Str_d_8                                        ;#isfunction  
; put move position on stack put it so, that we can load "d" directly from stack
                    pshs     d 
                    STU      Vec_Str_Ptr                  ;Save string pointer 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                    LDX      #FONT_START_A_8              ;Point to start of chargen bitmaps 
                    lda      #$cc 
                    sta      <VIA_cntl                    ; store zeroing values to cntl 
next_line_a_8: 
; zero
                    ldd      #(%10000010)*256+$00         ; zero the integrators 
; reset integrators
                                                          ;;;; clr <VIA_port_a ; reset integrator offset 
                                                          ; lda #%10000010 
; wait that zeroing surely has the desired effect!
                    stb      <VIA_port_a 
                    sta      <VIA_port_b 
                    ldb      #ZERO_DELAY_P                ; and wait for zeroing to be actually done 
                    inca     
                    sta      <VIA_port_b 
zeroLoop_a_8: 
                                                          ;;;; sta <VIA_port_b ; while waiting, zero offsets 
                    decb     
                    bne      zeroLoop_a_8 
                                                          ;;;; inc <VIA_port_b 
                    ldd      ,s 
;;;;;;;
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    LDU      Vec_Str_Ptr                  ;Point to start of text string 
                    MY_MOVE_TO_A_END  
;;;;;;;
Print_Str_a_8: 
                    LDD      #$1881                       ;AUX: b→ORB: $8x = Disable RAMP, Disable Mux, mux sel = 01 (int offsets) 
                    STB      <VIA_port_b                  ;ramp off/on set mux to channel 1 
                    STA      <VIA_aux_cntl                ;Shift reg mode = 110 (shift out under system clock), T1 PB7 disabled, one shot mode 
                    CLR      <VIA_port_a                  ;Clear D/A output 
                                                          ; first entry here, ramp is disabled 
                                                          ; if there was a jump from below 
                                                          ; ramp will be enabled by next line 
PLAYERONESIZE       =        0x58 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    decb     
                    stb      <VIA_port_b                  ;Enable mux 
                    incb     
                    stb      <VIA_port_b                  ;Disable mux 
                    ldd      #PLAYERONESIZE*256+01 
 else  
                    DEC      <VIA_port_b                  ;Enable mux 
                    ldd      #PLAYERONESIZE*256+01 
                    INC      <VIA_port_b                  ;Disable mux 
 endif  
                    STA      <VIA_port_a                  ;Send it to the D/A 
                    STb      <VIA_port_b                  ;[4]enable RAMP, disable mux (start moving) 
                    BRA      LF4CB_a8                     ;[3] 

; one letter is drawn (one row that is) in 18 cycles
; 13 cycles overhead
; ramp is thus active for #ofLetters*18 + 13 cycles
LF4C7_a8: 
                    LDA      A,X                          ;[+5]Get bitmap from chargen table 
                    STA      <VIA_shift_reg               ;[+4]rasterout of char bitmap "row" thru shift out in shift register 
LF4CB_a8: 
                    LDA      ,U+                          ;[+6]Get next character 
                    BPL      LF4C7_a8                     ;[+3]Go back if not terminator 
                    CMPX     #FONT_END_8                  ;[4]Check for last row 
                    BEQ      LF50A_a8                     ;[3]Branch if last row 
                    LEAX     FONT_LENGTH_8,X              ;[3]Point to next chargen row 
                    LDD      #$98cc 
                    STD      <VIA_aux_cntl                ;PB7 enabled 
                    lda      Vec_Text_Height 
                    adda     ,s 
                    sta      ,s 
                    BRA      next_line_a_8                ;Go back for next scan line 

LF50A_a8: 
                    ldd      #$98 
                    sta      <VIA_shift_reg 
                    STb      <VIA_aux_cntl                ;T1→PB7 enabled 
                    puls     d ,pc                        ; all done, correct stack 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
initAchievementValues                                     ;#isfunction  
                    lda      #1 
                    sta      playerNumberOfBulletsPerShot 
                    lda      achievements + 0 
                    bita     #ACHIEVEMENT_FLAG_BYTE1_SNIPER_RANK3 
                    beq      notSniperRank3 
                    inc      playerMaxShotInAir 
notSniperRank3 
                    bita     #ACHIEVEMENT_FLAG_BYTE1_SNIPER_RANK2 
                    beq      notSniperRank2 
                    inc      playerMaxShotInAir 
notSniperRank2 
                    bita     #ACHIEVEMENT_FLAG_BYTE1_SNIPER_RANK1 
                    beq      notSniperRank1 
                    inc      playerMaxShotInAir 
notSniperRank1 
                    bita     #ACHIEVEMENT_FLAG_BYTE1_SCORER_RANK5 
                    beq      notScorerRank5 
                    ldd      playerSpeed 
                    addd     #SPEED_DELTA 
                    addd     #SPEED_DELTA 
                    std      playerSpeed 
                    lda      achievements + 0 
notScorerRank5 
                    bita     #ACHIEVEMENT_FLAG_BYTE1_SCORER_RANK4 
                    beq      notScorerRank4 
                    ldd      playerSpeed 
                    addd     #SPEED_DELTA 
                    addd     #SPEED_DELTA 
                    std      playerSpeed 
                    lda      achievements + 0 
notScorerRank4 
                    bita     #ACHIEVEMENT_FLAG_BYTE1_SCORER_RANK3 
                    beq      notScorerRank3 
                    ldd      playerSpeed 
                    addd     #SPEED_DELTA 
                    addd     #SPEED_DELTA 
                    std      playerSpeed 
                    lda      achievements + 0 
notScorerRank3 
                    bita     #ACHIEVEMENT_FLAG_BYTE1_SCORER_RANK2 
                    beq      notScorerRank2 
                    ldd      playerSpeed 
                    addd     #SPEED_DELTA 
                    addd     #SPEED_DELTA 
                    std      playerSpeed 
                    lda      achievements + 0 
notScorerRank2 
                    bita     #ACHIEVEMENT_FLAG_BYTE1_SCORER_RANK1 
                    beq      notScorerRank1 
                    ldd      playerSpeed 
                    addd     #SPEED_DELTA 
                    addd     #SPEED_DELTA 
                    std      playerSpeed 
                    lda      achievements + 0 
notScorerRank1 
                    lda      achievements + 1 
                    bita     #ACHIEVEMENT_FLAG_BYTE2_COLLECTOR_RANK5 
                    beq      notCollectorRank5 
                    ldd      playerCashW 
                    addd     #100 
                    std      playerCashW 
notCollectorRank5 
                    lda      achievements + 1 
                    bita     #ACHIEVEMENT_FLAG_BYTE2_COLLECTOR_RANK4 
                    beq      notCollectorRank4 
                    ldd      playerCashW 
                    addd     #100 
                    std      playerCashW 
notCollectorRank4 
                    lda      achievements + 1 
                    bita     #ACHIEVEMENT_FLAG_BYTE2_COLLECTOR_RANK3 
                    beq      notCollectorRank3 
                    ldd      playerCashW 
                    addd     #100 
                    std      playerCashW 
notCollectorRank3 
                    lda      achievements + 1 
                    bita     #ACHIEVEMENT_FLAG_BYTE2_COLLECTOR_RANK2 
                    beq      notCollectorRank2 
                    ldd      playerCashW 
                    addd     #200 
                    std      playerCashW 
notCollectorRank2 
                    lda      achievements + 1 
                    bita     #ACHIEVEMENT_FLAG_BYTE2_COLLECTOR_RANK1 
                    beq      notCollectorRank1 
                    ldd      playerCashW 
                    addd     #250 
                    std      playerCashW 
notCollectorRank1 
                    lda      achievements + 1 
                    bita     #ACHIEVEMENT_FLAG_BYTE2_GREEDY 
                    beq      notGreedy 
                    inc      playerNumberOfBulletsPerShot 
notGreedy 
                    lda      achievements + 5 
                    bita     #ACHIEVEMENT_FLAG_BYTE6_MINESTORM_FALCON 
                    beq      notFalcon 
                    inc      playerNumberOfBulletsPerShot 
notFalcon 
                    lda      achievements + 3 
                    bita     #ACHIEVEMENT_FLAG_BYTE4_OFFICER_RANK4 
                    beq      notOfficerRank4 
                    ldb      #BITFIELD_ARMOR 
                    stb      playerBonusActive 
notOfficerRank4 
                    lda      achievements + 3 
                    bita     #ACHIEVEMENT_FLAG_BYTE4_OFFICER_RANK2 
                    beq      notOfficerRank2 
                    ldb      diverseFlags 
                    orb      #BIT_FLAG_AUTOFIRE 
                    stb      diverseFlags 
notOfficerRank2 
                    lda      achievements + 3 
                    bita     #ACHIEVEMENT_FLAG_BYTE4_OFFICER_RANK1 
                    beq      notOfficerRank1 
                    ldd      bonusTimerLength 
                    addd     #500                         ; add 10 seconds 
                    std      bonusTimerLength 
notOfficerRank1 
                    lda      achievements + 3 
                    bita     #ACHIEVEMENT_FLAG_BYTE4_SPY_RANK4 
                    beq      notSpyRank4 
                    inc      smartBombsAvailable 
notSpyRank4 
                    lda      achievements + 4 
                    bita     #ACHIEVEMENT_FLAG_BYTE5_CHALLENGER_RANK4 
                    beq      notChallengerRank4 
                    ldd      playerShotSpeed 
                    addd     #SPEED_DELTA 
                    addd     #SPEED_DELTA 
                    std      playerShotSpeed 
notChallengerRank4 
                    lda      achievements + 4 
                    bita     #ACHIEVEMENT_FLAG_BYTE5_CHALLENGER_RANK3 
                    beq      notChallengerRank3 
                    ldd      playerShotSpeed 
                    addd     #SPEED_DELTA 
                    addd     #SPEED_DELTA 
                    std      playerShotSpeed 
notChallengerRank3 
                    lda      achievements + 4 
                    bita     #ACHIEVEMENT_FLAG_BYTE5_CHALLENGER_RANK2 
                    beq      notChallengerRank2 
                    ldd      playerShotSpeed 
                    addd     #SPEED_DELTA 
                    addd     #SPEED_DELTA 
                    std      playerShotSpeed 
notChallengerRank2 
                    lda      achievements + 4 
                    bita     #ACHIEVEMENT_FLAG_BYTE5_CHALLENGER_RANK1 
                    beq      notChallengerRank1 
                    ldd      playerShotSpeed 
                    addd     #SPEED_DELTA 
                    addd     #SPEED_DELTA 
                    std      playerShotSpeed 
notChallengerRank1 
                    rts      

initLevelInt0 
                    lda      #ANIMATION_DELAY 
                    sta      eyeLeftAnimDelayCounter 
                    sta      animDelayCounter 
                    lda      diverseFlags 
                    anda     #%00100001                   ; moneey rollover must be saved 
                    sta      diverseFlags 
                    ldd      #0 
                    sta      eyeLeftAnimCounter 
                    sta      bonusHitCount 
                    sta      bonusSpawnCount 
                    sta      playerAnim 
                    sta      playAnimDelayCounter 
                    std      testShot 
                    std      test2Shot 
                    std      bulletSpawnAt 
                    std      bonusSpawnPosition 
                    sta      introWaveEnemyCount 
                    sta      introWaveCurrentPatternCount 
                    sta      levelEnemyCount 
                    sta      levelEnemyCountUID 
                    sta      playerShotCount 
                    sta      starCount 
                    sta      enemyCount 
                    sta      patternDelayCounter 
                    sta      globalPatternWobble 
                    sta      globalPatternWobbleDirection 
                    sta      explosionSound 
                    sta      lightningOn 
                    sta      playerWasHitFor 
                    sta      attackPatternCount 
                    sta      attackPatternInitiated 
                    rts      

;..................................................
MY_DIV_D_BY_TMP1_TO_B_UNSIGNED  macro  
                    CLR      divide_tmp 
                    TST      tmp_div1+1 
                    BEQ      divide_by_zero\? 
                    DEC      divide_tmp 
                    CMPD     #0 
                    BPL      divide_next\? 
divide_next1\?: 
                    INC      divide_tmp 
                    ADDD     tmp_div1 
                    BMI      divide_next1\? 
divide_by_zero1\?: 
                    LDB      divide_tmp 
                    NEGB     
                    BRA      divide_end\? 

divide_next\?: 
                    INC      divide_tmp 
                    SUBD     tmp_div1 
                    BPL      divide_next\? 
divide_by_zero\?: 
                    LDB      divide_tmp 
divide_end\?: 
                    endm     
calcHitPercentage 
;playerShotCountW    ds       2                            ; statistics
;playerHitCountW     ds       2
                    clr      tmp_div1 
                    ldb      #100 
                    stb      tmp_div1+1 
                    ldd      playerShotCountW 
                    MY_LSR_D  
                    MY_LSR_D                              ; divide by four - ensures divide by 100 is 8 bit value, max 164 
                                                          ; divide count by 100 
                    MY_DIV_D_BY_TMP1_TO_B_UNSIGNED  
                    clr      tmp_div1 
                    stb      tmp_div1 + 1                 ; that is our new divider 
                    ldd      playerHitCountW 
                    MY_LSR_D  
                    MY_LSR_D                              ; divide by four - same "size" as shot count 
                                                          ; divide shotcount 
                    MY_DIV_D_BY_TMP1_TO_B_UNSIGNED  
                                                          ; in b percentage hit! 
                    stb      tmp_div1                     ; remember! 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
getSecretCount 
                    clrb                                  ; count seccrets found NOW 
                    lda      inGameSecrets 
                    lsra     
                    bcc      noSecret1 
                    incb     
noSecret1 
                    lsra     
                    bcc      noSecret2 
                    incb     
noSecret2 
                    lsra     
                    bcc      noSecret3 
                    incb     
noSecret3 
                    lsra     
                    bcc      noSecret4 
                    incb     
noSecret4 
                    lsra     
                    bcc      noSecret5 
                    incb     
noSecret5 
                    lsra     
                    bcc      noSecret6 
                    incb     
noSecret6 
                    lsra     
                    bcc      noSecret7 
                    incb     
noSecret7 
secretCount         =        enemyCount 
                    stb      secretCount 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
doWheelReward 
                    jmp      [,u] 

rewardTable 
                    dw       laserReward 
                    dw       moneyReward 
                    dw       secretReward 
                    dw       equipReward 
                    dw       livesReward 
                    dw       powerReward 
                    dw       lockReward 
                    dw       immunReward 
                    dw       scoreReward 
                    dw       timeReward 
                    dw       bombReward 
; todo do real reward
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
secretReward                                              ;        reward three sectrets 
; scoopy lock
                    lda      lockPurchased 
                    ora      #%00010000 
                    sta      lockPurchased                ; shield for scoopies! (once) 
; money sucker
                    lda      inGameSecrets 
                    ora      #SECRET_3_FIFTY 
                    sta      inGameSecrets 
; extra stats
                    lda      inGameSecrets 
                    ora      #SECRET_3_BULLET_SUCKERS 
                    sta      inGameSecrets 
;                    jmp      goBackBandint
REPLACE_1_2_goBackBandint_varFrom0_1 
                    ldx      #0                           ; goBackBandint 
                    jmp      jmpBank2_from0 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
immunReward 
                    lda      downgradeImmunity 
                    ora      #2                           ; immunity 1+2 
                    sta      downgradeImmunity 
;                    jmp      goBackBandint
REPLACE_1_2_goBackBandint_varFrom0_2 
                    ldx      #0                           ; goBackBandint 
                    jmp      jmpBank2_from0 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
equipReward 
                    lda      diverseFlags 
                    ora      #BIT_FLAG_AUTOFIRE 
                    sta      diverseFlags 
                    ldd      #MAX_SHOT_SPEED 
                    std      playerShotSpeed 
                    lda      #MAX_PLAYERSHOT_OBJECTS 
                    sta      playerMaxShotInAir 
                    ldd      #MAX_PLAYER_SPEED 
                    std      playerSpeed 
                    lda      smartBombsAvailable 
                    adda     #10 
                    sta      smartBombsAvailable 
                    lda      #BITFIELD_ARMOR 
                    sta      playerBonusActive 
;                    jmp      goBackBandint
REPLACE_1_2_goBackBandint_varFrom0_3 
                    ldx      #0                           ; goBackBandint 
                    jmp      jmpBank2_from0 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bombReward 
                    lda      #99 
                    sta      smartBombsAvailable 
REPLACE_1_2_goBackBandint_varFrom0_41 
                    ldx      #0                           ; goBackBandint 
                    jmp      jmpBank2_from0 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
timeReward 
                    ldd      bonusTimerLength 
                    addd     #4500                        ; add 1,5 minutes 
                    bpl      timeOkoo 
                    ldd      #$7fff                       ; maximum timer! 
timeOkoo 
                    std      bonusTimerLength 
;                    jmp      goBackBandint
REPLACE_1_2_goBackBandint_varFrom0_43 
                    ldx      #0                           ; goBackBandint 
                    jmp      jmpBank2_from0 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
lockReward 
                    lda      lockPurchased 
                    ora      #%00000111 
                    sta      lockPurchased 
;                    jmp      goBackBandint
REPLACE_1_2_goBackBandint_varFrom0_55 
                    ldx      #0                           ; goBackBandint 
                    jmp      jmpBank2_from0 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
powerReward 
                    lda      #MAX_BULLET_POWER_ADJUST 
                    sta      bulletDamageAdjust 
;                    jmp      goBackBandint
REPLACE_1_2_goBackBandint_varFrom0_6 
                    ldx      #0                           ; goBackBandint 
                    jmp      jmpBank2_from0 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
livesReward 
                    lda      # '9'
                    sta      playerLives                  ; not more than 9 lives! 
;                    jmp      goBackBandint
REPLACE_1_2_goBackBandint_varFrom0_7 
                    ldx      #0                           ; goBackBandint 
                    jmp      jmpBank2_from0 

scoreReward 
; score instead of lives!
; add one million (without multiply)
                    inc      player_score_6 
                    ldy      #player_score 
REPLACE_1_2_addScoreBack11_varFrom1_701                   ;  make sure score is in printable format 
                    ldx      #0                           ;addScoreBack11 
                    jsr      jsrBank3_from0_SHIFT 
;                    jmp      goBackBandint
REPLACE_1_2_goBackBandint_varFrom0_8 
                    ldx      #0                           ; goBackBandint 
                    jmp      jmpBank2_from0 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
moneyReward 
                    ADD_CASH  5000 
;                    jmp      goBackBandint
REPLACE_1_2_goBackBandint_varFrom0_9 
                    ldx      #0                           ; goBackBandint 
                    jmp      jmpBank2_from0 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
laserReward 
                    lda      #6 
                    sta      playerNumberOfBulletsPerShot 
                    lda      diverseFlags 
                    ora      #BIT_FLAG_AUTOFIRE 
                    sta      diverseFlags                 ; also enable autofire! 
;                    jmp      goBackBandint
REPLACE_1_2_goBackBandint_varFrom0_10 
                    ldx      #0                           ; goBackBandint 
                    jmp      jmpBank2_from0 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
initDemo                                                  ;#isfunction  
                    ldd      #0 
                    std      Vec_Loop_Count 
; timer three minutes
                    ldd      #50*180 
                    std      bonusTimerLength 
                    std      playerBonusCounter 
; enable shield
                    lda      #BITFIELD_SHIELD 
                    sta      playerBonusActive 
; enable scoopy shield
                    lda      #%00110000 
                    sta      lockPurchased                ; shield for scoopies! (once) 
; shot speed
                    ldd      #1025 
                    std      playerShotSpeed 
; 4 shot
                    lda      #4                           ; 6 max 
                    sta      playerNumberOfBulletsPerShot 
; 10 bullets
                    lda      #MAX_PLAYERSHOT_OBJECTS      ; 10 max 
                    sta      playerMaxShotInAir 
                    ADJUST_SHOT_RADIUS  
; fighter speed
                    ldd      #900 
                    std      playerSpeed                  ; 255 = 1 "pixel" per move 
; autofire
                    lda      #1 
                    sta      diverseFlags                 ; that is autofire only 
; difficulty - hard
                    lda      #2 
                    sta      difficulty 
; level to play
 if  ENDLESS_DEMO = 1 
                    lda      #MULTIPLY_1_AND 
                    sta      downgradeImmunity 
                    lda      #0 
                    sta      difficulty 
                    lda      #31 
 else  
                    lda      #94 
 endif  
                    sta      levelCount 
                    ldd      #10000                       ; money that sucker can be seen! 
                    std      playerCashW 
                    rts      

initGame0                                                 ;#isfunction  
                    lda      flashAvailable 
                    anda     #$ff - SAVEGAME_IS_ACTIVE_BIT ; a new game is no saved game! 
                    sta      flashAvailable 
                    ldd      #$f850 
                    std      Vec_Text_HW 
                    clr      diamondCount 
                    ldd      #0 
                    std      levelsPlayed 
                    clr      inGameSecrets 
 if  INGAMESECRETS = 0 
 else  
                    lda      #INGAMESECRETS 
                    sta      inGameSecrets 
 endif  
                    lda      #1 
                    clr      lastCollectedBonus 
                    clr      secretBonusCounter 
                    clr      bulletDamageAdjust 
 if  START_POWER = 0 
 else  
                    lda      #START_POWER 
                    sta      bulletDamageAdjust 
 endif  
                    clr      rankCollected 
                    clr      doWarpFailure 
                    clr      officerRankTmp 
; reset multiplyer
; lda #MULTIPLY_1_OR
; lda multiplyer ; !!! == downgradeImmunity
 if  IMMUNITY_START = 0 
                    lda      difficulty 
                    anda     #$f 
                    cmpa     #2 
                    blo      noImmunDelta 
                    lda      #2 
noImmunDelta 
 else  
                    lda      #IMMUNITY_START 
 endif  
                    ora      #MULTIPLY_1_OR 
                    sta      downgradeImmunity 
; todo setup correctly from SAVE
; clr downgradeImmunity ; 1 = immunity to downgrade from level 1 shots (on capture - not shop)
                    ldd      #START_TIMER_MAX 
                    std      bonusTimerLength 
                    ldd      # "00"
                    std      player_score_6 
                    std      player_score_4 
                    std      player_score_2 
                    sta      player_score_0 
                    lda      #$80 
                    sta      player_score_80 
                    sta      playerLivesString+3 
                    ldd      # "  "
                    std      playerLivesString 
                    lda      # '0'+PLAYER_START_LIVES
                    ldb      difficulty 
                    bpl      nonhclives 
                    lda      # '1'
nonhclives 
                    sta      playerLives 
                    ldd      #DEAFULT_START_MONEY 
                    std      playerCashW 
                    lda      #LOCK_START 
                    sta      lockPurchased                ; lock + warp lock 
                    ldd      #0 
                    sta      drunkTimer 
                    sta      perfectBonus 
                    std      multTimer 
                    sta      secretBonusCounter 
                    sta      smartBombsAvailable 
                    std      currentLevelPointer 
                    sta      playerBonusActive 
                    clr      diverseFlags 
 if  AUTO_FIRE = 1 
                    inc      diverseFlags                 ; that is autofire only 
 endif  
                                                          ; inc diverseFlags ; that is autofire only 
                    std      scoopEnemy1 
                    std      scoopEnemy2 
                    sta      rightSmallGunAnimStart 
                    sta      leftSmallGunAnimStart 
                    sta      rightBigGunAnimStart 
                    sta      leftBigGunAnimStart 
                    sta      eyeLeftAnimCounter 
                    sta      messageState                 ; normal 
                    sta      colorCycleCount 
                    std      playerXpos 
                    sta      bonusDisplay 
                    std      playerShotCountW 
                    std      playerHitCountW 
                    sta      tmp1 
                    lda      #START_SHOT_NUMBER           ; 10 max 
                    sta      playerMaxShotInAir 
                    lda      #START_SHOT_WIDTH            ; 6 max 
                    sta      playerNumberOfBulletsPerShot 
                    ldd      #START_SHOT_SPEED 
                    std      playerShotSpeed 
                    ADJUST_SHOT_RADIUS  
                    ldd      #START_FIGHTER_SPEED 
                    std      playerSpeed                  ; 255 = 1 "pixel" per move 
; initialize the empty object list
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; BONUS
                    clr      bonusCollect 
                    clr      bonusDisplay 
 if  TESTING = 1 
 if  START_LEVEL = 0 
                    lda      chosenStartLevel 
 else  
                    lda      #START_LEVEL 
 endif  
 else  
                    lda      chosenStartLevel 
 endif  
 if  CORRECT_START_LEVEL = 1 
                    cmpa     #25-1 
                    bne      notBoss1 
                    inca     
notBoss1 
                    cmpa     #50-1+1 
                    bne      notBoss2 
                    inca     
notBoss2 
                    cmpa     #75-1+2 
                    bne      notBoss3 
                    inca     
notBoss3 
                    cmpa     #100-1+2 
                    blo      notBoss4 
                    clra     
notBoss4 
; if == 25 than +1
; if == 51 than +1
; if == 77 than +1
 endif  
                    sta      levelCount 
 if  TESTING = 1 
                    lda      #SMARTBOMB_COUNT 
                    sta      smartBombsAvailable 
                    lda      #DIAMOND_COUNT 
                    sta      diamondCount 
 endif  
                    rts      

                    include  "sound.asm"
                    include  "smartlist/drawListScale7NoShift.asm"
                    include  "smartlist/drawListScale16NoShift.asm"
                    include  "smartlist/drawListScale50NoShift.asm"
                    include  "dodger.asm"
                    include  "desktop.asm"
                    include  "boss1Code.asm"
                    include  "boss2Code.asm"
                    include  "boss3Code.asm"
                    include  "boss4Code.asm"
                    include  "help.asm"
                    include  "calibration.asm"
;***************************************************************************
 if  TEST_VOX = 1 
                    include  "ser_ji.i"
                    include  "vecvox.i"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
copySpeechPattern_xu 
                    lda      ,x+ 
                    beq      copySpeechDone 
                    jsr      ser_txbyte                   ; send byte 
                    jsr      delayOutput 
                    bra      copySpeechPattern_xu 

copySpeechDone 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; returns 1 if != 0
; 0 if == 0
; in u pointer to generated speech area
; in y pointer to 10th
do_0_99 
; in b now 0-99
                    cmpb     #100 
                    bne      normalVox 
                    ldx      #one 
                    bsr      copySpeechPattern_xu 
                    ldx      #hundred 
                    bra      copySpeechPattern_xu 

normalVox 
                    tstb     
                    lbeq     none_0_99 
                    cmpb     #90 
                    blt      noNinety 
                    subb     #90 
                    pshs     b 
                    ldx      #ninety 
                    bsr      copySpeechPattern_xu 
                    puls     b 
                    bra      doSingles 

noNinety 
                    cmpb     #80 
                    blt      noEighty 
                    subb     #80 
                    pshs     b 
                    ldx      #eighty 
                    bsr      copySpeechPattern_xu 
                    puls     b 
                    bra      doSingles 

noEighty 
                    cmpb     #70 
                    blt      noSeventy 
                    subb     #70 
                    pshs     b 
                    ldx      #seventy 
                    bsr      copySpeechPattern_xu 
                    puls     b 
                    bra      doSingles 

noSeventy 
                    cmpb     #60 
                    blt      noSixty 
                    subb     #60 
                    pshs     b 
                    ldx      #sixty 
                    bsr      copySpeechPattern_xu 
                    puls     b 
                    bra      doSingles 

noSixty 
                    cmpb     #50 
                    blt      noFifty 
                    subb     #50 
                    pshs     b 
                    ldx      #fifty 
                    bsr      copySpeechPattern_xu 
                    puls     b 
                    bra      doSingles 

noFifty 
                    cmpb     #40 
                    blt      noFourty 
                    subb     #40 
                    pshs     b 
                    ldx      #fourty 
                    jsr      copySpeechPattern_xu 
                    puls     b 
                    bra      doSingles 

noFourty 
                    cmpb     #30 
                    blt      noThrirty 
                    subb     #30 
                    pshs     b 
                    ldx      #thirty 
                    jsr      copySpeechPattern_xu 
                    puls     b 
                    bra      doSingles 

noThrirty 
                    cmpb     #20 
                    blt      noTwenty 
                    subb     #20 
                    pshs     b 
                    ldx      #twenty 
                    jsr      copySpeechPattern_xu 
                    puls     b 
                    bra      doSingles 

noTwenty 
                    bra      doSingles 

none_0_99 
                    clra     
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; value in b
; returns 1 in b if != 0
; return 0 in b if == 0
doSingles 
                    tstb     
                    beq      noSingles 
                    ldx      #tab1 
                    aslb     
                    ldx      b,x 
                    jsr      copySpeechPattern_xu 
                    ldd      #$0101 
noSingles: 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
levelSpeech 
                                                          ; output VOICE PATTERNS 
                                                          ; output LEVEL 
                                                          ; output number 
                                                          ; output EOF 
                    IRQ_TO_0_SHIFT  
                    ldx      #voxLevel 
                                                          ; output till pointer = 5 ; pause 
lNextByte 
                    lda      ,x+ 
                    beq      levelOutPutDone 
                    jsr      ser_txbyte                   ; send byte 
                    jsr      delayOutput 
                    bra      lNextByte 

levelOutPutDone 
                    ldb      levelCount 
                    incb     
                    cmpb     #25 
                    blo      levelOk 
                    decb     
                    cmpb     #50 
                    blo      levelOk 
                    decb     
                    cmpb     #75 
                    blo      levelOk 
                    decb     
levelOk 
                    jsr      do_0_99 
                    rts      

BONUS_VOICE         macro    
                    db       31, 8, 22, 238, 23, 7 
                    endm     
voxRun 
                    db       22, 70, 23, 5, 148, 134, 141, 141, 141, 255 ;\PITCH \70 \BEND \5 \RR \UX \NE 
voxCoward 
                    db       22, 70, 23, 5, 14, 195, 8, 136, 147, 7, 151, 175, 255 ;\PITCH \70 \BEND \5 \STRESS \KO \SLOW \AW \WW \FAST \AXRR \DO 
voxIHunger 
                    db       22, 65, 23, 5, 14, 8, 157, 6, 6, 8, 20, 120, 184, 22, 55, 8, 134, 20, 96, 8, 8, 143, 8, 143, 22, 65, 8, 178, 8, 8, 148, 148, 148, 255 
;\PITCH \65 \BEND \5 \STRESS
;\SLOW \OHIH \P6 \P6 \SLOW
;\VOLUME \120 \HO \PITCH \55
;\SLOW \UX \VOLUME \96 \SLOW
;\SLOW \NGE \SLOW \NGE \PITCH
;\65 \SLOW \GE \SLOW \SLOW
;\RR \RR \RR \VOX_TERM
voxBeware 
                    db       22, 65, 23, 5, 14, 8, 171, 8, 129, 8, 147, 8, 133, 22, 75, 8, 148, 255 
voxBonus 
                    BONUS_VOICE  
                    db       173, 7, 164, 142, 139, 187, 255 ;\SOFT \PITCH \190 \OB \FAST \OWWW \NO \UW \SE 
voSingleShot 
                    BONUS_VOICE  
                    db       187, 7, 129, 144, 145, 5, 5, 8, 8, 189, 189, 7, 137, 191, 255 
;\RESET \SLOW \PITCH \98 \BEND \2
;\SE \FAST \IH \NGO \LE
;\P5 \P5 \SLOW \SLOW \SH \SH \FAST
; \OW \TT
voxDoubleShot 
                    BONUS_VOICE  
                    db       175, 7, 134, 173, 138, 7, 145, 5, 5, 8, 8, 189, 189, 7, 137, 191, 255 
;\RESET \SLOW \PITCH \98 \BEND \2
;\DO \FAST \UX \OB \UH \FAST \LE
;\P5 \P5 \SLOW \SLOW \SH \SH \FAST
; \OW \TT
voxMoney 
                    db       255 
; BONUS_VOICE
; db  140, 134, 141, 128, 255
;\RESET \SLOW \PITCH \98 \BEND
;\2 \MM \UX \NE \IY
voxScoop 
                    BONUS_VOICE  
                    db       187, 195, 139, 199 , 255 
;\RESET \SLOW \PITCH \98 \BEND
;\2 \SE \KO \UW \PO
;\VOX_TERM
voxRankMarker 
                    BONUS_VOICE  
                    db       148, 132, 144, 195, 5, 140, 136, 148, 195, 151, 255 
;\RESET \SLOW \PITCH \98 \BEND
;\2 \RR \AY \NGO \KO
;\P5 \MM \AW \RR \KO
;\AXRR \VOX_TERM
voxExtraLetter 
                    BONUS_VOICE  
                    db       130, 194, 187, 191, 7, 148, 7, 133, 5, 5, 145, 131, 191, 133, 148, 255, 255 
;\RESET \SLOW \PITCH \98 \BEND \2
;\EY \KE \SE \TT \FAST \RR \FAST \AX
;\P5
;\P5 \LE \EH \TT \AX
;\RR \VOX_TERM
voxFighterSpeed 
                    BONUS_VOICE  
                    db       186, 155, 191, 148, 5, 187, 199, 128, 174, 255 
;\RESET \SLOW \PITCH \98 \BEND
;\2 \FF \OHIY \TT \RR
;\P5 \SE \PO \IY \DE
;\VOX_TERM
voxShotSpeed 
                    BONUS_VOICE  
                    db       8, 8, 189, 189, 7, 137, 191, 187, 199, 128, 174, 255 
;\RESET \SLOW \PITCH \98 \BEND
;\2 \SLOW \SLOW \SH \SH
;\FAST \OW \TT \SE \PO
;\IY \DE \VOX_TERM
voxExtraBullet 
                    BONUS_VOICE  
                    db       130, 194, 187, 191, 7, 148, 7, 133, 5, 171, 7, 138, 145, 131, 191, 255, 255 
;\RESET \SLOW \PITCH \98 \BEND
;\2 \EY \KE \SE \TT
;\FAST \RR \FAST \AX \P5
;\BO \FAST \UH \LE \EH \TT
;\VOX_TERM
voxSucker 
                    BONUS_VOICE  
                    db       8, 188, 134, 195, 151, 5, 255, 255 
;\RESET \SLOW \PITCH \98 \BEND
;\SLOW \SO \UX \KO \AXRR
;\P5 \VOX_TERM \VOX_TERM
voxShield 
                    BONUS_VOICE  
                    db       8, 189, 8, 128, 145, 176, 255, 255 
;\RESET \SLOW \PITCH \98 \BEND
;\slow \SH \slow \IY \LE \ed
;\VOX_TERM
voxArmor 
                    BONUS_VOICE  
                    db       8, 152, 8, 140, 8, 153, 255 
;\RESET \SLOW \PITCH \98 \BEND
;\slow \AWRR  \slow \MM \slow \OWRR
;\VOX_TERM
voxMinestorm 
                    BONUS_VOICE  
                    db       8, 140, 157, 7, 141, 7, 142, 187, 191, 7, 153, 148, 8, 140, 5, 255 
;\RESET \SLOW \PITCH \98 \BEND
;\SLOW \MM \OHIH \FAST \NE
;\FAST \NO \SE \TT \FAST
;\OWRR \RR \SLOW \MM \P5
;\VOX_TERM
voxMultiply 
                    BONUS_VOICE  
                    db       8, 140, 7, 136, 145, 191, 129, 199, 145, 155, 255 
;\RESET \SLOW \PITCH \98 \BEND
;\SLOW \MM \FAST  \aw \LE \TT \IH
;\PO \LE \OHIY
;\VOX_TERM
voxCashBomb 
                    BONUS_VOICE  
                    db       8, 195, 132, 189, 5, 171, 136, 140, 173, 255 
;\RESET \SLOW \PITCH \98 \BEND
;\slow \KO \AY \SH \P5 \BO
;\AW \MM \OB
voxDiamondBomb 
                    BONUS_VOICE  
                    db       8, 174, 7, 157, 8, 140, 131, 144, 176, 5, 5, 171, 136, 140, 173, 255 
;\RESET \SLOW \PITCH \98 \BEND
;\SLOW \DE \FAST \OHIH \SLOW
;\MM \EH \NGO \ED \P5
;\P5 \BO \AW \MM \OB
;\VOX_TERM
voxTime 
                    BONUS_VOICE  
                    db       8, 191, 157, 8, 140, 255 
;\RESET \SLOW \PITCH \98 \BEND
;\SLOW \TT \OHIH \SLOW \MM
;\VOX_TERM \VOX_TERM
voxDoubleCash 
                    BONUS_VOICE  
                    db       175, 7, 134, 173, 138, 7, 145, 8, 195, 132, 189, 5, 255 
;\RESET \SLOW \PITCH \98 \BEND \2
;\DO \FAST \UX \OB \UH \FAST \LE
;\slow \KO \AY \SH \P5
voxShotPower 
                    BONUS_VOICE  
                    db       8, 8, 189, 189, 7, 137, 191, 5, 8, 199, 7, 163, 7, 151, 255 
;\RESET \SLOW \PITCH \98 \BEND
;\2 \SLOW \SLOW \SH \SH
;\FAST \OW \TT \P5 \SLOW
;\PO \FAST \AYWW \FAST \AXRR
;\VOX_TERM \VOX_TERM
voxExtraLife 
                    BONUS_VOICE  
                    db       130, 194, 187, 191, 7, 148, 7, 133, 5, 145, 157, 186, 255 
; \WH \IH \SE \KO \SLOW \IH
voxDrunken 
                    BONUS_VOICE  
                    db       185, 129, 187, 195, 8, 129, 255 
; \SLOW  \OH \TT \OW \FF \FAST    \OHIY   \RR
voxAutofire 
                    BONUS_VOICE  
                    db       8, 135, 191, 137, 186, 7, 155, 148, 255 
; \TT \RR \IH \PO
; \EHLL \P5 \P5 \SLOW \SLOW \SH \SH \FAST
; \OW \TT
voxTrippleShot 
                    BONUS_VOICE  
                    db       191, 148, 129, 199, 159, 5, 5, 8, 8, 189, 189, 7, 137, 191, 255 
;\RESET \SLOW \PITCH \98 \BEND
;\2 \EY \KE \SE \TT
;\FAST \RR \FAST \AX \P5
;\LE \OHIH \FF \VOX_TERM \VOX_TERM
voxLevel 
                    BONUS_VOICE  
                    db       145, 131, 166, 7, 131, 145, 5,0 ; 0 terminated! 
; \LE \EH \VV \FAST \EH \LE \P5
                    include  "jetphones.inc"
one                 db       WW, STRESS, OH, SLOW, NE, PAUSE2,0 
two                 db       SLOW, TT, IHWW, PAUSE2,0 
three               db       SLOW, TH, RR, SLOW, IY, PAUSE2,0 
four                db       FF, FAST, OW, OWRR, PAUSE2,0 
five                db       FF, OHIH, VV, PAUSE2,0 
six                 db       SLOW, SE, IH, STRESS, KE, FAST, SE, PAUSE2,0 
seven               db       SLOW, SE, FAST, EH, VV, EH, NE, PAUSE2,0 
eight               db       EYIY, PAUSE4, TT, PAUSE2,0 
nine                db       NE, STRESS, OHIH, NE, PAUSE2,0 
ten                 db       TT, EH, EH, NE, PAUSE2,0 
eleven              db       FAST, IH, LE, EH, VV, FAST, EH, NE, PAUSE2,0 
twelve              db       SLOW, TT, FAST, WW, EH, LE, VV, PAUSE2,0 
thirteen            db       SLOW, TH, FAST, AXRR, TT, IY, NE, PAUSE2,0 
fourteen            db       FF, FAST, OWRR, FAST, TT, IY, NE, PAUSE2,0 
fifteen             db       FF, IH, FF, TT, IY, NE, PAUSE2,0 
sixteen             db       SLOW, SE, FAST, IH, STRESS, KE, SE, FAST, TT, IY, NE, PAUSE2,0 
seventeen           db       SLOW, SE, FAST, EH, FAST, VV, FAST, EH, NE, FAST, TT, IY, NE, PAUSE2,0 
eighteen            db       EYIY, PAUSE4, TT, IY, NE, PAUSE2,0 
nineteen            db       NE, FAST, RELAX, OHIY, NE, TT, IY, SLOW, NE, PAUSE2,0 
twenty              db       SLOW, FAST, TT, FAST, WW, EH, NE, FAST, TT, IY, PAUSE2,0 
thirty              db       SLOW, TH, FAST, AXRR, TT, IY, PAUSE2,0 
fourty              db       FF, FAST, OWRR, TT, IY, PAUSE2,0 
fifty               db       FF, IH, FF, TT, IY, PAUSE2,0 
sixty               db       SLOW, SE, IH, STRESS, KE, SE, TT, IY, PAUSE2,0 
seventy             db       SLOW, SE, FAST, EH, FAST, VV, EH, FAST, NE, TT, IY, PAUSE2,0 
eighty              db       EYIY, PAUSE4, TT, IY, PAUSE2,0 
ninety              db       NE, FAST, RELAX, OHIY, NE, TT, IY, PAUSE2,0 
zero                db       ZZ, FAST, IY, FAST, IYRR, OWWW, PAUSE2,0 
hundred 
                    db       HO, UX, NE, ED, FAST, RR, EH, ED, PAUSE2, PAUSE2, SLOW,0 
tab1 
                    dw       0,one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve 
                    dw       thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen 
tab2 
                    dw       twenty,thirty, fourty, fifty, sixty, seventy, eighty, ninety 
 endif  
 if  DRAW_FIGHTER_IN_BANK0 = 1 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DRAW_SCOOP_HERE_BANK0  macro  
                    lda      #3                           ; loop count 
                    sta      tmp2_tmp 
                    clra     
                    suba     Vec_Loop_Count+1 
                    anda     #$f 
                    sta      <VIA_t1_cnt_lo 
                    sta      tmp1_tmp                     ; scale width 
anotherScoopLoop\? 
                    ldd      #$0050                       ; go ++ to next step 
; move
                    STa      <VIA_port_b                  ;Store Y in D/A register 
                    STb      <VIA_port_a                  ;Store Y in D/A register 
                                                          ;Enable mux ; hey dis si "break integratorzero 440" 
                    ldb      #$28                         ; -CORRECTION ; intervall add right is only half intervall add up 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    inca     
                    sta      <VIA_port_b                  ;Disable mux 
                    deca     
 else  
                    INC      <VIA_port_b                  ;Disable mux 
 endif  
                    STb      <VIA_port_a                  ;Store Y in D/A register 
                    STA      <VIA_t1_cnt_hi               ;enable timer 
                    lda      tmp1_tmp 
                    sta      <VIA_t1_cnt_lo 
                    adda     #SCOOP_INTERVALL_ADD 
                    sta      tmp1_tmp 
                    MY_MOVE_TO_B_END  
                    ldd      #$0090                       ; draw go left 
; draw
                    STa      <VIA_port_b                  ;switch to y int, enable mux 
                    STa      <VIA_port_a                  ;Store Y in D/A register 
; no wait since Y is 0
                    inca     
                    sta      <VIA_port_b                  ;Disable mux 
                    STb      <VIA_port_a                  ;Store X in D/A register 
                    ldd      #$00ee                       ; light OFF, ZERO OFF 
                    stb      <VIA_cntl                    ; 
;                    ldd      #$FF
;                    stb      <VIA_shift_reg
                    sta      <VIA_t1_cnt_hi 
                    lda      #SCOOP_INTERVALL_ADD 
                    sta      <VIA_t1_cnt_lo 
                    lda      #$ce                         ; light OFF, ZERO OFF 
;                    clra
                    MY_MOVE_TO_B_END  
                    sta      <VIA_cntl                    ; 
;                    sta      <VIA_shift_reg
                    ldd      #$0050                       ; go +- to next step 
; move
                    STa      <VIA_port_b                  ;Store Y in D/A register 
                    STb      <VIA_port_a                  ;Store Y in D/A register 
                                                          ;Enable mux ; hey dis si "break integratorzero 440" 
                    ldb      #-$28                        ;+CORRECTION ; intervall add right is only half intervall add up 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    inca     
                    sta      <VIA_port_b                  ;Disable mux 
                    deca     
 else  
                    INC      <VIA_port_b                  ;Disable mux 
 endif  
                    STb      <VIA_port_a                  ;Store Y in D/A register 
                    STA      <VIA_t1_cnt_hi               ;enable timer 
                    lda      tmp1_tmp 
                    sta      <VIA_t1_cnt_lo 
                    adda     #SCOOP_INTERVALL_ADD 
                    sta      tmp1_tmp 
                    MY_MOVE_TO_B_END  
                    ldd      #$0070                       ; draw go right 
; draw
                    STa      <VIA_port_a                  ;Store Y in D/A register 
                    STa      <VIA_port_b                  ;switch to y int, enable mux 
; no wait since Y is 0
                    inca     
                    sta      <VIA_port_b                  ;Disable mux 
                    STb      <VIA_port_a                  ;Store X in D/A register 
                    ldd      #$00ee                       ; light OFF, ZERO OFF 
                    stb      <VIA_cntl                    ; 
;                    ldd      #$FF
;                    stb      <VIA_shift_reg
                    sta      <VIA_t1_cnt_hi 
                    lda      #SCOOP_INTERVALL_ADD 
                    sta      <VIA_t1_cnt_lo 
                    lda      #$ce                         ; light OFF, ZERO OFF 
;                    clra
                    MY_MOVE_TO_B_END  
;                    sta      <VIA_shift_reg
                    sta      <VIA_cntl                    ; 
                    dec      tmp2_tmp 
                    lbne     anotherScoopLoop\? 
                    endm     
doFighterPrep 
                    lda      #OBJECT_SCALE 
                    sta      VIA_t1_cnt_lo 
                    ldu      multTimer 
                    beq      noTimerActive 
                    leau     -1,u 
                    stu      multTimer 
                    bne      noTimerActive 
                    lda      multiplyer 
                    anda     #NON_MULTIPLYER_BITS 
                    ora      #MULTIPLY_1_OR 
                    sta      multiplyer 
                    lda      #$80 
                    std      player_score_80 
noTimerActive 
;                    ldu      #SM_Fighter_Anim
                    lda      playerNumberOfBulletsPerShot 
                    deca     
                    lsla     
                    ldu      #SM_Fighter_AnimList 
                    ldu      a,u 
                    dec      playAnimDelayCounter 
                    bpl      animCounterFighterOk 
                    lda      #ANIMATION_DELAY 
                    sta      playAnimDelayCounter 
                    inc      playerAnim 
                    lda      playerAnim 
                    asla     
                    ldx      a,u 
                    beq      resetAnim 
                    tfr      x,u 
                    bra      drawFighter 

resetAnim 
                    clr      playerAnim 
animCounterFighterOk 
                    lda      playerAnim 
                    asla     
                    ldu      a,u 
drawFighter 
                    MY_MOVE_TO_B_END  
                    lda      drunkTimer 
                    beq      notDrunk 
                    ldd      #$9c9c 
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    lda      drunkTimer 
                    anda     #%01111111 
                    MY_MOVE_TO_B_END  
                    clrb     
                    STb      <VIA_port_a                  ;Store Y in D/A register 
                    STb      <VIA_port_b                  ;Enable mux ; hey dis si "break integratorzero 440" 
                    nop      
                    INC      <VIA_port_b                  ;Disable mux 
                    STa      <VIA_port_a                  ;Store X in D/A register 
                    lda      #$ee                         ; light OFF, ZERO OFF 
                    sta      <VIA_cntl                    ; 
                    STb      <VIA_t1_cnt_hi               ;enable timer 
                    lda      drunkTimer 
                    anda     #%01111111 
                    nega     
                    WAIT4    
                    ldb      #$CE                         ; light OFF, ZERO OFF 
                    stb      <VIA_cntl                    ; 
                    clrb     
                    STb      <VIA_port_a                  ;Store Y in D/A register 
                    STb      <VIA_port_b                  ;Enable mux ; hey dis si "break integratorzero 440" 
                    nop      
                    INC      <VIA_port_b                  ;Disable mux 
                    STa      <VIA_port_a                  ;Store X in D/A register 
                    STb      <VIA_t1_cnt_hi               ;enable timer 
                    WAIT4    
                    ldd      #$6464 
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    MY_MOVE_TO_B_END  
notDrunk 
                    jsr      SMVB_drawSmart               ; twice the speed ofdraw synced AND calibrated! 
                    lda      playerBonusActive 
                    beq      drawFighterDoneShort 
                    bita     #BITFIELD_ARMOR 
                    beq      testNext1 
                    ldu      #SM_Armor_Anim 
                    jmp      continueDrawFighter 

drawFighterDoneShort 
; draw cleanup
                    LDA      #$CC 
                    ldb      gameScale 
                    STA      VIA_cntl                     ;/BLANK low and /ZERO low 
                    stB      VIA_t1_cnt_lo 
                    ldd      #0 
                    std      <VIA_port_b 

                    rts      

testNext1 
                    bita     #BITFIELD_SHIELD 
                    beq      testNext2 
                    ldu      #SM_Shield_Anim 
                    ldx      playerBonusCounter 
                    leax     -1,x 
                    stx      playerBonusCounter           ; 
                    beq      endBonusShield 
                    cmpx     #100 
                    bhi      noFlickerShield 
                    lda      Vec_Loop_Count+1 
                    anda     #1 
                    beq      drawFighterDoneShort 
noFlickerShield 
                    jmp      continueDrawFighter 

endBonusShield 
                    clr      playerBonusActive 
                    jmp      continueDrawFighter 

testNext2 
                    bita     #BITFIELD_SCOOP 
                    beq      drawFighterDoneShort 
                    ldx      playerBonusCounter 
                    leax     -1,x 
                    stx      playerBonusCounter           ; dec playerBonusCounter 
                    lbeq     endBonusScoop 
                    cmpx     #100 
                    bhi      noFlickerScoop 
                    lda      Vec_Loop_Count+1 
                    anda     #1 
                    beq      drawFighterDoneShort 
noFlickerScoop 
                    DRAW_SCOOP_HERE_BANK0  
                    bra      drawFighterDone 

endBonusScoop 
                    clr      playerBonusActive 
                    bra      drawFighterDone 

continueDrawFighter 
                    lda      playerAnim 
                    asla     
                    ldu      a,u 
                    jsr      SMVB_drawSmart               ; twice the speed ofdraw synced AND calibrated! 
drawFighterDone 
; draw cleanup
                    LDA      #$CC 
                    ldb      gameScale 
                    STA      VIA_cntl                     ;/BLANK low and /ZERO low 
                    stB      VIA_t1_cnt_lo 
                    ldd      #0 
                    std      <VIA_port_b 
drawEND 
                    rts      

 endif  
;***************************************************************************
titletextIntensity  =        levelMaxEnemyShots 
titletextFadeDirection  =    levelBulletBorder 
titletextDisplayDone  =      levelBonusBorder 
showLevelTitleStep 
                    lda      #$30 
                    sta      Vec_Text_Width 
                    lda      #-$a 
                    sta      Vec_Text_Height 
                    tst      doWarpFailure 
                    bne      warpFailureOnly 
                    ldb      levelCount 
                    lda      #TITLE_TEXT_LENGTH 
                    mul      
                    ldu      #level00Title 
                    leau     d,u 
                    lda      titletextIntensity 
                    jsr      Intensity_a 
                    tst      titletextFadeDirection 
                    beq      goBrighter_tt 
goDarker_tt 
                    dec      titletextIntensity 
                    dec      titletextIntensity 
                    bpl      continueDisplayText_tt 
                    inc      titletextIntensity 
                    inc      titletextIntensity 
                    clr      titletextFadeDirection 
                    bne      continueDisplayText_tt 
                    inc      titletextDisplayDone 
                    bra      continueDisplayText_tt 

goBrighter_tt 
                    inc      titletextIntensity 
                    inc      titletextIntensity 
                    bpl      continueDisplayText_tt 
                    dec      titletextIntensity 
                    dec      titletextIntensity 
                    dec      titletextFadeDirection 
continueDisplayText_tt 
; first thing in test routine is
; MoveTo which uses T1, which clears T1 interrupt
; upon entry -> make sure SR interrupt is set, so we
; do not do a bankswitch
; ( after move is finished, autmatically T1 IRQ is set again
;   so the text output can be done with SR)
                    IRQ_TO_0_SHIFT  
                    lda      #$7f 
                    sta      VIA_t1_cnt_lo 
                    ldd      #$c0a0 
                    jsr      syncPrintStrd 
warpFailureOnly 
                    lda      difficulty 
                    bmi      notLastLive                  ; not in hardmode 
                    lda      playerLives 
                    cmpa     # '1'
                    bne      notLastLive 
                    _ZERO_VECTOR_BEAM  
                    lda      Vec_Loop_Count+1 
                    anda     #%00010000 
                    bne      noLight 
                    jsr      Intensity_7F 
                    bra      yesLight 

noLight 
                    jsr      Intensity_3F 
yesLight 
                    ldu      #lastLiveWarning 
                    ldd      #$a0b0 
                    jsr      syncPrintStrd 
                    jsr      Intensity_3F 
notLastLive 
                    ldd      #$f850 
                    std      Vec_Text_HW 
                    rts      

lastLiveWarning 
                    db       "DANGER! LAST LIFE ACTIVE!", $80 ;
TITLE_TEXT_LENGTH   =        30+1 
; not all references are QUOTATIONS!
level00Title 
level01Title        db       "      AND SO IT BEGINS!       ", $80 ; Series: Ambassador Kosh in Babylon 5 [Peer]
level02Title        db       "   THEY COME FROM THE SIDES   ", $80
level03Title        db       "   THEY GET MORE AGGRESSIVE   ", $80
level04Title        db       "      THEY DIVE FOR YOU       ", $80
level05Title        db       "    AZEROTH IS IN THE PAST    ", $80 ; Game: MMO: World of Warcraft
level06Title        db       "   THERE ARE MORE THINGS ...  ", $80 ; Book, Shakrepear Hamlet [Peer]
level07Title        db       " CLOSE ENCOUNTERS OF 3. KIND  ", $80 ; Movie: Close Encounters of the third Kind [Peer]
level08Title        db       " WHAT ABOUT A GAME OF CHESS?  ", $80 ; Movie: War games  [Peer]
level09Title        db       " THE PATTERNS ARE A-CHANGIN'  ", $80 ; Music: Bob Dylan, The times are a-changing?
level10Title        db       "...NO ONE CAN HEAR YOU SCREAM ", $80 ; Movie: Aliens [Peer]
level11Title        db       "     BUGS COME IN FLAVOURS    ", $80
level12Title        db       "         FALLING DOWN         ", $80 ; The Movie (non science fiction, Michael Douglas
level13Title        db       "      SHE IS THE SLAYER!      ", $80 ; Series: Buffy (in reference to the vampire amongs the aliens)
level14Title        db       "     KLAATU BARADA NIKTO      ", $80 ; Movie: The Day the Earth stood still [Peer]
level15Title        db       "          MORE BUGS           ", $80
level16Title        db       "      CHALLENGE ME AGAIN      ", $80
level17Title        db       "        INTRUDER ALERT!       ", $80 ; Arcade game: Berzerk
level18Title        db       "     JOHNNY LOVES CARMEN      ", $80 ; Movie: Starship Troupers (Dizzy reference is already in the diary)
level19Title        db       "    ARE THOSE BRAIN BUGS?     ", $80 ; Movie: Starship Troupers
level20Title        db       "     SWOOPING TO COLLIDE      ", $80
level21Title        db       "      VELOXI IS NOT TIXI      ", $80 ; Game (C64): STARFLIGHT
level22Title        db       "ALL YOUR BASE ARE BELONG TO US", $80 ; Game (Mega Drive, now a MEME): Zero Wing
level23Title        db       " KLENDATU MUST BE DESTROYED!  ", $80 ; Movie: Starship troupers / Latin Quot CATO [Peer]
level24Title        db       "    CHALLENGE THE ZIG ZAG     ", $80
level2XTitle        db       "         --- BOSS ---         ", $80
;
level25Title        db       "       NEWCOMER FALSTEIN      ", $80 ; Arcade game: Designers of Sinistar
level26Title        db       "     WORKERS AND WARRIORS     ", $80 ; Arcade game: Sinistar itself, there are Workers and warriors
level27Title        db       "    LITTLE SINI APPROACHING   ", $80
level28Title        db       "SHOOT 'EM ALL - OR BE CENTERED", $80
level29Title        db       "      DOREMUS WAS TALKING     ", $80 ; Arcade game: John Doremus did the voice in Sinistar
level30Title        db       "        HALF IS DEBRIS        ", $80
level31Title        db       "  WAR ... WAR NEVER CHANGES   ", $80 ; Game: Fallout
level32Title        db       "     THE LAST STARFIGHTER     ", $80 ; Movie: The last Starfighter
level33Title        db       "        FULL DEBRIS ONE       ", $80
level34Title        db       "        FULL DEBRIS TWO       ", $80
level35Title        db       "      LET THE WAR - BEGIN     ", $80 ; Game: Warlords II (SSG fantasy strategy game)
level36Title        db       "     CENTERED IS KEY AGAIN    ", $80
level37Title        db       "      RAWWWAAAARRRGGGGHHH!    ", $80 ; Arcade game: That is THE sinistar again, it ROARS really loud!
level38Title        db       "    THERE IS NO COW LEVEL!    ", $80 ; Game: Diablo II
level39Title        db       "   MINING SPORG EVERYWHERE    ", $80 ; Arcade game: the miners in sinistar are called "SPORG"
level40Title        db       "     GOTTA CATCH 'EM ALL      ", $80 ; Game: Pokemon
level41Title        db       "        CLINES ARMADA         ", $80 ; Book: The book by Ernest
level42Title        db       "   NEAR THE TANNHAUSER GATE   ", $80 ; Movie: Bladerunner
level43Title        db       "           BEWARE!            ", $80 ; Arcade game: Sinistar AGAIN
level44Title        db       "     SUICIDERS! - CENTER!     ", $80
level45Title        db       "   CATCH 'EM - AND YOU DIE!   ", $80
level46Title        db       "   KILLED BY YOUR OWN SHOTS   ", $80
level47Title        db       "NA EINAI KALYTERO ANTHROPO ...", $80 ; Series: Fringe "Be a better man than you father..." (greek)
level48Title        db       "      THE CAKE IS A LIE!      ", $80 ; Game: Portal (from Valve)
level49Title        db       "       BEFORE THE STORM       ", $80 ; Game: Life Is Strange: Before the Storm
level5XTitle        db       "         --- BOSS ---         ", $80
;
level50Title        db       "     MOS EISLEY SPACEPORT     ", $80 ; Movie: Star wars, 1st Movie
level51Title        db       "  MY GOD, IT'S FULL OF STARS  ", $80 ; Movie: 2001
level52Title        db       "      STRAIGHT DOWN AGAIN     ", $80
level53Title        db       "      X-WING APPROACHING      ", $80 ; Movie: General Star wars reference
level54Title        db       "          SHIELDED            ", $80
level55Title        db       "      RUINS OF ALDERAAN       ", $80 ; Movie: The planet that got destroyed by the death star
level56Title        db       "         FUS RO DAH           ", $80 ; Game: Skyrim - The first Dragon shout to learn
level57Title        db       "   FORD AND SLARTIBARTFAST    ", $80 ; Book: The hitchhikers guide to the galaxy
level58Title        db       "   IT'S BIGGER ON THE INSIDE  ", $80 ; Series: Dr Who [Peer]
level59Title        db       "   ANCHORHEAD - ADVENTURE?    ", $80 ; BOTH: a star wars reference (Tatooine), AND there is a cool interactive fiction "adventure" called Anchorhead (Lovecraft)
level60Title        db       "    MULTITUDES OF X-WINGS     ", $80 ; Movie: General Star wars reference
level61Title        db       "         LEIA ORGANA          ", $80 ; Movie: Princess Leia of Star Wars
level62Title        db       "    U.S.S. CYGNUS WAS LOST    ", $80 ; Movie: Disney: The Black Hole
level63Title        db       " KARA AND ALICE GO TO JERICHO ", $80 ; Game: PS4: "Detroit: Become human"
level64Title        db       "        EGGERS CIRCLE         ", $80 ; Book: The Circle, book by Dave Eggers
level65Title        db       "          VAULT 111           ", $80 ; Game: Fallout 4
level66Title        db       " ...HERE THEY DEBRIS AGAIN... ", $80 ;
level67Title        db       "   ... HOW MUCH I MISSED IT!  ", $80 ; Music: Together the ABBA song (with liberty):
                                                          ; Mamma Mia, here I go again 
                                                          ; My my, how can I resist you 
                                                          ; Mamma Mia, does it show again 
                                                          ; My my, just how much I've missed you 
level68Title        db       "       I AM YOUR FATHER!      ", $80 ; Movie: Star wars [Peer]
level69Title        db       "      NEAR AND AGGRESSIVE     ", $80
level70Title        db       "      PALPATINE IS CLOSE      ", $80 ; Movie: Star Wars - The Emperor
level71Title        db       "     IT'S MADE OF PEOPLE!     ", $80 ; Movie: Soylent green
level72Title        db       "    LOWELL SAVES THE DOME     ", $80 ; Movie: Silent Running
level73Title        db       "    LOGAN IS STILL RUNNING    ", $80 ; Movie: Logans Run
level74Title        db       "       USE THE FORCE!         ", $80 ; Movie: Star Wars
level7XTitle        db       "         --- BOSS ---         ", $80
;
level75Title        db       " WHERE NO MAN HAS GONE BEFORE ", $80 ; Series: Star Trek
level76Title        db       "          EASY GOING          ", $80
level77Title        db       "         ALL SHIELDS          ", $80
level78Title        db       "       EARL GREY, HOT!        ", $80 ; Series: Star Trek, Picard [Peer]
level79Title        db       "      VILLA STRAYLIGHT        ", $80 ; Book: Neuromancer
level80Title        db       "     MORLOCKS VERSUS ELOI     ", $80 ; Movie: The time machine
level81Title        db       "           TRIBBLES           ", $80 ; Series: Startrek (original series) The Trouble With Tribbles
level82Title        db       "        SICK OF SHIELDS       ", $80
level83Title        db       "           HAL 9000           ", $80 ; Movie: 2001
level84Title        db       "DANGER LEFT THEN DANGER RIGHT ", $80
level85Title        db       "        LEELOO IS HOT!        ", $80 ; Movie: The 5th element (Milla Jovovich)
level86Title        db       "       ABBY KILLS JOEL        ", $80 ; Game: PS4: The Last of Us 2
level87Title        db       "       BIG ONES TEAM UP       ", $80
level88Title        db       "           WACHOWSKI          ", $80 ; Movie: The Matrix
level89Title        db       "ARE YOU KIDDING ME? - SHIELDS!", $80
level90Title        db       "    HEINLEIN & RODDENBERRY    ", $80 ; Book/Series: Authors [Peer]
level91Title        db       " THE LAST SHIELDS - PROMISE!  ", $80
level92Title        db       "       MOSTLY HARMLESS        ", $80 ; Book: Hitch Hikers Guide to the galaxy - again (Part II)
level93Title        db       "     DOOMS HELL ON EARTH      ", $80 ; Game: Doom
level94Title        db       "       PERSSON BERGSTEN       ", $80 ; Game: Inventor and lead programmer of Minecraft
level95Title        db       "LOOK AT THE SIZE OF THAT THING", $80 ; Series: Star Wars [Peer]
level96Title        db       "       EASY TO MISS!          ", $80
level97Title        db       "    THE SPICE MUST FLOW       ", $80 ; Movie: Dune
level98Title        db       "       LAMBDA FREEMAN         ", $80 ; Game: Half Life
level99Title        db       "      FINISH THE GAME!        ", $80 ; Movie: TRON (Sark, when Flynn plays his first match on the grid) [Peer]
level9XTitle        db       "         --- BOSS ---         ", $80
;
;***************************************************************************
 if  DO_DYING_BONUS = 1 
initDeathBonus 
                    ldy      #behaviourData 
                    lda      #5 
                    sta      tmp4_tmp 
; look what kind of bonus we would lose
; build new bonuses and "spread" them out
;
; start position of bonus
                    lda      #-$70 
                    ldb      playerXpos 
                    std      bonusSpawnPosition 
doNextBonusSpawn 
; "randomize" position of individual bonuses
; ldb #BONUS_SHOT_POWERUP
                    ldu      #bonusData1 
                    lda      Vec_Loop_Count+1 
                    anda     #%00000111 
                    cmpa     #5 
                    blo      okokok 
                    lda      #4 
okokok 
                    adda     tmp4_tmp 
                    cmpa     #4 
                    ble      okokokok 
                    suba     #5 
okokokok 
                    ldb      a,u                          ; type of BONUS 
                    stb      tmp3_tmp 
; check if autofire should be generated!
                    cmpb     #BONUS_AUTOFIRE 
                    bne      nobonusAvailableCheck 
                    lda      diverseFlags 
                    anda     #BIT_FLAG_AUTOFIRE 
                    beq      overStepBonusGeneration 
                    bra      bonusAvailable 

bonusAvailable 
nobonusAvailableCheck 
REPLACE_1_2_spawnBonus_varFrom0_112 
                    ldx      #0                           ; spawnBonus 
                    jsr      jsrBank2_fromShift_0 
                    cmpx     #OBJECT_LIST_COMPARE_ADDRESS ; no bonus left 
                    bls      noBonusToSpawn 
                    ldd      bonusSpawnPosition 
                    std      Y_POS,x                      ; set start pos 
                    lda      #%10000000 
                    sta      BONUS_ANIM_POSITION,x        ; double speed fall! 
                    ldb      tmp3_tmp 
                    cmpb     #BONUS_FASTER 
                    bne      notfasterBonus 
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #2 
                    bne      not2shot 
                    ldb      #BONUS_SHOT2 
not2shot 
                    cmpa     #3 
                    bne      not3shot 
                    ldb      #BONUS_SHOT3 
not3shot 
notfasterBonus 
                    stb      TYPE,x 
                    ldd      ,y++ 
                    std      BEHAVIOUR,x 
overStepBonusGeneration 
                    dec      tmp4_tmp 
                    bne      doNextBonusSpawn 
noBonusToSpawn 
                    ldd      #0 
                    std      bonusSpawnPosition 
REPLACE_1_2_returnDeathBonus_varFrom1_1 
                    ldx      #0                           ; returnDeathBonus 
                    jmp      jmpBankIRQ3X 

bonusData1 
                    db       BONUS_SHOTPLUS 
                    db       BONUS_FASTER_SHOT 
                    db       BONUS_FASTER 
                    db       BONUS_TIMER 
                    db       BONUS_AUTOFIRE 
behaviourData 
REPLACE_0_2_risingBonusBehaviourX0_varFrom0_1 
                    dw       0 
REPLACE_0_2_risingBonusBehaviourXp1_varFrom0_1 
                    dw       0 
REPLACE_0_2_risingBonusBehaviourXn1_varFrom0_1 
                    dw       0 
REPLACE_0_2_risingBonusBehaviourXp2_varFrom0_1 
                    dw       0 
REPLACE_0_2_risingBonusBehaviourXn2_varFrom0_1 
                    dw       0 
 endif  
;***************************************************************************
;
drawCandleStepComplete 
                    jsr      drawStump 
                    ldy      #candle1 
                    dec      waiterVal 
                    lda      phase 
                    beq      phase0 
                    deca     
                    beq      phase1 
                    deca     
                    beq      phase2 
                    deca     
                    beq      phase3 
                    deca     
                    lbeq     phase4 
                    rts      

; ......
; burn
phase0 
                    lda      waiterVal 
                    cmpa     #200 
                    blo      startPhase1 
                    jsr      drawCandleStep 
                    rts                                   ; and repeat forever 

; ......
startPhase1 
                    inc      phase 
; wind
phase1 
                    lda      Vec_Loop_Count+1 
                    anda     #1 
                    beq      noWindUpdate 
                    dec      X_OFFSET,y 
                    dec      Y_OFFSET,y 
                    dec      FLAME_INT_MAX, y 
                    lda      X_OFFSET,y 
                    cmpa     LOWESTX 
                    blo      startPhase2 
noWindUpdate 
                    jsr      drawCandleStep 
                    rts                                   ; and repeat forever 

startPhase2 
                    inc      phase 
; flicker before blow
phase2 
                    lda      Vec_Loop_Count+1 
                    anda     #1 
                    beq      noWindUpdate 
                    dec      X_OFFSET,y 
                    dec      Y_OFFSET,y 
                    dec      FLAME_INT_MAX, y 
                    dec      FLAME_INT_MAX, y 
                    lda      X_OFFSET,y 
                    lda      waiterVal 
                    cmpa     #150 
                    blo      startPhase3 
                    jsr      drawCandleStep 
                    rts                                   ; and repeat forever 

; ......
startPhase3 
                    inc      phase 
; blow away
phase3 
                    dec      baseLight 
                    dec      baseLight 
                    RANDOM_A  
                    anda     #%00011111 
                    nega     
                    adda     POS+1,Y 
                    bpl      startPhase4 
                    sta      POS+1,Y 
                    RANDOM_A  
                    anda     #%00000111 
                    adda     POS,Y 
                    sta      POS,Y 
                    dec      FLAME_INT_MAX, y 
                    dec      FLAME_INT_MAX, y 
                    dec      FLAME_INT_MAX, y 
                    dec      Y_OFFSET,y 
                    dec      X_OFFSET,y 
                    jsr      drawCandleStep 
                    rts                                   ; and repeat forever 

; ......
startPhase4 
                    inc      phase 
                    jsr      initSmoke 
; glim and smoke
phase4 
                    dec      baseLight 
                    dec      baseLight 
                    bpl      okok 
                    clr      baseLight 
okok 
                    lda      Vec_Loop_Count+1 
                    anda     #%11 
                    cmpa     #%11 
                    bne      noValChange 
                    ldd      VALUES,y 
                    addd     #1 
                    std      VALUES,y 
noValChange 
                    inc      COUNTER,y 
                    dec      FLAME_INT_MAX, y 
                    bpl      smokIntOk 
                    clr      FLAME_INT_MAX, y 
                    ldd      #0 
                    std      tmp16_tmp 
                    std      tmp16_tmp2 
; jmp redo d
smokIntOk 
                    jsr      drawSmokeStep 
                    rts                                   ; and repeat forever 

initCandle 
                    clr      phase 
                    lda      #$7f 
                    sta      baseLight 
                    lda      #$ff 
                    sta      waiterVal 
                    ldy      #candle1 
                    ldd      #$d0f6 
                    std      POS,Y 
                    ldd      #xUpdate 
                    std      VALUES,y 
                    clr      COUNTER,y 
                    lda      #$7f 
                    sta      SCALE_POS,y 
                    lda      #$7f 
                    sta      FLAME_INT_MAX,y 
                    lda      #XWAIT 
                    sta      X_WAITER,y 
                    lda      #YWAIT 
                    sta      Y_WAITER,y 
                    clr      Y_OFFSET,y 
                    clr      X_OFFSET,y 
                    lda      #COUNTER_X 
                    sta      COUNTER,y 
                    lda      #20 
                    sta      Y_UPDATE, y 
                    lda      #10 
                    sta      BIGGESTX 
                    sta      BIGGESTY 
                    lda      #-10 
                    sta      LOWESTX 
                    clr      LOWESTY 
                    rts      

initSmoke 
                    ldy      #smoke 
                    ldd      #$e0f9 
                    std      POS,Y 
                    ldd      #smokeValues 
                    std      VALUES,y 
                    lda      #$7f 
                    sta      SCALE_POS,y 
                    lda      #$3f 
                    sta      FLAME_INT_MAX,y 
                    lda      #XWAIT 
                    sta      X_WAITER,y 
                    lda      #YWAIT 
                    sta      Y_WAITER,y 
                    clr      Y_OFFSET,y 
                    clr      X_OFFSET,y 
                    lda      #1 
                    sta      COUNTER,y 
                    lda      #20 
                    sta      Y_UPDATE, y 
                    lda      #5 
                    sta      BIGGESTX 
                    sta      BIGGESTY 
                    lda      #-5 
                    sta      LOWESTX 
                    clr      LOWESTY 
                    rts      

;
;***************************************************************************
;
drawStump 
                    lda      baseLight 
                    JSR      Intensity_a                  ; Sets the intensity of the 
                    ldu      #Candle_0 
                    LDA      #$f0 -$50                    ; Text position relative Y 
                    LDB      #-$0                         ; Text position relative X 
                    tfr      d,x                          ; in x position of list 
                    lda      #$40                         ; scale positioning 
                    ldb      #$30                         ; scale move in list 
                    jsr      draw_synced_list_noshift 
                    _ZERO_VECTOR_BEAM  
                    lda      baseLight 
                    suba     #$20 
                    JSR      Intensity_a                  ; Sets the intensity of the 
                    ldu      #Candle_1 
                    LDA      #$f0 -$50                    ; Text position relative Y 
                    LDB      #-$0                         ; Text position relative X 
                    tfr      d,x                          ; in x position of list 
                    lda      #$40                         ; scale positioning 
                    ldb      #$30                         ; scale move in list 
                    jsr      draw_synced_list_noshift 
                    _ZERO_VECTOR_BEAM  
                    ldu      #Candle_2 
                    LDA      #$f0 -$50                    ; Text position relative Y 
                    LDB      #-$0                         ; Text position relative X 
                    tfr      d,x                          ; in x position of list 
                    lda      #$40                         ; scale positioning 
                    ldb      #$30                         ; scale move in list 
                    jsr      draw_synced_list_noshift 
                    _ZERO_VECTOR_BEAM  
                    lda      baseLight 
                    suba     #$40 
                    ldu      #Candle_3 
                    LDA      #$f0 -$50                    ; Text position relative Y 
                    LDB      #-$0                         ; Text position relative X 
                    tfr      d,x                          ; in x position of list 
                    lda      #$40                         ; scale positioning 
                    ldb      #$30                         ; scale move in list 
                    jsr      draw_synced_list_noshift 
                    _ZERO_VECTOR_BEAM  
goBackCandle 
                    rts      

drawCandleStep 
;                              STA    VIA_aux_cntl           ; restore usual AUX setting
                    jsr      Reset_Pen 
                    ldy      #candle1 
                    tst      FLAME_INT_MAX, y 
                    beq      goBackCandle 
; - 100 candle burns
; - 200 candle flickers
; - 300 candle is out, and smokes
; - 500 candle is out message?
                                                          ; bra flame 
;
;***************************************************************************
;
flame 
                    RANDOM_A  
                    ora      #%01100000 
                    anda     #%01111111 
                    anda     FLAME_INT_MAX,y 
                    jsr      Intensity_a 
                    lda      SCALE_POS,y 
                    sta      VIA_t1_cnt_lo 
                    ldd      POS,y 
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    MY_MOVE_TO_A_END  
                    ldu      VALUES,y 
                    jsr      drawCandle 
                    dec      X_WAITER ,y 
                    bne      xdoneAll 
; X "size2
                    RANDOM_A  
                    bmi      xneg 
                    inc      X_OFFSET,y 
                    lda      X_OFFSET,y 
                    cmpa     BIGGESTX 
                    blt      xDone 
                    lda      BIGGESTX 
                    sta      X_OFFSET,y 
                    bra      xDone 

xneg 
                    dec      X_OFFSET,y 
                    lda      X_OFFSET,y 
                    cmpa     LOWESTX 
                    bgt      xDone 
                    lda      LOWESTX 
                    sta      X_OFFSET,y 
xDone 
                    lda      #XWAIT 
                    sta      X_WAITER ,y 
xdoneAll 
; Y "size2
                    dec      Y_WAITER ,y 
                    bne      ydoneAll 
                    RANDOM_A  
                    bmi      yneg 
                    inc      Y_OFFSET,y 
                    lda      Y_OFFSET,y 
                    cmpa     BIGGESTY 
                    blt      yDone 
                    lda      BIGGESTY 
                    sta      Y_OFFSET,y 
                    bra      yDone 

yneg 
                    dec      Y_OFFSET,y 
                    lda      Y_OFFSET,y 
                    cmpa     LOWESTY 
                    bgt      yDone 
                    lda      LOWESTY 
                    sta      Y_OFFSET,y 
yDone 
                    lda      #YWAIT 
                    sta      Y_WAITER ,y 
ydoneAll 
                    rts      

drawSmokeStep 
                    RANDOM_A  
                    ora      #%01100000 
                    anda     #%01111111 
                    anda     FLAME_INT_MAX,y 
                    jsr      Intensity_a 
                    lda      SCALE_POS,y 
                    sta      VIA_t1_cnt_lo 
                    ldd      POS,y 
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    MY_MOVE_TO_A_END  
                    ldu      VALUES,y 
                    jsr      drawSmoke 
                    dec      X_WAITER ,y 
                    bne      xdoneAll_sm 
; X "size2
                    RANDOM_A  
                    bmi      xneg_sm 
                    inc      X_OFFSET,y 
                    lda      X_OFFSET,y 
                    cmpa     BIGGESTX 
                    blt      xDone_sm 
                    lda      BIGGESTX 
                    sta      X_OFFSET,y 
                    bra      xDone_sm 

xneg_sm 
                    dec      X_OFFSET,y 
                    lda      X_OFFSET,y 
                    cmpa     LOWESTX 
                    bgt      xDone_sm 
                    lda      LOWESTX 
                    sta      X_OFFSET,y 
xDone_sm 
                    lda      #XWAIT 
                    sta      X_WAITER ,y 
xdoneAll_sm 
; Y "size2
                    dec      Y_WAITER ,y 
                    bne      ydoneAll_sm 
                    RANDOM_A  
                    bmi      yneg_sm 
                    inc      Y_OFFSET,y 
                    lda      Y_OFFSET,y 
                    cmpa     BIGGESTY 
                    blt      yDone_sm 
                    lda      BIGGESTY 
                    sta      Y_OFFSET,y 
                    bra      yDone_sm 

yneg_sm 
                    dec      Y_OFFSET,y 
                    lda      Y_OFFSET,y 
                    cmpa     LOWESTY 
                    bgt      yDone_sm 
                    lda      LOWESTY 
                    sta      Y_OFFSET,y 
yDone_sm 
                    lda      #YWAIT 
                    sta      Y_WAITER ,y 
ydoneAll_sm 
                    rts      

;
;***************************************************************************
;
drawCandle: 
                    lda      COUNTER,y 
                    sta      ccounter 
                    LDD      #$0081                       ; load D with VIA pokes 
                    STB      VIA_port_b                   ; poke $81 to port B 
                                                          ; disable MUX 
                                                          ; disable ~RAMP 
                    STA      VIA_aux_cntl                 ; poke $18 to AUX 
                                                          ; shift mode 4 
                                                          ; PB7 not timer controlled 
                                                          ; PB7 is ~RAMP 
                    LDA      Y_UPDATE,y                   ; ,U+ ; load next Y_update 
                    adda     Y_OFFSET,y 
                    STA      VIA_port_a                   ; poke to DAC 
                    DECB                                  ; B now $80 
                    STB      VIA_port_b                   ; enable MUX, that means put 
                                                          ; DAC to Y integrator S/H 
;                              lda    #$ff
                    lda      #$ee                         ; light OFF, ZERO OFF 
                    INC      VIA_port_b                   ; MUX off, only X on DAC now 
                    LDB      ,U+ 
                    STB      VIA_port_a                   ; store B (X_update) to DAC 
                    LDB      #$01                         ; load poke for MUX disable, 
                                                          ; ~RAMP enable 
x_update_loop_init: 
                    STB      VIA_port_b                   ; MUX disable, ~RAMP enable 
                    sta      <VIA_cntl                    ; 
;                              STA    VIA_shift_reg          ; poke the enable byte (A) found to
                                                          ; shift, that enables/disables ~BLANK 
x_update_loop: 
                    dec      ccounter 
                    BEQ      finnish_x_update             ; if zero, we are done with this 
                    LDA      ,U+                          ; load next X_update value 
                    adda     X_OFFSET,y 
                                                          ; X_update 
                    STA      VIA_port_a                   ; otherwise put the found value to 
                                                          ; DAC and thus to X integration 
                    BRA      x_update_loop                ; go on, look if another X_update 

                                                          ; value is there... 
finnish_x_update: 
                    LDB      #$81                         ; load value for ramp off, MUX off 
                    STB      VIA_port_b                   ; poke $81, ramp off, MUX off 
secondHalf 
                    lda      COUNTER,y 
                    sta      ccounter 
                    LDA      Y_UPDATE,y                   ; ,U+ ; load next Y_update 
                    adda     Y_OFFSET,y 
                    nega     
                    STA      VIA_port_a                   ; poke to DAC 
                    DECB                                  ; B now $80 
                    STB      VIA_port_b                   ; enable MUX, that means put 
                                                          ; DAC to Y integrator S/H 
;                              lda    #$ff
                    lda      #$ee                         ; light OFF, ZERO OFF 
                    INC      VIA_port_b                   ; MUX off, only X on DAC now 
                    LDB      ,U+ 
                    STB      VIA_port_a                   ; store B (X_update) to DAC 
                    LDB      #$01                         ; load poke for MUX disable, 
                                                          ; ~RAMP enable 
                    STB      VIA_port_b                   ; MUX disable, ~RAMP enable 
                    sta      <VIA_cntl                    ; 
;                              STA    VIA_shift_reg          ; poke the enable byte (A) found to
                                                          ; shift, that enables/disables ~BLANK 
x_update_loop2: 
                    dec      ccounter 
                    BEQ      finnish_x_update2            ; if zero, we are done with this 
                    LDA      ,-U                          ; load next X_update value 
                    suba     X_OFFSET,y 
                                                          ; X_update 
                    STA      VIA_port_a                   ; otherwise put the found value to 
                                                          ; DAC and thus to X integration 
                    BRA      x_update_loop2               ; go on, look if another X_update 

                                                          ; value is there... 
finnish_x_update2: 
                    LDB      #$81                         ; load value for ramp off, MUX off 
                    STB      VIA_port_b                   ; poke $81, ramp off, MUX off 
                    NOP                                   ; these NOP's seem to be neccessary 
                    NOP                                   ; since the delay between VIA and 
                    NOP                                   ; integration hardware 
                                                          ; NOP ; otherwise, there is a space 
                                                          ; between Y_updates... Malban 
;                              clra
;                              STA    VIA_shift_reg          ; A == %00000000
                    lda      #$ce                         ; light OFF, ZERO OFF 
                    sta      <VIA_cntl                    ; 
                    LDA      #$80                         ; load AUX setting 
                    STA      VIA_aux_cntl                 ; restore usual AUX setting 
                                                          ; (enable PB7 timer, SHIFT mode 4) 
                    RTS                                   ; and out of here 

;
;***************************************************************************
;
drawSmoke: 
                    lda      COUNTER,y 
                    sta      ccounter 
                    LDD      #$0081                       ; load D with VIA pokes 
                    STB      VIA_port_b                   ; poke $81 to port B 
                                                          ; disable MUX 
                                                          ; disable ~RAMP 
                    STA      VIA_aux_cntl                 ; poke $18 to AUX 
                                                          ; shift mode 4 
                                                          ; PB7 not timer controlled 
                                                          ; PB7 is ~RAMP 
                    LDA      Y_UPDATE,y                   ; ,U+ ; load next Y_update 
                    adda     Y_OFFSET,y 
                    STA      VIA_port_a                   ; poke to DAC 
                    DECB                                  ; B now $80 
                    STB      VIA_port_b                   ; enable MUX, that means put 
                                                          ; DAC to Y integrator S/H 
                    lda      #$ee                         ; light OFF, ZERO OFF 
                    INC      VIA_port_b                   ; MUX off, only X on DAC now 
                    LDB      ,U+ 
                    STB      VIA_port_a                   ; store B (X_update) to DAC 
                    LDB      #$01                         ; load poke for MUX disable, 
                                                          ; ~RAMP enable 
                    STB      VIA_port_b                   ; MUX disable, ~RAMP enable 
                    sta      <VIA_cntl                    ; 
                                                          ; shift, that enables/disables ~BLANK 
x_update_loop_sm: 
                    dec      ccounter 
                    BEQ      finnish_x_update_sm          ; if zero, we are done with this 
                    LDA      ,U+                          ; load next X_update value 
                    adda     X_OFFSET,y 
                                                          ; X_update 
                    STA      VIA_port_a                   ; otherwise put the found value to 
                                                          ; DAC and thus to X integration 
                    BRA      x_update_loop_sm             ; go on, look if another X_update 

                                                          ; value is there... 
finnish_x_update_sm: 
                    LDB      #$81                         ; load value for ramp off, MUX off 
                    STB      VIA_port_b                   ; poke $81, ramp off, MUX off 
                    NOP                                   ; these NOP's seem to be neccessary 
                    NOP                                   ; since the delay between VIA and 
                    NOP                                   ; integration hardware 
                                                          ; NOP ; otherwise, there is a space 
                                                          ; between Y_updates... Malban 
                    lda      #$ce                         ; light OFF, ZERO OFF 
                    sta      <VIA_cntl                    ; 
                    LDA      #$80                         ; load AUX setting 
                    STA      VIA_aux_cntl                 ; restore usual AUX setting 
                                                          ; (enable PB7 timer, SHIFT mode 4) 
                    RTS                                   ; and out of here 

;
;***************************************************************************
;
COUNTER_X           =        19 
SS                  =        5 
xUpdate 
                    db       -1*SS 
                    db       -2*SS 
                    db       -3*SS 
                    db       -4*SS 
                    db       -5*SS 
                    db       -4*SS 
                    db       -3*SS 
                    db       -2*SS 
                    db       -1*SS 
                    db       -0*SS 
                    db       1*SS 
                    db       2*SS 
                    db       3*SS 
                    db       4*SS 
                    db       5*SS 
                    db       6*SS 
                    db       4*SS 
                    db       3*SS 
                    db       1*SS 
                    db       0*SS 
smokeValues 
                    db       -1*SS 
                    db       -2*SS 
                    db       -1*SS 
                    db       -2*SS 
                    db       -1*SS 
                    db       0*SS 
                    db       1*SS 
                    db       2*SS 
                    db       1*SS 
                    db       2*SS 
                    db       3*SS 
                    db       2*SS 
                    db       1*SS 
                    db       1*SS 
                    db       2*SS 
                    db       1*SS 
                    db       0*SS 
                    db       -1*SS 
                    db       -2*SS 
                    db       -1*SS 
                    db       -2*SS 
                    db       -1*SS 
                    db       0*SS 
                    db       1*SS 
                    db       2*SS 
                    db       1*SS 
                    db       2*SS 
                    db       3*SS 
                    db       2*SS 
                    db       1*SS 
                    db       1*SS 
                    db       2*SS 
                    db       1*SS 
                    db       0*SS 
Candle_0: 
                    DB       $01, -$10, +$0A              ; sync and move to y, x 
                    DB       $00, -$03, +$00              ; additional sync move to y, x 
                    DB       $FF, +$07, -$09              ; draw, y, x 
                    DB       $FF, +$07, -$05              ; draw, y, x 
                    DB       $FF, +$09, -$06              ; draw, y, x 
                    DB       $FF, +$0D, -$01              ; draw, y, x 
                    DB       $FF, +$0F, +$05              ; draw, y, x 
                    DB       $FF, +$08, +$02              ; draw, y, x 
                    DB       $FF, +$07, +$07              ; draw, y, x 
                    DB       $FF, +$06, +$03              ; draw, y, x 
                    DB       $FF, +$03, -$01              ; draw, y, x 
                    DB       $FF, -$09, -$0B              ; draw, y, x 
                    DB       $FF, -$0E, -$07              ; draw, y, x 
                    DB       $FF, -$0F, -$05              ; draw, y, x 
                    DB       $FF, -$0E, +$01              ; draw, y, x 
                    DB       $FF, -$10, +$09              ; draw, y, x 
                    DB       $FF, -$07, +$05              ; draw, y, x 
                    DB       $FF, -$02, -$01              ; draw, y, x 
                    DB       $02                          ; endmarker 
Candle_1: 
                    DB       $01, -$21, +$10              ; sync and move to y, x 
                    DB       $FF, +$02, +$26              ; draw, y, x 
                    DB       $FF, +$05, +$21              ; draw, y, x 
                    DB       $FF, +$0A, +$19              ; draw, y, x 
                    DB       $FF, +$0B, +$0E              ; draw, y, x 
                    DB       $FF, +$0A, +$00              ; draw, y, x 
                    DB       $FF, +$0B, -$0E              ; draw, y, x 
                    DB       $FF, +$09, -$1F              ; draw, y, x 
                    DB       $FF, +$06, -$1F              ; draw, y, x 
                    DB       $FF, +$02, -$20              ; draw, y, x 
                    DB       $FF, +$00, -$24              ; draw, y, x 
                    DB       $01, +$21, -$12              ; sync and move to y, x 
                    DB       $FF, -$02, -$20              ; draw, y, x 
                    DB       $FF, -$06, -$1F              ; draw, y, x 
                    DB       $FF, -$09, -$1F              ; draw, y, x 
                    DB       $FF, -$0B, -$0E              ; draw, y, x 
                    DB       $FF, -$0A, +$00              ; draw, y, x 
                    DB       $FF, -$0B, +$0E              ; draw, y, x 
                    DB       $FF, -$09, +$1F              ; draw, y, x 
                    DB       $FF, -$06, +$1F              ; draw, y, x 
                    DB       $FF, -$02, +$20              ; draw, y, x 
                    DB       $FF, +$00, +$22              ; draw, y, x 
                    DB       $02                          ; endmarker 
Candle_2: 
                    DB       $01, -$19, -$1C              ; sync and move to y, x 
                    DB       $00, +$00, -$1C              ; additional sync move to y, x 
                    DB       $00, +$00, -$16              ; additional sync move to y, x 
                    DB       $FF, +$06, -$03              ; draw, y, x 
                    DB       $FF, +$07, +$09              ; draw, y, x 
                    DB       $FF, +$06, +$15              ; draw, y, x 
                    DB       $FF, +$04, +$15              ; draw, y, x 
                    DB       $FF, +$02, +$15              ; draw, y, x 
                    DB       $FF, +$00, +$17              ; draw, y, x 
                    DB       $FF, -$02, +$16              ; draw, y, x 
                    DB       $FF, -$04, +$14              ; draw, y, x 
                    DB       $FF, -$06, +$15              ; draw, y, x 
                    DB       $FF, -$07, +$09              ; draw, y, x 
                    DB       $FF, -$07, -$01              ; draw, y, x 
                    DB       $02                          ; endmarker 
Candle_3: 
                    DB       $01, -$06, +$7E              ; sync and move to y, x 
                    DB       $FF, -$4A, +$00              ; draw, y, x 
                    DB       $FF, -$4A, +$00              ; draw, y, x 
                    DB       $FF, -$4A, +$00              ; draw, y, x 
                    DB       $FF, -$4B, +$00              ; draw, y, x 
                    DB       $01, -$7F, -$7F              ; sync and move to y, x 
                    DB       $00, -$7F, +$00              ; additional sync move to y, x 
                    DB       $00, -$2A, +$00              ; additional sync move to y, x 
                    DB       $FF, +$49, +$01              ; draw, y, x 
                    DB       $FF, +$48, +$00              ; draw, y, x 
                    DB       $FF, +$49, +$00              ; draw, y, x 
                    DB       $FF, +$48, +$00              ; draw, y, x 
                    DB       $02                          ; endmarker 
;
                    include  "flashSupport.asm"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 if  VECFEVER = 1 
 else  
displayFlashError 
                    ldd      #defaultValuesStart 
                    std      currentFlashROMStart 
                    jsr      readOptionsOnly 
                    jsr      readHighscore 
flashErrorLoop 
;                    clra
;                    sta      <VIA_shift_reg
                    JSR      Wait_Recal_noShift           ;Wait_Recal 
                    ldd      #$fe50 
                    sta      Vec_Text_HW 
                    jsr      Intensity_5F 
                    lda      gameScale 
                    sta      VIA_t1_cnt_lo 
                    ldd      #$3090 
                    ldu      #error1 
                    jsr      sync_Print_Str_d_8           ;Print_Str_d 
                    ldd      #$1090 
                    ldu      #error2 
                    jsr      sync_Print_Str_d_8           ;Print_Str_d 
                    ldd      #$f090 
                    ldu      #error3 
                    jsr      sync_Print_Str_d_8           ;Print_Str_d 
                    JSR      Read_Btns                    ; get button status 
                    ldb      $C811                        ; button pressed - any 
                    andb     #1                           ; is button 1 
                    beq      flashErrorLoop 
REPLACE_1_2_doCalib0_varFrom0_31 
                    ldx      #0                           ; doCalib0 
                    jmp      jmpBank2_from0 

error1 
                    DB       "FLASH NOT FOUND",$80
error2 
                    DB       "DEFAULT OPTIONS USED",$80
error3 
                    DB       "SAVING DISABLED",$80
 endif  
;...................................
noChosen 
REPLACE_1_2_optionsLoop_varFrom0_321 
                    ldx      #0                           ; optionsLoop 
                    jmp      jmpBank2_from0 

;.............................................................................
doReset 
                    jsr      showResetMessage 
                    cmpu     #3                           ; was "yes" pressed? 
                    bne      noChosen 
                    ldu      #Ram_Options_Start 
                    ldx      #resetOptionsStart 
copyOptionLoop1 
                    lda      ,x+ 
                    sta      ,u+ 
                    cmpx     #resetOptionsEnd 
                    bne      copyOptionLoop1 
                    ldu      #Ram_HighScore_Start 
                    ldx      #resetHighScoreStart 
copyHighScoreLoop 
                    lda      ,x+ 
                    sta      ,u+ 
                    cmpx     #resetHighScoreEnd 
                    bne      copyHighScoreLoop 
                    ldu      #Ram_HardcoreScore_Start 
                    ldx      #resetHighScoreStart 
copyHighScoreLoop2 
                    lda      ,x+ 
                    sta      ,u+ 
                    cmpx     #resetHighScoreEnd 
                    bne      copyHighScoreLoop2 
                    jsr      saveBlockOnChange 
REPLACE_1_2_main00_varFrom0_321 
                    ldx      #0                           ; main00 
                    jmp      jmpBank2_from0 

 if  VECFEVER = 1 
 else  
 if  RECORD_GAME_DATA = 1 
getOneInputByte 
                    tst      pauseSave 
                    bne      retNow 
                    ldx      actionPointer 
                    ldb      ,x+ 
; stb current_button_state
                    stb      buttonTmp 
                    stx      actionPointer 
retNow 
                    rts                                   ; b "survives" bankswitch to bank 2! 

putOneInputByte 
                    tst      pauseSave 
                    bne      retNow 
                    ldx      actionPointer 
                    cmpx     #$b000 
                    bhs      noOutPutOOB 
                    ldx      #writeFlashByte_Start 
                    ldu      #putByteRAM 
writeFlashByte_copyNextWord_pbr 
                    ldd      ,x++ 
                    std      ,u++ 
                    cmpx     #writeFlashByte_End 
                    blo      writeFlashByte_copyNextWord_pbr 
                    lda      buttonTmp 
                    ldx      actionPointer 
                    jsr      putByteRAM 
                    leax     1,x 
                    stx      actionPointer 
noOutPutOOB 
                    rts      

 endif                                                    ; RECORD_GAME_DATA 
;
;..............................
;
; this is not ment to be resumed!
saveGameToFlashNMI                                        ;#isfunction  
; jsr eraseSector, assumes storage is "ff"ed
                    jsr      writeFlashByte_2RAM 
                    ldx      #$b000+1+$400 
                    lda      #SAVE_GAME_MARKER 
                    jsr      bank0flashUserRAM 
                    leax     1,x 
; write all RAM
                    ldu      #$c800 
writeNextRAMByteNMI 
                    lda      ,u+ 
                    jsr      bank0flashUserRAM 
                    leax     1,x 
                    cmpu     #$cc00 
                    blo      writeNextRAMByteNMI 
                    rts      

;
;..............................
;
;
;..............................
;
saveUREG            =        starobject_list              ; 
saveSREG            =        starobject_list+2            ; 
bank0flashUserRAM   =        starobject_list+4            ; 
saveGameToFlash                                           ;#isfunction  
                    stu      saveUREG 
                    sts      saveSREG 
                    jsr      eraseSectora000 
                    jsr      saveCurrentGame 
 if  RECORD_GAME_DATA = 1 
                    clr      pauseSave 
                    ldx      #$a000+1024+1 
                    stx      actionPointer 
 endif  
                    lda      flashAvailable 
                    ora      # SAVEGAME_AVAILABLE_BIT     ; game available 
                    sta      flashAvailable 
                    jmp      backFromStorage 

;
;..............................
;
loadGameFromFlash                                         ;#isfunction  
                    ldx      #$a000 
                    ldu      #$c800 
                    lda      ,x+ 
                    cmpa     #SAVE_GAME_MARKER 
                    bne      thereIsNoSavedGame 
                    ldb      flashAvailable 
copyGameLoop 
                    lda      ,x+ 
; check for data that should NOT be overwritten
; (high score, achievements, options etc)
; skip ram places which must be kept intact
 if  RECORD_GAME_DATA = 1 
 else  
; if loaded via "record" than do not leave out RAM!!!
; do also not overwrite the current save address in flash
                    cmpu     #currentFlashROMStart 
                    bne      noflashStart 
                    leax     1,x 
                    leau     2,u 
                    bra      notCopy2 

noflashStart 
                    cmpu     #Ram_Options_Start 
                    blo      copyOk2 
                                                          ; higher than options 
                    cmpu     #Ram_Options_End 
                    bhs      copyOk2 
; no ram overwrite
                    leau     1,u 
                    bra      notCopy2 

 endif  
copyOk2 
                    sta      ,u+ 
notCopy2 
                    cmpu     #$cc00 
                    bne      copyGameLoop 
                    stb      flashAvailable 
                    lda      flashAvailable 
                    ora      # SAVEGAME_IS_ACTIVE_BIT     ; no game available 
                    sta      flashAvailable 
 if  RECORD_GAME_DATA = 1 
                    ldx      #$a000+1024+1 
                    stx      actionPointer 
                    lda      #1 
                    sta      saveState 
                    clr      pauseSave                    ; if set for wahtever reason, no data will be loaded to input 
 endif  
backFromStorage 
                    ldu      saveUREG 
                    lds      saveSREG 
; reinit stars
; spawn 1 star!
REPLACE_1_2_initStars_varFrom1_31 
                    ldx      #0                           ; initStars 
                    jsr      jsrBank3_from0_SHIFT 
REPLACE_1_2_spawnStar_varFrom1_31 
                    ldx      #0                           ; spawnStar 
                    jsr      jsrBank3_from0_SHIFT 
 if  RECORD_GAME_DATA = 1 
REPLACE_1_2_backFromContinuesSave_varFrom1_3              ;  bank 2 replace 
                    ldx      #0                           ; backFromContinuesSave 
                    jmp      jmpBankIRQ3X 

 else  
REPLACE_1_2_pauseLoop_varFrom0_3                          ;  bank 2 replace 
                    ldx      #0                           ; pauseLoop 
                    jmp      jmpBank2_from0 

 endif  
thereIsNoSavedGame 
; todo jump back to loader place
;.
;.......................................................................
;.
; saves ALL 1024 bytes of RAM to flash!
;.
; needs flash "RAM" block
;.
; **************************************************************************
SAVE_GAME_MARKER    =        12                           ;some number != 0 and != ff 
saveCurrentGame                                           ;#isfunction  
                    lda      flashAvailable 
                    anda     # FLASH_AVAILABLE_BIT        ; no game available 
                    lbeq     flashErrorOut 
                    jsr      writeFlashByte_2RAMA000      ;copy flash write routine to RAM
                    ldx      #$a000
                    lda      #SAVE_GAME_MARKER 
                    jsr      bank0flashUserRAM 
;read all 1KBi of RAM and write to FLASH starting at $a001
                    leax     1,x
                    ldu      #$c800 
writeNextRAMByte 
                    lda      ,u                           ; read RAM once to ensure address lines are set
                    lda      ,u+                          ; now read it again and advance reg u
                    jsr      bank0flashUserRAM 
                    leax     1,x 
                    cmpu     #$cc00 
                    blo      writeNextRAMByte 
                    rts      

;.
;.......................................................................
;.
; -
; -----------------------------------------------------------
; -
checkForSavedGameFlash 
                    lda      $a000 
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
                    rts      

 endif  
;***************************************************************************
resetOptionsStart 
; options
                    db       0                            ; $7b ; calibrationValue6 
                    db       0                            ; $23 ; calibrationValue7 
                    db       0                            ; $23 ; calibrationValue16 
                    db       0                            ; $54 ; calibrationValue40 
                    db       0                            ; $56 ; calibrationValue50 
                    db       $80                          ; gameScale 
                    db       0                            ; shopAllowFlags 
                    db       0                            ; additionalFlags 
                    db       0,0,0,0,0,0                  ; achievements 
                    db       0                            ; secretFlags 
                    db       0                            ; maxLevelReached 
resetOptionsEnd 
resetHighScoreStart 
; highscore
                    db       "MAL", $00,$00,$04,$00, $00  ; 3 Name, 4*2 bcd, 1 level
                    db       "TOM", $00,$00,$03,$00, $00
                    db       "VTK", $00,$00,$02,$00, $00
                    db       "ALX", $00,$00,$01,$00, $00
resetHighScoreEnd 



 if ADDITIONAL_INPUT = 1
toggleInputOption


 ldb additionalFlags
 bitb #BIT_INPUT_VARIANT
 beq switchToButtons
 andb #$f-BIT_INPUT_VARIANT
 stb additionalFlags
 jsr showJoystickMessage
 bra doneHere11

switchToButtons
 orb #BIT_INPUT_VARIANT
 stb additionalFlags
 jsr showButtonMessage

doneHere11

 jsr saveBlockOnChange 


REPLACE_1_2_noChangeSelPos_varFrom0_3                          ;  bank 2 replace 
                    ldx      #0                           ; noChangeSelPos 
                    jmp      jmpBank2_from0 

 endif




 if  VECFEVER = 1 
 else  
; game save
                    org      $a000 
 if  RECORD_GAME_DATA = 1 
                    db       $0C, $00, $00, $00, $00, $00, $00, $00, $3F, $00, $00, $00, $00, $00, $00, $05 
                    db       $00, $05, $7F, $00, $00, $16, $00, $00, $02, $96, $00, $00, $01, $00, $00, $00 
                    db       $00, $00, $2A, $00, $17, $4C, $15, $B9, $00, $00, $00, $F8, $50, $02, $EE, $00 
                    db       $00, $05, $C4, $05, $D4, $03, $33, $02, $6A, $10, $D6, $00, $E2, $00, $30, $75 
                    db       $00, $00, $00, $00, $00, $00, $3F, $00, $00, $00, $00, $00, $00, $00, $0A, $00 
                    db       $8F, $38, $00, $C9, $EC, $FF, $FF, $00, $00, $31, $32, $32, $31, $35, $34, $34 
                    db       $78, $32, $80, $27, $D7, $20, $01, $03, $00, $CA, $01, $00, $DE, $01, $00, $00 
                    db       $00, $00, $44, $0D, $36, $74, $A7, $6D, $04, $01, $09, $04, $04, $01, $00, $CD 
                    db       $03, $00, $C9, $B8, $C9, $AB, $01, $CA, $16, $C9, $EC, $00, $CB, $90, $C8, $36 
                    db       $00, $C9, $03, $C8, $32, $00, $C9, $8B, $C9, $7B, $01, $01, $00, $03, $01, $00 
                    db       $57, $58, $53, $4A, $84, $3B, $82, $3B, $7F, $63, $11, $18, $01, $0A, $65, $0A 
                    db       $B1, $40, $00, $01, $20, $20, $39, $80, $01, $00, $00, $16, $FD, $1D, $11, $23 
                    db       $23, $30, $2B, $00, $01, $C9, $7F, $00, $00, $A4, $03, $33, $00, $48, $00, $00 
                    db       $44, $03, $33, $00, $48, $CB, $FA, $00, $0A, $00, $00, $7F, $7F, $00, $00, $7F 
                    db       $00, $00, $02, $01, $00, $05, $28, $50, $2D, $E6, $A0, $E8, $12, $01, $90, $04 
                    db       $00, $64, $00, $0C, $0B, $00, $04, $6A, $01, $85, $00, $E9, $00, $83, $44, $00 
                    db       $01, $00, $A8, $49, $E1, $A0, $6E, $9C, $C9, $0F, $2C, $FF, $FF, $FA, $01, $FA 
                    db       $E3, $BA, $6E, $9C, $C9, $1B, $30, $FF, $FF, $5C, $01, $5C, $E2, $AB, $6E, $9C 
                    db       $C9, $27, $1B, $FF, $FF, $90, $01, $D0, $04, $89, $6E, $9C, $C9, $33, $0E, $FF 
                    db       $00, $7C, $01, $24, $28, $A7, $6E, $9C, $C9, $3F, $1B, $01, $00, $0E, $01, $9C 
                    db       $92, $61, $6C, $9D, $C9, $4B, $FE, $68, $FF, $F6, $02, $F6, $94, $57, $6C, $9D 
                    db       $C9, $57, $02, $02, $32, $41, $02, $0B, $94, $34, $6C, $9D, $C9, $63, $4F, $E1 
                    db       $0B, $21, $02, $54, $94, $7A, $6C, $9D, $C9, $6F, $21, $C9, $5D, $06, $02, $32 
                    db       $55, $6D, $0B, $21, $C8, $32, $06, $06, $32, $55, $C8, $0B, $C7, $8B, $54, $E6 
                    db       $C8, $34, $00, $09, $82, $00, $55, $79, $C9, $9B, $16, $8E, $93, $FA, $54, $E6 
                    db       $C9, $93, $04, $04, $93, $00, $55, $79, $C9, $83, $16, $06, $08, $F1, $55, $79 
                    db       $C9, $A3, $10, $06, $8D, $27, $55, $79, $C8, $34, $28, $8A, $C9, $AB, $CB, $FC 
                    db       $C6, $AA, $F7, $55, $55, $C6, $55, $F7, $2A, $AA, $C6, $A0, $F7, $55, $55, $A7 
                    db       $84, $E6, $84, $E8, $84, $C4, $40, $26, $F8, $39, $30, $B7, $A0, $00, $F6, $00 
                    db       $00, $F8, $00, $00, $C5, $40, $26, $F6, $39, $B6, $84, $C4, $40, $26, $F8, $39 
                    db       $4E, $3E, $76, $16, $C9, $D2, $3F, $F5, $81, $7D, $B3, $41, $B2, $82, $BE, $5B 
                    db       $8D, $CA, $01, $07, $8A, $C1, $29, $01, $DF, $00, $89, $DF, $00, $08, $FF, $00 
                    db       $30, $BD, $82, $90, $5C, $15, $C8, $30, $BC, $AB, $16, $AA, $01, $00, $00, $90 
                    db       $54, $01, $0A, $FF, $00, $2D, $EA, $01, $D9, $4E, $D7, $CA, $2B, $30, $EE, $CE 
                    db       $00, $40, $00, $09, $8A, $5B, $00, $39, $FF, $00, $30, $CB, $58, $05, $4E, $D7 
                    db       $CA, $40, $3F, $6C, $05, $FE, $80, $CF, $3C, $D0, $C3, $02, $39, $FF, $00, $3F 
                    db       $27, $32, $D8, $4E, $D7, $CA, $55, $30, $EE, $D8, $8C, $80, $EB, $00, $8F, $CE 
                    db       $05, $39, $FF, $00, $30, $CB, $5B, $FA, $4E, $D7, $CA, $6A, $3F, $6C, $FA, $60 
                    db       $40, $00, $45, $D8, $CB, $00, $39, $FF, $00, $3F, $27, $32, $DC, $4E, $D7, $CA 
                    db       $7F, $30, $EE, $DC, $10, $80, $3F, $00, $8F, $CE, $05, $39, $FF, $00, $30, $CB 
                    db       $69, $00, $4E, $D7, $CA, $94, $34, $00, $00, $00, $40, $00, $01, $8F, $CE, $00 
                    db       $39, $FF, $00, $33, $D4, $32, $F8, $4E, $D7, $CA, $A9, $30, $2A, $F8, $30, $FF 
                    db       $FF, $00, $8F, $CE, $05, $39, $FF, $00, $2D, $F1, $6F, $08, $4E, $D7, $CA, $BE 
                    db       $30, $2A, $00, $00, $80, $2B, $1A, $89, $DF, $00, $39, $FF, $00, $2D, $F1, $3C 
                    db       $8B, $4E, $D7, $CA, $D3, $3F, $6C, $8B, $7A, $00, $33, $64, $D8, $0D, $00, $39 
                    db       $FF, $00, $3F, $27, $60, $A0, $4E, $D7, $CA, $E8, $3F, $6C, $A0, $64, $74, $CA 
                    db       $23, $00, $24, $00, $39, $FF, $00, $3F, $20, $64, $ED, $4E, $D7, $CA, $FD, $3F 
                    db       $6C, $ED, $00, $00, $02, $1A, $08, $00, $01, $39, $FF, $00, $3F, $20, $A5, $00 
                    db       $7C, $00, $CB, $12, $32, $65, $1E, $B5, $74, $CA, $F6, $33, $81, $FF, $FE, $00 
                    db       $00, $88, $32, $65, $4B, $B5, $74, $CB, $27, $33, $09, $00, $07, $00, $33, $78 
                    db       $32, $96, $14, $78, $32, $00, $01, $10, $01, $00, $0F, $0F, $CB, $3C, $06, $0A 
                    db       $63, $E6, $00, $00, $02, $F0, $FF, $A3, $D7, $FF, $00, $46, $FF, $15, $73, $FF 
                    db       $2B, $CB, $51, $58, $B8, $FF, $8B, $25, $01, $00, $03, $E0, $FF, $B5, $C8, $00 
                    db       $28, $55, $FF, $C8, $4B, $FF, $CB, $66, $FF, $4B, $38, $FF, $D8, $AB, $FF, $38 
                    db       $B5, $FF, $AB, $28, $00, $FF, $00, $00, $00, $00, $D0, $CB, $7B, $F0, $FF, $10 
                    db       $40, $FF, $F0, $03, $00, $40, $F0, $FF, $40, $00, $FF, $F0, $C0, $FF, $10, $C0 
                    db       $C8, $30, $10, $01, $FF, $00, $00, $00, $D0, $10, $FF, $40, $40, $FF, $00, $E0 
                    db       $FF, $C2, $9B, $AB, $E8, $CB, $9A, $C2, $0A, $18, $44, $E2, $9B, $AB, $E8, $CB 
                    db       $A4, $E2, $12, $18, $44, $A2, $9B, $AB, $E8, $CB, $AE, $A2, $02, $18, $44, $7E 
                    db       $9F, $B1, $73, $CB, $B8, $7E, $39, $00, $04, $62, $9B, $82, $84, $CB, $C2, $CA 
                    db       $16, $BC, $AB, $16, $AA, $01, $00, $CB, $CC, $54, $01, $0A, $FF, $00, $2D, $EA 
                    db       $82, $CB, $D6, $8D, $CA, $01, $07, $8A, $C1, $29, $01, $CB, $E0, $89, $DF, $00 
                    db       $08, $FF, $00, $30, $BD, $C8, $36, $F6, $17, $00, $00, $B6, $20, $9C, $F7, $44 
                    db       $0B, $9C, $F7, $CB, $BA, $C8, $30, $02, $2B, $9D, $A5, $9D, $28, $FE, $00, $00 
                    db       $00, $F7, $01, $F7, $01, $F7, $01, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7 
                    db       $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7 
                    db       $FF, $F7, $FF, $F7, $FF, $F7, $FF, $F7, $FF, $F7, $FF, $F7, $FF, $F7, $FF, $F7 
                    db       $00, $F7, $00, $F7, $00, $F7, $00, $F7, $01, $F7, $01, $F7, $01, $F7, $01, $F7 
                    db       $01, $F7, $01, $F7, $01, $F7, $01, $F7, $01, $F7, $01, $F7, $01, $F7, $01, $F7 
                    db       $01, $F7, $01, $F7, $01, $F7, $01, $F7, $01, $F7, $01, $F7, $01, $F7, $01, $F7 
                    db       $01, $F7, $01, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $FF, $F7 
                    db       $FF, $F7, $FF, $F7, $FF, $F7, $FF, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7 
                    db       $00, $F7, $00, $F7, $FF, $F7, $FF, $F7, $FF, $F7, $FF, $F7, $FF, $F7, $FF, $F7 
                    db       $FF, $F7, $FF, $F7, $FF, $F7, $FF, $F7, $FF, $F7, $00, $F7, $00, $F7, $00, $F7 
                    db       $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7 
                    db       $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7 
                    db       $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7 
                    db       $00, $F7, $00, $F7, $01, $F7, $01, $F7, $01, $F7, $01, $F7, $01, $F7, $01, $F7 
                    db       $01, $F7, $01, $F7, $01, $F7, $01, $F7, $01, $F7, $01, $F7, $01, $F7, $01, $F7 
                    db       $01, $F7, $01, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $FF, $F7 
                    db       $FF, $F7, $FF, $F7, $FF, $F7, $FF, $F7, $FF, $F7, $FF, $F7, $FF, $F7, $FF, $F7 
                    db       $FF, $F7, $FF, $F7, $FF, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7 
                    db       $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7 
                    db       $00, $F7, $00, $F7, $01, $F7, $01, $F7, $01, $F7, $01, $F7, $01, $F7, $01, $F7 
                    db       $01, $F7, $01, $F7, $01, $F7, $01, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7 
                    db       $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7 
                    db       $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7 
                    db       $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7 
                    db       $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7 
                    db       $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7 
                    db       $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7 
                    db       $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7 
                    db       $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7 
                    db       $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $01, $F7 
                    db       $01, $F7, $01, $F7, $01, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7 
                    db       $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7 
                    db       $00, $F7, $00, $F7, $00, $F7, $FF, $F7, $FF, $F7, $FF, $F7, $FF, $F7, $00, $F7 
                    db       $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7 
                    db       $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $FF, $F7, $FF, $F7 
                    db       $FF, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7, $00, $F7 
                    db       $00, $F7, $00, $F7, $FF, $F7, $FF, $F7, $FF, $F7, $00, $F7, $00, $F7, $00, $F7 
                    db       $00, $F7, $00, $F7, $01, $F7, $01, $F7, $01, $F7, $01, $F7, $01, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
                    db       $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF 
 endif  
; highscore savings
                    org      $b000 
flashRAMROM 
;
;                    struct   OptionStruct
;                    ds       O_CALIB_SWARM, 1
;                    ds       O_CALIB_VECTOR, 1
;                    ds       O_CALIB_MH, 1
;                    ds       O_CALIB_TEXT, 1
;                    ds       O_CALIB_BOSS, 1
;                    ds       O_GAMESCALE, 1
;                    ds       O_SHOP_ALLOW, 1
;                    ds       O_OFFICER_RANK, 1              ; not done
;                    ds       O_DOWNGRADE_IMMUNITY, 1        ;
;                    ds       O_ACHIEVEMENTS, 5              ; not done
;                    ds       O_SECRETS, 1              ; not done
;                    end struct
;
;calibrationValue6   ds       1                            ; swarm
;calibrationValue7   ds       1                            ; Calibration ZeroRef value (Kirstof Tuts) stored here
;calibrationValue16  ds       1                            ;
;calibrationValue40  ds       1                            ; text
;calibrationValue50  ds       1                            ; boss
;gameScale           ds       1
;shopAllowFlags      ds       1 ; can be calculated from achievements and in game secrets!
;officerRank         ds       1
;downgradeImmunity   ds       1 ; can also be cylculated
;achievements        ds       1+4 ; 40 bitflags
;secret_flags        ds       1
;
; struct FlashBlock
;    ds  NEXT_FREE_FLASHBLOCK, 2; $ffff or $0000 no block available -> erase sector
;    ds  OPTION_BLOCK, OptionStruct
;    ds  OPTION_BLOCK, HighScoreEntry*4 ; or more
; end struct
defaultValuesStart 
; options
 if  ASSUME_CALIBRATION = 1 
                    db       $7b                          ; calibrationValue6 
                    db       $23                          ; calibrationValue7 
                    db       $23                          ; calibrationValue16 
                    db       $54                          ; calibrationValue40 
                    db       $56                          ; calibrationValue50 
 else  
                    db       0                            ; $7b ; calibrationValue6 
                    db       0                            ; $23 ; calibrationValue7 
                    db       0                            ; $23 ; calibrationValue16 
                    db       0                            ; $54 ; calibrationValue40 
                    db       0                            ; $56 ; calibrationValue50 
 endif                                                    ; ASSUME_CALIBRATION = 1 
                    db       $80                          ; gameScale 
                    db       0                            ; shopAllowFlags 
                    db       0                            ; additionalFlags 
;                    db       0                            ; downgradeImmunity
 if  LEVEL_SELECT = 1 
;ACHIEVEMENT_FLAG_BYTE3_BLADEMASTER_RANK5 = %00000001 ; checked each roll over
;ACHIEVEMENT_FLAG_BYTE3_BLADEMASTER_RANK4 = %00000010
;ACHIEVEMENT_FLAG_BYTE3_BLADEMASTER_RANK3 = %00000100
;ACHIEVEMENT_FLAG_BYTE3_BLADEMASTER_RANK2 = %00001000
;ACHIEVEMENT_FLAG_BYTE3_BLADEMASTER_RANK1 = %00010000
                    db       0,0,%01111111,0,0,0          ;%00000111 ; achievements 
 else  
                    db       0,0,0,0,0,0                  ; achievements 
 endif                                                    ; LEVEL_SELECT = 1 
                    db       0                            ; secretFlags 
                    db       0                            ; maxLevelReached 
; highscore
                    db       "MAL", $00,$00,$04,$00, $00  ; 3 Name, 4*2 bcd, 1 level
                    db       "TOM", $00,$00,$03,$00, $00
                    db       "VTK", $00,$00,$02,$00, $00
                    db       "ALX", $00,$00,$01,$00, $00
hardcore 
                    db       "MAL", $00,$00,$04,$00, $00  ; 3 Name, 4*2 bcd, 1 level
                    db       "TOM", $00,$00,$03,$00, $00
                    db       "VTK", $00,$00,$02,$00, $00
                    db       "ALX", $00,$00,$01,$00, $00
defaultValuesEnd 
                    ds       $1000 -(defaultValuesEnd-defaultValuesStart) - 4*HighScoreEntry, 0xff ; test ,,, 

 endif  
 if  VECFEVER = 1 
; wheel sound data
noiseOnlyDeAccelData: 
                    DB       $EF, $5D, $0D, $00, $D0, $20 
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



