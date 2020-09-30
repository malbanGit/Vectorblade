; bank 2 when used
; horizontal multi shots
; all shots are drawn from the shot y,x pos
; as "middle upper" point (drawn downwards)
SCALE_PLAYER_SHOT   =        10 
SCALE_SCOOPIE_SHOT  =        6 
PLAYER_SHOT_LENGTH  =        90                           ;100 ;116 
PLAYER_SHOT_LENGTH_5  =      PLAYER_SHOT_LENGTH/2 
; for all Macros
; register A always must contain 0 on entry
; register B must be set for the correct Y movement!
;...............................
; 10 scale is base
;...............................
DELAY_CYCLES        macro    delay,usedScale 
 if  (delay- (5-(usedScale/2)))>0 
                    nop      delay- (5-(usedScale/2)) 
 endif  
                    endm     
;...............................
 if  IS_VIA_FAULTY_RESISTENT = 1 
;...............................
DRAW_UP             macro    
                    std      <VIA_port_b                  ;Enable mux 
                    inca     
                    sta      <VIA_port_b 
                    deca     
                    STA      <VIA_port_a                  ;Send X to A/D 
                    ldb      #%00111110 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    stb      <VIA_shift_reg               ;Store pattern in shift register 
                    endm     
;...............................
DRAW_DOWN           macro    
; this is actually the same,
; since y movement is determined by register A
; which must be set by the callee
                    DRAW_UP  
                    endm     
;...............................
; in b zero, in a left strength
MOVE_HALF_LEFT      macro    
                    sta      <VIA_port_a 
                    sta      <VIA_port_b                  ;Enable mux 
                    inca     
                    sta      <VIA_port_b 
                    deca     
                    STb      <VIA_port_a                  ;Send Y to A/D 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    endm     
;...............................
MOVE_DOWN           macro    
                    std      <VIA_port_b                  ;Enable mux 
                    inca     
                    sta      <VIA_port_b 
                    deca     
                    sta      <VIA_port_a                  ;x 0 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    endm     
;...............................
MOVE_UP             macro    
; this is actually the same,
; since y movement is determined by register A
; which must be set by the callee
                    MOVE_DOWN  
                    endm     
;...............................
MOVE_LEFT_DOWN      macro    
                    std      <VIA_port_b                  ;Enable mux 
                    inca     
                    sta      <VIA_port_b 
                    deca     
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    endm     
;...............................
MOVE_LEFT_UP        macro    
                    std      <VIA_port_b                  ;Enable mux 
                    negb     
                    inca     
                    sta      <VIA_port_b 
                    deca     
                    STb      <VIA_port_a                  ;Send Y to A/D 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    endm     
;...............................
MOVE_RIGHT_DOWN     macro    
                    std      <VIA_port_b                  ;Enable mux 
                    negb     
                    inca     
                    sta      <VIA_port_b 
                    deca     
                    STb      <VIA_port_a                  ;Send Y to A/D 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    endm     
;...............................
MOVE_RIGHT_UP       macro    
                    std      <VIA_port_b                  ;Enable mux 
                    inca     
                    sta      <VIA_port_b 
                    deca     
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    endm     
;...............................
MOVE_RIGHT_RIGHT_DOWN  macro  usedScale 
;                    std      <VIA_port_b                  ;Enable mux 
                    sta      <VIA_port_b                  ;Enable mux 
                    stb      <VIA_port_a                  ;Enable mux 
                    negb     
                    aslb     
                    inca     
                    sta      <VIA_port_b 
                    deca     
                    STb      <VIA_port_a                  ;Send X to A/D 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    DELAY_CYCLES  5,usedScale 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    endm     
;...............................
MOVE_RIGHT_RIGHT_UP  macro   usedScale 
                    std      <VIA_port_b                  ;Enable mux 
                    aslb     
                    inca     
                    sta      <VIA_port_b 
                    deca     
                    STb      <VIA_port_a                  ;Send X to A/D 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    DELAY_CYCLES  5,usedScale 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    endm     
;...............................
MOVE_LEFT_LEFT_UP   macro    usedScale 
;                    std      <VIA_port_b                  ;Enable mux 
; cranky needs split
                    sta      <VIA_port_b                  ;Enable mux 
                    stb      <VIA_port_a                  ;Enable mux 
                    negb     
                    aslb     
                    inca     
                    sta      <VIA_port_b 
                    deca     
                    STb      <VIA_port_a                  ;Send X to A/D 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    DELAY_CYCLES  5,usedScale 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    endm     
;...............................
MOVE_LEFT_LEFT_DOWN  macro   usedScale 
                    std      <VIA_port_b                  ;Enable mux 
;                    sta      <VIA_port_b                  ;Enable mux 
;                    stb      <VIA_port_a                  ;Enable mux 
                    aslb     
                    inca     
                    sta      <VIA_port_b 
                    deca     
                    STb      <VIA_port_a                  ;Send X to A/D 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    DELAY_CYCLES  5,usedScale 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    endm     
;...............................
MOVE_HALFLEFT_DOWN  macro    usedScale 
                    std      <VIA_port_b                  ;Enable mux 
                    asrb     
                    inca     
                    sta      <VIA_port_b 
                    deca     
                    STb      <VIA_port_a                  ;Send X to A/D 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    endm     
;...............................
MOVE_HALFLEFT_UP    macro    usedScale 
                    std      <VIA_port_b                  ;Enable mux 
                    asrb     
                    negb     
                    inca     
                    sta      <VIA_port_b 
                    deca     
                    STb      <VIA_port_a                  ;Send X to A/D 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    endm     
;...............................
MOVE_LEFT_HALFLEFT_DOWN  macro  usedScale 
                    std      <VIA_port_b                  ;Enable mux 
                    asrb     
                    inca     
                    sta      <VIA_port_b 
                    deca     
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    DELAY_CYCLES  4,usedScale 
                    sta      <VIA_port_a 
                    sta      <VIA_port_b                  ;Enable mux 
                    inca     
                    sta      <VIA_port_b 
                    deca     
                    STb      <VIA_port_a                  ;Send X to A/D 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    endm     
;...............................
MOVE_LEFT_HALFLEFT_UP  macro  usedScale 
                    std      <VIA_port_b                  ;Enable mux 
                    negb     
                    inca     
                    sta      <VIA_port_b 
                    deca     
                    STb      <VIA_port_a                  ;Send Y to A/D 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    asrb     
                    DELAY_CYCLES  4,usedScale 
                    sta      <VIA_port_a 
                    sta      <VIA_port_b                  ;Enable mux 
                    inca     
                    sta      <VIA_port_b 
                    deca     
                    STb      <VIA_port_a                  ;Send X to A/D 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    endm     
;...............................
MOVE_SCOOP_RIGHT    macro    usedScale 
                    ldb      #-(PLAYER_SHOT_LENGTH/2) 
                    MOVE_RIGHT_RIGHT_DOWN  usedScale 
                    endm     
;...............................
MOVE_RESET_RIGHT    macro    usedScale 
                    ldb      #(PLAYER_SHOT_LENGTH/2) 
                    MOVE_LEFT_LEFT_UP  usedScale 
                    endm     
;...............................
MOVE_SCOOP_LEFT     macro    usedScale 
                    ldb      #-(PLAYER_SHOT_LENGTH/2) 
                    MOVE_LEFT_LEFT_DOWN  usedScale 
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; THREE SHOTS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;...............................
DRAW_PLAYER_SHOT_3_CONT  macro  usedScale 
; ten cycles between poke hi and next influencing poke
                    DRAW_DOWN  
; wait some cycles 
; nop 10
                    ldb      #PLAYER_SHOT_LENGTH 
                    DELAY_CYCLES  3,usedScale 
                    MOVE_LEFT_UP  
; wait some cycles 
; nop 10
                    ldb      #-PLAYER_SHOT_LENGTH 
                    DELAY_CYCLES  3,usedScale 
                    DRAW_DOWN  
; wait some cycles 
; nop 10
                    ldb      #(PLAYER_SHOT_LENGTH/2) 
                    DELAY_CYCLES  3,usedScale 
                    MOVE_RIGHT_RIGHT_UP  usedScale 
; wait some cycles 
; nop 10
                    ldb      #-PLAYER_SHOT_LENGTH 
                    DELAY_CYCLES  3,usedScale 
                    DRAW_DOWN  
; wait some cycles 
; nop 10
                    ldb      #PLAYER_SHOT_LENGTH 
                    DELAY_CYCLES  3,usedScale 
                    MOVE_LEFT_UP  
; doesn't matter
                    endm     
;...............................
DRAW_PLAYER_SHOT_3  macro    
;                    lda      #SCALE_PLAYER_SHOT 
;                    sta      VIA_t1_cnt_lo 
;                    lda      #-PLAYER_SHOT_LENGTH 
                    ldd      #lo(-PLAYER_SHOT_LENGTH) + lo(SCALE_PLAYER_SHOT) *256 
                    sta      VIA_t1_cnt_lo 
                    MY_MOVE_TO_A_END  
                    clra     
                    DRAW_PLAYER_SHOT_3_CONT  SCALE_PLAYER_SHOT 
                    endm     
;...............................
DRAW_PLAYER_SCOOP_RIGHT_3  macro  
                    clra     
                    MOVE_SCOOP_RIGHT  SCALE_PLAYER_SHOT 
                    ldb      #SCALE_SCOOPIE_SHOT 
                    stb      VIA_t1_cnt_lo 
                    ldb      #-PLAYER_SHOT_LENGTH 
                    DELAY_CYCLES  1,SCALE_SCOOPIE_SHOT 
                    DRAW_PLAYER_SHOT_3_CONT  SCALE_SCOOPIE_SHOT 
                    ldb      #SCALE_PLAYER_SHOT 
                    stb      VIA_t1_cnt_lo 
                    DELAY_CYCLES  1,SCALE_SCOOPIE_SHOT 
                    MOVE_RESET_RIGHT  SCALE_PLAYER_SHOT 
                    endm     
;...............................
DRAW_PLAYER_SCOOP_LEFT_3  macro  
                    clra     
                    MOVE_SCOOP_LEFT  SCALE_PLAYER_SHOT 
                    ldb      #SCALE_SCOOPIE_SHOT 
                    stb      VIA_t1_cnt_lo 
                    ldb      #-PLAYER_SHOT_LENGTH 
                    DELAY_CYCLES  1,SCALE_SCOOPIE_SHOT 
                    DRAW_PLAYER_SHOT_3_CONT  SCALE_SCOOPIE_SHOT 
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; TWO SHOTS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;...............................
DRAW_PLAYER_SHOT_2_CONT  macro  usedScale 
; ten cycles between poke hi and next influencing poke
                    MOVE_HALF_LEFT  
                    ldb      #-PLAYER_SHOT_LENGTH 
                    DELAY_CYCLES  3,usedScale 
                    DRAW_DOWN  
                    ldb      #PLAYER_SHOT_LENGTH 
                    DELAY_CYCLES  3,usedScale 
                    MOVE_RIGHT_UP  usedScale 
                    ldb      #-PLAYER_SHOT_LENGTH 
                    DELAY_CYCLES  3,usedScale 
                    DRAW_DOWN  
                    ldb      #PLAYER_SHOT_LENGTH 
                    DELAY_CYCLES  3,usedScale 
                    MOVE_HALFLEFT_UP  usedScale 
                    endm     
;...............................
DRAW_PLAYER_SHOT_2  macro    
;                    lda      #SCALE_PLAYER_SHOT 
;                    sta      VIA_t1_cnt_lo 
;                    lda      #-(PLAYER_SHOT_LENGTH /2) 
                    ldd      #lo(-(PLAYER_SHOT_LENGTH/2)) + lo(SCALE_PLAYER_SHOT) *256 
                    sta      VIA_t1_cnt_lo 
                    MY_MOVE_TO_A_END  
                    clra     
                    DRAW_PLAYER_SHOT_2_CONT  SCALE_PLAYER_SHOT 
                    endm     
;...............................
DRAW_PLAYER_SCOOP_RIGHT_2  macro  
                    clra     
                    MOVE_SCOOP_RIGHT  SCALE_PLAYER_SHOT 
                    ldb      #SCALE_SCOOPIE_SHOT 
                    stb      VIA_t1_cnt_lo 
                    ldb      #-(PLAYER_SHOT_LENGTH /2) 
                    DELAY_CYCLES  1,SCALE_SCOOPIE_SHOT 
                    DRAW_PLAYER_SHOT_2_CONT  SCALE_SCOOPIE_SHOT 
                    ldb      #SCALE_PLAYER_SHOT 
                    stb      VIA_t1_cnt_lo 
                    DELAY_CYCLES  1,SCALE_SCOOPIE_SHOT 
                    MOVE_RESET_RIGHT  SCALE_PLAYER_SHOT 
                    endm     
;...............................
DRAW_PLAYER_SCOOP_LEFT_2  macro  
                    clra     
                    MOVE_SCOOP_LEFT  SCALE_PLAYER_SHOT 
                    ldb      #SCALE_SCOOPIE_SHOT 
                    stb      VIA_t1_cnt_lo 
                    ldb      #-(PLAYER_SHOT_LENGTH /2) 
                    DELAY_CYCLES  1,SCALE_SCOOPIE_SHOT 
                    DRAW_PLAYER_SHOT_2_CONT  SCALE_SCOOPIE_SHOT 
                    endm     
;...............................
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ONE SHOTS   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;...............................
DRAW_PLAYER_SHOT_1_CONT  macro  usedScale 
; ten cycles between poke hi and next influencing poke
                    DRAW_DOWN  
                    ldb      #PLAYER_SHOT_LENGTH 
                    DELAY_CYCLES  3,usedScale 
                    MOVE_UP  
; doesn't matter
                    endm     
;...............................
DRAW_PLAYER_SHOT_1  macro    
;                    lda      #SCALE_PLAYER_SHOT
;                    sta      VIA_t1_cnt_lo 
;                    lda      #-PLAYER_SHOT_LENGTH 
                    ldd      #lo(-PLAYER_SHOT_LENGTH) + lo(SCALE_PLAYER_SHOT) *256 
                    sta      VIA_t1_cnt_lo 
                    MY_MOVE_TO_A_END                      ; corrected 
                    clra     
                    DRAW_PLAYER_SHOT_1_CONT  SCALE_PLAYER_SHOT 
                    endm     
;...............................
DRAW_PLAYER_SCOOP_RIGHT_1  macro  
                    clra     
                    MOVE_SCOOP_RIGHT  SCALE_PLAYER_SHOT 
                    ldb      #SCALE_SCOOPIE_SHOT 
                    stb      VIA_t1_cnt_lo 
                    ldb      #-PLAYER_SHOT_LENGTH 
                    DELAY_CYCLES  1,SCALE_SCOOPIE_SHOT 
                    DRAW_PLAYER_SHOT_1_CONT  SCALE_SCOOPIE_SHOT 
                    ldb      #SCALE_PLAYER_SHOT 
                    stb      VIA_t1_cnt_lo 
                    DELAY_CYCLES  1,SCALE_SCOOPIE_SHOT 
                    MOVE_RESET_RIGHT  SCALE_PLAYER_SHOT 
                    endm     
;...............................
DRAW_PLAYER_SCOOP_LEFT_1  macro  
                    clra     
                    MOVE_SCOOP_LEFT  SCALE_PLAYER_SHOT 
                    ldb      #SCALE_SCOOPIE_SHOT 
                    stb      VIA_t1_cnt_lo 
                    ldb      #-PLAYER_SHOT_LENGTH 
                    DELAY_CYCLES  1,SCALE_SCOOPIE_SHOT 
                    DRAW_PLAYER_SHOT_1_CONT  SCALE_SCOOPIE_SHOT 
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ONE SHOTS   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DRAW_PLAYER_SHOT_0  macro    
                    ldb      #SCALE_PLAYER_SHOT 
                    stb      VIA_t1_cnt_lo 
                    MY_MOVE_TO_A_END  
                    clra     
                    endm     
;...............................
DRAW_DOWN_HALF_LEFT  macro   usedScale 
                    std      <VIA_port_b                  ;Enable mux 
                    asrb     
                    inca     
                    sta      <VIA_port_b 
                    deca     
                    STb      <VIA_port_a                  ;Send X to A/D 
                    aslb     
                    negb     
                    dec      <VIA_shift_reg               ;Store pattern in shift register 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    endm     
;...............................
DRAW_UP_HALF_LEFT   macro    usedScale 
                    std      <VIA_port_b                  ;Enable mux 
                    negb     
                    asrb     
                    inca     
                    sta      <VIA_port_b 
                    deca     
                    STb      <VIA_port_a                  ;Send X to A/D 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    endm     
;...............................
DRAW_RIGHT          macro    usedScale 
                    STa      <VIA_port_a                  ;Send Y to A/D 
                    sta      <VIA_port_b                  ;Enable mux 
                    inca     
                    sta      <VIA_port_b 
                    deca     
                    STb      <VIA_port_a                  ;Send X to A/D 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    endm     
;...............................
DRAW_PLAYER_SHOT_5  macro    
                    ldd      #lo(-(PLAYER_SHOT_LENGTH_5)) + lo(SCALE_PLAYER_SHOT) *256 
                    sta      VIA_t1_cnt_lo 
                    clra     
                    sta      <VIA_shift_reg               ;ensure 0 so a dec works ok 
                    MY_MOVE_TO_A_END  
                    clra     
; down left/2
                    std      <VIA_port_b                  ;Enable mux 
                    asrb     
                    inca     
                    sta      <VIA_port_b 
                    deca     
                    STb      <VIA_port_a                  ;Send X to A/D 
                    ldb      #-1 
                    stb      <VIA_shift_reg 
                    sta      <VIA_t1_cnt_hi               ;4 Clear T1H 
                    ldb      #PLAYER_SHOT_LENGTH_5 
                    brn      0 
; RIGHT 
                    STa      <VIA_port_a                  ;4 Send Y to A/D 
                    sta      <VIA_port_b                  ;4 Enable mux 
                    inca     
                    sta      <VIA_port_b 
                    deca     
                    STb      <VIA_port_a                  ;4 Send X to A/D 
                    sta      <VIA_t1_cnt_hi               ;4 Clear T1H 
                    brn      0 
                    brn      0 
; up left/2
                    std      <VIA_port_b                  ;4 Enable mux 
                    negb                                  ;2 
                    asrb                                  ;2 
                    inca     
                    sta      <VIA_port_b 
                    deca     
                    STb      <VIA_port_a                  ;4 Send X to A/D 
                    ldb      #%11111110                   ;2 
                    sta      <VIA_t1_cnt_hi               ;4 Clear T1H 
                    nop                                   ;2 
                    brn      0 
                    stb      <VIA_shift_reg               ;4 Store pattern in shift register 
                    endm     
;...............................
DRAW_PLAYER_SCOOP_RIGHT_5  macro  
                    clra     
                    MOVE_SCOOP_RIGHT  SCALE_PLAYER_SHOT 
                    ldb      #SCALE_SCOOPIE_SHOT 
                    stb      VIA_t1_cnt_lo 
                    ldb      #-(PLAYER_SHOT_LENGTH_5) 
                    sta      <VIA_shift_reg 
;..
; down left/2
                    std      <VIA_port_b                  ;Enable mux 
                    asrb     
                    inca     
                    sta      <VIA_port_b 
                    deca     
                    STb      <VIA_port_a                  ;Send X to A/D 
                    ldb      #-1 
                    stb      <VIA_shift_reg 
                    sta      <VIA_t1_cnt_hi               ;4 Clear T1H 
                    ldb      #PLAYER_SHOT_LENGTH_5 
; RIGHT 
                    nop      
                    STa      <VIA_port_a                  ;4 Send Y to A/D 
                    sta      <VIA_port_b                  ;4 Enable mux 
                    inca     
                    sta      <VIA_port_b 
                    deca     
                    STb      <VIA_port_a                  ;4 Send X to A/D 
                    sta      <VIA_t1_cnt_hi               ;4 Clear T1H 
; up left/2
                    nop      
                    std      <VIA_port_b                  ;4 Enable mux 
                    negb                                  ;2 
                    asrb                                  ;2 
                    inca     
                    sta      <VIA_port_b 
                    deca     
                    STb      <VIA_port_a                  ;4 Send X to A/D 
                    ldb      #%11111110                   ;2 
                    sta      <VIA_t1_cnt_hi               ;4 Clear T1H 
                    nop                                   ;2 
                    stb      <VIA_shift_reg               ;4 Store pattern in shift register 
                    ldb      #SCALE_PLAYER_SHOT 
                    stb      VIA_t1_cnt_lo 
                    DELAY_CYCLES  1,SCALE_SCOOPIE_SHOT 
                    MOVE_RESET_RIGHT  SCALE_PLAYER_SHOT 
                    endm     
DRAW_PLAYER_SCOOP_LEFT_5  macro  
                    clra     
                    MOVE_SCOOP_LEFT  SCALE_PLAYER_SHOT 
                    ldb      #SCALE_SCOOPIE_SHOT 
                    stb      VIA_t1_cnt_lo 
                    ldb      #-(PLAYER_SHOT_LENGTH_5) 
                    sta      <VIA_shift_reg 
;..
; down left/2
                    std      <VIA_port_b                  ;Enable mux 
                    asrb     
                    inca     
                    sta      <VIA_port_b 
                    deca     
                    STb      <VIA_port_a                  ;Send X to A/D 
                    ldb      #-1 
                    stb      <VIA_shift_reg 
                    sta      <VIA_t1_cnt_hi               ;4 Clear T1H 
                    ldb      #PLAYER_SHOT_LENGTH_5 
                    nop      
; RIGHT 
                    STa      <VIA_port_a                  ;4 Send Y to A/D 
                    sta      <VIA_port_b                  ;4 Enable mux 
                    inca     
                    sta      <VIA_port_b 
                    deca     
                    STb      <VIA_port_a                  ;4 Send X to A/D 
                    sta      <VIA_t1_cnt_hi               ;4 Clear T1H 
; up left/2
                    nop      
                    std      <VIA_port_b                  ;4 Enable mux 
                    negb                                  ;2 
                    asrb                                  ;2 
                    inca     
                    sta      <VIA_port_b 
                    deca     
                    STb      <VIA_port_a                  ;4 Send X to A/D 
                    ldb      #%11111110                   ;2 
                    sta      <VIA_t1_cnt_hi               ;4 Clear T1H 
                    nop                                   ;2 
                    stb      <VIA_shift_reg               ;4 Store pattern in shift register 
;..
                    endm     
;...............................
DRAW_PLAYER_SCOOP_RIGHT_6  macro  
                    lda      #SCALE_PLAYER_SHOT 
                    sta      VIA_t1_cnt_lo 
                    MY_MOVE_TO_A_END  
                    clra     
                    MOVE_SCOOP_RIGHT  SCALE_PLAYER_SHOT 
                    lda      gameScale 
                    deca     
                    adda     gameScale                    ; double -1 - so gamescale $80 is not "fucked" 
; subb #10
                    sta      VIA_t1_cnt_lo 
                    lda      LAZER_WOBBLE+u_offset1,s 
                    ldb      laserEnemyPointerRight 
                    beq      fullLaser\? 
                    ldb      laserLowestYRight 
                    addb     #$80 
                    lsrb     
                    subb     #10                          ; otherwise laser always above enemey 
                    bra      contLaser\? 

fullLaser\? 
                    ldb      #$7f 
contLaser\? 
; laser go on
                    STb      <VIA_port_a                  ;Send Y to A/D 
                    clrb     
                    stb      <VIA_port_b                  ;Enable mux 
                    incb     
                    stb      <VIA_port_b                  ;Disable mux 
                    STa      <VIA_port_a                  ;Send X to A/D 
                    ldb      #-1 
                    clr      <VIA_t1_cnt_hi               ;Clear T1H 
                    stb      <VIA_shift_reg               ;Store pattern in shift register 
                    LDa      #$40                         ; 
                    clrb     
waitNotDoneLazer1\? 
                    BITa     <VIA_int_flags               ; 
                    beq      waitNotDoneLazer1\? 
;waitDoneLazer1\? 
                    stb      <VIA_shift_reg               ;Store pattern in shift register 
                    endm     
;...............................
DRAW_PLAYER_SCOOP_LEFT_6  macro  
                    lda      #SCALE_PLAYER_SHOT 
                    sta      VIA_t1_cnt_lo 
                    MY_MOVE_TO_A_END  
                    clra     
                    MOVE_SCOOP_LEFT  SCALE_PLAYER_SHOT 
                    lda      gameScale 
                    deca     
                    adda     gameScale 
; subb #10
                    sta      VIA_t1_cnt_lo 
                    lda      LAZER_WOBBLE+u_offset1,s 
                    ldb      laserEnemyPointerLeft 
                    beq      fullLaser\? 
                    ldb      laserLowestYLeft 
                    addb     #$80 
                    lsrb     
                    subb     #10                          ; otherwise laser always above enemey 
                    bra      contLaser\? 

fullLaser\? 
                    ldb      #$7f 
contLaser\? 
; laser go on
                    STb      <VIA_port_a                  ;Send Y to A/D 
                    clrb     
                    stb      <VIA_port_b                  ;Enable mux 
                    incb     
                    stb      <VIA_port_b                  ;Disable mux 
                    STa      <VIA_port_a                  ;Send X to A/D 
                    ldb      #-1 
                    clr      <VIA_t1_cnt_hi               ;Clear T1H 
                    stb      <VIA_shift_reg               ;Store pattern in shift register 
                    LDa      #$40                         ; 
                    clrb     
waitNotDoneLazer1\? 
                    BITa     <VIA_int_flags               ; 
                    beq      waitNotDoneLazer1\? 
;waitDoneLazer1\? 
                    stb      <VIA_shift_reg               ;Store pattern in shift register 
                    endm     
 else  
;...............................
DRAW_UP             macro    
                    std      <VIA_port_b                  ;Enable mux 
                    INC      <VIA_port_b                  ;Disable mux 
                    STA      <VIA_port_a                  ;Send X to A/D 
                    ldb      #%00111110 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    stb      <VIA_shift_reg               ;Store pattern in shift register 
                    endm     
;...............................
DRAW_DOWN           macro    
; this is actually the same,
; since y movement is determined by register A
; which must be set by the callee
                    DRAW_UP  
                    endm     
;...............................
; in b zero, in a left strength
MOVE_HALF_LEFT      macro    
                    sta      <VIA_port_a 
                    sta      <VIA_port_b                  ;Enable mux 
                    INC      <VIA_port_b                  ;Disable mux 
                    STb      <VIA_port_a                  ;Send Y to A/D 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    endm     
;...............................
MOVE_DOWN           macro    
                    std      <VIA_port_b                  ;Enable mux 
                    INC      <VIA_port_b                  ;Disable mux 
                    sta      <VIA_port_a                  ;x 0 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    endm     
;...............................
MOVE_UP             macro    
; this is actually the same,
; since y movement is determined by register A
; which must be set by the callee
                    MOVE_DOWN  
                    endm     
;...............................
MOVE_LEFT_DOWN      macro    
                    std      <VIA_port_b                  ;Enable mux 
                    INC      <VIA_port_b                  ;Disable mux 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    endm     
;...............................
MOVE_LEFT_UP        macro    
                    std      <VIA_port_b                  ;Enable mux 
                    negb     
                    INC      <VIA_port_b                  ;Disable mux 
                    STb      <VIA_port_a                  ;Send Y to A/D 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    endm     
;...............................
MOVE_RIGHT_DOWN     macro    
                    std      <VIA_port_b                  ;Enable mux 
                    negb     
                    INC      <VIA_port_b                  ;Disable mux 
                    STb      <VIA_port_a                  ;Send Y to A/D 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    endm     
;...............................
MOVE_RIGHT_UP       macro    
                    std      <VIA_port_b                  ;Enable mux 
                    INC      <VIA_port_b                  ;Disable mux 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    endm     
;...............................
MOVE_RIGHT_RIGHT_DOWN  macro  usedScale 
;                    std      <VIA_port_b                  ;Enable mux 
                    sta      <VIA_port_b                  ;Enable mux 
                    stb      <VIA_port_a                  ;Enable mux 
                    negb     
                    aslb     
                    INC      <VIA_port_b                  ;Disable mux 
                    STb      <VIA_port_a                  ;Send X to A/D 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    DELAY_CYCLES  5,usedScale 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    endm     
;...............................
MOVE_RIGHT_RIGHT_UP  macro   usedScale 
                    std      <VIA_port_b                  ;Enable mux 
                    aslb     
                    INC      <VIA_port_b                  ;Disable mux 
                    STb      <VIA_port_a                  ;Send X to A/D 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    DELAY_CYCLES  5,usedScale 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    endm     
;...............................
MOVE_LEFT_LEFT_UP   macro    usedScale 
;                    std      <VIA_port_b                  ;Enable mux 
; cranky needs split
                    sta      <VIA_port_b                  ;Enable mux 
                    stb      <VIA_port_a                  ;Enable mux 
                    negb     
                    aslb     
                    INC      <VIA_port_b                  ;Disable mux 
                    STb      <VIA_port_a                  ;Send X to A/D 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    DELAY_CYCLES  5,usedScale 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    endm     
;...............................
MOVE_LEFT_LEFT_DOWN  macro   usedScale 
                    std      <VIA_port_b                  ;Enable mux 
;                    sta      <VIA_port_b                  ;Enable mux 
;                    stb      <VIA_port_a                  ;Enable mux 
                    aslb     
                    INC      <VIA_port_b                  ;Disable mux 
                    STb      <VIA_port_a                  ;Send X to A/D 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    DELAY_CYCLES  5,usedScale 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    endm     
;...............................
MOVE_HALFLEFT_DOWN  macro    usedScale 
                    std      <VIA_port_b                  ;Enable mux 
                    asrb     
                    INC      <VIA_port_b                  ;Disable mux 
                    STb      <VIA_port_a                  ;Send X to A/D 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    endm     
;...............................
MOVE_HALFLEFT_UP    macro    usedScale 
                    std      <VIA_port_b                  ;Enable mux 
                    asrb     
                    negb     
                    INC      <VIA_port_b                  ;Disable mux 
                    STb      <VIA_port_a                  ;Send X to A/D 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    endm     
;...............................
MOVE_LEFT_HALFLEFT_DOWN  macro  usedScale 
                    std      <VIA_port_b                  ;Enable mux 
                    asrb     
                    INC      <VIA_port_b                  ;Disable mux 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    DELAY_CYCLES  4,usedScale 
                    sta      <VIA_port_a 
                    sta      <VIA_port_b                  ;Enable mux 
                    INC      <VIA_port_b                  ;Disable mux 
                    STb      <VIA_port_a                  ;Send X to A/D 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    endm     
;...............................
MOVE_LEFT_HALFLEFT_UP  macro  usedScale 
                    std      <VIA_port_b                  ;Enable mux 
                    negb     
                    INC      <VIA_port_b                  ;Disable mux 
                    STb      <VIA_port_a                  ;Send Y to A/D 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    asrb     
                    DELAY_CYCLES  4,usedScale 
                    sta      <VIA_port_a 
                    sta      <VIA_port_b                  ;Enable mux 
                    INC      <VIA_port_b                  ;Disable mux 
                    STb      <VIA_port_a                  ;Send X to A/D 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    endm     
;...............................
MOVE_SCOOP_RIGHT    macro    usedScale 
                    ldb      #-(PLAYER_SHOT_LENGTH/2) 
                    MOVE_RIGHT_RIGHT_DOWN  usedScale 
                    endm     
;...............................
MOVE_RESET_RIGHT    macro    usedScale 
                    ldb      #(PLAYER_SHOT_LENGTH/2) 
                    MOVE_LEFT_LEFT_UP  usedScale 
                    endm     
;...............................
MOVE_SCOOP_LEFT     macro    usedScale 
                    ldb      #-(PLAYER_SHOT_LENGTH/2) 
                    MOVE_LEFT_LEFT_DOWN  usedScale 
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; FOUR SHOTS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;...............................
DRAW_PLAYER_SHOT_ONLY_4_CONT  macro  usedScale 
; ten cycles between poke hi and next influencing poke
                    MOVE_HALF_LEFT  
; lda #usedScale;2
; sta <VIA_t1_cnt_lo;4
                    ldb      #-PLAYER_SHOT_LENGTH 
                    DELAY_CYCLES  3,usedScale 
                    DRAW_DOWN  
                    ldb      #PLAYER_SHOT_LENGTH 
                    DELAY_CYCLES  3,usedScale 
                    MOVE_LEFT_UP  
                    DELAY_CYCLES  3,usedScale 
                    ldb      #-PLAYER_SHOT_LENGTH 
                    DRAW_DOWN  
;first half of four bullets drawn, now go back
                    DELAY_CYCLES  3,usedScale 
                    ldb      #(PLAYER_SHOT_LENGTH/2) 
                    MOVE_RIGHT_RIGHT_UP  usedScale 
                    ldb      #-PLAYER_SHOT_LENGTH 
                    DELAY_CYCLES  3,usedScale 
                    DRAW_DOWN  
                    ldb      #PLAYER_SHOT_LENGTH 
                    DELAY_CYCLES  3,usedScale 
                    MOVE_RIGHT_UP  
                    ldb      #-PLAYER_SHOT_LENGTH 
                    DELAY_CYCLES  3,usedScale 
                    DRAW_DOWN  
                    endm     
;...............................
DRAW_PLAYER_SHOT_4_INNER_RETURN  macro  usedScale 
                    MOVE_LEFT_HALFLEFT_UP  usedScale 
                    endm     
DRAW_PLAYER_SHOT_4_INNER_RETURN_DELAY  macro  usedScale 
                    ldb      #PLAYER_SHOT_LENGTH 
                    DELAY_CYCLES  3,usedScale 
                    DRAW_PLAYER_SHOT_4_INNER_RETURN  usedScale 
                    endm     
;...............................
DRAW_PLAYER_SHOT_4_CONT  macro  usedScale 
                    DRAW_PLAYER_SHOT_ONLY_4_CONT  usedScale 
                    DRAW_PLAYER_SHOT_4_INNER_RETURN_DELAY  usedScale 
                    endm     
;...............................
DRAW_PLAYER_SHOT_4  macro    
                    ldd      #lo(-(PLAYER_SHOT_LENGTH/2)) + lo(SCALE_PLAYER_SHOT) *256 
                    sta      VIA_t1_cnt_lo 
                    MY_MOVE_TO_A_END  
                    clra     
                    DRAW_PLAYER_SHOT_4_CONT  SCALE_PLAYER_SHOT 
                    endm     
;...............................
DRAW_PLAYER_SCOOP_RIGHT_4  macro  
 if  BLINKING_SCOOPY_FIRE = 1 
                    lda      Vec_Loop_Count+1 
                    anda     #1 
                    lbeq     noRightDraw\? 
 endif  
                    clra     
                    MOVE_SCOOP_RIGHT  SCALE_PLAYER_SHOT 
                    ldb      #SCALE_SCOOPIE_SHOT 
                    stb      VIA_t1_cnt_lo 
                    ldb      #-(PLAYER_SHOT_LENGTH /2) 
                    DELAY_CYCLES  1,SCALE_SCOOPIE_SHOT 
                    DRAW_PLAYER_SHOT_4_CONT  SCALE_SCOOPIE_SHOT 
                    ldb      #SCALE_PLAYER_SHOT 
                    stb      VIA_t1_cnt_lo 
                    DELAY_CYCLES  1,SCALE_SCOOPIE_SHOT 
                    MOVE_RESET_RIGHT  SCALE_PLAYER_SHOT 
noRightDraw\? 
                    endm     
;...............................
DRAW_PLAYER_SCOOP_LEFT_4  macro  
 if  BLINKING_SCOOPY_FIRE = 1 
                    lda      Vec_Loop_Count+1 
                    anda     #1 
                    lbne     noLeftDraw\? 
 endif  
                    clra     
                    MOVE_SCOOP_LEFT  SCALE_PLAYER_SHOT 
                    ldb      #SCALE_SCOOPIE_SHOT 
                    stb      VIA_t1_cnt_lo 
                    ldb      #-(PLAYER_SHOT_LENGTH /2) 
                    DELAY_CYCLES  1,SCALE_SCOOPIE_SHOT 
                    DRAW_PLAYER_SHOT_ONLY_4_CONT  SCALE_SCOOPIE_SHOT 
;                    DRAW_PLAYER_SHOT_4_CONT  SCALE_SCOOPIE_SHOT 
noLeftDraw\? 
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; THREE SHOTS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;...............................
DRAW_PLAYER_SHOT_3_CONT  macro  usedScale 
; ten cycles between poke hi and next influencing poke
                    DRAW_DOWN  
; wait some cycles 
; nop 10
                    ldb      #PLAYER_SHOT_LENGTH 
                    DELAY_CYCLES  3,usedScale 
                    MOVE_LEFT_UP  
; wait some cycles 
; nop 10
                    ldb      #-PLAYER_SHOT_LENGTH 
                    DELAY_CYCLES  3,usedScale 
                    DRAW_DOWN  
; wait some cycles 
; nop 10
                    ldb      #(PLAYER_SHOT_LENGTH/2) 
                    DELAY_CYCLES  3,usedScale 
                    MOVE_RIGHT_RIGHT_UP  usedScale 
; wait some cycles 
; nop 10
                    ldb      #-PLAYER_SHOT_LENGTH 
                    DELAY_CYCLES  3,usedScale 
                    DRAW_DOWN  
; wait some cycles 
; nop 10
                    ldb      #PLAYER_SHOT_LENGTH 
                    DELAY_CYCLES  3,usedScale 
                    MOVE_LEFT_UP  
; doesn't matter
                    endm     
;...............................
DRAW_PLAYER_SHOT_3  macro    
;                    lda      #SCALE_PLAYER_SHOT 
;                    sta      VIA_t1_cnt_lo 
;                    lda      #-PLAYER_SHOT_LENGTH 
                    ldd      #lo(-PLAYER_SHOT_LENGTH) + lo(SCALE_PLAYER_SHOT) *256 
                    sta      VIA_t1_cnt_lo 
                    MY_MOVE_TO_A_END  
                    clra     
                    DRAW_PLAYER_SHOT_3_CONT  SCALE_PLAYER_SHOT 
                    endm     
;...............................
DRAW_PLAYER_SCOOP_RIGHT_3  macro  
                    clra     
                    MOVE_SCOOP_RIGHT  SCALE_PLAYER_SHOT 
                    ldb      #SCALE_SCOOPIE_SHOT 
                    stb      VIA_t1_cnt_lo 
                    ldb      #-PLAYER_SHOT_LENGTH 
                    DELAY_CYCLES  1,SCALE_SCOOPIE_SHOT 
                    DRAW_PLAYER_SHOT_3_CONT  SCALE_SCOOPIE_SHOT 
                    ldb      #SCALE_PLAYER_SHOT 
                    stb      VIA_t1_cnt_lo 
                    DELAY_CYCLES  1,SCALE_SCOOPIE_SHOT 
                    MOVE_RESET_RIGHT  SCALE_PLAYER_SHOT 
                    endm     
;...............................
DRAW_PLAYER_SCOOP_LEFT_3  macro  
                    clra     
                    MOVE_SCOOP_LEFT  SCALE_PLAYER_SHOT 
                    ldb      #SCALE_SCOOPIE_SHOT 
                    stb      VIA_t1_cnt_lo 
                    ldb      #-PLAYER_SHOT_LENGTH 
                    DELAY_CYCLES  1,SCALE_SCOOPIE_SHOT 
                    DRAW_PLAYER_SHOT_3_CONT  SCALE_SCOOPIE_SHOT 
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; TWO SHOTS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;...............................
DRAW_PLAYER_SHOT_2_CONT  macro  usedScale 
; ten cycles between poke hi and next influencing poke
                    MOVE_HALF_LEFT  
                    ldb      #-PLAYER_SHOT_LENGTH 
                    DELAY_CYCLES  3,usedScale 
                    DRAW_DOWN  
                    ldb      #PLAYER_SHOT_LENGTH 
                    DELAY_CYCLES  3,usedScale 
                    MOVE_RIGHT_UP  usedScale 
                    ldb      #-PLAYER_SHOT_LENGTH 
                    DELAY_CYCLES  3,usedScale 
                    DRAW_DOWN  
                    ldb      #PLAYER_SHOT_LENGTH 
                    DELAY_CYCLES  3,usedScale 
                    MOVE_HALFLEFT_UP  usedScale 
                    endm     
;...............................
DRAW_PLAYER_SHOT_2  macro    
;                    lda      #SCALE_PLAYER_SHOT 
;                    sta      VIA_t1_cnt_lo 
;                    lda      #-(PLAYER_SHOT_LENGTH /2) 
                    ldd      #lo(-(PLAYER_SHOT_LENGTH/2)) + lo(SCALE_PLAYER_SHOT) *256 
                    sta      VIA_t1_cnt_lo 
                    MY_MOVE_TO_A_END  
                    clra     
                    DRAW_PLAYER_SHOT_2_CONT  SCALE_PLAYER_SHOT 
                    endm     
;...............................
DRAW_PLAYER_SCOOP_RIGHT_2  macro  
                    clra     
                    MOVE_SCOOP_RIGHT  SCALE_PLAYER_SHOT 
                    ldb      #SCALE_SCOOPIE_SHOT 
                    stb      VIA_t1_cnt_lo 
                    ldb      #-(PLAYER_SHOT_LENGTH /2) 
                    DELAY_CYCLES  1,SCALE_SCOOPIE_SHOT 
                    DRAW_PLAYER_SHOT_2_CONT  SCALE_SCOOPIE_SHOT 
                    ldb      #SCALE_PLAYER_SHOT 
                    stb      VIA_t1_cnt_lo 
                    DELAY_CYCLES  1,SCALE_SCOOPIE_SHOT 
                    MOVE_RESET_RIGHT  SCALE_PLAYER_SHOT 
                    endm     
;...............................
DRAW_PLAYER_SCOOP_LEFT_2  macro  
                    clra     
                    MOVE_SCOOP_LEFT  SCALE_PLAYER_SHOT 
                    ldb      #SCALE_SCOOPIE_SHOT 
                    stb      VIA_t1_cnt_lo 
                    ldb      #-(PLAYER_SHOT_LENGTH /2) 
                    DELAY_CYCLES  1,SCALE_SCOOPIE_SHOT 
                    DRAW_PLAYER_SHOT_2_CONT  SCALE_SCOOPIE_SHOT 
                    endm     
;...............................
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ONE SHOTS   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;...............................
DRAW_PLAYER_SHOT_1_CONT  macro  usedScale 
; ten cycles between poke hi and next influencing poke
                    DRAW_DOWN  
                    ldb      #PLAYER_SHOT_LENGTH 
                    DELAY_CYCLES  3,usedScale 
                    MOVE_UP  
; doesn't matter
                    endm     
;...............................
DRAW_PLAYER_SHOT_1  macro    
;                    lda      #SCALE_PLAYER_SHOT
;                    sta      VIA_t1_cnt_lo 
;                    lda      #-PLAYER_SHOT_LENGTH 
                    ldd      #lo(-PLAYER_SHOT_LENGTH) + lo(SCALE_PLAYER_SHOT) *256 
                    sta      VIA_t1_cnt_lo 
                    MY_MOVE_TO_A_END                      ; corrected 
                    clra     
                    DRAW_PLAYER_SHOT_1_CONT  SCALE_PLAYER_SHOT 
                    endm     
;...............................
DRAW_PLAYER_SCOOP_RIGHT_1  macro  
                    clra     
                    MOVE_SCOOP_RIGHT  SCALE_PLAYER_SHOT 
                    ldb      #SCALE_SCOOPIE_SHOT 
                    stb      VIA_t1_cnt_lo 
                    ldb      #-PLAYER_SHOT_LENGTH 
                    DELAY_CYCLES  1,SCALE_SCOOPIE_SHOT 
                    DRAW_PLAYER_SHOT_1_CONT  SCALE_SCOOPIE_SHOT 
                    ldb      #SCALE_PLAYER_SHOT 
                    stb      VIA_t1_cnt_lo 
                    DELAY_CYCLES  1,SCALE_SCOOPIE_SHOT 
                    MOVE_RESET_RIGHT  SCALE_PLAYER_SHOT 
                    endm     
;...............................
DRAW_PLAYER_SCOOP_LEFT_1  macro  
                    clra     
                    MOVE_SCOOP_LEFT  SCALE_PLAYER_SHOT 
                    ldb      #SCALE_SCOOPIE_SHOT 
                    stb      VIA_t1_cnt_lo 
                    ldb      #-PLAYER_SHOT_LENGTH 
                    DELAY_CYCLES  1,SCALE_SCOOPIE_SHOT 
                    DRAW_PLAYER_SHOT_1_CONT  SCALE_SCOOPIE_SHOT 
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ONE SHOTS   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DRAW_PLAYER_SHOT_0  macro    
                    ldb      #SCALE_PLAYER_SHOT 
                    stb      VIA_t1_cnt_lo 
                    MY_MOVE_TO_A_END  
                    clra     
                    endm     
;...............................
DRAW_DOWN_HALF_LEFT  macro   usedScale 
                    std      <VIA_port_b                  ;Enable mux 
                    asrb     
                    INC      <VIA_port_b                  ;Disable mux 
                    STb      <VIA_port_a                  ;Send X to A/D 
                    aslb     
                    negb     
                    dec      <VIA_shift_reg               ;Store pattern in shift register 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    endm     
;...............................
DRAW_UP_HALF_LEFT   macro    usedScale 
                    std      <VIA_port_b                  ;Enable mux 
                    negb     
                    asrb     
                    INC      <VIA_port_b                  ;Disable mux 
                    STb      <VIA_port_a                  ;Send X to A/D 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    endm     
;...............................
DRAW_RIGHT          macro    usedScale 
                    STa      <VIA_port_a                  ;Send Y to A/D 
                    sta      <VIA_port_b                  ;Enable mux 
                    INC      <VIA_port_b                  ;Disable mux 
                    STb      <VIA_port_a                  ;Send X to A/D 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    endm     
;...............................
DRAW_PLAYER_SHOT_5  macro    
                    ldd      #lo(-(PLAYER_SHOT_LENGTH_5)) + lo(SCALE_PLAYER_SHOT) *256 
                    sta      VIA_t1_cnt_lo 
                    clra     
                    sta      <VIA_shift_reg               ;ensure 0 so a dec works ok 
                    MY_MOVE_TO_A_END  
                    clra     
; down left/2
                    std      <VIA_port_b                  ;Enable mux 
                    asrb     
                    INC      <VIA_port_b                  ;Disable mux 
                    STb      <VIA_port_a                  ;Send X to A/D 
                    ldb      #-1 
                    stb      <VIA_shift_reg 
                    sta      <VIA_t1_cnt_hi               ;4 Clear T1H 
                    ldb      #PLAYER_SHOT_LENGTH_5 
                    brn      0 
; RIGHT 
                    STa      <VIA_port_a                  ;4 Send Y to A/D 
                    sta      <VIA_port_b                  ;4 Enable mux 
                    INC      <VIA_port_b                  ;6 Disable mux 
                    STb      <VIA_port_a                  ;4 Send X to A/D 
                    sta      <VIA_t1_cnt_hi               ;4 Clear T1H 
                    brn      0 
                    brn      0 
; up left/2
                    std      <VIA_port_b                  ;4 Enable mux 
                    negb                                  ;2 
                    asrb                                  ;2 
                    INC      <VIA_port_b                  ;6 Disable mux 
                    STb      <VIA_port_a                  ;4 Send X to A/D 
                    ldb      #%11111110                   ;2 
                    sta      <VIA_t1_cnt_hi               ;4 Clear T1H 
                    nop                                   ;2 
                    brn      0 
                    stb      <VIA_shift_reg               ;4 Store pattern in shift register 
                    endm     
;...............................
DRAW_PLAYER_SCOOP_RIGHT_5  macro  
                    clra     
                    MOVE_SCOOP_RIGHT  SCALE_PLAYER_SHOT 
                    ldb      #SCALE_SCOOPIE_SHOT 
                    stb      VIA_t1_cnt_lo 
                    ldb      #-(PLAYER_SHOT_LENGTH_5) 
                    sta      <VIA_shift_reg 
;..
; down left/2
                    std      <VIA_port_b                  ;Enable mux 
                    asrb     
                    INC      <VIA_port_b                  ;Disable mux 
                    STb      <VIA_port_a                  ;Send X to A/D 
                    ldb      #-1 
                    stb      <VIA_shift_reg 
                    sta      <VIA_t1_cnt_hi               ;4 Clear T1H 
                    ldb      #PLAYER_SHOT_LENGTH_5 
; RIGHT 
                    nop      
                    STa      <VIA_port_a                  ;4 Send Y to A/D 
                    sta      <VIA_port_b                  ;4 Enable mux 
                    INC      <VIA_port_b                  ;6 Disable mux 
                    STb      <VIA_port_a                  ;4 Send X to A/D 
                    sta      <VIA_t1_cnt_hi               ;4 Clear T1H 
; up left/2
                    nop      
                    std      <VIA_port_b                  ;4 Enable mux 
                    negb                                  ;2 
                    asrb                                  ;2 
                    INC      <VIA_port_b                  ;6 Disable mux 
                    STb      <VIA_port_a                  ;4 Send X to A/D 
                    ldb      #%11111110                   ;2 
                    sta      <VIA_t1_cnt_hi               ;4 Clear T1H 
                    nop                                   ;2 
                    stb      <VIA_shift_reg               ;4 Store pattern in shift register 
                    ldb      #SCALE_PLAYER_SHOT 
                    stb      VIA_t1_cnt_lo 
                    DELAY_CYCLES  1,SCALE_SCOOPIE_SHOT 
                    MOVE_RESET_RIGHT  SCALE_PLAYER_SHOT 
                    endm     
DRAW_PLAYER_SCOOP_LEFT_5  macro  
                    clra     
                    MOVE_SCOOP_LEFT  SCALE_PLAYER_SHOT 
                    ldb      #SCALE_SCOOPIE_SHOT 
                    stb      VIA_t1_cnt_lo 
                    ldb      #-(PLAYER_SHOT_LENGTH_5) 
                    sta      <VIA_shift_reg 
;..
; down left/2
                    std      <VIA_port_b                  ;Enable mux 
                    asrb     
                    INC      <VIA_port_b                  ;Disable mux 
                    STb      <VIA_port_a                  ;Send X to A/D 
                    ldb      #-1 
                    stb      <VIA_shift_reg 
                    sta      <VIA_t1_cnt_hi               ;4 Clear T1H 
                    ldb      #PLAYER_SHOT_LENGTH_5 
                    nop      
; RIGHT 
                    STa      <VIA_port_a                  ;4 Send Y to A/D 
                    sta      <VIA_port_b                  ;4 Enable mux 
                    INC      <VIA_port_b                  ;6 Disable mux 
                    STb      <VIA_port_a                  ;4 Send X to A/D 
                    sta      <VIA_t1_cnt_hi               ;4 Clear T1H 
; up left/2
                    nop      
                    std      <VIA_port_b                  ;4 Enable mux 
                    negb                                  ;2 
                    asrb                                  ;2 
                    INC      <VIA_port_b                  ;6 Disable mux 
                    STb      <VIA_port_a                  ;4 Send X to A/D 
                    ldb      #%11111110                   ;2 
                    sta      <VIA_t1_cnt_hi               ;4 Clear T1H 
                    nop                                   ;2 
                    stb      <VIA_shift_reg               ;4 Store pattern in shift register 
;..
                    endm     
;...............................
DRAW_PLAYER_SCOOP_RIGHT_6  macro  
                    lda      #SCALE_PLAYER_SHOT 
                    sta      VIA_t1_cnt_lo 
                    MY_MOVE_TO_A_END  
                    clra     
                    MOVE_SCOOP_RIGHT  SCALE_PLAYER_SHOT 
                    lda      gameScale 
                    deca     
                    adda     gameScale                    ; double -1 - so gamescale $80 is not "fucked" 
; subb #10
                    cmpa     #$80 
                    bhi      t1SeemsOk_sr 
                    lda      #$ff 
t1SeemsOk_sr 
                    sta      VIA_t1_cnt_lo 
                    lda      LAZER_WOBBLE+u_offset1,s 
                    ldb      laserEnemyPointerRight 
                    beq      fullLaser\? 
                    ldb      laserLowestYRight 
                    addb     #$80 
                    lsrb     
                    subb     #10                          ; otherwise laser always above enemey 
                    bra      contLaser\? 

fullLaser\? 
                    ldb      #$7f 
contLaser\? 
; laser go on
                    STb      <VIA_port_a                  ;Send Y to A/D 
                    clr      <VIA_port_b                  ;Enable mux 
                    INC      <VIA_port_b                  ;Disable mux 
                    STa      <VIA_port_a                  ;Send X to A/D 
                    ldb      #-1 
                    clr      <VIA_t1_cnt_hi               ;Clear T1H 
                    stb      <VIA_shift_reg               ;Store pattern in shift register 
                    LDa      #$40                         ; 
                    clrb     
waitNotDoneLazer1\? 
                    BITa     <VIA_int_flags               ; 
                    beq      waitNotDoneLazer1\? 
;waitDoneLazer1\? 
                    stb      <VIA_shift_reg               ;Store pattern in shift register 
                    endm     
;...............................
DRAW_PLAYER_SCOOP_LEFT_6  macro  
                    lda      #SCALE_PLAYER_SHOT 
                    sta      VIA_t1_cnt_lo 
                    MY_MOVE_TO_A_END  
                    clra     
                    MOVE_SCOOP_LEFT  SCALE_PLAYER_SHOT 
                    lda      gameScale 
                    deca     
                    adda     gameScale 
                    cmpa     #$80 
                    bhi      t1SeemsOk_sl 
                    lda      #$ff 
t1SeemsOk_sl 
; subb #10
                    sta      VIA_t1_cnt_lo 
                    lda      LAZER_WOBBLE+u_offset1,s 
                    ldb      laserEnemyPointerLeft 
                    beq      fullLaser\? 
                    ldb      laserLowestYLeft 
                    addb     #$80 
                    lsrb     
                    subb     #10                          ; otherwise laser always above enemey 
                    bra      contLaser\? 

fullLaser\? 
                    ldb      #$7f 
contLaser\? 
; laser go on
                    STb      <VIA_port_a                  ;Send Y to A/D 
                    clr      <VIA_port_b                  ;Enable mux 
                    INC      <VIA_port_b                  ;Disable mux 
                    STa      <VIA_port_a                  ;Send X to A/D 
                    ldb      #-1 
                    clr      <VIA_t1_cnt_hi               ;Clear T1H 
                    stb      <VIA_shift_reg               ;Store pattern in shift register 
                    LDa      #$40                         ; 
                    clrb     
waitNotDoneLazer1\? 
                    BITa     <VIA_int_flags               ; 
                    beq      waitNotDoneLazer1\? 
;waitDoneLazer1\? 
                    stb      <VIA_shift_reg               ;Store pattern in shift register 
                    endm     
 endif  
