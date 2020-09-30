;Bank 2
; do special "optimized" macros for 
; shot 4
; with "special" fixed register values!
;  I<----*
;  I   1   1   1
;  I  /I  /I  /I
;  I / I / I / I
;  V   V   V   V from here to "*"
;
; DRAW 4 times DOWN
; MOVE 3 times UP/RIGHT
; MOVE 1 time LEFT *3/2
; MOVE 1 time UP/LEFT * 3/2
; optimize shots, so that
; DOWN and UP/RIGHT are optimally drawn
; for DOWN Y poke to VIA_B = 0 *256 + -_4_PLAYER_SHOT_LENGTH
; for DOWN X poke to VIA_B = 1 *256 + 0
; for UP Y poke to VIA_B =    0 *256 + _4_PLAYER_SHOT_LENGTH
; for RIGHT X poke to VIA_B = 1 *256 + _4_PLAYER_SHOT_LENGTH
; first try below does 1300 cycles
; a few can probably more squeezed out!
;X = $0100, than ;
;
;INC      <VIA_port_b                  ;Disable mux 
;STA      <VIA_port_a                  ;Send X to A/D 
;6+6
;can be reduced to 
;5
; stx <VIA_port_b 
; all shots are drawn from the shot y,x pos
; as "middle upper" point (drawn downwards)
_4_SCALE_PLAYER_SHOT  =      10 
_4_SCALE_SCOOPIE_SHOT  =     6 
_4_PLAYER_SHOT_ONE_THIRD  =  35                           ; 42 cranky 
_4_PLAYER_SHOT_LENGTH  =     (_4_PLAYER_SHOT_ONE_THIRD *2) 
_4_PLAYER_SHOT_LENGTH_32  =  (_4_PLAYER_SHOT_ONE_THIRD *3) 
; for all Macros
; register A always must contain 0 on entry
; register B must be set for the correct Y movement!
; 
;...............................
; 10 scale is base
DELAY_CYCLES        macro    delay,usedScale 
 if  (delay- (5-(usedScale/2)))>0 
                    nop      delay- (5-(usedScale/2)) 
 endif  
                    endm     
;y = 2x ldd #1*256+lo(-_4_PLAYER_SHOT_LENGTH_32)
;u = 3x ldd #1*256+lo(_4_PLAYER_SHOT_LENGTH)
;x = 4x ldx #1*256+lo(_4_PLAYER_SHOT_LENGTH)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; FOUR SHOTS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
_4_MOVE_LEFT32      macro    usedScale 
;                    std      <VIA_port_b 
; only for very cranky!
                    sta      <VIA_port_b 
                    stb      <VIA_port_a 
                    nop      
;                    std      <VIA_port_b 
                    sty      <VIA_port_b 
                    sta      <VIA_t1_cnt_hi 
                    endm     
;...............................
_4_MOVE_UP_LEFT32   macro    usedScale 
                    std      <VIA_port_b 
                    sty      <VIA_port_b 
                    sta      <VIA_t1_cnt_hi 
                    endm     
;...............................
_4_MOVE_DOWN_LEFT32  macro   usedScale 
                    _4_MOVE_UP_LEFT32  
                    endm     
;...............................
_4_MOVE_DOWN_RIGHT32  macro  usedScale 
                    std      <VIA_port_b 
                    ldd      #1*256+lo(_4_PLAYER_SHOT_LENGTH_32) 
                    std      <VIA_port_b 
                    clra     
                    sta      <VIA_t1_cnt_hi 
                    endm     
;...............................
_4_MOVE_UP_RIGHT    macro    usedScale 
                    std      <VIA_port_b 
                    stu      <VIA_port_b 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    endm     
;...............................
_4_DRAW_DOWN        macro    usedScale 
                    std      <VIA_port_b                  ;Enable mux 
                    ldb      #%00111110 
                    stx      <VIA_port_b                  ;Disable mux 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    stb      <VIA_shift_reg               ;Store pattern in shift register 
                    endm     
;...............................
_4_MOVE_SCOOP_RIGHT  macro   usedScale 
                    ldb      #-(_4_PLAYER_SHOT_LENGTH/2) 
                    _4_MOVE_DOWN_RIGHT32  
                    WAIT6    
                    sta      <VIA_t1_cnt_hi 
                    endm     
;...............................
_4_MOVE_RESET_RIGHT  macro   usedScale 
                    ldb      #(_4_PLAYER_SHOT_LENGTH/2) 
                    sta      <VIA_port_b 
                    stb      <VIA_port_a 
                    sty      <VIA_port_b 
                    sta      <VIA_t1_cnt_hi 
                    WAIT6    
                    sta      <VIA_t1_cnt_hi 
                    endm     
;...............................
_4_MOVE_SCOOP_LEFT  macro    usedScale 
                    ldb      #-(_4_PLAYER_SHOT_LENGTH/2) 
                    std      <VIA_port_b 
                    ldb      #_4_SCALE_SCOOPIE_SHOT       ; moved from "main" to delay between port bpokes 
                    sty      <VIA_port_b 
                    sta      <VIA_t1_cnt_hi 
                    WAIT6    
                    sta      <VIA_t1_cnt_hi 
                    endm     
;...............................
_4_DRAW_PLAYER_SHOT_ONLY_4_CONT  macro  usedScale 
; ten cycles between poke hi and next influencing poke
                    _4_MOVE_LEFT32  
                    DELAY_CYCLES  3,usedScale 
                    ldb      #-_4_PLAYER_SHOT_LENGTH 
                    _4_DRAW_DOWN  
                    DELAY_CYCLES  3,usedScale 
                    ldb      #_4_PLAYER_SHOT_LENGTH 
                    _4_MOVE_UP_RIGHT  
                    DELAY_CYCLES  3,usedScale 
                    ldb      #-_4_PLAYER_SHOT_LENGTH 
                    _4_DRAW_DOWN  
                    DELAY_CYCLES  3,usedScale 
                    ldb      #_4_PLAYER_SHOT_LENGTH 
                    _4_MOVE_UP_RIGHT  
                    DELAY_CYCLES  3,usedScale 
                    ldb      #-_4_PLAYER_SHOT_LENGTH 
                    _4_DRAW_DOWN  
                    DELAY_CYCLES  3,usedScale 
                    ldb      #_4_PLAYER_SHOT_LENGTH 
                    _4_MOVE_UP_RIGHT  
                    DELAY_CYCLES  3,usedScale 
                    ldb      #-_4_PLAYER_SHOT_LENGTH 
                    _4_DRAW_DOWN  
                    endm     
;...............................
_4_DRAW_PLAYER_SHOT_4_INNER_RETURN  macro  usedScale 
                    ldb      #_4_PLAYER_SHOT_LENGTH 
                    _4_MOVE_UP_LEFT32  
                    endm     
;...............................
_4_DRAW_PLAYER_SHOT_4_INNER_RETURN_DELAY  macro  usedScale 
                    DELAY_CYCLES  3,usedScale 
                    ldb      #_4_PLAYER_SHOT_LENGTH 
                    _4_MOVE_UP_LEFT32  
                    endm     
;...............................
_4_DRAW_PLAYER_SHOT_4_CONT  macro  usedScale 
; position neutral-
; if for all shots equal
; than this can be kept in player shot
; 18 cycles saved
                    ldx      #1*256+0                     ;lo(-_4_PLAYER_SHOT_LENGTH) 
                    ldu      #1*256+lo(_4_PLAYER_SHOT_LENGTH) 
                    ldy      #1*256+lo(-_4_PLAYER_SHOT_LENGTH_32) 
                    _4_DRAW_PLAYER_SHOT_ONLY_4_CONT  usedScale 
                    _4_DRAW_PLAYER_SHOT_4_INNER_RETURN_DELAY  usedScale 
                    endm     
;...............................
_4_DRAW_PLAYER_SHOT_4  macro  
; a = 0;
; b = next y movement
; -> d can allways first be stored to VIA_B
                    ldd      #lo(_4_SCALE_PLAYER_SHOT) 
                    stb      VIA_t1_cnt_lo 
                    MY_MOVE_TO_B_END  
; a starts with 0, since first y move is o (only LEFT)
                    clrb     
                    _4_DRAW_PLAYER_SHOT_4_CONT  _4_SCALE_PLAYER_SHOT 
                    endm     
;...............................
_4_DRAW_PLAYER_SCOOP_RIGHT_4  macro  
; cranky reset A
                    ldx      #1*256+0                     ;lo(-_4_PLAYER_SHOT_LENGTH) 
                    ldu      #1*256+lo(_4_PLAYER_SHOT_LENGTH) 
                    ldy      #1*256+lo(-_4_PLAYER_SHOT_LENGTH_32) 
 if  BLINKING_SCOOPY_FIRE = 1 
                    lda      Vec_Loop_Count+1 
                    anda     #1 
                    lbeq     noRightDraw\? 
 endif  
                    clra     
; sta <VIA_port_b
; nop 3
                    _4_MOVE_SCOOP_RIGHT  _4_SCALE_PLAYER_SHOT 
                    ldb      #_4_SCALE_SCOOPIE_SHOT 
                    stb      <VIA_t1_cnt_lo 
                    DELAY_CYCLES  1,_4_SCALE_PLAYER_SHOT  ;** _4_SCALE_SCOOPIE_SHOT 
                    clrb     
                    _4_DRAW_PLAYER_SHOT_4_CONT  _4_SCALE_SCOOPIE_SHOT 
                    ldb      #_4_SCALE_PLAYER_SHOT 
                    stb      VIA_t1_cnt_lo 
                    DELAY_CYCLES  1,_4_SCALE_SCOOPIE_SHOT 
                    _4_MOVE_RESET_RIGHT  _4_SCALE_PLAYER_SHOT 
noRightDraw\? 
                    endm     
;...............................
_4_DRAW_PLAYER_SCOOP_LEFT_4  macro  
                    ldx      #1*256+0                     ;lo(-_4_PLAYER_SHOT_LENGTH) 
                    ldu      #1*256+lo(_4_PLAYER_SHOT_LENGTH) 
                    ldy      #1*256+lo(-_4_PLAYER_SHOT_LENGTH_32) 
 if  BLINKING_SCOOPY_FIRE = 1 
                    lda      Vec_Loop_Count+1 
                    anda     #1 
                    lbne     noLeftDraw\? 
 endif  
                    clra     
; sta <VIA_port_b
; nop 3
                    _4_MOVE_SCOOP_LEFT  _4_SCALE_PLAYER_SHOT 
                    stb      <VIA_t1_cnt_lo 
                    DELAY_CYCLES  1,_4_SCALE_PLAYER_SHOT  ;** _4_SCALE_SCOOPIE_SHOT 
                    clrb     
                    _4_DRAW_PLAYER_SHOT_ONLY_4_CONT  _4_SCALE_SCOOPIE_SHOT 
noLeftDraw\? 
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
