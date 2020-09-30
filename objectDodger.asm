;                    struct   DodgerObject 
;                    ds       Y_POS,1 
;                    ds       X_POS,1 
;                    ds       BEHAVIOUR,2                  ; PC 
;                    ds       NEXT_ENEMY_OBJECT,2          ; positive = end of list 
;                    ds       Y_POS16,2                    ; D current position for calculation only , Y is pos, y low is addy 
;                    ds       X_POS16,2                    ; D current position for calculation only 
;                    ds       FALLSPEED,2 
;                    ds       DOCGER_ANIM_COUNT,1 
;                    ds       DOCGER_ORG_LIST,2 
;                    end struct 
SHIP_TEST_SIZE      =        6 
dodgerBehaviour                                           ;#isfunction  
                    MY_MOVE_TO_D_START  
; mine col detect
; mine positions are allways in the middle of the mine
; player pos is: x middle y slightly below middle
; strength wise both are maxed - mines slightly more so
; player is drawn with scale 9 (for detection we divide by 8)
; width of player is 255
; 255 / 8 = 32
; mines are drawn with "random" scale -> must be compensated!
                    tst      dodgerGotKilled 
                    lbne     isAlreadyDeadDodger 
                    lda      <DODGER_SIZE+u_offset1,u 
                    cmpa     #$10 
                    blo      dodgerSizeOk 
                    suba     #$10 
                    lsra     
                    nega     
                    adda     <DODGER_SIZE+u_offset1,u 
dodgerSizeOk 
                    sta      tmp2_tmp 
                    lda      Y_POS +u_offset1,u 
                    suba     tmp2_tmp 
                    bvc      notOObDodger0 
                    lda      #-$7a 
notOObDodger0 
; first check if mines are completely out of bounds
                    cmpa     #-$78 
                    lbgt     oob_dodger                   ; branch if y pos is "very much" greater than ship po 
                    lda      playerXpos                   ; player pos 
                    adda     #$80                         ; make zero based 
                    suba     #SHIP_TEST_SIZE              ; (right side of player) - can not be oob because of positining cant be to low! 
; in a player right side!
; in b is still the mines x pos
; assuming "width" is = scale
                    addb     #$80                         ; make zero based 
                    addb     tmp2_tmp 
                    bcc      no_oob_dodger1 
                    ldb      #255                         ;max out for overflow 
no_oob_dodger1 
; beware overflow!
; in b is now the left side of the mine
; if the left side of the mine is further right than the right side of the player -> no hit
; if a-b>0 -> no hit (playerposRight - mineposLeft)
                    stb      tmp1_tmp 
                    cmpa     tmp1_tmp 
                    lbhi     noHitDodger 
                    adda     #SHIP_TEST_SIZE*2            ; add size of ship to go to the other edge of player sprite (left edge) 
; in a player left side!
                    ldb      <X_POS+u_offset1,u 
                    addb     #$80                         ; make zero based 
                    subb     tmp2_tmp 
                    bcc      no_oob_dodger2 
                    clrb                                  ;min out for overflow 
no_oob_dodger2 
; in b is now the right side of the mine
; if the right side of the mine is further left than the left side of the player -> no hit
; if b-a>0 -> no hit (mineposRight - playerposLeft )
                    sta      tmp1_tmp 
                    cmpb     tmp1_tmp 
                    bhi      noHitDodger 
                    ldd      <DODGER_ORG_LIST+u_offset1,u 
                    cmpd     #DodgerDiamond 
                    bne      dieBastard 
                    ldd      #gotDiamond 
                    INIT_MESSAGE_D  
                    ldd      #100 
                    addd     playerCashW 
                    std      playerCashW 
                    ldd      #5000 
                    pshs     u 
                    ldu      #addScoreDiamondDodgerDone   ; return to 
                    ldy      #player_score 
                    jmp      addScore_d 

addScoreDiamondDodgerDone 
                    puls     u 
; diamonds indiamondstore a worth MORE
                    lda      diamondCount 
                    cmpa     #120 
                    bhi      notCounted 
                    adda     #5 
                    sta      diamondCount 
notCounted 
                    lda      playSoundFlags 
                    anda     #%11000000 
                    bne      nosfx11 
REPLACE_1_2_collectDiamondData_varFromIRQ1_4 
                    ldx      #0                           ;collectDiamondData 
                    stx      sfx_pointer_1 
nosfx11 
                    bra      removeAsteroid 

dieBastard 
; HIT
                    pshs     u 
                    ldd      #wasHit 
                    INIT_MESSAGE_D  
                    INIT_PLAYER_EXPLOSION  
REPLACE_1_2_lastExplosionData_varFromIRQ1_42 
                    ldx      #0                           ;lastExplosionData 
                    stx      sfx_pointer_1 
                    stx      sfx_pointer_2 
                    stx      sfx_pointer_3 
                    puls     u 
 if  MINESTORM_INVINCIBLE = 1 
 else  
                    inc      dodgerGotKilled 
 endif  
isAlreadyDeadDodger 
noHitDodger 
oob_dodger 
                    ldd      Y_POS16 +u_offset1,u 
                    subd     <DODGER_FALLSPEED +u_offset1,u 
                    bvs      removeAsteroid 
                    subd     dodgerAccel 
                    bvs      removeAsteroid 
                    std      Y_POS16 +u_offset1,u 
                    sta      Y_POS +u_offset1,u 
                    ldx      <DODGER_ORG_LIST+u_offset1,u 
                    lda      <DODGER_SIZE+u_offset1,u 
                    sta      VIA_t1_cnt_lo 
                    MY_MOVE_TO_A_END  
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    jsr      myDrawVLp 
 else  
                    jsr      Draw_VLp 
 endif  
                    ldu      NEXT_ENEMY_OBJECT+u_offset1,u ; preload next user stack 
                    ldb      gameScale 
                    LDa      #$CC 
                    STA      VIA_cntl                     ;/BLANK low and /ZERO low 
                    stB      VIA_t1_cnt_lo 
                    ldd      #0 
                    std      <VIA_port_b 
                    pulu     d,pc 
wasHit 
                    db       "HIT!!!", $80
gotDiamond 
                    db       "DIAMOND", $80
removeAsteroid 
;
; this macro is placed at the end of each possible "remove" exit
; it stores the just removed object at the head of the "empty" list and 
; sets up its "next" pointer
UPDATE_DODGER_LIST  macro    
                    dec      enemyCount 
                    ldy      enemylist_empty_head         ; set u free, as new free head 
                    sty      NEXT_ENEMY_OBJECT,x          ; load to u the next linked list element 
                    stx      enemylist_empty_head 
                    endm     
;
                    leax     u_offset1,u                  ; x -> pointer object struture (correction of offset) 
                    cmpx     enemylist_objects_head       ; is it the first? 
                    bne      was_not_first_dodge          ; no -> jump 
was_first_dodge 
                    ldu      NEXT_ENEMY_OBJECT,x          ; s pointer to next objext 
                    stu      enemylist_objects_head       ; the next object will be the first 
                    bra      dodgeRemoveDone 

was_not_first_dodge                                       ;       find previous, go thru all objects from first and look where "I" am the next... 
                    ldy      enemylist_objects_head       ; start at list head 
try_next_dodge 
                    cmpx     NEXT_ENEMY_OBJECT,y          ; am I the next object of the current investigated list element 
                    beq      found_next_switch_dodge      ; jup -> jump 
                    ldy      NEXT_ENEMY_OBJECT,y          ; otherwise load the next as new current 
                    bra      try_next_dodge               ; and search further 

found_next_switch_dodge 
                    ldu      NEXT_ENEMY_OBJECT,x          ; we load "our" next object to s 
                    stu      NEXT_ENEMY_OBJECT,y          ; and store our next in the place of our previous next and thus eleminate ourselfs 
dodgeRemoveDone 
                    UPDATE_DODGER_LIST                    ; and clean up the empties 
; do a clean ending - which is usually done at the end of "SmartDraw"
                    ldb      gameScale 
                    LDa      #$CC 
                    STA      VIA_cntl                     ;/BLANK low and /ZERO low 
                    stB      VIA_t1_cnt_lo 
                    ldd      #0 
                    std      <VIA_port_b 
                    MY_MOVE_TO_A_END  
                    pulu     d,pc 
DodgerDiamond: 
                    DB       $00, +$27, -$57              ; pattern, y, x 
                    DB       $FF, +$00, +$3B              ; pattern, y, x 
                    DB       $FF, -$7E, +$1C              ; pattern, y, x 
                    DB       $FF, +$7E, +$1C              ; pattern, y, x 
                    DB       $FF, +$00, -$38              ; pattern, y, x 
                    DB       $FF, +$30, +$0A              ; pattern, y, x 
                    DB       $00, +$00, +$24              ; pattern, y, x 
                    DB       $FF, -$30, +$0A              ; pattern, y, x 
                    DB       $FF, +$00, +$3B              ; pattern, y, x 
                    DB       $FF, -$7E, -$57              ; pattern, y, x 
                    DB       $FF, +$7E, -$57              ; pattern, y, x 
                    DB       $FF, +$30, +$27              ; pattern, y, x 
                    DB       $FF, +$00, +$60              ; pattern, y, x 
                    DB       $FF, -$30, +$27              ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
 if  IS_VIA_FAULTY_RESISTENT = 1 
myDrawVLp                                                 ;#isfunction  
                    LDD      1,X                          ;Get next coordinate pair 
                    STA      <VIA_port_a                  ;Send Y to A/D 
                    clra     
                    sta      <VIA_port_b                  ;Enable mux 
                    inca     
                    sta      <VIA_port_b                  ;Disable mux 
                    LDA      ,X                           ;Get pattern byte? 
                    STB      <VIA_port_a                  ;Send X to A/D 
                    STA      <VIA_shift_reg               ;Store pattern in shift register 
                    clra                                  ;B-reg = T1 interrupt bit 
                    sta      <VIA_t1_cnt_hi               ;Clear T1H 
                    LDb      #$40                         ;B-reg = T1 interrupt bit 
_LF425:             BITB     <VIA_int_flags               ;Wait for T1 to time out 
                    BEQ      _LF425 
                    LEAX     3,X                          ;Advance to next point in list 
                    STA      <VIA_shift_reg               ;Clear shift register (blank output) 
                    LDA      ,X                           ;Get next pattern byte 
                    BLE      myDrawVLp                    ;Go back if high bit of pattern is set 
                    rts      

 endif  
