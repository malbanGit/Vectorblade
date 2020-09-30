; macros only: bank 3
; SWARM draw routines!
;
MY_SIMPLE_MOVE_TO_D_START  macro  
                    STA      <VIA_port_a                  ;Store Y in D/A register 
                    LDA      #$CE                         ;Blank low, zero high? 
                    STA      <VIA_cntl                    ; 
                    CLRA     
                    STA      <VIA_port_b                  ;Enable mux ; hey dis si "break integratorzero 440" 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    inca     
                    sta      <VIA_port_b                  ;Disable mux 
                    deca     
 else  
                    inc      <VIA_port_b                  ;Disable mux 
 endif  
                    STB      <VIA_port_a                  ;Store X in D/A register 
                    STA      <VIA_t1_cnt_hi               ;enable timer 
                    endm     
; ***************************************************************************************
; use registers D, U, X (S) !
; ***************************************************************************************
; initialize draw and do first line
INIT_DRAW_6_MOVE_END  macro  pos 
; this can be put into moveto
                    ldx      #256*1+lo(pos)               ; x_hi = 0000 0001 (ramp enabled, mux disabled), x_lo = x 
                    ldu      #256*128+hi(pos)             ; u_hi = 1000 0000 (ramp disabled, mux enabled), u_lo = y 
                    MY_MOVE_TO_B_END                      ; end of movement, above values could be set befor, end destroys "b" 
                    stu      <VIA_port_b                  ; mux enabled, set dac to y value 
                    ldd      #$00ee                       ; a = zero, b = blank disbaled, zero disabled 
                    stx      <VIA_port_b                  ; mux disabled, set dac to x value 
                    std      <VIA_aux_cntl                ; Shift reg mode = 000 free disable, T1 PB7 disabled 
                    endm     
; ***************************************************************************************
; any line after the first of our drawing
LINE_DRAW_6_x       macro    pos 
; loading Setup registers
; directly is even faster than 4 puls from stack (12 vs 13 cycles)
                                                          ; pre load all values, since we must wait before we finish the current drawing 
                    ldu      #256*128+hi(pos)             ; u_hi = 1000 0000 (ramp disabled, mux enabled), u_lo = y 
                    stu      <VIA_port_b                  ; mux enabled, set dac to y value (strangly and luckily, timing 
                    ldx      #256*1+lo(pos)               ; u_hi = 0000 0001 (ramp enabled, mux disabled), u_lo = x 
; nop 2 ; the more nops inserted here, the "better quality" the vector drawing has
                    stx      <VIA_port_b                  ; mux disabled, set dac to x value 
                    endm     
; ***************************************************************************************
; finish last line and deinit our drawing 
DEINIT_DRAW_6       macro    
                    ldb      gameScale 
                    stb      <VIA_t1_cnt_lo 
                    nop      2 
                    ldx      #0 
;                    nop      6                           ; here we have to wait for 8 cycles, 
                                                          ; otherwise the last vector is not finished correctly 
                    ldd      #128*256+($cc)               ; preload scale andcntl value 
                    STD      <VIA_aux_cntl                ; Shift reg mode = 000 free disable, T1 PB7 enabled 
                    stx      <VIA_port_b 
; nop 6 ; may be add one NOP for zeroing!
                    endm     
; ***************************************************************************************
