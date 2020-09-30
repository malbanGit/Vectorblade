; bank 3
DIRECTION_CHANGE_DELAY  =    50 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SHOT_SCOOPY_X_RANGE  =       35 
SHOT_PLAYER_X_RANGE  =       12 
SHOT_PLAYER_Y_TEST_MIN  =    $80 + 22 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; new list object to U
; leaves with flags set to result
; (positive = not successfull) ROM
; negative = successfull RAM
; destroys d, u 
newShotObject                                             ;#isfunction  
                    ldu      shotlist_empty_head 
                    cmpu     #OBJECT_LIST_COMPARE_ADDRESS 
                    bls      cs_done_nos 
                                                          ; set the new empty head 
                    ldd      NEXT_SHOT_OBJECT,u           ; the next in out empty list will be the new 
                    std      shotlist_empty_head          ; head of our empty list 
                                                          ; load last of current object list 
; the old head is always our next
                    ldd      shotlist_objects_head 
                    std      NEXT_SHOT_OBJECT,u 
; newobject is always head
                    stu      shotlist_objects_head 
                    inc      shotCount                    ; and remember that we created a new object 
cs_done_nos 
spawnShot_end_noShot 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
spawnShot                                                 ;#isfunction  
                    bsr      newShotObject                ; "create" (or rather get) new object 
                    leax     ,u                           ; pointer to new object now in X also 
                    cmpu     #OBJECT_LIST_COMPARE_ADDRESS 
                    bls      spawnShot_end_noShot 
                    ldb      isBugShot 
                    bne      nosfx10 
                    lda      playSoundFlags 
                    anda     #%11000000 
                    bne      nosfx10 
REPLACE_1_2_dragonData_varFromIRQ1_7 
                    ldd      #0                           ;dragonData 
                    std      sfx_pointer_2 
nosfx10 
; copy and initialze new enemy
                    ldd      #simpleShotBehaviour 
                    std      BEHAVIOUR,x 
                    ldd      bulletSpawnAt 
                    std      Y_POS,x 
                    ldb      shotSpeed 
                    stb      SHOT_SPEED,x 
                    ldb      isBugShot 
                    beq      spawnShot_end 
                    andb     #$f 
                    stb      tmp1 
                    suba     #10                          ; spawn shots below enemy(10 coords) 
                    sta      bulletSpawnAt 
                    lda      isBugShot 
                    bita     #%00100000 
                    bne      spawnTripple 
;;; Y
                    ldb      bulletSpawnAt 
                    sex      
;??? shouldnt there be a exg a,b?
; target - now
                    std      Y_POS_NOW16,x 
                    ldb      #$80 
                    sex      
                    subd     Y_POS_NOW16,x 
                    clr      Y_POS16,x                    ; delta 
                    clr      1+Y_POS16,x                  ; delta 
                    ldu      Y_POS16,x 
addyAgainSpeed 
                    leau     d,u 
                    dec      tmp1                         ; bullet speed 
                    bne      addyAgainSpeed 
                    stu      Y_POS16,x                    ; delta 
                    lda      isBugShot 
                    bmi      missileShot_spawn 
                    anda     #$f 
                    sta      tmp1 
;;;
;;; X
                    ldb      bulletSpawnAt+1 
                    sex      
;??? shouldnt there be a exg a,b?
                    std      X_POS_NOW16,x 
                    ldb      playerXpos 
                    sex      
                    subd     X_POS_NOW16,x 
                    clr      X_POS16,x                    ; delta 
                    clr      1+X_POS16,x                  ; delta 
                    ldu      X_POS16,x 
addxAgainSpeed 
                    leau     d,u 
                    dec      tmp1                         ; bullet speed 
                    bne      addxAgainSpeed 
                    stu      X_POS16,x                    ; delta 
                    ldd      bulletSpawnAt 
                    sta      Y_POS_NOW16,x 
                    stb      X_POS_NOW16,x 
                    clr      Y_POS_NOW16+1,x 
                    clr      X_POS_NOW16+1,x 
; now in Y_POS and X_POS the "addies"
; in Y_POS16 teh coordinates
                    ldd      #shotAtPlayerBehaviour 
                    std      BEHAVIOUR,x 
                    lda      playSoundFlags 
                    anda     #%11000000 
                    bne      nosfx9122 
REPLACE_1_2_BugSeekerData_varFromIRQ1_3 
                    ldd      #0                           ;BugSeekerData 
                    std      sfx_pointer_2 
nosfx9122 
spawnShot_end 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
missileShot_spawn 
                    anda     #$f 
                    sta      SHOT_SPEED ,x 
                    clr      DIRECTION_CHANGE_COUNTER ,x 
                    ldd      bulletSpawnAt 
                    std      Y_POS,x 
                    ldd      #missileAtPlayerBehaviour 
                    std      BEHAVIOUR,x 
                    lda      playSoundFlags 
                    anda     #%11000000 
                    bne      nosfxmis 
REPLACE_1_2_fireMissileData_varFromIRQ1_3 
                    ldx      #0                           ;fireMissileData 
                    stx      sfx_pointer_2 
nosfxmis 
                    rts      

spawnTripple 
                    anda     #$f 
                    sta      SHOT_SPEED,x 
                    sta      shotSpeed 
                    ldd      bulletSpawnAt 
                    std      Y_POS,x 
; shot 1 done
; spawn second shot
                    ldb      bulletSpawnAt +1 
                    subb     #35 
                    bvs      toSmall 
                    jsr      newShotObject                ; "create" (or rather get) new object 
                    leax     ,u                           ; pointer to new object now in X also 
                    cmpu     #OBJECT_LIST_COMPARE_ADDRESS 
                    bls      spawnShot_end 
                    ldd      #simpleShotBehaviour 
                    std      BEHAVIOUR,x 
                    ldd      bulletSpawnAt 
                    subb     #35 
                    std      Y_POS,x 
                    ldb      shotSpeed 
                    stb      SHOT_SPEED,x 
; spawn third shot
toSmall 
                    ldb      bulletSpawnAt +1 
                    addb     #35 
                    bvs      tolarge 
                    jsr      newShotObject                ; "create" (or rather get) new object 
                    leax     ,u                           ; pointer to new object now in X also 
                    cmpu     #OBJECT_LIST_COMPARE_ADDRESS 
                    bls      spawnShot_end 
                    ldd      #simpleShotBehaviour 
                    std      BEHAVIOUR,x 
                    ldd      bulletSpawnAt 
                    addb     #35 
                    std      Y_POS,x 
                    ldb      shotSpeed 
                    stb      SHOT_SPEED,x 
tolarge 
                    lda      playSoundFlags 
                    anda     #%11000000 
                    bne      nosfx912 
REPLACE_1_2_enemyTripleShotData_varFromIRQ1_3 
                    ldx      #0                           ;enemyTripleShotData 
                    stx      sfx_pointer_2 
nosfx912 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
UPDATE_EMPTY_SHOTLIST  macro  
                    dec      shotCount 
                    ldy      shotlist_empty_head          ; set u free, as new free head 
                    sty      NEXT_SHOT_OBJECT,x           ; load to u the next linked list element 
                    stx      shotlist_empty_head 
; cleanup shot
                    MY_MOVE_TO_A_END  
                    ldb      gameScale 
                    stB      VIA_t1_cnt_lo 
                    LDA      #$CC 
                    STA      VIA_cntl                     ;/BLANK low and /ZERO low 
                    ldd      #0 
                    std      <VIA_port_b 
                    endm                                  ; 
; called when shot leaves the screen
;
; in ds+u_offset1 pointer to the object that must be removed
; destroys x, y 
; sets u to pointer of next object in linked list (might be the "return" structure)
; this version is called at the end of an explosion or at the
; end of a score display, called by "behaviours"
; and thus the "return" is the call of the next object thru U stack
playerCaughtShot                                          ;#isfunction  
                    lda      #1                           ; TODO strength of enemy bullet 
                    sta      playerWasHitFor 
notHit_Shot_removeShot 
removeShot:                                               ;#isfunction  
                    leax     u_offset1,s                  ; x -> pointer object struture (correction of offset) 
                    cmpx     shotlist_objects_head        ; is it the first? 
                    bne      was_not_first_eshot          ; no -> jump 
was_first_eshot 
                    lds      NEXT_SHOT_OBJECT,x           ; s pointer to next objext 
                    sts      shotlist_objects_head        ; the next object will be the first 
                    bra      exit_eshot 

was_not_first_eshot                                       ;       find previous, go thru all objects from first and look where "I" am the next... 
                    ldy      shotlist_objects_head        ; start at list head 
try_next_eshot 
                    cmpx     NEXT_SHOT_OBJECT,y           ; am I the next object of the current investigated list element 
                    beq      found_next_switch_eshot      ; jup -> jump 
                    ldy      NEXT_SHOT_OBJECT,y           ; otherwise load the next as new current 
                    bra      try_next_eshot               ; and search further 

found_next_switch_eshot 
                    lds      NEXT_SHOT_OBJECT,x           ; we load "our" next object to s 
                    sts      NEXT_SHOT_OBJECT,y           ; and store our next in the place of our previous next and thus eleminate ourselfs 
exit_eshot 
                    UPDATE_EMPTY_SHOTLIST                 ; and clean up the empties 
                    puls     d,pc                         ; (D = y,x) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
simpleShotBehaviour                                       ;#isfunction  
                    MY_MOVE_TO_D_START  
;;;;;;
; colision detection shot -> player
                    lda      Y_POS +u_offset1,s 
                    cmpa     #SHOT_PLAYER_Y_TEST_MIN 
                    lbge     notHit_Shot 
;;;;;;;;;;;;
; in b is still x position, so start with that
; xTest
; first test, if we are not totally out of "whack"
                    eorb     playerXpos                   ; have pos different signs? 
                    bpl      xCompareOk_ssb               ; no than everything is fine 
                    ldb      X_POS +u_offset1,s 
                    bpl      posSignx1_ssb 
                    negb     
posSignx1_ssb 
; if different sign and absolut > 60 (or any other big number) - than on different side of screen!
                    cmpb     #60 
                    lbhs     notHit_Shot                  ; sign compare OUT of Bounds! 
xCompareOk_ssb 
;;;;;;;;;;;;
                    ldb      X_POS +u_offset1,s 
                    subb     playerXpos 
                    bpl      bulletRightOfPlayer 
bulletLeftOfPlayer 
                    negb     
; if b <= player width -> bullet hit player
; else if b < scoopy width -> bullet hits left scoopy
                    cmpb     #SHOT_PLAYER_X_RANGE 
                    blo      playrWasHit_ssb 
notPlayerHit_Shot_left 
                    ldx      scoopEnemy2 
                    lbeq     notHit_Shot 
; really an active scoopy?
                    ldu      BEHAVIOUR,x 
                    cmpu     #enemyPlayerControlledLeftBehaviour 
                    lbne     notHit_Shot 
                    cmpb     #SHOT_SCOOPY_X_RANGE 
                    lbhi     notHit_Shot 
                                                          ; handle scoopy left hit 
 if  SCOOPIE_DONT_DIE = 1 
                    bra      notHit_Shot 

 else  
                    ldb      lockPurchased 
                    andb     #%00100000 
                    bne      notHit_Shot 
 endif  
                    ldd      #0 
                    std      scoopEnemy2 
removeScoopRest 
                    lda      #2 
                    sta      explosionSound 
                    inc      enemyCount                   ; because after explosion, the remove enemy - does again a "dec enemy count" this would screw the counting 
                                                          ; since scoopies were removed before! 
                    lda      #-1 
                    sta      ALL_PURPOSE ,x               ; negative means this enemy is an explosion 
                    ldd      #enemyExplosionBehaviour 
                    std      BEHAVIOUR ,x                 ; negative means this enemy is an explosion 
                    clr      ANIM_POSITION ,x 
                    ldu      ENEMY_STRUCT ,x 
                    ldu      WAIT_ANIM_TABLE, u 
                    ldu      ,u 
                    stu      SMARTLIST_ORG ,x 
                    lda      #9                           ; scale 
                    sta      EXPLOSION_SCALE ,x 
                    lda      #$7f                         ; intensity 
                    sta      EXPLOSION_INTENSITY ,x 
                    jmp      removeShot 

bulletRightOfPlayer 
; if b <= player width -> bullet hit player
; else if b < scoopy width -> bullet hits left scoopy
                    cmpb     #SHOT_PLAYER_X_RANGE 
                    blo      playrWasHit_ssb 
notPlayerHit_Shot_right 
                    ldx      scoopEnemy1 
                    beq      notHit_Shot 
; really an active scoopy?
                    ldu      BEHAVIOUR,x 
                    cmpu     #enemyPlayerControlledRightBehaviour 
                    bne      notHit_Shot 
                    cmpb     #SHOT_SCOOPY_X_RANGE 
                    bhi      notHit_Shot 
 if  SCOOPIE_DONT_DIE = 1 
                    bra      notHit_Shot 

 else  
                    ldb      lockPurchased 
                    andb     #%00100000 
                    bne      notHit_Shot 
 endif  
                                                          ; handle scoopy right hit 
                    ldd      #0 
                    std      scoopEnemy1 
                    bra      removeScoopRest 

playrWasHit_ssb 
                    lda      playerBonusActive 
                    bita     #BITFIELD_SHIELD             ; shield saved player (from all shots) 
                    lbne     notHit_Shot_removeShot 
                    bita     #BITFIELD_ARMOR 
                    lbeq     playerCaughtShot             ; armor saved player for one shot 
                    anda     #255-BITFIELD_ARMOR 
                    sta      playerBonusActive 
                    SWITCH_TO_SHORT_SHIELD  
                    jmp      notHit_Shot_removeShot 

notHit_Shot 
                    lda      Y_POS+u_offset1,s 
                    suba     SHOT_SPEED+u_offset1,s 
                    sta      Y_POS+u_offset1,s 
                    lda      #$70                         ; lower than top of the screen 
                    cmpa     Y_POS+u_offset1,s 
                    lblt     removeShot 
                    ldb      #$ff 
                    MY_MOVE_TO_A_END  
                    nop      
                    stb      <VIA_shift_reg 
                    WAIT6    
                    WAIT6    
                    WAIT6    
                    WAIT6    
                    LDA      #$CC 
                    lds      NEXT_SHOT_OBJECT+u_offset1,s ; preload next user stack 
                    clr      <VIA_shift_reg 
                    STA      VIA_cntl                     ;/BLANK low and /ZERO low 
                    nop      5                            ; other wise shots "jump" because they do not return completely to zero 
                    puls     d,pc                         ; (D = y,x, pc = next object) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 
shotAtPlayerBehaviour                                     ;#isfunction  
; lda Y_POS +u_offset1,s 
                    ldb      X_POS_NOW16 +u_offset1,s 
                    MY_MOVE_TO_D_START  
                    lda      Y_POS_NOW16 +u_offset1,s 
                    cmpa     #SHOT_PLAYER_Y_TEST_MIN 
                    lbge     notHit_Shot_bug 
;;;;;;;;;;;;
; first test, if we are not totally out of "whack"
                    eorb     playerXpos                   ; have pos different signs? 
                    bpl      xCompareOk_sapb              ; no than everything is fine 
                    ldb      X_POS_NOW16 +u_offset1,s 
                    bpl      posSignx1_sapb 
                    negb     
posSignx1_sapb 
; if different sign and absolut > 60 (or any other big number) - than on different side of screen!
                    cmpb     #60 
                    bhs      notHit_Shot_bug              ; sign compare OUT of Bounds! 
xCompareOk_sapb 
;;;;;;;;;;;;
                    ldb      X_POS_NOW16 +u_offset1,s 
                    subb     playerXpos 
                    bpl      bulletRightOfPlayer_sapb 
bulletLeftOfPlayer_sapb 
                    negb     
; if b <= player width -> bullet hit player
; else if b < scoopy width -> bullet hits left scoopy
                    cmpb     #SHOT_PLAYER_X_RANGE 
                    blo      playrWasHit_sapb 
notPlayerHit_Shot_left_sapb 
                    ldx      scoopEnemy2 
                    beq      notHit_Shot_bug 
; really an active scoopy?
                    ldu      BEHAVIOUR,x 
                    cmpu     #enemyPlayerControlledLeftBehaviour 
                    bne      notHit_Shot_bug 
                    cmpb     #SHOT_SCOOPY_X_RANGE 
                    bhi      notHit_Shot_bug 
                                                          ; handle scoopy left hit 
 if  SCOOPIE_DONT_DIE = 1 
                    bra      notHit_Shot_bug 

 else  
                    ldb      lockPurchased 
                    andb     #%00100000 
                    bne      notHit_Shot_bug 
 endif  
                    ldd      #0 
                    std      scoopEnemy2 
                    jmp      removeScoopRest 

bulletRightOfPlayer_sapb 
; if b <= player width -> bullet hit player
; else if b < scoopy width -> bullet hits left scoopy
                    cmpb     #SHOT_PLAYER_X_RANGE 
                    blo      playrWasHit_sapb 
notPlayerHit_Shot_right_sapb 
                    ldx      scoopEnemy1 
                    beq      notHit_Shot_bug 
; really an active scoopy?
                    ldu      BEHAVIOUR,x 
                    cmpu     #enemyPlayerControlledRightBehaviour 
                    bne      notHit_Shot_bug 
                    cmpb     #SHOT_SCOOPY_X_RANGE 
                    bhi      notHit_Shot_bug 
 if  SCOOPIE_DONT_DIE = 1 
                    bra      notHit_Shot_bug 

 else  
                    ldb      lockPurchased 
                    andb     #%00100000 
                    bne      notHit_Shot_bug 
 endif  
                                                          ; handle scoopy right hit 
                    ldd      #0 
                    std      scoopEnemy1 
                    jmp      removeScoopRest 

playrWasHit_sapb 
                    lda      playerBonusActive 
                    bita     #BITFIELD_SHIELD             ; shield saved player (from all shots) 
                    lbne     notHit_Shot_removeShot 
                    bita     #BITFIELD_ARMOR 
                    lbeq     playerCaughtShot             ; armor saved player for one shot 
                    anda     #255-BITFIELD_ARMOR 
                    sta      playerBonusActive 
                    SWITCH_TO_SHORT_SHIELD  
                    jmp      notHit_Shot_removeShot 

notHit_Shot_bug 
; should y add not be fixed?
                    ldd      Y_POS_NOW16+u_offset1,s 
                    addd     Y_POS16+u_offset1,s 
                    std      Y_POS_NOW16+u_offset1,s 
                    ldd      X_POS_NOW16+u_offset1,s 
                    addd     X_POS16+u_offset1,s 
                    std      X_POS_NOW16+u_offset1,s 
                    lda      #$75 
                    cmpa     Y_POS_NOW16+u_offset1,s 
                    lblt     removeShot 
; 
DRAW_BULLET         macro    
                    clrb                                  ; ensure shiftreg is 0 
                    stb      <VIA_shift_reg               ;Clear shift register (blank output) 
                    ldb      #$3 
                    stb      VIA_t1_cnt_lo 
                    ldb      #$30 
                    MY_MOVE_TO_A_END  
                    clra     
; first line
                    std      <VIA_port_b                  ;Enable mux 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    incb     
                    stb      <VIA_port_b                  ;Disable mux 
                    decb     
 else  
                    INC      <VIA_port_b                  ;Disable mux 
 endif  
                    STa      <VIA_port_a                  ;Send X to A/D 
                    DEC      <VIA_shift_reg               ;Clear shift register (blank output) 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    STa      <VIA_port_a                  ;Send Y to A/D 
                    sta      <VIA_port_b                  ;Enable mux 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    incb     
                    stb      <VIA_port_b                  ;Disable mux 
                    decb     
 else  
                    INC      <VIA_port_b                  ;Disable mux 
 endif  
                    STb      <VIA_port_a                  ;Send X to A/D 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    negb     
                    std      <VIA_port_b                  ;Enable mux 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    incb     
                    stb      <VIA_port_b                  ;Disable mux 
                    decb     
 else  
                    INC      <VIA_port_b                  ;Disable mux 
 endif  
                    STa      <VIA_port_a                  ;Send X to A/D 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    STa      <VIA_port_a                  ;Send Y to A/D 
                    sta      <VIA_port_b                  ;Enable mux 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    incb     
                    stb      <VIA_port_b                  ;Disable mux 
                    decb     
 else  
                    INC      <VIA_port_b                  ;Disable mux 
 endif  
                    STb      <VIA_port_a                  ;Send X to A/D 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    ldd      #$e0cc 
                    STA      <VIA_shift_reg               ;Clear shift register (blank output) 
                    lda      gameScale 
                    STB      <VIA_cntl                    ;/BLANK low and /ZERO low 
                    sta      VIA_t1_cnt_lo 
                    endm     
;
                    DRAW_BULLET  
                    lds      NEXT_SHOT_OBJECT+u_offset1,s ; preload next user stack 
                    puls     d,pc                         ; (D = y,x, pc = next object) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
missileAtPlayerBehaviour                                  ;#isfunction  
;                    MY_MOVE_TO_D_START  
; jmp notHit_Shot_removeShot
                    STA      <VIA_port_a                  ;Store Y in D/A register 
                    LDA      #$CE                         ;Blank low, zero high? 
                    STA      <VIA_cntl                    ; 
                    CLRA     
                    STA      <VIA_port_b                  ;Enable mux ; hey dis si "break integratorzero 440" 
                    nop                                   ; y must be set more than xx cycles on some vectrex 
; additional because of very cranky
; dunno why only here!
                    brn      0                            ; y must be set more than xx cycles on some vectrex 
                                                          ; nop ; y must be set more than xx cycles on some vectrex 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    inca     
                    sta      <VIA_port_b                  ;Disable mux 
                    STB      <VIA_port_a                  ;Store X in D/A register 
                    clra     
 else  
                    INC      <VIA_port_b                  ;Disable mux 
                    STB      <VIA_port_a                  ;Store X in D/A register 
 endif  
                    STA      <VIA_t1_cnt_hi               ;enable timer 
                    lda      Y_POS+u_offset1,s 
                    cmpa     #SHOT_PLAYER_Y_TEST_MIN 
                    lbge     notHit_Shot_bug_missile 
;;;;;;;;;;;;
; first test, if we are not totally out of "whack"
                    eorb     playerXpos                   ; have pos different signs? 
                    bpl      xCompareOk_sapb_missile      ; no than everything is fine 
                    ldb      X_POS +u_offset1,s 
                    bpl      posSignx1_sapb_missile 
                    negb     
posSignx1_sapb_missile 
; if different sign and absolut > 60 (or any other big number) - than on different side of screen!
                    cmpb     #60 
                    bhs      notHit_Shot_bug_missile      ; sign compare OUT of Bounds! 
xCompareOk_sapb_missile 
;;;;;;;;;;;;
                    ldb      X_POS +u_offset1,s 
                    subb     playerXpos 
                    bpl      bulletRightOfPlayer_sapb_missile 
bulletLeftOfPlayer_sapb_missile 
                    negb     
; if b <= player width -> bullet hit player
; else if b < scoopy width -> bullet hits left scoopy
                    cmpb     #SHOT_PLAYER_X_RANGE 
                    blo      playrWasHit_sapb_missile 
notPlayerHit_Shot_left_sapb_missile 
                    ldx      scoopEnemy2 
                    beq      notHit_Shot_bug_missile 
; really an active scoopy?
                    ldu      BEHAVIOUR,x 
                    cmpu     #enemyPlayerControlledLeftBehaviour 
                    bne      notHit_Shot_bug_missile 
                    cmpb     #SHOT_SCOOPY_X_RANGE 
                    bhi      notHit_Shot_bug_missile 
                                                          ; handle scoopy left hit 
 if  SCOOPIE_DONT_DIE = 1 
                    bra      notHit_Shot_bug_missile 

 else  
                    ldb      lockPurchased 
                    andb     #%00100000 
                    bne      notHit_Shot_bug_missile 
 endif  
                    ldd      #0 
                    std      scoopEnemy2 
                    jmp      removeScoopRest 

bulletRightOfPlayer_sapb_missile 
; if b <= player width -> bullet hit player
; else if b < scoopy width -> bullet hits left scoopy
                    cmpb     #SHOT_PLAYER_X_RANGE 
                    blo      playrWasHit_sapb_missile 
notPlayerHit_Shot_right_sapb_missile 
                    ldx      scoopEnemy1 
                    beq      notHit_Shot_bug_missile 
; really an active scoopy?
                    ldu      BEHAVIOUR,x 
                    cmpu     #enemyPlayerControlledRightBehaviour 
                    bne      notHit_Shot_bug_missile 
                    cmpb     #SHOT_SCOOPY_X_RANGE 
                    bhi      notHit_Shot_bug_missile 
 if  SCOOPIE_DONT_DIE = 1 
                    bra      notHit_Shot_bug_missile 

 else  
                    ldb      lockPurchased 
                    andb     #%00100000 
                    bne      notHit_Shot_bug_missile 
 endif  
                                                          ; handle scoopy right hit 
                    ldd      #0 
                    std      scoopEnemy1 
                    jmp      removeScoopRest 

playrWasHit_sapb_missile 
                    lda      playerBonusActive 
                    bita     #BITFIELD_SHIELD             ; shield saved player (from all shots) 
                    lbne     notHit_Shot_removeShot 
                    bita     #BITFIELD_ARMOR 
                    lbeq     playerCaughtShot             ; armor saved player for one shot 
                    anda     #255-BITFIELD_ARMOR 
                    sta      playerBonusActive 
                    SWITCH_TO_SHORT_SHIELD  
                    jmp      notHit_Shot_removeShot 

notHit_Shot_bug_missile 
; update posiition and
; should y add not be fixed?
                    lda      Vec_Loop_Count+1 
                    anda     #1 
                    beq      noYChangeMissile 
                    lda      SHOT_SPEED+u_offset1,s 
                    nega     
                    adda     Y_POS+u_offset1,s 
                    sta      Y_POS+u_offset1,s 
                    lda      #$75 
                    cmpa     Y_POS+u_offset1,s 
                    lblt     removeShot 
noYChangeMissile 
                    dec      DIRECTION_CHANGE_COUNTER +u_offset1,s 
                    bpl      noNewMissileDirection 
newMissileDrection 
                    RANDOM_A  
                    anda     #%00011111 
                    adda     #DIRECTION_CHANGE_DELAY 
                    sta      DIRECTION_CHANGE_COUNTER +u_offset1,s 
                    lda      #1 
                    ldb      playerXpos 
                    cmpb     X_POS+u_offset1,s 
                    bgt      goRightMissile 
                    nega     
goRightMissile 
                    sta      MISSILE_X_ADD+u_offset1,s 
noNewMissileDirection 
                    lda      MISSILE_X_ADD+u_offset1,s 
                    adda     X_POS+u_offset1,s 
                    bvs      newMissileDrection 
                    sta      X_POS+u_offset1,s 
; 
                    MY_MOVE_TO_B_END  
DRAW_MISSILE_HEAD   macro    
                    clrb                                  ; ensure shiftreg is 0 
                    stb      <VIA_shift_reg               ;Clear shift register (blank output) 
                    ldb      #$3 
                    stb      VIA_t1_cnt_lo 
                    ldb      #$40 
                    MY_MOVE_TO_A_END  
                    clra     
; first line
                    STa      <VIA_port_a                  ;Send Y to A/D 
                    sta      <VIA_port_b                  ;Enable mux 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    inca     
                    sta      <VIA_port_b 
                    deca     
 else  
                    inc      <VIA_port_b 
 endif  
                    STb      <VIA_port_a                  ;Send X to A/D 
                    DEC      <VIA_shift_reg               ;Clear shift register (blank output) 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    STb      <VIA_port_a                  ;Send Y to A/D 
                    sta      <VIA_port_b                  ;Enable mux 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    inca     
                    sta      <VIA_port_b 
                    deca     
 else  
                    inc      <VIA_port_b 
 endif  
                    negb     
                    asrb     
                    STb      <VIA_port_a                  ;Send X to A/D 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    aslb     
                    std      <VIA_port_b                  ;Enable mux 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    inca     
                    sta      <VIA_port_b 
                    deca     
 else  
                    inc      <VIA_port_b 
 endif  
                    asrb     
                    STb      <VIA_port_a                  ;Send X to A/D 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    aslb     
                    negb     
                    std      <VIA_port_b                  ;Enable mux 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    inca     
                    sta      <VIA_port_b 
                    deca     
 else  
                    inc      <VIA_port_b 
 endif  
                    asrb     
                    STb      <VIA_port_a                  ;Send X to A/D 
                    STa      <VIA_shift_reg               ;Clear shift register (blank output) 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    endm     
;
                    DRAW_MISSILE_HEAD  
                    lda      #20 
                    sta      VIA_t1_cnt_lo 
                    RANDOM_A  
                    anda     #%00111111 
                    adda     #63                          ; length of "tail" of missile 
                                                          ; halfing the difference ensures we do not corss the byte bonudary! 
                    ldb      X_POS+u_offset1,s 
                    asrb     
                    stb      tmp1 
                    ldb      playerXpos 
                    asrb     
                    subb     tmp1 
                    negb     
                    STA      <VIA_port_a                  ;Send Y to A/D 
                    clra     
                    sta      <VIA_port_b                  ;Enable mux 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    inca     
                    sta      <VIA_port_b 
                    deca     
 else  
                    inc      <VIA_port_b 
 endif  
                    STB      <VIA_port_a                  ;Send X to A/D 
                    ldb      #$ff 
                    stb      <VIA_shift_reg               ;Clear shift register (blank output) 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    nop      6 
                    ldd      #$00cc 
                    STA      <VIA_shift_reg               ;Clear shift register (blank output) 
                    lds      NEXT_SHOT_OBJECT+u_offset1,s ; preload next user stack 
                    STB      <VIA_cntl                    ;/BLANK low and /ZERO low 
; cranky missile behavour of low shots after missiles
                    lda      #-20 
                    STA      <VIA_port_a                  ;Send Y to A/D 
                    clra     
                    sta      <VIA_port_b                  ;Enable mux 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    inca     
                    sta      <VIA_port_b 
 else  
                    inc      <VIA_port_b 
 endif  
                    lda      gameScale 
                    sta      VIA_t1_cnt_lo 
                    puls     d,pc                         ; (D = y,x, pc = next object) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                    clr      X_POS16,x                    ; delta 
                    clr      1+X_POS16,x                  ; delta 
                    ldu      X_POS16,x 
addxAgainSpeedMissile 
                    leau     d,u 
                    dec      tmp1                         ; bullet speed 
                    bne      addxAgainSpeedMissile 
                    stu      X_POS16,x                    ; delta 
                    ldd      bulletSpawnAt 
                    sta      Y_POS_NOW16,x 
                    stb      X_POS_NOW16,x 
                    clr      Y_POS_NOW16+1,x 
                    clr      X_POS_NOW16+1,x 
                    ldd      #missileAtPlayerBehaviour 
                    std      BEHAVIOUR,x 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 
letter_SIGN_AtPlayerBehaviour 
REPLACE_1_2_Alphabet28_varFrom0_0 
                    ldx      #0                           ;Alphabet28 
                    bra      _letterAtPlayerBehaviour 

letter_B_AtPlayerBehaviour 
REPLACE_1_2_Alphabet1_varFrom0_0 
                    ldx      #0                           ;Alphabet1 
                    bra      _letterAtPlayerBehaviour 

letter_E_AtPlayerBehaviour                                ;#isfunction  
REPLACE_1_2_Alphabet4_varFrom0_0 
                    ldx      #0                           ;Alphabet4 
                    bra      _letterAtPlayerBehaviour 

letter_G_AtPlayerBehaviour                                ;#isfunction  
REPLACE_1_2_Alphabet6_varFrom0_0 
                    ldx      #0                           ;Alphabet6 
                    bra      _letterAtPlayerBehaviour 

letter_H_AtPlayerBehaviour                                ;#isfunction  
REPLACE_1_2_Alphabet7_varFrom0_0 
                    ldx      #0                           ;Alphabet7 
                    bra      _letterAtPlayerBehaviour 

letter_I_AtPlayerBehaviour                                ;#isfunction  
REPLACE_1_2_Alphabet8_varFrom0_0 
                    ldx      #0                           ;Alphabet8 
                    bra      _letterAtPlayerBehaviour 

letter_SPACE_AtPlayerBehaviour                            ;#isfunction  
REPLACE_1_2_Alphabet27_varFrom0_0 
                    ldx      #0                           ;Alphabet27 
                    bra      _letterAtPlayerBehaviour 

letter_C_AtPlayerBehaviour                                ;#isfunction  
REPLACE_1_2_Alphabet2_varFrom0_0 
                    ldx      #0                           ;Alphabet2 
                    bra      _letterAtPlayerBehaviour 

letter_O_AtPlayerBehaviour                                ;#isfunction  
REPLACE_1_2_Alphabet14_varFrom0_0 
                    ldx      #0                           ;Alphabet14 
                    bra      _letterAtPlayerBehaviour 

letter_W_AtPlayerBehaviour                                ;#isfunction  
REPLACE_1_2_Alphabet22_varFrom0_0 
                    ldx      #0                           ;Alphabet22 
                    bra      _letterAtPlayerBehaviour 

letter_A_AtPlayerBehaviour                                ;#isfunction  
REPLACE_1_2_Alphabet0_varFrom0_0 
                    ldx      #0                           ;Alphabet0 
                    bra      _letterAtPlayerBehaviour 

letter_D_AtPlayerBehaviour                                ;#isfunction  
REPLACE_1_2_Alphabet3_varFrom0_0 
                    ldx      #0                           ;Alphabet3 
                    bra      _letterAtPlayerBehaviour 

letter_R_AtPlayerBehaviour                                ;#isfunction  
REPLACE_1_2_Alphabet17_varFrom0_0 
                    ldx      #0                           ;Alphabet17 
                    bra      _letterAtPlayerBehaviour 

letter_U_AtPlayerBehaviour                                ;#isfunction  
REPLACE_1_2_Alphabet20_varFrom0_0 
                    ldx      #0                           ;Alphabet20 
                    bra      _letterAtPlayerBehaviour 

letter_N_AtPlayerBehaviour                                ;#isfunction  
REPLACE_1_2_Alphabet13_varFrom0_0 
                    ldx      #0                           ;Alphabet13 
                    bra      _letterAtPlayerBehaviour 

_letterAtPlayerBehaviour                                  ;#isfunction  
                    ldb      X_POS_NOW16 +u_offset1,s 
                    MY_MOVE_TO_D_START  
                    lda      Y_POS_NOW16 +u_offset1,s 
                    cmpa     #SHOT_PLAYER_Y_TEST_MIN 
                    bge      notHit_Shot_letter 
;;;;;;;;;;;;
; first test, if we are not totally out of "whack"
                    eorb     playerXpos                   ; have pos different signs? 
                    bpl      xCompareOk_letter            ; no than everything is fine 
                    ldb      X_POS_NOW16 +u_offset1,s 
                    bpl      posSignx1_letter 
                    negb     
posSignx1_letter 
; if different sign and absolut > 60 (or any other big number) - than on different side of screen!
                    cmpb     #60 
                    bhs      notHit_Shot_letter           ; sign compare OUT of Bounds! 
xCompareOk_letter 
;;;;;;;;;;;;
                    ldb      X_POS_NOW16 +u_offset1,s 
                    subb     playerXpos 
                    bpl      bulletRightOfPlayer_letter 
bulletLeftOfPlayer_sapb_letter 
                    negb     
; if b <= player width -> bullet hit player
; else if b < scoopy width -> bullet hits left scoopy
                    cmpb     #SHOT_PLAYER_X_RANGE 
                    lblo     playerCaughtShot 
                    bra      notHit_Shot_letter 

bulletRightOfPlayer_letter 
; if b <= player width -> bullet hit player
; else if b < scoopy width -> bullet hits left scoopy
                    cmpb     #SHOT_PLAYER_X_RANGE 
                    lblo     playerCaughtShot 
notHit_Shot_letter 
; should y add not be fixed?
                    ldd      Y_POS_NOW16+u_offset1,s 
                    addd     Y_POS16+u_offset1,s 
                    std      Y_POS_NOW16+u_offset1,s 
                    ldd      X_POS_NOW16+u_offset1,s 
                    addd     X_POS16+u_offset1,s 
                    std      X_POS_NOW16+u_offset1,s 
                    lda      #$75 
                    cmpa     Y_POS_NOW16+u_offset1,s 
                    blt      removeShot_aa 
LETTERSIZE_BOSS3    =        30 
                    lda      #LETTERSIZE_BOSS3 
                    sta      VIA_t1_cnt_lo 
                    ldu      #BackFromDraw_Vlp0_0 
                    jmp      Draw_Vlp0_0 

BackFromDraw_Vlp0_0 
                    lds      NEXT_SHOT_OBJECT+u_offset1,s ; preload next user stack 
                    puls     d,pc                         ; (D = y,x, pc = next object) 
removeShot_aa 
                    jmp      removeShot 
