; todo 
; last draw could contain $F in A
; than load not needed - attention 
; when cycles are not done for load, than shift value might be needed 2 higher!
; also in X could be some sensible value in X for one of the other 
;SMVB_lastDraw_rts2                                ;#isfunction  
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
VECTREX_SAVE_DELAY  =        1 
VB_SPRITE_SCALE     =        OBJECT_SCALE 
;
Y_DELAY             macro    
 if  VECTREX_SAVE_DELAY = 1 
                    nop      
 endif  
                    endm     
; -----
Y_DELAY_HALF        macro    
 if  VECTREX_SAVE_DELAY = 1 
                    nop      
 endif  
                    endm     
Y_DELAY_4           macro    
 if  VECTREX_SAVE_DELAY = 1 
                    nop      
                    nop      
 endif  
                    endm     
; -----
Y_DELAY_HALF_4      macro    
 if  VECTREX_SAVE_DELAY = 1 
                    nop      
 endif  
                    endm     
; -----
SET_Y_INT           macro    
 if  VECTREX_SAVE_DELAY = 1 
                    stb      <VIA_port_a                  ; 4 
                    sta      <VIA_port_b                  ; 4 shift not changed, move might also be a draw 
 else  
                    std      <VIA_port_b                  ; 5 
 endif  
                    endm     
; -----
; NOPS add one less, since PULL X is one cycle more than pull a!
ADD_NOPS            macro    
 if  VB_SPRITE_SCALE>8 
                    nop      (VB_SPRITE_SCALE-8)/2 
 endif  
                    endm     
; -----
ADD_NOPS_NOU        macro    
 if  VB_SPRITE_SCALE>(8-5) 
                    nop      (VB_SPRITE_SCALE-8-5)/2 
 endif  
                    endm     
; -----
ADD_NOPS_M4         macro    
 if  VB_SPRITE_SCALE-4>8 
                    nop      (VB_SPRITE_SCALE-4-8)/2 
 endif  
                    endm     
ADD_NOPS_M4_2       macro    
 if  VB_SPRITE_SCALE-6>8 
                    nop      (VB_SPRITE_SCALE-6-8)/2 
 endif  
                    endm     
; -----
ADD_NOPS_NOU_M4_2   macro    
 if  VB_SPRITE_SCALE-6>(8-5) 
                    nop      (VB_SPRITE_SCALE-8-5-6)/2 
 endif  
                    endm     
ADD_NOPS_NOU_M4     macro    
 if  VB_SPRITE_SCALE-4>(8-5) 
                    nop      (VB_SPRITE_SCALE-8-5-4)/2 
 endif  
                    endm     
; -----
WAIT_BEFORE         macro    
                    WAIT3    
                    endm     
; -----
WAIT_AFTER          macro    
                    WAIT7    
                    endm     
; -----
;***************************************************************************
SMVB_drawSmart                                            ;#isfunction  
                    clra     
                    pulu     b,x,pc 
;***************************************************************************
;/* HIGHEST SCALE FOR SMARTLIST + CONTINUE is 16!
SMVB_setScale:                                            ;#isfunction  
                    stb      <VIA_t1_cnt_lo 
                    pulu     b,x,pc 
SMVB_continue_yStays_single                               ;#isfunction  
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    ADD_NOPS  
                    pulu     b,x,pc 
SMVB_continue7_single                                     ;#isfunction  
                    SET_Y_INT  
                    Y_DELAY                               ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    ADD_NOPS                              ; 21 
; this is one pulu cycle more!
; thus ADD_NOPS can be one cycle less!
; minus 6!
                    pulu     b,x                          ; 5+3 
SMVB_continue6_single                                     ;#isfunction  
                    SET_Y_INT  
                    Y_DELAY                               ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    ADD_NOPS                              ; 21 
                    pulu     b,x                          ; 5+3 
SMVB_continue5_single                                     ;#isfunction  
                    SET_Y_INT  
                    Y_DELAY                               ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    ADD_NOPS                              ; 21 
                    pulu     b,x                          ; 5+3 
SMVB_continue4_single                                     ;#isfunction  
                    SET_Y_INT  
                    Y_DELAY                               ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    ADD_NOPS                              ; 21 
                    pulu     b,x                          ; 5+3 
SMVB_continue3_single                                     ;#isfunction  
                    SET_Y_INT  
                    Y_DELAY                               ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    ADD_NOPS                              ; 21 
                    pulu     b,x                          ; 5+3 
SMVB_continue2_single                                     ;#isfunction  
                    SET_Y_INT  
                    Y_DELAY                               ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    ADD_NOPS                              ; 21 
                    pulu     b,x                          ; 5+3 
SMVB_continue_yd4_single 
                    stb      <VIA_port_a                  ; 4 shift not changed, move might also be a draw 
; y is inherently known to be == old_x, y was set to 0 by generator
                    sta      <VIA_port_b                  ; 4 
;                    Y_DELAY                               ; 4 
                    brn      0 
                    nop      
                                                          ; Y_DELAY_HALF ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS  
                    pulu     b,x,pc 
; continue uses same shift  
SMVB_continue_single                                      ;#isfunction  
                    stb      <VIA_port_a                  ; 4 shift not changed, move might also be a draw 
; y is inherently known to be == old_x, y was set to 0 by generator
SMVB_continue_newY_eq_oldX_single:                        ;#isfunction  
                    sta      <VIA_port_b                  ; 4 
                    Y_DELAY                               ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS  
                    pulu     b,x,pc 
SMVB_continue_single_w                                    ;#isfunction  
                    stb      <VIA_port_a                  ; 4 shift not changed, move might also be a draw 
; y is inherently known to be == old_x, y was set to 0 by generator
                    sta      <VIA_port_b                  ; 4 
                    Y_DELAY                               ; 4 
                    nop      2 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS  
                    pulu     b,x,pc 
SMVB_continue_single_sj                                   ;#isfunction  
                    stb      <VIA_port_a                  ; 4 shift not changed, move might also be a draw 
; y is inherently known to be == old_x, y was set to 0 by generator
SMVB_continue_newY_eq_oldX_single_sj:                     ;#isfunction  
                    sta      <VIA_port_b                  ; 4 
                    Y_DELAY                               ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS_NOU                          ; reduced by ldu ,u - 5 cycles 
                    ldu      ,u 
                    pulu     b,x,pc 
; continue uses same shift
; y is inherently known to be == x, 
SMVB_continue_yEqx_single                                 ;#isfunction  
                    SET_Y_INT  
                    Y_DELAY_HALF                          ; 4 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    ldb      #1 
                    stb      <VIA_port_b 
 else  
                    inc      <VIA_port_b 
 endif  
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS  
                    pulu     b,x,pc 
SMVB_continue_tripple                                     ;#isfunction  
                    SET_Y_INT  
                    Y_DELAY                               ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS  
                    bra      cont2 

SMVB_continue_quadro                                      ;#isfunction  
                    SET_Y_INT  
                    Y_DELAY                               ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS  
                    bra      cont3 

SMVB_startDraw_quadro                                     ;#isfunction  
                    SET_Y_INT  
                    ldb      #$ee                         ; light OFF, ZERO OFF 
                    Y_DELAY_HALF  
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_M4  
                    bra      cont3 

SMVB_startDraw_hex                                        ;#isfunction  
                    SET_Y_INT  
                    ldb      #$ee                         ; light OFF, ZERO OFF 
                    Y_DELAY_HALF  
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_M4  
                    bra      cont5 

SMVB_startDraw_octo                                       ;#isfunction  
                    SET_Y_INT  
                    ldb      #$ee                         ; light OFF, ZERO OFF 
                    Y_DELAY_HALF  
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_M4  
                    bra      cont7 

SMVB_continue_octo                                        ;#isfunction  
                    SET_Y_INT  
                    Y_DELAY                               ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS  
                    WAIT_BEFORE  
cont7 
                    WAIT_AFTER  
                    clr      <VIA_t1_cnt_hi 
                    ADD_NOPS  
                    WAIT_BEFORE  
cont6 
                    WAIT_AFTER  
                    clr      <VIA_t1_cnt_hi 
                    ADD_NOPS  
                    WAIT_BEFORE  
cont5 
                    WAIT_AFTER  
                    clr      <VIA_t1_cnt_hi 
                    ADD_NOPS  
                    WAIT_BEFORE  
cont4 
                    WAIT_AFTER  
                    clr      <VIA_t1_cnt_hi 
                    ADD_NOPS  
                    WAIT_BEFORE  
cont3 
                    WAIT_AFTER  
                    clr      <VIA_t1_cnt_hi 
                    ADD_NOPS  
                    WAIT_BEFORE  
cont2 
                    WAIT_AFTER  
                    clr      <VIA_t1_cnt_hi 
                    ADD_NOPS  
                    bra      SMVB_repeat_same 

SMVB_continue_hex                                         ;#isfunction  
                    SET_Y_INT  
                    Y_DELAY                               ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS  
                    bra      cont5 

SMVB_repeat_same                                          ;#isfunction  
                    pulu     b,x 
                    clr      <VIA_t1_cnt_hi 
                    ADD_NOPS  
                    pulu     pc 
SMVB_startDraw_tripple                                    ;#isfunction  
                    SET_Y_INT  
                    ldb      #$ee                         ; light OFF, ZERO OFF 
                    Y_DELAY_HALF  
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_M4  
                    bra      cont2 

SMVB_continue_double 
                    SET_Y_INT  
                    Y_DELAY                               ; 4 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    ADD_NOPS  
                    bra      SMVB_repeat_same 

SMVB_startMove_single:                                    ;#isfunction  
                    SET_Y_INT  
                    ldb      #$ce                         ; light OFF, ZERO OFF 
                    Y_DELAY_HALF  
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_M4  
                    pulu     b,x,pc 
SMVB_startMove_single_sj:                                 ;#isfunction  
                    SET_Y_INT  
                    ldb      #$ce                         ; light OFF, ZERO OFF 
                    Y_DELAY_HALF  
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_NOU_M4                       ; reduced by ldu ,u - 5 cycles 
                    ldu      ,u 
                    pulu     b,x,pc 
SMVB_startMove_tripple                                    ;#isfunction  
                    SET_Y_INT  
                    ldb      #$ce                         ; light OFF, ZERO OFF 
                    Y_DELAY_HALF  
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_M4  
                    bra      cont2 

SMVB_startMove_quadro                                     ;#isfunction  
                    SET_Y_INT  
                    ldb      #$ce                         ; light OFF, ZERO OFF 
                    Y_DELAY_HALF  
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_M4  
                    bra      cont3 

SMVB_startMove_hex                                        ;#isfunction  
                    SET_Y_INT  
                    ldb      #$ce                         ; light OFF, ZERO OFF 
                    Y_DELAY_HALF  
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_M4  
                    jmp      cont5 

SMVB_startMove_double:                                    ;#isfunction  
                    SET_Y_INT  
                    ldb      #$ce                         ; light OFF, ZERO OFF 
                    Y_DELAY_HALF  
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_M4  
                    bra      SM_repeat_same2 

SMVB_startMove_double_sj                                  ;#isfunction  
                    SET_Y_INT  
                    ldb      #$ce                         ; light OFF, ZERO OFF 
                    Y_DELAY_HALF  
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_M4  
                    brn      0 
                    brn      0 
                    ldu      ,u                           ; 5 
                    clr      <VIA_t1_cnt_hi 
                    ADD_NOPS                              ; reduced by ldu ,u - 5 cycles 
                    pulu     b,x,pc                       ; 10 
SMVB_startDraw_double                                     ;#isfunction  
                    SET_Y_INT  
                    ldb      #$ee                         ; light OFF, ZERO OFF 
                    Y_DELAY_HALF  
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_M4  
                    bra      SM_repeat_same2 

SM_repeat_same2                                           ;#isfunction  
                    pulu     b,x 
                    clr      <VIA_t1_cnt_hi 
                    ADD_NOPS  
                    pulu     pc 
SMVB_startMove_yStays_single                              ;#isfunction  
                    ldb      #$ce                         ; light OFF, ZERO OFF 
                    Y_DELAY_HALF  
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_M4  
                    pulu     b,x,pc 
SMVB_startMove_yStays_single_sj 
                    stx      <VIA_port_b                  ; 5 
                    ldb      #$ee                         ; light ON, ZERO OFF 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_NOU_M4                       ; reduced by ldu ,u - 5 cycles 
                    ldu      ,u 
                    pulu     b,x,pc 
; assuming b = $ee
SMVB_startDraw_yStays_single                              ;#isfunction  
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_M4  
                    pulu     b,x,pc 
; assume b = $ee
SMVB_startDraw_xyStays_single                             ;#isfunction  
                    sta      <VIA_t1_cnt_hi 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_M4  
                    pulu     b,x,pc 
; assume b = $ee
SMVB_startDraw_yStays_single_sj                           ;#isfunction  
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_NOU_M4                       ; reduced by ldu ,u - 5 cycles 
                    ldu      ,u 
                    pulu     b,x,pc 
SMVB_startDraw_single:                                    ;#isfunction  
                    SET_Y_INT  
                    Y_DELAY_HALF  
                    ldb      #$ee                         ; light ON, ZERO OFF 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_M4  
                    pulu     b,x,pc 
SMVB_startDraw_single_sj                                  ;#isfunction  
                    SET_Y_INT  
                    Y_DELAY_HALF  
                    ldb      #$ee                         ; light ON, ZERO OFF 
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi               ; 4 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_NOU_M4                       ; reduced by ldu ,u - 5 cycles 
                    ldu      ,u 
                    pulu     b,x,pc 
SMVB_startDraw_yEqx_single_sj                             ;#isfunction  
                    SET_Y_INT  
                    ldb      #$ee 
                    Y_DELAY_HALF  
                    stx      <VIA_port_b 
                    sta      <VIA_t1_cnt_hi 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_NOU_M4                       ; reduced by ldu ,u - 5 cycles 
                    ldu      ,u 
                    pulu     b,x,pc 
SMVB_startDraw_yEqx_single                                ;#isfunction  
                    SET_Y_INT  
                    ldb      #$ee 
                    Y_DELAY_HALF  
                    stx      <VIA_port_b 
                    sta      <VIA_t1_cnt_hi 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_M4  
                    pulu     b,x,pc 
SMVB_startMove_yEqx_single                                ;#isfunction  
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
                    ADD_NOPS_M4  
                    pulu     b,x,pc 
SMVB_startMove_yEqx_single_sj                             ;#isfunction  
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
                    ADD_NOPS_NOU_M4                       ; reduced by ldu ,u - 5 cycles 
                    ldu      ,u 
                    pulu     b,x,pc 
SMVB_startMove_newY_eq_oldX_single_sj                     ;#isfunction  
                    sta      <VIA_port_b                  ; 4 
                    ldb      #$ce 
                    Y_DELAY_HALF  
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_NOU_M4                       ; reduced by ldu ,u - 5 cycles 
                    ldu      ,u 
                    pulu     b,x,pc 
SMVB_startMove_newY_eq_oldX_single                        ;#isfunction  
                    sta      <VIA_port_b                  ; 4 
                    ldb      #$ce 
                    Y_DELAY_HALF  
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_M4  
                    pulu     b,x,pc 
SMVB_startDraw_newY_eq_oldX_single:                       ;#isfunction  
                    sta      <VIA_port_b                  ; 4 
                    ldb      #$ee 
                    Y_DELAY_HALF  
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_M4  
                    pulu     b,x,pc 
SMVB_startDraw_newY_eq_oldX_single_sj:                    ;#isfunction  
                    sta      <VIA_port_b                  ; 4 
                    ldb      #$ee 
                    Y_DELAY_HALF  
                    stx      <VIA_port_b                  ; 5 
                    sta      <VIA_t1_cnt_hi 
                    stb      <VIA_cntl                    ; 
                    ADD_NOPS_NOU_M4                       ; reduced by ldu ,u - 5 cycles 
                    ldu      ,u 
                    pulu     b,x,pc 
SMVB_lastDraw_rts                                         ;#isfunction  
                    lda      #$ce 
SMVB_FlagWait: 
                    bitb     <VIA_int_flags 
; my new VIA
; seems to set T1 falsely when set during a 
; specific event (e.g. timer = 0)
; if that happens, either the I flags are not
; reseted - or T1 Hi set to very hi,
; anyway, when in warp, the last "SMVB_continue_yStays_single"
; of the failure bugs
; when the explosion has a growth of 4 that condition is
; met and vectrex HALTS dure to this check
; setting it to DISABLES
; doesn't make much difference in a 7 scale Smart draw!
; so for now I just disable it
;               beq      SMVB_FlagWait 
SMVB_rts:                                                 ;#isfunction  
                    ldb      gameScale 
                    sta      <VIA_cntl                    ; 
                    LDA      #$CC 
                    STA      VIA_cntl                     ;/BLANK low and /ZERO low 
                    stB      VIA_t1_cnt_lo 
; and ensures integrators are clean (good positioning!)
                    stx      <VIA_port_b                  ; x = 0 
                    rts      

SMVB_rts3:                                                ;#isfunction  
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
SMVB_lastDraw_rts_stay                                    ;#isfunction  
;                    SET_Y_INT  
;                    Y_DELAY_HALF                          ; 4 
;                    ldd      #$40E0 
;                    stx      <VIA_port_b                  ; 5 
;                    clr      <VIA_t1_cnt_hi 
;                    ADD_NOPS  
                    lda      #$ce 
SMVB_FlagWait3: 
                    bitb     <VIA_int_flags 
                    beq      SMVB_FlagWait3 
                    sta      <VIA_cntl                    ; 
                    nop      2 
                    rts      

SMVB_lastMove_rts_stay                                    ;#isfunction  
                    lda      #$40 
SMVB_FlagWait3_2: 
                    bita     <VIA_int_flags 
                    beq      SMVB_FlagWait3_2 
                    rts      

; todo 
; last draw could contain $F in A
; than load not needed - attention 
; when cycles are not done for load, than shift value might be needed 2 higher!
; also in X could be some sensible value in X for one of the other 
SMVB_lastDraw_rts2                                        ;#isfunction  
                    lda      #$c0 
                    sta      <VIA_cntl                    ; 
                    ldb      gameScale 
                    stb      VIA_t1_cnt_lo 
; extended on purpose to gain one cycle of time
; to reset to 
; a) swithc light off before zeroing
; b) zero
SMVB_rts2:                                                ;#isfunction  
                    ldb      #$cc 
                    STb      >VIA_cntl                    ;/BLANK low and /ZERO low 
                    stx      >VIA_port_b 
; nop 10
                    puls     d,pc                         ; (D = y,x, pc = next object) 
SMVB_LightOff_Intensity:                                  ;#isfunction  
                    WAIT10   
                    lda      #$ce                         ;%00000100 
                    STa      VIA_cntl                     ;/BLANK low and /ZERO low 
                    stb      <VIA_port_a 
                    ldd      #$0401 
                    sta      <VIA_port_b 
                    stb      <VIA_port_b 
                    clra     
                    pulu     b,x,pc 
calibrationZero7                                          ;#isfunction  
                    ldb      #$CC 
                    stb      <VIA_cntl 
calibrationZero7_NZ 
                    ldd      #$8100 
                    std      <VIA_port_b 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    deca     
                    sta      <VIA_port_b 
 else  
                    dec      <VIA_port_b 
 endif  
                    ldb      >calibrationValue7 
                    lda      additionalFlags 
                    anda     #%00000001 
                    bne      buzzVectrex7 
                    lda      #$82 
                    std      <VIA_port_b 
                    ldd      #$83FF                       ; 2 cycles 
                    stb      <VIA_port_a 
                    sta      <VIA_port_b 
                    rts      

buzzVectrex7 
                    lda      #$82 
                    std      <VIA_port_b 
                    ldd      #$83FF                       ; 2 cycles 
                    stb      <VIA_port_a 
                    nop      2 
                    sta      <VIA_port_b 
                    rts      
