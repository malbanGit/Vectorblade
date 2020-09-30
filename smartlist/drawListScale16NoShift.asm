; todo 
; last draw could contain $F in A
; than load not needed - attention 
; when cycles are not done for load, than shift value might be needed 2 higher!
; also in X could be some sensible value in X for one of the other 
;SMVB16_lastDraw_rts2                                ;#isfunction  
; list format
; y pos byte -> REG A
; VIA_B for x reg = 01 *256 + x pos byte -> REG X
; pointer to draw function -> PC
; 5 bytes per "position" (except continuous)
; reg A must be constantly == 0!
; opti finding
; a)  Findings T1 can be 2 cycles "off" -> smartlist max scale of "optimium" reduced from 9 to 7 scale :-(
; b ) y and z sampling need up to 4 cycles to bare fruit (poke b reg)
;     90% vectrex (guess) need 0 cycles
;     95% vectrex are content with 2 cycles (1 nop)
;     some few vectrex NEED 4 cycles!!! ARGH!
; c)  std to reg b of via (Y Reg) does not always / everywhere work
;
;
; delays needed for 5% of vectrex
; cost on a "full" screen
; about 1900 cycles
VB_SPRITE_SCALE_16  =        16 
EXPERIMENTAL_WAIT   macro    
                    tfr      a,a 
                    endm     
;
OY_DELAY_16         macro    
                    WAIT4    
                    endm     
OY_DELAY_16_HALF    macro    
                    WAIT2    
                    endm     
Y4D_NOP             macro    
                    WAIT2    
                    endm     
; -----
Y_DELAY_16_Y4D      macro    
                    Y4D_NOP  
                    WAIT4    
                    endm     
Y_DELAY_16          macro    
                    WAIT4    
                    endm     
; -----
Y_DELAY_16_HALF_Y4D  macro   
                    WAIT2    
                    Y4D_NOP  
                    endm     
Y_DELAY_16_HALF     macro    
                    WAIT2    
                    endm     
; ...; -----
SET_Y_INT_16_Y4D    macro    
                    Y4D_NOP  
                    stb      <VIA_port_a                  ; 4 
                    sta      <VIA_port_b                  ; 4 shift not changed, move might also be a draw 
                    endm     
SET_Y_INT_16        macro    
                    stb      <VIA_port_a                  ; 4 
                    sta      <VIA_port_b                  ; 4 shift not changed, move might also be a draw 
                    endm     
; -----
; NOPS add one less, since PULL X is one cycle more than pull a!
ADD_NOPS_16         macro    
                                                          ; if VB_SPRITE_SCALE_16>8 
                                                          ; nop (VB_SPRITE_SCALE_16-8)/2 
                                                          ; endif 
                    WAIT8    
                    endm     
; -----
ADD_NOPS_16_NOU     macro    
 if  VB_SPRITE_SCALE_16>(8-5) 
                    nop      (VB_SPRITE_SCALE_16-8-5)/2 
 endif  
                    endm     
; -----
ADD_NOPS_16_M4      macro    
;                    if       VB_SPRITE_SCALE_16-4>8 
;                    nop      (VB_SPRITE_SCALE_16-4-8)/2 
;                    endif    
                    WAIT4    
                    endm     
ADD_NOPS_16_M4_2    macro    
;                    if       VB_SPRITE_SCALE_16-4>8 
;                    nop      (VB_SPRITE_SCALE_16-4-8)/2 
;                    endif    
                    WAIT2    
                    endm     
; -----
ADD_NOPS_16_NOU_M4  macro    
 if  VB_SPRITE_SCALE_16-4>(8-5) 
                    nop      (VB_SPRITE_SCALE_16-8-5-4)/2 
 endif  
                    endm     
; -----
WAIT_BEFORE_16      macro    
                    WAIT3    
                    endm     
; -----
WAIT_AFTER_16       macro    
                    WAIT7    
                    endm     
SET_X_INT_16        macro    
                    stx      <VIA_port_b                  ; 5 
                    endm     
SET_X_INT_16_stupid  macro   
                    exg      d,x 
                    sta      <VIA_port_b                  ; 4 shift not changed, move might also be a draw 
                    nop      2 
                    stb      <VIA_port_a                  ; 4 
                    exg      d,x 
                    endm     
; -----
;***************************************************************************
SMVB16_drawSmart                                          ;#isfunction  
                    clra     
                    pulu     b,x,pc 
;***************************************************************************
;/* HIGHEST SCALE FOR SMARTLIST + CONTINUE is 16!
;SMVB16_setScale:                                          ;#isfunction  
;                    stb      <VIA_t1_cnt_lo 
;                    pulu     b,x,pc 
SMVB16_continue_yStays_single                             ;#isfunction  
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    ADD_NOPS_16  
                    pulu     b,x,pc 
SMVB16_continue7_single                                   ;#isfunction  
                    SET_Y_INT_16  
                    Y_DELAY_16                            ; 4 
                    SET_X_INT_16  
                    sta      <VIA_t1_cnt_hi               ; 4 
                    ADD_NOPS_16                           ; 21 
; this is one pulu cycle more!
; thus ADD_NOPS_16 can be one cycle less!
; minus 6!
                    pulu     b,x                          ; 5+3 
SMVB16_continue6_single                                   ;#isfunction  
                    SET_Y_INT_16  
                    Y_DELAY_16                            ; 4 
                    SET_X_INT_16  
                    sta      <VIA_t1_cnt_hi               ; 4 
                    ADD_NOPS_16                           ; 21 
                    pulu     b,x                          ; 5+3 
SMVB16_continue5_single                                   ;#isfunction  
                    SET_Y_INT_16  
                    Y_DELAY_16                            ; 4 
                    SET_X_INT_16  
                    sta      <VIA_t1_cnt_hi               ; 4 
                    ADD_NOPS_16                           ; 21 
                    pulu     b,x                          ; 5+3 
SMVB16_continue4_single                                   ;#isfunction  
                    SET_Y_INT_16  
                    Y_DELAY_16                            ; 4 
                    SET_X_INT_16  
                    sta      <VIA_t1_cnt_hi               ; 4 
                    ADD_NOPS_16                           ; 21 
                    pulu     b,x                          ; 5+3 
SMVB16_continue3_single                                   ;#isfunction  
                    SET_Y_INT_16  
                    Y_DELAY_16                            ; 4 
                    SET_X_INT_16  
                    sta      <VIA_t1_cnt_hi               ; 4 
                    ADD_NOPS_16                           ; 21 
                    pulu     b,x                          ; 5+3 
SMVB16_continue2_single                                   ;#isfunction  
                    SET_Y_INT_16  
                    Y_DELAY_16                            ; 4 
                    SET_X_INT_16  
                    sta      <VIA_t1_cnt_hi               ; 4 
                    ADD_NOPS_16                           ; 21 
                    pulu     b,x                          ; 5+3 
; continue uses same shift  
SMVB16_continue_single                                    ;#isfunction  
                    stb      <VIA_port_a                  ; 4 shift not changed, move might also be a draw 
; y is inherently known to be == old_x, y was set to 0 by generator
SMVB16_continue_newY_eq_oldX_single:                      ;#isfunction  
                    sta      <VIA_port_b                  ; 4 
                    Y_DELAY_16                            ; 4 
                    SET_X_INT_16  
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS_16  
                    pulu     b,x,pc 
SMVB16_continue_yd4_single                                ;#isfunction  
                    stb      <VIA_port_a                  ; 4 shift not changed, move might also be a draw 
; y is inherently known to be == old_x, y was set to 0 by generator
SMVB16_continue_newY_y4d_eq_oldX_single:                  ;#isfunction  
                    sta      <VIA_port_b                  ; 4 
                    Y_DELAY_16_Y4D                        ; 4 
                    SET_X_INT_16  
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS_16  
                    pulu     b,x,pc 
SMVB16_continue_single_sj                                 ;#isfunction  
                    stb      <VIA_port_a                  ; 4 shift not changed, move might also be a draw 
; y is inherently known to be == old_x, y was set to 0 by generator
SMVB16_continue_newY_eq_oldX_single_sj:                   ;#isfunction  
                    sta      <VIA_port_b                  ; 4 
                    Y_DELAY_16                            ; 4 
                    SET_X_INT_16  
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS_16_NOU                       ; reduced by ldu ,u - 5 cycles 
                    ldu      ,u 
                    pulu     b,x,pc 
; continue uses same shift
; y is inherently known to be == x, 
SMVB16_continue_yEqx_single                               ;#isfunction  
                    SET_Y_INT_16  
                    Y_DELAY_16_HALF                       ; 4 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    ldb      #1 
                    stb      <VIA_port_b 
 else  
                    inc      <VIA_port_b 
 endif  
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS_16  
                    pulu     b,x,pc 
SMVB16_continue_quadro                                    ;#isfunction  
                    SET_Y_INT_16  
                    Y_DELAY_16                            ; 4 
                    SET_X_INT_16  
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS_16  
                    bra      cont3_16 

;                    bra      cont3_16
SMVB16_startDraw_quadro                                   ;#isfunction  
                    SET_Y_INT_16  
                    ldb      #$ee                         ; light OFF, ZERO OFF 
                    Y_DELAY_16_HALF  
                    SET_X_INT_16  
                    sta      <VIA_t1_cnt_hi 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_16_M4  
                    bra      cont3_16 

;SMVB16_startDraw_hex                                      ;#isfunction  
;                    SET_Y_INT_16  
;                    ldb      #$ee                         ; light OFF, ZERO OFF 
;                    Y_DELAY_16_HALF  
;                    stx      <VIA_port_b                  ; 5 
;                    sta      <VIA_t1_cnt_hi 
;                    stb      <VIA_cntl                    ; 
;                    ADD_NOPS_16_M4  
;                    bra      cont5_16 
SMVB16_startDraw_octo                                     ;#isfunction  
                    SET_Y_INT_16  
                    ldb      #$ee                         ; light OFF, ZERO OFF 
                    Y_DELAY_16_HALF  
                    SET_X_INT_16  
                    sta      <VIA_t1_cnt_hi 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_16_M4  
                    bra      cont7_16 

SMVB16_continue_octo                                      ;#isfunction  
                    SET_Y_INT_16  
                    Y_DELAY_16                            ; 4 
                    SET_X_INT_16  
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS_16  
                    WAIT_BEFORE_16  
cont7_16 
                    WAIT_AFTER_16  
                    clr      <VIA_t1_cnt_hi 
                    ADD_NOPS_16  
                    WAIT_BEFORE_16  
cont6_16 
                    WAIT_AFTER_16  
                    clr      <VIA_t1_cnt_hi 
                    ADD_NOPS_16  
                    WAIT_BEFORE_16  
cont5_16 
                    WAIT_AFTER_16  
                    clr      <VIA_t1_cnt_hi 
                    ADD_NOPS_16  
                    WAIT_BEFORE_16  
cont4_16 
                    WAIT_AFTER_16  
                    clr      <VIA_t1_cnt_hi 
                    ADD_NOPS_16  
                    WAIT_BEFORE_16  
cont3_16 
                    WAIT_AFTER_16  
                    clr      <VIA_t1_cnt_hi 
                    ADD_NOPS_16  
                    WAIT_BEFORE_16  
cont2_16 
                    WAIT_AFTER_16  
                    clr      <VIA_t1_cnt_hi 
                    ADD_NOPS_16  
                    bra      SMVB16_repeat_same 

SMVB16_continue_hex                                       ;#isfunction  
                    SET_Y_INT_16  
                    Y_DELAY_16                            ; 4 
                    SET_X_INT_16  
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS_16  
                    bra      cont5_16 

SMVB16_continue_tripple                                   ;#isfunction  
                    SET_Y_INT_16  
                    Y_DELAY_16                            ; 4 
                    SET_X_INT_16  
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS_16  
                    bra      cont2_16 

SMVB16_startMove_quadro                                   ;#isfunction  
                    SET_Y_INT_16  
                    ldb      #$ce                         ; light OFF, ZERO OFF 
                    Y_DELAY_16_HALF  
                    SET_X_INT_16  
                    sta      <VIA_t1_cnt_hi               ; 4 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_16_M4  
                    bra      cont3_16 

SMVB16_repeat_same                                        ;#isfunction  
                    pulu     b,x 
                    clr      <VIA_t1_cnt_hi 
                    ADD_NOPS_16  
                    pulu     pc 
SMVB16_startDraw_tripple                                  ;#isfunction  
                    SET_Y_INT_16  
                    ldb      #$ee                         ; light OFF, ZERO OFF 
                    Y_DELAY_16_HALF  
                    SET_X_INT_16  
                    sta      <VIA_t1_cnt_hi 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_16_M4  
                    bra      cont2_16 

SMVB16_startMove_tripple                                  ;#isfunction  
                    SET_Y_INT_16  
                    ldb      #$ce                         ; light OFF, ZERO OFF 
                    Y_DELAY_16_HALF  
                    SET_X_INT_16  
                    sta      <VIA_t1_cnt_hi               ; 4 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_16_M4  
                    bra      cont2_16 

SMVB16_continue_double 
                    SET_Y_INT_16  
                    Y_DELAY_16                            ; 4 
                    SET_X_INT_16  
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS_16  
                    bra      SMVB16_repeat_same 

SMVB16_startMove_yd4_single 
                    SET_Y_INT_16_Y4D  
                    ldb      #$ce                         ; light OFF, ZERO OFF 
                    Y_DELAY_16_HALF  
                    SET_X_INT_16  
                    sta      <VIA_t1_cnt_hi 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_16_M4  
                    pulu     b,x,pc 
SMVB16_startMove_single:                                  ;#isfunction  
                    SET_Y_INT_16  
                    ldb      #$ce                         ; light OFF, ZERO OFF 
                    Y_DELAY_16_HALF  
                    SET_X_INT_16  
                    sta      <VIA_t1_cnt_hi 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_16_M4  
                    pulu     b,x,pc 
;SMVB16_startMove_single_sj:                               ;#isfunction  
;                    SET_Y_INT_16  
;                    ldb      #$ce                         ; light OFF, ZERO OFF 
;                    Y_DELAY_16_HALF  
;                    SET_X_INT_16
;                    sta      <VIA_t1_cnt_hi 
;                    stb      <VIA_cntl                    ; 
;                    ADD_NOPS_16_NOU_M4                    ; reduced by ldu ,u - 5 cycles 
;                    ldu      ,u 
;                    pulu     b,x,pc 
SMVB16_startMove_double:                                  ;#isfunction  
                    SET_Y_INT_16  
                    ldb      #$ce                         ; light OFF, ZERO OFF 
                    Y_DELAY_16_HALF  
                    SET_X_INT_16  
                    sta      <VIA_t1_cnt_hi 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_16_M4  
                    bra      SMVB16_repeat_same2 

SMVB16_startMove_double_sj                                ;#isfunction  
                    SET_Y_INT_16  
                    ldb      #$ce                         ; light OFF, ZERO OFF 
                    Y_DELAY_16_HALF  
                    SET_X_INT_16  
                    sta      <VIA_t1_cnt_hi               ; 4 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_16_M4  
                    WAIT6    
                    ldu      ,u                           ; 5 
                    clr      <VIA_t1_cnt_hi 
                    ADD_NOPS_16                           ; reduced by ldu ,u - 5 cycles 
                    pulu     b,x,pc                       ; 10 
SMVB16_startDraw_double                                   ;#isfunction  
                    SET_Y_INT_16  
                    ldb      #$ee                         ; light OFF, ZERO OFF 
                    Y_DELAY_16_HALF  
                    SET_X_INT_16  
                    sta      <VIA_t1_cnt_hi               ; 4 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_16_M4  
                    bra      SMVB16_repeat_same2 

SMVB16_repeat_same2                                       ;#isfunction  
                    pulu     b,x 
                    clr      <VIA_t1_cnt_hi 
                    ADD_NOPS_16  
                    pulu     pc 
SMVB16_startMove_yStays_single                            ;#isfunction  
                    ldb      #$ce                         ; light OFF, ZERO OFF 
                    Y_DELAY_16_HALF  
                    SET_X_INT_16  
                    sta      <VIA_t1_cnt_hi               ; 4 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_16_M4  
                    pulu     b,x,pc 
_SMVB16_startMove_yStays_single_sj 
                    SET_X_INT_16  
                    ldb      #$ee                         ; light ON, ZERO OFF 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_16_NOU_M4                    ; reduced by ldu ,u - 5 cycles 
                    ldu      ,u 
                    pulu     b,x,pc 
; assuming b = $ee
SMVB16_startDraw_yStays_single                            ;#isfunction  
                    SET_X_INT_16  
                    sta      <VIA_t1_cnt_hi               ; 4 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_16_M4  
                    pulu     b,x,pc 
; assume b = $ee
SMVB16_startDraw_xyStays_single                           ;#isfunction  
                    sta      <VIA_t1_cnt_hi 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_16_M4  
                    pulu     b,x,pc 
; assume b = $ee
;SMVB16_startDraw_yStays_single_sj                         ;#isfunction  
;                    SET_X_INT_16
;                    sta      <VIA_t1_cnt_hi               ; 4 
;                    stb      <VIA_cntl                    ; 
;                    ADD_NOPS_16_NOU_M4                    ; reduced by ldu ,u - 5 cycles 
;                    ldu      ,u 
;                    pulu     b,x,pc 
SMVB16_startDraw_yd4_single 
                    SET_Y_INT_16_Y4D  
                    Y_DELAY_16_HALF  
                    ldb      #$ee                         ; light ON, ZERO OFF 
                    SET_X_INT_16  
                    sta      <VIA_t1_cnt_hi               ; 4 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_16_M4  
                    pulu     b,x,pc 
SMVB16_startDraw_single:                                  ;#isfunction  
                    SET_Y_INT_16  
                    Y_DELAY_16_HALF  
                    ldb      #$ee                         ; light ON, ZERO OFF 
                    SET_X_INT_16  
                    sta      <VIA_t1_cnt_hi               ; 4 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_16_M4  
                    pulu     b,x,pc 
;SMVB16_startDraw_single_sj                                ;#isfunction  
;                    SET_Y_INT_16  
;                    Y_DELAY_16_HALF  
;                    ldb      #$ee                         ; light ON, ZERO OFF 
;                    SET_X_INT_16
;                    sta      <VIA_t1_cnt_hi               ; 4 
;                    stb      <VIA_cntl                    ; 
;                    ADD_NOPS_16_NOU_M4                    ; reduced by ldu ,u - 5 cycles 
;                    ldu      ,u 
;                    pulu     b,x,pc 
;SMVB16_startDraw_yEqx_single_sj                           ;#isfunction  
;                    SET_Y_INT_16  
;                    ldb      #$ee 
;                    Y_DELAY_16_HALF  
;                    SET_X_INT_16
;                    sta      <VIA_t1_cnt_hi 
;                    stb      <VIA_cntl                    ; 
;                    ADD_NOPS_16_NOU_M4                    ; reduced by ldu ,u - 5 cycles 
;                    ldu      ,u 
;                    pulu     b,x,pc 
SMVB16_startDraw_yEqx_single                              ;#isfunction  
                    SET_Y_INT_16  
                    ldb      #$ee 
                    Y_DELAY_16_HALF  
                    SET_X_INT_16  
                    sta      <VIA_t1_cnt_hi 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_16_M4  
                    pulu     b,x,pc 
SMVB16_startMove_yd4_yEqx_single 
                    SET_Y_INT_16_Y4D  
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    ldb      #1 
                    stb      <VIA_port_b 
 else  
                    inc      <VIA_port_b 
 endif  
                    ldb      #$ce 
                    sta      <VIA_t1_cnt_hi 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_16_M4  
                    pulu     b,x,pc 
SMVB16_startMove_yEqx_single                              ;#isfunction  
                    SET_Y_INT_16  
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    ldb      #1 
                    stb      <VIA_port_b 
 else  
                    inc      <VIA_port_b 
 endif  
                    ldb      #$ce 
                    sta      <VIA_t1_cnt_hi 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_16_M4  
                    pulu     b,x,pc 
;SMVB16_startMove_yEqx_single_sj                           ;#isfunction  
;                    SET_Y_INT_16  
; ldb #1
; stb <VIA_port_b 
;                    ldb      #$ce 
;                    sta      <VIA_t1_cnt_hi 
;                    stb      <VIA_cntl                    ; 
;                    ADD_NOPS_16_NOU_M4                    ; reduced by ldu ,u - 5 cycles 
;                    ldu      ,u 
;                    pulu     b,x,pc 
;SMVB16_startMove_newY_eq_oldX_single_sj                   ;#isfunction  
;                    sta      <VIA_port_b                  ; 4 
;                    ldb      #$ce 
;                    Y_DELAY_16_HALF  
;                    SET_X_INT_16
;                    sta      <VIA_t1_cnt_hi 
;                    stb      <VIA_cntl                    ; 
;                    ADD_NOPS_16_NOU_M4                    ; reduced by ldu ,u - 5 cycles 
;                    ldu      ,u 
;                    pulu     b,x,pc 
SMVB16_startMove_yd4_newY_eq_oldX_single 
                    sta      <VIA_port_b                  ; 4 
                    ldb      #$ce 
                    Y_DELAY_16_HALF_Y4D  
                    SET_X_INT_16  
                    sta      <VIA_t1_cnt_hi 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_16_M4  
                    pulu     b,x,pc 
SMVB16_startMove_newY_eq_oldX_single                      ;#isfunction  
                    sta      <VIA_port_b                  ; 4 
                    ldb      #$ce 
                    Y_DELAY_16_HALF  
                    SET_X_INT_16  
                    sta      <VIA_t1_cnt_hi 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_16_M4  
                    pulu     b,x,pc 
SMVB16_startDraw_newY_eq_oldX_single:                     ;#isfunction  
                    sta      <VIA_port_b                  ; 4 
                    ldb      #$ee 
                    Y_DELAY_16_HALF  
                    SET_X_INT_16  
                    sta      <VIA_t1_cnt_hi 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_16_M4  
                    pulu     b,x,pc 
;SMVB16_startDraw_newY_eq_oldX_single_sj:                  ;#isfunction  
;                    sta      <VIA_port_b                  ; 4 
;                    ldb      #$ee 
;                    Y_DELAY_16_HALF  
;                    SET_X_INT_16
;                    sta      <VIA_t1_cnt_hi 
;                    stb      <VIA_cntl                    ; 
;                    ADD_NOPS_16_NOU_M4                    ; reduced by ldu ,u - 5 cycles 
;                    ldu      ,u 
;                    pulu     b,x,pc 
SMVB16_lastDraw_rts                                       ;#isfunction  
                    lda      #$ce 
SMVB16_FlagWait: 
                    bitb     <VIA_int_flags 
                    beq      SMVB16_FlagWait 
SMVB16_rts:                                               ;#isfunction  
                    ldb      gameScale 
                    sta      <VIA_cntl                    ; 
                    LDA      #$CC 
                    STA      VIA_cntl                     ;/BLANK low and /ZERO low 
                    stB      VIA_t1_cnt_lo 
; and ensures integrators are clean (good positioning!)
;                    ldd      #0 
                    stx      <VIA_port_b 
                    rts      

;// TODO CHECK WITH SHIELD + CO
SMVB16_lastDraw_rts_stay                                  ;#isfunction  
                    lda      #$ce 
SMVB16_FlagWait3: 
                    bitb     <VIA_int_flags 
                    beq      SMVB16_FlagWait3 
                    sta      <VIA_cntl                    ; 
                    WAIT4    
                    rts      

;SMVB16_lastMove_rts_stay                                  ;#isfunction  
;                    lda      #$40 
;SMVB16_FlagWait3_2: 
;                    bita     <VIA_int_flags 
;                    beq      SMVB16_FlagWait3_2 
;                    rts      
; todo 
; last draw could contain $F in A
; than load not needed - attention 
; when cycles are not done for load, than shift value might be needed 2 higher!
; also in X could be some sensible value in X for one of the other 
SMVB16_lastDraw_rts2                                      ;#isfunction  
                    lda      #$c0 
                    sta      <VIA_cntl                    ; 
                    ldb      gameScale 
                    stb      VIA_t1_cnt_lo 
; extended on purpose to gain one cycle of time
; to reset to 
; a) swithc light off before zeroing
; b) zero
SMVB16_rts2:                                              ;#isfunction  
                    ldb      #$cc 
                    STb      >VIA_cntl                    ;/BLANK low and /ZERO low 
                    SET_X_INT_16  
                    puls     d,pc                         ; (D = y,x, pc = next object) 
;SMVB16_LightOff_Intensity:                                ;#isfunction  
;                    WAIT10   
;                    lda      #$ce 
;                    STa      VIA_cntl                     ;/BLANK low and /ZERO low 
;                    stb      <VIA_port_a 
;                    ldd      #$0401 
;                    sta      <VIA_port_b 
;                    stb      <VIA_port_b 
;                    clra     
;                    pulu     b,x,pc 
calibrationZero16                                         ;#isfunction  
                    ldb      #$CC 
                    stb      <VIA_cntl 
                    ldd      #$8100 
                    std      <VIA_port_b 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    deca     
                    sta      <VIA_port_b 
 else  
                    dec      <VIA_port_b 
 endif  
                    ldb      >calibrationValue16 
                    lda      additionalFlags 
                    anda     #%00000001 
                    bne      buzzVectrex16 
                    lda      #$82 
                    std      <VIA_port_b 
                    ldd      #$83FF                       ; 2 cycles 
                    stb      <VIA_port_a 
                    sta      <VIA_port_b 
                    rts      

buzzVectrex16 
                    lda      #$82 
                    std      <VIA_port_b 
                    ldd      #$83FF                       ; 2 cycles 
                    stb      <VIA_port_a 
                    WAIT4    
                    sta      <VIA_port_b 
                    rts      
