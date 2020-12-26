; all banks
                    include  "waitMacros.i"
SWITCH_TO_SHORT_SHIELD  macro  
 if  SHORT_INVULNERABILITY 
                    lda      playerBonusActive 
                    anda     #$ff-BITFIELD_ARMOR 
                    ora      # BITFIELD_SHIELD 
                    sta      playerBonusActive 
                    lda      #50                          ; 1 secpnd 
                    sta      playerBonusCounter+1 
                    clr      playerBonusCounter 
 endif  
                    endm     
; this file is part of Release, written by Malban in 2017
;
;***************************************************************************
_LDD                macro    pa, pb 
                    ldd      #(lo(pa)*256)+(lo(pb)) 
                    endm     
;***************************************************************************
_DP_TO_C8           macro                                 ; pretty for optimizing to use a makro :-) 
                    LDA      #$C8 
                    TFR      A,DP 
                    direct   $C8 
                    endm     
;***************************************************************************
_DP_TO_D0           macro                                 ; pretty for optimizing to use a makro :-) 
                    LDA      #$D0 
                    TFR      A,DP 
                    direct   $D0 
                    endm     
NEG_D               macro    
                    COMA     
                    COMB     
                    ADDD     #1 
                    endm                                  ; done 
;***************************************************************************
RESET_VECTOR_BEAM   macro    
                    LDA      #$CC 
                    STA      <VIA_cntl                    ;/BLANK low and /ZERO low 
                    lda      #$83                         ; a = $18, b = $83 disable RAMP, muxsel=false, channel 1 (integrators offsets) 
                    clr      <VIA_port_a                  ; Clear D/A output 
                    sta      <VIA_port_b                  ; set mux to channel 1, leave mux disabled 
                    deca     
                    sta      <VIA_port_b                  ; enable mux, reset integrator offset values 
                                                          ;nop 4 
                    LDA      #$CE 
                    STA      <VIA_cntl                    ;/BLANK high and /ZERO low 
                    LDA      #$81 
                    STA      <VIA_port_b                  ; Disable mux 
                    endm     
;***************************************************************************
_SCALE              macro    value 
                    LDA      #\1                          ; scale for placing first point 
                    _SCALE_A  
                    endm     
;***************************************************************************
_SCALE_A            macro    
                    STA      VIA_t1_cnt_lo                ; move to time 1 lo, this means scaling 
                    endm     
;***************************************************************************
MY_WAIT_RECAL       macro    
                    direct   $d0 
                    LDA      #$20 
                    ldx      Vec_Loop_Count               ; recal counter, about 21 Minutes befor roll over 
                    leax     1,x 
                    stx      Vec_Loop_Count 
                    ldb      <VIA_t2_hi 
                    stb      t2_rest 
LF19E\?:            BITA     <VIA_int_flags               ;Wait for timer t2 
                    BEQ      LF19E\? 
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
                    endm     
;***************************************************************************
_ZERO_VECTOR_BEAM2  macro    
                    LDB      #$CC 
                    STB      VIA_cntl                     ;/BLANK low and /ZERO low 
                    clra     
                    sta      <VIA_port_a                  ;clear D/A register 
                    LDD      #$0302 
                    STA      <VIA_port_b                  ;mux=1, disable mux 
                    STB      <VIA_port_b                  ;mux=1, enable mux 
                    LDB      #$01 
                    STB      <VIA_port_b                  ;disable mux 
                    endm     
_ZERO_VECTOR_BEAM   macro    
                    LDB      #$CC 
                    STB      VIA_cntl                     ;/BLANK low and /ZERO low 
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; macro D = D *2
MY_LSL_D            macro    
                    ASLB     
                    ROLA     
                    endm                                  ; done 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; macro D = D /2
MY_LSR_D            macro    
                    ASRA     
                    RORB     
                    endm                                  ; done 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; "random" Galois LFSR
RANDOM_A            macro    
                    lda      random_seed 
                    lsra     
                    bcc      noEOR\? 
                    eora     #$d4 
noEOR\? 
                    sta      random_seed 
                    endm     
RANDOM_A_TEST       macro    
                    RANDOM_A  
 if  FUCKY_TESTING = 1 
                    ldb      bonusRandomCounter 
                    cmpb     #$80+28                      ; 27, 28 is different is still same 
                    bgt      doNothing2\? 
                    swi      
doNothing2\? 
 endif  
                    lda      random_seed 
                    endm     
RANDOM_A_SW         macro    
                    RANDOM_A  
                    endm     
RANDOM_B            macro    
                    ldb      random_seed 
                    lsrb     
                    bcc      noEOR\? 
                    eorb     #$d4 
noEOR\? 
                    stb      random_seed 
                    endm     
RANDOM_A2           macro    
                    lda      random_seed2 
                    lsra     
                    bcc      noEOR\? 
                    eora     #$d4 
noEOR\? 
                    sta      random_seed2 
                    endm     
RANDOM_A2_f         macro    
                    lda      random_seed2 
                    asla     
                    eora     random_seed2 
                    asla     
                    eora     random_seed2 
                    asla     
                    asla     
                    eora     random_seed2 
                    asla     
                    rol      random_seed2 
; hey dissi "pri nt a = #a"
                    endm     
RANDOM_A_f          macro    
                    lda      random_seed 
                    asla     
                    eora     random_seed 
                    asla     
                    eora     random_seed 
                    asla     
                    asla     
                    eora     random_seed 
                    asla     
                    rol      random_seed 
; hey dissi "pri nt a = #a"
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;***************************************************************************
;***************************************************************************
; expect DP = d0
; playes one piece of music, that is given as param
INIT_MUSIC          macro    musicPiece 
                    ldu      musicPiece                   ; this piece of music 
                    jSR      PLY_INIT                     ; NOW 
                    endm     
;***************************************************************************
 if  IS_VIA_FAULTY_RESISTENT = 1 
MY_MOVE_TO_D_START  macro    
                    STA      <VIA_port_a                  ;Store Y in D/A register 
                    LDA      #$CE                         ;Blank low, zero high? 
                    STA      <VIA_cntl                    ; 
                    CLRA     
                    STA      <VIA_port_b                  ;Enable mux ; hey dis si "break integratorzero 440" 
                    nop      
                    lda      #$81                         ; y must be set more than xx cycles on some vectrex 
                    sta      <VIA_port_b                  ;Disable mux 
                    CLRA     
                    STB      <VIA_port_a                  ;Store X in D/A register 
                    STA      <VIA_t1_cnt_hi               ;enable timer 
                    endm     
MY_MOVE_TO_D_START_NO_SHIFT  macro  
                    STA      <VIA_port_a                  ;Store Y in D/A register 
                    LDA      #$CE                         ;Blank low, zero high? 
                    STA      <VIA_cntl                    ; 
                    CLRA     
                    STA      <VIA_port_b                  ;Enable mux ; hey dis si "break integratorzero 440" 
                    nop      
                    lda      #$81                         ; y must be set more than xx cycles on some vectrex 
                    sta      <VIA_port_b                  ;Disable mux 
                    CLRA     
                    STB      <VIA_port_a                  ;Store X in D/A register 
                    STA      <VIA_t1_cnt_hi               ;enable timer 
                    endm     
 else  
MY_MOVE_TO_D_START  macro    
                    STA      <VIA_port_a                  ;Store Y in D/A register 
                    LDA      #$CE                         ;Blank low, zero high? 
                    STA      <VIA_cntl                    ; 
                    CLRA     
                    STA      <VIA_port_b                  ;Enable mux ; hey dis si "break integratorzero 440" 
                    nop                                   ; y must be set more than xx cycles on some vectrex 
                    INC      <VIA_port_b                  ;Disable mux 
                    STB      <VIA_port_a                  ;Store X in D/A register 
                    STA      <VIA_t1_cnt_hi               ;enable timer 
                    endm     
MY_MOVE_TO_D_START_NO_SHIFT  macro  
                    STA      <VIA_port_a                  ;Store Y in D/A register 
                    LDA      #$CE                         ;Blank low, zero high? 
                    STA      <VIA_cntl                    ; 
                    CLRA     
                    STA      <VIA_port_b                  ;Enable mux ; hey dis si "break integratorzero 440" 
                    nop      
                                                          ; nop 
                    INC      <VIA_port_b                  ;Disable mux 
                    STB      <VIA_port_a                  ;Store X in D/A register 
                    STA      <VIA_t1_cnt_hi               ;enable timer 
                    endm     
 endif  
MY_MOVE_TO_A_END    macro    
                    local    LF33D 
                    LDA      #$40                         ; 
LF33D\?:            BITA     <VIA_int_flags               ; 
                    BEQ      LF33D\?                      ; 
                    endm     
MY_MOVE_TO_B_END    macro    
                    local    LF33D 
                    LDB      #$40                         ; 
LF33D\?:            BITB     <VIA_int_flags               ; 
                    BEQ      LF33D\?                      ; 
                    endm     
MY_MOVE_TO_D_END    macro    
                    local    LF33D 
                    LDB      #$40                         ; 
LF33D\?:            BITB     <VIA_int_flags               ; 
                    BEQ      LF33D\?                      ; 
                    endm     
MY_MOVE_TO_D        macro    
; optimzed, tweaked not perfect... 'MOVE TO D' makro
                    MY_MOVE_TO_D_START  
                    MY_MOVE_TO_B_END  
                    endm     
;***************************************************************************
_INTENSITY_A_8      macro    
                    STA      <VIA_port_a                  ;Store intensity in D/A 
;                    LDD      #$8584                       ;mux disabled channel 2 
;                    STA      <VIA_port_b                  ; 
;                    STB      <VIA_port_b                  ;mux enabled channel 2 
;                    STA      <VIA_port_b                  ;turn off mux 

; V1.06b
                LDD     #$8584          ;mux disabled channel 2
                STA     <VIA_port_b
                STB     <VIA_port_b     ;mux enabled channel 2
                STB     <VIA_port_b     ;do it again just because
                LDB     #$81
                STB     <VIA_port_b     ;turn off mux


                    endm     
_INTENSITY_A        macro    
                    STA      <VIA_port_a                  ;Store intensity in D/A 
;                    LDD      #$0504                       ;mux disabled channel 2 
;                    STA      <VIA_port_b                  ; 
;                    STB      <VIA_port_b                  ;mux enabled channel 2 
;                    STA      <VIA_port_b                  ;turn off mux 

; V1.06b
                LDD     #$0504          ;mux disabled channel 2
                STA     <VIA_port_b
                STB     <VIA_port_b     ;mux enabled channel 2
                STB     <VIA_port_b     ;do it again just because
                LDB     #$01
                STB     <VIA_port_b     ;turn off mux



                    endm     




_INTENSITY_A_ONLY   macro    
                    STA      <VIA_port_a                  ;Store intensity in D/A 

;                    LDa      #$05                         ;mux disabled channel 2 
;                    STA      <VIA_port_b                  ; 
;                    deca     

;                    STa      <VIA_port_b                  ;mux enabled channel 2 
;                    inca     
;                    STA      <VIA_port_b                  ;turn off mux 

; V1.06b
                    LDa      #$05                         ;mux disabled channel 2 
                    STA      <VIA_port_b                  ; 
                    deca     

                    STa      <VIA_port_b                  ;mux enabled channel 2 
                    STa      <VIA_port_b                  ;mux enabled channel 2 
                    LDA #1     
                    STA      <VIA_port_b                  ;turn off mux 


                    endm     

_INTENSITY_B        macro    
                    STB      <VIA_port_a                  ;Store intensity in D/A 

;                    LDD      #$0504                       ;mux disabled channel 2 
;                    STA      <VIA_port_b                  ; 
;                    STB      <VIA_port_b                  ;mux enabled channel 2 
;                    STA      <VIA_port_b                  ;turn off mux 

; V1.06b
                LDD     #$0504          ;mux disabled channel 2
                STA     <VIA_port_b
                STB     <VIA_port_b     ;mux enabled channel 2
                STB     <VIA_port_b     ;do it again just because
                LDB     #$01
                STB     <VIA_port_b     ;turn off mux


                    endm     
; uses x and d
; prints the numbers in a and b at a location given
; prints in hex
; need 6 bytes RAM starting with tmp_debug
PRINT_NUMBERS_D_AT  macro    value, _yloc, _xloc , buttonMask 
                    endm     
_PRINT_NUMBERS_D_AT  macro   value, _yloc, _xloc , buttonMask 
                    ldd      #value 
                    pshs     d,u,x,y                      ; save the numbers 
loopy\? 
                    jsr      Wait_Recal 
                    jsr      Intensity_5F 
                    JSR      Read_Btns 
                    anda     #buttonMask 
                    bne      ouHere\? 
                    lda      #_yloc 
                    ldb      #_xloc 
                    jsr      Moveto_d 
                    lda      ,s 
                    lsra     
                    lsra     
                    lsra     
                    lsra     
                    adda     # '0'
                    cmpa     # '9'
                    ble      ok1\? 
                    adda     #( 'A'-'0'-10)
ok1\? 
                    sta      tmp_debug 
                    lda      ,s 
                    anda     #$f 
                    adda     # '0'
                    cmpa     # '9'
                    ble      ok2\? 
                    adda     #( 'A'-'0'-10)
ok2\? 
                    sta      tmp_debug+1 
                    lda      # ','
                    sta      tmp_debug+2 
                    lda      1,s 
                    lsra     
                    lsra     
                    lsra     
                    lsra     
                    adda     # '0'
                    cmpa     # '9'
                    ble      ok3\? 
                    adda     #( 'A'-'0'-10)
ok3\? 
                    sta      tmp_debug+3 
                    lda      1,s 
                    anda     #$f 
                    adda     # '0'
                    cmpa     # '9'
                    ble      ok4\? 
                    adda     #( 'A'-'0'-10)
ok4\? 
                    sta      tmp_debug+4 
                    lda      #$80 
                    sta      tmp_debug+5 
                    ldu      #tmp_debug 
                    jsr      Print_Str 
                    _ZERO_VECTOR_BEAM  
                    jmp      loopy\? 

ouHere\? 
                    puls     d,u,x,y 
                    endm     
PRINT_NUMBERS_D_AT0  macro   value, _yloc, _xloc , buttonMask 
                    endm     
_PRINT_NUMBERS_D_AT0  macro  value, _yloc, _xloc , buttonMask 
                    ldd      #value 
                    pshs     d                            ; save the numbers 
loopy\? 
                    lda      #$ff 
                    sta      <VIA_t1_cnt_lo 
                    jsr      Wait_Recal_noShift 
                    _ZERO_VECTOR_BEAM  
                    ldd      #$8080 
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    MY_MOVE_TO_B_END  
                    _ZERO_VECTOR_BEAM  
                    ldd      #$7f7f 
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    MY_MOVE_TO_B_END  
                    _ZERO_VECTOR_BEAM  
                    jsr      Intensity_5F 
                    lda      #10 
                    sta      <VIA_t1_cnt_lo 
                    JSR      Read_Btns 
                    anda     #buttonMask 
                    bne      ouHere\? 
                    lda      ,s 
                    lsra     
                    lsra     
                    lsra     
                    lsra     
                    adda     # '0'
                    cmpa     # '9'
                    ble      ok1\? 
                    adda     #( 'A'-'0'-10)
ok1\? 
                    sta      tmp_debug 
                    lda      ,s 
                    anda     #$f 
                    adda     # '0'
                    cmpa     # '9'
                    ble      ok2\? 
                    adda     #( 'A'-'0'-10)
ok2\? 
                    sta      tmp_debug+1 
                    lda      # ','
                    sta      tmp_debug+2 
                    lda      1,s 
                    lsra     
                    lsra     
                    lsra     
                    lsra     
                    adda     # '0'
                    cmpa     # '9'
                    ble      ok3\? 
                    adda     #( 'A'-'0'-10)
ok3\? 
                    sta      tmp_debug+3 
                    lda      1,s 
                    anda     #$f 
                    adda     # '0'
                    cmpa     # '9'
                    ble      ok4\? 
                    adda     #( 'A'-'0'-10)
ok4\? 
                    sta      tmp_debug+4 
                    lda      #$80 
                    sta      tmp_debug+5 
                    ldu      #tmp_debug 
                    lda      #_yloc 
                    ldb      #_xloc 
                    jsr      sync_Print_Str_d_8 
                    _ZERO_VECTOR_BEAM  
                    jmp      loopy\? 

ouHere\? 
                    puls     d 
                    endm     
;***************************************************************************
QUERY_JOYSTICK_HORIZINTAL  macro  
queryHW\? 
; joytick pot readings are also switched by the (de)muliplexer (analog section)
; with joystick pots the switching is not done in regard of the output (in opposite to "input" switching of integrator logic)
; but with regard to input
; thus, the SEL part of the mux now selects which joystick pot is selected and send to the compare logic.
; mux sel:
;    xxxx x00x: port 0 horizontal
;    xxxx x01x: port 0 vertical
;    xxxx x10x: port 1 horizontal
;    xxxx x11x: port 1 vertical
;
; the result of the pot reading is compared to the
; value present in the dac and according to the comparisson the compare flag of VIA (bit 5 of port b) is set.
; (compare bit is set if contents of dac was "smaller" (signed) than the "pot" read)
DIGITAL_JOYTICK_LOOP_MIN  EQU  $08 
; now the same for horizontal
                    ldd      #$0100                       ; mux disabled, mux sel = 00 (horizontal pot port 0) 
                    std      <VIA_port_b 
                    stb      <VIA_port_b                  ; mux enabled, mux sel = 01 
                    ldb      #DIGITAL_JOYTICK_LOOP_MIN    ; a wait loop 32 times a loop (waiting for the pots to "read" values, and feed to compare logic) 
waitLoopH\? 
                    decb                                  ; ... 
                    bne      waitLoopH\?                  ; wait... 
                    sta      <VIA_port_b                  ; disable mux 
                    ldd      #$4020                       ; load a with test value (positive x) 
                    sta      <VIA_port_a                  ; test value to DAC 
                    lda      #$01                         ; default result value x was pushed right 
                    bitb     <VIA_port_b                  ; test comparator 
                    bne      xReadDone\?                  ; if comparator cleared - joystick was moved right 
                    neg      <VIA_port_a                  ; "load" with negative value 
                    nega                                  ; also switch the possible result in A 
                    bitb     <VIA_port_b                  ; test comparator again 
                    beq      xReadDone\?                  ; if cleared the joystick was moved left 
                    clra                                  ; if still not cleared, we clear a as the final vertical test result (no move at all) 
xReadDone\?: 
                    sta      >Vec_Joy_1_X                 ; remember the result in "our" joystick data 
                    beq      noxmove\? 
noxmove\? 
                    endm     
;***************************************************************************
; joytick pot readings are also switched by the (de)muliplexer (analog section)
; with joystick pots the switching is not done in regard of the output (in opposite to "input" switching of integrator logic)
; but with regard to input
; thus, the SEL part of the mux now selects which joystick pot is selected and send to the compare logic.
; mux sel:
;    xxxx x00x: port 0 horizontal
;    xxxx x01x: port 0 vertical
;    xxxx x10x: port 1 horizontal
;    xxxx x11x: port 1 vertical
;
; the result of the pot reading is compared to the
; value present in the dac and according to the comparisson the compare flag of VIA (bit 5 of port b) is set.
; (compare bit is set if contents of dac was "smaller" (signed) than the "pot" read)
 if  IS_VIA_FAULTY_RESISTENT = 1 
QUERY_JOYSTICK_VERTICAL  macro  
queryHW\? 
DIGITAL_JOYTICK_LOOP_MIN  EQU  $08 
; now the same for horizontal
                    ldd      #$0300                       ; mux disabled, mux sel = 00 (horizontal pot port 0) 
                    std      <VIA_port_b 
                    lda      #2 
                    sta      <VIA_port_b                  ; mux enabled, mux sel = 01 
                    ldb      #DIGITAL_JOYTICK_LOOP_MIN    ; a wait loop 32 times a loop (waiting for the pots to "read" values, and feed to compare logic) 
waitLoopH\?: 
                    decb                                  ; ... 
                    bne      waitLoopH\?                  ; wait... 
                    lda      #3 
                    sta      <VIA_port_b                  ; disable mux 
                    ldd      #$4020                       ; load a with test value (positive x) 
                    sta      <VIA_port_a                  ; test value to DAC 
                    lda      #$01                         ; default result value x was pushed right 
                    bitb     <VIA_port_b                  ; test comparator 
                    bne      xReadDone\?                  ; if comparator cleared - joystick was moved right 
                    neg      <VIA_port_a                  ; "load" with negative value 
                    nega                                  ; also switch the possible result in A 
                    bitb     <VIA_port_b                  ; test comparator again 
                    beq      xReadDone\?                  ; if cleared the joystick was moved left 
                    clra                                  ; if still not cleared, we clear a as the final vertical test result (no move at all) 
xReadDone\?: 
                    sta      >Vec_Joy_1_Y                 ; remember the result in "our" joystick data 
                    beq      noxmove\? 
noxmove\? 
                    endm     
QUERY_JOYSTICK      macro    
queryHW\? 
DIGITAL_JOYTICK_LOOP_MIN  EQU  $08 
                    ldd      #$0300                       ; mux disabled, mux sel = 01 (vertical pot port 0) 
                    std      <VIA_port_b 
                    lda      #2 
                    sta      <VIA_port_b                  ; mux enabled, mux sel = 01 
                    ldb      #DIGITAL_JOYTICK_LOOP_MIN    ; a wait loop 32 times a loop (waiting for the pots to "read" values, and feed to compare logic) 
waitLoopV\?: 
                    decb                                  ; ... 
                    bne      waitLoopV\?                  ; wait... 
                    lda      #3 
                    sta      <VIA_port_b                  ; disable mux 
                    ldd      #$4020                       ; load a with test value (positive y) 
                    sta      <VIA_port_a                  ; test value to DAC 
                    lda      #$01                         ; default result value y was pushed UP 
                    bitb     <VIA_port_b                  ; test comparator 
                    bne      yReadDone\?                  ; if comparator cleared - joystick was moved up 
                    neg      <VIA_port_a                  ; "load" with negative value 
                    nega                                  ; also switch the possible result in A 
                    bitb     <VIA_port_b                  ; test comparator again 
                    beq      yReadDone\?                  ; if cleared the joystick was moved down 
                    clra                                  ; if still not cleared, we clear a as the final vertical test result (no move at all) 
yReadDone\?: 
                    sta      >Vec_Joy_1_Y                 ; remember the result in "our" joystick data 
noymove\? 
; now the same for horizontal
                    ldd      #$0100                       ; mux disabled, mux sel = 00 (horizontal pot port 0) 
                    std      <VIA_port_b 
                    stb      <VIA_port_b                  ; mux enabled, mux sel = 01 
                    ldb      #DIGITAL_JOYTICK_LOOP_MIN    ; a wait loop 32 times a loop (waiting for the pots to "read" values, and feed to compare logic) 
waitLoopH\?: 
                    decb                                  ; ... 
                    bne      waitLoopH\?                  ; wait... 
                    sta      <VIA_port_b                  ; disable mux 
                    ldd      #$4020                       ; load a with test value (positive x) 
                    sta      <VIA_port_a                  ; test value to DAC 
                    lda      #$01                         ; default result value x was pushed right 
                    bitb     <VIA_port_b                  ; test comparator 
                    bne      xReadDone\?                  ; if comparator cleared - joystick was moved right 
                    neg      <VIA_port_a                  ; "load" with negative value 
                    nega                                  ; also switch the possible result in A 
                    bitb     <VIA_port_b                  ; test comparator again 
                    beq      xReadDone\?                  ; if cleared the joystick was moved left 
                    clra                                  ; if still not cleared, we clear a as the final vertical test result (no move at all) 
xReadDone\?: 
                    sta      >Vec_Joy_1_X                 ; remember the result in "our" joystick data 
                    beq      noxmove\? 
noxmove\? 
                    endm     
 else  
QUERY_JOYSTICK_VERTICAL  macro  
queryHW\? 
; joytick pot readings are also switched by the (de)muliplexer (analog section)
; with joystick pots the switching is not done in regard of the output (in opposite to "input" switching of integrator logic)
; but with regard to input
; thus, the SEL part of the mux now selects which joystick pot is selected and send to the compare logic.
; mux sel:
;    xxxx x00x: port 0 horizontal
;    xxxx x01x: port 0 vertical
;    xxxx x10x: port 1 horizontal
;    xxxx x11x: port 1 vertical
;
; the result of the pot reading is compared to the
; value present in the dac and according to the comparisson the compare flag of VIA (bit 5 of port b) is set.
; (compare bit is set if contents of dac was "smaller" (signed) than the "pot" read)
;DIGITAL_JOYTICK_LOOP_MIN  EQU  $08
; now the same for horizontal
                    ldd      #$0300                       ; mux disabled, mux sel = 00 (horizontal pot port 0) 
                    std      <VIA_port_b 
                    dec      <VIA_port_b                  ; mux enabled, mux sel = 01 
                    ldb      #DIGITAL_JOYTICK_LOOP_MIN    ; a wait loop 32 times a loop (waiting for the pots to "read" values, and feed to compare logic) 
waitLoopH\?: 
                    decb                                  ; ... 
                    bne      waitLoopH\?                  ; wait... 
                    inc      <VIA_port_b                  ; disable mux 
                    ldd      #$4020                       ; load a with test value (positive x) 
                    sta      <VIA_port_a                  ; test value to DAC 
                    lda      #$01                         ; default result value x was pushed right 
                    bitb     <VIA_port_b                  ; test comparator 
                    bne      xReadDone\?                  ; if comparator cleared - joystick was moved right 
                    neg      <VIA_port_a                  ; "load" with negative value 
                    nega                                  ; also switch the possible result in A 
                    bitb     <VIA_port_b                  ; test comparator again 
                    beq      xReadDone\?                  ; if cleared the joystick was moved left 
                    clra                                  ; if still not cleared, we clear a as the final vertical test result (no move at all) 
xReadDone\?: 
                    sta      >Vec_Joy_1_Y                 ; remember the result in "our" joystick data 
                    beq      noxmove\? 
noxmove\? 
                    endm     
;***************************************************************************
QUERY_JOYSTICK      macro    
queryHW\? 
; joytick pot readings are also switched by the (de)muliplexer (analog section)
; with joystick pots the switching is not done in regard of the output (in opposite to "input" switching of integrator logic)
; but with regard to input
; thus, the SEL part of the mux now selects which joystick pot is selected and send to the compare logic.
; mux sel:
;    xxxx x00x: port 0 horizontal
;    xxxx x01x: port 0 vertical
;    xxxx x10x: port 1 horizontal
;    xxxx x11x: port 1 vertical
;
; the result of the pot reading is compared to the
; value present in the dac and according to the comparisson the compare flag of VIA (bit 5 of port b) is set.
; (compare bit is set if contents of dac was "smaller" (signed) than the "pot" read)
DIGITAL_JOYTICK_LOOP_MIN  EQU  $08 
                    ldd      #$0300                       ; mux disabled, mux sel = 01 (vertical pot port 0) 
                    std      <VIA_port_b 
                    dec      <VIA_port_b                  ; mux enabled, mux sel = 01 
                    ldb      #DIGITAL_JOYTICK_LOOP_MIN    ; a wait loop 32 times a loop (waiting for the pots to "read" values, and feed to compare logic) 
waitLoopV\?: 
                    decb                                  ; ... 
                    bne      waitLoopV\?                  ; wait... 
                    inc      <VIA_port_b                  ; disable mux 
                    ldd      #$4020                       ; load a with test value (positive y) 
                    sta      <VIA_port_a                  ; test value to DAC 
                    lda      #$01                         ; default result value y was pushed UP 
                    bitb     <VIA_port_b                  ; test comparator 
                    bne      yReadDone\?                  ; if comparator cleared - joystick was moved up 
                    neg      <VIA_port_a                  ; "load" with negative value 
                    nega                                  ; also switch the possible result in A 
                    bitb     <VIA_port_b                  ; test comparator again 
                    beq      yReadDone\?                  ; if cleared the joystick was moved down 
                    clra                                  ; if still not cleared, we clear a as the final vertical test result (no move at all) 
yReadDone\?: 
                    sta      >Vec_Joy_1_Y                 ; remember the result in "our" joystick data 
                                                          ; beq noymove\? 
                                                          ; bra noxmove\? ; if y moved I assume no X move 
noymove\? 
; now the same for horizontal
                    ldd      #$0100                       ; mux disabled, mux sel = 00 (horizontal pot port 0) 
                    std      <VIA_port_b 
                    dec      <VIA_port_b                  ; mux enabled, mux sel = 01 
                    ldb      #DIGITAL_JOYTICK_LOOP_MIN    ; a wait loop 32 times a loop (waiting for the pots to "read" values, and feed to compare logic) 
waitLoopH\?: 
                    decb                                  ; ... 
                    bne      waitLoopH\?                  ; wait... 
                    inc      <VIA_port_b                  ; disable mux 
                    ldd      #$4020                       ; load a with test value (positive x) 
                    sta      <VIA_port_a                  ; test value to DAC 
                    lda      #$01                         ; default result value x was pushed right 
                    bitb     <VIA_port_b                  ; test comparator 
                    bne      xReadDone\?                  ; if comparator cleared - joystick was moved right 
                    neg      <VIA_port_a                  ; "load" with negative value 
                    nega                                  ; also switch the possible result in A 
                    bitb     <VIA_port_b                  ; test comparator again 
                    beq      xReadDone\?                  ; if cleared the joystick was moved left 
                    clra                                  ; if still not cleared, we clear a as the final vertical test result (no move at all) 
xReadDone\?: 
                    sta      >Vec_Joy_1_X                 ; remember the result in "our" joystick data 
                    beq      noxmove\? 
noxmove\? 
                    endm     
 endif  
;***************************************************************************
;***************************************************************************
CALIBRATION_ZERO    macro    
                    ldb      #$CC 
                    stb      <VIA_cntl 
                    ldd      #$8100 
                    std      <VIA_port_b 
                    deca     
                    sta      <VIA_port_b 
                    ldb      >calibrationValue 
                    lda      #$82 
                    std      <VIA_port_b 
                    ldd      #$83FF 
                    stb      <VIA_port_a 
                    sta      <VIA_port_b 
                    endm     
;***************************************************************************
PLAYER_MOVEMENT_MOVE_BLOCK_old  macro  
;;;;;;
;;;;;;
; THIS BLOCK CAN BE HANDLED IN SOME MOVE
;;;;;;
; this whole block does the player movement according to current joystick data
; the testing whether the end of the screen is reached seems dumb - can I do that better?
                    ldb      Vec_Joy_1_X 
                    beq      noPlayerMovement\? 
                    bmi      leftPlayerMovement\? 
rightPlayerMovement\? 
                    ldd      playerXpos                   ; half a pixel per "move" 
                    bpl      rightWasPositive\? 
                    addd     playerSpeed 
                    std      playerXpos 
                    bra      playerMovementDone\? 

rightWasPositive\? 
                    addd     playerSpeed 
                    bmi      playerMovementDone\? 
                    std      playerXpos 
                    bra      noPlayerMovement\? 

leftPlayerMovement\? 
                    ldd      playerXpos                   ; half a pixel per "move" 
                    bmi      leftWasNegative\? 
                    subd     playerSpeed 
                    std      playerXpos 
                    bra      playerMovementDone\? 

leftWasNegative\? 
                    subd     playerSpeed 
                    bpl      playerMovementDone\? 
                    std      playerXpos 
playerMovementDone\? 
noPlayerMovement\? 
                    endm     
;***************************************************************************
PLAYER_MOVEMENT_MOVE_BLOCK  macro  
;;;;;;
;;;;;;
; THIS BLOCK CAN BE HANDLED IN SOME MOVE
;;;;;;
; this whole block does the player movement according to current joystick data
; the testing whether the end of the screen is reached seems dumb - can I do that better?
                    ldb      Vec_Joy_1_X 
                    beq      noPlayerMovement\? 
                    bmi      leftPlayerMovement\? 
rightPlayerMovement\? 
                    ldd      playerXpos                   ; half a pixel per "move" 
                    addd     playerSpeed 
                    cmpd     #$68ff 
                    bgt      playerMovementDone\? 
                    std      playerXpos 
                    bra      playerMovementDone\? 

leftPlayerMovement\? 
                    ldd      playerXpos                   ; half a pixel per "move" 
                    subd     playerSpeed 
                    cmpd     #$9a00 
                    blt      playerMovementDone\? 
                    std      playerXpos 
playerMovementDone\? 
noPlayerMovement\? 
                    endm     
;***************************************************************************
WAITING_WOBBLE_CHANGES_MOVE_BLOCK  macro  
;;;;;;
;;;;;;
; THIS BLOCK CAN BE HANDLED IN SOME MOVE
;;;;;;
; do the "wobbling" of enemies in waiting position
 if  NO_WOBBLE = 1 
 else  
                    lda      Vec_Loop_Count+1 
                    anda     #1 
                    beq      noWobbleChange\? 
                    lda      globalPatternWobbleDirection ; was tst 
                    bpl      wobbleAdd\? 
wobbleDec\? 
                    dec      globalPatternWobble 
                    lda      globalPatternWobble 
                    cmpa     #-16 
                    bgt      noWobbleChange\? 
                    inc      globalPatternWobbleDirection 
                    bra      noWobbleChange\? 

wobbleAdd\? 
                    inc      globalPatternWobble 
                    lda      globalPatternWobble 
                    cmpa     #16 
                    blt      noWobbleChange\? 
                    dec      globalPatternWobbleDirection 
noWobbleChange\? 
 endif  
                    endm     
;***************************************************************************
; reg u can be used!
ADD_POINTS_ENEMY_DESTROY  macro  
 if  CURRENT_BANK = 2 
REPLACE_1_2_enemyTribble_varFrom1_1                       ;  bank 1 replace 
                    cmpx     #0                           ; enemyTribble 
 endif  
 if  CURRENT_BANK = 3 
                    cmpx     #enemyTribble 
 endif  
                    beq      back\? 
                    ldy      #player_score 
                    ldb      #10 
                    lda      multiplyer 
                    lsra     
                    lsra     
                    mul      
                    ldu      #back\? 
                    jmp      addScore_b 

back\? 
                    endm     
;***************************************************************************
ADD_POINTS_BONUS_COMPLETE  macro  
                    ldy      #player_score 
                    ldb      #20 
                    lda      multiplyer 
                    lsra     
                    lsra     
                    mul      
                    ldu      #back\? 
                    jmp      addScore_b 

back\? 
                    endm     
;***************************************************************************
ADD_POINTS_DIAMOND  macro    
                    ldy      #player_score 
                    ldb      #100 
                    lda      multiplyer 
                    lsra     
                    lsra     
                    mul      
                    ldu      #back\? 
                    jmp      addScore_d 

back\? 
                    endm     
;***************************************************************************
ADD_POINTS_BIGGY    macro    
                    ldy      #player_score 
                    ldb      #200                         ; times 8 == 1600 points a biggy, times 5 = 8000 points max 
                    lda      multiplyer 
                    anda     #MULTIPLYER_BITS 
                    lsla     
                    mul      
                    ldu      #back\? 
                    jmp      addScore_d 

back\? 
                    endm     
;***************************************************************************
ADD_POINTS_DOUBLE_LETTER  macro  
                    ldy      #player_score 
                    ldb      #25 
                    lda      multiplyer 
                    lsra     
                    lsra     
                    mul      
                    ldu      #back\? 
                    jmp      addScore_b 

back\? 
                    endm     
;***************************************************************************
ADD_CASH            macro    amount 
                    ldd      playerCashW 
                    addd     #amount 
                    ldx      playerCashW 
                    std      playerCashW 
                    cmpx     playerCashW 
                    blo      noRollOver_1\? 
                    lda      diverseFlags 
                    ora      #BIT_FLAG_CASH_ROLLOVER 
                    sta      diverseFlags 
noRollOver_1\? 
                    std      playerCashW 
back\? 
                    endm     
;***************************************************************************
ADD_SHOT            macro    
                    ldd      playerShotCountW 
                    addd     #1 
                    std      playerShotCountW 
                    endm     
;***************************************************************************
ADD_HIT             macro    
                    ldd      playerHitCountW 
                    addd     #1 
                    std      playerHitCountW 
                    endm     
;***************************************************************************
CHECK_MINY_LOAD_A   macro    
                    lda      Y_POS+u_offset1,s 
                    cmpa     enemyMINY 
                    bge      noNewMin\? 
                    sta      enemyMINY 
noNewMin\? 
                    endm     
;***************************************************************************
CHECK_MINY_A        macro    
 if  LARGE_OBJECT = 1 
                    suba     #20 
 endif  
                    cmpa     enemyMINY 
                    bge      noNewMin\? 
                    sta      enemyMINY 
noNewMin\? 
 if  LARGE_OBJECT = 1 
                    adda     #20 
 endif  
                    endm     
;***************************************************************************
UNIVERSAL_PLAYER_SHOT_RADIUS  =  10 
INIT_SHOT_TEST      macro    testBase 
 if  USE_NEW_SHOTS = 1 
                    cmpu     #OBJECT_LIST_COMPARE_ADDRESS 
                    bhi      godShotHere\? 
                    ldd      #0 
                    std      testBase 
                    bra      endm\? 

godShotHere\? 
                    stu      testBase+SHOT_ORG 
                    ldd      Y_POS,u 
                    sta      testBase+T_YPOS 
shotIsAlive1\? 
shotdone\? 
                    addb     #$80                         ; make x 0 based 0 - 255 
                    stb      tmp2_tmp                     ; tmp2_tmp is zero based shot x position 
                    subb     #(3*UNIVERSAL_PLAYER_SHOT_RADIUS) 
; in b now 3 radii to the left of zero based shot position
; might be OOB
; therefor check if result is lower than starting position, if no, we are oob
; and take as lowest position "0"
                    cmpb     tmp2_tmp 
                    blo      ok1\? 
                    ldb      #0 
ok1\? 
                    stb      testBase+T_XPOS0_MINUS_3_RADIUS 
                    ldb      tmp2_tmp                     ; reload zero based shot x position 
                    addb     #(3*UNIVERSAL_PLAYER_SHOT_RADIUS) 
; in b now 3 radii to the right of zero based shot position
; might be OOB
; therefor check if result is higher than starting position, if no, we are oob
; and take as highest position "255"
                    cmpb     tmp2_tmp 
                    bhi      ok2\? 
                    ldb      #255 
ok2\? 
                    stb      testBase+T_XPOS0_PLUS_3_RADIUS 
; test for center radii are done
; with scoopy unmodified x radius
; correct it!
; radii must be chose, so that
; no overflow/underflow can occur!
                    ldb      tmp2_tmp                     ; reload zero based shot x position 
                    subb     #UNIVERSAL_PLAYER_SHOT_RADIUS 
                    stb      testBase+T_XPOS0_MINUS_1_RADIUS 
                    ldb      tmp2_tmp                     ; reload zero based shot x position 
                    addb     #UNIVERSAL_PLAYER_SHOT_RADIUS 
                    stb      testBase+T_XPOS0_PLUS_1_RADIUS 
endm\? 
 else                                                     ; following is "old shot" 
                    cmpu     #OBJECT_LIST_COMPARE_ADDRESS 
                    bhi      godShotHere\? 
                    ldd      #0 
                    std      testBase 
                    bra      endm\? 

godShotHere\? 
                    stu      testBase+SHOT_ORG 
                    ldd      Y_POS,u 
shot_y_radius_corrdction  =  2 
                    adda     #shot_y_radius_corrdction 
                    sta      testBase+T_YPOS 
                    lda      SHOT_RADIUS ,u 
                    bne      shotIsAlive1\? 
                    lda      #SHOT_RADIUS1 
                    bra      not6Shot\? 

shotIsAlive1\? 
                    cmpa     #SHOT_RADIUS4 
                    bne      not4Shot\? 
                    suba     #9 
                    bra      shotdone\? 

not4Shot\? 
                    cmpa     #SHOT_RADIUS3 
                    bne      not3Shot\? 
                    suba     #4 
                    bra      shotdone\? 

not3Shot\? 
                    cmpa     #SHOT_RADIUS2 
                    bne      not2Shot\? 
                    suba     #2 
                    bra      shotdone\? 

not2Shot\? 
                    cmpa     #SHOT_RADIUS6 
                    bne      not6Shot\? 
                    adda     #1 
                    bra      shotdone\? 

not6Shot\? 
; must be 1 or 5, which are "equal" in radius
                    adda     #2 
shotdone\? 
                    sta      tmp3_tmp                     ; tmp 1 is current 1 radius for scoopy check 
                    addb     #$80                         ; make x 0 based 0 - 255 
                    stb      tmp2_tmp                     ; tmp2_tmp is zero based shot x position 
                    subb     tmp3_tmp 
                    subb     tmp3_tmp 
                    subb     tmp3_tmp 
; in b now 3 radii to the left of zero based shot position
; might be OOB
; therefor check if result is lower than starting position, if no, we are oob
; and take as lowest position "0"
                    cmpb     tmp2_tmp 
                    blo      ok1\? 
                    ldb      #0 
ok1\? 
                    stb      testBase+T_XPOS0_MINUS_3_RADIUS 
                    ldb      tmp2_tmp                     ; reload zero based shot x position 
                    addb     tmp3_tmp 
                    addb     tmp3_tmp 
                    addb     tmp3_tmp 
; in b now 3 radii to the right of zero based shot position
; might be OOB
; therefor check if result is higher than starting position, if no, we are oob
; and take as highest position "255"
                    cmpb     tmp2_tmp 
                    bhi      ok2\? 
                    ldb      #255 
ok2\? 
                    stb      testBase+T_XPOS0_PLUS_3_RADIUS 
; test for center radii are done
; with scoopy unmodified x radius
; correct it!
; radii must be chose, so that
; no overflow/underflow can occur!
                    ldb      tmp2_tmp                     ; reload zero based shot x position 
                    subb     SHOT_RADIUS ,u 
                    stb      testBase+T_XPOS0_MINUS_1_RADIUS 
                    ldb      tmp2_tmp                     ; reload zero based shot x position 
                    addb     SHOT_RADIUS ,u 
                    bcc      okok\? 
                    ldb      #255                         ;max 
okok\? 
                    stb      testBase+T_XPOS0_PLUS_1_RADIUS 
endm\? 
 endif  
                    endm     
;***************************************************************************
INITIALZE_SHOT_TEST_MOVE_BLOCK_1  macro  
                    ldu      testShot 
                    cmpu     #OBJECT_LIST_COMPARE_ADDRESS 
                    bls      startFresh\? 
                                                          ; if last time something was hit and 
                                                          ; the bullet is still active 
                                                          ; do not switch - we probably will hit again! 
                    lda      explosionSound               ; was tst 
                    bne      nextShotTestLoaded\? 
enemyOutOfBounds\? 
                    ldu      NEXT_SHOT_OBJECT,u 
                    cmpu     #OBJECT_LIST_COMPARE_ADDRESS 
                    blo      startFresh\? 
                    lda      enemyMINY 
                    cmpa     Y_POS,u 
                    bgt      enemyOutOfBounds\? 
                    bra      nextShotTestLoaded\? 

startFresh\? 
                    ldu      playershotlist_objects_head 
nextShotTestLoaded\? 
                    INIT_SHOT_TEST  testShot 
                    endm     
;***************************************************************************
INITIALZE_SHOT_TEST_MOVE_BLOCK_2  macro  
 if  USE_NEW_SHOTS = 1 
 if  NO_2SHOT_TEST = 1 
 else  
;....
; use next shot that "fits
                    clr      tmp3_tmp 
                    ldu      testShot 
loadNextShot2\? 
                    cmpu     #OBJECT_LIST_COMPARE_ADDRESS 
                    bls      startFresh2\? 
loadNextShot3\? 
                    ldu      NEXT_SHOT_OBJECT,u 
                    cmpu     #OBJECT_LIST_COMPARE_ADDRESS 
                    bhi      nextShotTestLoaded2\? 
startFresh2\? 
                    lda      tmp3_tmp                     ; was tst 
                    bne      nextShotTestLoadedreally\? 
                    inc      tmp3_tmp 
                    ldu      playershotlist_objects_head 
; new
                    cmpu     #OBJECT_LIST_COMPARE_ADDRESS 
                    bhi      godShotHere\? 
                    ldd      #0 
                    std      testBase 
                    bra      endm\? 

godShotHere\? 
; new end
nextShotTestLoaded2\? 
                    lda      enemyMINY 
                    cmpa     Y_POS,u 
                    blt      nextShotTestLoadedreally\? 
                    lda      tmp3_tmp                     ; was tst 
                    bne      loadNextShot3\? 
nextShotTestLoadedreally\? 
                    INIT_SHOT_TEST  test2Shot 
;....
endm\? 
 endif  
                    lda      #$7f 
                    sta      enemyMINY 
 else  
 if  NO_2SHOT_TEST = 1 
 else  
;....
; always use testShot + 5 for testShot 2
                    lda      #5 
                    clr      tmp3_tmp 
                    ldu      testShot 
loadNextShot2\? 
                    cmpu     #OBJECT_LIST_COMPARE_ADDRESS 
                    bls      startFresh2\? 
loadNextShot3\? 
                    ldu      NEXT_SHOT_OBJECT,u 
                    cmpu     #OBJECT_LIST_COMPARE_ADDRESS 
                    bhi      nextShotTestLoaded2\? 
startFresh2\? 
                    ldb      tmp3_tmp                     ; was tst 
                    bne      nextShotTestLoadedreally\? 
                    inc      tmp3_tmp 
                    ldu      playershotlist_objects_head 
; new
                    cmpu     #OBJECT_LIST_COMPARE_ADDRESS 
                    bls      nextShotTestLoadedreally\? 
; new end
nextShotTestLoaded2\? 
                    deca     
                    bne      loadNextShot2\? 
                    lda      enemyMINY 
                    cmpa     Y_POS,u 
                    blt      nextShotTestLoadedreally\? 
                    lda      tmp3_tmp                     ; was tst 
                    bne      loadNextShot3\? 
nextShotTestLoadedreally\? 
                    ldd      #0 
                    std      test2Shot 
                    cmpu     testShot 
                    lbeq     noSameShots\? 
                    INIT_SHOT_TEST  test2Shot 
noSameShots\? 
; veryify that testShot is not the same
;....
 endif  
                    lda      #$7f 
                    sta      enemyMINY 
 endif  
                    endm     
;***************************************************************************
SCOOP_INTERVALL_ADD  =       6                            ;7 
CORRECTION          =        10 
DRAW_SCOOP_HERE     macro    
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
                    ldd      #$FF 
                    stb      <VIA_shift_reg 
                    sta      <VIA_t1_cnt_hi 
                    lda      #SCOOP_INTERVALL_ADD 
                    sta      <VIA_t1_cnt_lo 
                    clra     
                    MY_MOVE_TO_B_END  
                    sta      <VIA_shift_reg 
                    ldb      #$50                         ; go +- to next step 
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
                    ldd      #$FF 
                    stb      <VIA_shift_reg 
                    sta      <VIA_t1_cnt_hi 
                    lda      #SCOOP_INTERVALL_ADD 
                    sta      <VIA_t1_cnt_lo 
                    clra     
                    MY_MOVE_TO_B_END  
                    sta      <VIA_shift_reg 
                    dec      tmp2_tmp 
                    lbne     anotherScoopLoop\? 
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; draws the fighter (anim) and all that goes with it (armor, shield or scoop)
; only one addition at any given time at once
DRAW_FIGHTER_PREP   macro    
                    lda      #OBJECT_SCALE 
                    sta      VIA_t1_cnt_lo 
                    ldu      multTimer 
                    beq      noTimerActive\? 
                    leau     -1,u 
                    stu      multTimer 
                    bne      noTimerActive\? 
                    lda      multiplyer 
                    anda     #NON_MULTIPLYER_BITS 
                    ora      #MULTIPLY_1_OR 
                    sta      multiplyer 
                    lda      #$80 
                    std      player_score_80 
noTimerActive\? 
                    ldu      #SM_Fighter_Anim 
                    dec      playAnimDelayCounter 
                    bpl      animCounterFighterOk\? 
                    lda      #ANIMATION_DELAY 
                    sta      playAnimDelayCounter 
                    inc      playerAnim 
                    lda      playerAnim 
                    asla     
                    ldx      a,u 
                    beq      resetAnim\? 
                    tfr      x,u 
                    bra      drawFighter\? 

resetAnim\? 
                    clr      playerAnim 
animCounterFighterOk\? 
                    lda      playerAnim 
                    asla     
                    ldu      a,u 
drawFighter\? 
                    MY_MOVE_TO_B_END  
                    jsr      SMVB_drawSmart               ; twice the speed ofdraw synced AND calibrated! 
                    lda      playerBonusActive 
                    beq      drawFighterDone\? 
                    bita     #BITFIELD_ARMOR 
                    beq      testNext1\? 
                    ldu      #SM_Armor_Anim 
                    bra      continueDrawFighter\? 

testNext1\? 
                    bita     #BITFIELD_SHIELD 
                    beq      testNext2\? 
                    ldu      #SM_Shield_Anim 
                    ldx      playerBonusCounter 
                    leax     -1,x 
                    stx      playerBonusCounter           ; 
                    beq      endBonusShield\? 
                    cmpx     #100 
                    bhi      noFlickerShield\? 
                    lda      Vec_Loop_Count+1 
                    anda     #1 
                    beq      drawFighterDone\? 
noFlickerShield\? 
                    bra      continueDrawFighter\? 

endBonusShield\? 
                    clr      playerBonusActive 
                    bra      continueDrawFighter\? 

testNext2\? 
                    bita     #BITFIELD_SCOOP 
                    beq      drawFighterDone\? 
                    ldx      playerBonusCounter 
                    leax     -1,x 
                    stx      playerBonusCounter           ; dec playerBonusCounter 
                    beq      endBonusScoop\? 
                    cmpx     #100 
                    bhi      noFlickerScoop\? 
                    lda      Vec_Loop_Count+1 
                    anda     #1 
                    beq      drawFighterDone\? 
noFlickerScoop\? 
                    jsr      draw_scooping 
                    bra      drawFighterDone\? 

endBonusScoop\? 
                    clr      playerBonusActive 
                    bra      drawFighterDone\? 

continueDrawFighter\? 
                    lda      playerAnim 
                    asla     
                    ldu      a,u 
                    jsr      SMVB_drawSmart               ; twice the speed ofdraw synced AND calibrated! 
drawFighterDone\? 
; draw cleanup
                    LDA      #$CC 
                    ldb      gameScale 
                    STA      VIA_cntl                     ;/BLANK low and /ZERO low 
                    stB      VIA_t1_cnt_lo 
                    ldd      #0 
                    std      <VIA_port_b 
drawEND\? 
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
INIT_PLAYER_EXPLOSION  macro  
                    ldu      #playerExplosionSpace 
                    lda      #1 
                    sta      EX_START_SIZE,u              ; position 
                    lda      #MAX_PLAYER_EXPLOSION_SIZE 
                    sta      EX_MAX_SIZE,u                ; position 
                    clr      EX_STEP,u                    ; start at 0 
                    endm     
 if  IS_VIA_FAULTY_RESISTENT = 1 
DRAW_VLP            macro    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Draw_VLp\? 
                    LDD      1,X                          ;Get next coordinate pair 
                    STA      <VIA_port_a                  ;Send Y to A/D 
                    clra     
                    sta      <VIA_port_b                  ;Enable mux 
                    LEAX     3,X                          ;Advance to next point in list 
                    inca     
                    sta      <VIA_port_b                  ;Disable mux 
                    LDA      -3,X                         ;Get pattern byte? 
                    STB      <VIA_port_a                  ;Send X to A/D 
                    clrb     
                    STA      <VIA_shift_reg               ;Store pattern in shift register 
                    stb      <VIA_t1_cnt_hi               ;Clear T1H 
                    tfr      a,a 
                    tfr      a,a 
; brn 0 ; max ten scale
;                NOP                     ;Wait a moment more
                    STb      <VIA_shift_reg               ;Clear shift register (blank output) 
                    LDA      ,X                           ;Get next pattern byte 
                    BLE      Draw_VLp\?                   ;Go back if high bit of pattern is set 
                    endm     
Draw_VLp_lessGap    macro    
                    LDA      1,X                          ;Get next coordinate pair 
                    STA      <VIA_port_a                  ;Send Y to A/D 
                    clrb     
                    stb      <VIA_port_b                  ;Enable mux 
                    LDA      ,X                           ;Get pattern byte 
                    incb     
                    stb      <VIA_port_b                  ;Disable mux 
                    LDb      2,X                          ;Get pattern byte 
                    STB      <VIA_port_a                  ;Send X to A/D 
                    ldb      #0 
                    STA      <VIA_shift_reg               ;Store pattern in shift register 
                    STB      <VIA_t1_cnt_hi               ;Clear T1H 
                    LDA      #$40                         ;B-reg = T1 interrupt bit 
; 0 is ok
;
                    LEAX     3,X                          ;Advance to next point in list 
LF425_lg_1\? 
                    BITA     >VIA_int_flags               ;Wait for T1 to time out 
                    BEQ      LF425_lg_1\? 
                    LDA      ,X                           ;Get next pattern byte 
                    bgt      macroEnd\? 
Draw_VLp_lessGap_1\? 
                    STB      <VIA_shift_reg               ;Clear shift register (blank output) 
                    LDA      1,X                          ;Get next coordinate pair 
                    STA      <VIA_port_a                  ;Send Y to A/D 
                    clrb     
                    stb      <VIA_port_b                  ;Enable mux 
                    LDA      ,X                           ;Get pattern byte 
                    incb     
                    stb      <VIA_port_b                  ;Disable mux 
                    LDB      2,X                          ;Get pattern byte 
                    STB      <VIA_port_a                  ;Send X to A/D 
                    ldb      #0 
                    STA      <VIA_shift_reg               ;Store pattern in shift register 
                    STB      <VIA_t1_cnt_hi               ;Clear T1H 
                    LDA      #$40                         ;B-reg = T1 interrupt bit 
; 0 is ok
;
                    LEAX     3,X                          ;Advance to next point in list 
LF425_lg\? 
                    BITA     >VIA_int_flags               ;Wait for T1 to time out 
                    BEQ      LF425_lg\? 
                    LDA      ,X                           ;Get next pattern byte 
                    BLE      Draw_VLp_lessGap_1\?         ;Go back if high bit of pattern is set 
macroEnd\? 
                    STB      <VIA_shift_reg               ;Clear shift register (blank output) 
                    endm     
;
; *******
;
Draw_VLp_lessGap2   macro    
                    LDA      1,X                          ;Get next coordinate pair 
shiftOff\? 
                    STA      <VIA_port_a                  ;Send Y to A/D 
                    clrb     
                    stb      <VIA_port_b                  ;Enable mux 
                    LDA      ,X                           ;Get pattern byte 
                    incb     
                    stb      <VIA_port_b                  ;Disable mux 
                    LDB      2,X                          ;Get pattern byte 
                    STB      <VIA_port_a                  ;Send X to A/D 
                    ldb      #0 
                    STA      <VIA_shift_reg               ;Store pattern in shift register 
                    STB      <VIA_t1_cnt_hi               ;Clear T1H 
                    LDA      #$40                         ;B-reg = T1 interrupt bit 
; 0 is ok
;
LF425_lg_1\? 
                    BITA     >VIA_int_flags               ;Wait for T1 to time out 
                    BEQ      LF425_lg_1\? 
                    LEAX     3,X                          ;Advance to next point in list 
                    LDA      ,X                           ;Get next pattern byte 
                    bgt      macroEnd\? 
Draw_VLp_lessGap_1\? 
                    STB      <VIA_shift_reg               ;Clear shift register (blank output) 
                    LDA      1,X                          ;Get next coordinate pair 
shiftOn\? 
                    STA      <VIA_port_a                  ;Send Y to A/D 
                    clrb     
                    stb      <VIA_port_b                  ;Enable mux 
                    LDA      ,X                           ;Get pattern byte 
                    incb     
                    stb      <VIA_port_b                  ;Disable mux 
                    LDA      2 ,X                         ;Get pattern byte 
                    STB      <VIA_port_a                  ;Send X to A/D 
                    ldb      #0 
                    STA      <VIA_shift_reg               ;Store pattern in shift register 
                    STB      <VIA_t1_cnt_hi               ;Clear T1H 
;                    LDA      #$40                         ;B-reg = T1 interrupt bit
; 0 is ok
;
;LF425_lg\?
;                    BITA     >VIA_int_flags               ;Wait for T1 to time out
;                    BEQ      LF425_lg\?
                    LEAX     3,X                          ;Advance to next point in list 
                    LDa      1,X                          ;Get next coordinate pair 
                    tst      ,X 
                    beq      shiftOff\? 
                    bpl      macroEnd\? 
                    bra      shiftOn\? 

;                    LDA      ,X                           ;Get next pattern byte
;                    BLE      Draw_VLp_lessGap_1\?           ;Go back if high bit of pattern is set
macroEnd\? 
                    STB      <VIA_shift_reg               ;Clear shift register (blank output) 
                    endm     
Draw_VLp_lessGap7   macro    
; clra
; tst ,x+
                    ldb      ,x+                          ; faster than tst? 
                    bne      shiftOn\? 
shiftOff\? 
                    LDb      ,X+                          ;Get next coordinate pair 
                    sta      <VIA_shift_reg 
                    STd      <VIA_port_b                  ;Send Y to A/D 
                    ldb      ,x+ 
                    inca     
                    sta      <VIA_port_b                  ;Disable mux 
                    deca     
                    STB      <VIA_port_a                  ;Send X to A/D 
                    STa      <VIA_t1_cnt_hi               ;Clear T1H 
; there are never to 0 after another
                    LDb      ,X+                          ;Get next coordinate pair 
                    bpl      macroEnd\? 
shiftOn\? 
                    LDb      ,X+                          ;Get next coordinate pair 
                    sta      <VIA_shift_reg 
                    STd      <VIA_port_b                  ;Send Y to A/D 
                    ldb      ,x 
                    inca     
                    sta      <VIA_port_b                  ;Disable mux 
                    deca     
                    STB      <VIA_port_a                  ;Send X to A/D 
                    ldb      #-1 
                    STa      <VIA_t1_cnt_hi               ;Clear T1H 
                    stb      <VIA_shift_reg               ;Store pattern in shift register 
                    leax     1,x 
; nop
                    ldb      ,X+ 
                    lbmi     shiftOn\? 
                    beq      shiftOff\? 
                    STa      <VIA_shift_reg               ;Clear shift register (blank output) 
macroEnd\? 
                    endm     
Draw_VLp_lessGapTest  macro  
; clra
; tst ,x+
                    ldb      ,x+                          ; faster than tst? 
                    bne      shiftOn\? 
shiftOff\? 
                    LDb      ,X+                          ;Get next coordinate pair 
                    sta      <VIA_shift_reg 
                    STd      <VIA_port_b                  ;Send Y to A/D 
                    ldb      ,x+ 
                    inca     
                    sta      <VIA_port_b                  ;Disable mux 
                    deca     
                    STB      <VIA_port_a                  ;Send X to A/D 
                    STa      <VIA_t1_cnt_hi               ;Clear T1H 
; there are never to 0 after another
                    ldb      #$40 
LF425_lg\? 
                    BITb     >VIA_int_flags               ;Wait for T1 to time out 
                    BEQ      LF425_lg\? 
                    LDb      ,X+                          ;Get next coordinate pair 
                    bpl      macroEnd\? 
shiftOn\? 
                    LDb      ,X                           ;Get next coordinate pair 
                    sta      <VIA_shift_reg 
                    STd      <VIA_port_b                  ;Send Y to A/D 
                    ldb      1,x 
                    inca     
                    sta      <VIA_port_b                  ;Disable mux 
                    deca     
                    STB      <VIA_port_a                  ;Send X to A/D 
                    ldb      #-1 
                    STa      <VIA_t1_cnt_hi               ;Clear T1H 
                    stb      <VIA_shift_reg               ;Store pattern in shift register 
                    leax     2,x 
                    ldb      #$40 
LF425_lg_1\? 
                    BITb     >VIA_int_flags               ;Wait for T1 to time out 
                    BEQ      LF425_lg_1\? 
                    ldb      ,X+ 
                    lbmi     shiftOn\? 
                    beq      shiftOff\? 
                    STa      <VIA_shift_reg               ;Clear shift register (blank output) 
macroEnd\? 
                    endm     
 else  
DRAW_VLP            macro    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Draw_VLp\? 
                    LDD      1,X                          ;Get next coordinate pair 
                    STA      <VIA_port_a                  ;Send Y to A/D 
                    CLR      <VIA_port_b                  ;Enable mux 
                    LDA      ,X                           ;Get pattern byte? 
                    LEAX     3,X                          ;Advance to next point in list 
                    INC      <VIA_port_b                  ;Disable mux 
                    STB      <VIA_port_a                  ;Send X to A/D 
                    clrb     
                    STA      <VIA_shift_reg               ;Store pattern in shift register 
                    stb      <VIA_t1_cnt_hi               ;Clear T1H 
                    tfr      a,a 
                    tfr      a,a 
; brn 0 ; max ten scale
;                NOP                     ;Wait a moment more
                    STb      <VIA_shift_reg               ;Clear shift register (blank output) 
                    LDA      ,X                           ;Get next pattern byte 
                    BLE      Draw_VLp\?                   ;Go back if high bit of pattern is set 
                    endm     
Draw_VLp_lessGap    macro    
                    LDD      1,X                          ;Get next coordinate pair 
                    STA      <VIA_port_a                  ;Send Y to A/D 
                    CLR      <VIA_port_b                  ;Enable mux 
                    LDA      ,X                           ;Get pattern byte 
                    INC      <VIA_port_b                  ;Disable mux 
                    STB      <VIA_port_a                  ;Send X to A/D 
                    ldb      #0 
                    STA      <VIA_shift_reg               ;Store pattern in shift register 
                    STB      <VIA_t1_cnt_hi               ;Clear T1H 
                    LDA      #$40                         ;B-reg = T1 interrupt bit 
; 0 is ok
;
                    LEAX     3,X                          ;Advance to next point in list 
LF425_lg_1\? 
                    BITA     >VIA_int_flags               ;Wait for T1 to time out 
                    BEQ      LF425_lg_1\? 
                    LDA      ,X                           ;Get next pattern byte 
                    bgt      macroEnd\? 
Draw_VLp_lessGap_1\? 
                    STB      <VIA_shift_reg               ;Clear shift register (blank output) 
                    LDD      1,X                          ;Get next coordinate pair 
                    STA      <VIA_port_a                  ;Send Y to A/D 
                    CLR      <VIA_port_b                  ;Enable mux 
                    LDA      ,X                           ;Get pattern byte 
                    INC      <VIA_port_b                  ;Disable mux 
                    STB      <VIA_port_a                  ;Send X to A/D 
                    ldb      #0 
                    STA      <VIA_shift_reg               ;Store pattern in shift register 
                    STB      <VIA_t1_cnt_hi               ;Clear T1H 
                    LDA      #$40                         ;B-reg = T1 interrupt bit 
; 0 is ok
;
                    LEAX     3,X                          ;Advance to next point in list 
LF425_lg\? 
                    BITA     >VIA_int_flags               ;Wait for T1 to time out 
                    BEQ      LF425_lg\? 
                    LDA      ,X                           ;Get next pattern byte 
                    BLE      Draw_VLp_lessGap_1\?         ;Go back if high bit of pattern is set 
macroEnd\? 
                    STB      <VIA_shift_reg               ;Clear shift register (blank output) 
                    endm     
;
; *******
;
Draw_VLp_lessGap2   macro    
                    LDD      1,X                          ;Get next coordinate pair 
shiftOff\? 
                    STA      <VIA_port_a                  ;Send Y to A/D 
                    CLR      <VIA_port_b                  ;Enable mux 
                    LDA      ,X                           ;Get pattern byte 
                    INC      <VIA_port_b                  ;Disable mux 
                    STB      <VIA_port_a                  ;Send X to A/D 
                    ldb      #0 
                    STA      <VIA_shift_reg               ;Store pattern in shift register 
                    STB      <VIA_t1_cnt_hi               ;Clear T1H 
                    LDA      #$40                         ;B-reg = T1 interrupt bit 
; 0 is ok
;
LF425_lg_1\? 
                    BITA     >VIA_int_flags               ;Wait for T1 to time out 
                    BEQ      LF425_lg_1\? 
                    LEAX     3,X                          ;Advance to next point in list 
                    LDA      ,X                           ;Get next pattern byte 
                    bgt      macroEnd\? 
Draw_VLp_lessGap_1\? 
                    STB      <VIA_shift_reg               ;Clear shift register (blank output) 
                    LDD      1,X                          ;Get next coordinate pair 
shiftOn\? 
                    STA      <VIA_port_a                  ;Send Y to A/D 
                    CLR      <VIA_port_b                  ;Enable mux 
                    LDA      ,X                           ;Get pattern byte 
                    INC      <VIA_port_b                  ;Disable mux 
                    STB      <VIA_port_a                  ;Send X to A/D 
                    ldb      #0 
                    STA      <VIA_shift_reg               ;Store pattern in shift register 
                    STB      <VIA_t1_cnt_hi               ;Clear T1H 
;                    LDA      #$40                         ;B-reg = T1 interrupt bit
; 0 is ok
;
;LF425_lg\?
;                    BITA     >VIA_int_flags               ;Wait for T1 to time out
;                    BEQ      LF425_lg\?
                    LEAX     3,X                          ;Advance to next point in list 
                    LDD      1,X                          ;Get next coordinate pair 
                    tst      ,X 
                    beq      shiftOff\? 
                    bpl      macroEnd\? 
                    bra      shiftOn\? 

;                    LDA      ,X                           ;Get next pattern byte
;                    BLE      Draw_VLp_lessGap_1\?           ;Go back if high bit of pattern is set
macroEnd\? 
                    STB      <VIA_shift_reg               ;Clear shift register (blank output) 
                    endm     
Draw_VLp_lessGap7   macro    
; clra
; tst ,x+
                    ldb      ,x+                          ; faster than tst? 
                    bne      shiftOn\? 
shiftOff\? 
                    LDb      ,X+                          ;Get next coordinate pair 
                    sta      <VIA_shift_reg 
                    STd      <VIA_port_b                  ;Send Y to A/D 
                    ldb      ,x+ 
                    INC      <VIA_port_b                  ;Disable mux 
                    STB      <VIA_port_a                  ;Send X to A/D 
                    STa      <VIA_t1_cnt_hi               ;Clear T1H 
; there are never to 0 after another
                    LDb      ,X+                          ;Get next coordinate pair 
                    bpl      macroEnd\? 
shiftOn\? 
                    LDb      ,X+                          ;Get next coordinate pair 
                    sta      <VIA_shift_reg 
                    STd      <VIA_port_b                  ;Send Y to A/D 
                    ldb      ,x 
                    INC      <VIA_port_b                  ;Disable mux 
                    STB      <VIA_port_a                  ;Send X to A/D 
                    ldb      #-1 
                    STa      <VIA_t1_cnt_hi               ;Clear T1H 
                    stb      <VIA_shift_reg               ;Store pattern in shift register 
                    leax     1,x 
; nop
                    ldb      ,X+ 
                    bmi      shiftOn\? 
                    beq      shiftOff\? 
                    STa      <VIA_shift_reg               ;Clear shift register (blank output) 
macroEnd\? 
                    endm     
Draw_VLp_lessGapTest  macro  
; clra
; tst ,x+
                    ldb      ,x+                          ; faster than tst? 
                    bne      shiftOn\? 
shiftOff\? 
                    LDb      ,X+                          ;Get next coordinate pair 
                    sta      <VIA_shift_reg 
                    STd      <VIA_port_b                  ;Send Y to A/D 
                    ldb      ,x+ 
                    INC      <VIA_port_b                  ;Disable mux 
                    STB      <VIA_port_a                  ;Send X to A/D 
                    STa      <VIA_t1_cnt_hi               ;Clear T1H 
; there are never to 0 after another
                    ldb      #$40 
LF425_lg\? 
                    BITb     >VIA_int_flags               ;Wait for T1 to time out 
                    BEQ      LF425_lg\? 
                    LDb      ,X+                          ;Get next coordinate pair 
                    bpl      macroEnd\? 
shiftOn\? 
                    LDb      ,X                           ;Get next coordinate pair 
                    sta      <VIA_shift_reg 
                    STd      <VIA_port_b                  ;Send Y to A/D 
                    ldb      1,x 
                    INC      <VIA_port_b                  ;Disable mux 
                    STB      <VIA_port_a                  ;Send X to A/D 
                    ldb      #-1 
                    STa      <VIA_t1_cnt_hi               ;Clear T1H 
                    stb      <VIA_shift_reg               ;Store pattern in shift register 
                    leax     2,x 
                    ldb      #$40 
LF425_lg_1\? 
                    BITb     >VIA_int_flags               ;Wait for T1 to time out 
                    BEQ      LF425_lg_1\? 
                    ldb      ,X+ 
                    lbmi     shiftOn\? 
                    beq      shiftOff\? 
                    STa      <VIA_shift_reg               ;Clear shift register (blank output) 
macroEnd\? 
                    endm     
Draw_VLp_lessGapOrg  macro   
                    LDD      1,X                          ;Get next coordinate pair 
                    STA      <VIA_port_a                  ;Send Y to A/D 
                    CLR      <VIA_port_b                  ;Enable mux 
                    LDA      ,X                           ;Get pattern byte 
                    INC      <VIA_port_b                  ;Disable mux 
                    STB      <VIA_port_a                  ;Send X to A/D 
                    ldb      #0 
                    STA      <VIA_shift_reg               ;Store pattern in shift register 
                    STB      <VIA_t1_cnt_hi               ;Clear T1H 
                    LDA      #$40                         ;B-reg = T1 interrupt bit 
; 0 is ok
;
                    LEAX     3,X                          ;Advance to next point in list 
LF425_lg_1\? 
                    BITA     >VIA_int_flags               ;Wait for T1 to time out 
                    BEQ      LF425_lg_1\? 
                    LDA      ,X                           ;Get next pattern byte 
                    bgt      macroEnd\? 
Draw_VLp_lessGap_1\? 
                    STB      <VIA_shift_reg               ;Clear shift register (blank output) 
                    LDD      1,X                          ;Get next coordinate pair 
                    STA      <VIA_port_a                  ;Send Y to A/D 
                    CLR      <VIA_port_b                  ;Enable mux 
                    LDA      ,X                           ;Get pattern byte 
                    INC      <VIA_port_b                  ;Disable mux 
                    STB      <VIA_port_a                  ;Send X to A/D 
                    ldb      #0 
                    STA      <VIA_shift_reg               ;Store pattern in shift register 
                    STB      <VIA_t1_cnt_hi               ;Clear T1H 
                    LDA      #$40                         ;B-reg = T1 interrupt bit 
; 0 is ok
;
                    LEAX     3,X                          ;Advance to next point in list 
LF425_lg\? 
                    BITA     >VIA_int_flags               ;Wait for T1 to time out 
                    BEQ      LF425_lg\? 
                    LDA      ,X                           ;Get next pattern byte 
                    BLE      Draw_VLp_lessGap_1\?         ;Go back if high bit of pattern is set 
macroEnd\? 
                    STB      <VIA_shift_reg               ;Clear shift register (blank output) 
                    endm     
 endif  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DO_PLAYER_EXPLOSION  macro   
; position to explosion
                    ldu      #playerExplosionSpace 
                    ldb      EX_START_SIZE,u              ; * If the scale factor for the explosion 
                    cmpb     EX_MAX_SIZE,u                ; * has not surpassed the max value, then 
                    lbhs     dyingDone 
                    addb     #SPEED_ADD                   ; 
                    stb      EX_START_SIZE,u              ; 
                    clra     
                    sta      <VIA_shift_reg 
                    ldb      #63 / ANGLE_ADD 
                    stb      tmp8Count 
                    ldb      #ANGLE_ROT_ADD               ; 
 if  DO_PLAYER_EXPLOSION_ROTATE = 1 
                    addb     EX_STEP,u                    ; 
 endif  
                    andb     #%00111111                   ; max 63 
                    stb      EX_STEP,u                    ; 
                    stb      tmp8 
next_exangle_rot_ob_scale\? 
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
; ldb EX_START_SIZE+u_offset1,u    ;
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
                    lbpl     next_exangle_rot_ob_scale\? 
; complete explosion done
                    ldb      gameScale 
                    stB      VIA_t1_cnt_lo 
                    LDa      #$CC 
                    STA      VIA_cntl                     ;/BLANK low and /ZERO low 
                    ldd      #0 
                    std      <VIA_port_b 
                    MY_MOVE_TO_A_END  
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
RESET_LASER         macro    
                    lda      #$7f 
                    sta      laserLowestY 
                    sta      laserLowestYRight 
                    sta      laserLowestYLeft 
                    ldd      #0 
                    std      laserEnemyPointer 
                    std      laserEnemyPointerRight 
                    std      laserEnemyPointerLeft 
                    sta      tmp2_tmp_unique 
                    sta      laserTag                     ; ensure in enemy display this is 0 (for laser shot inhibitaion) 
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
RESET_LASER_SMALL   macro    
                    lda      #$7f 
                    sta      laserLowestY 
                    ldd      #0 
                    std      laserEnemyPointer 
                    sta      tmp2_tmp_unique 
                    sta      laserTag                     ; ensure in enemy display this is 0 (for laser shot inhibitaion) 
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
INIT_MESSAGE_D      macro    
                    std      messagePointer 
                    ldd      #MESSAGE_STATE_SCROLL_NORMAL_OUT *256+11 
                    std      messageState 
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
I_NIT_MESSAGE       macro    textPointer 
                    ldd      #textPointer 
                    INIT_MESSAGE_D  
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ADJUST_SHOT_DAMAGE  macro    
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #5 
                    beq      superShot\? 
                    blo      standardShot\? 
laserShot\? 
                    lda      #1 
                    bra      adjustDone\? 

superShot\? 
                    lda      #10                          ; easy 
                    ldb      difficulty 
                    andb     #$f 
                    beq      easy4\? 
                    decb     
                    beq      normal4\? 
                    decb     
                    beq      hard4\? 
impossible4\? 
                    deca                                  ; 5 
hard4\? 
                    deca                                  ; 6 
normal4\? 
                    suba     #3                           ; 7 
easy4\? 
                    bra      adjustDone\? 

                                                          ; bullet 0 - 4 = standard damage 
standardShot\? 
                    lda      #3                           ; easy 
                    ldb      difficulty 
                    andb     #$f 
                    beq      easy3\? 
                    decb     
                    beq      normal3\? 
impossible3\? 
hard3\? 
                    deca                                  ; 1 
normal3\? 
                    deca                                  ; 2 
easy3\? 
adjustDone\? 
; with damage adjust no negative weapon damage allowed anymore!
; (negative was damage each second round only)
; boss fight must be hard! They don't resprect extra damage!
                    ldb      diverseFlags 
                    andb     #BIT_FLAG_IS_BOSSFIGHT_ANY 
                    bne      noBulletAdjust\? 
                    adda     bulletDamageAdjust 
noBulletAdjust\? 
                    sta      bulletDamage 
                    lsla     
                    lsla     
                    lsla     
                    sta      shiftBulletDamage 
                    lsla     
                    bpl      okdamage\? 
                    lda      #%01111000                   ; max non negative damage 
okdamage\? 
                    sta      shiftDoubleBulletDamage 
; im warp failure non working on impossible
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ADJUST_SHOT_RADIUS  macro    toSetbulletDamage 
                    ldb      #3 
                    lda      playerShotSpeed 
                    beq      noMul\? 
                    mul      
noMul\? 
                    addb     #8 +10                       ; +10 new since, enemies now start at the bottom 
                    negb     
                    stb      shotYRadius                  ; y wise a fixed compare is used, since y wise all shots are equal 
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SPECIAL_BIGGIES     macro                                 ; one time macro 
; biggies only above level 25
; bra noMoneyStealer\?
 if  MANY_MEGA = 1 
 else  
                    lda      levelCount 
                    cmpa     #25 
                    lblo     biggyFinishedStart\? 
 endif  
                    lda      levelMaxEnemy 
                    adda     enemyCount 
                    cmpa     #10 
                    lbhi     biggyFinishedStart\? 
; here possibly a special BIGGY spawn
 if  MANY_MEGA = 1 
 else  
                    RANDOM_A2  
                    cmpa     #1 
                    lbhi     biggyFinishedStart\? 
; lbne isIntroNoBug ; statistically 1/255 = every 2.5 seconds -> to many!
 endif  
                    RANDOM_B  
                    cmpb     #8 
                    lbhi     biggyFinishedStart\?         ; statistically each about *25 = 60 seconds .. lets try that 
testCashStealer\? 
                    ldb      difficulty 
                    bmi      noMoneyStealer\? 
                    ldd      playerCashW 
                    cmpd     #1000 
                    blo      noMoneyStealer\? 
;*********************************
;** CASH STEALER *****************
;*********************************
;-------
; init money stealer
                    lda      diverseFlags 
                    anda     #BIT_BIG_ENEMY_IN_PLAY 
                    bne      biggyFinishedStart\? 
                    jsr      spawnEnemy 
                    beq      biggyFinishedStart\? 
                    lda      diverseFlags 
                    ora      #BIT_BIG_ENEMY_IN_PLAY 
                    sta      diverseFlags 
                    ldd      #enemyMoneySucker 
                    std      ENEMY_STRUCT,u 
                    ldd      #0 
                    sta      ALL_PURPOSE,u 
                    std      MY_PATTERN,u 
                    sta      ANIM_POSITION,u 
                    clr      MONEY_SUCK_TIMER, u 
                    ldd      #MONEYSUCKER_HP 
                    std      BIG_HP,u 
                    stu      suckerAddress 
                    ldd      #SUCKER_YPOS*256+$84         ; start at upper right (for now) 
                    std      Y_POS,u 
                    ldd      #moneySuckerBehaviour        ; perhaps first Bug entry behaviour ("beam in") 
                    std      BEHAVIOUR,u 
;-------
                    bra      biggyFinishedStart\? 

noMoneyStealer\? 
;*********************************
;** BIG FIEND ********************
;*********************************
;-------
; init super alien
;-------
                    lda      diverseFlags 
                    anda     #BIT_BIG_ENEMY_IN_PLAY 
                    bne      biggyFinishedStart\? 
                    jsr      spawnEnemy 
                    beq      biggyFinishedStart\? 
                    lda      diverseFlags 
                    ora      #BIT_BIG_ENEMY_IN_PLAY 
                    sta      diverseFlags 
                    ldd      #enemyMegaFiend 
                    std      ENEMY_STRUCT,u 
                    ldd      #0 
                    sta      ALL_PURPOSE,u 
                    std      MY_PATTERN,u 
                    sta      ANIM_POSITION,u 
                    sta      STAY_HERE_LOOP_COUNTER, u 
                    ldd      #MEGAFIEND_HP 
                    std      BIG_HP,u 
                    ldd      #$e084                       ; start at upper right (for now) 
                    std      Y_POS,u 
                    ldd      #megaFiendBehaviour          ; perhaps first Bug entry behaviour ("beam in") 
                    std      BEHAVIOUR,u 
biggyFinishedStart\? 
                    endm     
;-------
LEVEL_TIME_OUT      macro                                 ; one time macro 
                    ldd      levelTimer 
                    subd     #1 
                    std      levelTimer 
                    lbne     noLevelTimeOut\? 
                    lda      difficulty 
                    anda     #$f 
                    bne      onlyEasy\? 
                    lda      levelCount 
                    cmpa     #5                           ; no saucer in the first five level 
                    bls      noLevelTimeOut\? 
onlyEasy\? 
                    ldx      #50*SAUCER_START_DELAY       ;bonusTimerLength 
                    lda      saucerCount 
redCont\? 
                    beq      noTimerReduce\? 
notContRed\? 
                    leax     -100 ,x 
                    cmpx     #200 
                    bgt      contred\? 
                    ldx      #200 
                    bra      noTimerReduce\? 

contred\? 
                    beq      notContRed\? 
                    deca     
                    bra      redCont\? 

noTimerReduce\? 
                    stx      levelTimer 
                    lda      diverseFlags 
                    anda     #BIT_BIG_ENEMY_IN_PLAY 
                    bne      noTimeoutSpawn\? 
                    jsr      spawnEnemy 
                    beq      noTimeoutSpawn\? 
; timer saucer!
                    inc      saucerCount 
                    lda      diverseFlags 
                    ora      #BIT_BIG_ENEMY_IN_PLAY 
                    sta      diverseFlags 
;*********************************
;** TIME OUT - SAUCER ************
;*********************************
                    ldd      #enemySaucerDefinition 
                    std      ENEMY_STRUCT,u 
                    ldd      #0 
                    sta      ALL_PURPOSE,u 
                    std      MY_PATTERN,u 
                    sta      ANIM_POSITION,u 
SAUCER_HP           =        20 
MONEYMOTHERSHIP_HP  =        100 
                    ldd      #SAUCER_HP 
                    std      BIG_HP,u 
                    ldd      #$6084                       ; start at upper right (for now) 
                    std      Y_POS,u 
                    lda      saucerCount 
                    cmpa     #6 
                    bne      normalSaucer\? 
;*********************************
;** TIME OUT - MOTHERSHIP ********
;*********************************
                    ldd      #enemyMoneyMothershipDefinition 
                    std      ENEMY_STRUCT,u 
                    ldd      #MONEYMOTHERSHIP_HP 
                    std      BIG_HP,u 
                    ldd      #moneyMothershipBehaviour    ; perhaps first Bug entry behaviour ("beam in") 
                    std      BEHAVIOUR,u 
                    ldd      #1000 
                    std      levelTimer 
                    bra      noTimeoutSpawn\? 

normalSaucer\? 
                    ldd      #saucerBehaviour             ; perhaps first Bug entry behaviour ("beam in") 
                    std      BEHAVIOUR,u 
;;; saucer init done
noTimeoutSpawn\? 
noLevelTimeOut\? 
                    endm     
;-------
BUG_SPANWING        macro                                 ; one time macro 
                    lda      bugsSpawnedInLevel           ; was tst 
                    beq      noBugSpawn\? 
                    lda      enemyCount 
                    cmpa     nextBugEnemyCount 
                    bhi      noBugSpawn\? 
; init bug
                    jsr      spawnEnemy 
                    beq      noBugSpawn\? 
; big bugs only appear if a reduced count of normal enemies are on screen
; each bug with (atm) 4 enemies less (actually 3 - since the bug counts too)
                    lda      nextBugEnemyCount 
                    suba     #4 
                    cmpa     #5                           ; allow more than 4 bugs *shudder* 
                    bgt      notToLowBugCount\? 
                    lda      #5 
notToLowBugCount\? 
                    sta      nextBugEnemyCount 
                    dec      bugsSpawnedInLevel 
                    ldy      currentLevelPointer 
                    ldy      LEVEL_BUG_DEFINITION,y 
                    sty      ENEMY_STRUCT,u               ; 
                    lda      BUG_ENEMY_HP ,y 
                    ldb      difficulty 
                    andb     #$f 
                    bne      noBugHpChange\? 
easy4\? 
                                                          ; lsra 
noBugHpChange\? 
                    sta      BUG_ENEMY_HITPOINTS,u        ; all 8 bits 
                    ldd      #0 
                    sta      ALL_PURPOSE,u 
                    std      MY_PATTERN,u 
                    sta      ANIM_POSITION,u 
                    sta      BUG_SHOT_DELAY,u 
                    sta      BUG_APPEARING_INTENSITY, u 
                    RANDOM_B  
                    lda      #$60                         ; start at upper right (for now) 
                    std      Y_POS,u 
                    sta      Y_POS16, u 
                    stb      X_POS16, u 
                    clr      Y_POS16+1, u 
                    clr      X_POS16+1, u 
                    ldd      #bugEntryBehaviour           ; perhaps first Bug entry behaviour ("beam in") 
                    std      BEHAVIOUR,u 
;;; bug init done
noBugSpawn\? 
                    endm     
;
; .....................................................
;
PLAY_SECRET_JINGLE  macro    
; do not allow playing of any other "sfx" till this is over
                    lda      playSoundFlags 
                    anda     #%00111111 
                    ora      #BIT_FLAG_PLAY_FORCE_SFX 
                    sta      playSoundFlags 
REPLACE_1_2_secretChannel1_varFromIRQ1_\? 
                    ldd      #0                           ;secretChannel1 
                    std      sfx_pointer_1 
REPLACE_1_2_secretChannel2_varFromIRQ1_\? 
                    ldd      #0                           ;secretChannel2 
                    std      sfx_pointer_2 
REPLACE_1_2_secretChannel3_varFromIRQ1_\? 
                    ldd      #0                           ;secretChannel3 
                    std      sfx_pointer_3 
                    endm     
;
; .....................................................
;
PLAY_ACHIEVEMENT_JINGLE  macro  
; do not allow playing of any other "sfx" till this is over
                    lda      playSoundFlags 
                    anda     #%00111111 
                    ora      #BIT_FLAG_PLAY_FORCE_SFX 
                    sta      playSoundFlags 
REPLACE_1_2_achievementChannel1_varFromIRQ1_\? 
                    ldd      #0                           ;achievementChannel1 
                    std      sfx_pointer_1 
REPLACE_1_2_achievementChannel2_varFromIRQ1_\? 
                    ldd      #0                           ;achievementChannel2 
                    std      sfx_pointer_2 
REPLACE_1_2_achievementChannel3_varFromIRQ1_\? 
                    ldd      #0                           ;achievementChannel3 
                    std      sfx_pointer_3 
                    endm     
;
; .....................................................
;
; a = 0, and stays 0
MOVE_MEM_A          macro    
                    bra      Move_Mem_a\? 

Move_Mem_a_1\?      LDB      A,U                          ;Copy the byte 
                    STB      A,X 
Move_Mem_a\?        DECA                                  ;Decrement the count 
                    BPL      Move_Mem_a_1\?               ;Go back until finished 
                    endm     
;
; .....................................................
;
SCOOPY_SAVE         macro    
                    ldu      scoopEnemy1 
                    beq      scoopie1Done\? 
; copy block
                    ldx      #SAVE1_ENEMY_ADDRESS 
                    lda      #EnemyStruct 
                    MOVE_MEM_A                            ;jsr Move_Mem_a 
                    ldx      #SAVE1_ENEMY_ADDRESS 
                    stx      scoopEnemy1 
; copy block end
scoopie1Done\? 
                    ldu      scoopEnemy2 
                    beq      scoopie2Done\? 
; copy block
                    ldx      #SAVE2_ENEMY_ADDRESS 
                    lda      #EnemyStruct 
                    MOVE_MEM_A                            ;jsr Move_Mem_a 
                    ldx      #SAVE2_ENEMY_ADDRESS 
                    stx      scoopEnemy2 
; copy block end
scoopie2Done\? 
; all "linkage" and enemy list stuff is done after warp!
                    endm     
;
; .....................................................
;
NEWENEMY_OBJECT     macro    
                    ldu      enemylist_empty_head 
tryNextEO\? 
                    cmpu     #OBJECT_LIST_COMPARE_ADDRESS 
                    bls      cs_done_no\? 
                    inc      enemyCount                   ; and remember that we created a new object 
                                                          ; set the new empty head 
                    ldd      NEXT_ENEMY_OBJECT,u          ; the next in out empty list will be the new 
                    std      enemylist_empty_head         ; head of our empty list 
                                                          ; load last of current object list 
; the old head is always our next
                    pshs     y 
                    ldy      enemylist_objects_head 
                    ldd      BEHAVIOUR,y 
REPLACE_2_2_enemyPlayerControlledLeftBehaviour_varFrom1_81\? 
                    cmpd     #0                           ;enemyPlayerControlledLeftBehaviour 
                    bne      noLefty\? 
                    pshs     x 
                    ldx      NEXT_ENEMY_OBJECT,y 
                    ldd      BEHAVIOUR,x 
REPLACE_2_2_enemyPlayerControlledRightBehaviour_varFrom1_81\? 
                    cmpd     #0                           ;enemyPlayerControlledRightBehaviour 
                    beq      leftyIsRight\? 
                    stu      NEXT_ENEMY_OBJECT,y 
                    stx      NEXT_ENEMY_OBJECT,u 
                    puls     x,y 
                    bra      macroEnd\? 

leftyIsRight\? 
                    ldy      NEXT_ENEMY_OBJECT,x 
                    stu      NEXT_ENEMY_OBJECT,x 
                    sty      NEXT_ENEMY_OBJECT,u 
                    puls     x,y 
                    bra      macroEnd\? 

noLefty\? 
REPLACE_2_2_enemyPlayerControlledRightBehaviour_varFrom1_82\? 
                    cmpd     #0                           ;enemyPlayerControlledRightBehaviour 
                    bne      noRighty\? 
                    pshs     x 
                    ldx      NEXT_ENEMY_OBJECT,y 
                    ldd      BEHAVIOUR,x 
REPLACE_2_2_enemyPlayerControlledLeftBehaviour_varFrom1_82\? 
                    cmpd     #0                           ;enemyPlayerControlledLeftBehaviour 
                    beq      leftyIsRight\? 
                    stu      NEXT_ENEMY_OBJECT,y 
                    stx      NEXT_ENEMY_OBJECT,u 
                    puls     x,y 
                    bra      macroEnd\? 

noRighty\? 
                    sty      NEXT_ENEMY_OBJECT,u 
; newobject is always head
                    stu      enemylist_objects_head 
                    puls     y 
cs_done_no\? 
macroEnd\? 
                    endm     
;
; .....................................................
;
SCOOPY_LOAD         macro    
; ensure scoopy1 is lower scoopy 2
                    ldx      scoopEnemy1 
                    cmpx     #01 
                    lbls     scoopieEnsure1Done\? 
                    NEWENEMY_OBJECT                       ;jsr newEnemyObject 
                    dec      enemyCount                   ;this is no enemy - in the level sense! 
                                                          ; object struct in u 
                    exg      x,u 
                    lda      #EnemyStruct 
                    ldy      NEXT_ENEMY_OBJECT,x          ; the next in out empty list will be the new 
                    MOVE_MEM_A                            ;jsr Move_Mem_a 
                    sty      NEXT_ENEMY_OBJECT,x          ; the next in out empty list will be the new 
noScoopy1Move\? 
                    lda      #SCOOP_PLAYER_YPOS 
                    ldb      playerXpos 
                    addb     #SCOOP_RIGHT_PLAYER_XOFFSET 
                    std      Y_POS,x 
                    stx      scoopEnemy1 
scoopieEnsure1Done\? 
                    ldx      scoopEnemy2 
                    cmpx     #01 
                    lbls     scoopieEnsure2Done\? 
                    NEWENEMY_OBJECT                       ;jsr newEnemyObject 
                    dec      enemyCount                   ;this is no enemy - in the level sense! 
                                                          ; object struct in u 
; x dest
; us source
                    exg      x,u 
                    lda      #EnemyStruct 
                    ldy      NEXT_ENEMY_OBJECT,x          ; the next in out empty list will be the new 
                    MOVE_MEM_A                            ;jsr Move_Mem_a 
                    sty      NEXT_ENEMY_OBJECT,x          ; the next in out empty list will be the new 
                    lda      #SCOOP_PLAYER_YPOS 
                    ldb      playerXpos 
                    addb     #SCOOP_LEFT_PLAYER_XOFFSET 
                    std      Y_POS,x 
                    stx      scoopEnemy2 
scoopieEnsure2Done\? 
                    endm     
;
; .....................................................
;
; used in COL_DETECT_ALL
INIT_SHOT_TEST_X    macro    testBase 
 if  USE_NEW_SHOTS = 1 
                    cmpx     #OBJECT_LIST_COMPARE_ADDRESS 
                    bhi      godShotHere\? 
                    ldd      #0 
                    std      testBase 
                    bra      endm\? 

godShotHere\? 
                    stx      testBase+SHOT_ORG 
                    ldd      Y_POS,x 
                    sta      testBase+T_YPOS 
shotIsAlive1\? 
shotdone\? 
                    addb     #$80                         ; make x 0 based 0 - 255 
                    stb      tmp2_tmp                     ; tmp2_tmp is zero based shot x position 
                    subb     #(3*UNIVERSAL_PLAYER_SHOT_RADIUS) 
; in b now 3 radii to the left of zero based shot position
; might be OOB
; therefor check if result is lower than starting position, if no, we are oob
; and take as lowest position "0"
                    cmpb     tmp2_tmp 
                    blo      ok1\? 
                    ldb      #0 
ok1\? 
                    stb      testBase+T_XPOS0_MINUS_3_RADIUS 
                    ldb      tmp2_tmp                     ; reload zero based shot x position 
                    addb     #(3*UNIVERSAL_PLAYER_SHOT_RADIUS) 
; in b now 3 radii to the right of zero based shot position
; might be OOB
; therefor check if result is higher than starting position, if no, we are oob
; and take as highest position "255"
                    cmpb     tmp2_tmp 
                    bhi      ok2\? 
                    ldb      #255 
ok2\? 
                    stb      testBase+T_XPOS0_PLUS_3_RADIUS 
; test for center radii are done
; with scoopy unmodified x radius
; correct it!
; radii must be chose, so that
; no overflow/underflow can occur!
                    ldb      tmp2_tmp                     ; reload zero based shot x position 
                    subb     #UNIVERSAL_PLAYER_SHOT_RADIUS 
                    stb      testBase+T_XPOS0_MINUS_1_RADIUS 
                    ldb      tmp2_tmp                     ; reload zero based shot x position 
                    addb     #UNIVERSAL_PLAYER_SHOT_RADIUS 
                    stb      testBase+T_XPOS0_PLUS_1_RADIUS 
endm\? 
 else  
                    cmpx     #OBJECT_LIST_COMPARE_ADDRESS 
                    bhi      godShotHere\? 
                    ldd      #0 
                    std      testBase 
                    bra      endm\? 

godShotHere\? 
; ldd ,u
; cmpd #lazerPlayerShotBehaviour
; bne normalShot\?
; ldd #-1
; std testBase
; bra      endm\?
;normalShot\?
                    stx      testBase+SHOT_ORG 
                    ldd      Y_POS,x 
shot_y_radius_corrdction_  =  2 
                    adda     #shot_y_radius_corrdction_ 
                    sta      testBase+T_YPOS 
                    lda      SHOT_RADIUS ,x 
                    bne      shotIsAlive1\? 
                    lda      #SHOT_RADIUS1 
                    bra      not6Shot\? 

shotIsAlive1\? 
                    cmpa     #SHOT_RADIUS4 
                    bne      not4Shot\? 
                    suba     #9 
                    bra      shotdone\? 

not4Shot\? 
                    cmpa     #SHOT_RADIUS3 
                    bne      not3Shot\? 
                    suba     #4 
                    bra      shotdone\? 

not3Shot\? 
                    cmpa     #SHOT_RADIUS2 
                    bne      not2Shot\? 
                    suba     #2 
                    bra      shotdone\? 

not2Shot\? 
                    cmpa     #SHOT_RADIUS6 
                    bne      not6Shot\? 
                    adda     #1 
                    bra      shotdone\? 

not6Shot\? 
; must be 1 or 5, which are "equal" in radius
                    adda     #2 
shotdone\? 
                    sta      tmp3_tmp                     ; tmp 1 is current 1 radius for scoopy check 
                    addb     #$80                         ; make x 0 based 0 - 255 
                    stb      tmp2_tmp                     ; tmp2_tmp is zero based shot x position 
                    subb     tmp3_tmp 
                    subb     tmp3_tmp 
; in b now 3 radii to the left of zero based shot position
; might be OOB
; therefor check if result is lower than starting position, if no, we are oob
; and take as lowest position "0"
                    cmpb     tmp2_tmp 
                    blo      ok1\? 
                    ldb      #0 
ok1\? 
                    stb      testBase+T_XPOS0_MINUS_3_RADIUS 
                    ldb      tmp2_tmp                     ; reload zero based shot x position 
                    addb     tmp3_tmp 
                    addb     tmp3_tmp 
; in b now 3 radii to the right of zero based shot position
; might be OOB
; therefor check if result is higher than starting position, if no, we are oob
; and take as highest position "255"
                    cmpb     tmp2_tmp 
                    bhi      ok2\? 
                    ldb      #255 
ok2\? 
                    stb      testBase+T_XPOS0_PLUS_3_RADIUS 
; test for center radii are done
; with scoopy unmodified x radius
; correct it!
; radii must be chose, so that
; no overflow/underflow can occur!
                    ldb      tmp2_tmp                     ; reload zero based shot x position 
                    subb     SHOT_RADIUS ,x 
                    stb      testBase+T_XPOS0_MINUS_1_RADIUS 
                    ldb      tmp2_tmp                     ; reload zero based shot x position 
                    addb     SHOT_RADIUS ,x 
                    bcc      okok\? 
                    ldb      #255                         ;max 
okok\? 
                    stb      testBase+T_XPOS0_PLUS_1_RADIUS 
endm\? 
 endif  
                    endm     
;
; .....................................................
;
; used in TEST_ALL_SHOTS
JUST_INIT_SHOT_TEST  macro   testBase 
 if  USE_NEW_SHOTS = 1 
godShotHere\? 
                    stx      testBase+SHOT_ORG 
                    ldd      Y_POS,x 
                    sta      testBase+T_YPOS 
shotIsAlive1\? 
shotdone\? 
                    addb     #$80                         ; make x 0 based 0 - 255 
                    stb      tmp2_tmp                     ; tmp2_tmp is zero based shot x position 
                    subb     #(3*UNIVERSAL_PLAYER_SHOT_RADIUS) 
; in b now 3 radii to the left of zero based shot position
; might be OOB
; therefor check if result is lower than starting position, if no, we are oob
; and take as lowest position "0"
                    cmpb     tmp2_tmp 
                    blo      ok1\? 
                    ldb      #0 
ok1\? 
                    stb      testBase+T_XPOS0_MINUS_3_RADIUS 
                    ldb      tmp2_tmp                     ; reload zero based shot x position 
                    addb     #(3*UNIVERSAL_PLAYER_SHOT_RADIUS) 
; in b now 3 radii to the right of zero based shot position
; might be OOB
; therefor check if result is higher than starting position, if no, we are oob
; and take as highest position "255"
                    cmpb     tmp2_tmp 
                    bhi      ok2\? 
                    ldb      #255 
ok2\? 
                    stb      testBase+T_XPOS0_PLUS_3_RADIUS 
; test for center radii are done
; with scoopy unmodified x radius
; correct it!
; radii must be chose, so that
; no overflow/underflow can occur!
                    ldb      tmp2_tmp                     ; reload zero based shot x position 
                    subb     #UNIVERSAL_PLAYER_SHOT_RADIUS 
                    stb      testBase+T_XPOS0_MINUS_1_RADIUS 
                    ldb      tmp2_tmp                     ; reload zero based shot x position 
                    addb     #UNIVERSAL_PLAYER_SHOT_RADIUS 
                    stb      testBase+T_XPOS0_PLUS_1_RADIUS 
endm\? 
 else  
godShotHere\? 
; ldd ,u
; cmpd #lazerPlayerShotBehaviour
; bne normalShot\?
; ldd #-1
; std testBase
; bra      endm\?
;normalShot\?
                    stx      testBase+SHOT_ORG 
                    ldd      Y_POS,x 
shot_y_radius_corrdction  =  2 
                    adda     #shot_y_radius_corrdction 
                    sta      testBase+T_YPOS 
                    lda      SHOT_RADIUS ,x 
                    bne      shotIsAlive1\? 
                    lda      #SHOT_RADIUS1 
                    bra      not6Shot\? 

shotIsAlive1\? 
                    cmpa     #SHOT_RADIUS4 
                    bne      not4Shot\? 
                    suba     #9 
                    bra      shotdone\? 

not4Shot\? 
                    cmpa     #SHOT_RADIUS3 
                    bne      not3Shot\? 
                    suba     #4 
                    bra      shotdone\? 

not3Shot\? 
                    cmpa     #SHOT_RADIUS2 
                    bne      not2Shot\? 
                    suba     #2 
                    bra      shotdone\? 

not2Shot\? 
                    cmpa     #SHOT_RADIUS6 
                    bne      not6Shot\? 
                    adda     #1 
                    bra      shotdone\? 

not6Shot\? 
; must be 1 or 5, which are "equal" in radius
                    adda     #2 
shotdone\? 
                    sta      tmp3_tmp                     ; tmp 1 is current 1 radius for scoopy check 
                    addb     #$80                         ; make x 0 based 0 - 255 
                    stb      tmp2_tmp                     ; tmp2_tmp is zero based shot x position 
                    subb     tmp3_tmp 
                    subb     tmp3_tmp 
; in b now 3 radii to the left of zero based shot position
; might be OOB
; therefor check if result is lower than starting position, if no, we are oob
; and take as lowest position "0"
                    cmpb     tmp2_tmp 
                    blo      ok1\? 
                    ldb      #0 
ok1\? 
                    stb      testBase+T_XPOS0_MINUS_3_RADIUS 
                    ldb      tmp2_tmp                     ; reload zero based shot x position 
                    addb     tmp3_tmp 
                    addb     tmp3_tmp 
; in b now 3 radii to the right of zero based shot position
; might be OOB
; therefor check if result is higher than starting position, if no, we are oob
; and take as highest position "255"
                    cmpb     tmp2_tmp 
                    bhi      ok2\? 
                    ldb      #255 
ok2\? 
                    stb      testBase+T_XPOS0_PLUS_3_RADIUS 
; test for center radii are done
; with scoopy unmodified x radius
; correct it!
; radii must be chose, so that
; no overflow/underflow can occur!
                    ldb      tmp2_tmp                     ; reload zero based shot x position 
                    subb     SHOT_RADIUS ,x 
                    stb      testBase+T_XPOS0_MINUS_1_RADIUS 
                    ldb      tmp2_tmp                     ; reload zero based shot x position 
                    addb     SHOT_RADIUS ,x 
                    bcc      okok\? 
                    ldb      #255                         ;max 
okok\? 
                    stb      testBase+T_XPOS0_PLUS_1_RADIUS 
endm\? 
 endif  
                    endm     
;
; .....................................................
;
AHEX_TOUASCII       macro    
                    pshs     a 
                    lsra     
                    lsra     
                    lsra     
                    lsra     
                    adda     # '0'
                    cmpa     # '9'
                    ble      ok1\? 
                    adda     #( 'A'-'0'-10)
ok1\? 
                    sta      ,u+ 
                    lda      ,s 
                    anda     #$f 
                    adda     # '0'
                    cmpa     # '9'
                    ble      ok2\? 
                    adda     #( 'A'-'0'-10)
ok2\? 
                    sta      ,u+ 
                    leas     1,s 
                    endm     
;
; .....................................................
;
BHEX_TOUASCII       macro    
                    pshs     b 
                    lsrb     
                    lsrb     
                    lsrb     
                    lsrb     
                    addb     # '0'
                    cmpb     # '9'
                    ble      ok3\? 
                    addb     #( 'A'-'0'-10)
ok3\? 
                    stb      ,u+ 
                    ldb      ,s 
                    andb     #$f 
                    addb     # '0'
                    cmpb     # '9'
                    ble      ok4\? 
                    addb     #( 'A'-'0'-10)
ok4\? 
                    stb      ,u+ 
                    leas     1,s 
                    endm     
;
; .....................................................
;
DHEX_TOUASCII       macro    
                    AHEX_TOUASCII  
                    BHEX_TOUASCII  
                    endm     
;
; .....................................................
;
;
; .....................................................
;
;
; definition of bank switch macros
;
PB6_TO_0            macro    
                    lda      #$DF                         ; Prepare DDR Registers % 1101 1111 1111 1111 
                    sta      <VIA_DDR_b                   ; all ORB/ORA to output except ORB 5, PB6 goes LOW 
                    lda      #$01                         ; A = $01, B = 0 
                    sta      <VIA_port_b                  ; ORB = $1 (ramp on, mux off), ORA = 0 (DAC) 
                    endm     
;
PB6_TO_1            macro    
                    lda      #$9F                         ; Prepare DDR Registers % 1001 1111 1111 1111 
                    sta      <VIA_DDR_b                   ; all ORB/ORA to output except ORB 5, PB6 goes LOW 
                    lda      #$01                         ; A = $01, B = 0 
                    sta      <VIA_port_b                  ; ORB = $1 (ramp on, mux off), ORA = 0 (DAC) 
                    endm     
;
IRQ_TO_1            macro                                 ; interrupt DISABLED - clear ALL interrupts to ensure other bank 
                    lda      #%01111111                   ; bit 7 = 0, each other "1" clears the IEflag, bit 6 = T1 
                    sta      <VIA_int_enable 
; ensure shift is "normal"
                    lda      #$98                         ; 0 = shift, 
                    sta      <VIA_aux_cntl 
                    endm     
;
IRQ_TO_0_T1         macro                                 ; interrupt ENABLED 
; todo
; ensure T1 setup correctly
; - it usually is
                    lda      #%11000000                   ; bit 7 = 1, each other "1" sets the IEflag, bit 6 = T1 
                    sta      <VIA_int_enable 
; and now "trigger a interrupt
                    lda      #1                           ; a VERY short T1 timer 
                    sta      <VIA_t1_cnt_lo 
                    clra     
                    sta      <VIA_t1_cnt_hi               ; start timer 
                    nop      2                            ; Peer Test 
; by the time, the macros "leaves" the interrupt is set!
                    endm     
IRQ_TO_0_SHIFT      macro                                 ; interrupt ENABLED 
                    ldd      #$98                         ; ensure that shift can generate interrupt 
; for some reason or another, VIA doesn't like a
; std VIA_shift_reg, Bankswitching (IRQ?) than crashes!
; (only on a real vectrex, not Vide)
                    stb      <VIA_aux_cntl 
                    sta      <VIA_shift_reg               ; and write 0 to shift (a) and $98 to aux (shift out enable) 
                    ldb      #%11000100                   ; bit 7 = 1, each other "1" enables interrupts(bit 6 = t1, bit 2 = shift), both enabled 
                    stb      <VIA_int_enable 
; wait 20 cycles till store of aux (these are 23)
                    mul                                   ; 12 
                    ldb      #$80                         ; 3 
;                    nop      10
                    stb      <VIA_aux_cntl 
                    endm     
