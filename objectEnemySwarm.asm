; bank 3
                    include  "drawSubs.asm"
calibrationSwarm                                          ;#isfunction  
                    ldb      #$CC 
                    stb      <VIA_cntl 
                    ldd      #$8100 
                    std      <VIA_port_b 
                    deca     
                    sta      <VIA_port_b 
                    ldb      >calibrationValue6 
                    lda      additionalFlags 
                    anda     #%00000001 
                    bne      buzzVectrex6 
                    lda      #$82 
                    std      <VIA_port_b 
                    ldd      #$83FF                       ; 2 cycles 
                    stb      <VIA_port_a 
                    sta      <VIA_port_b 
                    rts      

buzzVectrex6 
                    lda      #$82 
                    std      <VIA_port_b 
                    ldd      #$83FF                       ; 2 cycles 
                    stb      <VIA_port_a 
                    nop      2 
                    sta      <VIA_port_b 
                    rts      

;
;
CHECK_SWARM_NORMAL_HIT  macro  
                    ldx      playershotlist_objects_head 
testNextHitSwarm\? 
; assuming:
; a) no scoopies
; b; x,y pos of swarmer "good" (in their rectangle - more or less)
; assuming no two shots on same or equivalent y pos
                    cmpx     #OBJECT_LIST_COMPARE_ADDRESS 
                    lblo     notHitSwarm                  ; end of player shot least reached , jump out of macro 
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #6                           ; laser 
                    beq      noyCheck\? 
; check for laser
                    lda      Y_POS,x                      ; ypos of shot 
                    cmpa     Y_POS +u_offset1,s           ; compared to ypos of swarmer 
                    bgt      possibleHitYSwarm1\? 
tryNextSwarmShot\? 
                    ldx      NEXT_PLAYERSHOT_OBJECT,x 
                    bra      testNextHitSwarm\? 

; y pos0 shot high than swarm0
possibleHitYSwarm1\? 
                    suba     #10                          ; assume hight of swarmer of 10 
                    cmpa     Y_POS +u_offset1,s 
                    bgt      tryNextSwarmShot\?           ; jump if y of shot +10 still higher than swarm (shot above swarm) 
; ypos correct for hit, now test X
; x of swarm still in b
noyCheck\? 
                    subb     #5                           ; start at left side of x 
                    subb     SHOT_RADIUS ,x               ; adjust to size of shot and its right border 
                    cmpb     X_POS,x 
                    lbgt     notHitSwarm                  ; swarm left pos is further right, than shot right pos 
                    addb     #10                          ; switch pos to other side of swarmer 
                    addb     SHOT_RADIUS ,x               ; and also to other side of shot 
                    addb     SHOT_RADIUS ,x 
                    cmpb     X_POS,x 
                    lblt     notHitSwarm                  ; swarm right pos is further left, than shot left pos 
; swarm was hit
                    ldd      #notHitSwarm 
                    std      backJump                     ; init back jump, in case shot did not destroy swarmer (more HP) 
; preparelaser knowledge
                    clr      laserTmp2                    ; laser = main 
                    lda      Y_POS +u_offset1,s 
                    sta      laserTmp                     ; y pos 
                    jmp      removeCurrentShotAndObject 

                    endm     
;
; since there are so many swarmers, the "usual" hit detection for player shots 
; does not produce satisfactory results
; different approach here:
; - for each swarmer ALL bullets are tested
; - each swarmer does random moevement
; above two points are alternated each round, so it either moves or is hit tested each round
;
; each swarm participant is either "odd" or "even" (one bit in SWARM_MOVEMENT_INFO (fourth bit))
; this bit determines the switching (together with Vec_Loop_Count), between above two subsections
;
;;;
swarmBehaviour                                            ;#isfunction  
                    MY_MOVE_TO_D_START  
                    lda      SWARM_MOVEMENT_INFO +u_offset1,s 
                    anda     #%00010000                   ; odd or even swarm member 
                    lsra     
                    lsra     
                    lsra     
                    lsra     
                    eora     Vec_Loop_Count+1 
                    anda     #1 
                    bne      notHitTestSwarm 
                    CHECK_SWARM_NORMAL_HIT  
notHitTestSwarm 
; check and adjust movement of swarmer
; adjust direction every 15*2 rounds
back4Shot_swarm 
                    lda      SWARM_MOVEMENT_INFO +u_offset1,s 
                    anda     #%00001111                   ; get only the counter part 
                    beq      initNewDirectionSwarm 
                    lda      Y_POS +u_offset1,s 
                    cmpa     #$80+PLAYER_RADIUS_Y 
                    bgt      notHitPlayerSwarm_ll 
                    ldb      X_POS +u_offset1,s 
                    subb     playerXpos 
                    bpl      noNeg_nm_ll 
                    negb     
noNeg_nm_ll 
                    cmpb     #PLAYER_RADIUS_X 
                    bhi      notHitPlayerSwarm_ll 
                    lda      #1                           ; TODO strength of enemy bullet 
                    sta      playerWasHitFor 
notHitPlayerSwarm_ll 
; now adjust current pos according to movement info in our swarm data
                    dec      SWARM_MOVEMENT_INFO +u_offset1,s 
                    lda      SWARM_ALL_PURPOSE +u_offset1,s 
; vvhh xfff 
; vertical 
; v0 0 = no vertical movement
; 11 = up
; 01 = down
; 00 = not used
                    bita     #%01000000 
                    beq      verticalChangeDoneSwarm 
                    bita     #%10000000 
                    beq      verticalGoDownSwarm 
                    inc      Y_POS+u_offset1,s 
; bvc verticalChangeDoneSwarm
; dec Y_POS+u_offset1,s ;should "never" come here (due to rectangle definition)
; dec Y_POS+u_offset1,s 
                    bra      verticalChangeDoneSwarm 

verticalGoDownSwarm 
                    dec      Y_POS+u_offset1,s 
; bvc verticalChangeDoneSwarm
; inc Y_POS+u_offset1,s ;should "never" come here (due to rectangle definition)
; inc Y_POS+u_offset1,s 
verticalChangeDoneSwarm 
; horizontal 
; h0 0 = no horzontal movement
; 11 = left
; 01 = right
; 00 = not used
                    bita     #%00010000 
                    lbeq     swarmMovementDone            ;horizontalChangeDoneSwarm 
                    bita     #%00100000 
                    beq      horizontalGoRightSwarm 
                    inc      X_POS+u_offset1,s 
; bvc horizontalChangeDoneSwarm
; dec X_POS+u_offset1,s 
; dec X_POS+u_offset1,s 
                    jmp      swarmMovementDone            ; horizontalChangeDoneSwarm 

horizontalGoRightSwarm 
                    dec      X_POS+u_offset1,s 
; bvc horizontalChangeDoneSwarm
; inc X_POS+u_offset1,s 
; inc X_POS+u_offset1,s 
horizontalChangeDoneSwarm 
                    jmp      swarmMovementDone 

initNewDirectionSwarm 
                    lda      maxSwarmAttacker 
                    beq      noadditionalSwarmAttacker 
                    RANDOM_A  
                    cmpa     #20 
                    bhi      noKamikaze 
                    dec      maxSwarmAttacker 
                    ldd      #swarmAttackBehaviour 
                    std      BEHAVIOUR+u_offset1,s 
                    bra      swarmMovementDone 

noKamikaze 
noadditionalSwarmAttacker 
                    lda      SWARM_MOVEMENT_INFO +u_offset1,s 
                    ora      #%00001111                   ; counter till next movement change to 15 
                    sta      SWARM_MOVEMENT_INFO +u_offset1,s 
                    ldb      SWARM_ALL_PURPOSE +u_offset1,s 
                    andb     #%00001111                   ; reset all movement parts in ALL_PURPOSE 
                    lda      Y_POS+u_offset1,s 
                    cmpa     #SWARM_MAX_Y 
                    ble      normalySwarm1 
                    orb      #%01000000                   ; force down 
                    bra      verticalIs0Swarm 

normalySwarm1 
                    cmpa     #SWARM_MIN_Y 
                    bgt      normalySwarm2 
                    orb      #%11000000                   ; force up 
                    bra      verticalIs0Swarm 

normalySwarm2 
; vertical 
; v0h0 xfff 
                    RANDOM_A_SW  
                    bmi      verticalIs0Swarm 
                    orb      #%01000000 
                    RANDOM_A_SW  
                    bmi      verticalIs0Swarm 
                    orb      #%10000000 
verticalIsDown 
verticalIs0Swarm 
                    lda      X_POS+u_offset1,s 
                    cmpa     #SWARM_MAX_X 
                    ble      normalxSwarm1 
                    orb      #%00010000                   ; force right 
                    bra      horizontalIs0Swarm 

normalxSwarm1 
                    cmpa     #SWARM_MIN_X 
                    bge      normalxSwarm2 
                    orb      #%00110000                   ; force left 
                    bra      horizontalIs0Swarm 

normalxSwarm2 
; horizontal 
; v0h0 xfff 
                    RANDOM_A_SW  
                    bmi      horizontalIs0Swarm 
                    orb      #%00010000 
                    RANDOM_A_SW  
                    bmi      horizontalIsRight 
                    orb      #%00100000 
horizontalIsRight 
horizontalIs0Swarm 
                    stb      SWARM_ALL_PURPOSE +u_offset1,s 
notHitSwarm 
swarmMovementDone 
; for anim go to swam anim directly there is no enemy struct
                    ldu      #SwarmerDirect 
; do animation of enemy 
                    tst      animDelayCounter 
                    bpl      noAnimChangeEnemySwarm 
                    inc      SWARM_ANIM_POS+u_offset1,s 
                    lda      SWARM_ANIM_POS+u_offset1,s 
                    asla     
                    ldx      a,u 
                    bne      animNotFinishedSwarm 
                    clr      SWARM_ANIM_POS+u_offset1,s 
noAnimChangeEnemySwarm 
                    lda      SWARM_ANIM_POS+u_offset1,s 
                    lsla     
animNotFinishedSwarm 
                    ldu      #SwarmerDirect 
                    ldu      a,u 
                    lda      SWARM_ALL_PURPOSE +u_offset1,s 
                    anda     #%00000111                   ; check if we should "blink" (hit and not destroyed -> we blink) 
                    beq      normalEndMacro_swarm 
                    cmpa     #HIT_FLASH_LENGTH 
                    bgt      normalEndMacro2_swarm 
                    inc      lightningOn 
                    dec      SWARM_ALL_PURPOSE +u_offset1,s 
                    lda      #$7f 
                    bra      out_swarm2 

normalEndMacro_swarm 
                    tst      lightningOn 
                    beq      normalEndMacro2_swarm 
                    clr      lightningOn 
                    lda      #DEFAULT_ENEMY_INTENSITY 
out_swarm2 
                    lds      NEXT_ENEMY_OBJECT+u_offset1,s ; preload next user stack 
                    MY_MOVE_TO_B_END  
                    _INTENSITY_A  
                    jmp      ,u 

normalEndMacro2_swarm 
                    lds      NEXT_ENEMY_OBJECT+u_offset1,s ; preload next user stack 
out_swarm 
                    jmp      ,u 

; these routines leave aux with value of $80 - Shift reg mode = 000 free disable, T1 PB7 enabled 
; "normally" the value is $98
SwarmAnim1_d 
                    INIT_DRAW_6_MOVE_END  ( (-$12 )*256 + ( $3C) ) 
                    LINE_DRAW_6_x  ( ( $7f )*256 + ( $00-40) ) 
                    LINE_DRAW_6_x  ( (-$1B-10 )*256 + (-$32) ) 
                    LINE_DRAW_6_x  ( ( $28 )*256 + ( $06) ) 
                    LINE_DRAW_6_x  ( ( $00 )*256 + (-$20-20) ) 
                    LINE_DRAW_6_x  ( (-$28 )*256 + ( $06+30) ) 
                    LINE_DRAW_6_x  ( ( $1B+20 )*256 + (-$32) ) 
                    LINE_DRAW_6_x  ( (-$7f )*256 + ( $00+40) ) 
                    LINE_DRAW_6_x  ( ( $12 +7)*256 + ( $3C) ) 
                    DEINIT_DRAW_6  
                    puls     d,pc                         ; (D = y,x, pc = next object) 
SwarmAnim2_d 
                    INIT_DRAW_6_MOVE_END  ( (-$12 )*256 + ( $34) ) 
                    LINE_DRAW_6_x  ( ( $7f )*256 + ( $00-40) ) 
                    LINE_DRAW_6_x  ( (-$1B-10 )*256 + (-$2a) ) 
                    LINE_DRAW_6_x  ( ( $28 )*256 + ( $06) ) 
                    LINE_DRAW_6_x  ( ( $00 )*256 + (-$20-20) ) 
                    LINE_DRAW_6_x  ( (-$28 )*256 + ( $06+30) ) 
                    LINE_DRAW_6_x  ( ( $1B+20 )*256 + (-$2a) ) 
                    LINE_DRAW_6_x  ( (-$7f )*256 + ( $00+40) ) 
                    LINE_DRAW_6_x  ( ( $12 +7)*256 + ( $34) ) 
                    DEINIT_DRAW_6  
                    puls     d,pc                         ; (D = y,x, pc = next object) 
SwarmAnim3_d 
                    INIT_DRAW_6_MOVE_END  ( (-$12 )*256 + ( $2c) ) 
                    LINE_DRAW_6_x  ( ( $7f )*256 + ( $00-40) ) 
                    LINE_DRAW_6_x  ( (-$1B-10 )*256 + (-$22) ) 
                    LINE_DRAW_6_x  ( ( $24 )*256 + ( $06) ) 
                    LINE_DRAW_6_x  ( ( $00 )*256 + (-$20-20) ) 
                    LINE_DRAW_6_x  ( (-$24 )*256 + ( $06+30) ) 
                    LINE_DRAW_6_x  ( ( $1B+20 )*256 + (-$22) ) 
                    LINE_DRAW_6_x  ( (-$7f )*256 + ( $00+40) ) 
                    LINE_DRAW_6_x  ( ( $12 +7)*256 + ( $2c) ) 
                    DEINIT_DRAW_6  
                    puls     d,pc                         ; (D = y,x, pc = next object) 
SwarmAnim4_d 
                    INIT_DRAW_6_MOVE_END  ( (-$11 )*256 + ( $24) ) 
                    LINE_DRAW_6_x  ( ( $7e )*256 + ( $00-40) ) 
                    LINE_DRAW_6_x  ( (-$1B-10 )*256 + (-$1a) ) 
                    LINE_DRAW_6_x  ( ( $20 )*256 + ( $06) ) 
                    LINE_DRAW_6_x  ( ( $00 )*256 + (-$20-20) ) 
                    LINE_DRAW_6_x  ( (-$20 )*256 + ( $06+30) ) 
                    LINE_DRAW_6_x  ( ( $1B+20 )*256 + (-$1a) ) 
                    LINE_DRAW_6_x  ( (-$7e )*256 + ( $00+40) ) 
                    LINE_DRAW_6_x  ( ( $11 +7)*256 + ( $24) ) 
                    DEINIT_DRAW_6  
                    puls     d,pc                         ; (D = y,x, pc = next object) 
SwarmerDirect 
                    dw       SwarmAnim1_d, SwarmAnim2_d, SwarmAnim3_d, SwarmAnim4_d, SwarmAnim3_d, SwarmAnim2_d, 0 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
swarmExplosionBehaviour                                   ;#isfunction  
                    MY_MOVE_TO_D_START  
                    ldu      #Swarmer 
                    ldu      ,u 
                    lda      SWARM_EXPLOSION_SCALE+u_offset1,s 
                    adda     #1 
                    cmpa     #EXPLOSION_MAX_SCALE -2 
                    lbhs     destroyEnemyObject 
                    sta      SWARM_EXPLOSION_SCALE +u_offset1,s 
                    sta      VIA_t1_cnt_lo 
                    lda      SWARM_EXPLOSION_INTENSITY +u_offset1,s 
                    suba     #10 
                    sta      SWARM_EXPLOSION_INTENSITY +u_offset1,s 
                    lds      NEXT_ENEMY_OBJECT+u_offset1,s ; preload next user stack 
                    inc      lightningOn 
                    MY_MOVE_TO_B_END  
                    LDb      #$98 
                    STb      <VIA_aux_cntl                ; ensure mode is correct for "ordinary" drawings... 
                    _INTENSITY_A  
                    clra     
                    pulu     b,x,pc 
swarmAttackBehaviour                                      ;#isfunction  
                    MY_MOVE_TO_D_START  
                    lda      SWARM_MOVEMENT_INFO +u_offset1,s 
                    anda     #%00010000                   ; odd or even swarm member 
                    lsra     
                    lsra     
                    lsra     
                    lsra     
                    eora     Vec_Loop_Count+1 
                    anda     #1 
                    bne      notHitTestSwarm_nm 
                    ldx      playershotlist_objects_head 
testNextHitSwarm_nm 
; assuming:
; a) no scoopies
; b; x,y pos of swarmer "good" (in their rectangle - more or less)
; assuming no two shots on same or equivalent y pos
                    cmpx     #OBJECT_LIST_COMPARE_ADDRESS 
                    lblo     notHitSwarm_nm               ; end of player shot least reached , jump out of macro 
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #6                           ; laser 
                    beq      noyCheck_nm 
; check for laser
                    lda      Y_POS,x                      ; ypos of shot 
                    cmpa     Y_POS +u_offset1,s           ; compared to ypos of swarmer 
                    bgt      possibleHitYSwarm1_nm 
tryNextSwarmShot_nm 
                    ldx      NEXT_PLAYERSHOT_OBJECT,x 
                    bra      testNextHitSwarm_nm 

; y pos0 shot high than swarm0
possibleHitYSwarm1_nm 
                    suba     #10                          ; assume hight of swarmer of 10 
                    cmpa     Y_POS +u_offset1,s 
                    bgt      tryNextSwarmShot_nm          ; jump if y of shot +10 still higher than swarm (shot above swarm) 
; ypos correct for hit, now test X
; x of swarm still in b
noyCheck_nm 
                    subb     #5                           ; start at left side of x 
                    subb     SHOT_RADIUS ,x               ; adjust to size of shot and its right border 
                    cmpb     X_POS,x 
                    lbgt     notHitSwarm_nm               ; swarm left pos is further right, than shot right pos 
                    addb     #10                          ; switch pos to other side of swarmer 
                    addb     SHOT_RADIUS ,x               ; and also to other side of shot 
                    addb     SHOT_RADIUS ,x 
                    cmpb     X_POS,x 
                    lblt     notHitSwarm_nm               ; swarm right pos is further left, than shot left pos 
; swarm was hit
                    ldd      #notHitSwarm_nm 
                    std      backJump                     ; init back jump, in case shot did not destroy swarmer (more HP) 
; preparelaser knowledge
                    clr      laserTmp2                    ; laser = main 
                    lda      Y_POS +u_offset1,s 
                    sta      laserTmp                     ; y pos 
                    inc      maxSwarmAttacker 
                    jmp      removeCurrentShotAndObject 

notHitSwarm_nm 
notHitTestSwarm_nm 
; check and adjust movement of swarmer
; ----
; col detect player base
                    lda      Y_POS +u_offset1,s 
                    cmpa     #$80+PLAYER_RADIUS_Y 
                    bgt      notHitPlayerSwarm 
                    ldb      X_POS +u_offset1,s 
                    subb     playerXpos 
                    bpl      noNeg_nm 
                    negb     
noNeg_nm 
                    cmpb     #PLAYER_RADIUS_X 
                    bhi      notHitPlayerSwarm 
                    lda      #1                           ; TODO strength of enemy bullet 
                    sta      playerWasHitFor 
notHitPlayerSwarm 
; set HP = 0
; if enemy collides with player -> it is dead!
; or explode directly :-)
; ----
                    dec      Y_POS +u_offset1,s 
                    bvs      changebehaviour 
                    dec      Y_POS +u_offset1,s 
                    bvs      changebehaviour 
                    bra      noswarmBehaviour 

changebehaviour 
                    ldd      #swarmBehaviour 
                    std      BEHAVIOUR +u_offset1,s 
                    lda      Y_POS +u_offset1,s 
                    adda     #5 
                    sta      Y_POS +u_offset1,s 
                    inc      maxSwarmAttacker 
noswarmBehaviour 
                    RANDOM_A  
                    bmi      playerIsLowerSwarm 
                    inc      X_POS +u_offset1,s 
                    bra      noXChangeSwarm 

playerIsLowerSwarm 
                    dec      X_POS +u_offset1,s 
noXChangeSwarm 
; cmpa X_POS +u_offset1,s  
; beq noXChangeSwarm2
; blt playerIsLowerSwarm
;
; inc X_POS +u_offset1,s  
; bra noXChangeSwarm2
;playerIsLowerSwarm
; dec X_POS +u_offset1,s  
;
;
;noXChangeSwarm2
                    jmp      swarmMovementDone 
