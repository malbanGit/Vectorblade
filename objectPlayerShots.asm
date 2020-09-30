; bank 2
 if  USE_NEW_SHOTS = 1 
 else  
SHIT                =        1                            ; shit are the New 4 shots :-) 
 endif  
SHOT_START_POSITION_Y  =     $88+18                       ; must not be $80 
 if  USE_NEW_SHOTS = 1 
                    include  "playerShotMacrosNew.asm"
 else  
                    include  "playerShotMacrosOld.asm"
 endif  
 if  SHIT = 1 
                    include  "playerShot4.asm"
; include "playerShot3.asm"
 endif  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; new list object to U
; leaves with flags set to result
; (positive = not successfull) ROM
; negative = successfull RAM
; destroys d, u 
newPlayerShotObject                                       ;#isfunction  
                    ldu      playershotlist_empty_head 
                    cmpu     #OBJECT_LIST_COMPARE_ADDRESS 
                    bls      cs_done_nops 
                                                          ; set the new empty head 
                    ldd      NEXT_PLAYERSHOT_OBJECT,u     ; the next in out empty list will be the new 
                    std      playershotlist_empty_head    ; head of our empty list 
                                                          ; load last of current object list 
; the old head is always our next
                    ldd      playershotlist_objects_head 
                    std      NEXT_PLAYERSHOT_OBJECT,u 
; newobject is always head
                    stu      playershotlist_objects_head 
                    inc      playerShotCount              ; and remember that we created a new object 
cs_done_nops 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
spawnPlayerShot                                           ;#isfunction  
                    lda      playerShotCount 
                    cmpa     playerMaxShotInAir 
                    lbhs     toManyShotsInAir 
; make sure only one laser is available
; redundant checkking though :-(
                    ldb      playerNumberOfBulletsPerShot 
                    cmpb     #6 
                    bne      noLazerShot 
                    tsta                                  ; only 1 lazer allowed at one time! 
                    lbne     toManyShotsInAir 
noLazerShot 
                    bsr      newPlayerShotObject          ; "create" (or rather get) new object 
                    leax     ,u                           ; pointer to new object now in X also 
                    cmpu     #OBJECT_LIST_COMPARE_ADDRESS 
                    lbls     spawnPlayerShot_end 
                    lda      playSoundFlags 
                    anda     #%11000000 
                    bne      nosfx8 
REPLACE_1_2_BomberShotData_varFromIRQ1_41 
                    ldu      #0                           ;BomberShotData 
                    stu      sfx_pointer_3 
nosfx8 
; copy and initialze new enemy
                    lda      #0 
                    ldb      playerNumberOfBulletsPerShot 
                    cmpb     #1 
                    beq      oneBullet 
                    cmpb     #2 
                    beq      twoBullet 
                    cmpb     #3 
                    lbeq     threeBullet 
                    cmpb     #5 
                    lbeq     fiveBullet 
                    cmpb     #6 
                    lbeq     lazerShot 
; assuming 4 bullets
                    ldy      scoopEnemy1 
                    beq      noScoop1_4 
; really an active scoopy?
 if  SCOOPY_TEST != 1 
                    ldu      BEHAVIOUR,y 
REPLACE_2_2_enemyPlayerControlledRightBehaviour_varFrom1_0 
                    cmpu     #0                           ;enemyPlayerControlledRightBehaviour 
                    bne      noScoop1_4 
 endif  
                    adda     #%00000100 
noScoop1_4 
                    ldy      scoopEnemy2 
                    beq      noScoop2_4 
; really an active scoopy?
 if  SCOOPY_TEST != 1 
                    ldu      BEHAVIOUR,y 
REPLACE_2_2_enemyPlayerControlledLeftBehaviour_varFrom1_0 
                    cmpu     #0                           ;enemyPlayerControlledLeftBehaviour 
                    bne      noScoop2_4 
 endif  
                    adda     #%01000000 
noScoop2_4 
                    sta      SCOOP_SHOTS,x 
                    lda      #SHOT_RADIUS4 
                    sta      SHOT_RADIUS,x 
                    ldd      #fourPlayerShotBehaviour     ; 
                    bra      chosenDone 

oneBullet 
                    ldy      scoopEnemy1 
                    beq      noScoop1_1 
; really an active scoopy?
 if  SCOOPY_TEST != 1 
                    ldu      BEHAVIOUR,y 
REPLACE_2_2_enemyPlayerControlledRightBehaviour_varFrom1_1 
                    cmpu     #0                           ;enemyPlayerControlledRightBehaviour 
                    bne      noScoop1_1 
 endif  
                    adda     #%0001 
noScoop1_1 
                    ldy      scoopEnemy2 
                    beq      noScoop2_1 
; really an active scoopy?
 if  SCOOPY_TEST != 1 
                    ldu      BEHAVIOUR,y 
REPLACE_2_2_enemyPlayerControlledLeftBehaviour_varFrom1_1 
                    cmpu     #0                           ;enemyPlayerControlledLeftBehaviour 
                    bne      noScoop2_1 
 endif  
                    adda     #%00010000 
noScoop2_1 
                    sta      SCOOP_SHOTS,x 
                    lda      #SHOT_RADIUS1 
                    sta      SHOT_RADIUS,x 
                    ldd      #onePlayerShotBehaviour 
                    bra      chosenDone 

twoBullet 
                    ldy      scoopEnemy1 
                    beq      noScoop1_2 
; really an active scoopy?
 if  SCOOPY_TEST != 1 
                    ldu      BEHAVIOUR,y 
REPLACE_2_2_enemyPlayerControlledRightBehaviour_varFrom1_2 
                    cmpu     #0                           ;enemyPlayerControlledRightBehaviour 
                    bne      noScoop1_2 
 endif  
                    adda     #%0010 
noScoop1_2 
                    ldy      scoopEnemy2 
                    beq      noScoop2_2 
; really an active scoopy?
 if  SCOOPY_TEST != 1 
                    ldu      BEHAVIOUR,y 
REPLACE_2_2_enemyPlayerControlledLeftBehaviour_varFrom1_2 
                    cmpu     #0                           ;enemyPlayerControlledLeftBehaviour 
                    bne      noScoop2_2 
 endif  
                    adda     #%00100000 
noScoop2_2 
                    sta      SCOOP_SHOTS,x 
                    lda      #SHOT_RADIUS2 
                    sta      SHOT_RADIUS,x 
                    ldd      #twoPlayerShotBehaviour 
                    bra      chosenDone 

threeBullet 
                    ldy      scoopEnemy1 
                    beq      noScoop1_3 
; really an active scoopy?
 if  SCOOPY_TEST != 1 
                    ldu      BEHAVIOUR,y 
REPLACE_2_2_enemyPlayerControlledRightBehaviour_varFrom1_3 
                    cmpu     #0                           ;enemyPlayerControlledRightBehaviour 
                    bne      noScoop1_3 
 endif  
                    adda     #%0011 
noScoop1_3 
                    ldy      scoopEnemy2 
                    beq      noScoop2_3 
; really an active scoopy?
 if  SCOOPY_TEST != 1 
                    ldu      BEHAVIOUR,y 
REPLACE_2_2_enemyPlayerControlledLeftBehaviour_varFrom1_3 
                    cmpu     #0                           ;enemyPlayerControlledLeftBehaviour 
                    bne      noScoop2_3 
 endif  
                    adda     #%00110000 
noScoop2_3 
                    sta      SCOOP_SHOTS,x 
                    lda      #SHOT_RADIUS3 
                    sta      SHOT_RADIUS,x 
                    ldd      #threePlayerShotBehaviour 
chosenDone 
                    std      BEHAVIOUR,x 
                    ldb      playerXpos 
                    lda      #SHOT_START_POSITION_Y       ; pos $80 is impossible for a shot! 
                    std      Y_POS,x                      ; save start pos 
                    clrb     
                    std      Y_POS16,x 
toManyShotsInAir 
spawnPlayerShot_end 
                    rts      

; scoopies stay at "4" shots
fiveBullet 
                    ldy      scoopEnemy1 
                    beq      noScoop1_5 
; really an active scoopy?
 if  SCOOPY_TEST != 1 
                    ldu      BEHAVIOUR,y 
REPLACE_2_2_enemyPlayerControlledRightBehaviour_varFrom1_4 
                    cmpu     #0                           ;enemyPlayerControlledRightBehaviour 
                    bne      noScoop1_5 
 endif  
                    adda     #%00000001                   ; five bullets counts as a "1" shot -> discard after hit 
noScoop1_5 
                    ldy      scoopEnemy2 
                    beq      noScoop2_5 
; really an active scoopy?
 if  SCOOPY_TEST != 1 
                    ldu      BEHAVIOUR,y 
REPLACE_2_2_enemyPlayerControlledLeftBehaviour_varFrom1_4 
                    cmpu     #0                           ;enemyPlayerControlledLeftBehaviour 
                    bne      noScoop2_5 
 endif  
                    adda     #%00010000                   ; five bullets counts as a "1" shot -> discard after hit 
noScoop2_5 
                    sta      SCOOP_SHOTS,x 
                    lda      #SHOT_RADIUS5 
                    sta      SHOT_RADIUS,x 
                    ldd      #fivePlayerShotBehaviour 
                    bra      chosenDone 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
lazerShot 
                    ldy      scoopEnemy1 
                    beq      noScoop1_6 
; really an active scoopy?
 if  SCOOPY_TEST != 1 
                    ldu      BEHAVIOUR,y 
REPLACE_2_2_enemyPlayerControlledRightBehaviour_varFrom1_5 
                    cmpu     #0                           ;enemyPlayerControlledRightBehaviour 
                    bne      noScoop1_6 
 endif  
                    adda     #%00000001                   ; lazer bullets counts as a "1" shot -> discard after hit 
noScoop1_6 
                    ldy      scoopEnemy2 
                    beq      noScoop2_6 
; really an active scoopy?
 if  SCOOPY_TEST != 1 
                    ldu      BEHAVIOUR,y 
REPLACE_2_2_enemyPlayerControlledLeftBehaviour_varFrom1_5 
                    cmpu     #0                           ;enemyPlayerControlledLeftBehaviour 
                    bne      noScoop2_6 
 endif  
                    adda     #%00010000                   ; lazer bullets counts as a "1" shot -> discard after hit 
noScoop2_6 
                    sta      SCOOP_SHOTS,x 
                    lda      #SHOT_RADIUS6 
                    sta      SHOT_RADIUS,x 
                    ldd      #lazerPlayerShotBehaviour 
                    std      BEHAVIOUR,x 
                    ldb      playerXpos 
                    lda      #SHOT_START_POSITION_Y       ; pos $80 is impossible for a shot! 
                    std      Y_POS,x                      ; save start pos 
                    clr      LAZER_WOBBLE,x 
                    lda      #10                          ; timer 10 - 10 rounds lazer -> 20 HP 
                    sta      LAZER_TIMER,x 
                    rts      

; 
; 
; this macro is placed at the end of each possible "remove" exit
; it stores the just removed object at the head of the "empty" list and 
; sets up its "next" pointer
UPDATE_EMPTY_PLAYERLIST  macro  
                    dec      playerShotCount 
                    ldy      playershotlist_empty_head    ; set u free, as new free head 
                    sty      NEXT_PLAYERSHOT_OBJECT,x     ; load to u the next linked list element 
                    stx      playershotlist_empty_head 
                    cmpx     testShot 
                    bne      wasNottestShot\? 
                    ldd      #0 
                    std      testShot 
wasNottestShot\? 
                    cmpx     test2Shot 
                    bne      wasNottestShot2\? 
                    ldd      #0 
                    std      test2Shot 
wasNottestShot2\? 
                    endm     
; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; called when player shot leaves the screen
;
; in ds+u_offset1 pointer to the object that must be removed
; destroys x, y 
; sets u to pointer of next object in linked list (might be the "return" structure)
; this version is called at the end of an explosion or at the
; end of a score display, called by "behaviours"
; and thus the "return" is the call of the next object thru U stack
removeLazerShot 
removeThisPlayerShotInMove                                ;#isfunction  
                    ldb      gameScale 
                    stB      VIA_t1_cnt_lo 
                    LDa      #$CC 
                    STA      VIA_cntl                     ;/BLANK low and /ZERO low 
                    ldd      #0 
                    std      <VIA_port_b 
;removeThisPlayerShot:                                     ;#isfunction  
                    leax     u_offset1,s                  ; x -> pointer object struture (correction of offset) 
                    cmpx     playershotlist_objects_head  ; is it the first? 
                    bne      was_not_first_re             ; no -> jump 
was_first_re 
                    lds      NEXT_PLAYERSHOT_OBJECT,x     ; s pointer to next objext 
                    sts      playershotlist_objects_head  ; the next object will be the first 
                    bra      lazerRemoveEnd 

was_not_first_re                                          ;        find previous, go thru all objects from first and look where "I" am the next... 
                    ldy      playershotlist_objects_head  ; start at list head 
try_next_re 
                    cmpx     NEXT_PLAYERSHOT_OBJECT,y     ; am I the next object of the current investigated list element 
                    beq      found_next_switch_re         ; jup -> jump 
                    ldy      NEXT_PLAYERSHOT_OBJECT,y     ; otherwise load the next as new current 
                    bra      try_next_re                  ; and search further 

found_next_switch_re 
                    lds      NEXT_PLAYERSHOT_OBJECT,x     ; we load "our" next object to s 
                    sts      NEXT_PLAYERSHOT_OBJECT,y     ; and store our next in the place of our previous next and thus eleminate ourselfs 
lazerRemoveEnd 
                    UPDATE_EMPTY_PLAYERLIST               ; if not last, than finish and restore empties 
                    MY_MOVE_TO_B_END  
                    puls     d,pc                         ; (D = y,x) 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
fourPlayerShotBehaviour                                   ;#isfunction  
                    MY_MOVE_TO_D_START  
; calc next position
                    ldd      Y_POS16+u_offset1,s          ; preload next user stack 
                    addd     playerShotSpeed 
                    bvs      removeThisPlayerShotInMove 
shot1Ok_4_n 
                    std      Y_POS16+u_offset1,s 
                    sta      Y_POS+u_offset1,s 
shot1PosDone_4_n 
;................
 if  SHIT 
                    _4_DRAW_PLAYER_SHOT_4  
 else  
                    DRAW_PLAYER_SHOT_4  
 endif  
entryOtherShotsContinue 
                    lda      SCOOP_SHOTS+u_offset1,s 
                    anda     #$f 
                    lbeq     noScoop1Shot4 
; draw scoop1
                    cmpa     #%00000100 
                    lbne     noFourShot4_1 
 if  SHIT 
                    _4_DRAW_PLAYER_SCOOP_RIGHT_4  
 else  
                    DRAW_PLAYER_SCOOP_RIGHT_4  
 endif  
                    jmp      scoop1Shot4Done 

noFourShot4_1 
                    cmpa     #%00000011 
 if  USE_NEW_SHOTS = 1 
                    bne      noThreeShot4_1 
 else  
                    lbne     noThreeShot4_1 
 endif  
                    DRAW_PLAYER_SCOOP_RIGHT_3  
                    jmp      scoop1Shot4Done 

noThreeShot4_1 
                    cmpa     #%00000010 
                    bne      noTwoShot4_1 
                    DRAW_PLAYER_SCOOP_RIGHT_2  
                    bra      scoop1Shot4Done 

noTwoShot4_1 
                    DRAW_PLAYER_SCOOP_RIGHT_1  
                    bra      scoop1Shot4Done 

scoop1Shot4Done 
noScoop1Shot4 
                    lda      SCOOP_SHOTS+u_offset1,s 
                    anda     #$f0 
                    lbeq     noScoop2Shot4 
                    cmpa     #%01000000 
 if  USE_NEW_SHOTS = 1 
                    bne      noFourShot4_2 
 else  
                    bne      noFourShot4_2 
 endif  
 if  SHIT 
                    _4_DRAW_PLAYER_SCOOP_LEFT_4  
 else  
                    DRAW_PLAYER_SCOOP_LEFT_4  
 endif  
                    jmp      scoop2Shot4Done 

noFourShot4_2 
                    cmpa     #%00110000 
                    bne      noThreeShot4_2 
                    DRAW_PLAYER_SCOOP_LEFT_3  
 if  USE_NEW_SHOTS = 1 
                    bra      scoop2Shot4Done 

 else  
                    jmp      scoop2Shot4Done 

 endif  
noThreeShot4_2 
                    cmpa     #%00100000 
                    bne      noTwoShot4_2 
                    DRAW_PLAYER_SCOOP_LEFT_2  
                    bra      scoop2Shot4Done 

noTwoShot4_2 
                    DRAW_PLAYER_SCOOP_LEFT_1  
                    bra      scoop2Shot4Done 

noScoop2Shot4 
scoop2Shot4Done 
;................
; cleanup and go to next shot
                    lds      NEXT_PLAYERSHOT_OBJECT+u_offset1,s ; preload next user stack 
scoop2Shot4DSLoadDone 
                    ldb      gameScale 
                    stB      VIA_t1_cnt_lo 
                    LDa      #$CC 
                    STA      VIA_cntl                     ;/BLANK low and /ZERO low 
                    ldd      #0 
                    std      <VIA_port_b 
                    puls     d,pc                         ; (D = y,x, pc = next object) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
threePlayerShotBehaviour                                  ;#isfunction  
                    MY_MOVE_TO_D_START  
; calc next position
                    ldd      Y_POS16+u_offset1,s          ; preload next user stack 
                    addd     playerShotSpeed 
                    lbvs     removeThisPlayerShotInMove 
shot1Ok_3_n 
                    std      Y_POS16+u_offset1,s 
                    sta      Y_POS+u_offset1,s 
shot1PosDone_3_n 
;................
                    DRAW_PLAYER_SHOT_3  
                    jmp      entryOtherShotsContinue 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
twoPlayerShotBehaviour                                    ;#isfunction  
                    MY_MOVE_TO_D_START  
; calc next position
                    ldd      Y_POS16+u_offset1,s          ; preload next user stack 
                    addd     playerShotSpeed 
                    lbvs     removeThisPlayerShotInMove 
shot1Ok_2_n 
                    std      Y_POS16+u_offset1,s 
                    sta      Y_POS+u_offset1,s 
shot1PosDone_2_n 
;................
                    DRAW_PLAYER_SHOT_2  
                    jmp      entryOtherShotsContinue 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
onePlayerShotBehaviour                                    ;#isfunction  
                    MY_MOVE_TO_D_START  
; calc next position
                    ldd      Y_POS16+u_offset1,s          ; preload next user stack 
                    addd     playerShotSpeed 
                    lbvs     removeThisPlayerShotInMove 
shot1Ok_1_n 
                    std      Y_POS16+u_offset1,s 
                    sta      Y_POS+u_offset1,s 
shot1PosDone_1_n 
;................
                    DRAW_PLAYER_SHOT_1  
                    jmp      entryOtherShotsContinue 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
zeroPlayerShotBehaviour                                   ;#isfunction  
                    MY_MOVE_TO_D_START  
; calc next position
                    ldd      Y_POS16+u_offset1,s          ; preload next user stack 
                    addd     playerShotSpeed 
                    lbvs     removeThisPlayerShotInMove 
shot1Ok_0_n 
                    std      Y_POS16+u_offset1,s 
                    sta      Y_POS+u_offset1,s 
shot1PosDone_0_n 
;................
 if  SHIT = 1 
; in case this is WAS a four shot, we have to setup registers for the 4 shot scoopies -> other wise CRASH
                    ldx      #1*256+0                     ;lo(-_4_PLAYER_SHOT_LENGTH) 
                    ldu      #1*256+lo(_4_PLAYER_SHOT_LENGTH) 
                    ldy      #1*256+lo(-_4_PLAYER_SHOT_LENGTH_32) 
 endif  
                    DRAW_PLAYER_SHOT_0  
                    jmp      entryOtherShotsContinue 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
fivePlayerShotBehaviour                                   ;#isfunction  
                    MY_MOVE_TO_D_START  
; calc next position
                    ldd      Y_POS16+u_offset1,s          ; preload next user stack 
                    addd     playerShotSpeed 
                    lbvs     removeThisPlayerShotInMove 
shot1Ok_5_n 
                    std      Y_POS16+u_offset1,s 
                    sta      Y_POS+u_offset1,s 
shot1PosDone_5_n 
;................
                    tst      SHOT_RADIUS+u_offset1,s 
                    bne      doDrawShaot5 
                    ldb      #SCALE_PLAYER_SHOT 
                    stb      VIA_t1_cnt_lo 
                    MY_MOVE_TO_B_END  
                    bra      doDrawShaot5Done 

doDrawShaot5 
                    DRAW_PLAYER_SHOT_5  
doDrawShaot5Done 
                    lda      SCOOP_SHOTS+u_offset1,s 
                    anda     #$f 
                    beq      scoop1Shot5Done 
                    DRAW_PLAYER_SCOOP_RIGHT_5  
scoop1Shot5Done 
                    lda      SCOOP_SHOTS+u_offset1,s 
                    anda     #$f0 
                    lbeq     scoop2Shot4Done 
                    DRAW_PLAYER_SCOOP_LEFT_5  
scoop2Shot5Done 
                    jmp      scoop2Shot4Done 

;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
lazerPlayerShotBehaviour                                  ;#isfunction  
                    lda      #SHOT_START_POSITION_Y       ; lazer always start at the bottom 
                    MY_MOVE_TO_D_START  
; calc next position
                    lda      playerXpos 
                    sta      X_POS+u_offset1,s 
                    lda      diverseFlags 
                    anda     #BIT_FLAG_AUTOFIRE 
                    beq      doTimerReduce 
                    ldb      current_button_state 
                    andb     #3 
                    CMPB     #%00000011                   ; pressed, this and last time -> cont pressed 
                    bne      doTimerReduce 
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #6                           ; laser 
                    beq      contNoTimeReduce 
                    jmp      removeLazerShot 

doTimerReduce 
                    dec      LAZER_TIMER+u_offset1,s 
                    lbeq     removeLazerShot 
LAZER_WOBBLE_STRENGTH  =     2 
contNoTimeReduce 
                    ldb      gameScale 
                    decb     
                    addb     gameScale 
; watch out, double game scale might wrap to small numbers!
; that would be a very short laser!
; still - we take the "largest" 8 bit we can
                    cmpb     #$80 
                    bhi      t1SeemsOk 
                    ldb      #$ff 
t1SeemsOk 
                    stb      VIA_t1_cnt_lo 
                    ldb      LAZER_WOBBLE+u_offset1,s 
                    incb     
                    cmpb     #LAZER_WOBBLE_STRENGTH 
                    ble      lazerSpreadsmall 
                    ldb      #-LAZER_WOBBLE_STRENGTH 
lazerSpreadsmall 
                    stb      LAZER_WOBBLE+u_offset1,s 
                    MY_MOVE_TO_A_END  
                    lda      laserLowestY 
                    adda     #$80 
                    lsra     
                    suba     #10                          ; otherwise laser always above enemey 
                    STA      <VIA_port_a                  ;Send Y to A/D 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    clra     
                    sta      <VIA_port_b                  ;Enable mux 
                    inca     
                    sta      <VIA_port_b                  ;Disable mux 
 else  
                    clr      <VIA_port_b                  ;Enable mux 
                    INC      <VIA_port_b                  ;Disable mux 
 endif  
                    STB      <VIA_port_a                  ;Send X to A/D 
                    lda      #-1 
                    clr      <VIA_t1_cnt_hi               ;Clear T1H 
                    sta      <VIA_shift_reg               ;Store pattern in shift register 
                    LDB      #$40                         ; 
waitNotDoneLazer1 
                    BITB     <VIA_int_flags               ; 
                    beq      waitNotDoneLazer1 
waitDoneLazer1 
                    clr      <VIA_shift_reg               ;Store pattern in shift register 
                    _ZERO_VECTOR_BEAM  
                    lda      SCOOP_SHOTS+u_offset1,s 
                    anda     #$f 
                    lbeq     scoop1Shot6Done 
                    ldd      scoopEnemy1 
                    cmpd     #01 
                    bhi      scoop1Shot6Ok                ; break laser 
                    lda      SCOOP_SHOTS+u_offset1,s 
                    anda     #$f0 
                    sta      SCOOP_SHOTS+u_offset1,s 
                    jmp      scoop1Shot6Done              ; break laser 

scoop1Shot6Ok 
; anti laser cranky
                    lda      #-50 
                    STA      <VIA_port_a                  ;Send Y to A/D 
                    clrb     
                    STb      <VIA_port_b 
                    incb     
                    STb      <VIA_port_b 
                    ldb      gameScale 
                    stb      VIA_t1_cnt_lo 
                    lda      #SHOT_START_POSITION_Y       ; lazer always start at the bottom 
                    ldb      playerXpos 
                    MY_MOVE_TO_D_START  
                    DRAW_PLAYER_SCOOP_RIGHT_6  
                    _ZERO_VECTOR_BEAM  
scoop1Shot6Done 
                    lda      SCOOP_SHOTS+u_offset1,s 
                    anda     #$f0 
                    lbeq     scoop2Shot4Done 
                    ldd      scoopEnemy2 
                    cmpd     #01 
                    bhi      scoop2Shot6Ok                ; break laser 
                    lda      SCOOP_SHOTS+u_offset1,s 
                    anda     #$0f 
                    sta      SCOOP_SHOTS+u_offset1,s 
                    jmp      scoop2Shot4Done              ; break laser 

scoop2Shot6Ok 
; anti laser cranky
                    lda      #-50 
                    STA      <VIA_port_a                  ;Send Y to A/D 
                    clrb     
                    STb      <VIA_port_b 
                    incb     
                    STb      <VIA_port_b 
                    ldb      gameScale 
                    stb      VIA_t1_cnt_lo 
                    lda      #SHOT_START_POSITION_Y       ; lazer always start at the bottom 
                    ldb      playerXpos 
                    MY_MOVE_TO_D_START  
                    DRAW_PLAYER_SCOOP_LEFT_6  
                    _ZERO_VECTOR_BEAM  
scoop2Shot6Done 
                    jmp      scoop2Shot4Done 
