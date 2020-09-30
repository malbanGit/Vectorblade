; bank 1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; in y position of Anim table of "bug"
failureBehaviourBank1                                     ;#isfunction  
;-------
                    lda      BUG_MOVEMENT_DOUBLER+u_offset1,s 
                    sta      tmp8_tmp 
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
                    RANDOM_A2  
                    anda     #%10000001 
                    sta      tmp8_tmp 
doubleMovement 
                    clr      1+Y_POS16+u_offset1,s 
                    clr      1+X_POS16+u_offset1,s 
                    RANDOM_A  
                    RANDOM_B  
                    anda     #%01111000                   ; not negative and smaller ($7f-7) y pos 
                    std      Y_POS+u_offset1,s            ; that is the target 
; Y
                    ldb      Y_POS16+u_offset1,s 
                    sex      
                    std      tmp16_tmp 
                    ldb      Y_POS+u_offset1,s 
                    sex      
                    subd     tmp16_tmp 
                    clr      BUG_MOVEMENT_DOUBLER+u_offset1,s 
                    tst      tmp8_tmp 
                    beq      double1 
                    bpl      normal1 
half1 
                    ASRA     
                    RORB                                  ; half it 
                    bra      normal1 

double1 
                    inc      BUG_MOVEMENT_DOUBLER+u_offset1,s 
normal1 
                    stb      BUG_ADDS_YX+u_offset1,s 
; X
                    ldb      X_POS16+u_offset1,s 
                    sex      
                    std      tmp16_tmp 
                    ldb      X_POS+u_offset1,s 
                    sex      
                    subd     tmp16_tmp 
                    tst      tmp8_tmp 
                    bpl      normal2 
half2 
                    ASRA     
                    RORB                                  ; half it 
normal2 
                    stb      1+BUG_ADDS_YX+u_offset1,s 
                    clr      tmp8_tmp 
noNewTargetNecessary 
                    dec      tmp8_tmp 
                    bpl      doubleMovement 
; --------
                    lda      BUG_ENEMY_HITPOINTS+u_offset1,s 
                    cmpa     #50 
                    bhi      slowAnim 
                    cmpa     #20 
                    bhi      mediumAnim 
fastAnim 
                    inc      ANIM_POSITION+u_offset1,s 
                    lda      ANIM_POSITION+u_offset1,s 
                    asla     
; in y from other bank                    ldx      WAIT_ANIM_TABLE,u 
                    ldx      a,y 
                    bne      animNotFinishedB1 
                    clr      ANIM_POSITION+u_offset1,s 
noAnimChangeEnemyB1_2 
                    lda      ANIM_POSITION+u_offset1,s 
                    lsla     
                    bra      animaDone 

mediumAnim 
                    lda      animDelayCounter 
                    lsra     
                    bne      noAnimChangeEnemyB1_1 
                    inc      ANIM_POSITION+u_offset1,s 
                    lda      ANIM_POSITION+u_offset1,s 
                    asla     
; in y from other bank                    
                    ldx      a,y 
                    bne      animNotFinishedB1 
                    clr      ANIM_POSITION+u_offset1,s 
noAnimChangeEnemyB1_1 
                    lda      ANIM_POSITION+u_offset1,s 
                    lsla     
                    bra      animaDone 

slowAnim 
                    tst      animDelayCounter 
                    bpl      noAnimChangeEnemyB1 
                    inc      ANIM_POSITION+u_offset1,s 
                    lda      ANIM_POSITION+u_offset1,s 
                    asla     
; in y from other bank                    
                    ldx      a,y 
                    bne      animNotFinishedB1 
                    clr      ANIM_POSITION+u_offset1,s 
noAnimChangeEnemyB1 
                    lda      ANIM_POSITION+u_offset1,s 
                    lsla     
animNotFinishedB1 
animaDone 
                    ldu      a,y 
                    lda      ALL_PURPOSE +u_offset1,s 
                    beq      normalEndMacroB1 
                    cmpa     #HIT_FLASH_LENGTH 
                    bgt      normalEndMacro2B1 
                    inc      lightningOn 
                    dec      ALL_PURPOSE +u_offset1,s 
                    lda      #$7f 
                    MY_MOVE_TO_B_END  
                    _INTENSITY_A  
                    bra      startDrawingB1 

normalEndMacroB1 
                    tst      lightningOn 
                    beq      normalEndMacro2B1 
                    clr      lightningOn 
                    lda      #DEFAULT_ENEMY_INTENSITY 
                    MY_MOVE_TO_B_END  
                    _INTENSITY_A  
                    bra      startDrawingB1 

normalEndMacro2B1 
                    MY_MOVE_TO_A_END  
startDrawingB1 
                    sts      introWaveCurrentPattern      ;StringOutputBuffer_6 
                    lds      #MY_STACK                    ; CBFC - allow subroutines 
                    jsr      SMVB_drawSmart 
                    lds      introWaveCurrentPattern      ;StringOutputBuffer_6 
REPLACE_1_2_backToBehaviour_varFrom1_1 
                    ldx      #0                           ; backToBehaviour 
                    jmp      jmpBankIRQ3X 

;
;***************************************************************************
;
enemyBank1ExplosionBehaviour                              ;#isfunction  
                    ldu      SMARTLIST_ORG +u_offset1,s 
                    ldu      ,u 
                    lda      EXPLOSION_INTENSITY +u_offset1,s 
                    suba     #10 
                    sta      EXPLOSION_INTENSITY +u_offset1,s 
                    inc      lightningOn 
                    MY_MOVE_TO_B_END  
                    _INTENSITY_A  
                    sts      backJump                     ;tmp_debug +2;StringOutputBuffer_6 
                    lds      #MY_STACK                    ; CBFC - allow subroutines 
                    jsr      SMVB_drawSmart 
                    lds      backJump                     ;tmp_debug +2;StringOutputBuffer_6 
REPLACE_1_2_backToExplosionBehaviour_varFrom1_1 
                    ldx      #0                           ; backToExplosionBehaviour 
                    jmp      jmpBankIRQ3X 

;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
saucerBehaviourBank1                                      ;#isfunction  
; check col detect
; move right
; fire x "missiles" at player
; col detect with player
                    lda      playSoundFlags 
                    anda     #%11000000 
                    bne      noSoundEffect3 
                    ldx      sfx_pointer_1 
                    bne      noNewSaurcerSound 
                    ldx      #UFOAproachingdata           ; spawnXData 
                    stx      sfx_pointer_1 
noNewSaurcerSound 
noSoundEffect3 
                    lda      X_POS +u_offset1,s 
                    ldb      saucerCount 
                    cmpb     #2 
                    blo      notFasterSaucer 
                    cmpb     #3 
                    blo      notFasterSaucer2 
                    adda     #1 
notFasterSaucer2 
                    adda     #1 
notFasterSaucer 
                    adda     #1 
                    sta      X_POS +u_offset1,s 
                    cmpa     #120 
                    blt      noposaddms_l 
                    lda      diverseFlags 
                    anda     #$ff-BIT_BIG_ENEMY_IN_PLAY 
                    sta      diverseFlags 
REPLACE_1_2_destroyEnemyObject_varFrom1_1 
                    ldx      #0                           ; destroyEnemyObject 
                    jmp      jmpBankIRQ3X 

noposaddms_l 
 if  ENEMY_NO_SHOOTING = 1 
                    bra      noBulletSpawnSaucer 

 endif  
; init a # of shots depending on saucer number
; IGNORE current shots
                    ldd      Y_POS +u_offset1,s 
                    cmpb     #2 
                    bne      noBulletSpawnSaucer1 
                    std      bulletSpawnAt 
                    lda      ENEMY_BULLET_SPEED, x 
                    sta      isBugShot 
;makeHunter
                    lda      #%10000001 
                    sta      isBugShot 
                    bra      noBulletSpawnSaucer 

noBulletSpawnSaucer1 
                    lda      saucerCount 
                    cmpa     #2 
                    blo      noSecondSaucerShot 
                    ldd      Y_POS +u_offset1,s 
                    cmpb     #-64 
                    bne      noSecondSaucerShot3 
                    std      bulletSpawnAt 
                    lda      ENEMY_BULLET_SPEED, x 
                    sta      isBugShot 
;makeHunter
                    lda      #%01000111 
                    sta      isBugShot 
noSecondSaucerShot3 
                    lda      saucerCount 
                    cmpa     #3 
                    blo      noSecondSaucerShot 
                    ldd      Y_POS +u_offset1,s 
                    cmpb     #65 
                    bne      noBulletSpawnSaucer 
                    std      bulletSpawnAt 
                    lda      ENEMY_BULLET_SPEED, x 
                    sta      isBugShot 
                    lda      #%01000111 
                    sta      isBugShot 
                    bra      noBulletSpawnSaucer 

noSecondSaucerShot 
noBulletSpawnSaucer 
                    ldx      #SaucerWindowAnim 
                    tst      animDelayCounter 
                    bpl      noAnimChangeEnemySaucer 
                    inc      ANIM_POSITION+u_offset1,s 
                    lda      ANIM_POSITION+u_offset1,s 
                    asla     
                    ldx      a,x 
                    bne      animNotFinishedSaucer 
                    clr      ANIM_POSITION+u_offset1,s 
noAnimChangeEnemySaucer 
                    lda      ANIM_POSITION+u_offset1,s 
                    lsla     
animNotFinishedSaucer 
                    ldu      #SaucerWindowAnim 
endAllBiggyBank1 
                    ldu      a,u 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
END_ENEMY_DISPLAY   macro    
                    lda      ALL_PURPOSE +u_offset1,s 
                    beq      normalEndMacro\? 
                    cmpa     #HIT_FLASH_LENGTH 
                    bgt      normalEndMacro2\? 
                    inc      lightningOn 
                    dec      ALL_PURPOSE +u_offset1,s 
                    lda      #$7f 
                    MY_MOVE_TO_B_END  
                    _INTENSITY_A  
                    bra      out\? 

normalEndMacro\? 
                    tst      lightningOn 
                    beq      normalEndMacro2\? 
                    clr      lightningOn 
                    lda      #DEFAULT_ENEMY_INTENSITY 
                    MY_MOVE_TO_B_END  
                    _INTENSITY_A  
                    bra      out\? 

normalEndMacro2\? 
                    MY_MOVE_TO_A_END  
out\? 
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                    END_ENEMY_DISPLAY  
                    sts      backJump                     ; introWaveCurrentPattern ;tmp_debug +2;StringOutputBuffer_6 
                    lds      #MY_STACK                    ; CBFC - allow subroutines 
                    jsr      SMVB_drawSmart 
                    lds      backJump                     ; introWaveCurrentPattern ;tmp_debug +2;StringOutputBuffer_6 
REPLACE_1_2_backBank3Behaviour_varFrom1_1 
                    ldx      #0                           ; backBank3Behaviour 
                    jmp      jmpBankIRQ3X 

;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
moneyMothershipBehaviourBank1                             ;#isfunction  
                    MY_MOVE_TO_D_START  
; move right
; col detect with player
                    lda      Vec_Loop_Count+1 
                    anda     #1 
                    beq      noposadd 
                    lda      X_POS +u_offset1,s 
                    adda     #1 
                    sta      X_POS +u_offset1,s 
                    cmpa     #120 
                    blt      noposadd 
                    lda      diverseFlags 
                    anda     #$ff-BIT_BIG_ENEMY_IN_PLAY 
                    sta      diverseFlags 
REPLACE_1_2_destroyEnemyObject_varFrom1_2 
                    ldx      #0                           ; destroyEnemyObject 
                    jmp      jmpBankIRQ3X 

nodestroyEnemyObject 
noposadd 
noBulletMoneyMothership 
                    ldx      #MoneyMothershipAnim 
                    tst      animDelayCounter 
                    bpl      noAnimChangeEnemyMoneyMothership 
                    inc      ANIM_POSITION+u_offset1,s 
                    lda      ANIM_POSITION+u_offset1,s 
                    asla     
                    ldx      a,x 
                    bne      animNotFinishedMoneyMothership 
                    clr      ANIM_POSITION+u_offset1,s 
noAnimChangeEnemyMoneyMothership 
                    lda      ANIM_POSITION+u_offset1,s 
                    lsla     
animNotFinishedMoneyMothership 
                    ldu      #MoneyMothershipAnim 
                    jmp      endAllBiggyBank1 

;
;***************************************************************************
;
moneySuckerBehaviourBank1                                 ;#isfunction  
                    lda      playSoundFlags 
                    anda     #%11000000 
                    bne      noSoundEffect1 
                    ldx      sfx_pointer_1 
                    bne      noNewSuckerSound 
                    ldx      #MegafiendPresentData        ; spawnXData 
                    stx      sfx_pointer_1 
noSoundEffect1 
noNewSuckerSound 
; move right
; col detect with player
                    lda      Vec_Loop_Count+1 
                    anda     #1 
                    beq      noposaddms 
                    lda      X_POS +u_offset1,s 
                    adda     #1 
                    sta      X_POS +u_offset1,s 
                    cmpa     #120 
                    blt      noposaddms 
                    lda      diverseFlags 
                    anda     #$ff-BIT_BIG_ENEMY_IN_PLAY 
                    sta      diverseFlags 
                    ldd      #0 
                    std      suckerAddress 
REPLACE_1_2_destroyEnemyObject_varFrom1_3 
                    ldx      #0                           ; destroyEnemyObject 
                    jmp      jmpBankIRQ3X 

noposaddms 
                    dec      MONEY_SUCK_TIMER+u_offset1,s 
                    bpl      noNewSuck 
                    lda      #MONEY_SUCK_WAIT             ; such each half second 
                    sta      MONEY_SUCK_TIMER+u_offset1,s 
                    sts      tmp1_tmp                     ;StringOutputBuffer_6 
                    lds      #MY_STACK                    ; CBFC - allow subroutines 
REPLACE_1_2_suckRandomMoney_varFrom0_1 
                    ldx      #0 
                    jsr      jsrBank2_from1_SHIFT         ; jsrBank0X ; suckRandomMoney 
                    lds      tmp1_tmp                     ;StringOutputBuffer_6 d 
noNewSuck 
                    ldx      #MoneySuckerBaseAnim 
                    tst      animDelayCounter 
                    bpl      noAnimChangeEnemyMoneySucker 
                    inc      ANIM_POSITION+u_offset1,s 
                    lda      ANIM_POSITION+u_offset1,s 
                    asla     
                    ldx      a,x 
                    bne      animNotFinishedMoneySucker 
                    clr      ANIM_POSITION+u_offset1,s 
noAnimChangeEnemyMoneySucker 
                    lda      ANIM_POSITION+u_offset1,s 
                    lsla     
animNotFinishedMoneySucker 
                    ldu      #MoneySuckerBaseAnim 
                    jmp      endAllBiggyBank1 

;
;***************************************************************************
;
megaFiendBehaviourBank1                                   ;#isfunction  
                    lda      playSoundFlags 
                    anda     #%11000000 
                    bne      noSoundEffect2 
                    ldx      sfx_pointer_1 
                    bne      noNewMegaSound 
                    ldx      #MegafiendPresentData        ; spawnXData 
                    stx      sfx_pointer_1 
noSoundEffect2 
noNewMegaSound 
; move right
                    ldb      #OBJECT_SCALE 
                    stb      VIA_t1_cnt_lo 
                    lda      STAY_HERE_LOOP_COUNTER+u_offset1,s 
                    bne      noposaddms_mf2 
                    lda      Vec_Loop_Count+1 
                    anda     #1 
                    beq      noposaddms_mf 
                    lda      X_POS +u_offset1,s 
                    adda     #1 
                    sta      X_POS +u_offset1,s 
                    cmpa     #120 
                    blt      noposaddms_mf 
                    lda      diverseFlags 
                    anda     #$ff-BIT_BIG_ENEMY_IN_PLAY 
                    sta      diverseFlags 
REPLACE_1_2_destroyEnemyObject_varFrom1_4 
                    ldx      #0                           ; destroyEnemyObject 
                    jmp      jmpBankIRQ3X 

noposaddms_mf 
                    lda      X_POS +u_offset1,s 
                    cmpa     #-100                        ; first stop 
                    beq      initMegaLaser 
                    cmpa     #-35                         ; stop 
                    beq      initMegaLaser 
                    cmpa     #35                          ; stop 
                    beq      initMegaLaser 
                    cmpa     #100                         ; stop 
                    beq      initMegaLaser 
                    bra      normalGoOnBiggi 

initMegaLaser 
                    lda      #100                         ; 2 seconds 
                    sta      STAY_HERE_LOOP_COUNTER+u_offset1,s 
                    clr      LASER_X+u_offset1,s 
normalGoOnBiggi 
                    ldx      #MegaFiendAnim 
                    tst      animDelayCounter 
                    bpl      noAnimChangeEnemyMegaFiend 
                    inc      ANIM_POSITION+u_offset1,s 
                    lda      ANIM_POSITION+u_offset1,s 
                    asla     
                    ldx      a,x 
                    bne      animNotFinishedMegaFiend 
                    clr      ANIM_POSITION+u_offset1,s 
noAnimChangeEnemyMegaFiend 
                    lda      ANIM_POSITION+u_offset1,s 
                    lsla     
animNotFinishedMegaFiend 
                    ldu      #MegaFiendAnim 
                    jmp      endAllBiggyBank1 

; stay put and fire
noposaddms_mf2 
                    dec      STAY_HERE_LOOP_COUNTER+u_offset1,s 
                    tst      BACK_OR_FORTH+u_offset1,s 
                    bne      goForth 
                    ldb      LASER_X+u_offset1,s 
                    subb     #19 
                    bvc      doit_now 
                    inc      BACK_OR_FORTH+u_offset1,s 
                    bra      npLaserReset 

goForth 
                    ldb      LASER_X+u_offset1,s 
                    addb     #19 
                    bvc      doit_now 
                    clr      BACK_OR_FORTH+u_offset1,s 
                    bra      npLaserReset 

doit_now 
                    stb      LASER_X+u_offset1,s 
npLaserReset 
                    ldb      LASER_X+u_offset1,s 
                    MY_MOVE_TO_A_END  
                    clra     
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    lda      gameScale 
                    sta      VIA_t1_cnt_lo 
                    MY_MOVE_TO_A_END  
                    lda      #$7f 
                    _INTENSITY_A  
                    lda      #-96                         ;PLAYER_YPOS - $e0 
                    ldb      #0 
                    STA      <VIA_port_a                  ;Store Y in D/A register 
                    STb      <VIA_port_b                  ;Enable mux ; hey dis si "break integratorzero 440" 
                    lda      #$ee                         ; light ON, ZERO OFF 
                    sta      <VIA_cntl                    ; [4] ZERO disabled, and BLANK disabled 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    incb     
                    stb      <VIA_port_b                  ;Disable mux 
                    decb     
 else  
                    INC      <VIA_port_b                  ;Disable mux 
 endif  
                    STB      <VIA_port_a                  ;Store X in D/A register 
                    STb      <VIA_t1_cnt_hi               ;enable timer 
                    MY_MOVE_TO_A_END  
                    lda      #DEFAULT_ENEMY_INTENSITY 
                    _INTENSITY_A  
                    clra     
                    lda      #$ce                         ; light ON, ZERO OFF 
                    sta      <VIA_cntl                    ; [4] ZERO disabled, and BLANK disabled 
                    lda      #96                          ;PLAYER_YPOS - $e0 
                    ldb      #0 
                    STA      <VIA_port_a                  ;Store Y in D/A register 
                    STb      <VIA_port_b                  ;Enable mux ; hey dis si "break integratorzero 440" 
                    NOP      
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    incb     
                    stb      <VIA_port_b                  ;Disable mux 
                    decb     
 else  
                    INC      <VIA_port_b                  ;Disable mux 
 endif  
                    STB      <VIA_port_a                  ;Store X in D/A register 
                    STb      <VIA_t1_cnt_hi               ;enable timer 
                    MY_MOVE_TO_A_END  
                    _ZERO_VECTOR_BEAM  
                    ldb      X_POS +u_offset1,s 
                    sex      
                    addd     #$80 
                    std      tmp4_tmp 
                    ldd      Y_POS+u_offset1,s 
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    ldb      #OBJECT_SCALE 
                    stb      <VIA_t1_cnt_lo 
                                                          ; col detect 
; first check "player"
                    ldb      playerXpos 
                    sex      
                    addd     #$80 
; compare two 160 bit positions from 0 - 256
                    subd     tmp4_tmp 
                    bpl      noNeggi 
                    negb     
noNeggi 
RADIUS_BIG_LASER    =        30 
                    cmpb     #RADIUS_BIG_LASER 
                    bhi      testForScoopies 
 if  UNDYING = 1 
                    bra      testForScoopies 

 endif  
                    lda      playerBonusActive 
                    bita     #BITFIELD_SHIELD             ; shield saved player (from all shots) 
                    bne      testForScoopies              ; shield protects 
; armor does not <really> protect!
 if  SHORT_INVULNERABILITY 
                    bita     #BITFIELD_ARMOR 
                    beq      playerCaughtShot2            ; armor saved player for one shot 
                    SWITCH_TO_SHORT_SHIELD  
                    bra      testForScoopies 

playerCaughtShot2 
 endif  
                    lda      #1                           ; TODO strength of enemy bullet 
                    sta      playerWasHitFor 
testForScoopies 
; check scoopies
 if  SCOOPIE_DONT_DIE = 1 
                    jmp      normalGoOnBiggi 

 endif  
; scoopy left side
                    ldx      scoopEnemy2 
                    beq      testRightScoopy 
LEFT_SCOOPYMIDDLE_OFFSET  =  -13 
                    ldb      playerXpos 
                    sex      
                    addd     #$80 
                    addd     #LEFT_SCOOPYMIDDLE_OFFSET 
; compare two 16 bit positions from 0 - 256
                    subd     tmp4_tmp 
                    bpl      noNeggi_2 
                    negb     
noNeggi_2 
                    cmpb     #RADIUS_BIG_LASER 
                    bhi      testRightScoopy 
                    ldd      #0 
                    std      scoopEnemy2 
                    lda      #2 
                    sta      explosionSound 
                    inc      enemyCount                   ; because after explosion, the remove enemy - does again a "dec enemy count" this would screw the counting 
                                                          ; since scoopies were removed before! 
                    lda      #-1 
                    sta      ALL_PURPOSE ,x               ; negative means this enemy is an explosion 
REPLACE_1_2_enemyExplosionBehaviour_varFrom1_4 
                    ldd      #0                           ; enemyExplosionBehaviour 
;                    ldd      #enemyExplosionBehaviour 
                    std      BEHAVIOUR ,x                 ; negative means this enemy is an explosion 
                    clr      ANIM_POSITION ,x 
                    ldu      ENEMY_STRUCT ,x 
                    tfr      x,y 
REPLACE_1_2_getUPointer1_varFrom1_1 
                    ldx      #0                           ; 
                    jmp      jmpBank3_from1 

getUPointer1Back 
                    tfr      y,x 
; those are in BANK 3
; and can not be addressed from here!
;                    ldu      WAIT_ANIM_TABLE, u 
;                    ldu      ,u 
                    stu      SMARTLIST_ORG ,x 
                    lda      #9                           ; scale 
                    sta      EXPLOSION_SCALE ,x 
                    lda      #$7f                         ; intensity 
                    sta      EXPLOSION_INTENSITY ,x 
testRightScoopy 
                    ldx      scoopEnemy1 
                    lbeq     normalGoOnBiggi 
RIGHT_SCOOPYMIDDLE_OFFSET  =  13 
                    ldb      playerXpos 
                    sex      
                    addd     #$80 
                    addd     #RIGHT_SCOOPYMIDDLE_OFFSET 
; compare two 16 bit positions from 0 - 256
                    subd     tmp4_tmp 
                    bpl      noNeggi_3 
                    negb     
noNeggi_3 
                    cmpb     #RADIUS_BIG_LASER 
                    lbhi     normalGoOnBiggi 
                    ldd      #0 
                    std      scoopEnemy1 
                    lda      #2 
                    sta      explosionSound 
                    inc      enemyCount                   ; because after explosion, the remove enemy - does again a "dec enemy count" this would screw the counting 
                                                          ; since scoopies were removed before! 
                    lda      #-1 
                    sta      ALL_PURPOSE ,x               ; negative means this enemy is an explosion 
REPLACE_1_2_enemyExplosionBehaviour_varFrom1_5 
                    ldd      #0                           ; enemyExplosionBehaviour 
                                                          ; ldd #enemyExplosionBehaviour 
                    std      BEHAVIOUR ,x                 ; negative means this enemy is an explosion 
                    clr      ANIM_POSITION ,x 
                    ldu      ENEMY_STRUCT ,x 
                    tfr      x,y 
REPLACE_1_2_getUPointer2_varFrom1_1 
                    ldx      #0                           ; 
                    jmp      jmpBank3_from1 

getUPointer2Back 
                    tfr      y,x 
                    stu      SMARTLIST_ORG ,x 
                    lda      #9                           ; scale 
                    sta      EXPLOSION_SCALE ,x 
                    lda      #$7f                         ; intensity 
                    sta      EXPLOSION_INTENSITY ,x 
                    jmp      normalGoOnBiggi 

;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
PLAYER_RADIUS_X     =        15 
PLAYER_RADIUS_Y     =        22 
fallCashBehaviourBank1                                    ;#isfunction  
; col detect with player
                    lda      Y_POS +u_offset1,s 
                    cmpa     #$80+PLAYER_RADIUS_Y 
                    bgt      notHit_Cash 
                    ldb      X_POS +u_offset1,s 
                    subb     playerXpos 
                    bpl      noNegCash 
                    negb     
noNegCash 
                    cmpb     #PLAYER_RADIUS_X 
                    bhi      notHit_Cash 
                    lda      playSoundFlags 
                    anda     #%11000000 
                    bne      nosfx6 
                    ldx      #collectDiamondData          ;collectDiamondData 
                    stx      sfx_pointer_1 
nosfx6 
                    ADD_CASH  42 
destroyEnemyObjectb1internal 
REPLACE_1_2_destroyEnemyObject_varFrom1_6 
                    ldx      #0                           ; destroyEnemyObject 
                    jmp      jmpBankIRQ3X 

; set HP = 0
notHit_Cash 
; no shots can effect diamonds
                    lda      Y_POS+u_offset1,s 
                    suba     #2                           ; falling speed 
                    bvs      destroyEnemyObjectb1internal 
                    sta      Y_POS+u_offset1,s 
                    lda      #OBJECT_SCALE 
                    sta      <VIA_t1_cnt_lo 
                    ldx      #FallingCash 
                    tst      animDelayCounter 
                    bpl      noAnimChangeEnemyCash 
                    inc      ANIM_POSITION+u_offset1,s 
                    lda      ANIM_POSITION+u_offset1,s 
                    asla     
                    ldx      a,x 
                    bne      animNotFinishedCash 
                    clr      ANIM_POSITION+u_offset1,s 
noAnimChangeEnemyCash 
                    lda      ANIM_POSITION+u_offset1,s 
                    lsla     
animNotFinishedCash 
                    ldu      #FallingCash 
                    ldu      a,u 
                    tst      lightningOn 
                    beq      normalEndMacro2Cash 
                    clr      lightningOn 
                    lda      #DEFAULT_ENEMY_INTENSITY 
                    MY_MOVE_TO_B_END  
                    _INTENSITY_A  
                    bra      goOn2 

normalEndMacro2Cash 
                    MY_MOVE_TO_B_END  
goOn2 
                    sts      backJump                     ; introWaveCurrentPattern ;tmp_debug +2;StringOutputBuffer_6 
                    lds      #MY_STACK                    ; CBFC - allow subroutines 
                    jsr      SMVB_drawSmart 
                    lds      backJump                     ; introWaveCurrentPattern ;tmp_debug +2;StringOutputBuffer_6 
REPLACE_1_2_backBank3Behaviour_varFrom1_7 
                    ldx      #0                           ; backBank3Behaviour 
                    jmp      jmpBankIRQ3X 
