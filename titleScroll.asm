; bank 0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; implements the vertical scroller on the 
; desktop
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SCROLLTEXTSIZE      =        $35 
BITMAP_LINES_TITLE  =        35                           ;45 ; if higher, the positioning has 8 bit problems, than the "spacing" (4/8) must be adjusted to fit 8 bit ; 25 
SPACE_BETWEEN_LINES  =       2                            ;2 
SPACE_BETWEEN_STRINGS  =     6*SPACE_BETWEEN_LINES        ; must be multiplyer of lines 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; u pointer to String
; in ,s position where position is synced to
NEXT_SYNC_BITMAP_LINE2_FIRST  macro  
; zero is short, since we stay near center -> no wait loop!
                    ldd      #(%10000010)*256+$CC         ; zero the integrators 
                    stb      <VIA_cntl                    ; store zeroing values to cntl 
                    clr      <VIA_port_a                  ; reset integrator offset 
                    sta      <VIA_port_b                  ; while waiting, zero offsets 
                    inca     
                    sta      <VIA_port_b 
                    ldd      ,s 
                    addb     it_xlinePrintOffset 
                    MY_MOVE_TO_D_START_NO_SHIFT           ; from now on "in move" 
                    lda      ,s 
                    suba     #SPACE_BETWEEN_LINES 
                    sta      ,s                           ; next line of font is this much further down 
                    cmpx     #FONT_START_A + ((FONT_HEIGHT-1)*FONT_LENGTH) 
                    bne      continuePrinting\? 
                    lda      ,s 
                    suba     #SPACE_BETWEEN_STRINGS 
                    sta      ,s                           ; next line of font is this much further down 
; somehow get next x offset!
nextOne\? 
                    lda      ,u+ 
                    bpl      nextOne\? 
                    lda      ,u 
                    sta      it_xlinePrintOffset 
                    leau     ,y 
                    bra      skipWait\? 

continuePrinting\? 
; when using higher scale for screen positioing - adjust these waits!
                    WAIT36                                ; uses S register for a PSHS wait! 
;                    tfr      a,a                            ; 6 WAIT 
;                    tfr      a,a                            ; 6 WAIT 
;                    nop      2                              ; 4 WAIT 
;                    nop      10                             ; 20 WAIT 
skipWait\? 
                    ldd      #$1881                       ; preload values ;a?AUX: b?ORB: $8x = Disable RAMP, Disable Mux, mux sel = 01 (int offsets) 
                    STB      <VIA_port_b                  ;ramp off/on set mux to channel 1 
                    STA      <VIA_aux_cntl                ;Shift reg mode = 110 (shift out under system clock), T1 PB7 disabled, one shot mode 
                    CLR      <VIA_port_a                  ;Clear D/A output 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    decb     
                    stb      <VIA_port_b                  ;Enable mux, y = 0 
                    incb     
 else  
                    dec      <VIA_port_b 
 endif  
                    nop                                   ; if not done on a real vectrex - uper lines end up slighjtly diagonal 
                    stb      <VIA_port_b                  ;Disable mux 
                    ldd      #SCROLLTEXTSIZE*256+01 
                    STA      <VIA_port_a                  ;Send it to the D/A 
                    STb      <VIA_port_b                  ;[4]enable RAMP, disable mux (start moving) 
                    LDa      ,U+                          ;Get next character 
decodeChar\? 
                    LDA      A,X                          ;Get bitmap from chargen table 
                    STA      <VIA_shift_reg               ;Save in shift register 
                    LDa      ,U+                          ;Get next character 
                    BPL      decodeChar\?                 ;Go back if not terminator 
                    LDd      #$98cc                       ;restore aux settings and zero 
                    STd      <VIA_aux_cntl                ;T1?PB7 enabled 
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; u pointer $80 +1
; in ,s position where position is synced to
NEXT_SYNC_BITMAP_LINE2_NEXT  macro  
; zero is short, since we stay near center -> no wait loop!
; zero was done by last printing 
                    ldd      #(%10000000)*256             ; zero the integrators 
                                                          ; stb <VIA_cntl ; store zeroing values to cntl 
                    stb      <VIA_port_a                  ; reset integrator offset 
                    sta      <VIA_port_b                  ; while waiting, zero integrators (enable mux to "y") 
                    inca     
                    sta      <VIA_port_b                  ; disable mux 
                    ldd      ,s                           ; load position 
                    addb     it_xlinePrintOffset 
                    MY_MOVE_TO_D_START_NO_SHIFT           ; move there, from now on "in move" 
                    dec      tmp2_lc                      ; test if line max reached, if so jump out of endless loop (out of macro) 
                    beq      breakDueTo25Lines 
                    lda      ,s                           ; ensure spacing between bitmap lines 
                    suba     #SPACE_BETWEEN_LINES 
                    sta      ,s                           ; next line of font is this much further down 
                    LEAx     FONT_LENGTH,x                ; ensure FONT is pointing to "row" of bitmap 
                    cmpx     #FONT_START_A + (FONT_HEIGHT*FONT_LENGTH) ; if end -> start next String 
                    beq      nextLineToPrint\? 
                    cmpx     #FONT_START_A + ((FONT_HEIGHT-1)*FONT_LENGTH) ; if one before end, ensure, next time position is updated wirh "in between string" spacing 
                    bne      continueNormalLinePrinting\? 
                    ldb      ,u 
                    stb      it_xlinePrintOffset 
                    lda      ,s 
                    suba     #SPACE_BETWEEN_STRINGS 
                    sta      ,s                           ; next line of font is this much further down 
continueNormalLinePrinting\? 
                    leau     ,y                           ; reset u 
                    bra      continuePrinting\? 

nextLineToPrint\? 
; u is correct
                    ldb      ,u+                          ; neg is end of list, value is xline offset, skip it! 
                    bmi      completelyOutOfHere 
                    leay     ,u                           ; save current u 
                    Ldx      #FONT_START_A                ; start new font "row" 
continuePrinting\? 
                    nop      2                            ; WAIT 
; waiting for timer to expire
                    ldd      #$1881                       ; preload values ;a?AUX: b?ORB: $8x = Disable RAMP, Disable Mux, mux sel = 01 (int offsets) 
                    STB      <VIA_port_b                  ;ramp off/on set mux to channel 1 
                    STA      <VIA_aux_cntl                ;Shift reg mode = 110 (shift out under system clock), T1 PB7 disabled, one shot mode 
                    CLR      <VIA_port_a                  ;Clear D/A output 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    decb     
                    stb      <VIA_port_b                  ;Enable mux, y = 0 
                    incb     
 else  
                    dec      <VIA_port_b 
                    nop                                   ; if not done on a real vectrex - uper lines end up slighjtly diagonal 
 endif  
                    stb      <VIA_port_b                  ;Disable mux 
                    ldd      #SCROLLTEXTSIZE*256+01 
                    STA      <VIA_port_a                  ;Send it to the D/A 
                    STb      <VIA_port_b                  ;[4]enable RAMP, disable mux (start moving) 
                    LDa      ,U+                          ;Get next character 
decodeChar\?: 
                    LDA      A,X                          ;Get bitmap from chargen table 
                    STA      <VIA_shift_reg               ;Save in shift register 
                    LDa      ,U+                          ;Get next character 
                    BPL      decodeChar\?                 ;Go back if not terminator 
                    LDd      #$98cc                       ;restore aux settings and zero 
                    STd      <VIA_aux_cntl                ;T1?PB7 enabled 
                    endm     
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; in u pointer to first line of String "pointers"
; "BITMAP_LINES_TITLE" lines are printed
; in a NO of String line to start with, assumed < FONT_HEIGHT
; in x sync coordinates
; 
printStringList_25_Sync_direct                            ;#isfunction  
; put move position on stack put it so, that we can load "d" directly from stack
                    pshs     x 
                    LDX      #FONT_START_A                ;Point to start of chargen bitmaps 
; start at position IN Char
overstepOtherFontLine2 
                    deca     
                    bmi      fontPosOk2 
                    LEAx     FONT_LENGTH,x 
                    bra      overstepOtherFontLine2 

fontPosOk2 
;if (x == FONT_START_A+5*FONT_LENGTH) -> reset and find new string line
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; POSITION "EXACT" PATCH assuming x pos is middle aligned, 
; if that is a case we can use neg x pos as "opposite" string pos
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; we assume we ARE zeroing here!
                    ldd      #(%10000000)*256             ; zero the integrators 
                                                          ; stb <VIA_port_a ; reset integrator offset 
                                                          ; lda #%10000010 
                                                          ; wait that zeroing surely has the desired effect! 
                    std      <VIA_port_b                  ; while waiting, zero offsets 
                    ldd      ,s 
                    negb     
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    lda      #BITMAP_LINES_TITLE          ; that many lines must be printed 
                    sta      tmp2_lc 
                    lda      ,u+ 
                    leay     ,u                           ; in y always a savecopy of current u AFTER the offset 
                    sta      it_xlinePrintOffset 
                    MY_MOVE_TO_A_END  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                    NEXT_SYNC_BITMAP_LINE2_FIRST  
repeatTillBreak 
                    NEXT_SYNC_BITMAP_LINE2_NEXT  
                    bra      repeatTillBreak 

breakDueTo25Lines 
; zero
                    clra     
                    MY_MOVE_TO_B_END                      ; ensure timer is finished, otherwise we leave our trusty bank 0 
                    sta      <VIA_shift_reg 
                    puls     d ,pc                        ; all done, correct stack 
; end if string list encountered
completelyOutOfHere 
                    MY_MOVE_TO_B_END                      ; ensure timer is finished, otherwise we leave our trusty bank 0 
                    LDd      #$98cc                       ;[2]disable mux, disable ramp 
                    STd      <VIA_aux_cntl                ;T1?PB7 enabled 
                    puls     d ,pc                        ; all done, correct stack 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
