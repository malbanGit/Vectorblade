; NOPS add one less, since PULL X is one cycle more than pull a!
ADD_NOPS_50         macro    
 if  VB_SPRITE_SCALE50>8 
                    WAIT42   
 endif  
                    endm     
ADD_NOPS_NOU_50     macro    
 if  VB_SPRITE_SCALE50>(8-5) 
                    WAIT37   
 endif  
                    endm     
; -----
ADD_NOPS_50_M4      macro    
 if  VB_SPRITE_SCALE50-4>8 
                    WAIT40   
 endif  
                    endm     
; -----
ADD_NOPS_NOU_50_M4  macro    
 if  VB_SPRITE_SCALE50-4>(8-5) 
                    WAIT35   
 endif  
                    endm     
Y_DELAY_50          macro    
                    nop      
                    nop      
                    endm     
Y_DELAY_50_HALF     macro    
                    nop      
                    endm     
; -----
;***************************************************************************
SMVB50_drawSmart                                          ;#isfunction  
                    clra     
                    pulu     b,x,pc 
;***************************************************************************
;/* HIGHEST SCALE FOR SMARTLIST + CONTINUE is 16!
SMVB50_setScale:                                          ;#isfunction  
                    stb      <VIA_t1_cnt_lo 
                    pulu     b,x,pc 
SMVB50_continue_yStays_single                             ;#isfunction  
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    ADD_NOPS_50  
                    pulu     b,x,pc 
SMVB50_continue7_single                                   ;#isfunction  
                    SET_Y_INT  
                    Y_DELAY_50                            ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    ADD_NOPS_50                           ; 21 
; this is one pulu cycle more!
; thus ADD_NOPS_50 can be one cycle less!
; minus 6!
                    pulu     b,x                          ; 5+3 
SMVB50_continue6_single                                   ;#isfunction  
                    SET_Y_INT  
                    Y_DELAY_50                            ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    ADD_NOPS_50                           ; 21 
                    pulu     b,x                          ; 5+3 
SMVB50_continue5_single                                   ;#isfunction  
                    SET_Y_INT  
                    Y_DELAY_50                            ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    ADD_NOPS_50                           ; 21 
                    pulu     b,x                          ; 5+3 
SMVB50_continue4_single                                   ;#isfunction  
                    SET_Y_INT  
                    Y_DELAY_50                            ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    ADD_NOPS_50                           ; 21 
                    pulu     b,x                          ; 5+3 
SMVB50_continue3_single                                   ;#isfunction  
                    SET_Y_INT  
                    Y_DELAY_50                            ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    ADD_NOPS_50                           ; 21 
                    pulu     b,x                          ; 5+3 
SMVB50_continue2_single                                   ;#isfunction  
                    SET_Y_INT  
                    Y_DELAY_50                            ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    ADD_NOPS_50                           ; 21 
                    pulu     b,x                          ; 5+3 
; continue uses same shift  
SMVB50_continue_single                                    ;#isfunction  
                    stb      <VIA_port_a                  ; 4 shift not changed, move might also be a draw 
; y is inherently known to be == old_x, y was set to 0 by generator
SMVB50_continue_newY_eq_oldX_single:                      ;#isfunction  
                    sta      <VIA_port_b                  ; 4 
                    Y_DELAY_50                            ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS_50  
                    pulu     b,x,pc 
;SMVB50_continue_zero_single                                  ;#isfunction  
;                    stb      <VIA_port_a                  ; 4 shift not changed, move might also be a draw 
; y is inherently known to be == old_x, y was set to 0 by generator
;                    sta      <VIA_port_b                  ; 4 
;                    Y_DELAY_50                            ; 4 
; 
;                    stx      <VIA_port_b                  ; 5 
;                    sta      <VIA_t1_cnt_hi 
;                    ADD_NOPS_50  
;                    pulu     b,x,pc 
SMVB50_continue_single_w                                  ;#isfunction  
                    stb      <VIA_port_a                  ; 4 shift not changed, move might also be a draw 
; y is inherently known to be == old_x, y was set to 0 by generator
                    sta      <VIA_port_b                  ; 4 
                    Y_DELAY_50                            ; 4 
                    nop      2 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS_50  
                    pulu     b,x,pc 
; y is inherently known to be == old_x, y was set to 0 by generator
SMVB50_continue_newY_eq_oldX_single_sj:                   ;#isfunction  
                    sta      <VIA_port_b                  ; 4 
                    Y_DELAY_50                            ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS_NOU_50                       ; reduced by ldu ,u - 5 cycles 
                    ldu      ,u 
                    pulu     b,x,pc 
; continue uses same shift
; y is inherently known to be == x, 
SMVB50_continue_yEqx_single                               ;#isfunction  
                    SET_Y_INT  
                    Y_DELAY_50_HALF                       ; 4 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    ldb      #1 
                    stb      <VIA_port_b 
 else  
                    inc      <VIA_port_b 
 endif  
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS_50  
                    pulu     b,x,pc 
SMVB50_startDraw_octo                                     ;#isfunction  
                    SET_Y_INT  
                    ldb      #$ee                         ; light OFF, ZERO OFF 
                    Y_DELAY_50_HALF  
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_50_M4  
                    bra      cont7_50 

SMVB50_startDraw_hex                                      ;#isfunction  
                    SET_Y_INT  
                    ldb      #$ee                         ; light OFF, ZERO OFF 
                    Y_DELAY_50_HALF  
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_50_M4  
                    bra      cont5_50 

SMVB50_continue_hex                                       ;#isfunction  
                    SET_Y_INT  
                    Y_DELAY_50                            ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS_50  
                    bra      cont5_50 

SMVB50_continue_tripple                                   ;#isfunction  
                    SET_Y_INT  
                    Y_DELAY_50                            ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS_50  
                    bra      cont2_50 

SMVB50_continue_octo                                      ;#isfunction  
                    SET_Y_INT  
                    Y_DELAY_50                            ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS_50  
                    WAIT_BEFORE  
cont7_50 
                    WAIT_AFTER  
                    clr      <VIA_t1_cnt_hi 
                    ADD_NOPS_50  
                    WAIT_BEFORE  
cont6_50 
                    WAIT_AFTER  
                    clr      <VIA_t1_cnt_hi 
                    ADD_NOPS_50  
                    WAIT_BEFORE  
cont5_50 
                    WAIT_AFTER  
                    clr      <VIA_t1_cnt_hi 
                    ADD_NOPS_50  
                    WAIT_BEFORE  
cont4_50 
                    WAIT_AFTER  
                    clr      <VIA_t1_cnt_hi 
                    ADD_NOPS_50  
                    WAIT_BEFORE  
cont3_50 
                    WAIT_AFTER  
                    clr      <VIA_t1_cnt_hi 
                    ADD_NOPS_50  
                    WAIT_BEFORE  
cont2_50 
                    WAIT_AFTER  
                    clr      <VIA_t1_cnt_hi 
                    ADD_NOPS_50  
                    bra      SMVB50_repeat_same 

SMVB50_continue_quadro                                    ;#isfunction  
                    SET_Y_INT  
                    Y_DELAY_50                            ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS_50  
                    bra      cont3_50 

SMVB50_startDraw_quadro                                   ;#isfunction  
                    SET_Y_INT  
                    ldb      #$ee                         ; light OFF, ZERO OFF 
                    Y_DELAY_50_HALF  
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_50_M4  
                    bra      cont3_50 

SMVB50_startMove_quadro                                   ;#isfunction  
                    SET_Y_INT  
                    ldb      #$ce                         ; light OFF, ZERO OFF 
                    Y_DELAY_50_HALF  
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_50_M4  
                    bra      cont3_50 

SMVB50_startDraw_tripple                                  ;#isfunction  
                    SET_Y_INT  
                    ldb      #$ee                         ; light OFF, ZERO OFF 
                    Y_DELAY_50_HALF  
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_50_M4  
                    bra      cont2_50 

SMVB50_repeat_same                                        ;#isfunction  
                    pulu     b,x 
                    clr      <VIA_t1_cnt_hi 
                    ADD_NOPS_50  
                    pulu     pc 
SMVB50_startMove_tripple                                  ;#isfunction  
                    SET_Y_INT  
                    ldb      #$ce                         ; light OFF, ZERO OFF 
                    Y_DELAY_50_HALF  
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_50_M4  
                    bra      cont2_50_2 

cont2_50_2 
                    WAIT_AFTER  
                    clr      <VIA_t1_cnt_hi 
                    ADD_NOPS_50  
                    bra      SMVB50_repeat_same 

SMVB50_continue_double 
                    SET_Y_INT  
                    Y_DELAY_50                            ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS_50  
                    bra      SMVB50_repeat_same 

SMVB50_startMove_single:                                  ;#isfunction  
                    SET_Y_INT  
                    ldb      #$ce                         ; light OFF, ZERO OFF 
                    Y_DELAY_50_HALF  
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_50_M4  
                    pulu     b,x,pc 
SMVB50_startMove_double:                                  ;#isfunction  
                    SET_Y_INT  
                    ldb      #$ce                         ; light OFF, ZERO OFF 
                    Y_DELAY_50_HALF  
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_50_M4  
                    bra      SMVB50_repeat_same20 

SMVB50_startDraw_double                                   ;#isfunction  
                    SET_Y_INT  
                    ldb      #$ee                         ; light OFF, ZERO OFF 
                    Y_DELAY_50_HALF  
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_50_M4  
                    bra      SMVB50_repeat_same20 

SMVB50_repeat_same20                                      ;#isfunction  
                    pulu     b,x 
                    clr      <VIA_t1_cnt_hi 
                    ADD_NOPS_50  
                    pulu     pc 
SMVB50_startMove_yStays_single                            ;#isfunction  
                    ldb      #$ce                         ; light OFF, ZERO OFF 
                    Y_DELAY_50_HALF  
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_50_M4  
                    pulu     b,x,pc 
; assuming b = $ee
SMVB50_startDraw_yStays_single                            ;#isfunction  
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_50_M4  
                    pulu     b,x,pc 
; assume b = $ee
SMVB50_startDraw_xyStays_single                           ;#isfunction  
SMVB50_startMove_xyStays_single 
                    sta      <VIA_t1_cnt_hi 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_50_M4  
                    pulu     b,x,pc 
SMVB50_startDraw_single:                                  ;#isfunction  
                    SET_Y_INT  
                    Y_DELAY_50_HALF  
                    ldb      #$ee                         ; light ON, ZERO OFF 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_50_M4  
                    pulu     b,x,pc 
SMVB50_startDraw_yEqx_single                              ;#isfunction  
                    SET_Y_INT  
                    ldb      #$ee 
                    Y_DELAY_50_HALF  
                    stx      <VIA_port_b 
                    sta      <VIA_t1_cnt_hi 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_50_M4  
                    pulu     b,x,pc 
SMVB50_startMove_yEqx_single                              ;#isfunction  
                    SET_Y_INT  
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    ldb      #1 
                    stb      <VIA_port_b 
 else  
                    inc      <VIA_port_b 
 endif  
                    ldb      #$ce 
                    sta      <VIA_t1_cnt_hi 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_50_M4  
                    pulu     b,x,pc 
SMVB50_startMove_newY_eq_oldX_single                      ;#isfunction  
                    sta      <VIA_port_b                  ; 4 
                    ldb      #$ce 
                    Y_DELAY_50_HALF  
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_50_M4  
                    pulu     b,x,pc 
SMVB50_startDraw_newY_eq_oldX_single:                     ;#isfunction  
                    sta      <VIA_port_b                  ; 4 
                    ldb      #$ee 
                    Y_DELAY_50_HALF  
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_50_M4  
                    pulu     b,x,pc 
SMVB50_lastDraw_rts                                       ;#isfunction  
                    lda      #$ce 
SMVB50_FlagWait: 
                    bitb     <VIA_int_flags 
                    beq      SMVB50_FlagWait 
SMVB50_rts:                                               ;#isfunction  
                    ldb      gameScale 
                    sta      <VIA_cntl                    ; 
                    LDA      #$CC 
                    STA      VIA_cntl                     ;/BLANK low and /ZERO low 
                    stB      VIA_t1_cnt_lo 
; and ensures integrators are clean (good positioning!)
;                    ldd      #0 
                    stx      <VIA_port_b 
                    rts      

SMVB50_rts3:                                              ;#isfunction  
                    ldb      gameScale 
                    sta      <VIA_cntl                    ; 
                    LDA      #$CC 
                    STA      VIA_cntl                     ;/BLANK low and /ZERO low 
                    stB      VIA_t1_cnt_lo 
; and ensures integrators are clean (good positioning!)
;                    ldd      #0 
                    stx      <VIA_port_b 
                    puls     d,pc 
;// TODO CHECK WITH SHIELD + CO
SMVB50_lastDraw_rts_stay                                  ;#isfunction  
;                    SET_Y_INT  
;                    Y_DELAY_50_HALF                          ; 4 
;                    ldd      #$40E0 
;                    stx      <VIA_port_b                  ; 5 
;                    clr      <VIA_t1_cnt_hi 
;                    ADD_NOPS_50  
                    lda      #$ce 
SMVB50_FlagWait3: 
                    bitb     <VIA_int_flags 
                    beq      SMVB50_FlagWait3 
                    sta      <VIA_cntl                    ; 
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
                    lda      #$c0 
                    sta      <VIA_cntl                    ; 
                    ldb      gameScale 
                    stb      VIA_t1_cnt_lo 
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
SMVB50_LightOff_Intensity:                                ;#isfunction  
                    WAIT10   
                    lda      #$ce 
                    STa      VIA_cntl                     ;/BLANK low and /ZERO high 
                    stb      <VIA_port_a 
                    ldd      #$0401 
                    sta      <VIA_port_b 
                    stb      <VIA_port_b 
                    clra     
                    pulu     b,x,pc 
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
