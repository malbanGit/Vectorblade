; bank 3
; ****************************************************************************************************
; patterns for enemies to enter the game
; each pattern
; has a series of "checkpoints"
; a starting coordinate y, x
; a 8 bit "adder" to reach the next coordinate
; and an angle. that the enemies should be displayed with
;
;
ANGLE_DIF           =        45                           ; 360/16 
;PATTERN_TARGET_REACHED_RADIUS  =  1                       ; radius arround a point that is checked whether the designated target of the pattern has been reached 
;
;
; spawns enemies according to the current levels
; spawn patterns
doIntroAppearance                                         ;#isfunction  
                    tst      patternDelayCounter 
                    beq      spawnAllEnemies 
                    inc      patternDelayCounter 
                    lda      patternDelayCounter 
                    cmpa     #72 
                    bne      notFinishedIntro 
                    lda      lockPurchased 
                    anda     #$ff - GAMEPHASE_INTRO 
                    sta      lockPurchased 
;                    lda      #GAMEPHASE_INGAME 
;                    sta      game_phase 
notFinishedIntro 
                    rts      

; ...............................................................................
spawnAllEnemies 
                    ldd      LEVEL_ENEMY_COUNT,y 
                    stb      tmp1_tmp 
                    ldy      currentLevelPointer 
spawnNextEnemy 
; in y the current level struct
                    jsr      spawnEnemy 
                    beq      spawningDone                 ; savety measure 
                    inc      bonusSpawnCount 
                    ldy      LEVEL_ENEMY_DEFINITION,y 
                    lda      levelEnemyCount 
compareEnemyCountAgainDA 
                    cmpa     ,y                           ; number of different enemy definitions in this level 
                    blo      enemyCountOkDA 
                    suba     ,y 
                    bra      compareEnemyCountAgainDA 

enemyCountOkDA 
                    leay     1,y 
                    asla     
                    ldy      a,y                          ; current enemy definition 
                    lda      ADDITIONAL_TYPE_INFO,y 
                    anda     #TYPE_SHIELD 
                    beq      noShieldEnemy_a 
                    dec      enemyCount                   ; don't count shield enemies as level finish enemies 
noShieldEnemy_a 
                    sty      ENEMY_STRUCT,u               ; hp get overwritten anyway - so we can store 16 bit 
; in y the current enemy struct
; in u current enemy object struct
                    lda      ENEMY_STRENGTH,y 
                    ldb      difficulty 
                    andb     #$f                          ; 
                    beq      easy1_a 
                    decb     
                    beq      difCont1_a                   ; normal 
                    decb     
                    beq      hard1_a 
impossible_a 
                    adda     #2 
hard1_a 
                    adda     #2 
                    bra      difCont1_a 

easy1_a 
                    lsra     
                    bne      difCont1_a 
                    lda      #1 
difCont1_a 
                    lsla     
                    lsla     
                    lsla                                  ; HP in upper nibble 
                    sta      HITPOINTS,u                  ; lower nibble is BITMASK = 0 
                    clr      ALL_PURPOSE,u 
                    stx      MY_PATTERN,u 
                    clr      ANIM_POSITION,u 
                    clr      PATTERN_POSITION,u 
                    lda      levelEnemyCountUID 
                    sta      POSITION, u 
                    inc      levelEnemyCountUID 
                    inc      levelEnemyCount 
                    ldd      #directIntroBehaviour 
                    std      BEHAVIOUR,u 
                    ldy      currentLevelPointer 
                    ldx      LEVEL_WAITING_PATTERN,y      ; in x now waiting pattern pointer 
                    lda      POSITION,u 
                    lsla     
                    leax     a,x 
                    ldd      ,x                           ; target y, x position in d 
                    std      Y_POS,u 
                    sta      Y_POS16,u 
                    stb      X_POS16,u 
                    clr      Y_POS16+1,u 
                    clr      X_POS16+1,u 
                    dec      tmp1_tmp 
                    lbpl     spawnNextEnemy 
spawningDone 
                    inc      patternDelayCounter 
                    rts      

;
; ...............................................................................
;
doIntro                                                   ;#isfunction  
                    ldy      currentLevelPointer 
                    lda      difficulty 
                    anda     #$f                          ; 
                    cmpa     #SUPER_IMPOSSIBLE 
                    blo      normalDif 
                    lda      LEVEL_TYPE,y 
                    anda     #%00011111 
                    cmpa     #LEVEL_TYPE_KAMIKAZE 
                    beq      normalDif 
                    lda      LEVEL_TYPE,y 
                    anda     #%00011111 
                    cmpa     #LEVEL_TYPE_BONUS 
                    beq      normalDif 
                    ldd      #20 
                    stb      tmp1_tmp 
                    lda      levelCount 
                    cmpa     #54 
                    bne      not54 
                    ldd      #4 
                    stb      tmp1_tmp 
                    bra      specialLevelsDone 

not54 
                    cmpa     #54+5                        ; these shields MOVE - looping pattern -> cannot be done with "static" 
                    beq      normalDif 
                    cmpa     #$53                         ; tribble 
                    beq      normalDif 
                    cmpa     #76                          ; boss 3 
                    beq      normalDif 
specialLevelsDone 
;                    lda      #GAMEPHASE_INGAME 
;                    sta      game_phase 
                    lda      lockPurchased 
                    anda     #$ff - GAMEPHASE_INTRO 
                    sta      lockPurchased 
                    jmp      spawnNextEnemy 

normalDif 
                    lda      LEVEL_TYPE,y 
                    anda     #LEVEL_APPEAR_AT_WAITING 
                    lbne     doIntroAppearance 
                    tst      patternDelayCounter 
                    bmi      doIntroForReal 
                    dec      patternDelayCounter 
doneDoIntro1 
                    rts      

; ...............................................................................
doIntroForReal 
                    dec      introWaveEnemyDelayCount 
                    bne      doneDoIntro1 
                    ldx      introWaveCurrentPattern      ; like above "entry" 
                    lda      P_DELAY_BETWEEN_ENEMIES,x 
                    sta      introWaveEnemyDelayCount 
                    jsr      spawnEnemy 
                    beq      doneDoIntro1 
                    dec      levelMaxEnemy 
                    inc      bonusSpawnCount 
                    ldy      LEVEL_ENEMY_DEFINITION,y 
                    lda      levelEnemyCount 
compareEnemyCountAgain 
                    cmpa     ,y                           ; number of different enemy definitions in this level 
                    blo      enemyCountOk 
                    suba     ,y 
                    bra      compareEnemyCountAgain 

enemyCountOk 
                    leay     1,y 
                    asla     
                    ldy      a,y                          ; current enemy definition 
                    lda      ADDITIONAL_TYPE_INFO,y 
                    anda     #TYPE_SHIELD 
                    beq      noShieldEnemy 
                    dec      enemyCount                   ; don't count shield enemies as level finish enemies 
noShieldEnemy 
                    sty      ENEMY_STRUCT,u               ; hp get overwritten anyway - so we can store 16 bit 
                    lda      inversePatttern 
                    sta      INVERSE_INTRO_PATTERN, u 
                    lda      ENEMY_STRENGTH,y 
                    ldb      difficulty 
                    andb     #$f                          ; 
                    beq      easy1 
                    decb     
                    beq      difCont1 
                    decb     
                    beq      hard1 
impossible 
                    adda     #2 
hard1 
                    adda     #2 
                    bra      difCont1 

easy1 
                    lsra     
                    bne      difCont1 
                    lda      #1 
difCont1 
                    lsla     
                    lsla     
                    lsla                                  ; HP in upper nibble 
                    sta      HITPOINTS,u                  ; lower nibble is BITMASK = 0 
                    clr      ALL_PURPOSE,u 
                    stx      MY_PATTERN,u 
                    clr      ANIM_POSITION,u 
                    clr      PATTERN_POSITION,u 
                    lda      ADDITIONAL_TYPE_INFO,y 
                    anda     #TYPE_DONT_WAIT 
                    bne      enemyGetNoUID 
                    lda      levelEnemyCountUID 
                    sta      POSITION, u 
                    inc      levelEnemyCountUID 
enemyGetNoUID 
                    inc      levelEnemyCount 
                    inc      introWaveEnemyCount 
                    ldd      P_PATTERN_PATTERN_START + P_YPOS,x ; first position 
                    bne      notEmptyPattern 
                    ldd      #enemyDelayBehaviour 
                    clr      ALL_PURPOSE, u 
                    bra      goOnIntro 

notEmptyPattern 
                    std      Y_POS,u 
                    sta      Y_POS16, u 
                    tst      INVERSE_INTRO_PATTERN, u 
                    beq      noInversePatternIntro 
                    negb     
                    stb      X_POS,u 
noInversePatternIntro 
                    stb      X_POS16, u 
                    clr      Y_POS16+1, u 
                    clr      X_POS16+1, u 
                    ldd      #enemyIntroPatternBehaviour 
goOnIntro 
                    cmpy     #enemyTribble 
                    bne      normalEnemy 
; init tribble
                    lda      #1 
                    sta      TRIBBLE_HIT_POINTS, u 
                    RANDOM_A  
                    ora      #%10000000 
                    cmpa     #-$58 
                    bgt      trib_swarmyaok 
                    adda     #$28 
trib_swarmyaok 
                    sta      Y_POS, u 
                    RANDOM_A2  
                    cmpa     #-$80+30 
                    bgt      trib_xPosCorrect_1 
                    lda      #-$80+30 
trib_xPosCorrect_1 
                    cmpa     #$7f-30 
                    blt      trib_xPosCorrect_2 
                    lda      #$7f-30 
trib_xPosCorrect_2 
                    sta      X_POS, u 
                    clr      TRIBBLE_ANIM_POS, u 
                    clr      TRIBBLE_ALL_PURPOSE, u       ;flash length 
                    inc      swarmCounter 
                    lda      swarmCounter 
                    anda     #%00000011 
                    lsla     
                    lsla     
                    lsla     
                    lsla     
                    sta      TRIBBLE_MOVEMENT_INFO, u 
                    ldd      #$ffff 
                    std      TRIBBLE_LIFE_TIME, u 
; TribbleEnemyStruct
                    ldd      #tribbleBehaviour 
normalEnemy 
                    std      BEHAVIOUR,u 
                    lda      introWaveEnemyCount 
                    cmpa     patternEnemyCount            ;,x ; P_NUMBER_OF_ENEMIES,x 
                    blo      thisPatternNotEnded 
thisIntroPatternIsDone 
; init next intro pattern if available
                    clr      introWaveEnemyCount 
                    ldx      currentLevelPointer 
                    ldx      LEVEL_INTRO_PATTERN,x        ; list of level pattern are pointed to by x 
                    inc      introWaveCurrentPatternCount 
                    ldb      introWaveCurrentPatternCount 
; if $20 or greater, than result negative -> crash
                    clra     
                    lslb                                  ; times two since 16bit pointer 
                    lslb                                  ; times two since 16bit pointer 
                    leax     d,x 
                    ldd      LINE_PATTERN_INVERS,x 
                    std      inversePatttern              ; also stores patternEnemyCount 
                    ldx      LINE_PATTERN_DEF,x 
                    lda      P_START_DELAY_OF_PATTERN,x 
                    sta      patternDelayCounter 
                    stx      introWaveCurrentPattern 
                    bne      introWavesNotFinishedYet 
; in game vars
;                    lda      #GAMEPHASE_INGAME 
;                    sta      game_phase 
                    lda      lockPurchased 
                    anda     #$ff - GAMEPHASE_INTRO 
                    sta      lockPurchased 
thisPatternNotEnded 
introWavesNotFinishedYet 
notSpawned 
done 
                    rts      

; ...............................................................................
                    include  "objectEnemy.asm"
lastNormalEnemyAddress 
                    include  "objectEnemyShots.asm"
                    include  "objectBonus.asm"
                    include  "objectStar.asm"
                    include  "objectBug.asm"
                    include  "objectDodger.asm"
; from player shot
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; called when player shot hits an enemy
; bullet count of shot is reduced by one
; if result is 0 bullets -> shot is removed
;
; additionally the enemy
; is changed from "enemy" to explosion
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
UPDATE_EMPTY_PLAYERLIST2  macro  
                    dec      playerShotCount 
                    ldd      playershotlist_empty_head    ; set u free, as new free head 
                    std      NEXT_PLAYERSHOT_OBJECT,x     ; load to u the next linked list element 
                    stx      playershotlist_empty_head 
; correct current test shot 
                    cmpx     testShot 
                    bne      wasNottestShot1\? 
                    ldd      #0 
                    std      testShot 
wasNottestShot1\? 
 if  NO_2SHOT_TEST = 1 
 else  
                    cmpx     test2Shot 
                    bne      wasNottestShot2\? 
                    ldd      #0 
                    std      test2Shot 
wasNottestShot2\? 
 endif  
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
removeCurrentShotAndObject                                ;#isfunction  
                    clr      tmp_isSupershot 
                    tst      explosionSound 
                    bne      noInc 
                    inc      explosionSound               ; next game round, play an explosion 
noInc 
                    ldb      SHOT_RADIUS, x 
                    cmpb     #SHOT_RADIUS6 
                    beq      isLazerShot 
                    cmpb     #SHOT_RADIUS0 
                    lbeq     isNo5Shot                    ; shot is "empty" 
;:::::::::::::::::::::::::
; remove shot when shield
; in swarm, this is NOT working!
                    ldy      BEHAVIOUR+u_offset1,s 
                    cmpy     #swarmBehaviour 
                    beq      noShieldTestSwarmer 
                    ldy      ENEMY_STRUCT+u_offset1,s 
                    lda      ADDITIONAL_TYPE_INFO,y 
                    anda     #TYPE_SHIELD 
                    lbne     isNo5Shot                    ; remove 
noShieldTestSwarmer 
; remove shot when shield
;:::::::::::::::::::::::::
                    cmpb     #SHOT_RADIUS5 
                    beq      is5Shot 
                    cmpb     #SHOT_RADIUS4 
                    lbeq     makeShot3 
                    cmpb     #SHOT_RADIUS3 
                    lbeq     makeShot2 
                    cmpb     #SHOT_RADIUS2 
                    lbeq     makeShot1 
                    bra      isOneShot 

is5Shot 
; five shot is also a "1" time shot
                    inc      tmp_isSupershot              ; positive is supershot 
isOneShot 
                    tst      SCOOP_SHOTS, x 
                    lbeq     shotHasNoScoopies 
                    ldb      #SHOT_RADIUS0 
                    stb      SHOT_RADIUS, x 
                    jmp      shotHandleDone 

isLazerShot 
                    lda      difficulty 
                    anda     #$f                          ; 
                    lbeq     lasershotReEntry 
                    ldy      ENEMY_STRUCT+u_offset1,s 
                    cmpy     #enemyTribble 
                    lbeq     lasershotReEntry 
                    lda      laserTmp2 
                    beq      mainLaser 
 if  SCOOPY_HIT_LARGE_OBJECT = 1 
                    bmi      mainLaser 
 endif  
                    deca     
                    beq      rightLaser 
leftLaser 
                    tst      laserEnemyPointerLeft 
                    beq      enterLaserValuesLeft 
testLaserValuesLeft 
                    lda      laserTmp 
                    cmpa     laserLowestYLeft 
                    blt      enterLaserValuesLeft 
                    jmp      [backJump]                   ; jump back to where collission detection started 

enterLaserValuesLeft 
                    lda      laserTmp 
                    sta      laserLowestYLeft 
                    sts      laserEnemyPointerLeft 
                    jmp      [backJump]                   ; jump back to where collission detection started 

;..............
rightLaser 
                    tst      laserEnemyPointerRight 
                    beq      enterLaserValuesRight 
testLaserValuesRight 
                    lda      laserTmp 
                    cmpa     laserLowestYRight 
                    blt      enterLaserValuesRight 
                    jmp      [backJump]                   ; jump back to where collission detection started 

enterLaserValuesRight 
                    lda      laserTmp 
                    sta      laserLowestYRight 
                    sts      laserEnemyPointerRight 
                    jmp      [backJump]                   ; jump back to where collission detection started 

;..............
mainLaser 
                    tst      laserEnemyPointer 
                    beq      enterLaserValues 
testLaserValues 
                    lda      laserTmp 
                    cmpa     laserLowestY 
                    blt      enterLaserValues 
                    jmp      [backJump]                   ; jump back to where collission detection started 

enterLaserValues 
                    lda      laserTmp 
                    sta      laserLowestY 
 if  SCOOPY_HIT_LARGE_OBJECT = 1 
                    ldb      laserTmp2 
                    bpl      normalMainLaser 
; shorten "scoopy" lasers
                    ldb      SCOOP_SHOTS, x               ; tst 
                    bitb     #$f0 
                    beq      noleftLserBiggySet 
                    cmpa     laserLowestYLeft 
                    bgt      noleftLserBiggySet 
                    sta      laserLowestYLeft 
                    sts      laserEnemyPointerLeft 
noleftLserBiggySet 
                    bitb     #$f0 
                    beq      noRightLserBiggySet 
                    cmpa     laserLowestYRight 
                    bgt      noRightLserBiggySet 
                    sta      laserLowestYRight 
                    sts      laserEnemyPointerRight 
noRightLserBiggySet 
normalMainLaser 
 endif  
                    tst      tmp2_tmp_unique 
                    lbne     shotHandleDone               ;bossFight1shr; boss2gothit 
                    sts      laserEnemyPointer 
                    jmp      [backJump]                   ; jump back to where collission detection started 

lasershotReEntry 
                    dec      tmp_isSupershot              ; negative is lazer 
                    jmp      shotHandleDone 

isNo5Shot 
;
; shot count is now zero -> remove the player shot
;
; we must keep DS intact in this remove -> use y register instead
;
; look if there are scoopies
; if so makes this a zero shot, do not remove yet
; otherwise the scoopie shots will also disappear
                    tst      SCOOP_SHOTS, x 
                    beq      shotHasNoScoopies 
                    ldb      #SHOT_RADIUS0 
                    stb      SHOT_RADIUS, x 
REPLACE_1_2_zeroPlayerShotBehaviour_varFrom0_0 
                    ldd      #0                           ;zeroPlayerShotBehaviour 
                    std      BEHAVIOUR,x 
                    jmp      shotHandleDone 

shotHasNoScoopies: 
                    cmpx     playershotlist_objects_head  ; is it the first? 
                    bne      was_not_first_repls          ; no -> jump 
was_first_repls 
                    ldy      NEXT_PLAYERSHOT_OBJECT,x     ; y pointer to next objext 
                    sty      playershotlist_objects_head  ; the next object will be the first 
                    UPDATE_EMPTY_PLAYERLIST2              ; and clean up the empties 
                    bra      shotHandleDoneRemoved 

was_not_first_repls                                       ;       find previous, go thru all objects from first and look where "I" am the next... 
                    ldy      playershotlist_objects_head  ; start at list head 
try_next_repls 
                    cmpx     NEXT_PLAYERSHOT_OBJECT,y     ; am I the next object of the current investigated list element 
                    beq      found_next_switch_repls      ; jup -> jump 
                    ldy      NEXT_PLAYERSHOT_OBJECT,y     ; otherwise load the next as new current 
                    bra      try_next_repls               ; and search further 

found_next_switch_repls 
                    ldd      NEXT_PLAYERSHOT_OBJECT,x     ; we load "our" next object to d 
                    std      NEXT_PLAYERSHOT_OBJECT,y     ; and store our next in the place of our previous next and thus eleminate ourselfs 
                    UPDATE_EMPTY_PLAYERLIST2              ; and clean up the empties 
                    bra      shotHandleDoneRemoved 

; remove of shot finished
;
; here decrease bullet count by 1
makeShot3 
;:::::::::::::::::::::::::
; remove shot when shield
;                    ldy      ENEMY_STRUCT+u_offset1,s 
;                    lda      ADDITIONAL_TYPE_INFO,y 
;                    anda     #TYPE_SHIELD 
;                    bne      isNo5Shot                    ; remove 
; remove shot when shield
;:::::::::::::::::::::::::
; if normal enemy
;   if bug
;   else 
;       if normal enemy is dead
;          yes - go on
;       else not do damge and reduce more!
; else (boss)
;   do all damage at once
                    ldb      #SHOT_RADIUS3 
                    stb      SHOT_RADIUS, x 
REPLACE_1_2_threePlayerShotBehaviour_varFrom0_0 
                    ldd      #0                           ;threePlayerShotBehaviour 
                    std      BEHAVIOUR,x 
                    bra      shotHandleDone 

makeShot2 
;:::::::::::::::::::::::::
; remove shot when shield
;                    ldy      ENEMY_STRUCT+u_offset1,s 
;                    lda      ADDITIONAL_TYPE_INFO,y 
;                    anda     #TYPE_SHIELD 
;                    lbne     isNo5Shot                    ; remove 
; remove shot when shield
;:::::::::::::::::::::::::
                    ldb      #SHOT_RADIUS2 
                    stb      SHOT_RADIUS, x 
REPLACE_1_2_twoPlayerShotBehaviour_varFrom0_0 
                    ldd      #0                           ;twoPlayerShotBehaviour 
                    std      BEHAVIOUR,x 
                    bra      shotHandleDone 

makeShot1 
;:::::::::::::::::::::::::
; remove shot when shield
;                    ldy      ENEMY_STRUCT+u_offset1,s 
;                    lda      ADDITIONAL_TYPE_INFO,y 
;                    anda     #TYPE_SHIELD 
;                    lbne     isNo5Shot                    ; remove 
; remove shot when shield
;:::::::::::::::::::::::::
                    ldb      #SHOT_RADIUS1 
                    stb      SHOT_RADIUS, x 
REPLACE_1_2_onePlayerShotBehaviour_varFrom0_0 
                    ldd      #0                           ;onePlayerShotBehaviour 
                    std      BEHAVIOUR,x 
shotHandleDone                                            ;#isfunction  
;
; everything shot related done -> now explode the enemy
shotHandleDoneRemoved 
; perhaps not explode yet
; look at Hitpoints of enemy
                    lda      diverseFlags 
                    anda     #BIT_FLAG_IS_BOSSFIGHT_ANY 
                    beq      noBossFight 
                    cmpa     #%00000010 
                    lbne     notBoss1Fight 
boss1Fight 
bossFight1shr 
                    ldx      bossHP 
                    lda      tmp_isSupershot 
                    bpl      noLaserShot 
                    lda      Vec_Loop_Count+1 
                    anda     #1 
                    beq      noLaserDamgeThisRound 
noLaserShot 
                    lda      bulletDamage 
doWeaponDamage 
                    nega     
                    leax     a,x 
noLaserDamgeThisRound 
noWeaponDamage 
wasSuperShot 
                    stx      bossHP 
                    inc      bossWasHit 
                    jmp      [backJump] 

noBossFight 
shotHandleDone_noBoss 
                    tfr      x,y 
                    ldx      ENEMY_STRUCT+u_offset1,s 
                    cmpx     #higherThanBiggies 
                    bhi      normalEnemy_ne 
doWeaponDamage1_ne 
                    ldb      bulletDamage 
                    negb     
                    sex      
                    addd     BIG_HP +u_offset1,s 
noWeaponDamage1_ne 
                    lbeq     yesExplodeEnemy_biggy 
                    lbmi     yesExplodeEnemy_biggy 
                    std      BIG_HP +u_offset1,s 
                    lda      #HIT_FLASH_LENGTH            ; 15/50 s brightness flash of enemy for being hit and not dead 
                    sta      ALL_PURPOSE +u_offset1,s 
                    jmp      [backJump]                   ; jump back to where collission detection started 

normalEnemy_ne 
                    ldd      ANGLE8_TABLE,x 
                    beq      bugHp 
                    lda      ADDITIONAL_TYPE_INFO,x 
                    anda     #TYPE_SHIELD 
                    bne      notShootable 
                    lda      HITPOINTS +u_offset1,s 
                    lsra     
                    lsra     
                    lsra     
doWeaponDamage1 
                    suba     bulletDamage 
noWeaponDamage1 
                    lbeq     yesExplodeEnemy 
                    lbmi     yesExplodeEnemy 
                    lsla     
                    lsla     
                    lsla     
; do not explode 
; this resets the shot delay to zero -> don't bothher
; enemies that are hit have a right to be angry!
                    sta      HITPOINTS +u_offset1,s 
endofHit 
                    lda      #HIT_FLASH_LENGTH            ; 15/50 s brightness flash of enemy for being hit and not dead 
                    sta      ALL_PURPOSE +u_offset1,s 
                    jmp      [backJump]                   ; jump back to where collission detection started 

; if a shield hit occured
; ensure next bullet test is done with onther bullet (if possible)
notShootable 
; remove current shot from "hit list"
                    cmpy     testShot 
                    bne      notShootable2 
; do not remove shot if difficulty 1 laser
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #6                           ; laser 
                    bne      noLaserTest 
                    lda      difficulty 
                    beq      endofHit 
noLaserTest 
                    ldx      NEXT_SHOT_OBJECT,y 
                    cmpx     #OBJECT_LIST_COMPARE_ADDRESS 
                    bhi      nextShotOk 
                    ldx      #0                           ; playershotlist_objects_head 
nextShotOk 
                    stx      testShot 
                    bra      endofHit 

notShootable2 
                    cmpy     test2Shot 
                    bne      endofHit                     ; shot wasremoved befor 
                    ldx      NEXT_SHOT_OBJECT,y 
                    cmpx     #OBJECT_LIST_COMPARE_ADDRESS 
                    bhi      nextShotOk2 
                    ldx      #0                           ; playershotlist_objects_head 
nextShotOk2 
                    stx      test2Shot 
                    bra      endofHit 

bugHp 
shotHandleDone_Bug 
                    lda      BUG_ENEMY_HITPOINTS +u_offset1,s 
doWeaponDamage2 
                    suba     bulletDamage 
                    beq      yesExplodeBug 
                    cmpa     #255-32 
                    bhi      yesExplodeBug 
; do not explode 
                    sta      BUG_ENEMY_HITPOINTS +u_offset1,s 
                    lda      #HIT_FLASH_LENGTH            ; 15/50 s brightness flash of enemy for being hit and not dead 
                    sta      ALL_PURPOSE +u_offset1,s 
noWeaponDamage2 
                    jmp      [backJump]                   ; jump back to where collission detection started 

yesExplodeBug 
                    lda      Y_POS16+u_offset1,s 
                    ldb      X_POS16+u_offset1,s 
                    std      Y_POS+u_offset1,s 
; todo possible a big bug explosion? 
; inc rankDrop
                    stb      rankDrop                     ; do not allow zero as rank drop x pos 
                    bne      yesExplodeEnemy_bug 
                    inc      rankDrop 
yesExplodeEnemy_bug 
                    ldd      BEHAVIOUR +u_offset1,s 
                    cmpd     #bugBehaviourGoAbsolut 
                    beq      explodeNormalBug 
                    cmpd     #failureBehaviour 
                    lbne     yesExplodeEnemy_biggy 
                    ldd      Y_POS+u_offset1,s 
                    std      bonusSpawnPosition 
                    inc      bonusHitCount 
entryFromOtherBigs 
                    ADD_POINTS_ENEMY_DESTROY  
entryFromOtherBigsWithoutScore 
                    inc      explosionSound               ; next game round, play an explosion 
                    lda      #-1 
                    sta      ALL_PURPOSE +u_offset1,s     ; negative means this enemy is an explosion 
                    ldd      #enemyExplosionBank1StubBehaviour 
                    std      BEHAVIOUR +u_offset1,s       ; negative means this enemy is an explosion 
; x not set when from scoopy
                    ldx      ENEMY_STRUCT+u_offset1,s 
                    ldx      WAIT_ANIM_TABLE, x 
                    stx      SMARTLIST_ORG+u_offset1,s 
                    lda      #9                           ; scale 
                    sta      EXPLOSION_SCALE +u_offset1,s 
                    lda      #$7f                         ; intensity 
                    sta      EXPLOSION_INTENSITY +u_offset1,s 
; failures "behave"like lasers in
; that the explosion is called AFTER all other enemies
; makes bankswitching "in between" easier
                    tst      laserTag 
                    lbeq     explosionEntryFromHitCheck 
                    jmp      [backJump] 

explodeNormalBug 
                    ldd      Y_POS+u_offset1,s 
                    std      bonusSpawnPosition 
                    inc      bonusHitCount 
                    ADD_POINTS_ENEMY_DESTROY  
                    inc      explosionSound               ; next game round, play an explosion 
                    lda      #-1 
                    sta      ALL_PURPOSE +u_offset1,s     ; negative means this enemy is an explosion 
                    ldd      #enemyExplosionBehaviour 
                    std      BEHAVIOUR +u_offset1,s       ; negative means this enemy is an explosion 
                    ldx      ENEMY_STRUCT+u_offset1,s 
                    ldx      WAIT_ANIM_TABLE, x 
                    ldx      , x                          ; load first animation 
                    stx      SMARTLIST_ORG+u_offset1,s 
                    lda      #9                           ; scale 
                    sta      EXPLOSION_SCALE +u_offset1,s 
                    lda      #$7f                         ; intensity 
                    sta      EXPLOSION_INTENSITY +u_offset1,s 
; failures "behave"like lasers in
; that the explosion is called AFTER all other enemies
; makes bankswitching "in between" easier
                    tst      laserTag 
                    lbeq     explosionBevaiourEntryFromShotTest 
                    jmp      [backJump] 

yesExplodeEnemy_biggy 
; todo add enemy SCORE
                    lda      diverseFlags 
                    anda     #$ff-BIT_BIG_ENEMY_IN_PLAY 
                    sta      diverseFlags 
                    ldd      BEHAVIOUR +u_offset1,s 
                    cmpd     #moneyMothershipBehaviour 
                    lbeq     doMoneyMothership 
                    cmpd     #moneySuckerBehaviour 
                    beq      doMoneySucker 
                    cmpd     #saucerBehaviour 
                    beq      doSaucerDeath 
; laser big enemy
addpointsBiggy 
                    ADD_POINTS_BIGGY  
                    jmp      entryFromOtherBigs           ;noMoneyMothership 

doSaucerDeath 
; simulate spawn rank marker
; inc rankDrop
                    ldd      Y_POS +u_offset1,s 
                    stb      rankDrop 
                    bne      notNullSaucer 
                    inc      rankDrop 
notNullSaucer 
                    sta      bonusSpawnPosition           ; ypos 
                    lda      rankCollected 
                    bita     #COLLECTED_RANK1 
                    beq      dropRank1 
                    bita     #COLLECTED_RANK2 
                    beq      dropRank2 
                    bita     #COLLECTED_RANK3 
                    beq      dropRank3 
                    bita     #COLLECTED_RANK4 
                    beq      dropRank4 
                    bita     #COLLECTED_RANK5 
                    beq      dropRank5 
dropRank6 
                    lda      #81 
                    sta      bonusSpawnPosition+1         ; xpos 
                    jmp      entryFromOtherBigs           ;yesExplodeEnemy 

dropRank1 
                    lda      #-81 
                    sta      bonusSpawnPosition+1         ; xpos 
                    jmp      entryFromOtherBigs           ;yesExplodeEnemy 

dropRank2 
                    lda      #-41 
                    sta      bonusSpawnPosition+1         ; xpos 
                    jmp      entryFromOtherBigs           ;yesExplodeEnemy 

dropRank3 
                    lda      #-1 
                    sta      bonusSpawnPosition+1         ; xpos 
                    jmp      entryFromOtherBigs           ;yesExplodeEnemy 

dropRank4 
                    lda      #39 
                    sta      bonusSpawnPosition+1         ; xpos 
                    jmp      entryFromOtherBigs           ;yesExplodeEnemy 

dropRank5 
                    lda      #79 
                    sta      bonusSpawnPosition+1         ; xpos 
                    jmp      entryFromOtherBigs           ;yesExplodeEnemy 

doMoneySucker 
                    ldd      Y_POS +u_offset1,s 
                    std      bonusSpawnPosition 
; if special unlocked
; all free enemy slots to 42
;                    lda      achievements 
;                    bita     #A1_SUCKER_ADDITIONAL_SPAWN 
                    lda      inGameSecrets 
                    bita     #SECRET_3_FIFTY 
                    beq      noAdditionSpawns 
                    sts      StringOutputBuffer_6 
                    lds      #MY_STACK                    ; CBFC - allow subroutines 
                    jsr      spawnAll42 
                    lds      StringOutputBuffer_6 
noAdditionSpawns 
;
                    ldd      #0 
                    std      suckerAddress 
                    sts      StringOutputBuffer_6 
                    lds      #MY_STACK                    ; CBFC - allow subroutines 
REPLACE_1_2_spawnRandomMoney_varFrom0_1 
                    ldx      #0 
                    jsr      jsrBank0X                    ; spawnRandomMoney 
                    lds      StringOutputBuffer_6 
; bra yesExplodeEnemyWithoutScoreing
                    jmp      addpointsBiggy 

doMoneyMothership 
; test if money mothership
; while bonus can be spawned - spawn $200
                    ldd      Y_POS +u_offset1,s 
                    std      bonusSpawnPosition 
                    sts      StringOutputBuffer_6 
                    lds      #MY_STACK                    ; CBFC - allow subroutines 
REPLACE_1_2_spawnMoney200_varFrom0_1 
                    ldx      #0 
                    jsr      jsrBank0X                    ; spawnMoney200 
                    lds      StringOutputBuffer_6 
; bra yesExplodeEnemyWithoutScoreing
                    jmp      entryFromOtherBigsWithoutScore ;yesExplodeEnemy 

yesExplodeEnemy 
noMoneyMothership 
; init explosion
                    ADD_POINTS_ENEMY_DESTROY  
yesExplodeEnemyWithoutScoreing 
                    inc      bonusHitCount 
                    inc      explosionSound               ; next game round, play an explosion 
                    lda      #-1 
                    sta      ALL_PURPOSE +u_offset1,s     ; negative means this enemy is an explosion 
; check if enemy was in attack pattern
; if so reduce pattern
                    ldd      BEHAVIOUR +u_offset1,s 
                    cmpd     #enemySingleAttackAbsolutBehaviour 
                    beq      wasAttacker 
                    cmpd     #enemySingleAttackRelativeBehaviour 
                    bne      wasNotAttacker 
wasAttacker 
                    dec      attackPatternCount 
wasNotAttacker 
; init explosion
; check if debris bomber
                    ldx      ENEMY_STRUCT +u_offset1,s 
                    lda      ADDITIONAL_TYPE_INFO,x 
                    anda     #TYPE_DEBRIS_BOMBER 
                    beq      noDebrisBomber 
                    lda      ENEMY_DEBRIS_SPEED,x         ; speed of falling debris = bullet speed 
                    sta      ALL_PURPOSE+u_offset1,s      ; speed of falling debris 
                    ldd      #enemyDebrisBomberBehaviour 
                    std      BEHAVIOUR +u_offset1,s       ; negative means this enemy is an explosion 
                    clr      ANIM_POSITION+u_offset1,s 
                    tst      laserTag 
                    beq      goEnemyDebris 
                    jmp      [backJump] 

goEnemyDebris 
                    jmp      debrisBomberEntry 

noDebrisBomber 
                    ldd      #enemyExplosionBehaviour 
bank1ExplosionEntry 
                    std      BEHAVIOUR +u_offset1,s       ; negative means this enemy is an explosion 
                    tst      bonusSpawnPosition 
                    bne      noNewBonusSpawn 
                    ldd      Y_POS+u_offset1,s 
                    std      bonusSpawnPosition 
noNewBonusSpawn 
                    ldx      WAIT_ANIM_TABLE, x 
                    cmpx     #enemyTribbleWaitAnim 
                    bne      noTribbleWasShot 
; tribble handling
; tribble have lasers "go thru"
; no bonus on tribble death
                    clr      bonusSpawnPosition 
                    clr      bonusSpawnPosition+1 
                    sts      backJump 
                    lds      #MY_STACK                    ; CBFC - allow subroutines 
                    jsr      spawnEnemy 
                    beq      continueTribbleDeath 
                    ldy      #enemyTribble 
                    jsr      noShieldEnemy                ; do complete rest of init 
                    ldd      #0500                        ; 10 seconds live time 
                    std      TRIBBLE_LIFE_TIME, u 
                    ldd      #TribbleString 
                    INIT_MESSAGE_D  
                    jsr      spawnEnemy 
                    beq      continueTribbleDeath 
                    ldy      #enemyTribble 
                    jsr      noShieldEnemy                ; do complete rest of init 
                    ldd      #0500                        ; 10 seconds live time 
                    std      TRIBBLE_LIFE_TIME, u 
continueTribbleDeath 
                    lds      backJump 
                    ldx      #enemyTribbleWaitAnim 
                    ldu      ,x 
                    stu      SMARTLIST_ORG+u_offset1,s 
                    lda      #9                           ; scale 
                    sta      EXPLOSION_SCALE +u_offset1,s 
                    lda      #$7f                         ; intensity 
                    sta      EXPLOSION_INTENSITY +u_offset1,s 
                    bra      goEnemyExplode 

noTribbleWasShot 
                    ldu      ,x 
                    stu      SMARTLIST_ORG+u_offset1,s 
                    lda      #9                           ; scale 
                    sta      EXPLOSION_SCALE +u_offset1,s 
                    lda      #$7f                         ; intensity 
                    sta      EXPLOSION_INTENSITY +u_offset1,s 
                    tst      laserTag 
                    beq      goEnemyExplode 
                    jmp      [backJump] 

goEnemyExplode 
                    lda      #OBJECT_SCALE 
                    sta      <VIA_t1_cnt_lo 
                    inc      lightningOn 
                    lds      NEXT_ENEMY_OBJECT+u_offset1,s ; preload next user stack 
                    MY_MOVE_TO_B_END  
                    _INTENSITY_A  
                    clra     
                    pulu     b,x,pc 
notBoss1Fight 
;                    cmpa     #%00000100 
;                    bne      notBoss2Fight 
; here boss fight 2
;boss2Fight 
; !!!!!!!!!!!!!!!!!!!!!!
; boss fight code for boss 3 + 4 not done!
;todoJumpBoss3 
;todoJumpBoss4 
; !!!!!!!!!!!!!!!!!!!!!!
                    tst      tmp2_tmp_unique 
                    lbne     bossFight1shr                ; here boss fight - and boss 2 got hit! 
; here if in bossfight 2
; for now NOT hit the boss, but hit a 
; swarm member
swarmHitBoss2 
                    lda      SWARM_HIT_POINTS +u_offset1,s 
; no negative weapon damage supported anymore!
;                    tst      bulletDamage 
;                    bpl      doWeaponDamage3 
;                    ldb      Vec_Loop_Count+1 
;                    andb     #1 
;                    bne      noWeaponDamage3 
;                    adda     bulletDamage 
;                    bra      noWeaponDamage3 
doWeaponDamage3 
                    suba     bulletDamage 
noWeaponDamage3 
                    bmi      yesExplodeEnemy_b2 
                    beq      yesExplodeEnemy_b2 
; do not explode 
; this resets the shot delay to zero -> don't bothher
; enemies that are hit have a right to be angry!
wasSuperShot2_b2 
                    sta      SWARM_HIT_POINTS +u_offset1,s 
                    lda      SWARM_ALL_PURPOSE +u_offset1,s 
                    ora      #HIT_FLASH_LENGTH            ; 15/50 s brightness flash of enemy for being hit and not dead 
                    sta      SWARM_ALL_PURPOSE +u_offset1,s 
                    jmp      [backJump]                   ; jump back to where collission detection started 

yesExplodeEnemy_b2 
                    inc      explosionSound               ; next game round, play an explosion 
; check if enemy was in attack pattern
; if so reduce pattern
; init explosion
                    ldu      #Swarmer 
                    ldu      ,u 
                    ldd      #swarmExplosionBehaviour 
                    std      BEHAVIOUR +u_offset1,s       ; negative means this enemy is an explosion 
                    ldd      Y_POS+u_offset1,s 
                    lda      #9                           ; scale 
                    sta      SWARM_EXPLOSION_SCALE +u_offset1,s 
                    sta      VIA_t1_cnt_lo 
                    lda      #$7f                         ; intensity 
                    sta      SWARM_EXPLOSION_INTENSITY +u_offset1,s 
                    tst      laserTag 
                    beq      goEnemyExplodeB2 
                    jmp      [backJump] 

goEnemyExplodeB2 
                    lda      #OBJECT_SCALE 
                    sta      <VIA_t1_cnt_lo 
                    inc      lightningOn 
                    lds      NEXT_ENEMY_OBJECT+u_offset1,s ; preload next user stack 
                    MY_MOVE_TO_B_END  
                    _INTENSITY_A  
                    clra     
                    pulu     b,x,pc 
notBoss2Fight 
                                                          ; boss 3 fight todo 
;                    cmpa     #%00000110 
;                    bne      boss4Fight 
;boss3Fight 
;                    bra      todoJumpBoss3 
;
;boss4Fight 
;                    bra      todoJumpBoss4 
removeCurrentShotAndObjectBoss 
                    clr      tmp_isSupershot 
                    tst      explosionSound 
                    bne      noIncBoss 
                    inc      explosionSound               ; next game round, play an explosion 
noIncBoss 
                    ldy      bossHP 
                    lda      bulletDamage 
                    nega     
                    ldb      SHOT_RADIUS, x 
                    cmpb     #SHOT_RADIUS4 
                    beq      removeShot4_b 
                    cmpb     #SHOT_RADIUS3 
                    beq      removeShot3_b 
                    cmpb     #SHOT_RADIUS2 
                    beq      removeShot2_b 
                    cmpb     #SHOT_RADIUS6 
                    lbeq     isLazerShot 
; five shot is also a "1" time shot
                    cmpb     #SHOT_RADIUS5 
                    lbne     shotHasNoScoopies 
                    inc      tmp_isSupershot              ; positive is supershot 
                    jmp      shotHasNoScoopies 

;---
removeShot4_b 
; remove 3 points of damage
                    leay     a,y 
removeShot3_b 
; remove 2 points of damage
                    leay     a,y 
removeShot2_b 
; remove 1 points of damage
remove1Shot4b 
                    leay     a,y 
                    sty      bossHP 
                    jmp      shotHasNoScoopies 
