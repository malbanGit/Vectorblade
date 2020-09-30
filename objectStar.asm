; bank 3
STAR_OR_DEFINED     =        1 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; new list object to U
; leaves with flags set to result
; (positive = not successfull) ROM
; negative = successfull RAM
; destroys d, u 
newStarObject                                             ;#isfunction  
                    ldu      starlist_empty_head 
                    cmpu     #OBJECT_LIST_COMPARE_ADDRESS 
                    bls      cs_done_star 
                                                          ; set the new empty head 
                    ldd      NEXT_STAR_OBJECT,u           ; the next in out empty list will be the new 
                    std      starlist_empty_head          ; head of our empty list 
                                                          ; load last of current object list 
; the old head is always our next
                    ldd      starlist_objects_head 
                    std      NEXT_STAR_OBJECT,u 
; newobject is always head
                    stu      starlist_objects_head 
                    inc      starCount                    ; and remember that we created a new object 
cs_done_star 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
spawnStar                                                 ;#isfunction  
                    bsr      newStarObject                ; "create" (or rather get) new object 
                    leax     ,u                           ; pointer to new object now in X also 
                    cmpu     #OBJECT_LIST_COMPARE_ADDRESS 
                    bls      spawnStar_end 
                                                          ; bpl spawnBonus_end ; if positve - there is no object left, jump out 
; copy and initialze new enemy
                    ldd      #simpleStarBehaviour 
                    std      BEHAVIOUR,x 
                    RANDOM_A  
                    sta      Y1_POS,x 
                    RANDOM_A  
                    sta      Y2_POS,x 
                    RANDOM_A  
                    sta      Y3_POS,x 
                    RANDOM_A  
                    sta      Y4_POS,x 
                    RANDOM_A  
                    sta      X1_POS,x 
                    anda     #TWINKLE_AND 
 if  STAR_OR_DEFINED = 1 
                    ora      #TWINKLE_OR 
 endif  
                    sta      TWINKLE , x 
                    RANDOM_A  
                    sta      X2_POS,x 
                    RANDOM_A  
                    sta      X3_POS,x 
                    RANDOM_A  
                    sta      X4_POS,x 
                    tst      doWarpFailure 
                    bne      warpStars 
spawnStar_end 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
warpStars 
                    bpl      warpStars2 
                    ldd      #simpleStarBehaviourHS 
                    std      BEHAVIOUR,x 
                    RANDOM_A  
                    anda     #%01111111 
                    sta      RADIUS ,x 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
warpStars2 
                    ldd      #simpleStarBehaviour2 
                    std      BEHAVIOUR,x 
                    RANDOM_A2  
                    anda     #%01111111 
                    ora      #8 
                    sta      TWINKLE , x 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
STAR_SHIFT          =        %01100000                    ; $e0 
TWINKLE_AND         =        %00111111 
TWINKLE_OR          =        %00001111                    ; lowest twinkle brightness 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
simpleStarBehaviour                                       ;#isfunction  
; 1 ;;;
                    MY_MOVE_TO_D_START  
                    lda      in_moveFlag 
                    lbeq     firstStars 
                    dec      Y1_POS+u_offset1,s 
                    bvc      notBottom1 
                    RANDOM_A  
                    sta      X1_POS+u_offset1,s 
                    anda     #TWINKLE_AND 
 if  STAR_OR_DEFINED = 1 
                    ora      #TWINKLE_OR 
 endif  
                    sta      TWINKLE +u_offset1,s 
notBottom1 
 if  ENABLE_STAR_TACSCAN = 1 
                    lda      tacScan 
                    adda     X1_POS+u_offset1,s 
                    sta      X1_POS+u_offset1,s 
 endif  
                    lda      TWINKLE+u_offset1,s 
                    MY_MOVE_TO_B_END  
                    _INTENSITY_A  
                    lda      #STAR_SHIFT 
                    sta      <VIA_shift_reg 
                    _ZERO_VECTOR_BEAM  
                    ldd      #0 
                    std      <VIA_port_b 
; 2 ;;;
                    ldd      Y2_POS+u_offset1,s 
                    MY_MOVE_TO_D_START  
                    dec      Y2_POS+u_offset1,s 
                    bvc      notBottom2 
                    RANDOM_A  
                    sta      X2_POS+u_offset1,s 
                    anda     #TWINKLE_AND 
 if  STAR_OR_DEFINED = 1 
                    ora      #TWINKLE_OR 
 endif  
                    sta      TWINKLE +u_offset1,s 
notBottom2 
 if  ENABLE_STAR_TACSCAN = 1 
                    lda      tacScan 
                    adda     X2_POS+u_offset1,s 
                    sta      X2_POS+u_offset1,s 
 endif  
                    lda      #STAR_SHIFT 
                    MY_MOVE_TO_B_END  
                    sta      <VIA_shift_reg 
                    _ZERO_VECTOR_BEAM  
                    ldd      #0 
                    std      <VIA_port_b 
; 3 ;;;
                    ldd      Y3_POS+u_offset1,s 
                    MY_MOVE_TO_D_START  
                    dec      Y3_POS+u_offset1,s 
                    bvc      notBottom3 
                    RANDOM_A  
                    sta      X3_POS+u_offset1,s 
                    anda     #TWINKLE_AND 
 if  STAR_OR_DEFINED = 1 
                    ora      #TWINKLE_OR 
 endif  
                    sta      TWINKLE +u_offset1,s 
notBottom3 
 if  ENABLE_STAR_TACSCAN = 1 
                    lda      tacScan 
                    adda     X3_POS+u_offset1,s 
                    sta      X3_POS+u_offset1,s 
 endif  
                    lda      #STAR_SHIFT 
                    MY_MOVE_TO_B_END  
                    sta      <VIA_shift_reg 
                    _ZERO_VECTOR_BEAM  
                    ldd      #0 
                    std      <VIA_port_b 
; 4 ;;;
                    ldd      Y4_POS+u_offset1,s 
                    MY_MOVE_TO_D_START  
                    dec      Y4_POS+u_offset1,s 
                    bvc      notBottom4 
                    RANDOM_A  
                    sta      X4_POS+u_offset1,s 
                    anda     #TWINKLE_AND 
 if  STAR_OR_DEFINED = 1 
                    ora      #TWINKLE_OR 
 endif  
                    sta      TWINKLE +u_offset1,s 
notBottom4 
 if  ENABLE_STAR_TACSCAN = 1 
                    lda      tacScan 
                    adda     X4_POS+u_offset1,s 
                    sta      X4_POS+u_offset1,s 
 endif  
                    lda      #STAR_SHIFT 
                    lds      NEXT_STAR_OBJECT+u_offset1,s ; preload next user stack 
                    MY_MOVE_TO_B_END  
                    sta      <VIA_shift_reg 
; end 
; clean up
                    LDa      #$CC 
                    STA      VIA_cntl                     ;/BLANK low and /ZERO low 
                    ldd      #0 
                    std      <VIA_port_b 
                    puls     d,pc                         ; (D = y,x, pc = next object) 
; RNG must be first star!
; 1 ;;;
firstStars 
                    inc      in_moveFlag 
                    PLAYER_MOVEMENT_MOVE_BLOCK  
                    dec      Y1_POS+u_offset1,s 
                    bvc      notBottom1_1 
                    RANDOM_A  
                    sta      X1_POS+u_offset1,s 
                    anda     #TWINKLE_AND 
 if  STAR_OR_DEFINED = 1 
                    ora      #TWINKLE_OR 
 endif  
                    sta      TWINKLE +u_offset1,s 
notBottom1_1 
 if  ENABLE_STAR_TACSCAN = 1 
                    lda      tacScan 
                    adda     X1_POS+u_offset1,s 
                    sta      X1_POS+u_offset1,s 
 endif  
                    lda      TWINKLE+u_offset1,s 
                    MY_MOVE_TO_B_END  
                    _INTENSITY_A  
                    lda      #STAR_SHIFT 
                    sta      <VIA_shift_reg 
                    _ZERO_VECTOR_BEAM  
                    ldd      #0 
                    std      <VIA_port_b 
; 2 ;;;
                    ldd      Y2_POS+u_offset1,s 
                    MY_MOVE_TO_D_START  
                    WAITING_WOBBLE_CHANGES_MOVE_BLOCK  
                    dec      Y2_POS+u_offset1,s 
                    bvc      notBottom2_1 
                    RANDOM_A  
                    sta      X2_POS+u_offset1,s 
                    anda     #TWINKLE_AND 
 if  STAR_OR_DEFINED = 1 
                    ora      #TWINKLE_OR 
 endif  
                    sta      TWINKLE +u_offset1,s 
notBottom2_1 
 if  ENABLE_STAR_TACSCAN = 1 
                    lda      tacScan 
                    adda     X2_POS+u_offset1,s 
                    sta      X2_POS+u_offset1,s 
 endif  
                    lda      #STAR_SHIFT 
                    MY_MOVE_TO_B_END  
                    sta      <VIA_shift_reg 
                    _ZERO_VECTOR_BEAM  
                    ldd      #0 
                    std      <VIA_port_b 
; 3 ;;;
                    ldd      Y3_POS+u_offset1,s 
                    MY_MOVE_TO_D_START  
                    INITIALZE_SHOT_TEST_MOVE_BLOCK_1  
                    dec      Y3_POS+u_offset1,s 
                    bvc      notBottom3_1 
                    RANDOM_A  
                    sta      X3_POS+u_offset1,s 
                    anda     #TWINKLE_AND 
 if  STAR_OR_DEFINED = 1 
                    ora      #TWINKLE_OR 
 endif  
                    sta      TWINKLE +u_offset1,s 
notBottom3_1 
 if  ENABLE_STAR_TACSCAN = 1 
                    lda      tacScan 
                    adda     X3_POS+u_offset1,s 
                    sta      X3_POS+u_offset1,s 
 endif  
                    lda      #STAR_SHIFT 
                    MY_MOVE_TO_B_END  
                    sta      <VIA_shift_reg 
                    _ZERO_VECTOR_BEAM  
                    ldd      #0 
                    std      <VIA_port_b 
; 4 ;;;
                    ldd      Y4_POS+u_offset1,s 
                    MY_MOVE_TO_D_START  
                    INITIALZE_SHOT_TEST_MOVE_BLOCK_2  
                    dec      Y4_POS+u_offset1,s 
                    bvc      notBottom4_1 
                    RANDOM_A  
                    sta      X4_POS+u_offset1,s 
                    anda     #TWINKLE_AND 
 if  STAR_OR_DEFINED = 1 
                    ora      #TWINKLE_OR 
 endif  
                    sta      TWINKLE +u_offset1,s 
notBottom4_1 
 if  ENABLE_STAR_TACSCAN = 1 
                    lda      tacScan 
                    adda     X4_POS+u_offset1,s 
                    sta      X4_POS+u_offset1,s 
 endif  
                    lda      #STAR_SHIFT 
                    lds      NEXT_STAR_OBJECT+u_offset1,s ; preload next user stack 
                    MY_MOVE_TO_B_END  
                    sta      <VIA_shift_reg 
; end 
; clean up
                    LDa      #$CC 
                    STA      VIA_cntl                     ;/BLANK low and /ZERO low 
                    ldd      #0 
                    std      <VIA_port_b 
                    puls     d,pc                         ; (D = y,x, pc = next object) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
adjustStars 
; adjust number of stars according to 
; current time "left" in round
; min = 1 Star spawn = 1200 cylces (about)
                    lda      starCount 
                    cmpa     #1                           ; if only one start, than certainly no reduce 
                    beq      noReduceStars 
                    ldb      t2_rest 
                    cmpb     #7                           ; 2048 cycvle left 
                    ble      removeOneStar                ; reduce starts by one 
noReduceStars 
                    cmpa     #(MAX_STAR_OBJECTS -1)       ; minus 1 since start at 0 
                    bhs      noAddStars 
                    ldb      t2_rest 
                    cmpb     #15                          ; 4096 cycvle left 
                    lbgt     spawnStar 
noAddStars 
                    rts      

; 
; 
; this macro is placed at the end of each possible "remove" exit
; it stores the just removed object at the head of the "empty" list and 
; sets up its "next" pointer
UPDATE_EMPTY_STARLIST  macro  
                    dec      starCount 
                    ldy      starlist_empty_head          ; set u free, as new free head 
                    sty      NEXT_STAR_OBJECT,x           ; load to u the next linked list element 
                    stx      starlist_empty_head 
                    endm     
; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
removeOneStar:                                            ;#isfunction  
                    ldx      starlist_objects_head        ; is it the first? 
was_first_star 
                    ldu      NEXT_STAR_OBJECT,x           ; s pointer to next objext 
                    stu      starlist_objects_head        ; the next object will be the first 
                    cmpu     #OBJECT_LIST_COMPARE_ADDRESS 
                    bls      was_first_and_last_star 
was_first_not_last_star 
                    UPDATE_EMPTY_STARLIST                 ; if not - cleaning up of current "working" list is done 
                    rts                                   ; (D = y,x) 

was_first_and_last_star 
                    UPDATE_EMPTY_STARLIST                 ; and clean up the empties 
                    rts                                   ; (D = y,x) 

was_not_first_star                                        ;        find previous, go thru all objects from first and look where "I" am the next... 
                    ldy      starlist_objects_head        ; start at list head 
try_next_star 
                    cmpx     NEXT_STAR_OBJECT,y           ; am I the next object of the current investigated list element 
                    beq      found_next_switch_star       ; jup -> jump 
                    ldy      NEXT_STAR_OBJECT,y           ; otherwise load the next as new current 
                    bra      try_next_star                ; and search further 

found_next_switch_star 
                    ldu      NEXT_STAR_OBJECT,x           ; we load "our" next object to s 
                    stu      NEXT_STAR_OBJECT,y           ; and store our next in the place of our previous next and thus eleminate ourselfs 
                    cmpu     #OBJECT_LIST_COMPARE_ADDRESS 
                    bls      was_not_first_but_last_star 
                                                          ; bpl was_not_first_but_last_re ; of our next was positive, than we were last, 
was_not_first_and_not_last_star 
                    UPDATE_EMPTY_STARLIST                 ; if not last, than finish and restore empties 
                    rts                                   ; (D = y,x) 

ONE_STAR_LINE_WARP  macro    Y_P, X_P 
                    MY_MOVE_TO_D_START  
                    lda      Y_P+u_offset1,s 
                    suba     warpSpeed 
                    bvc      notBottom1Warp\? 
                    sta      Y_P+u_offset1,s 
                    RANDOM_A  
                    sta      X_P+u_offset1,s 
                    anda     #TWINKLE_AND 
                    ora      #TWINKLE_OR 
                    sta      TWINKLE +u_offset1,s 
                    bra      notBottom1Warp2\? 

notBottom1Warp\? 
                    sta      Y_P+u_offset1,s 
notBottom1Warp2\? 
                    lda      #OBJECT_SCALE +5 
                    sta      VIA_t1_cnt_lo 
                    lda      warpLen 
                    tst      Y_P+u_offset1,s 
                    bpl      pl\? 
                    nega     
pl\? 
                    sta      tmp2_tmp 
                    lda      TWINKLE+u_offset1,s 
                    lsla     
                    MY_MOVE_TO_B_END  
                    _INTENSITY_A  
                    clra     
                    ldb      tmp2_tmp 
                    std      <VIA_port_b 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    inca     
                    sta      <VIA_port_b 
                    deca     
 else  
                    INC      <VIA_port_b                  ;Disable mux 
 endif  
                    sta      <VIA_port_a 
                    lda      #STAR_SHIFT_WARP 
                    sta      <VIA_shift_reg 
                    clr      <VIA_t1_cnt_hi 
                    lda      gameScale 
                    sta      VIA_t1_cnt_lo 
; nop 10 
                    tfr      a,a 
                    tfr      a,a 
                    tfr      a,a 
                    nop      
                    clr      <VIA_shift_reg 
                    _ZERO_VECTOR_BEAM  
                    ldd      #0 
                    std      <VIA_port_b 
                    endm     
was_not_first_but_last_star: 
                    UPDATE_EMPTY_STARLIST                 ; and clean up the empties 
                    rts                                   ; (D = y,x) 

; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
STAR_SHIFT_WARP     =        $ff 
starWarpBehaviour                                         ;#isfunction  
; 1 ;;;
                    ONE_STAR_LINE_WARP  Y1_POS, X1_POS 
; 2 ;;;
                    ldd      Y2_POS+u_offset1,s 
                    ONE_STAR_LINE_WARP  Y2_POS, X2_POS 
; 3 ;;;
                    ldd      Y3_POS+u_offset1,s 
                    ONE_STAR_LINE_WARP  Y3_POS, X3_POS 
; 4 ;;;
                    ldd      Y4_POS+u_offset1,s 
                    ONE_STAR_LINE_WARP  Y4_POS, X4_POS 
; end 
                    lds      NEXT_STAR_OBJECT+u_offset1,s ; preload next user stack 
; clean up
                    LDa      #$CC 
                    STA      VIA_cntl                     ;/BLANK low and /ZERO low 
                    ldd      #0 
                    std      <VIA_port_b 
                    puls     d,pc                         ; (D = y,x, pc = next object) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
simpleStarBehaviour2                                      ;#isfunction  
; 2 ;;;
REPLACE_1_2_simpleStarBehaviour2Bank2_varFrom0_1 
                    ldx      #0                           ; simpleStarBehaviour2Bank2 
                    jmp      jmpBank0X 

backToStarBehaviour 
                    lds      NEXT_STAR_OBJECT+u_offset1,s ; preload next user stack 
; clean up
                    puls     d,pc                         ; (D = y,x, pc = next object) 
simpleStarBehaviourHS                                     ;#isfunction  
; 2 ;;;
REPLACE_1_2_simpleStarBehaviourHSBank2_varFrom0_1 
                    ldx      #0                           ; simpleStarBehaviourHSBank2 
                    jmp      jmpBank0X 

backToStarBehaviourHS 
                    lds      NEXT_STAR_OBJECT+u_offset1,s ; preload next user stack 
; clean up
                    puls     d,pc                         ; (D = y,x, pc = next object) 
