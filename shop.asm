; the shop is NOT scalable!
; bank 1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
doShop00                                                  ;#isfunction  
doShop0_0 
                    ldb      difficulty 
                    lbmi     returnFromShop               ; achievements still checked! 
REPLACE_1_2_enterShopAchievementTest_varFrom0_1           ;  bank 2 replace 
                    ldx      #0                           ; enterShopAchievementTest 
                    jmp      jmpBankIRQ2X 

backFromenterShopAchievementTest 
; set flags for shop buy according to acchievements
                    lda      achievements + 4 
                    anda     #ACHIEVEMENT_FLAG_BYTE5_BIGGEST_LOSS 
                    beq      noBiggiestLossYet 
                    ldb      shopAllowFlags 
                    orb      #SHOP_IMMUN1 
                    stb      shopAllowFlags 
noBiggiestLossYet 
                    lda      achievements + 3 
                    anda     #ACHIEVEMENT_FLAG_BYTE4_OFFICER_RANK3 
                    beq      noRankBuyYet 
                    ldb      shopAllowFlags 
                    orb      #SHOP_RANK 
                    stb      shopAllowFlags 
noRankBuyYet 
                    lda      achievements + 3 
                    anda     #ACHIEVEMENT_FLAG_BYTE4_SPY_RANK2 
                    beq      noBombBuyYet 
                    ldb      shopAllowFlags 
                    orb      #SHOP_SUPER_BOMB_L 
                    stb      shopAllowFlags 
noBombBuyYet 
 if  ALLOW_BUY_EVERYTHING = 1 
                    ldb      #$ff 
                    stb      shopAllowFlags 
 endif  
;
                    clr      lastJoyMove 
                    clr      bonusAnimCount 
                    lda      #ANIMATION_DELAY 
                    sta      animDelayCounter 
                    lda      #-1 
                    sta      selected 
                    clr      Vec_Joy_1_Y 
shopLoop 
                    clra     
                    sta      <VIA_shift_reg 
                    IRQ_TO_0_SHIFT  
; WaitRecal uses T1, therefor we must ensure interrupt is kept with SHIFT
                    jSR      Wait_Recal_noShift           ; Vectrex BIOS recalibration 
                    jsr      doymsound100 
                    lda      #$80 
                    sta      <VIA_t1_cnt_lo 
; draw fighter speed
                    ldd      #$d2b4 -$2000 +1 
                    jsr      MoveToD_Start 
                    lda      #$1b 
                    sta      <VIA_t1_cnt_lo 
                    ldd      #1025 
                    subd     playerSpeed                  ; 000 (good) - 725 (bad) 
                    MY_LSR_D  
                    MY_LSR_D  
                    lsrb                                  ; div by 8 -> 0 - 90 
                    negb     
                    addb     #127 
                    tfr      b,a 
                    MY_MOVE_TO_B_END  
                    clrb     
                    jsr      DrawLined 
                    _ZERO_VECTOR_BEAM  
; WAIT20
                    lda      #$80 
                    sta      <VIA_t1_cnt_lo 
; draw bullet count
                    ldd      #$d2b4 + 13-$2000 +1 
                    jsr      MoveToD_Start 
                    lda      #$1c 
                    sta      <VIA_t1_cnt_lo 
                    lda      playerMaxShotInAir           ; 01 (bad) - 10 (good) 
                    cmpa     #MAX_PLAYERSHOT_OBJECTS      ; safety measure only, this seems to happen, but WHY??? 
                    bls      shotsOk11 
                    lda      #MAX_PLAYERSHOT_OBJECTS 
                    sta      playerMaxShotInAir 
shotsOk11 
                    ldb      #12 
                    mul      
                    tfr      b,a 
                    MY_MOVE_TO_B_END  
                    clrb     
                    jsr      DrawLined 
                    _ZERO_VECTOR_BEAM  
; WAIT20
                    lda      #$80 
                    sta      <VIA_t1_cnt_lo 
; draw bullet speed
                    ldd      #$d2b4 +26-$2000 +1 
                    jsr      MoveToD_Start 
                    lda      #$1b 
                    sta      <VIA_t1_cnt_lo 
                    ldd      #1025 
                    subd     playerShotSpeed              ; 000 (good) - 725 (bad) 
                    MY_LSR_D  
                    MY_LSR_D  
                    lsrb                                  ; div by 8 -> 0 - 90 
                    negb     
                    addb     #127 
                    tfr      b,a 
                    MY_MOVE_TO_B_END  
                    clrb     
                    jsr      DrawLined 
                    lda      Vec_Joy_1_Y 
                    beq      noJoyMoveShop 
                    tst      lastJoyMove 
                    bne      JoyMoveDoneShop 
                    sta      lastJoyMove 
                    bmi      selectNegativeShop 
                    lda      playSoundFlags 
                    anda     #%11000000 
                    bne      nosfx2 
REPLACE_1_2_ShopSoundData_varFromIRQ1_2 
                    ldx      #0                           ; ShopSoundData 
                    stx      sfx_pointer_3 
nosfx2 
                    inc      selected 
                    lda      selected 
                    cmpa     #MAX_SELECTED 
                    ble      JoyMoveDoneShop 
                    lda      #MAX_SELECTED 
                    sta      selected 
                    bra      JoyMoveDoneShop 

selectNegativeShop 
                    lda      playSoundFlags 
                    anda     #%11000000 
                    bne      nosfx3 
REPLACE_1_2_ShopSoundData_varFromIRQ1_3 
                    ldx      #0                           ; ShopSoundData 
                    stx      sfx_pointer_3 
nosfx3 
                    tst      selected 
                    bmi      JoyMoveDoneShop 
                    dec      selected 
                    bpl      JoyMoveDoneShop 
                    clr      selected 
                    bra      JoyMoveDoneShop 

noJoyMoveShop 
                    clr      lastJoyMove 
JoyMoveDoneShop 
                    lda      Vec_Loop_Count+1 
                    bita     #1 
                    beq      ButtonOnlyShop 
REPLACE_1_2_queryJoystick_varFromIRQ0_4 
                    ldx      #0                           ; queryJoystick 
                    jsr      jsrBank0X 
                    jmp      passedFailure                ;noButtonActionShopFailur 

ButtonOnlyShop 
                    JSR      getButtonState               ; get button status 
                    bita     #1 
                    bne      noHelpShop 
REPLACE_1_2_showShopHelp_varFromIRQ0_1 
                    ldx      #0                           ;showShopHelp 
                    jmp      jmpBank0X 

noHelpShop 
                    andb     #%00000011 
                    cmpb     #1 
                    lbne     passedFailure                ;noButtonActionShopFailur 
                    tst      selected 
                    bne      somethingSelected 
                    jmp      returnFromShop 

somethingSelected 
                    lda      selected 
; get price
                    asla     
                    ldu      #costList 
                    leau     a,u 
                    ldd      ,u 
                    cmpd     playerCashW 
                    lbhi     notEnoughCashShop 
                    ldd      playerCashW 
                    subd     ,u 
                    tfr      d, u                         ; remember new cash, only paid if bonus is really gotton! 
                    lda      selected 
SHOP_BONUS_SLOWER   =        1 
SHOP_BONUS_FASTER   =        2 
SHOP_BONUS_SHOT_BULLETS  =   3 
SHOP_BONUS_RATE     =        4 
SHOP_BONUS_SHOT1    =        5 
SHOP_BONUS_SHOT2    =        6 
SHOP_BONUS_SHOT3    =        7 
SHOP_BONUS_SHOT4    =        8 
SHOP_BONUS_SHOT5    =        9 
SHOP_BONUS_SHOT6    =        10 
SHOP_BONUS_ARMOR    =        11 
SHOP_BONUS_AUTOFIRE  =       12 
SHOP_BONUS_TIMER    =        13 
SHOP_BONUS_LIFE     =        14 
SHOP_BONUS_POWER    =        15 
SHOP_BONUS_LOCK     =        16 
SHOP_BONUS_BOMB     =        17 
SHOP_BONUS_RANK     =        18 
SHOP_BONUS_IMMUNE1  =        19 
SHOP_BONUS_SECRET1  =        20 
MAX_SELECTED        =        20 
                                                          ; SWITCH SELECTED 
                    cmpa     #SHOP_BONUS_FASTER 
                    bne      noSpeedPlusBonusShop 
                    ldd      playerSpeed 
                    cmpd     #MAX_PLAYER_SPEED 
                    lbhi     noButtonActionShopFailur 
                    stu      playerCashW                  ; cash paid 
                    addd     #SPEED_DELTA 
                    std      playerSpeed 
                    jmp      noButtonActionShopSuccess 

noSpeedPlusBonusShop 
                    cmpa     #SHOP_BONUS_SLOWER 
                    bne      noSpeedMinusBonusShop 
                    ldd      playerSpeed 
                    cmpd     #MIN_PLAYER_SPEED 
                    lble     noButtonActionShopFailur 
                    stu      playerCashW                  ; cash paid 
                    subd     #SPEED_DELTA 
                    std      playerSpeed 
                    jmp      noButtonActionShopSuccess 

noSpeedMinusBonusShop 
                    cmpa     #SHOP_BONUS_SHOT_BULLETS 
                    bne      noBulletPlusBonusShop 
bulletPlusShop 
                    lda      playerMaxShotInAir 
                    cmpa     #MAX_PLAYERSHOT_OBJECTS 
                    lbeq     noButtonActionShopFailur 
                    inc      playerMaxShotInAir 
                    stu      playerCashW                  ; cash paid 
                    jmp      noButtonActionShopSuccess 

noBulletPlusBonusShop 
                    cmpa     #SHOP_BONUS_RATE 
                    bne      noRatePlusBonusShop 
                    ldd      playerShotSpeed 
                    cmpd     #MAX_SHOT_SPEED 
                    lbhi     noButtonActionShopFailur 
                    addd     #SPEED_DELTA 
                    std      playerShotSpeed 
                    stu      playerCashW                  ; cash paid 
                                                          ; done on exit ADJUST_SHOT_RADIUS 
                    jmp      noButtonActionShopSuccess 

noRatePlusBonusShop 
                    cmpa     #SHOP_BONUS_SHOT1 
                    bne      noBullet1BonusShop 
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #1 
                    lbeq     noButtonActionShopFailur 
                    stu      playerCashW                  ; cash paid 
                    lda      #1 
                    sta      playerNumberOfBulletsPerShot 
                    jmp      noButtonActionShopSuccess 

noBullet1BonusShop 
                    cmpa     #SHOP_BONUS_SHOT2 
                    bne      noBullet2BonusShop 
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #2 
                    lbeq     noButtonActionShopFailur 
                    stu      playerCashW                  ; cash paid 
                    lda      #2 
                    sta      playerNumberOfBulletsPerShot 
                    jmp      noButtonActionShopSuccess 

noBullet2BonusShop 
                    cmpa     #SHOP_BONUS_SHOT3 
                    bne      noBullet3BonusShop 
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #3 
                    lbeq     noButtonActionShopFailur 
                    ldb      shopAllowFlags 
                    andb     #SHOP_TRIPPLE_WEAPON 
                    lbeq     noButtonActionShopFailur 
                    stu      playerCashW                  ; cash paid 
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #3 
                    bhs      do1_3_0 
do1_3_0 
notShotInc3bShop 
                    lda      #3 
                    sta      playerNumberOfBulletsPerShot 
                    jmp      noButtonActionShopSuccess 

noBullet3BonusShop 
                    cmpa     #SHOP_BONUS_SHOT4 
                    bne      noBullet4BonusShop 
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #4 
                    lbeq     noButtonActionShopFailur 
                    ldb      shopAllowFlags 
                    andb     #SHOP_QUAD_WEAPON 
                    lbeq     noButtonActionShopFailur 
                    stu      playerCashW                  ; cash paid 
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #4 
                    bhs      do1_40 
do1_40 
;notShotInc4bShop 
                    lda      #4 
                    sta      playerNumberOfBulletsPerShot 
                    jmp      noButtonActionShopSuccess 

noBullet4BonusShop 
                    cmpa     #SHOP_BONUS_SHOT5 
                    bne      noBlasterBonusShop 
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #5 
                    lbeq     noButtonActionShopFailur 
                    ldb      shopAllowFlags 
                    andb     #SHOP_SUPER_WEAPON 
                    lbeq     noButtonActionShopFailur 
                    stu      playerCashW                  ; cash paid 
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #5 
                    bhs      do1_40_5 
do1_40_5 
                    lda      #5 
                    sta      playerNumberOfBulletsPerShot 
                    jmp      noButtonActionShopSuccess 

noBlasterBonusShop 
                    cmpa     #SHOP_BONUS_SHOT6 
                    bne      noLaserBonusShop 
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #6 
                    lbeq     noButtonActionShopFailur 
                    ldb      shopAllowFlags 
                    andb     #SHOP_LASER_WEAPON 
                    lbeq     noButtonActionShopFailur 
                    stu      playerCashW                  ; cash paid 
notShotInc4bShop 
                    lda      #6 
                    sta      playerNumberOfBulletsPerShot 
                    jmp      noButtonActionShopSuccess 

noLaserBonusShop 
                    cmpa     #SHOP_BONUS_ARMOR 
                    bne      noArmorBonusShop 
                    lda      playerBonusActive 
                    anda     #BITFIELD_ARMOR 
                    lbne     noButtonActionShopFailur     ; aror already bought 
                    stu      playerCashW                  ; cash paid 
                    clr      playerAnim                   ; reset animation counter to 0 
                    lda      #BITFIELD_ARMOR 
                    sta      playerBonusActive 
                    jmp      noButtonActionShopSuccess 

noArmorBonusShop 
                    cmpa     #SHOP_BONUS_AUTOFIRE 
                    bne      noAutofireBonusShop 
                    lda      diverseFlags 
                    anda     #BIT_FLAG_AUTOFIRE 
                    lbne     noButtonActionShopFailur 
                    stu      playerCashW                  ; cash paid 
                    inc      diverseFlags                 ; autofire is "1" 
                    jmp      noButtonActionShopSuccess 

noAutofireBonusShop 
                    cmpa     #SHOP_BONUS_TIMER 
                    bne      noTimerBonusShop 
                    ldd      bonusTimerLength 
                    addd     #250                         ; add five seconds 
; max $7fff
                    lbmi     noButtonActionShopFailur 
                    stu      playerCashW                  ; cash paid 
                    std      bonusTimerLength 
                    jmp      noButtonActionShopSuccess 

noTimerBonusShop 
                    cmpa     #SHOP_BONUS_LIFE 
                    bne      noExtraLifeBonusShop 
                    lda      difficulty 
                    lbmi     noButtonActionShopFailur 
                    inc      playerLives 
                    lda      playerLives 
                    cmpa     # '9'
                    blo      noButtonActionShopSuccess_lives 
                    lda      # '9'
                    sta      playerLives                  ; not more than 9 lives! 
                    jmp      noButtonActionShopFailur 

noButtonActionShopSuccess_lives 
                    stu      playerCashW                  ; cash paid 
                    jmp      noButtonActionShopSuccess 

noExtraLifeBonusShop 
                    cmpa     #SHOP_BONUS_POWER 
                    bne      noPowerBonusShop 
 if  ALLOW_BUY_EVERYTHING = 1 
 else  
                    ldb      difficulty 
                    lbeq     noButtonActionShopFailur 
 endif  
                    inc      bulletDamageAdjust 
                    lda      bulletDamageAdjust 
                    cmpa     #MAX_BULLET_POWER_ADJUST     ; I "THINK" 15 is max - not sure though - lol 
                    blo      shotDamageOk1 
                    lda      #MAX_BULLET_POWER_ADJUST 
                    sta      bulletDamageAdjust 
                    jmp      noButtonActionShopFailur 

shotDamageOk1 
                    stu      playerCashW                  ; cash paid 
                    jmp      noButtonActionShopSuccess 

noPowerBonusShop 
                    cmpa     #SHOP_BONUS_LOCK 
                    bne      noLockLifeBonusShop 
                    ldb      shopAllowFlags 
                    andb     #SHOP_LOCK 
                    lbeq     noButtonActionShopFailur 
                    lda      lockPurchased 
                    anda     #%00001111 
                    cmpa     #15 
                    lbeq     noButtonActionShopFailur 
                    inc      lockPurchased 
                    stu      playerCashW                  ; cash paid 
                    jmp      noButtonActionShopSuccess 

noLockLifeBonusShop 
                    cmpa     #SHOP_BONUS_BOMB 
                    bne      noSuperbombBonusShop 
                    ldb      shopAllowFlags 
                    andb     #SHOP_SUPER_BOMB_L 
                    lbeq     noButtonActionShopFailur 
                    inc      smartBombsAvailable 
                    stu      playerCashW                  ; cash paid 
                    jmp      noButtonActionShopSuccess 

noSuperbombBonusShop 
                    cmpa     #SHOP_BONUS_RANK 
                    bne      noRankBonusShop 
                    ldb      shopAllowFlags 
                    andb     #SHOP_RANK 
                    lbeq     noButtonActionShopFailur 
                    lda      rankCollected 
                    bita     #COLLECTED_RANK1 
                    beq      dropRank1_s 
                    bita     #COLLECTED_RANK2 
                    beq      dropRank2_s 
                    bita     #COLLECTED_RANK3 
                    beq      dropRank3_s 
                    bita     #COLLECTED_RANK4 
                    beq      dropRank4_s 
                    bita     #COLLECTED_RANK5 
                    beq      dropRank5_s 
                    bita     #COLLECTED_RANK6 
                    beq      dropRank6_s 
                    jmp      noButtonActionShopFailur     ; nothing to buy 

dropRank1_s 
                    ora      #COLLECTED_RANK1 
                    bra      rankBuyDone 

dropRank2_s 
                    ora      #COLLECTED_RANK2 
                    bra      rankBuyDone 

dropRank3_s 
                    ora      #COLLECTED_RANK3 
                    bra      rankBuyDone 

dropRank4_s 
                    ora      #COLLECTED_RANK4 
                    bra      rankBuyDone 

dropRank5_s 
                    ora      #COLLECTED_RANK5 
                    bra      rankBuyDone 

dropRank6_s 
                    ora      #COLLECTED_RANK6 
                    bra      rankBuyDone 

rankBuyDone 
                    sta      rankCollected 
                    stu      playerCashW                  ; cash paid 
                    bra      noButtonActionShopSuccess 

noRankBonusShop 
                    cmpa     #SHOP_BONUS_IMMUNE1 
                    bne      noImmune1BonusShop 
                    ldb      shopAllowFlags 
                    andb     #SHOP_IMMUN1 
                    beq      noButtonActionShopFailur 
                    lda      downgradeImmunity 
                    anda     #1 
                    bne      noButtonActionShopFailur     ; already immun 
                    lda      downgradeImmunity 
                    ora      #1                           ; 1 is immunity 1 
                    sta      downgradeImmunity 
                    stu      playerCashW                  ; cash paid 
                    bra      noButtonActionShopSuccess 

noImmune1BonusShop 
                    cmpa     #SHOP_BONUS_SECRET1 
                    bne      noButtonActionShopFailur     ;noSecret1BonusShop 
                    lda      achievements+4 
                    anda     #%00000111 
                    cmpa     #%00000111 
                    beq      noButtonActionShopFailur     ; allSecretsKnowm 
                    stu      playerCashW                  ; cash paid 
                    inca     
                    pshs     a 
                    lda      achievements+4 
                    anda     #%11111000 
                    ora      ,s 
                    sta      achievements+4 
                    puls     a 
                    deca     
                    lsla     
                    ldx      #secretMessagePointer 
                    ldx      a,x 
                    jsr      jsrBank0X 
; flash cannot be saved while in game -> no RAM!
; flash must be saved at the end of the game!
                    bra      noButtonActionShopSuccess 

secretMessagePointer 
REPLACE_0_2_showSecretMessage1_varFromIRQ0_1 
                    dw       0 
REPLACE_0_2_showSecretMessage2_varFromIRQ0_1 
                    dw       0 
REPLACE_0_2_showSecretMessage3_varFromIRQ0_1 
                    dw       0 
REPLACE_0_2_showSecretMessage4_varFromIRQ0_1 
                    dw       0 
REPLACE_0_2_showSecretMessage5_varFromIRQ0_1 
                    dw       0 
REPLACE_0_2_showSecretMessage6_varFromIRQ0_1 
                    dw       0 
REPLACE_0_2_showSecretMessage7_varFromIRQ0_1 
                    dw       0 
noSecret1BonusShop 
noButtonActionShopSuccess 
                    clr      playerAnim                   ; in case a bullet was bought 
                    lda      playSoundFlags 
                    anda     #%11000000 
                    bne      nosfx4 
REPLACE_1_2_BomberShotData_varFromIRQ1_2 
                    ldx      #0                           ; BomberShotData 
                    stx      sfx_pointer_3 
nosfx4 
                    bra      passedFailure 

notEnoughCashShop 
noButtonActionShopFailur 
                    clr      playerAnim                   ; in case a bullet was bought 
                    lda      playSoundFlags 
                    anda     #%11000000 
                    bne      nosfx4_2 
REPLACE_1_2_shopDeclineData_varFromIRQ1_2 
                    ldx      #0                           ; shopDeclineData 
                    stx      sfx_pointer_3 
nosfx4_2 
passedFailure 
                    lda      #$80 
                    sta      <VIA_t1_cnt_lo 
                    ldx      #$0000 
                    ldd      #$8080 
                    ldu      #Shop 
                    jsr      draw_synced_list_noshift 
                    _ZERO_VECTOR_BEAM  
                    IRQ_TO_0_SHIFT  
;
                    ldd      #$f850 
                    std      Vec_Text_HW 
                    ldd      playerCashW 
                    ldu      #StringOutputBuffer_4 
                    jsr      wordToDecString 
                    ldd      #$5b26 -$2000                ;$5e26 
                    ldu      #StringOutputBuffer_4 
                    jsr      syncPrintStrd                ; CSA Print5Strd 
                    _ZERO_VECTOR_BEAM  
; 
                    lda      selected 
                    cmpa     #SHOP_BONUS_SHOT3 
                    bne      notTripleSelected 
                    ldb      shopAllowFlags 
                    andb     #SHOP_TRIPPLE_WEAPON 
                    lbne     isAvailable 
isNotAvailable 
                    ldd      #$fa40 
                    std      Vec_Text_HW 
                    ldu      #notAvailableString 
                    ldd      #$0ba8 -$2000 
                    jsr      syncPrintStrd                ; CSA Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    lda      #$2f 
                    jsr      Intensity_a 
                    bra      isAvailableCont 

notTripleSelected 
                    cmpa     #SHOP_BONUS_POWER 
                    bne      notPowerSelected 
 if  ALLOW_BUY_EVERYTHING = 1 
 else  
                    tst      difficulty 
                    beq      isNotAvailable 
 endif  
                    bra      isAvailable 

notPowerSelected 
                    cmpa     #SHOP_BONUS_SHOT4 
                    bne      notQuadroSelected 
                    ldb      shopAllowFlags 
                    andb     #SHOP_QUAD_WEAPON 
                    beq      isNotAvailable 
                    bra      isAvailable 

notQuadroSelected 
                    cmpa     #SHOP_BONUS_SHOT5 
                    bne      notBlasterSelected 
                    ldb      shopAllowFlags 
                    andb     #SHOP_SUPER_WEAPON 
                    beq      isNotAvailable 
                    bra      isAvailable 

notBlasterSelected 
                    cmpa     #SHOP_BONUS_SHOT6 
                    bne      notLaserSelected 
                    ldb      shopAllowFlags 
                    andb     #SHOP_LASER_WEAPON 
                    beq      isNotAvailable 
                    bra      isAvailable 

notLaserSelected 
                    cmpa     #SHOP_BONUS_LOCK 
                    bne      notLockSelected 
                    ldb      shopAllowFlags 
                    andb     #SHOP_LOCK 
                    beq      isNotAvailable 
                    bra      isAvailable 

notLockSelected 
                    cmpa     #SHOP_BONUS_LIFE 
                    bne      notLifeSelected 
                    lda      difficulty 
                    bpl      isAvailable 
                    bra      isNotAvailable 

notLifeSelected 
                    cmpa     #SHOP_BONUS_BOMB 
                    bne      notBombSelected 
                    ldb      shopAllowFlags 
                    andb     #SHOP_SUPER_BOMB_L 
                    beq      isNotAvailable 
                    bra      isAvailable 

notBombSelected 
                    cmpa     #SHOP_BONUS_RANK 
                    bne      notRankSelected 
                    ldb      shopAllowFlags 
                    andb     #SHOP_RANK 
                    beq      isNotAvailable 
                    bra      isAvailable 

notRankSelected 
                    cmpa     #SHOP_BONUS_IMMUNE1 
                    bne      notImmunSelected 
                    ldb      shopAllowFlags 
                    andb     #SHOP_IMMUN1 
                    lbeq     isNotAvailable 
                    bra      isAvailable 

notImmunSelected 
isAvailable 
isAvailableCont 
; correvt string size for scale
; ldb gameScale
; subb #$80
; asrb
; addb #$40
; lda #$fa
                    jsr      Intensity_7F 
                    ldd      #$fa40 
                    std      Vec_Text_HW 
                    ldu      #selectionStringList         ; selectionStringList 
                    lda      selected 
                    bpl      positiveCont 
                    ldd      #-STRING_SIZE 
                    bra      negativeCont 

positiveCont 
                    ldb      #STRING_SIZE 
                    mul      
negativeCont 
                    leau     d,u 
                    ldd      #$0bf8 -$2000 
                    jsr      syncPrintStrd 
                    _ZERO_VECTOR_BEAM  
;
                    jsr      Intensity_3F 
;
;
                    tst      selected 
                    beq      noBottomShop 
                    bmi      noBottomShop 
                    lda      selected 
                    deca     
                    ldb      #STRING_SIZE 
                    mul      
                    ldu      #selectionStringList         ; selectionStringList 
                    leau     d,u 
                    ldd      #$f2f8 -$2000 
                    jsr      syncPrintStrd 
                    _ZERO_VECTOR_BEAM  
;
noBottomShop 
                    lda      selected 
                    cmpa     #MAX_SELECTED 
                    bge      noTopShop 
                    lda      selected 
                    inca     
                    ldb      #STRING_SIZE 
                    mul      
                    ldu      #selectionStringList         ; selectionStringList 
                    leau     d,u 
                    ldd      #$22f8 -$2000 
                    jsr      syncPrintStrd 
                    _ZERO_VECTOR_BEAM  
;
noTopShop 
                    lda      #$2f 
                    jsr      Intensity_a 
                    lda      selected 
                    deca     
                    deca     
                    bmi      noBottomBottomShop 
                    ldb      #STRING_SIZE 
                    mul      
                    ldu      #selectionStringList         ; selectionStringList 
                    leau     d,u 
                    ldd      #$e0f8 -$2000 
                    jsr      syncPrintStrd 
                    _ZERO_VECTOR_BEAM  
;
noBottomBottomShop 
                    lda      selected 
                    inca     
                    inca     
                    cmpa     #MAX_SELECTED 
                    bgt      noTopTopShop 
                    ldb      #STRING_SIZE 
                    mul      
                    ldu      #selectionStringList         ; selectionStringList 
                    leau     d,u 
                    ldd      #$34f8 -$2000 
                    jsr      syncPrintStrd 
                    _ZERO_VECTOR_BEAM  
;
noTopTopShop 
                    jsr      Intensity_5F 
                    ldb      #$80 
                    stb      <VIA_aux_cntl 
                    jsr      calibrationZero7 
                    lda      #$80 
                    sta      VIA_t1_cnt_lo 
                    ldd      #$51d0 -$2000 
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    lda      #OBJECT_SCALE 
                    sta      VIA_t1_cnt_lo 
                    ldu      #Merchant 
                    MY_MOVE_TO_A_END  
                    jsr      SMVB_drawSmart 
                    jsr      Reset_Pen 
                    jsr      Intensity_3F 
                    lda      #$80 
                    sta      <VIA_t1_cnt_lo 
                    ldd      #$d0d6 -1-$2000 
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    lda      #7 
                    sta      <VIA_t1_cnt_lo 
                    ldu      #shopStatus 
                    MY_MOVE_TO_A_END  
                    jsr      calibrationZero7_NZ 
                    jsr      SMVB_drawSmart 
                    _ZERO_VECTOR_BEAM  
                    ldd      #$30c0 -$2000 
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    lda      #OBJECT_SCALE 
                    sta      VIA_t1_cnt_lo 
                    lda      selected 
                    bmi      noAnimSelectedShop 
                    lsla     
                    ldu      #animList 
                    ldu      a,u 
                    beq      noAnimSelectedShop 
; in u anim list of selected bonus
animOkShop 
; in u anim step of selected bonus
                    dec      animDelayCounter 
                    bne      noAnimChangeShop 
                    lda      #ANIMATION_DELAY 
                    sta      animDelayCounter 
                    inc      bonusAnimCount 
noAnimChangeShop 
; "juggle" stackpointer in order to be able to 
; reuse "ingame" bonus display!
REPLACE_1_2_PrintBonusHere_varFrom0_1                     ;  bank 1 replace 
                    ldx      #0 
                    MY_MOVE_TO_A_END  
                    jsr      jsrBank2_fromT1_1            ;PrintBonusHere 
                    jmp      shopLoop 

noAnimSelectedShop 
                    MY_MOVE_TO_A_END  
                    jmp      shopLoop 

;***************************************************************************
animList 
                    dw       0 
REPLACE_0_2_MalusSpeedAnim_varFrom0_1                     ;  bank 2 replace 
                    dw       0                            ;MalusSpeed_Anim 
REPLACE_0_2_BonusFasterAnim_varFrom0_1                    ;  bank 2 replace 
                    dw       0                            ;BonusFaster_Anim 
REPLACE_0_2_BonusShotsplusAnim_varFrom0_1                 ;  bank 2 replace 
                    dw       0                            ;BonusShotsplus_Anim 
REPLACE_0_2_BonusFasterShotAnim_varFrom0_1                ;  bank 2 replace 
                    dw       0                            ;BonusFasterShot_Anim 
REPLACE_0_2_BonusShot1Anim_varFrom0_1                     ;  bank 2 replace 
                    dw       0                            ;BonusShot1_Anim 
REPLACE_0_2_BonusShot2Anim_varFrom0_1                     ;  bank 2 replace 
                    dw       0                            ;BonusShot2_Anim 
REPLACE_0_2_BonusShot3Anim_varFrom0_1                     ;  bank 2 replace 
                    dw       0                            ;BonusShot3_Anim 
REPLACE_0_2_BonusShot4Anim_varFrom0_1                     ;  bank 2 replace 
                    dw       0                            ;BonusShot4_Anim 
REPLACE_0_2_BonusBlasterAnim_varFrom0_1                   ;  bank 2 replace 
                    dw       0                            ;BonusBlaster_Anim 
REPLACE_0_2_BonusLaserAnim_varFrom0_1                     ;  bank 2 replace 
                    dw       0                            ;BonusLaser_Anim 
REPLACE_0_2_BonusArmorAnim_varFrom0_1                     ;  bank 2 replace 
                    dw       0                            ;BonusArmor_Anim 
REPLACE_0_2_BonusAutofireAnim_varFrom0_1                  ;  bank 2 replace 
                    dw       0                            ;BonusAutofire_Anim 
REPLACE_0_2_BonusTimerAnim_varFrom0_1                     ;  bank 2 replace 
                    dw       0                            ;BonusTimer_Anim 
REPLACE_0_2_BonusLifeAnim_varFrom0_1                      ;  bank 2 replace 
                    dw       0                            ;BonusLife_Anim 
REPLACE_0_2_BonusShotPowerupAnim_varFrom0_1               ;  bank 2 replace 
                    dw       0                            ;BonusShotPowerupAnim 
REPLACE_0_2_BonusLockAnim_varFrom0_1                      ;  bank 2 replace 
                    dw       0                            ;BonusLock_Anim 
REPLACE_0_2_SuperBombAnim_varFrom0_1                      ;  bank 2 replace 
                    dw       0                            ;SuperBombAnim 
REPLACE_0_2_RankMarkerShopAnim_varFrom0_1                 ;  bank 2 replace 
                    dw       0                            ;RankMarkerShopAnim 
REPLACE_0_2_Shot1ImmuneAnim_varFrom0_1                    ;  bank 2 replace 
                    dw       0                            ;Shot1ImmuneAnim 
REPLACE_0_2_BonusSecretAnim_varFrom0_2                    ;  bank 2 replace 
                    dw       0                            ;BonusSecretAnim 
                    dw       0                            ; init 
costList 
                    dw       0                            ; exit 
                    dw       50                           ; slower movement 
                    dw       50                           ; faster movement 
                    dw       75                           ; bullet + 
                    dw       100                          ; bullet speed 
                    dw       50                           ; shot 1 
                    dw       100                          ; shot 2 
                    dw       300                          ; shot 3 
                    dw       500                          ; shot 4 
                    dw       700                          ; blaster 
                    dw       5000                         ; laser 
                    dw       500                          ; armor 
                    dw       350                          ; autofire 
                    dw       1000                         ; timer 
                    dw       500                          ; life 
                    dw       6000                         ; power 
                    dw       8000                         ; lock 
                    dw       800                          ; bomb 
                    dw       1000                         ; rank 
                    dw       100                          ; immune1 
                    dw       3000                         ; secret 1 
Shop: 
                    DB       $01, -$42-$20, -$10          ; sync and move to y, x 
                    DB       $FF, +$42, +$00              ; draw, y, x 
                    DB       $FF, +$52, +$00              ; draw, y, x 
                    DB       $FF, +$00, -$5C              ; draw, y, x 
                    DB       $FF, -$42, +$00              ; draw, y, x 
                    DB       $FF, -$52, +$00              ; draw, y, x 
                    DB       $FF, +$00, +$5C              ; draw, y, x 
                    DB       $01, -$42-$20, -$10          ; sync and move to y, x 
                    DB       $FF, +$00, +$7C              ; draw, y, x 
                    DB       $FF, +$52, +$00              ; draw, y, x 
                    DB       $FF, +$53, +$00              ; draw, y, x 
                    DB       $FF, +$00, -$4E              ; draw, y, x 
                    DB       $FF, -$11, +$00              ; draw, y, x 
                    DB       $00, +$00, +$4E              ; mode, y, x 
                    DB       $FF, +$00, -$7C              ; draw, y, x 
                    DB       $01, +$00-$20, +$6C          ; sync and move to y, x 
                    DB       $FF, +$00, -$7C              ; draw, y, x 
                    DB       $FF, +$00, -$5C              ; draw, y, x 
                    DB       $00, +$10, +$00              ; mode, y, x 
                    DB       $FF, +$00, +$5C              ; draw, y, x 
                    DB       $FF, +$00, +$7C              ; draw, y, x 
                    DB       $02                          ; endmarker 
;***************************************************************************
; DATA SECTION
;***************************************************************************
;-----------------------------------------------------------------------------
STRING_SIZE         =        13 
String0:            db       "            ",$80
selectionStringList 
String1:            db       "DONE        ",$80
String2:            db       "SPEED -   50",$80
String3:            db       "SPEED +   50",$80
String4:            db       "BULLET +  75",$80
String5:            db       "RATE +   100",$80
String6:            db       "BULLET 1  50",$80
String7:            db       "BULLET 2 100",$80
String8:            db       "BULLET 3 300",$80
String9:            db       "BULLET 4 500",$80
Stringa:            db       "BLASTER  700",$80
Stringb:            db       "LASER   5000",$80
Stringc:            db       "ARMOR    500",$80
Stringd:            db       "AUTOFIRE 350",$80
Stringd1:           db       "TIMER   1000",$80
Stringe:            db       "LIFE     500",$80
Stringe2:           db       "POWER   6000",$80
Stringf:            db       "LOCK    8000",$80
Stringf1:           db       "BOMB     800",$80
Stringf2:           db       "RANK    1000",$80
Stringf3:           db       "IMMUNE 1 100",$80
Stringg1:           db       "SECRET  3000",$80
notAvailableString 
                    db       "N / A",$80 
shopStatus 
                    db       $00, $01, -$7E, hi(SMVB_startDraw_quadro), lo(SMVB_startDraw_quadro) 
                    db       -$75, $01, $2A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$20, $01, $30, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $30, $01, $20, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $30, $01, -$40 
                    db       $20, $01, $20 
                    db       -$10, $01, $20 
                    db       -$40, $01, $18, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       $6B, $01, $00, hi(SMVB_startDraw_hex), lo(SMVB_startDraw_hex) 
                    db       $00, $01, $55, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       -$6B, $01, $00, hi(SMVB_startDraw_hex), lo(SMVB_startDraw_hex) 
                    db       $70, $01, -$30, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $20, $01, -$40, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$40, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $20, $01, $40, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $20, $01, -$20 
                    db       $20, $01, $20 
                    db       -$60, $01, $70, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $40, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $45, $01, $00, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$1A, $01, $3A 
                    db       -$2E, $01, -$27 
                    db       -$3D, $01, $27 
                    db       -$04, $01, -$73, hi(SMVB_startMove_quadro), lo(SMVB_startMove_quadro) 
                    db       $6B, $01, $00, hi(SMVB_startDraw_hex), lo(SMVB_startDraw_hex) 
                    db       $00, $01, $7E, hi(SMVB_continue_quadro), lo(SMVB_continue_quadro) 
                    db       -$6B, $01, $00, hi(SMVB_continue_hex), lo(SMVB_continue_hex) 
                    db       $00, $01, -$7E, hi(SMVB_continue_quadro), lo(SMVB_continue_quadro) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
Merchant 
                    db       $64, $01, $00, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $63, $01, $36, hi(SMVB_startMove_quadro), lo(SMVB_startMove_quadro) 
                    db       $4A, $01, -$1C, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $68, $01, $64, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $4A, $01, -$1E 
                    db       $25, $01, -$0F, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$42, $01, -$18, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $58, $01, -$3C, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$58, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$58, $01, -$34, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $42, $01, -$1C 
                    db       $21, $01, -$0E, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$4C, $01, -$1E, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$6C, $01, $64, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$46, $01, -$18, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$1A, $01, -$7E, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$7C, $01, -$18, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$62, $01, $34, hi(SMVB_continue_tripple), lo(SMVB_continue_tripple) 
                    db       $00, $01, $72, hi(SMVB_startMove_tripple), lo(SMVB_startMove_tripple) 
                    db       $00, $01, $75, hi(SMVB_continue_tripple), lo(SMVB_continue_tripple) 
                    db       $62, $01, $31, hi(SMVB_startDraw_tripple), lo(SMVB_startDraw_tripple) 
;                    db       $00, $01, $72, hi(SMVB_continue_tripple), lo(SMVB_continue_tripple) 
;                    db       $00, $01, $75, hi(SMVB_continue_tripple), lo(SMVB_continue_tripple) 
;                    db       $62, $01, $31, hi(SMVB_continue_tripple), lo(SMVB_continue_tripple) 
                    db       $55, $01, -$10, hi(SMVB_continue_tripple), lo(SMVB_continue_tripple) 
                    db       $16, $01, -$76, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$68, $01, -$70, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$66, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $68, $01, -$64, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $38, $01, $68, hi(SMVB_startMove_single), lo(SMVB_startMove_single) ; ! 
                    db       $00, $01, $66, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       -$65, $01, $52, hi(SMVB_startMove_tripple), lo(SMVB_startMove_tripple) 
                    db       -$62, $01, -$36, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $00, $01, -$48, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $30, $01, -$68, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$30, $01, -$5C 
                    db       $00, $01, -$4C, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $60, $01, -$30, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $56, $01, $22, hi(SMVB_startMove_hex), lo(SMVB_startMove_hex) 
                    db       -$3A, $01, $2E, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $00, $01, $5C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $3A, $01, $34, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
MUST_BE_BEFORE_7ff0_for_VECEFEVER 
