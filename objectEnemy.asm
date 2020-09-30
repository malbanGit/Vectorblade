; Bakn 3
; COL DETECT macros use about 3,5kB
SCOOP_RADIUS_Y      =        60 
SCOOP_RADIUS_X      =        30 
PLAYER_RADIUS_X     =        15 
PLAYER_RADIUS_Y     =        22 
; using a conditional + include
; I can reuse the colision detection for both bugs and "normal" enemies!
; actually it is not the reuse I am keen on - but rather to have
; the collision detection in a singular place
                    include  "enemyShotColDetect.asm"
;
; collision detection player shot -> enemy
; only one shot is tested per game round
; two shots
; main must ensure the two to be tested shots are "halfway"
COL_DETECT_2A       macro    
                    COL_DETECT_ENEMY_SHOTS_ENEMY  testShot, Y_POS, X_POS, 1 
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
COL_DETECT_2B       macro    
                    COL_DETECT_ENEMY_SHOTS_ENEMY  test2Shot, Y_POS, X_POS, 0 
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
COL_DETECT_PLAYER_BASE  macro  YBASE, XBASE 
                    lda      YBASE +u_offset1,s 
                    ldb      playerBonusActive 
                    bitb     #BITFIELD_SCOOP 
                    lbne     doScoopCheck\? 
isBugEnemy\? 
                    cmpa     #$80+PLAYER_RADIUS_Y 
                    lbgt     notHit\? 
                    ldb      XBASE +u_offset1,s 
                    subb     playerXpos 
                    bpl      noNeg\? 
                    negb     
noNeg\? 
                    cmpb     #PLAYER_RADIUS_X 
                    bhi      notHit_x\? 
                    lda      playerBonusActive 
                    bita     #BITFIELD_SHIELD             ; shield saved player (from all shots) 
                    bne      notHit_Shot_removeEnemy\? 
                    bita     #BITFIELD_ARMOR 
                    lbeq     playerCaughtShot\?           ; armor saved player for one shot 
                    anda     #255-BITFIELD_ARMOR 
                    sta      playerBonusActive 
                    SWITCH_TO_SHORT_SHIELD  
 if  SHORT_INVULNERABILITY 
                    bra      notHit_Shot_removeEnemy\? 

 endif  
notHit_Shot_removeEnemy\? 
                    lda      #2 
                    sta      explosionSound 
; set HP = 0
; if enemy collides with player -> it is dead!
; or explode directly :-)
                    jmp      yesExplodeEnemy              ; shotHandleDoneRemoved 

notHit_x\? 
 if  SCOOPIE_DONT_DIE = 1 
                    jmp      notHit\? 

 else  
                    lda      lockPurchased 
                    anda     #%00100000 
                    bne      notHit\? 
 endif  
; check scoop collision
                    lda      difficulty 
                    anda     #$f                          ; 
                    beq      notHit\?                     ; easy difficulty -> scoops are not hit by enemies/debris 
; in b "radius" from player center (ABS)
                    cmpb     #SCOOP_RADIUS_X 
                    bhi      notHit\? 
; possible scoop hit, check if scoop exists
; check for left or right
                    ldb      XBASE +u_offset1,s 
                    subb     playerXpos 
                    bvs      notHit\?                     ; added to ensure leftmost debris does not collide with right most scoopies 
                    bpl      checkRightScoop\? 
checkLeftScoop\? 
                    ldx      scoopEnemy2 
                    beq      notHit\?                     ; there is no scoopy! 
; left scoopy hit -> explode !
                    ldd      #0 
                    std      scoopEnemy2 
scoopyHit\? 
                    lda      #2 
                    sta      explosionSound 
                    inc      enemyCount                   ; because after explosion, the remove enemy - does again a "dec enemy count" this would screw the counting 
                                                          ; since scoopies were removed before! 
                    lda      #-1 
                    sta      ALL_PURPOSE ,x               ; negative means this enemy is an explosion 
                    ldd      #enemyExplosionBehaviour 
                    std      BEHAVIOUR ,x                 ; negative means this enemy is an explosion 
                    clr      ANIM_POSITION ,x 
                    ldy      ENEMY_STRUCT ,x 
                    ldy      WAIT_ANIM_TABLE, y 
                    ldy      ,y 
                    sty      SMARTLIST_ORG ,x 
                    ldd      #$7f09                       ; scale 
                    stb      EXPLOSION_SCALE ,x 
                                                          ;lda #$7f ; intensity 
                    sta      EXPLOSION_INTENSITY ,x 
                    bra      notHit\? 

checkRightScoop\? 
                    ldx      scoopEnemy1 
                    beq      notHit\?                     ; there is no scoopy! 
; right scoopy hit -> explode !
                    ldd      #0 
                    std      scoopEnemy1 
                    bra      scoopyHit\? 

doScoopCheck\? 
                    cmpa     #$80+SCOOP_RADIUS_Y 
                    bgt      notHit\? 
                    ldb      X_POS +u_offset1,s 
                    subb     playerXpos 
                    bpl      noNeg2\? 
                    negb     
noNeg2\? 
                    cmpb     #SCOOP_RADIUS_X 
                    bhi      notHit\? 
                    ldx      ENEMY_STRUCT+u_offset1,s 
                    ldx      ANGLE8_TABLE,x 
                    lbeq     isBugEnemy\? 
; or scoop it
                    jmp      repellEnemy 

playerCaughtShot\? 
                    lda      #1                           ; TODO strength of enemy bullet 
                    sta      playerWasHitFor 
notHit\? 
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
COL_DETECT_PLAYER   macro    
                    COL_DETECT_PLAYER_BASE  Y_POS, X_POS 
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
_COL_DETECT         macro    
                    COL_DETECT_2A  
                    ldb      X_POS +u_offset1,s 
                    COL_DETECT_2B  
                    COL_DETECT_PLAYER  
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
TEST_TO_SHOOT       macro    
                    ldd      bulletSpawnAt                ; only one shot possible per round 
                    bne      noBulletSpawn\? 
 if  ENEMY_NO_SHOOTING = 1 
                    bra      noBulletSpawn\? 

 endif  
                    lda      shotCount 
                    ldx      currentLevelPointer 
                    cmpa     levelMaxEnemyShots 
                    bhs      noBulletSpawn\? 
                    lda      BIT_MASK+u_offset1,s         ; do not shoot again in xx rounds 
                    anda     #$07                         ; only lower nibble BIT_MASK+u_offset1,s 
                    beq      try_shot\? 
                    dec      BIT_MASK+u_offset1,s 
                    bra      noBulletSpawn\? 

try_shot\? 
                    ldd      BEHAVIOUR+u_offset1,s        ; in waiting shots might not be allowed 
                    cmpd     #enemyWaitingBehaviour 
                    bne      shotseeminglyOk\? 
                    ldx      currentLevelPointer 
                    lda      LEVEL_TYPE,x 
                    bita     #LEVEL_TYPE_DONT_SHOOT_WHILE_WAITING 
                    bne      noBulletSpawn\? 
                    RANDOM_A  
                    asla                                  ; waiting has double chance to not initate bullet 
                    cmpa     levelBulletBorder 
                    bls      doBullet\? 
                    bra      noBulletSpawn\? 

shotseeminglyOk\? 
                    RANDOM_A  
                    cmpa     levelBulletBorder 
                    bhi      noBulletSpawn\? 
doBullet\? 
                    ldx      ENEMY_STRUCT+u_offset1,s 
                    lda      ADDITIONAL_TYPE_INFO,x       ; 
                    anda     #TYPE_DONT_SHOOT 
                    bne      noBulletSpawn\? 
                    lda      #$07                         ; bullet delay for enemy = 15 rounds 
                    ora      BIT_MASK+u_offset1,s 
                    sta      BIT_MASK+u_offset1,s 
                    ldd      Y_POS +u_offset1,s 
                    std      bulletSpawnAt 
                    ldb      ENEMY_BULLET_SPEED,x 
                    stb      shotSpeed 
noBulletSpawn\? 
                    endm     
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
END_ENEMY_DISPLAY   macro    
                    lda      ALL_PURPOSE +u_offset1,s 
                    beq      normalEndMacro\? 
                    cmpa     #HIT_FLASH_LENGTH 
                    bgt      normalEndMacro2\? 
                    inc      lightningOn 
                    dec      ALL_PURPOSE +u_offset1,s 
                    lds      NEXT_ENEMY_OBJECT+u_offset1,s ; preload next user stack 
                    lda      #$7f 
                    MY_MOVE_TO_B_END  
                    _INTENSITY_A  
                    bra      out\? 

normalEndMacro\? 
                    tst      lightningOn 
                    beq      normalEndMacro2\? 
                    clr      lightningOn 
                    lds      NEXT_ENEMY_OBJECT+u_offset1,s ; preload next user stack 
                    lda      #DEFAULT_ENEMY_INTENSITY 
                    MY_MOVE_TO_B_END  
                    _INTENSITY_A  
                    bra      out\? 

normalEndMacro2\? 
                    lds      NEXT_ENEMY_OBJECT+u_offset1,s ; preload next user stack 
                    MY_MOVE_TO_A_END  
out\? 
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
TEST_FOR_CLONE      macro    
                    lda      ADDITIONAL_TYPE_INFO,u       ; 
                    anda     #TYPE_CAN_CLONE 
                    lbeq     macroEnd\? 
                    ldu      currentLevelPointer 
                    lda      LEVEL_TYPE,u 
                    cmpa     #LEVEL_TYPE_BIGGY 
                    beq      macroEnd\? 
                    lda      enemyCount 
                    cmpa     #CLONE_MAX_ENEMY_DISPLAYED 
                    bhi      macroEnd\? 
; start cloning
; basically spawn
; can't jsr here - cause we occupied the Stack register
                    ldu      ENEMY_STRUCT+u_offset1,s 
                    lda      CLONE_INFO, u 
                    anda     #%00111111 
                    sta      tmp4_tmp                     ; delay between clones 
                    sta      tmp2_tmp 
                    lda      CLONE_INFO, u 
                    lsra     
                    lsra     
                    lsra     
                    lsra     
                    lsra     
                    lsra     
                    inca     
                    sta      tmp1_tmp                     ; number of clones 
anotherClone\? 
                    ldu      enemylist_empty_head 
                    cmpu     #OBJECT_LIST_COMPARE_ADDRESS 
                    bls      macroEnd\?                   ; set the new empty head 
                    ldd      NEXT_ENEMY_OBJECT,u          ; the next in out empty list will be the new 
                    std      enemylist_empty_head         ; head of our empty list 
                    ldd      enemylist_objects_head 
                    std      NEXT_ENEMY_OBJECT,u 
                    stu      enemylist_objects_head 
                    inc      enemyCount                   ; and remember that we created a new object 
                    inc      realEnemyCount 
; copy this enemy
                    ldd      Y_POS+u_offset1,s 
                    std      Y_POS,u 
                    ldd      Y_POS16+u_offset1,s 
                    std      Y_POS16,u 
                    ldd      X_POS16+u_offset1,s 
                    std      X_POS16,u 
                    ldd      SUB_PATTERN+u_offset1,s 
                    std      SUB_PATTERN,u 
                    lda      ANGLE_HOMEFLIGHT+u_offset1,s 
                    sta      ANGLE_HOMEFLIGHT,u 
                    ldd      MY_PATTERN+u_offset1,s 
                    std      MY_PATTERN,u 
                    ldd      PATTERN_POSITION+u_offset1,s 
                    std      PATTERN_POSITION,u 
                    ldd      ALL_PURPOSE+u_offset1,s 
                    std      ALL_PURPOSE,u 
                    ldd      ENEMY_STRUCT+u_offset1,s 
                    std      ENEMY_STRUCT,u 
; clone delay
                    inc      attackPatternCount           ; correct attack pattern count -> clone is also attacking! 
                    lda      tmp2_tmp 
                    sta      ALL_PURPOSE,u                ; delay between clones 
                    adda     tmp4_tmp                     ; is increased between each clone 
                    sta      tmp2_tmp 
                    ldd      BEHAVIOUR+u_offset1,s        ; get the next behavoiur and store it "somewhere" 
                    std      PATTERN_POSITION,u           ; pattern positions will allways be 0, position will be set to ff 
; set clone behaviour
                    ldd      #clonedBehaviour             ; just waits - than starts exactly as clone 
                    std      BEHAVIOUR,u 
                    dec      tmp1_tmp 
                    bne      anotherClone\? 
macroEnd\? 
                    endm     
;***************************************************************************
;    
; in x correct pattern position in pattern list
; macro is always exited with a jump to some place else (outside macro)
; the pattern line x is pointing to is check for pattern
; a) relative pattern (+ subpatterns)
; b) absolut pattern
; c) relative pattern
; d) jump to other pattern
; e end of pattern list
LOAD_NEXT_PATTERN   macro    IS_CLONING 
macroStart\? 
                    lda      SINGLE_ATTACK_PATTERN_TYPE,x 
;SINGLE_ATTACK_RELATIVE_PATTERN  =  0                      ; relative means - it uses the current address of the enemy as start 
;SINGLE_ATTACK_TARGET_ENEMY_PATTERN  =  1                  ; TARGET - uses somehow the players coordinate as coordinate info 
;SINGLE_ATTACK_ABSOLUT_PATTERN  =  2                      ; moves from current position to an absolut screen position 
;SINGLE_ATTACK_JUMP = 3
                    lbeq     doRelativePattern\? 
                    cmpa     #SINGLE_ATTACK_TARGET_ENEMY_PATTERN 
                    lbeq     doTargetPattern\? 
                    cmpa     #SINGLE_ATTACK_ABSOLUT_PATTERN 
                    beq      doAbsolutPattern\? 
; else jump
                    lda      SINGLE_ATTACK_PATTERN_NEXT_NO,x 
                    ldx      SINGLE_ATTACK_PATTERN_POINTER,x 
                    stx      MY_PATTERN+u_offset1,s 
                    sta      PATTERN_POSITION+u_offset1,s ; 
                    clr      SUB_PATTERN_POSITION+u_offset1,s 
                    bra      macroStart\? 

doAbsolutPattern\? 
                    ldd      #enemySingleAttackAbsolutBehaviour 
                    std      BEHAVIOUR+u_offset1,s 
                    lda      SINGLE_ATTACK_SPEED,x        ; speed 
                    sta      ANGLE_HOMEFLIGHT+u_offset1,s 
                    ldd      2,x                          ; second word in attack pattern are target coordinate 
targetPatternCont\? 
                    std      TARGET_ABSOLUT_Y+u_offset1,s 
; get delta of now and target
; divide coordinates by half for angle test
; otherwise we overflow 2 complements
                    asra     
                    asrb     
                    std      _tmpY 
                    ldd      Y_POS+u_offset1,s 
                    asra     
                    asrb     
                    nega     
                    negb     
                    adda     _tmpY 
                    addb     _tmpX 
                                                          ; std _tmpY 
; in tmp half of the delta value between target and current pos
; NEW: (angles now between 0-7, not 0 to 20)
; in d is delta
; if y < 0 than angle from 5 to 15
; if y > 0-5 and 15-20
; if x > 0 than angle between 0-10
; if x < 0 than angle between 10 -20
; if x == 0 angle = 5 or 15
; if y == 0 angle = 0 or 10
; if y abs == y abs than angle in the middle of ranges (2.5, 7.5, 12.5, 17.5)
                    tsta     
                    bmi      yIsNeg\? 
                    tstb     
                    bmi      yIsPosxIsNeg\? 
                    beq      yIsPosxIsNull\? 
yIsPosxIsPos\? 
                    tsta     
                    bne      yNotNull1\? 
                    lda      #2 
                    bra      angleDone\? 

yNotNull1\? 
                    lda      #1 
                    bra      angleDone\? 

yIsPosxIsNull\? 
                    lda      #0 
                    bra      angleDone\? 

yIsPosxIsNeg\? 
                    tsta     
                    bne      yNotNull2\? 
                    lda      #6 
                    bra      angleDone\? 

yNotNull2\? 
                    lda      #7 
                    bra      angleDone\? 

yIsNeg\? 
                    tstb     
                    beq      yIsNegxIsNull\? 
                    bmi      yIsNegxIsNeg\? 
yIsNegxIsPos\? 
                    lda      #3 
                    bra      angleDone\? 

yIsNegxIsNeg\? 
                    lda      #5 
                    bra      angleDone\? 

yIsNegxIsNull\? 
                    lda      #4 
                    bra      angleDone\? 

angleDone\? 
; keep speed
                    lsla                                  ; lower 3 bits are speed 
                    lsla                                  ; angle is 0 - 7 (must be doubled) 
                    lsla     
                    ldb      ANGLE_HOMEFLIGHT+u_offset1,s 
                    andb     #%00000111 
                    stb      ANGLE_HOMEFLIGHT+u_offset1,s 
                    ora      ANGLE_HOMEFLIGHT+u_offset1,s 
                    sta      ANGLE_HOMEFLIGHT+u_offset1,s 
 if  IS_CLONING = 1 
                    TEST_FOR_CLONE  
 endif  
                    jmp      notThereYetPosition_ab       ; jump out of macro 

doTargetPattern\? 
; same as absolut - but target is current fighter position
                    ldd      #enemySingleAttackAbsolutBehaviour 
                    std      BEHAVIOUR+u_offset1,s 
                    lda      SINGLE_ATTACK_SPEED,x        ; speed 
                    sta      ANGLE_HOMEFLIGHT+u_offset1,s 
                    ldb      playerXpos 
                    lda      #$80 
                    jmp      targetPatternCont\? 

doRelativePattern\? 
; that this is a relative pattern "SINGLE_ATTACK_RELATIVE_PATTERN"
; but checks must consider it may be otherwise!
                    ldd      #enemySingleAttackRelativeBehaviour 
                    std      BEHAVIOUR+u_offset1,s 
                    ldx      2,x                          ; second word in attack pattern is the first sub pattern 
                    lbeq     outOfPattern                 ; dw 0,0 = end of pattern, leave macro and enter delay! 
                    stx      SUB_PATTERN+u_offset1,s 
; in x pointer to sub pattern
                                                          ; Y_POS 
                                                          ; X_POS will be out target coordinates in this behaviour 
                                                          ; costs cylces - > but I don't have more RAM 
; set 16 bit pos to same as 8 bit pos
; due to wobble this is not kept the same when in 
; waiting position
                    clr      RELATIVE_LO_Y+u_offset1,s 
                    clr      RELATIVE_LO_X+u_offset1,s 
                    ldd      P_YPOS,x 
                    adda     Y_POS+u_offset1,s 
                    sta      TARGET_RELATIVE_Y+u_offset1,s 
                    addb     X_POS+u_offset1,s 
                    stb      TARGET_RELATIVE_X+u_offset1,s 
 if  IS_CLONING = 1 
                    TEST_FOR_CLONE  
 endif  
                    jmp      thisPatternNotDone_srp       ; jump into relative behaviour 

                    endm     
;***************************************************************************
;    
; exactly the same as above except TEST_FOR_CLONE macro
; cloning is only initiated when waiting -> attack is done
LOAD_NEXT_PATTERN_START  macro  
                    LOAD_NEXT_PATTERN  1 
                    endm     
;***************************************************************************
; this is actually a JSR RTS
; without using stack
; PC-return address is kept in U
shotBehaviourStandardStart 
                    COL_DETECT_PLAYER  
shotBehaviourStandardStartNoBase 
shotBehaviourStandardnoAdditional 
                                                          ; if no of enemies < threshold -> test all shots 
 if  TEST_ALL_SHOTS = 1 
                    ldb      realEnemyCount               ;enemyCount d 
                    cmpb     #ENEMY_THRESHOLD 
                    lble     testAllShots 
 endif  
dontCheckAllAfterAll 
                    ldb      X_POS +u_offset1,s 
                    COL_DETECT_2A  
                    ldb      X_POS +u_offset1,s 
                    COL_DETECT_2B  
shotBehaviourStandardTestShootingOnly 
                    TEST_TO_SHOOT  
shotBehaviourStandardStartNoCol 
                    lda      #OBJECT_SCALE 
                    sta      VIA_t1_cnt_lo 
                    jmp      ,u 

 if  TEST_ALL_SHOTS = 1 
testAllShots 
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #6                           ; laser 
                    lbeq     dontCheckAllAfterAll 
;; biggies col detection don't do well with
; normal eneies "all check"
; since test shot is often reset!
                    lda      diverseFlags 
                    anda     #BIT_BIG_ENEMY_IN_PLAY 
                    lbne     dontCheckAllAfterAll 
                    check    for bugs 
                    save     testShots 
                    restore  testshots 
                    ldd      testShot 
                    std      laserEnemyPointerRight       ; tmp location 
                    COL_DETECT_ALL  
; what happens if this shot was removed? and another enemy appears? 
; test if testShot DID collision, than take "head"
; if empry do not init!
; nothing should go awry if ye just "clear them
;LASER?
                    ldd      #0 
                    std      testShot 
                    std      test2Shot 
;                    ldx      laserEnemyPointerRight 
;                    JUST_INIT_SHOT_TEST  testShot 
                    jmp      shotBehaviourStandardTestShootingOnly 

 endif  
;***************************************************************************
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; new list object to U
; destroys d, u 
; ensures scoopiesa are always first 
newEnemyObject                                            ;#isfunction  
                    ldu      enemylist_empty_head 
tryNextEO 
                    cmpu     #OBJECT_LIST_COMPARE_ADDRESS 
                    bls      cs_done_no 
                    inc      realEnemyCount 
                    inc      enemyCount                   ; and remember that we created a new object 
                                                          ; set the new empty head 
                    ldd      NEXT_ENEMY_OBJECT,u          ; the next in out empty list will be the new 
                    std      enemylist_empty_head         ; head of our empty list 
; the old head is always our next
                    pshs     y 
                    ldy      enemylist_objects_head 
                    ldd      BEHAVIOUR,y 
                    cmpd     #enemyPlayerControlledLeftBehaviour 
                    bne      noLefty 
                    pshs     x 
                    ldx      NEXT_ENEMY_OBJECT,y 
                    ldd      BEHAVIOUR,x 
                    cmpd     #enemyPlayerControlledRightBehaviour 
                    beq      leftyIsRight 
                    stu      NEXT_ENEMY_OBJECT,y 
                    stx      NEXT_ENEMY_OBJECT,u 
                    puls     x,y,pc 
leftyIsRight 
                    ldy      NEXT_ENEMY_OBJECT,x 
                    stu      NEXT_ENEMY_OBJECT,x          ; diffi 
                    sty      NEXT_ENEMY_OBJECT,u 
                    puls     x,y,pc 
noLefty 
                    cmpd     #enemyPlayerControlledRightBehaviour 
                    bne      noRighty 
                    pshs     x 
                    ldx      NEXT_ENEMY_OBJECT,y 
                    ldd      BEHAVIOUR,x 
                    cmpd     #enemyPlayerControlledLeftBehaviour 
                    beq      leftyIsRight 
                    stu      NEXT_ENEMY_OBJECT,y 
                    stx      NEXT_ENEMY_OBJECT,u 
                    puls     x,y,pc 
noRighty 
                    sty      NEXT_ENEMY_OBJECT,u 
; newobject is always head
                    stu      enemylist_objects_head 
                    puls     y,pc 
cs_done_no 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; leaves with Z flag 
; BEQ no spawn
; BNE spawn Ok
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
spawnEnemy                                                ;        #isfunction 
                    bsr      newEnemyObject               ; "create" (or rather get) new object 
                    cmpu     #OBJECT_LIST_COMPARE_ADDRESS 
                    bls      spawnEnemy_end 
                    ldd      #enemySimpleBehaviour 
                    std      BEHAVIOUR,u 
                    rts      

spawnEnemy_end 
                    ldu      #0 
                    rts      

;
;
; this macro is placed at the end of each possible "remove" exit
; it stores the just removed object at the head of the "empty" list and 
; sets up its "next" pointer
UPDATE_EMPTY_ENEMYLIST  macro  
                    dec      enemyCount 
                    dec      realEnemyCount 
                    ldy      enemylist_empty_head         ; set u free, as new free head 
                    sty      NEXT_ENEMY_OBJECT,x          ; load to u the next linked list element 
                    stx      enemylist_empty_head 
                    endm     
;
destroyEnemyObject                                        ;#isfunction  
; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; in ds+u_offset1 pointer to the object that must be removed
; destroys x, y 
; puls from ds the next object behaviour
; 
; this version is called at the end of an explosion called by "behaviours"
;
                    leax     u_offset1,s                  ; x -> pointer object struture (correction of offset) 
                    cmpx     enemylist_objects_head       ; is it the first? 
                    bne      was_not_first_enem           ; no -> jump 
was_first_enem 
                    lds      NEXT_ENEMY_OBJECT,x          ; s pointer to next objext 
                    sts      enemylist_objects_head       ; the next object will be the first 
                    bra      enemyRemoveDone 

was_not_first_enem                                        ;        find previous, go thru all objects from first and look where "I" am the next... 
                    ldy      enemylist_objects_head       ; start at list head 
try_next_enem 
                    cmpx     NEXT_ENEMY_OBJECT,y          ; am I the next object of the current investigated list element 
                    beq      found_next_switch_enem       ; jup -> jump 
                    ldy      NEXT_ENEMY_OBJECT,y          ; otherwise load the next as new current 
                    bra      try_next_enem                ; and search further 

found_next_switch_enem 
                    lds      NEXT_ENEMY_OBJECT,x          ; we load "our" next object to s 
                    sts      NEXT_ENEMY_OBJECT,y          ; and store our next in the place of our previous next and thus eleminate ourselfs 
enemyRemoveDone 
                    UPDATE_EMPTY_ENEMYLIST                ; and clean up the empties 
; do a clean ending - which is usually done at the end of "SmartDraw"
                    ldb      gameScale 
                    LDa      #$CC 
                    STA      VIA_cntl                     ;/BLANK low and /ZERO low 
                    stB      VIA_t1_cnt_lo 
                    clra     
                    sta      <VIA_port_a 
                    sta      <VIA_port_b 
                    MY_MOVE_TO_A_END  
                    puls     d,pc                         ; (D = y,x, X = vectorlist) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
enemyExplosionBehaviour                                   ;#isfunction  
                    MY_MOVE_TO_D_START  
explosionBevaiourEntryFromShotTest 
                    ldu      SMARTLIST_ORG +u_offset1,s 
                    lda      EXPLOSION_SCALE+u_offset1,s 
                    adda     #2 
                    cmpa     #EXPLOSION_MAX_SCALE 
                    bhs      destroyEnemyObject 
                    sta      EXPLOSION_SCALE +u_offset1,s 
                    sta      VIA_t1_cnt_lo 
                    lda      EXPLOSION_INTENSITY +u_offset1,s 
                    suba     #10 
                    sta      EXPLOSION_INTENSITY +u_offset1,s 
                    lds      NEXT_ENEMY_OBJECT+u_offset1,s ; preload next user stack 
                    inc      lightningOn 
                    MY_MOVE_TO_B_END  
                    _INTENSITY_A  
                    clra     
                    pulu     b,x,pc 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; not used 
; just statically displays an enemy on it position
enemySimpleBehaviour 
enemySingleAttackAbsolutBehaviour                         ;#isfunction  
                    MY_MOVE_TO_D_START  
                    ldu      #back1Shot 
                    jmp      shotBehaviourStandardStart 

back1Shot 
                    ldd      TARGET_ABSOLUT_Y+u_offset1,s ; target y, x position in d 
; target y position is always smaller since we start at the top of the screen
                    cmpa     Y_POS+u_offset1,s 
                    beq      yIsCorrectPosition_ab 
                    bgt      increaseYPos 
; load speed
                    ldb      ANGLE_HOMEFLIGHT+u_offset1,s 
                    andb     #%00000111 
decAgain1 
                    cmpa     Y_POS+u_offset1,s            ; double check postions because of speed > 1 
                    beq      yIsCorrectPosition_ab        ; otherwise a BEQmight miss the target 
                    dec      Y_POS+u_offset1,s 
                    decb     
                    bne      decAgain1 
                    bra      yDoneB_ab 

increaseYPos 
                    ldb      ANGLE_HOMEFLIGHT+u_offset1,s 
                    andb     #%00000111 
; load speed
incAgain1_a 
                    cmpa     Y_POS+u_offset1,s            ; double check postions because of speed > 1 
                    beq      yIsCorrectPosition_ab 
                    inc      Y_POS+u_offset1,s 
                    decb     
                    bne      incAgain1_a 
                    bra      yDoneB_ab 

yIsCorrectPosition_ab 
; change angle
; if x finish is positive
; angle = 4 look right
; if x finish is negative
; angle = 12 look left
; XPOS is current position
; XPOS16 is from position
; ldd loaded above is target position
                    ldb      1+TARGET_ABSOLUT_Y+u_offset1,s ; target y, x position in d 
                    cmpb     X_POS+u_offset1,s 
                    blt      targetXisNegativeAngle_ab 
                    lda      ANGLE_HOMEFLIGHT+u_offset1,s 
                    anda     #%00000111 
                    ora      #2*2*2*2                     ; heading at 3 o'clock 
                    sta      ANGLE_HOMEFLIGHT+u_offset1,s 
                    bra      yDoneB_ab 

targetXisNegativeAngle_ab 
                    lda      ANGLE_HOMEFLIGHT+u_offset1,s 
                    anda     #%00000111 
                    ora      #6*2*2*2 
                    sta      ANGLE_HOMEFLIGHT+u_offset1,s 
yDoneB_ab 
                    ldd      TARGET_ABSOLUT_Y+u_offset1,s ; target y, x position in d 
                    cmpb     X_POS+u_offset1,s 
                    bne      xNotIsCorrectPosition_ab 
; x is correct so 
; change angle to point either 12 o'clor or 6 o'clock
                    cmpa     Y_POS+u_offset1,s            ; y pos 
                    blt      yposIsLowerDoAngle10 
                    lda      ANGLE_HOMEFLIGHT+u_offset1,s 
                    anda     #%00000111 
                    sta      ANGLE_HOMEFLIGHT+u_offset1,s 
                    bra      xIsCorrectPosition_ab 

yposIsLowerDoAngle10 
                    lda      ANGLE_HOMEFLIGHT+u_offset1,s 
                    anda     #%00000111 
                    ora      #4*2*2*2 
                    sta      ANGLE_HOMEFLIGHT+u_offset1,s 
                    bra      xIsCorrectPosition_ab 

xNotIsCorrectPosition_ab 
                    blt      targetXisNegative_ab 
                    lda      ANGLE_HOMEFLIGHT+u_offset1,s 
                    anda     #%00000111 
incAgain2_a 
                    cmpb     X_POS+u_offset1,s            ; double check postions because of speed > 1 
                    beq      xIsCorrectPosition_ab 
                    inc      X_POS+u_offset1,s 
                    deca     
                    bne      incAgain2_a 
                    bra      xIsCorrectPosition_ab 

targetXisNegative_ab 
                    lda      ANGLE_HOMEFLIGHT+u_offset1,s 
                    anda     #%00000111 
decAgain2 
                    cmpb     X_POS+u_offset1,s            ; double check postions because of speed > 1 
                    beq      xIsCorrectPosition_ab 
                    dec      X_POS+u_offset1,s 
                    deca     
                    bne      decAgain2 
xIsCorrectPosition_ab 
                    ldd      TARGET_ABSOLUT_Y+u_offset1,s ; reload 
                    cmpd     Y_POS+u_offset1,s 
                    lbne     notThereYetPosition_ab 
; we have reached target position
; switch to waiting behaviour
                    sta      Y_POS16+u_offset1,s 
                    stb      X_POS16+u_offset1,s 
                    clr      Y_POS16+1+u_offset1,s 
                    clr      X_POS16+1+u_offset1,s 
; load next pattern if available
                    ldx      MY_PATTERN+u_offset1,s 
                    lda      PATTERN_POSITION+u_offset1,s ; uper nibble of same byte as 
                    adda     #$10                         ; add 1 to upper nibble 
                    anda     #$f0                         ; this clears the sub pattern position in lower nibble 
                    sta      PATTERN_POSITION+u_offset1,s ; uper nibble of same byte as 
                    lsra     
                    lsra     
                    anda     #0xfc 
; in a 4 times the pattern pos of upper nibble
                    leax     a,x 
; in x correct pattern position in pattern list
; absolut patterns do not have sub pattern, so look directly if there is 
; a next pattern
                    LOAD_NEXT_PATTERN  0 
                    ldd      #enemyWaitingBehaviour 
                    std      BEHAVIOUR+u_offset1,s 
                    clr      ANIM_POSITION+u_offset1,s 
notThereYetPosition_ab 
                    ldu      ENEMY_STRUCT+u_offset1,s 
                    ldu      ANGLE8_TABLE,u 
                    lda      ANGLE_HOMEFLIGHT+u_offset1,s 
                    lsra     
                    lsra     
                    anda     #%00111110                   ; only upper 5 bits and doubled! 
                    ldu      a,u 
                    END_ENEMY_DISPLAY  
                    clra     
                    pulu     b,x,pc 
; exit current (single) pattern handling and init a standard delay behaviour
outOfPattern 
; restore defaults
                    clr      ANIM_POSITION+u_offset1,s 
                    lda      #DELAY_TO_REAPEAR 
                    sta      ALL_PURPOSE+u_offset1,s 
                    ldd      #enemyDelayBehaviour         ; delay some time after pattern before they reermage at thetop of the screen 
                    std      BEHAVIOUR+u_offset1,s 
                    dec      attackPatternCount 
                    jmp      endAttackBehaviourDirectly 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
; MUST not be resused
; only to be called from WAITING BEHAVIOUR!
CHECK_START_ATTACK_PATTERN  macro  
 if  NO_ATTACK_PATTERN = 1 
                    jmp      notAgain\? 

 endif  
                    tst      attackPatternInitiated       ; allow only one init of attack pattern per round 
                    lbne     notAgain\? 
                    lda      attackPatternCount 
                    ldx      currentLevelPointer 
                    cmpa     levelMaxAttackPatterns 
                    lbhs     notAgain\? 
                    ldu      ENEMY_STRUCT+u_offset1,s 
                    lda      ADDITIONAL_TYPE_INFO,u       ; blocker do not attack 
                    anda     #TYPE_DONT_ATTACK 
                    lbne     notAgain\? 
                    RANDOM_A  
                    cmpa     #ATTACK_PATTERN_PROBABILITY 
                    lbhi     notAgain\? 
                    inc      attackPatternInitiated 
                    inc      attackPatternCount 
                    ldx      LEVEL_ATTACK_PATTERN,x       ; in x a pointer to 4 possible attack patterns 
                    RANDOM_A2  
                    anda     #%00000011 
                    ldb      difficulty 
                    andb     #$f                          ; 
                    beq      easy2\? 
                    decb     
                    beq      difCont2\? 
                    decb     
                    beq      hard2\? 
impossible2\? 
                    adda     #2 
                    cmpa     #4 
                    blo      difCont2\? 
                    lda      #3 
                    bra      difCont2\? 

easy2\? 
                    lsra     
                    bra      difCont2\? 

hard2\? 
                    adda     #1 
                    cmpa     #4 
                    blo      difCont2\? 
                    lda      #3 
difCont2\? 
                    asla     
                    ldx      a,x                          ; random attack pattern in x now (1 of four for this level! 
; ok - now start an attack
; for now only "single" attacks
; for now only one attack pattern 
                    stx      MY_PATTERN+u_offset1,s 
                    clr      PATTERN_POSITION+u_offset1,s 
                    clr      SUB_PATTERN_POSITION+u_offset1,s 
;
; pattern with correct pattern pos in X
                    LOAD_NEXT_PATTERN_START  
notAgain\? 
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
clonedBehaviour                                           ;#isfunction  
                    dec      ALL_PURPOSE+u_offset1,s 
                    bne      cloneDelayDone 
; init clone "living"
                    ldd      PATTERN_POSITION+u_offset1,s 
                    std      BEHAVIOUR+u_offset1,s 
                    clr      PATTERN_POSITION+u_offset1,s 
                    lda      #$ff                         ; a "non" position (will not goto waiting) 
                    sta      POSITION+u_offset1,s 
cloneDelayDone 
                    lds      NEXT_ENEMY_OBJECT+u_offset1,s ; preload next user stack 
                    puls     d,pc                         ; (D = y,x, pc = next object) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; relative means - the enemie has a behaviour where it moves relative to its start position
; 10 to the left- or so
enemySingleAttackRelativeBehaviour                        ;#isfunction  
                    MY_MOVE_TO_D_START  
                    ldu      #back2Shot 
                    jmp      shotBehaviourStandardStart 

back2Shot 
; move in pattern
                    ldx      SUB_PATTERN+u_offset1,s 
                    lda      SUB_PATTERN_POSITION+u_offset1,s 
                    anda     #$0f                         ; only lower nibble 
                    asla                                  ; stupid - if it were in the upper nibble one asra would suffice! 
                    asla     
                    asla                                  ; times 8 
                    leax     a,x                          ; position of y add in pattern 
                    lda      RELATIVE_HI_Y+u_offset1,s 
                    ldb      RELATIVE_LO_Y+u_offset1,s 
                    addd     P_YADD,x 
                    sta      RELATIVE_HI_Y+u_offset1,s 
                    stb      RELATIVE_LO_Y+u_offset1,s 
                    lda      RELATIVE_HI_X+u_offset1,s 
                    ldb      RELATIVE_LO_X+u_offset1,s 
                    addd     P_XADD,x 
                    sta      RELATIVE_HI_X+u_offset1,s 
                    stb      RELATIVE_LO_X+u_offset1,s 
; check if next pattern position reached (near point to PATTERN_TARGET_REACHED_RADIUS)
                    suba     TARGET_RELATIVE_X+u_offset1,s 
                    bpl      noNeg1_srp 
                    nega     
noNeg1_srp 
                    cmpa     P_PATTERN_TARGET_RADIUS,X 
                    lbgt     thisPatternNotDone_srp 
                    lda      RELATIVE_HI_Y+u_offset1,s 
                    suba     TARGET_RELATIVE_Y+u_offset1,s 
                    bpl      noNeg2_srp 
                    nega     
noNeg2_srp 
                    cmpa     P_PATTERN_TARGET_RADIUS,X 
                    lbgt     thisPatternNotDone_srp 
; initiate next relative subpattern (if avialble) 
; in D current on screen position, which is base of next pattern
; unify positions, on multi pattern errors otherwise add up
                    clrb     
                    lda      RELATIVE_HI_Y+u_offset1,s 
                    std      Y_POS16+u_offset1,s 
                    lda      RELATIVE_HI_X+u_offset1,s 
                    std      X_POS16+u_offset1,s 
; check if this was last pattern of this sub pattern
                    lda      P_YADD+1+PatternLine,x 
                    lbne     thereIsANextPattern_srp 
                    lda      P_XADD+1+PatternLine,x 
                    lbne     thereIsANextPattern_srp 
; here finish the subpattern and do next pattern (if available)
; load next pattern if available
                    ldx      MY_PATTERN+u_offset1,s 
                    lda      PATTERN_POSITION+u_offset1,s ; uper nibble of same byte as 
                    adda     #$10                         ; add 1 to upper nibble 
                    anda     #$f0                         ; this clears the sub pattern position in lower nibble 
                    sta      PATTERN_POSITION+u_offset1,s ; uper nibble of same byte as 
                    lsra     
                    lsra     
                    anda     #0xfc 
; in a 4 times the pattern pos of upper nibble
                    leax     a,x 
; in x correct pattern position in pattern list
                    LOAD_NEXT_PATTERN  0 
thereIsANextPattern_srp 
; ASSERT: upper nibble must never be reached by an INC!
                    inc      SUB_PATTERN_POSITION+u_offset1,s ; here init next pattern in list 
; get next sub pattern to calculate the next relative address
                    ldx      SUB_PATTERN+u_offset1,s 
                    lda      SUB_PATTERN_POSITION+u_offset1,s 
                    anda     #$0f                         ; only lower nibble 
                    asla     
                    asla     
                    asla                                  ; times 8 
                    leax     a,x 
; add realtive target
nextRelativeTargerAdd 
                    ldd      P_YPOS,x                     ; 
                    adda     Y_POS+u_offset1,s 
                    sta      TARGET_RELATIVE_Y+u_offset1,s 
                    addb     X_POS+u_offset1,s 
                    stb      TARGET_RELATIVE_X+u_offset1,s 
                    clr      RELATIVE_LO_Y+u_offset1,s 
                    clr      RELATIVE_LO_X+u_offset1,s 
goOnEnemyPatternBehaviour_srp 
thisPatternNotDone_srp 
                    ldu      ENEMY_STRUCT+u_offset1,s 
                    ldu      ANGLE8_TABLE,u 
                    lda      P_ANGLE,x 
                    ldu      a,u 
                    END_ENEMY_DISPLAY  
                    clra     
                    pulu     b,x,pc 
endAttackBehaviourDirectly 
                    lds      NEXT_ENEMY_OBJECT+u_offset1,s ; preload next user stack 
                    ldb      gameScale 
                    LDA      #$CC 
                    STA      VIA_cntl                     ;/BLANK low and /ZERO low 
                    stB      VIA_t1_cnt_lo 
                    ldd      #0 
                    std      <VIA_port_b 
                    MY_MOVE_TO_A_END  
                    puls     d,pc                         ; (D = y,x, X = vectorlist) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; enemy is in its waiting position
; "wobbled" left and right
enemyWaitingBehaviour                                     ;#isfunction  
                    MY_MOVE_TO_D_START  
                    ldu      #back4Shot 
; optimize 
; use a "test" that does not collision dtection for player coords
; we are in waiting position forgod sake - no player anywhere near by!
                    jmp      shotBehaviourStandardStartNoBase 

back4Shot 
                    CHECK_START_ATTACK_PATTERN  
; above macro must jmp to noAnimChangeEnemy
; because ANIM_COUNT / ANIM POSITION
; is reused by Attack pattern
; if it would go on "normally" 
; the Pattern data would be corrupted!
                    ldu      ENEMY_STRUCT+u_offset1,s 
                    lda      ADDITIONAL_TYPE_INFO,u 
                    anda     #TYPE_SHIELD 
                    bne      noWobble 
                    lda      X_POS16+u_offset1,s 
                    adda     globalPatternWobble 
                    sta      X_POS+u_offset1,s 
noWobble 
;                    ldu      ENEMY_STRUCT+u_offset1,s 
; do animation of enemy 
                    tst      animDelayCounter 
                    bpl      noAnimChangeEnemy 
                    inc      ANIM_POSITION+u_offset1,s 
                    lda      ANIM_POSITION+u_offset1,s 
                    asla     
                    ldx      WAIT_ANIM_TABLE, u 
                    ldx      a,x 
                    bne      animNotFinished 
                    clr      ANIM_POSITION+u_offset1,s 
noAnimChangeEnemy 
                    lda      ANIM_POSITION+u_offset1,s 
                    lsla     
animNotFinished 
                    ldu      WAIT_ANIM_TABLE, u 
                    ldu      a,u 
                    END_ENEMY_DISPLAY  
                    clra     
                    pulu     b,x,pc 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; behaviours for spawned
; enmies, they follow the pattern they belong to
enemyIntroPatternBehaviourVader                           ;#isfunction  
                    MY_MOVE_TO_D_START  
                    ldu      #back3Shot 
                    jmp      shotBehaviourStandardTestShootingOnly 

enemyIntroPatternBehaviour                                ;#isfunction  
                    MY_MOVE_TO_D_START  
                    ldu      #back3Shot_patternCheck 
                    jmp      shotBehaviourStandardStart 

; ----------------------------------------------
back3Shot_patternCheck 
; in higher difficulties allow 
; attack patterns in intro!
                    lda      difficulty 
                    anda     #$f 
                    lbeq     back3Shot 
 if  ERRATIC_STARTING_WITH_HARD = 1 
                    deca     
                    lbeq     back3Shot 
 endif  
                    RANDOM_A  
                    cmpa     #10 
                    lbhi     noAdditionalPattern 
;.........
 if  NO_ATTACK_PATTERN = 1 
                    jmp      notAgain_nm 

 endif  
                    tst      attackPatternInitiated       ; allow only one init of attack pattern per round 
                    lbne     notAgain_nm 
                    lda      attackPatternCount 
                    ldx      currentLevelPointer 
                    lda      LEVEL_TYPE, x 
                    anda     #$f 
                    cmpa     #LEVEL_TYPE_BONUS 
                    lbeq     back3Shot 
                    lda      difficulty 
                    anda     #$f 
                    lsla     
                    adda     levelMaxAttackPatterns 
                    cmpa     attackPatternCount 
                    lblo     notAgain_nm 
;                    lbhs     notAgain_nm
;                    cmpa     levelMaxAttackPatterns 
;                    lbhs     notAgain_nm
                    ldu      ENEMY_STRUCT+u_offset1,s 
                    lda      ADDITIONAL_TYPE_INFO,u       ; blocker do not attack 
                    anda     #TYPE_DONT_ATTACK 
                    lbne     notAgain_nm 
                    RANDOM_A  
                    cmpa     #ATTACK_PATTERN_PROBABILITY 
                    lbhi     notAgain_nm 
                    inc      attackPatternInitiated 
                    inc      attackPatternCount 
; perhaps use special attack patterns for "middle" attacks?
                    RANDOM_A2  
                    ldx      #attackPatternsIntro 
;                    ldx      LEVEL_ATTACK_PATTERN,x ; in x a pointer to 4 possible attack patterns 
                    anda     #%00000011 
                    asla     
                    ldx      a,x                          ; random attack pattern in x now (1 of four for this level! 
; ok - now start an attack
; for now only "single" attacks
; for now only one attack pattern 
                    stx      MY_PATTERN+u_offset1,s 
                    clr      PATTERN_POSITION+u_offset1,s 
                    clr      SUB_PATTERN_POSITION+u_offset1,s 
;
; pattern with correct pattern pos in X
macroStart_nm 
                    lda      SINGLE_ATTACK_PATTERN_TYPE,x 
;SINGLE_ATTACK_RELATIVE_PATTERN  =  0                      ; relative means - it uses the current address of the enemy as start 
;SINGLE_ATTACK_TARGET_ENEMY_PATTERN  =  1                  ; TARGET - uses somehow the players coordinate as coordinate info 
;SINGLE_ATTACK_ABSOLUT_PATTERN  =  2                      ; moves from current position to an absolut screen position 
;SINGLE_ATTACK_JUMP = 3
                    lbeq     doRelativePattern_nm 
                    cmpa     #SINGLE_ATTACK_TARGET_ENEMY_PATTERN 
                    lbeq     doTargetPattern_nm 
                    cmpa     #SINGLE_ATTACK_ABSOLUT_PATTERN 
                    beq      doAbsolutPattern_nm 
; else jump
                    lda      SINGLE_ATTACK_PATTERN_NEXT_NO,x 
                    ldx      SINGLE_ATTACK_PATTERN_POINTER,x 
                    stx      MY_PATTERN+u_offset1,s 
                    sta      PATTERN_POSITION+u_offset1,s ; 
                    clr      SUB_PATTERN_POSITION+u_offset1,s 
                    bra      macroStart_nm 

doAbsolutPattern_nm 
                    ldd      #enemySingleAttackAbsolutBehaviour 
                    std      BEHAVIOUR+u_offset1,s 
                    lda      SINGLE_ATTACK_SPEED,x        ; speed 
                    sta      ANGLE_HOMEFLIGHT+u_offset1,s 
                    ldd      2,x                          ; second word in attack pattern are target coordinate 
targetPatternCont_nm 
                    std      TARGET_ABSOLUT_Y+u_offset1,s 
; get delta of now and target
; divide coordinates by half for angle test
; otherwise we overflow 2 complements
                    asra     
                    asrb     
                    std      _tmpY 
                    ldd      Y_POS+u_offset1,s 
                    asra     
                    asrb     
                    nega     
                    negb     
                    adda     _tmpY 
                    addb     _tmpX 
                                                          ; std _tmpY 
; in tmp half of the delta value between target and current pos
; NEW: (angles now between 0-7, not 0 to 20)
; in d is delta
; if y < 0 than angle from 5 to 15
; if y > 0-5 and 15-20
; if x > 0 than angle between 0-10
; if x < 0 than angle between 10 -20
; if x == 0 angle = 5 or 15
; if y == 0 angle = 0 or 10
; if y abs == y abs than angle in the middle of ranges (2.5, 7.5, 12.5, 17.5)
                    tsta     
                    bmi      yIsNeg_nm 
                    tstb     
                    bmi      yIsPosxIsNeg_nm 
                    beq      yIsPosxIsNull_nm 
yIsPosxIsPos_nm 
                    tsta     
                    bne      yNotNull1_nm 
                    lda      #2 
                    bra      angleDone_nm 

yNotNull1_nm 
                    lda      #1 
                    bra      angleDone_nm 

yIsPosxIsNull_nm 
                    lda      #0 
                    bra      angleDone_nm 

yIsPosxIsNeg_nm 
                    tsta     
                    bne      yNotNull2_nm 
                    lda      #6 
                    bra      angleDone_nm 

yNotNull2_nm 
                    lda      #7 
                    bra      angleDone_nm 

yIsNeg_nm 
                    tstb     
                    beq      yIsNegxIsNull_nm 
                    bmi      yIsNegxIsNeg_nm 
yIsNegxIsPos_nm 
                    lda      #3 
                    bra      angleDone_nm 

yIsNegxIsNeg_nm 
                    lda      #5 
                    bra      angleDone_nm 

yIsNegxIsNull_nm 
                    lda      #4 
                    bra      angleDone_nm 

angleDone_nm 
; keep speed
                    lsla                                  ; lower 3 bits are speed 
                    lsla                                  ; angle is 0 - 7 (must be doubled) 
                    lsla     
                    ldb      ANGLE_HOMEFLIGHT+u_offset1,s 
                    andb     #%00000111 
                    stb      ANGLE_HOMEFLIGHT+u_offset1,s 
                    ora      ANGLE_HOMEFLIGHT+u_offset1,s 
                    sta      ANGLE_HOMEFLIGHT+u_offset1,s 
                    jmp      notThereYetPosition_ab       ; jump out of macro 

doTargetPattern_nm 
; same as absolut - but target is current fighter position
                    ldd      #enemySingleAttackAbsolutBehaviour 
                    std      BEHAVIOUR+u_offset1,s 
                    lda      SINGLE_ATTACK_SPEED,x        ; speed 
                    sta      ANGLE_HOMEFLIGHT+u_offset1,s 
                    ldb      playerXpos 
                    lda      #$80 
                    jmp      targetPatternCont_nm 

doRelativePattern_nm 
; that this is a relative pattern "SINGLE_ATTACK_RELATIVE_PATTERN"
; but checks must consider it may be otherwise!
                    ldd      #enemySingleAttackRelativeBehaviour 
                    std      BEHAVIOUR+u_offset1,s 
                    ldx      2,x                          ; second word in attack pattern is the first sub pattern 
                    lbeq     outOfPattern                 ; dw 0,0 = end of pattern, leave macro and enter delay! 
                    stx      SUB_PATTERN+u_offset1,s 
; in x pointer to sub pattern
                                                          ; Y_POS 
                                                          ; X_POS will be out target coordinates in this behaviour 
                                                          ; costs cylces - > but I don't have more RAM 
; set 16 bit pos to same as 8 bit pos
; due to wobble this is not kept the same when in 
; waiting position
                    clr      RELATIVE_LO_Y+u_offset1,s 
                    clr      RELATIVE_LO_X+u_offset1,s 
                    ldd      P_YPOS,x 
                    adda     Y_POS+u_offset1,s 
                    sta      TARGET_RELATIVE_Y+u_offset1,s 
                    addb     X_POS+u_offset1,s 
                    stb      TARGET_RELATIVE_X+u_offset1,s 
                    jmp      thisPatternNotDone_srp       ; jump into relative behaviour 

notAgain_nm 
;.........
noAdditionalPattern 
; on higher level check if I should
; start an immediate attack pattern!
; ----------------------------------------------
back3Shot 
; move in pattern
                    ldx      MY_PATTERN+u_offset1,s 
                    lda      PATTERN_POSITION+u_offset1,s 
                    asla     
                    asla     
                    asla                                  ; times 8 
                    adda     #P_PATTERN_PATTERN_START     ; TWO intro bytes of pattern 
                    leax     a,x 
                    ldd      Y_POS16+u_offset1,s 
                    addd     P_YADD,x 
                    std      Y_POS16+u_offset1,s 
                    sta      Y_POS+u_offset1,s 
                    ldd      X_POS16+u_offset1,s 
                    tst      INVERSE_INTRO_PATTERN+u_offset1,s 
                    beq      noInverserPatternGame1 
                    subd     P_XADD,x 
                    std      X_POS16+u_offset1,s 
                    sta      X_POS+u_offset1,s 
; on inverse target check must also be inverse
                    adda     P_XPOS+PatternLine,x 
                    bra      noInverserPatternGameCont1 

noInverserPatternGame1 
                    addd     P_XADD,x 
                    std      X_POS16+u_offset1,s 
                    sta      X_POS+u_offset1,s 
                    suba     P_XPOS+PatternLine,x 
noInverserPatternGameCont1 
; check if next pattern position reached (near point to PATTERN_TARGET_REACHED_RADIUS)
                    bpl      noNeg1 
                    nega     
                    bvc      noNeg1 
                    lda      #$7f                         ; force 7f to be inverse of $80 
noNeg1 
                    cmpa     P_PATTERN_TARGET_RADIUS,X 
                    lbgt     thisPatternNotDone 
                    lda      Y_POS+u_offset1,s 
                    suba     P_YPOS+PatternLine,x 
                    bpl      noNeg2 
                    nega     
                    bvc      noNeg2 
                    lda      #$7f                         ; force 7f to be inverse of $80 
noNeg2 
                    cmpa     P_PATTERN_TARGET_RADIUS,X 
                    lbgt     thisPatternNotDone 
initNextPattern 
                    lda      P_YADD+1+PatternLine,x 
                    bne      thereIsANextPattern 
                    lda      P_XADD+1+PatternLine,x 
                    bne      thereIsANextPattern 
                    lda      P_ANGLE+PatternLine,x 
                    beq      patternsDone 
; check for pattern loop
; jhg
; if angle byte is != 0
; than angle byte is the (number-1) of the current pattern list to loop to!
; enter loop
                    deca     
                    deca     
                    sta      PATTERN_POSITION+u_offset1,s ; here init next pattern in list 
; load x with pointer to next (loop) pattern
                    ldx      MY_PATTERN+u_offset1,s 
                    asla     
                    asla     
                    asla                                  ; times 8 
                    adda     #P_PATTERN_PATTERN_START     ; THREE intro bytes of pattern 
                    leax     a,x 
                    bra      thereIsANextPattern 

patternsDone 
; check for kamikaze
                    ldu      currentLevelPointer 
                    lda      LEVEL_TYPE,u 
                    anda     #$f 
                    cmpa     #LEVEL_TYPE_KAMIKAZE 
; remove enemie for good!
                    lbeq     destroyEnemyObject 
                    cmpa     #LEVEL_TYPE_BONUS 
; remove enemie for good!
                    lbeq     destroyEnemyObject 
                                                          ; here finish the pattern and enter game mode 
                    lda      #DELAY_TO_REAPEAR 
                    sta      ALL_PURPOSE+u_offset1,s 
                    ldu      ENEMY_STRUCT+u_offset1,s 
                    lda      ADDITIONAL_TYPE_INFO,u 
                    anda     #TYPE_DIRECT_WAIT 
                    beq      noSpecialType 
; only type now is "direct waiting"
;....
                    clr      ALL_PURPOSE+u_offset1,s 
                    ldd      #enemyFlyHomeBehaviour 
                    std      BEHAVIOUR+u_offset1,s 
                    ldu      currentLevelPointer 
                    ldu      LEVEL_WAITING_PATTERN,u      ; in x now waiting pattern pointer 
                                                          ; calculate angle of enemy while flying home 
; ensure respawn point random and in correct half of screen
                    ldd      Y_POS+u_offset1,s 
                    stb      X_POS16+u_offset1,s 
                    clr      X_POS16+1+u_offset1,s 
                    clrb     
                    std      Y_POS16+u_offset1,s 
                    lda      POSITION+u_offset1,s 
                    lsla     
                    ldd      a,u                          ; target y, x position in d 
                    subb     X_POS16+u_offset1,s 
                                                          ; in b future x 
                                                          ; 0 is current x 
                                                          ; 0 is angle 10 
                                                          ; +127 is something like -4 
                                                          ; -127 is something like +4 
                    asrb                                  ; 64 
                    asrb                                  ; 32 
                    asrb                                  ; 16 
                    asrb                                  ; 8 
                    asrb                                  ; 4 
                    asrb                                  ; 2 4 times 2 
                    aslb                                  ; ensure divideable by 2 
                    negb     
                    addb     #8                           ; middle is 8 (times 2) (8 is pointing down, less is pointing right, more is pointing left) 
                    stb      ANGLE_HOMEFLIGHT+u_offset1,s ; store angle of fligher to "ALL PURPOSE" 
                    bra      goOnEnemyPatternBehaviour 

noSpecialType 
                    lda      ADDITIONAL_TYPE_INFO,u 
                    anda     #TYPE_DONT_WAIT 
                    lbne     destroyEnemyObject 
noSpecialType2 
                    ldd      #enemyDelayBehaviour         ; delay some time after pattern before they reermage at thetop of the screen 
                    std      BEHAVIOUR+u_offset1,s 
                    bra      goOnEnemyPatternBehaviour 

thereIsANextPattern 
                    inc      PATTERN_POSITION+u_offset1,s ; here init next pattern in list 
; reset positions to start position of next line 
                    ldd      P_YPOS+PatternLine,x 
                    std      Y_POS+u_offset1,s 
                    sta      Y_POS16+u_offset1,s 
                    tst      INVERSE_INTRO_PATTERN+u_offset1,s 
                    beq      noInversePatternNew1 
                    negb     
                    stb      X_POS+u_offset1,s 
noInversePatternNew1 
                    stb      X_POS16+u_offset1,s 
                    clr      Y_POS16+1+u_offset1,s 
                    clr      X_POS16+1+u_offset1,s 
goOnEnemyPatternBehaviour 
thisPatternNotDone 
                    ldu      ENEMY_STRUCT+u_offset1,s 
                    ldu      ANGLE8_TABLE,u 
                    lda      P_ANGLE,x                    ; x boken 
                    tst      INVERSE_INTRO_PATTERN+u_offset1,s 
                    beq      noInversePatternNew2 
                    asra     
                    ldx      #angleInverse 
                    lda      a,x 
                    asla     
noInversePatternNew2 
                    ldu      a,u 
                    END_ENEMY_DISPLAY  
                    clra     
                    pulu     b,x,pc 
angleInverse 
                    db       0,7,6,5,4,3,2,1 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; simple behaviour that counts
; down a counter 
; nothing is displayed
; after counter finished the "fly home" behaviour is initiated
enemyDelayBehaviour                                       ;#isfunction  
                    dec      ALL_PURPOSE+u_offset1,s 
                    bpl      delayDone 
enemyDelayJumpInto 
; unkown position -> remove!
                    tst      POSITION+u_offset1,s 
                    lbmi     destroyEnemyObject 
                    clr      ALL_PURPOSE+u_offset1,s 
                    ldd      #enemyFlyHomeBehaviour 
                    std      BEHAVIOUR+u_offset1,s 
                    ldx      currentLevelPointer 
                    ldx      LEVEL_WAITING_PATTERN,x      ; in x now waiting pattern pointer 
                                                          ; calculate angle of enemy while flying home 
                    lda      POSITION+u_offset1,s 
                    lsla     
                    ldd      a,x                          ; target y, x position in d 
; ensure respawn point random and in correct half of screen
                    lda      Vec_Loop_Count+1             ; "Random" counter x position 
                    tstb     
                    bmi      targetNegative 
targetPositive 
                    anda     #%01111111 
                    bra      targetCorrected 

targetNegative 
                    ora      #%10000000 
targetCorrected 
                    clrb     
                    std      X_POS16+u_offset1,s 
                    lda      #$7f                         ; ypos 
                    std      Y_POS16+u_offset1,s 
                    ldb      X_POS16+u_offset1,s 
                    std      Y_POS+u_offset1,s 
                    lda      POSITION+u_offset1,s 
                    lsla     
                    ldd      a,x                          ; target y, x position in d 
                    subb     X_POS16+u_offset1,s 
                                                          ; in b future x 
                                                          ; 0 is current x 
                                                          ; 0 is angle 10 
                                                          ; +127 is something like -4 
                                                          ; -127 is something like +4 
                    asrb                                  ; 64 
                    asrb                                  ; 32 
                    asrb                                  ; 16 
                    asrb                                  ; 8 
                    asrb                                  ; 4 
                    asrb                                  ; 2 4 times 2 
                    aslb                                  ; ensure divideable by 2 
                    negb     
                    addb     #8                           ; middle is 8 (times 2) (8 is pointing down, less is pointing right, more is pointing left) 
                    stb      ANGLE_HOMEFLIGHT+u_offset1,s ; store angle of fligher to "ALL PURPOSE" 
delayDone 
                    lds      NEXT_ENEMY_OBJECT+u_offset1,s ; preload next user stack 
                    puls     d,pc                         ; (D = y,x, pc = next object) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; fly home behaviour
; from the current position the
; enemy flies on the shortes path to its
; Waiting position, speed = 255
; after that the Waiting behaviour is
; initiated!
enemyFlyHomeBehaviour                                     ;#isfunction  
                    MY_MOVE_TO_D_START  
                    ldu      #back5Shot 
                    jmp      shotBehaviourStandardStart 

back5Shot 
                    ldx      currentLevelPointer 
                    ldx      LEVEL_WAITING_PATTERN,x      ; in x now waiting pattern pointer 
                    lda      POSITION+u_offset1,s 
                    lsla     
                    leax     a,x 
                    ldd      ,x                           ; target y, x position in d 
; target y position is allways smaller since we start at the top of the screen
                    cmpa     Y_POS+u_offset1,s 
                    beq      yIsCorrectPosition 
                    dec      Y_POS+u_offset1,s 
                    bra      yDoneB 

yIsCorrectPosition 
; change angle
; if x finish is positive
; angle = 4 look right
; if x finish is negative
; angle = 12 look left
; XPOS is current position
; XPOS16 is from position
; ldd loaded above is target position
                    subb     X_POS16+u_offset1,s 
                                                          ; b is target 
                    tstb     
                    bmi      targetXisNegativeAngle 
                    lda      #2*2                         ; 3 o clock 
                    sta      ANGLE_HOMEFLIGHT+u_offset1,s 
                    ldd      ,x                           ; reload 
                    bra      yDoneB 

targetXisNegativeAngle 
                    lda      #6*2                         ; 9 oclock 
                    sta      ANGLE_HOMEFLIGHT+u_offset1,s 
                    ldd      ,x                           ; reload 
yDoneB 
                    tfr      b,a                          ; remember correct "b" 
                    suba     X_POS16+u_offset1,s          ; see above 
                    bmi      targetXisNegative 
targetXisPositive 
; than we must add
                    cmpb     X_POS+u_offset1,s 
                    beq      xIsCorrectPosition 
                    inc      X_POS+u_offset1,s 
                    bra      xIsCorrectPosition_continue 

targetXisNegative 
                    cmpb     X_POS+u_offset1,s 
                    beq      xIsCorrectPosition 
                    dec      X_POS+u_offset1,s 
                    bra      xIsCorrectPosition_continue 

xIsCorrectPosition 
; only possibleway is down
                    lda      #4*2                         ; 6 oclock 
                    sta      ANGLE_HOMEFLIGHT+u_offset1,s 
xIsCorrectPosition_continue 
                    ldd      ,x                           ; reload 
                    cmpd     Y_POS+u_offset1,s 
                    bne      notThereYetPosition 
; we have reached target position
; switch to waiting behaviour
                    sta      Y_POS16+u_offset1,s 
                    stb      X_POS16+u_offset1,s 
                    clr      Y_POS16+1+u_offset1,s 
                    clr      X_POS16+1+u_offset1,s 
                    ldd      #enemyWaitingBehaviour 
                    std      BEHAVIOUR+u_offset1,s 
                    clr      ANIM_POSITION+u_offset1,s 
notThereYetPosition 
                    ldu      ENEMY_STRUCT+u_offset1,s 
                    ldu      ANGLE8_TABLE,u 
                    lda      ANGLE_HOMEFLIGHT+u_offset1,s 
endAllBiggy 
                    ldu      a,u 
                    END_ENEMY_DISPLAY  
                    clra     
                    pulu     b,x,pc 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
repellEnemy                                               ;#isfunction  
                    inc      bonusHitCount 
                    lda      #-1 
                    sta      ALL_PURPOSE +u_offset1,s     ; negative means this enemy is an explosion - or at least not hitable 
; check if enemy was in attack pattern
; if so reduce pattern
                    ldd      BEHAVIOUR +u_offset1,s 
; depending on the type 
; the repelling differs
                    cmpd     #enemyIntroPatternBehaviour 
                    beq      repellPreSetupDone 
                    dec      attackPatternCount 
repellPreSetupDone 
                    ldd      scoopEnemy1 
                    lbeq     doScoopEneme1 
                    ldd      scoopEnemy2 
                    lbeq     doScoopEneme2 
doReallyRepell 
                    ADD_POINTS_ENEMY_DESTROY  
; setup animation
                    lda      #4                           ; angle 8 = 180 six o'clock ; angle is doubled in output! 
                    sta      ANGLE_REPELL+u_offset1,s 
; setup16 bit position
                    ldD      Y_POS+u_offset1,s 
                    stb      X_POS16+u_offset1,s 
                    clr      1+X_POS16+u_offset1,s 
                    clrb     
                    std      Y_POS16+u_offset1,s 
                                                          ; we do random addies 
                                                          ;y speed is fixed +2 
                    ldd      #$0400 
                    std      Y_ADD16+u_offset1,s 
                    RANDOM_B  
                    sex      
                    ASLB     
                    ROLA     
                    ASLB     
                    ROLA     
                    std      X_ADD16+u_offset1,s 
                    ldd      #enemyRepellBehaviour 
                    std      BEHAVIOUR +u_offset1,s       ; negative means this enemy is an explosion 
lastDrawBeforeRepell: 
                    ldb      #OBJECT_SCALE 
                    stb      VIA_t1_cnt_lo 
                    ldx      ENEMY_STRUCT+u_offset1,s 
                    ldx      ANGLE8_TABLE,x 
                    ldu      8,x                          ; just forexample load 180 degree enemy to start with 
                                                          ; END_ENEMY_DISPLAY 
                    tst      lightningOn 
                    beq      normalEndMacro2_repell 
                    clr      lightningOn 
                    lds      NEXT_ENEMY_OBJECT+u_offset1,s ; preload next user stack 
                    lda      #DEFAULT_ENEMY_INTENSITY 
                    MY_MOVE_TO_B_END  
                    _INTENSITY_A  
                    clra     
                    pulu     b,x,pc 
normalEndMacro2_repell 
                    lds      NEXT_ENEMY_OBJECT+u_offset1,s ; preload next user stack 
                    MY_MOVE_TO_A_END  
                    clra     
                    pulu     b,x,pc 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;behaviour after a scoop repell
enemyRepellBehaviour                                      ;#isfunction  
                    MY_MOVE_TO_D_START  
                    lda      #OBJECT_SCALE 
                    sta      VIA_t1_cnt_lo 
                    ldd      X_POS16+u_offset1,s 
                    addd     X_ADD16+u_offset1,s 
                    std      X_POS16+u_offset1,s 
                    ldd      Y_POS16+u_offset1,s 
                    addd     Y_ADD16+u_offset1,s 
                    std      Y_POS16+u_offset1,s 
                    sta      Y_POS+u_offset1,s 
                    cmpa     #$78 
                    lbgt     destroyEnemyObject 
                    lda      X_POS16+u_offset1,s 
                    sta      X_POS+u_offset1,s 
                    cmpa     #$78 
                    lbgt     destroyEnemyObject 
                    cmpa     #-$78 
                    lblt     destroyEnemyObject 
                    ldu      ENEMY_STRUCT+u_offset1,s 
; do animation of enemy 
                    tst      animDelayCounter 
                    bpl      noAnimChangeEnemy_repell 
                    inc      ANGLE_REPELL+u_offset1,s 
                    lda      ANGLE_REPELL+u_offset1,s 
                    asla     
                    ldx      ANGLE8_TABLE, u 
                    ldx      a,x 
                    bne      animNotFinished_repell 
                    clr      ANGLE_REPELL+u_offset1,s 
noAnimChangeEnemy_repell 
                    lda      ANGLE_REPELL+u_offset1,s 
                    lsla     
animNotFinished_repell 
                    ldu      ANGLE8_TABLE, u 
                    ldu      a,u 
                    tst      lightningOn 
                    beq      normalEndMacro2_repell2 
                    clr      lightningOn 
                    lds      NEXT_ENEMY_OBJECT+u_offset1,s ; preload next user stack 
                    lda      #DEFAULT_ENEMY_INTENSITY 
                    MY_MOVE_TO_B_END  
                    _INTENSITY_A  
                    clra     
                    pulu     b,x,pc 
normalEndMacro2_repell2 
                    lds      NEXT_ENEMY_OBJECT+u_offset1,s ; preload next user stack 
                    MY_MOVE_TO_A_END  
                    clra     
                    pulu     b,x,pc 
;
;
doScoopEneme2 
                    dec      enemyCount 
                    leax     u_offset1,s 
                    stx      scoopEnemy2                  ; remember scooped enemy 
                    ldd      #positionScoop2Behaviour 
                    std      BEHAVIOUR +u_offset1,s 
                    clr      XPOS_LOCKED+u_offset1,s 
                                                          ; current 8bit position in Y_POS 
                    lda      #4                           ; angle 8 = 180 six o'clock ; angle is doubled in output! 
                    sta      ANGLE_REPELL+u_offset1,s 
                    jmp      lastDrawBeforeRepell 

;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; rotate 180°
; move to player pos X
; stay in releative X pos
; decrease y pos till on side of player
; change behaviour to "playerControlledBehaviour"
positionScoop2Behaviour                                   ;#isfunction  
                    MY_MOVE_TO_D_START  
                    lda      #OBJECT_SCALE 
                    sta      VIA_t1_cnt_lo 
                    ldu      ENEMY_STRUCT+u_offset1,s 
                    lda      ANGLE_REPELL+u_offset1,s 
                    cmpa     #0 
                    beq      rotatingDoneScoop2 
                    dec      ANGLE_REPELL+u_offset1,s 
                    bra      continueScoop2Behaviour 

rotatingDoneScoop2 
                    lda      XPOS_LOCKED+u_offset1,s 
                    bne      seekingX2PlayerDone 
                    lda      playerXpos 
                    adda     #SCOOP_LEFT_PLAYER_XOFFSET 
                    suba     X_POS+u_offset1,s 
                    bpl      scoop2NoNeg 
                    nega     
                    cmpa     #5 
                    bls      xPosScoop2Reached 
                    lda      X_POS+u_offset1,s 
                    suba     #3 
                    sta      X_POS+u_offset1,s 
                    bra      continueScoop2Behaviour 

scoop2NoNeg 
                    cmpa     #5 
                    bls      xPosScoop2Reached 
                    lda      X_POS+u_offset1,s 
                    adda     #3 
                    sta      X_POS+u_offset1,s 
                    bra      continueScoop2Behaviour 

xPosScoop2Reached 
; correct position to be BESIDE the player
                    lda      #1 
                    sta      XPOS_LOCKED+u_offset1,s 
                    bra      continueScoop2Behaviour 

seekingX2PlayerDone 
; correct position to be BESIDE the player
                    ldb      playerXpos                   ; from now on allways == XPOS player 
                    addb     #SCOOP_LEFT_PLAYER_XOFFSET 
                    stb      X_POS+u_offset1,s 
                    dec      Y_POS+u_offset1,s 
                    lda      Y_POS+u_offset1,s 
                    cmpa     #PLAYER_YPOS 
                    bne      continueScoop2Behaviour 
; target reached - now switch to player controlled behaviour
                    ldd      #enemyPlayerControlledLeftBehaviour 
                    std      BEHAVIOUR +u_offset1,s       ; negative means this enemy is an explosion 
                    lda      #SCOOP_PLAYER_YPOS 
                    ldb      playerXpos 
                    addb     #SCOOP_LEFT_PLAYER_XOFFSET 
                    std      Y_POS+u_offset1,s 
continueScoop2Behaviour 
                    lda      ANGLE_REPELL+u_offset1,s 
                    asla     
                    ldu      ANGLE8_TABLE, u 
                    ldu      a,u 
                    tst      lightningOn 
                    beq      normalEndMacro2_repell2_2 
                    clr      lightningOn 
                    lds      NEXT_ENEMY_OBJECT+u_offset1,s ; preload next user stack 
                    lda      #DEFAULT_ENEMY_INTENSITY 
                    MY_MOVE_TO_B_END  
                    _INTENSITY_A  
                    clra     
                    pulu     b,x,pc 
normalEndMacro2_repell2_2 
                    lds      NEXT_ENEMY_OBJECT+u_offset1,s ; preload next user stack 
                    MY_MOVE_TO_A_END  
                    clra     
                    pulu     b,x,pc 
doScoopEneme1 
                    dec      enemyCount 
                    leax     u_offset1,s 
                    stx      scoopEnemy1                  ; remember scooped enemy 
                    ldd      #positionScoop1Behaviour 
                    std      BEHAVIOUR +u_offset1,s 
                    clr      XPOS_LOCKED+u_offset1,s 
                                                          ; current 8bit position in Y_POS 
                    lda      #4                           ; angle 8 = 180 six o'clock ; angle is doubled in output! 
                    sta      ANGLE_REPELL+u_offset1,s 
                    jmp      lastDrawBeforeRepell 

;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; rotate 180°
; move to player pos X
; stay in releative X pos
; decrease y pos till on side of player
; change behaviour to "playerControlledBehaviour"
positionScoop1Behaviour                                   ;#isfunction  
                    MY_MOVE_TO_D_START  
                    lda      #OBJECT_SCALE 
                    sta      VIA_t1_cnt_lo 
                    ldu      ENEMY_STRUCT+u_offset1,s 
                    lda      ANGLE_REPELL+u_offset1,s 
                    cmpa     #0 
                    beq      rotatingDoneScoop1 
                    dec      ANGLE_REPELL+u_offset1,s 
                    bra      continueScoop1Behaviour 

rotatingDoneScoop1 
                    lda      XPOS_LOCKED+u_offset1,s 
                    bne      seekingXPlayerDone 
                    lda      playerXpos 
                    adda     #SCOOP_RIGHT_PLAYER_XOFFSET 
                    suba     X_POS+u_offset1,s 
                    bpl      scoop1NoNeg 
                    nega     
                    cmpa     #5 
                    bls      xPosScoop1Reached 
                    lda      X_POS+u_offset1,s 
                    suba     #3 
                    sta      X_POS+u_offset1,s 
                    bra      continueScoop1Behaviour 

scoop1NoNeg 
                    cmpa     #5 
                    bls      xPosScoop1Reached 
                    lda      X_POS+u_offset1,s 
                    adda     #3 
                    sta      X_POS+u_offset1,s 
                    bra      continueScoop1Behaviour 

xPosScoop1Reached 
; correct position to be BESIDE the player
                    lda      #1 
                    sta      XPOS_LOCKED+u_offset1,s 
                    bra      continueScoop1Behaviour 

seekingXPlayerDone 
; correct position to be BESIDE the player
                    ldb      playerXpos                   ; from now on allways == XPOS player 
                    addb     #SCOOP_RIGHT_PLAYER_XOFFSET 
                    stb      X_POS+u_offset1,s 
                    dec      Y_POS+u_offset1,s 
                    lda      Y_POS+u_offset1,s 
                    cmpa     #PLAYER_YPOS 
                    bne      continueScoop1Behaviour 
; target reached - now switch to player controlled behaviour
                    ldd      #enemyPlayerControlledRightBehaviour 
                    std      BEHAVIOUR +u_offset1,s       ; negative means this enemy is an explosion 
                    lda      #SCOOP_PLAYER_YPOS 
                    ldb      playerXpos 
                    addb     #SCOOP_RIGHT_PLAYER_XOFFSET 
                    std      Y_POS+u_offset1,s 
continueScoop1Behaviour 
                    lda      ANGLE_REPELL+u_offset1,s 
                    asla     
                    ldu      ANGLE8_TABLE, u 
                    ldu      a,u 
                    tst      lightningOn 
                    beq      normalEndMacro2_repell2_csb 
                    clr      lightningOn 
                    lds      NEXT_ENEMY_OBJECT+u_offset1,s ; preload next user stack 
                    lda      #DEFAULT_ENEMY_INTENSITY 
                    MY_MOVE_TO_B_END  
                    _INTENSITY_A  
                    clra     
                    pulu     b,x,pc 
normalEndMacro2_repell2_csb 
                    lds      NEXT_ENEMY_OBJECT+u_offset1,s ; preload next user stack 
                    MY_MOVE_TO_A_END  
                    clra     
                    pulu     b,x,pc 
scoopRightXTranslationTable 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;behaviour after a scoop 
enemyPlayerControlledRightBehaviour                       ;#isfunction  
                    MY_MOVE_TO_D_START  
                    lda      #OBJECT_SCALE 
                    sta      VIA_t1_cnt_lo 
                    lda      #SCOOP_PLAYER_YPOS 
                    ldb      playerXpos 
                    addb     #SCOOP_RIGHT_PLAYER_XOFFSET 
                    std      Y_POS+u_offset1,s 
                    ldu      ENEMY_STRUCT+u_offset1,s 
                    ldu      WAIT_ANIM_TABLE, u 
                    ldu      ,u 
                    lds      NEXT_ENEMY_OBJECT+u_offset1,s ; preload next user stack 
                    lda      #DEFAULT_ENEMY_INTENSITY 
                    ldb      lockPurchased 
                    andb     #%00100000 
                    beq      contRight 
                    lda      Vec_Loop_Count+1 
                    anda     #%00001111 
                    ldx      #brightnessTable1 
                    lda      a,x 
                    inc      lightningOn 
                    bra      contRight2 

contRight 
                    tst      lightningOn 
                    beq      normalEndMacro2_pControlled1 
                    clr      lightningOn 
contRight2 
                    MY_MOVE_TO_B_END  
                    _INTENSITY_A  
                    ldd      #0 
                    std      <VIA_port_b 
                    clra     
                    pulu     b,x,pc 
normalEndMacro2_pControlled1 
                    clra     
                    MY_MOVE_TO_B_END  
                    pulu     b,x,pc 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
brightnessTable1 
                    db       $3f,$3e, $3d,$3c, $3b,$2a, $29,$28, $27,$28, $29,$2a, $3b,$3c, $3d, $3e 
                    db       $3f,$3c, $38,$34, $30,$2c, $28,$24, $20,$24, $28,$2c, $30,$34, $38, $3c 
;behaviour after a scoop
enemyPlayerControlledLeftBehaviour                        ;#isfunction  
; nop 20
                    MY_MOVE_TO_D_START  
                    lda      #OBJECT_SCALE 
                    sta      VIA_t1_cnt_lo 
                    lda      #SCOOP_PLAYER_YPOS 
                    ldb      playerXpos 
                    addb     #SCOOP_LEFT_PLAYER_XOFFSET 
                    std      Y_POS+u_offset1,s 
                    ldu      ENEMY_STRUCT+u_offset1,s 
; do animation of enemy 
                    ldu      WAIT_ANIM_TABLE, u 
                    ldu      ,u 
                    lds      NEXT_ENEMY_OBJECT+u_offset1,s ; preload next user stack 
                    lda      #DEFAULT_ENEMY_INTENSITY 
                    ldb      lockPurchased 
                    andb     #%00100000 
                    beq      contLeft 
                    lda      Vec_Loop_Count+1 
                    anda     #%00000111 
                    ldx      #brightnessTable1 
                    lda      a,x 
                    inc      lightningOn 
                    bra      contLeft2 

contLeft 
                    tst      lightningOn 
                    beq      normalEndMacro2_pControlled1 
                    clr      lightningOn 
contLeft2 
                    MY_MOVE_TO_B_END  
                    _INTENSITY_A  
                    ldd      #0 
                    std      <VIA_port_b 
                    clra     
                    pulu     b,x,pc 
normalEndMacro2_pControlled2 
                    clra     
                    MY_MOVE_TO_B_END  
                    pulu     b,x,pc 
initMovementBoss3 
                    ldx      boss3MovementPointer 
                    lda      2,x                          ; speed 
                    sta      tmp1                         ; speed 
; ldd bossPosY; current pos
;;;;; Y
                    ldb      bossPosY 
                    sex      
                    std      boss3YposNow16 
                    ldb      ,x                           ; ypos of destination 
                    sex      
                    subd     boss3YposNow16 
                    clr      boss3Ypos16                  ; delta 
                    clr      boss3Ypos16+1                ; delta 
                    ldu      boss3Ypos16 
addyAgainSpeedBoss3 
                    leau     d,u 
                    dec      tmp1                         ; bullet speed 
                    bne      addyAgainSpeedBoss3 
                    stu      boss3Ypos16                  ; delta 
                    lda      2,x                          ; speed 
                    sta      tmp1                         ; speed 
;;;;; X
                    ldb      bossPosY+1                   ; x pos of boss 
                    sex      
                    std      boss3XposNow16 
                    ldb      1 ,x                         ; xpos of destination 
                    sex      
                    subd     boss3XposNow16 
                    clr      boss3Xpos16                  ; delta 
                    clr      1+boss3Xpos16                ; delta 
                    ldu      boss3Xpos16 
addxAgainSpeedBoss3 
                    leau     d,u 
                    dec      tmp1                         ; bullet speed 
                    bne      addxAgainSpeedBoss3 
                    stu      boss3Xpos16                  ; delta 
                    ldd      bossPosY 
                    sta      boss3YposNow16 
                    stb      boss3XposNow16 
                    clr      boss3YposNow16+1 
                    clr      boss3XposNow16+1 
                    rts      

;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
directIntroBehaviour                                      ;#isfunction  
                    MY_MOVE_TO_D_START  
                    lda      X_POS16+u_offset1,s 
                    adda     globalPatternWobble 
                    sta      X_POS+u_offset1,s 
                    ldu      ENEMY_STRUCT+u_offset1,s 
                    tst      animDelayCounter 
                    bpl      noAnimChangeEnemyDA 
                    inc      ANIM_POSITION+u_offset1,s 
                    lda      ANIM_POSITION+u_offset1,s 
                    asla     
                    ldx      WAIT_ANIM_TABLE, u 
                    ldx      a,x 
                    bne      animNotFinishedDA 
                    clr      ANIM_POSITION+u_offset1,s 
noAnimChangeEnemyDA 
                    lda      ANIM_POSITION+u_offset1,s 
                    lsla     
animNotFinishedDA 
                    ldu      WAIT_ANIM_TABLE, u 
                    ldu      a,u 
;                    lda      game_phase ; testing if all enemies are dead -> level done 
;                    cmpa     #GAMEPHASE_INGAME ; only testing, when in game, otherwise the start of a level would be the end (no enemies) 
;                    bne      stayHereDA 
                    lda      lockPurchased 
                    bita     #GAMEPHASE_INTRO 
                    bne      stayHereDA 
                    ldd      #enemyWaitingBehaviour 
                    std      BEHAVIOUR+u_offset1,s 
stayHereDA 
                    lds      NEXT_ENEMY_OBJECT+u_offset1,s ; preload next user stack 
                    lda      patternDelayCounter 
                    lsra     
                    lsra     
                    lsra     
                    sta      <VIA_t1_cnt_lo 
                    lda      #$1f 
                    MY_MOVE_TO_B_END  
                    _INTENSITY_A  
                    clra     
                    pulu     b,x,pc 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
enemyDebrisBomberBehaviour                                ;#isfunction  
                    MY_MOVE_TO_D_START  
                    COL_DETECT_PLAYER_BASE  Y_POS, X_POS 
                    lda      Y_POS+u_offset1,s 
                    suba     ALL_PURPOSE+u_offset1,s 
                    lbvs     destroyEnemyObject 
                    sta      Y_POS+u_offset1,s 
; todo move down and vanish
debrisBomberEntry 
                    lda      #OBJECT_SCALE 
                    sta      <VIA_t1_cnt_lo 
                    tst      animDelayCounter 
                    bpl      noAnimChangeEnemyDB 
                    inc      ANIM_POSITION+u_offset1,s 
                    lda      ANIM_POSITION+u_offset1,s 
                    asla     
                    ldx      #DebrisBombList 
                    ldx      a,x 
                    bne      animNotFinishedDB 
                    clr      ANIM_POSITION+u_offset1,s 
noAnimChangeEnemyDB 
                    lda      ANIM_POSITION+u_offset1,s 
                    lsla     
animNotFinishedDB 
                    ldu      #DebrisBombList 
                    ldu      a,u 
                    tst      lightningOn 
                    beq      normalEndMacro2DB 
                    clr      lightningOn 
                    lds      NEXT_ENEMY_OBJECT+u_offset1,s ; preload next user stack 
                    lda      #DEFAULT_ENEMY_INTENSITY 
                    MY_MOVE_TO_B_END  
                    _INTENSITY_A  
                    clra     
                    pulu     b,x,pc 
normalEndMacro2DB 
                    lds      NEXT_ENEMY_OBJECT+u_offset1,s ; preload next user stack 
                    MY_MOVE_TO_A_END  
                    clra     
                    pulu     b,x,pc 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
tribbleBehaviour                                          ;#isfunction  
                    MY_MOVE_TO_D_START  
                    lda      #OBJECT_SCALE 
                    sta      VIA_t1_cnt_lo 
                    ldx      TRIBBLE_LIFE_TIME+u_offset1,s 
                    leax     -1,x 
                    lbeq     destroyEnemyObject 
; tribleDieNaturalDeath
                    stx      TRIBBLE_LIFE_TIME+u_offset1,s 
                    ldu      #back4Shot_tribble 
                    jmp      shotBehaviourStandardStart 

back4Shot_tribble 
tribbleNotExplode 
                    lda      TRIBBLE_MOVEMENT_INFO +u_offset1,s 
                    anda     #%00001111                   ; get only the counter part 
                    beq      initNewDirectionTribble 
; now adjust current pos according to movement info in our swarm data
                    dec      TRIBBLE_MOVEMENT_INFO +u_offset1,s 
                    lda      TRIBBLE_ALL_PURPOSE +u_offset1,s 
; vvhh xfff 
; vertical 
; v0 0 = no vertical movement
; 11 = up
; 01 = down
; 00 = not used
                    bita     #%01000000 
                    beq      verticalChangeDoneTribble 
                    bita     #%10000000 
                    beq      verticalGoDownTribble 
                    inc      Y_POS+u_offset1,s 
                    bra      verticalChangeDoneTribble 

verticalGoDownTribble 
                    dec      Y_POS+u_offset1,s 
verticalChangeDoneTribble 
; horizontal 
; h0 0 = no horzontal movement
; 11 = left
; 01 = right
; 00 = not used
                    bita     #%00010000 
                    beq      tribbleMovementDone          ;horizontalChangeDoneSwarm 
                    bita     #%00100000 
                    beq      horizontalGoRightTribble 
                    inc      X_POS+u_offset1,s 
                    bra      tribbleMovementDone          ; horizontalChangeDoneSwarm 

horizontalGoRightTribble 
                    dec      X_POS+u_offset1,s 
horizontalChangeDoneTribble 
                    bra      tribbleMovementDone 

initNewDirectionTribble 
                    lda      TRIBBLE_MOVEMENT_INFO +u_offset1,s 
                    ora      #%00001111                   ; counter till next movement change to 15 
                    sta      TRIBBLE_MOVEMENT_INFO +u_offset1,s 
                    ldb      TRIBBLE_ALL_PURPOSE +u_offset1,s 
                    andb     #%00001111                   ; reset all movement parts in ALL_PURPOSE 
                    lda      Y_POS+u_offset1,s 
                    cmpa     #TRIBBLE_MAX_Y 
                    ble      normalyTribble1 
                    orb      #%01000000                   ; force down 
                    bra      verticalIs0Tribble 

normalyTribble1 
                    cmpa     #TRIBBLE_MIN_Y 
                    bgt      normalyTribble2 
                    orb      #%11000000                   ; force up 
                    bra      verticalIs0Tribble 

normalyTribble2 
; vertical 
; v0h0 xfff 
                    RANDOM_A_SW  
                    bmi      verticalIs0Tribble 
                    orb      #%01000000 
                    RANDOM_A_SW  
                    bmi      verticalIs0Tribble 
                    orb      #%10000000 
;verticalIsDown 
verticalIs0Tribble 
                    lda      X_POS+u_offset1,s 
                    cmpa     #TRIBBLE_MAX_X 
                    ble      normalxTribble1 
                    orb      #%00010000                   ; force right 
                    bra      horizontalIs0Tribble 

normalxTribble1 
                    cmpa     #TRIBBLE_MIN_X 
                    bge      normalxTribble2 
                    orb      #%00110000                   ; force left 
                    bra      horizontalIs0Tribble 

normalxTribble2 
; horizontal 
; v0h0 xfff 
                    RANDOM_A_SW  
                    bmi      horizontalIs0Tribble 
                    orb      #%00010000 
                    RANDOM_A_SW  
                    bmi      horizontalIsRightTribble 
                    orb      #%00100000 
horizontalIsRightTribble 
horizontalIs0Tribble 
                    stb      TRIBBLE_ALL_PURPOSE +u_offset1,s 
notHitTribble 
tribbleMovementDone 
; for anim go to swam anim directly there is no enemy struct
                    ldu      #enemyTribbleAngle8Table 
; do animation of enemy 
                    tst      animDelayCounter 
                    bpl      noAnimChangeEnemyTribble 
                    inc      TRIBBLE_ANIM_POS+u_offset1,s 
                    lda      TRIBBLE_ANIM_POS+u_offset1,s 
                    asla     
                    ldx      a,u 
                    bne      animNotFinishedTribble 
                    clr      TRIBBLE_ANIM_POS+u_offset1,s 
noAnimChangeEnemyTribble 
                    lda      TRIBBLE_ANIM_POS+u_offset1,s 
                    lsla     
animNotFinishedTribble 
                    ldu      #enemyTribbleAngle8Table 
                    ldu      a,u 
                    lda      TRIBBLE_ALL_PURPOSE +u_offset1,s 
                    anda     #%00000111                   ; check if we should "blink" (hit and not destroyed -> we blink) 
                    beq      normalEndMacro_Tribble 
                    cmpa     #HIT_FLASH_LENGTH 
                    bgt      normalEndMacro2_Tribble 
                    inc      lightningOn 
                    dec      TRIBBLE_ALL_PURPOSE +u_offset1,s 
                    lda      #$7f 
                    bra      out_Tribble2 

normalEndMacro_Tribble 
                    tst      lightningOn 
                    beq      normalEndMacro2_Tribble 
                    clr      lightningOn 
;                    lds      NEXT_ENEMY_OBJECT+u_offset1,s ; preload next user stack 
                    lda      #DEFAULT_ENEMY_INTENSITY 
out_Tribble2 
                    lds      NEXT_ENEMY_OBJECT+u_offset1,s ; preload next user stack 
                    MY_MOVE_TO_B_END  
                    _INTENSITY_A  
                    bra      out_Tribble 

normalEndMacro2_Tribble 
                    lds      NEXT_ENEMY_OBJECT+u_offset1,s ; preload next user stack 
                    MY_MOVE_TO_A_END  
out_Tribble 
                    clra     
                    pulu     b,x,pc 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
fallDiamondBehaviour                                      ;#isfunction  
                    MY_MOVE_TO_D_START  
; col detect with player
                    lda      Y_POS +u_offset1,s 
                    cmpa     #$80+PLAYER_RADIUS_Y 
                    bgt      notHit_diamond 
                    ldb      X_POS +u_offset1,s 
                    subb     playerXpos 
                    bpl      noNegDiam 
                    negb     
noNegDiam 
                    cmpb     #PLAYER_RADIUS_X 
                    bhi      notHit_diamond 
                    inc      diamondCount 
                    lda      playSoundFlags 
                    anda     #%11000000 
                    bne      nosfx91 
REPLACE_1_2_collectDiamondData_varFromIRQ1_3 
                    ldx      #0                           ;collectDiamondData 
                    stx      sfx_pointer_1 
nosfx91 
                    ADD_POINTS_DIAMOND  
                    ADD_CASH  100 
                    jmp      destroyEnemyObject 

; set HP = 0
notHit_diamond 
; no shots can effect diamonds
                    lda      Y_POS+u_offset1,s 
                    suba     #2                           ; falling speed 
                    lbvs     destroyEnemyObject 
                    sta      Y_POS+u_offset1,s 
                    lda      #OBJECT_SCALE 
                    sta      <VIA_t1_cnt_lo 
                    ldu      #FallingDiamnond 
                    tst      lightningOn 
                    beq      normalEndMacro2Dia 
                    clr      lightningOn 
                    lds      NEXT_ENEMY_OBJECT+u_offset1,s ; preload next user stack 
                    lda      #DEFAULT_ENEMY_INTENSITY 
                    MY_MOVE_TO_B_END  
                    _INTENSITY_A  
                    clra     
                    pulu     b,x,pc 
normalEndMacro2Dia 
                    lds      NEXT_ENEMY_OBJECT+u_offset1,s ; preload next user stack 
                    MY_MOVE_TO_A_END  
                    clra     
                    pulu     b,x,pc 
;
;***************************************************************************
;
; this is actually a JSR RTS
; without using stack
; PC-return address is kept in U
LARGE_OBJECT        =        1                            ; #noDoubleWarn 
largeObjectshotBehaviourStandardStartNoBase 
;                    TEST_TO_SHOOT  
largeObjectshotBehaviourStandardnoAdditional 
                    ldb      X_POS +u_offset1,s 
                    COL_DETECT_2A  
                    ldb      X_POS +u_offset1,s 
                    COL_DETECT_2B  
largeObjectshotBehaviourStandardStartNoCol 
                    lda      #OBJECT_SCALE 
                    sta      VIA_t1_cnt_lo 
                    jmp      ,u 

LARGE_OBJECT        =        0                            ; #noDoubleWarn 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
                    include  "objectEnemySwarm.asm"
; STUBS for BANK 1 enemies
;
;***************************************************************************
;
saucerBehaviour                                           ;#isfunction  
                    MY_MOVE_TO_D_START  
                    ldu      #back4Shot_saucer 
                    jmp      largeObjectshotBehaviourStandardnoAdditional 

back4Shot_saucer 
                    ldu      ENEMY_STRUCT+u_offset1,s 
                    ldy      WAIT_ANIM_TABLE,u            ; do animation of enemy in bank 1 
; we are in bank one, so one switch IRQ
REPLACE_1_2_saucerBehaviourBank1_varFromIRQ1_1 
                    ldx      #0                           ; saucerBehaviourBank1 
                    jmp      jmpBankIRQ1Shift 

backBank3Behaviour 
                    lds      NEXT_ENEMY_OBJECT+u_offset1,s ; preload next user stack 
                    puls     d,pc 
;
;***************************************************************************
;
moneyMothershipBehaviour                                  ;#isfunction  
                    MY_MOVE_TO_D_START  
                    ldu      #back4Shot_moneyMothership 
                    jmp      largeObjectshotBehaviourStandardnoAdditional 

back4Shot_moneyMothership 
                    ldu      ENEMY_STRUCT+u_offset1,s 
                    ldy      WAIT_ANIM_TABLE,u            ; do animation of enemy in bank 1 
; we are in bank one, so one switch IRQ
REPLACE_1_2_moneyMothershipBehaviourBank1_varFromIRQ1_1 
                    ldx      #0                           ; moneyMothershipBehaviourBank1 
                    jmp      jmpBankIRQ1Shift 

;
;***************************************************************************
;
moneySuckerBehaviour                                      ;#isfunction  
                    MY_MOVE_TO_D_START  
                    ldu      #back4Shot_moneySucker 
                    jmp      largeObjectshotBehaviourStandardnoAdditional 

back4Shot_moneySucker 
                    ldu      ENEMY_STRUCT+u_offset1,s 
                    ldy      WAIT_ANIM_TABLE,u            ; do animation of enemy in bank 1 
; we are in bank one, so one switch IRQ
REPLACE_1_2_moneySuckerBehaviourBank1_varFromIRQ1_1 
                    ldx      #0                           ; moneySuckerBehaviourBank1 
                    jmp      jmpBankIRQ1Shift 

;
;***************************************************************************
;
megaFiendBehaviour                                        ;#isfunction  
                    MY_MOVE_TO_D_START  
                    ldu      #back4Shot_megaFiend 
                    jmp      largeObjectshotBehaviourStandardnoAdditional 

back4Shot_megaFiend 
                    ldu      ENEMY_STRUCT+u_offset1,s 
                    ldy      WAIT_ANIM_TABLE,u            ; do animation of enemy in bank 1 
; we are in bank one, so one switch IRQ
REPLACE_1_2_megaFiendBehaviourBank1_varFromIRQ1_1 
                    ldx      #0                           ; megaFiendBehaviourBank1 
                    jmp      jmpBankIRQ1Shift 

;
;***************************************************************************
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
fallCashBehaviour                                         ;#isfunction  
                    MY_MOVE_TO_D_START  
; we are in bank one, so one switch IRQ
REPLACE_1_2_fallCashBehaviourBank1_varFromIRQ1_1 
                    ldx      #0                           ; fallCashBehaviourBank1 
                    jmp      jmpBankIRQ1Shift 

; for big alien shooting the scoopy
getUPointer1 
                    ldu      WAIT_ANIM_TABLE, u 
                    ldu      ,u 
REPLACE_1_2_getUPointer1Back_varFromIRQ1_1 
                    ldx      #0                           ; 
                    jmp      jmpBankIRQ1Shift 

getUPointer2 
                    ldu      WAIT_ANIM_TABLE, u 
                    ldu      ,u 
REPLACE_1_2_getUPointer2Back_varFromIRQ1_1 
                    ldx      #0                           ; 
                    jmp      jmpBankIRQ1Shift 

enemyHS1Behaviour 
                    MY_MOVE_TO_D_START  
                    ldu      ENEMY_STRUCT+u_offset1,s 
noAnimChangeEnemyHS 
                    lda      ANIM_POSITION+u_offset1,s 
                    lsla     
animNotFinishedHS 
                    ldu      ANGLE8_TABLE, u 
                    ldu      a,u 
                    lda      POSITION+u_offset1,s 
                    cmpa     #DOWN 
                    bne      notDownhs 
                    lda      Y_POS+u_offset1,s 
                    deca     
                    deca     
                    sta      Y_POS+u_offset1,s 
                    cmpa     #$80 
                    bne      positioningDonehs 
                    lda      #6                           ; facing left 
                    sta      ANIM_POSITION+u_offset1,s 
                    lda      #LEFT 
                    sta      POSITION+u_offset1,s 
                    bra      positioningDonehs 

notDownhs 
                    cmpa     #UP 
                    bne      notUphs 
                    lda      Y_POS+u_offset1,s 
                    inca     
                    inca     
                    sta      Y_POS+u_offset1,s 
                    cmpa     #$68 
                    bne      positioningDonehs 
                    lda      #2                           ; facing right 
                    sta      ANIM_POSITION+u_offset1,s 
                    lda      #RIGHT 
                    sta      POSITION+u_offset1,s 
                    bra      positioningDonehs 

notUphs 
                    cmpa     #LEFT 
                    bne      notLefths 
                    lda      X_POS+u_offset1,s 
                    deca     
                    deca     
                    sta      X_POS+u_offset1,s 
                    cmpa     #$90 
                    bne      positioningDonehs 
                    lda      #UP 
                    sta      POSITION+u_offset1,s 
                    lda      #0                           ; facing up 
                    sta      ANIM_POSITION+u_offset1,s 
                    bra      positioningDonehs 

notLefths 
                    cmpa     #RIGHT 
                    bne      notRighths 
                    lda      X_POS+u_offset1,s 
                    inca     
                    inca     
                    sta      X_POS+u_offset1,s 
                    cmpa     #$70 
                    bne      positioningDonehs 
                    lda      #4                           ; facing down 
                    sta      ANIM_POSITION+u_offset1,s 
                    lda      #DOWN 
                    sta      POSITION+u_offset1,s 
                    bra      positioningDonehs 

notRighths 
positioningDonehs 
                    lda      #OBJECT_SCALE 
                    sta      VIA_t1_cnt_lo 
                    lds      NEXT_ENEMY_OBJECT+u_offset1,s ; preload next user stack 
                    lda      #DEFAULT_ENEMY_INTENSITY 
                    MY_MOVE_TO_B_END  
                    _INTENSITY_A  
                    clra     
                    pulu     b,x,pc 
;UP                  =        1 
;DOWN                =        2 
;LEFT                =        3 
;RIGHT               =        4 
;NONE                =        0 
