; bank 3
BUG_HIT_X_OFFSET_SCOOP  =    13 
BUG_HIT_X_OFFSET    =        5 
BUG_HIT_Y_OFFSET    =        5 
                    include  "enemyShotColDetect.asm"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; colision detection player shot -> enemy
; only one shot is tested per game round
; two shots
; main must ensure the two to be tested shots are "halfway"
COL_DETECT_2A_BUG   macro    
                    COL_DETECT_ENEMY_SHOTS_ENEMY_BUG  testShot, Y_POS16, X_POS16, 1 
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; colision detection player shot -> enemy
; only one shot is tested per game round
; two shots
; main must ensure the two to be tested shots are "halfway"
COL_DETECT_2B_BUG   macro    
                    COL_DETECT_ENEMY_SHOTS_ENEMY_BUG  test2Shot, Y_POS16, X_POS16, 0 
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
COL_DETECT_BUG      macro    
                    COL_DETECT_2A_BUG  
                    ldb      X_POS16 +u_offset1,s 
                    COL_DETECT_2B_BUG  
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;BUG_SHOT_DELAY_CYCLES  =     50 
TEST_TO_SHOOT_BUG   macro    
                    ldd      bulletSpawnAt 
                    bne      noBulletSpawn\? 
 if  ENEMY_NO_SHOOTING = 1 
                    bra      noBulletSpawn\? 

 endif  
                    lda      shotCount 
                    cmpa     levelMaxEnemyShots 
                    bhs      noBulletSpawn\? 
                    lda      BUG_SHOT_DELAY+u_offset1,s 
                    beq      try_shot\? 
                    dec      BUG_SHOT_DELAY+u_offset1,s 
                    bra      noBulletSpawn\? 

try_shot\? 
                    ldx      currentLevelPointer 
                    lda      LEVEL_SHOT_DELAY_BUG,x 
                    sta      BUG_SHOT_DELAY+u_offset1,s 
                    lda      Y_POS16 +u_offset1,s 
                    ldb      X_POS16 +u_offset1,s 
                    std      bulletSpawnAt 
                    ldx      ENEMY_STRUCT+u_offset1,s 
                    lda      ENEMY_BULLET_SPEED, x 
                    sta      isBugShot 
; perhaps randomize bug shot (only level 99)
                    anda     #128+64+32 
                    cmpa     #128+64+32 
                    bne      noBulletSpawn\? 
                    lda      isBugShot 
                    anda     #%00011111 
                    RANDOM_B  
                    andb     #%10000001 
                    tstb     
                    beq      makeTripple\? 
                    bmi      makeMissile\? 
makeHunter\? 
                    ora      #%01000000 
                    sta      isBugShot 
                    bra      noBulletSpawn\? 

makeTripple\? 
                    ora      #%00100000 
                    sta      isBugShot 
                    bra      noBulletSpawn\? 

makeMissile\? 
                    ora      #%10000000 
noBulletSpawn_1\? 
                    sta      isBugShot 
noBulletSpawn\? 
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; this is actually a JSR RTS
; without using stack
; PC-return address is kept in U
shotBehaviourStandardStartBug 
                    COL_DETECT_BUG  
                    TEST_TO_SHOOT_BUG  
                    lda      #OBJECT_SCALE 
                    sta      VIA_t1_cnt_lo 
                    jmp      ,u 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; enemy is in its waiting position
; "wobbled" left and right
bugEntryBehaviour                                         ;#isfunction  
                    MY_MOVE_TO_D_START  
                    lda      #OBJECT_SCALE 
                    sta      VIA_t1_cnt_lo 
; "blend in " intensity slower advancein to default
; enemy can notbe hit while arriving (but also cannot shoot) 
; above macro must jmp to noAnimChangeEnemy
; because ANIM_COUNT / ANIM POSITION
; is reused by Attack pattern
; if it woldgo on "normally" 
; the Pattern data would be corrupted!
                    ldu      ENEMY_STRUCT+u_offset1,s 
; do animation of enemy 
                    tst      animDelayCounter 
                    bpl      noAnimChangeEnemyBug1 
                    inc      ANIM_POSITION+u_offset1,s 
                    lda      ANIM_POSITION+u_offset1,s 
                    asla     
                    ldx      WAIT_ANIM_TABLE, u 
                    ldx      a,x 
                    bne      animNotFinishedBug1 
                    clr      ANIM_POSITION+u_offset1,s 
noAnimChangeEnemyBug1 
                    lda      ANIM_POSITION+u_offset1,s 
                    lsla     
animNotFinishedBug1 
                    ldu      WAIT_ANIM_TABLE, u 
                    ldu      a,u 
                    lda      BUG_APPEARING_INTENSITY+u_offset1,s 
                    ldb      Vec_Loop_Count+1 
                    bitb     #1 
                    bne      noIntChangeBug 
                    inc      BUG_APPEARING_INTENSITY+u_offset1,s 
                    cmpa     #DEFAULT_ENEMY_INTENSITY 
                    blo      noIntChangeBug 
; intro ofbug done -> initialize bug movement
; todo
                    ldx      #bugBehaviourGoAbsolut 
                    stx      BEHAVIOUR+u_offset1,s 
; save current position to new position "pointers"
                    ldd      Y_POS+u_offset1,s 
                    sta      Y_POS16+u_offset1,s 
                    stb      X_POS16+u_offset1,s 
; generate new target position
                    RANDOM_A  
                    RANDOM_B  
                    anda     #%01110000                   ; not negative and smaller ($7f-15) y pos 
                    std      Y_POS+u_offset1,s            ; that is the target 
; generate deltas to add 
; Y
                    ldb      Y_POS16+u_offset1,s 
                    sex      
                    std      tmp16_tmp 
                    ldb      Y_POS+u_offset1,s 
                    sex      
                    subd     tmp16_tmp 
                    ASRA     
                    RORB                                  ; half it 
                    stb      BUG_ADDS_YX+u_offset1,s 
; X
                    ldb      X_POS16+u_offset1,s 
                    sex      
                    std      tmp16_tmp 
                    ldb      X_POS+u_offset1,s 
                    sex      
                    subd     tmp16_tmp 
                    ASRA     
                    RORB                                  ; half it 
                    stb      1+BUG_ADDS_YX+u_offset1,s 
noIntChangeBug 
                    inc      lightningOn 
                    lds      NEXT_ENEMY_OBJECT+u_offset1,s ; preload next user stack 
                    MY_MOVE_TO_B_END  
                    _INTENSITY_A  
                    clra     
                    pulu     b,x,pc 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bugBehaviourGoAbsolut                                     ;#isfunction  
                    lda      Y_POS16+u_offset1,s 
                    ldb      X_POS16+u_offset1,s 
                    MY_MOVE_TO_D_START  
                    ldu      #back1ShotBug 
                    jmp      shotBehaviourStandardStartBug 

back1ShotBug 
 if  BUGS_DONT_MOVE = 1 
 else  
                    ldb      BUG_ADDS_YX+u_offset1,s      ; target y, x position in d 
                    sex      
                    addd     Y_POS16+u_offset1,s 
                    std      Y_POS16+u_offset1,s 
                    ldb      1+BUG_ADDS_YX+u_offset1,s    ; target y, x position in d 
                    sex      
                    addd     X_POS16+u_offset1,s 
                    std      X_POS16+u_offset1,s 
                    suba     X_POS+u_offset1,s 
                    bpl      noNegB1 
                    nega     
noNegB1 
                    cmpa     #4 
                    bhi      noNewTargetNecessary 
                    lda      Y_POS16+u_offset1,s 
                    suba     Y_POS+u_offset1,s 
                    bpl      noNegB2 
                    nega     
noNegB2 
                    cmpa     #4 
                    bhi      noNewTargetNecessary 
                    clr      1+Y_POS16+u_offset1,s 
                    clr      1+X_POS16+u_offset1,s 
                    RANDOM_A  
                    RANDOM_B  
                    anda     #%01110000                   ; not negative and smaller ($7f-15) y pos 
                    std      Y_POS+u_offset1,s            ; that is the target 
; Y
                    ldb      Y_POS16+u_offset1,s 
                    sex      
                    std      tmp16_tmp 
                    ldb      Y_POS+u_offset1,s 
                    sex      
                    subd     tmp16_tmp 
                    ASRA     
                    RORB                                  ; half it 
                    stb      BUG_ADDS_YX+u_offset1,s 
; X
                    ldb      X_POS16+u_offset1,s 
                    sex      
                    std      tmp16_tmp 
                    ldb      X_POS+u_offset1,s 
                    sex      
                    subd     tmp16_tmp 
                    ASRA     
                    RORB                                  ; half it 
                    stb      1+BUG_ADDS_YX+u_offset1,s 
 endif  
noNewTargetNecessary 
                    ldu      ENEMY_STRUCT+u_offset1,s 
; do animation of enemy 
                    tst      animDelayCounter 
                    bpl      noAnimChangeEnemyBug2 
                    inc      ANIM_POSITION+u_offset1,s 
                    lda      ANIM_POSITION+u_offset1,s 
                    asla     
                    ldx      WAIT_ANIM_TABLE, u 
                    ldx      a,x 
                    bne      animNotFinishedBug2 
                    clr      ANIM_POSITION+u_offset1,s 
noAnimChangeEnemyBug2 
                    lda      ANIM_POSITION+u_offset1,s 
                    lsla     
animNotFinishedBug2 
                    ldu      WAIT_ANIM_TABLE, u 
                    ldu      a,u 
doneWBug2 
                    END_ENEMY_DISPLAY  
                    clra     
                    pulu     b,x,pc 
;
;***************************************************************************
;
; does all enemy painting in bank 1!
; switches bank in MOVETO
enemyExplosionBank1StubBehaviour                          ;#isfunction  
                    MY_MOVE_TO_D_START  
explosionEntryFromHitCheck 
                    lda      EXPLOSION_SCALE+u_offset1,s 
                    adda     #2 
                    cmpa     #30 
                    lbhs     destroyEnemyObject 
                    sta      EXPLOSION_SCALE +u_offset1,s 
                    sta      VIA_t1_cnt_lo 
; we are in bank one, so one switch IRQ
REPLACE_1_2_enemyBank1ExplosionBehaviour_varFromIRQ1_1 
                    ldx      #0                           ; enemyBank1ExplosionBehaviour 
                    jmp      jmpBankIRQ1Shift 

backToExplosionBehaviour 
                    lds      NEXT_ENEMY_OBJECT+u_offset1,s ; preload next user stack 
                    puls     d,pc 
;
;***************************************************************************
;
failureBehaviour                                          ;#isfunction  
                    lda      Y_POS16+u_offset1,s 
                    ldb      X_POS16+u_offset1,s 
                    MY_MOVE_TO_D_START  
                    ldu      #back2ShotBug 
                    jmp      shotBehaviourStandardStartBug 

back2ShotBug 
;back4ShotFailB 
                    ldu      ENEMY_STRUCT+u_offset1,s 
                    ldy      WAIT_ANIM_TABLE,u            ; do animation of enemy in bank 1 
; todo movement of failur objects
; we are in bank one, so one switch IRQ
REPLACE_1_2_failureBehaviourBank1_varFromIRQ1_1 
                    ldx      #0                           ; failureBehaviourBank1 
                    jmp      jmpBankIRQ1Shift 

backToBehaviour 
                    lds      NEXT_ENEMY_OBJECT+u_offset1,s ; preload next user stack 
                    puls     d,pc 
;
;***************************************************************************
;
