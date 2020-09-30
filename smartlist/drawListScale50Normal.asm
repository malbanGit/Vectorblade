SHITREG_POKE_VALUE  =        $01 
Y_DELAY             macro    
                    nop      
                    nop      
                    endm     
Y_DELAY_4           macro    
                    nop      
                    nop      
                    nop      
                    endm     
Y_DELAY_HALF        macro    
                    nop      
                    endm     
SET_Y_INT           macro    
                    sta      <VIA_port_b                  ; 4 
                    stb      <VIA_port_a                  ; 4 
                    endm     
; NOPS add one less, since PULL X is one cycle more than pull a!
ADD_NOPS            macro    
 if  VB_SPRITE_SCALE50>8 
;                    nop      (VB_SPRITE_SCALE50-8)/2 
                    WAIT42   
 endif  
                    endm     
ADD_NOPS_NOU        macro    
 if  VB_SPRITE_SCALE50>(8-5) 
;                    nop      (VB_SPRITE_SCALE50-8-5)/2 
                    WAIT37   
 endif  
                    endm     
WAIT_BEFORE         macro    
                    WAIT3    
                    endm     
WAIT_AFTER          macro    
                    WAIT7    
                    endm     
INIT_MOVE           macro    
                    ldb      #%1110000 
                    stb      <VIA_shift_reg               ; 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    endm     
INIT_MOVE_SJ        macro    
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    sta      <VIA_shift_reg               ; 
                    endm     
;***************************************************************************
SMVB50_drawSmart                                          ;#isfunction  
                    clra     
                    pulu     b,x,pc 
;***************************************************************************
;/* HIGHEST SCALE FOR SMARTLIST + CONTINUE is 16!
;SMVB50_setScale:                                          ;#isfunction  
;                    stb      <VIA_t1_cnt_lo 
;                    pulu     b,x,pc 
SMVB50_continue_yStays_single                             ;#isfunction  
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    ADD_NOPS  
                    pulu     b,x,pc 
SMVB50_continue7_single                                   ;#isfunction  
                    SET_Y_INT  
                    Y_DELAY                               ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    ADD_NOPS                              ; 21 
; this is one pulu cycle more!
; thus ADD_NOPS can be one cycle less!
; minus 6!
                    pulu     b,x                          ; 5+3 
SMVB50_continue6_single                                   ;#isfunction  
                    SET_Y_INT  
                    Y_DELAY                               ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    ADD_NOPS                              ; 21 
                    pulu     b,x                          ; 5+3 
SMVB50_continue5_single                                   ;#isfunction  
                    SET_Y_INT  
                    Y_DELAY                               ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    ADD_NOPS                              ; 21 
                    pulu     b,x                          ; 5+3 
SMVB50_continue4_single                                   ;#isfunction  
                    SET_Y_INT  
                    Y_DELAY                               ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    ADD_NOPS                              ; 21 
                    pulu     b,x                          ; 5+3 
SMVB50_continue3_single                                   ;#isfunction  
                    SET_Y_INT  
                    Y_DELAY                               ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    ADD_NOPS                              ; 21 
                    pulu     b,x                          ; 5+3 
SMVB50_continue2_single                                   ;#isfunction  
                    SET_Y_INT  
                    Y_DELAY                               ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    ADD_NOPS                              ; 21 
                    pulu     b,x                          ; 5+3 
; continue uses same shift  
SMVB50_continue_zero_single                               ;#isfunction  
SMVB50_continue_single                                    ;#isfunction  
                    stb      <VIA_port_a                  ; 4 shift not changed, move might also be a draw 
; y is inherently known to be == old_x, y was set to 0 by generator
SMVB50_continue_newY_eq_oldX_single:                      ;#isfunction  
                    sta      <VIA_port_b                  ; 4 
                    Y_DELAY                               ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS  
                    pulu     b,x,pc 
SMVB50_continue_yd4_single                                ;#isfunction  
                    stb      <VIA_port_a                  ; 4 shift not changed, move might also be a draw 
; y is inherently known to be == old_x, y was set to 0 by generator
                    sta      <VIA_port_b                  ; 4 
                    Y_DELAY_4                             ; 4 
;                    Y_DELAY_4                               ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS  
                    pulu     b,x,pc 
SMVB50_continue_single_sj                                 ;#isfunction  
                    stb      <VIA_port_a                  ; 4 shift not changed, move might also be a draw 
; y is inherently known to be == old_x, y was set to 0 by generator
SMVB50_continue_newY_eq_oldX_single_sj:                   ;#isfunction  
                    sta      <VIA_port_b                  ; 4 
                    Y_DELAY                               ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS_NOU                          ; reduced by ldu ,u - 5 cycles 
                    ldu      ,u 
                    pulu     b,x,pc 
SMVB50_continue_yEqx_single                               ;#isfunction  
                    SET_Y_INT  
                    Y_DELAY_HALF                          ; 4 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    ldb      #1 
                    stb      <VIA_port_b 
 else  
                    inc      <VIA_port_b 
 endif  
;                    inc      <VIA_port_b 
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS  
                    pulu     b,x,pc 
SMVB50_continue_hex                                       ;#isfunction  
                    SET_Y_INT  
                    Y_DELAY                               ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS  
                    bra      cont5_50 

SMVB50_continue_octo                                      ;#isfunction  
                    SET_Y_INT  
                    Y_DELAY                               ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS  
                    WAIT_BEFORE  
cont7_50 
                    WAIT_AFTER  
                    clr      <VIA_t1_cnt_hi 
                    ADD_NOPS  
                    WAIT_BEFORE  
cont6_50 
                    WAIT_AFTER  
                    clr      <VIA_t1_cnt_hi 
                    ADD_NOPS  
                    WAIT_BEFORE  
cont5_50 
                    WAIT_AFTER  
                    clr      <VIA_t1_cnt_hi 
                    ADD_NOPS  
                    WAIT_BEFORE  
cont4_50 
                    WAIT_AFTER  
                    clr      <VIA_t1_cnt_hi 
                    ADD_NOPS  
                    WAIT_BEFORE  
cont3_50 
                    WAIT_AFTER  
                    clr      <VIA_t1_cnt_hi 
                    ADD_NOPS  
                    WAIT_BEFORE  
cont2_50 
                    WAIT_AFTER  
                    clr      <VIA_t1_cnt_hi 
                    ADD_NOPS  
                    bra      SMVB50_repeat_same 

SMVB50_continue_quadro                                    ;#isfunction  
                    SET_Y_INT  
                    Y_DELAY                               ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS  
                    bra      cont3_50 

SMVB50_continue_tripple                                   ;#isfunction  
                    SET_Y_INT  
                    Y_DELAY                               ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS  
                    bra      cont2_50 

SMVB50_repeat_same                                        ;#isfunction  
                    pulu     b,x 
                    clr      <VIA_t1_cnt_hi 
                    ADD_NOPS  
                    pulu     pc 
SMVB50_startDraw_tripple 
                    SET_Y_INT  
                    ldb      #SHITREG_POKE_VALUE          ; 2 
                    stb      <VIA_shift_reg               ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    ADD_NOPS  
                    bra      cont2_50 

SMVB50_continue_double                                    ;#isfunction  
                    SET_Y_INT  
                    Y_DELAY                               ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS  
                    bra      SMVB50_repeat_same 

SMVB50_startMove_single:                                  ;#isfunction  
                    SET_Y_INT  
                    INIT_MOVE  
                    ADD_NOPS  
                    pulu     b,x,pc 
SMVB50_startMove_single_sj:                               ;#isfunction  
                    SET_Y_INT  
                    ldu      ,u 
                    INIT_MOVE_SJ  
                    ADD_NOPS_NOU                          ; reduced by ldu ,u - 5 cycles 
                    pulu     b,x,pc 
SMVB50_startMove_double:                                  ;#isfunction  
                    SET_Y_INT  
                    INIT_MOVE  
                    ADD_NOPS  
                    bra      SMVB50_repeat_same2 

SMVB50_startDraw_double 
                    SET_Y_INT  
                    ldb      #SHITREG_POKE_VALUE          ; 2 
                    stb      <VIA_shift_reg               ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    ADD_NOPS  
                    bra      SMVB50_repeat_same2 

SMVB50_repeat_same2                                       ;#isfunction  
                    pulu     b,x 
                    clr      <VIA_t1_cnt_hi 
                    ADD_NOPS  
                    pulu     pc 
move3_50 
                    WAIT_AFTER  
                    clr      <VIA_t1_cnt_hi 
                    ADD_NOPS  
                    WAIT_BEFORE  
move2_50 
                    WAIT_AFTER  
                    clr      <VIA_t1_cnt_hi 
                    ADD_NOPS  
                    bra      SMVB50_repeat_same2 

SMVB50_startMove_quadro 
                    SET_Y_INT  
                    INIT_MOVE  
                    ADD_NOPS  
                    bra      move3_50 

SMVB50_startMove_tripple 
                    SET_Y_INT  
                    INIT_MOVE  
                    ADD_NOPS  
                    bra      move2_50 

SMVB50_startMove_double_sj                                ;#isfunction  
                    SET_Y_INT  
                    ldu      ,u 
                    INIT_MOVE_SJ  
                    ADD_NOPS  
                    brn      0 
                    brn      0 
                    clr      <VIA_t1_cnt_hi 
                    ADD_NOPS                              ; reduced by ldu ,u - 5 cycles 
                    pulu     b,x, pc 
SMVB50_startMove_yStays_single                            ;#isfunction  
                    INIT_MOVE  
                    ADD_NOPS  
                    pulu     b,x,pc 
SMVB50_startMove_yStays_single_sj 
                    ldu      ,u 
                    INIT_MOVE_SJ  
                    ADD_NOPS_NOU                          ; reduced by ldu ,u - 5 cycles 
                    pulu     b,x,pc 
; assuming b = 1
SMVB50_startDraw_yStays_single                            ;#isfunction  
                    stb      <VIA_shift_reg               ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    ADD_NOPS  
                    pulu     b,x,pc 
; assume b contains SHIFT
SMVB50_startDraw_xyStays_single                           ;#isfunction  
                    stb      <VIA_shift_reg 
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS  
                    pulu     b,x,pc 
SMVB50_startDraw_yStays_single_sj                         ;#isfunction  
;                    ldb      #SHITREG_POKE_VALUE          ; 2 
                    stb      <VIA_shift_reg               ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    ADD_NOPS_NOU                          ; reduced by ldu ,u - 5 cycles 
                    ldu      ,u 
                    pulu     b,x,pc 
SMVB50_startDraw_yd4_single:                              ;#isfunction  
SMVB50_startDraw_single:                                  ;#isfunction  
                    SET_Y_INT  
                    ldb      #SHITREG_POKE_VALUE          ; 2 
                    stb      <VIA_shift_reg               ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    ADD_NOPS  
                    pulu     b,x,pc 
SMVB50_startDraw_single_sj 
                    SET_Y_INT  
                    ldb      #SHITREG_POKE_VALUE          ; 2 
                    stb      <VIA_shift_reg               ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    ADD_NOPS_NOU                          ; reduced by ldu ,u - 5 cycles 
                    ldu      ,u 
                    pulu     b,x,pc 
SMVB50_startDraw_yEqx_single_sj                           ;#isfunction  
                    SET_Y_INT  
                    ldb      #$01 
                    stb      <VIA_shift_reg               ; 4 - ASSUMING SHITREG_POKE_VALUE = 1 
                    stb      <VIA_port_b 
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS_NOU                          ; reduced by ldu ,u - 5 cycles 
                    ldu      ,u 
                    pulu     b,x,pc 
SMVB50_startDraw_yEqx_single                              ;#isfunction  
                    SET_Y_INT  
                    ldb      #$01 
                    stb      <VIA_shift_reg               ; 4 - ASSUMING SHITREG_POKE_VALUE = 1 
                    stb      <VIA_port_b 
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS  
                    pulu     b,x,pc 
SMVB50_startMove_yEqx_single                              ;#isfunction  
                    SET_Y_INT  
                    Y_DELAY_HALF  
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    ldb      #1 
                    stb      <VIA_port_b 
 else  
                    inc      <VIA_port_b 
 endif  
                    sta      <VIA_t1_cnt_hi 
                    sta      <VIA_shift_reg               ; 4 
                    ADD_NOPS  
                    pulu     b,x,pc 
SMVB50_startMove_xyStays_single                           ;#isfunction  
                    sta      <VIA_t1_cnt_hi 
                    stb      <VIA_shift_reg 
                    ADD_NOPS  
                    pulu     b,x,pc 
SMVB50_startMove_yEqx_single_sj                           ;#isfunction  
                    SET_Y_INT  
                    WAIT2    
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    ldb      #1 
                    stb      <VIA_port_b 
 else  
                    inc      <VIA_port_b 
 endif  
                    sta      <VIA_t1_cnt_hi 
                    sta      <VIA_shift_reg               ; 4 
                    ADD_NOPS_NOU                          ; reduced by ldu ,u - 5 cycles 
                    ldu      ,u 
                    pulu     b,x,pc 
SMVB50_startMove_newY_eq_oldX_single                      ;#isfunction  
                    sta      <VIA_port_b                  ; 4 
                    INIT_MOVE  
                    ADD_NOPS                              ; reduced by ldu ,u - 5 cycles 
                    pulu     b,x,pc 
SMVB50_startMove_newY_eq_oldX_single_sj                   ;#isfunction  
                    sta      <VIA_port_b                  ; 4 
                    ldu      ,u 
                    INIT_MOVE_SJ  
                    ADD_NOPS_NOU                          ; reduced by ldu ,u - 5 cycles 
                    pulu     b,x,pc 
SMVB50_startDraw_newY_eq_oldX_single:                     ;#isfunction  
                    sta      <VIA_port_b                  ; 4 
                    ldb      #SHITREG_POKE_VALUE 
                    stb      <VIA_shift_reg               ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS  
                    pulu     b,x,pc 
SMVB50_startDraw_newY_eq_oldX_single_sj:                  ;#isfunction  
                    sta      <VIA_port_b                  ; 4 
                    ldb      #SHITREG_POKE_VALUE 
                    stb      <VIA_shift_reg               ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS_NOU                          ; reduced by ldu ,u - 5 cycles 
                    ldu      ,u 
                    pulu     b,x,pc 
SMVB50_lastDraw_rts                                       ;#isfunction  
SMVB50_FlagWait: 
                    bitb     <VIA_int_flags 
                    beq      SMVB50_FlagWait 
                    sta      <VIA_shift_reg 
SMVB50_rts:                                               ;#isfunction  
                    ldb      gameScale 
                    LDA      #$CC 
                    STA      VIA_cntl                     ;/BLANK low and /ZERO low 
                    stB      VIA_t1_cnt_lo 
; and ensures integrators are clean (good positioning!)
;                    ldd      #0 
                    stx      <VIA_port_b 
                    rts      

;// TODO CHECK WITH SHIELD + CO
SMVB50_lastDraw_rts_stay                                  ;#isfunction  
;                    SET_Y_INT  
;                    Y_DELAY_HALF                          ; 4 
;                    ldd      #$40E0 
;                    stx      <VIA_port_b                  ; 5 
;                    clr      <VIA_t1_cnt_hi 
;                    ADD_NOPS  
SMVB50_FlagWait3:                                         ;#isfunction  
                    bitb     <VIA_int_flags 
                    beq      SMVB50_FlagWait3 
                    sta      <VIA_shift_reg 
                    nop      2 
                    rts      

SMVB50_lastMove_rts_stay                                  ;#isfunction  
                    lda      #$40 
SMVB50_FlagWait3_2: 
                    bita     <VIA_int_flags 
                    beq      SMVB50_FlagWait3_2 
                    rts      

; todo 
; last draw could contain $F in A
; than load not needed - attention 
; when cycles are not done for load, than shift value might be needed 2 higher!
; also in X could be some sensible value in X for one of the other 
SMVB50_lastDraw_rts2                                      ;#isfunction  
;                    ldb      #$f0 
                    nop      
                    stb      <VIA_shift_reg 
                    lda      gameScale 
                    sta      <VIA_t1_cnt_lo 
; extended on purpose to gain one cycle of time
; to reset to 
; a) swithc light off before zeroing
; b) zero
SMVB50_rts2:                                              ;#isfunction  
                    ldb      #$cc 
                    STb      >VIA_cntl                    ;/BLANK low and /ZERO low 
                    stx      >VIA_port_b 
; nop 10
                    puls     d,pc                         ; (D = y,x, pc = next object) 
calibrationZero50                                         ;#isfunction  
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
                    ldb      >calibrationValue50 
                    lda      additionalFlags 
                    anda     #%00000001 
                    bne      buzzVectrex50 
                    lda      #$82 
                    std      <VIA_port_b 
                    ldd      #$83FF                       ; 2 cycles 
                    stb      <VIA_port_a 
                    sta      <VIA_port_b 
                    rts      

buzzVectrex50 
                    lda      #$82 
                    std      <VIA_port_b 
                    ldd      #$83FF                       ; 2 cycles 
                    stb      <VIA_port_a 
                    nop      2 
                    sta      <VIA_port_b 
                    rts      
