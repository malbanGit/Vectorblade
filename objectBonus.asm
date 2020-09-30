; bank 2
BONUS_PLAYER_X_RANGE  =      15 
BONUS_PLAYER_Y_TEST_MIN  =   $80 +20 
;
; all bonus stuff is in bank 0
 if  CURRENT_BANK = 2 
 if  DO_DYING_BONUS = 1 
risingBonusBehaviourXn2 
;                    dec      X_POS+u_offset1,s            ; preload next user stack 
                    dec      X_POS+u_offset1,s            ; preload next user stack 
                    dec      X_POS+u_offset1,s            ; preload next user stack 
                    bra      risingBonusBehaviour 

risingBonusBehaviourXn1 
                    inc      Y_POS+u_offset1,s            ; preload next user stack 
;                    dec      X_POS+u_offset1,s            ; preload next user stack 
                    dec      X_POS+u_offset1,s            ; preload next user stack 
                    bra      risingBonusBehaviour 

risingBonusBehaviourXp2 
                    inc      X_POS+u_offset1,s            ; preload next user stack 
;                    inc      X_POS+u_offset1,s            ; preload next user stack 
                    inc      X_POS+u_offset1,s            ; preload next user stack 
                    bra      risingBonusBehaviour 

risingBonusBehaviourXp1 
                    inc      Y_POS+u_offset1,s            ; preload next user stack 
;                    inc      X_POS+u_offset1,s            ; preload next user stack 
                    inc      X_POS+u_offset1,s            ; preload next user stack 
                    bra      risingBonusBehaviour 

risingBonusBehaviourX0 
                    inc      Y_POS+u_offset1,s            ; preload next user stack 
                    inc      Y_POS+u_offset1,s            ; preload next user stack 
                    nop      
risingBonusBehaviour                                      ;#isfunction  
                    MY_MOVE_TO_D_START  
                    ldb      #OBJECT_SCALE 
                    stb      VIA_t1_cnt_lo 
                    lda      TYPE+u_offset1,s 
                    ldx      #BonusList 
                    ldx      a,x                          ; in x pointer to current bonus struct 
                    ldx      ,x                           ; pointer to animation list of bonus 
                    tst      animDelayCounter 
                    bpl      noAnimChange2 
                    inc      BONUS_ANIM_POSITION+u_offset1,s 
; check if end of animation (for now always 19 - but that might change -> 0 terminated dw list)
                    lda      BONUS_ANIM_POSITION+u_offset1,s 
                    anda     #%01111111 
                    asla     
                    ldu      a,x                          ; current active animation 
                    bne      displayBonus2 
                    lda      BONUS_ANIM_POSITION+u_offset1,s 
                    anda     #%10000000 
                    sta      BONUS_ANIM_POSITION+u_offset1,s 
noAnimChange2 
                    lda      BONUS_ANIM_POSITION+u_offset1,s 
                    anda     #%01111111 
                    asla     
                    ldu      a,x                          ; current active animation (no need to load 0 
displayBonus2 
; todo change X
                    inc      Y_POS+u_offset1,s            ; preload next user stack 
                    inc      Y_POS+u_offset1,s            ; preload next user stack 
                    lds      NEXT_SHOT_OBJECT+u_offset1,s ; preload next user stack 
                    MY_MOVE_TO_A_END  
                    clra     
                    pulu     b,x,pc 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 endif  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; new list object to U
; leaves with flags set to result
; (positive = not successfull) ROM
; negative = successfull RAM
; destroys d, u 
newBonusObject                                            ;#isfunction  
                    ldu      bonuslist_empty_head 
                    cmpu     #OBJECT_LIST_COMPARE_ADDRESS 
                    bls      cs_done_nob 
                                                          ; set the new empty head 
                    ldd      NEXT_BONUS_OBJECT,u          ; the next in out empty list will be the new 
                    std      bonuslist_empty_head         ; head of our empty list 
                                                          ; load last of current object list 
; the old head is always our next
                    ldd      bonuslist_objects_head 
                    std      NEXT_BONUS_OBJECT,u 
; newobject is always head
                    stu      bonuslist_objects_head 
                    inc      bonusCount                   ; and remember that we created a new object 
cs_done_nob 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
spawnBonus                                                ;#isfunction  
                    bsr      newBonusObject               ; "create" (or rather get) new object 
                    leax     ,u                           ; pointer to new object now in X also 
                    cmpu     #OBJECT_LIST_COMPARE_ADDRESS 
                    bls      spawnBonus_end2 
                                                          ; bpl spawnBonus_end ; if positve - there is no object left, jump out 
; copy and initialze new enemy
; used in calb for now
                    ldd      #simpleBonusBehaviour 
                    std      BEHAVIOUR,x 
spawnBonus_end 
spawnBonus_end2 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
simpleBonusBehaviour                                      ;#isfunction  
                    MY_MOVE_TO_D_START  
                    lds      NEXT_SHOT_OBJECT+u_offset1,s ; preload next user stack 
                    ldb      #OBJECT_SCALE 
                    stb      VIA_t1_cnt_lo 
                    ldu      #BonusE_Anim_0 
                    MY_MOVE_TO_A_END  
                    clra     
                    pulu     b,x,pc 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
fallingRankBehaviour                                      ;#isfunction  
                    MY_MOVE_TO_D_START  
;;;;;;
; colision detection bonus -> player
; in b is still x position, so start with that
; xTest
                    subb     playerXpos 
                    bpl      testPositive_xRank 
                    negb     
testPositive_xRank 
                    cmpb     #BONUS_PLAYER_X_RANGE 
                    bhi      notHit_Rank 
; yTest
                    ldb      Y_POS +u_offset1,s 
                    cmpb     #BONUS_PLAYER_Y_TEST_MIN 
                    lblt     playerCaughtRank 
notHit_Rank 
displayContinueRank 
                    ldb      #OBJECT_SCALE 
                    stb      VIA_t1_cnt_lo 
                    ldx      #RankMarkerCircle_Anim 
                    inc      BONUS_ANIM_POSITION+u_offset1,s 
; check if end of animation (for now always 19 - but that might change -> 0 terminated dw list)
                    lda      BONUS_ANIM_POSITION+u_offset1,s 
                    asla     
                    ldu      a,x                          ; current active animation 
                    bne      displayRank 
                    clr      BONUS_ANIM_POSITION+u_offset1,s 
noAnimChangeRank 
                    lda      BONUS_ANIM_POSITION+u_offset1,s 
                    asla     
                    ldu      a,x                          ; current active animation (no need to load 0 
displayRank 
                    dec      Y_POS+u_offset1,s            ; preload next user stack 
                    lda      #$7f 
                    cmpa     Y_POS+u_offset1,s 
                    lbeq     removeBonus 
                    lda      TYPE+u_offset1,s 
                    cmpa     #4 
                    blo      noSpeedp 
                    dec      Y_POS+u_offset1,s            ; preload next user stack 
                    ldb      #$7f 
                    cmpb     Y_POS+u_offset1,s 
                    lbeq     removeBonus 
                    cmpa     #8 
                    blo      noSpeedp 
                    dec      Y_POS+u_offset1,s            ; preload next user stack 
                    ldb      #$7f 
                    cmpb     Y_POS+u_offset1,s 
                    lbeq     removeBonus 
noSpeedp 
                    sts      StringOutputBuffer_0 
                    lda      TYPE+u_offset1,s 
                    lds      #MY_STACK-4                  ; higher stack damage other stack saves :-( ; CBFC ; correct the stack to default address 
                    pshs     u 
                    ldu      #RankList 
                    ldu      a,u 
                    MY_MOVE_TO_A_END  
                    jsr      SMVB_drawSmart 
                    puls     u 
                    lds      StringOutputBuffer_0 
                    lds      NEXT_SHOT_OBJECT+u_offset1,s ; preload next user stack 
                    clra     
                    pulu     b,x,pc 
RankList 
                    dw       RankMarker1 
                    dw       RankMarker2 
                    dw       RankMarker3 
                    dw       RankMarker4 
                    dw       RankMarker5 
                    dw       RankMarker6 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
fallingBonusBehaviour                                     ;#isfunction  
                    MY_MOVE_TO_D_START  
continnueWithFallin 
;;;;;;
; colision detection bonus -> player
; in b is still x position, so start with that
; xTest
                    subb     playerXpos 
                    bpl      testPositive_xBonus 
                    negb     
testPositive_xBonus 
                    cmpb     #BONUS_PLAYER_X_RANGE 
                    bhi      notHit_bonus 
; yTest
                    ldb      Y_POS +u_offset1,s 
                    cmpb     #BONUS_PLAYER_Y_TEST_MIN 
                    lblt     playerCaughtBonus 
notHit_bonus 
displayContinueBonus 
                    ldb      #OBJECT_SCALE 
                    stb      VIA_t1_cnt_lo 
                    lda      TYPE+u_offset1,s 
                    ldx      #BonusList 
                    ldx      a,x                          ; in x pointer to current bonus struct 
                    ldx      ,x                           ; pointer to animation list of bonus 
                    tst      animDelayCounter 
                    bpl      noAnimChange 
                    inc      BONUS_ANIM_POSITION+u_offset1,s 
; check if end of animation (for now always 19 - but that might change -> 0 terminated dw list)
                    lda      BONUS_ANIM_POSITION+u_offset1,s 
                    anda     #%01111111 
                    asla     
                    ldu      a,x                          ; current active animation 
                    bne      displayBonus 
                    lda      BONUS_ANIM_POSITION+u_offset1,s 
                    anda     #%10000000 
                    sta      BONUS_ANIM_POSITION+u_offset1,s 
noAnimChange 
                    lda      BONUS_ANIM_POSITION+u_offset1,s 
                    anda     #%01111111 
                    asla     
                    ldu      a,x                          ; current active animation (no need to load 0 
displayBonus 
                    dec      Y_POS+u_offset1,s            ; preload next user stack 
                    tst      BONUS_ANIM_POSITION+u_offset1,s 
                    bpl      nodoublespeedBonus 
                    dec      Y_POS+u_offset1,s            ; preload next user stack 
nodoublespeedBonus 
                    lda      #-$7f+2 
                    cmpa     Y_POS+u_offset1,s 
                    lbge     removeBonus 
                    lds      NEXT_SHOT_OBJECT+u_offset1,s ; preload next user stack 
                    MY_MOVE_TO_A_END  
                    clra     
                    pulu     b,x,pc 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
UPDATE_EMPTY_BONUS_2  macro  
                    dec      bonusCount 
                    ldy      bonuslist_empty_head         ; set u free, as new free head 
                    sty      NEXT_BONUS_OBJECT,x          ; load to u the next linked list element 
                    stx      bonuslist_empty_head 
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MUST BE USED ONCE ONLY!
CHECK_EXTRA_COMPLETED  macro  
                    lda      bonusCollect 
                    cmpa     #1+2+4+8+16 
                    lbne     notAllYet\? 
                    lda      playSoundFlags 
                    anda     #%11000000 
                    bne      noExtraSound\? 
REPLACE_1_2_EXTRACollectedData_varFromIRQ1_3 
                    ldx      #0                           ;EXTRACollectedData 
                    stx      sfx_pointer_1 
noExtraSound\? 
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #6 
                    bne      notFullYet\? 
                    ldy      #player_score 
                    lda      multiplyer 
                    lsra     
                    lsra     
                    sta      bonusCollect 
addAgainBonus\?                                           ;        add 20000 points 
                    ldd      #9999 
                    ldu      #scoreBack1\? 
                    jmp      addScore_d 

scoreBack1\? 
                    ldd      #9999 
                    ldu      #scoreBack2\? 
                    jmp      addScore_d 

scoreBack2\? 
                    dec      bonusCollect 
                    bmi      notFullYet\? 
                    bne      addAgainBonus\? 
notFullYet\? 
                    clr      bonusCollect 
                    clr      bonusDisplay 
                    lda      secretBonusCounter 
                    bpl      noLaserDiscovered\? 
                    lda      inGameSecrets 
                    anda     #SECRET_ORDERED_EXTRA 
                    bne      secretKnown2\? 
                    lda      inGameSecrets 
                    ora      #SECRET_ORDERED_EXTRA 
                    sta      inGameSecrets 
                    PLAY_SECRET_JINGLE  
REPLACE_1_2_SecretString_varFrom1_1\?                     ;  bank 1 replace 
                    ldd      #0                           ;SecretString 
                    INIT_MESSAGE_D  
secretKnown2\? 
REPLACE_1_2_bandit_varFromIRQ1_132 
                    ldx      #0                           ; bandit 
                    jmp      jmpBankIRQ1Shift 

backFromBandit 
adjustAndRemove 
                    ldy      #removeBonus 
                    jmp      adjustAndJumpY 

noLaserDiscovered\? 
                    lda      secretBonusCounter 
                    anda     #$ff-$80 
                    sta      secretBonusCounter           ; reset EXTRA BONUS counter in case of a fail 
                    lda      playerMaxShotInAir 
                    cmpa     #MAX_PLAYERSHOT_OBJECTS 
                    beq      noAdditionalShotEither\? 
                    inc      playerMaxShotInAir 
noAdditionalShotEither\? 
                    lda      playerNumberOfBulletsPerShot 
                    inca     
                    cmpa     #7 
                    bhs      toManyShoot\? 
                    sta      playerNumberOfBulletsPerShot 
toManyShoot\? 
                    jmp      adjustAndRemove 

notAllYet\? 
                    lda      playSoundFlags 
                    anda     #%11000000 
                    bne      noExtraSound22\? 
REPLACE_1_2_letterData_varFromIRQ1_3 
                    ldx      #0                           ;letterData 
                    stx      sfx_pointer_1 
noExtraSound22\? 
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                    dw       BonusMoney200Caught 
bonusHandleJumper 
                    dw       BonusECaught 
                    dw       BonusXCaught 
                    dw       BonusTCaught 
                    dw       BonusRCaught 
                    dw       BonusACaught 
                    dw       BonusShotPlusCaught 
                    dw       BonusFasterCaught 
                    dw       BonusFasterShotCaught 
                    dw       BonusSlowerCaught 
                    dw       BonusShotMinusCaught 
                    dw       BonusMoney5Caught 
                    dw       BonusMoney20Caught 
                    dw       BonusMoney50Caught 
                    dw       BonusArmorCaught 
                    dw       BonusShieldCaught 
                    dw       BonusSwoopCaught 
                    dw       BonusShot1Caught 
                    dw       BonusShot2Caught 
                    dw       BonusShot3Caught 
                    dw       BonusShot4Caught 
                    dw       BonusMinestormCaught 
                    dw       BonusMult2Caught 
                    dw       BonusMult5Caught 
                    dw       BonusBombCashCaught 
                    dw       BonusBombDiamondCaught 
                    dw       BonusTimerCaught 
                    dw       BonusSlowerShotCaught 
                    dw       BonusCashDoublerCaught 
                    dw       BonusShotPowerupCaught 
                    dw       BonusLifeCaught 
                    dw       BonusDrunkenCaught 
                    dw       BonusAutofireCaught 
                    dw       removeBonus 
RankHandleJumper 
                    dw       rank1Caught 
                    dw       rank2Caught 
                    dw       rank3Caught 
                    dw       rank4Caught 
                    dw       rank5Caught 
                    dw       rank6Caught 
                    dw       rankNegative 
                    dw       removeBonus 
 if  TEST_VOX = 1 
;REPLACE_0_2_voxMoney_varFromIRQ0_10  dw  0 ;voxMoney
                    dw       0                            ;voxMoney - just zero NO address, otherwise other vox will just be BROKEN 
voxData 
REPLACE_0_2_voxExtraLetter_varFromIRQ0_1  dw  0 
REPLACE_0_2_voxExtraLetter_varFromIRQ0_2  dw  0 
REPLACE_0_2_voxExtraLetter_varFromIRQ0_3  dw  0 
REPLACE_0_2_voxExtraLetter_varFromIRQ0_4  dw  0 
REPLACE_0_2_voxExtraLetter_varFromIRQ0_5  dw  0 
REPLACE_0_2_voxExtraBullet_varFromIRQ0_1  dw  0 
REPLACE_0_2_voxFighterSpeed_varFromIRQ0_1  dw  0 
REPLACE_0_2_voxShotSpeed_varFromIRQ0_1  dw  0 
REPLACE_0_2_voxSucker_varFromIRQ0_1  dw  0 
REPLACE_0_2_voxSucker_varFromIRQ0_2  dw  0 
                    dw       0                            ;voxMoney - just zero NO address, otherwise other vox will just be BROKEN 
                    dw       0                            ;voxMoney - just zero NO address, otherwise other vox will just be BROKEN 
                    dw       0                            ;voxMoney - just zero NO address, otherwise other vox will just be BROKEN 
REPLACE_0_2_voxArmor_varFromIRQ0_1  dw  0 
REPLACE_0_2_voxShield_varFromIRQ0_1  dw  0 
REPLACE_0_2_voxScoop_varFromIRQ0_1  dw  0 
REPLACE_0_2_voSingleShot_varFromIRQ0_1  dw  0 
REPLACE_0_2_voxDoubleShot_varFromIRQ0_1  dw  0 
REPLACE_0_2_voxTrippleShot_varFromIRQ0_1  dw  0 
REPLACE_0_2_voxBonus_varFromIRQ0_6  dw  0 
REPLACE_0_2_voxMinestorm_varFromIRQ0_1  dw  0 
REPLACE_0_2_voxMultiply_varFromIRQ0_1  dw  0 
REPLACE_0_2_voxMultiply_varFromIRQ0_2  dw  0 
REPLACE_0_2_voxCashBomb_varFromIRQ0_1  dw  0 
REPLACE_0_2_voxDiamondBomb_varFromIRQ0_1  dw  0 
REPLACE_0_2_voxTime_varFromIRQ0_1  dw  0 
REPLACE_0_2_voxSucker_varFromIRQ0_3  dw  0 
REPLACE_0_2_voxDoubleCash_varFromIRQ0_1  dw  0 
REPLACE_0_2_voxShotPower_varFromIRQ0_1  dw  0 
REPLACE_0_2_voxExtraLife_varFromIRQ0_1  dw  0             ;voxExtraLife 
REPLACE_0_2_voxDrunken_varFromIRQ0_1  dw  0 
REPLACE_0_2_voxAutofire_varFromIRQ0_1  dw  0 
 endif  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
playerCaughtBonus                                         ;#isfunction  
;REPLACE_1_2_bandit_varFromIRQ1_1312 
;                    ldx      #0                           ; bandit 
;                    jmp      jmpBankIRQ1Shift 
                    lda      TYPE +u_offset1,s 
 if  TEST_VOX = 1 
                    ldu      #voxData 
                    ldu      a,u 
                    beq      noNewVoxData 
                    stu      vox_addr 
noNewVoxData 
 endif  
                    ldu      #bonusHandleJumper 
                    jmp      [a,u] 

playerCaughtRank                                          ;#isfunction  
 if  TEST_VOX = 1 
REPLACE_1_2_voxRankMarker_varFromIRQ0_1 
                    ldu      #0                           ; voxRankMarker 
                    stu      vox_addr 
 endif  
                    lda      TYPE +u_offset1,s 
                    ldu      #RankHandleJumper 
                    jmp      [a,u] 

rank1Caught 
; here check correct order of RANK
                    lda      rankCollected 
                    bne      destroyRankOrder1 
                    lda      secretBonusCounter 
                    ora      #$40 
                    sta      secretBonusCounter 
                    bra      contRank1 

destroyRankOrder1 
                    lda      secretBonusCounter 
                    anda     #$ff-$40 
                    sta      secretBonusCounter 
contRank1 
                    lda      rankCollected 
                    ora      #COLLECTED_RANK1 
                    sta      rankCollected 
                    jmp      rankCaughtEnd 

rank2Caught 
; here check correct order of RANK
                    lda      rankCollected 
                    cmpa     #1 
                    beq      contRank2 
                    lda      secretBonusCounter 
                    anda     #$ff-$40 
                    sta      secretBonusCounter 
contRank2 
                    lda      rankCollected 
                    ora      #COLLECTED_RANK2 
                    sta      rankCollected 
                    jmp      rankCaughtEnd 

rank3Caught 
; here check correct order of RANK
                    lda      rankCollected 
                    cmpa     #1+2 
                    beq      contRank3 
                    lda      secretBonusCounter 
                    anda     #$ff-$40 
                    sta      secretBonusCounter 
contRank3 
                    lda      rankCollected 
                    ora      #COLLECTED_RANK3 
                    sta      rankCollected 
                    jmp      rankCaughtEnd 

rank4Caught 
; here check correct order of RANK
                    lda      rankCollected 
                    cmpa     #1+2+4 
                    beq      contRank4 
                    lda      secretBonusCounter 
                    anda     #$ff-$40 
                    sta      secretBonusCounter 
contRank4 
                    lda      rankCollected 
                    ora      #COLLECTED_RANK4 
                    sta      rankCollected 
                    bra      rankCaughtEnd 

rank5Caught 
; here check correct order of RANK
                    lda      rankCollected 
                    cmpa     #1+2+4+8 
                    beq      contRank5 
                    lda      secretBonusCounter 
                    anda     #$ff-$40 
                    sta      secretBonusCounter 
contRank5 
                    lda      rankCollected 
                    ora      #COLLECTED_RANK5 
                    sta      rankCollected 
                    bra      rankCaughtEnd 

rank6Caught 
; here check correct order of RANK
                    lda      rankCollected 
                    cmpa     #1+2+4+8+16 
                    bne      destoryRanksSecret 
                    lda      secretBonusCounter 
                    anda     #SECRET_ORDERED_RANKS 
                    beq      destoryRanksSecret           ; if not gotten in order -> 
                    lda      inGameSecrets 
                    anda     #SECRET_ORDERED_RANKS 
                    bne      contRank6 
                    lda      inGameSecrets 
                    ora      #SECRET_ORDERED_RANKS 
                    sta      inGameSecrets 
                    PLAY_SECRET_JINGLE  
                    lda      rankCollected 
                    ora      #COLLECTED_RANK6 
                    sta      rankCollected 
REPLACE_1_2_SecretString_varFrom1_7                       ;  bank 1 replace 
                    ldd      #0                           ;SecretString 
                    INIT_MESSAGE_D  
                    jmp      removeBonus 

destoryRanksSecret 
                    lda      secretBonusCounter 
                    anda     #$ff-$40 
                    sta      secretBonusCounter 
contRank6 
                    lda      rankCollected 
                    ora      #COLLECTED_RANK6 
                    sta      rankCollected 
                    bra      rankCaughtEnd 

rankNegative 
                    bra      rankbonusCaughtEnd2 

rankCaughtEnd 
                    lda      rankCollected 
                    anda     #%00111111 
                    cmpa     #%00111111 
                    bne      rankNotFull 
REPLACE_1_2_rankAllString_varFrom1_1                      ;  bank 1 replace 
                    ldd      #0                           ;rankAllString 
                    bra      rankCaught2End 

rankNotFull 
REPLACE_1_2_rankString_varFrom1_1                         ;  bank 1 replace 
                    ldd      #0                           ;rankString 
rankCaught2End 
                    INIT_MESSAGE_D  
                    lda      playSoundFlags 
                    anda     #%11000000 
                    bne      rankbonusCaughtEnd2 
REPLACE_1_2_rankData_varFromIRQ1_2 
                    ldx      #0                           ; rankData 
                    stx      sfx_pointer_1 
rankbonusCaughtEnd2 
                    jmp      removeBonus 

BonusBombDiamondCaught 
; go thru all enemy objects that are still "normal" enemies (no shield)
; and swith their behaviour to "fallDiamondBehaviour"
; respect "attacker" flag
                    lda      lockPurchased 
                    bita     #ENEMY_DESTRUCTED_FLAG 
                    bne      allEnemiesHandled            ; in warp, enemy list is not available 
                    ldu      enemylist_objects_head 
handleEnemiesLoop 
                    cmpu     #ENEMY_DONE 
                    beq      allEnemiesHandled 
;
; sort out all enemies which should not be 
; "exploded"
                    lda      ALL_PURPOSE,u 
                    bmi      nextEnemy                    ; negative is Explosion 
                    ldx      BEHAVIOUR,u 
REPLACE_1_2_enemyPlayerControlledRightBehaviour_varFrom1_1 ;  bank 1 replace 
                    cmpx     #0                           ;enemyPlayerControlledRightBehaviour 
                    beq      nextEnemy 
REPLACE_1_2_enemyPlayerControlledLeftBehaviour_varFrom1_1 ;  bank 1 replace 
                    cmpx     #0                           ;enemyPlayerControlledLeftBehaviour 
                    beq      nextEnemy 
; handle shield enemies
                    ldx      ENEMY_STRUCT,u 
REPLACE_1_2_enemy3Definition_varFrom1_43                  ;  bank 1 replace 
                    cmpx     #0                           ;enemy3Definition 
                    beq      nextEnemy 
REPLACE_1_2_enemySW3DefinitionShield_varFrom1_43          ;  bank 1 replace 
                    cmpx     #0                           ;enemySW3DefinitionShield 
                    beq      nextEnemy 
; enemy struct not available since it is in BANK 1
; bne nextEnemy
; no change to "explosion"
; check attacker
;        ADD_POINTS_ENEMY_DESTROY  - destroys u, don't do it - diamonds collected give points!
                    inc      bonusHitCount 
                    lda      #-1 
                    sta      ALL_PURPOSE ,u               ; negative means this enemy is an explosion 
                    ldx      BEHAVIOUR,u 
REPLACE_1_2_enemySingleAttackAbsolutBehaviour_varFrom1_1  ;  bank 1 replace 
                    cmpx     #0                           ;enemySingleAttackAbsolutBehaviour 
                    beq      wasAttacker_b1 
REPLACE_1_2_enemySingleAttackRelativeBehaviour_varFrom1_1 ;  bank 1 replace 
                    cmpx     #0                           ;enemySingleAttackRelativeBehaviour 
                    bne      wasNotAttacker_b1 
wasAttacker_b1 
                    dec      attackPatternCount 
wasNotAttacker_b1 
; test if enemy is bug, if so get correct position
REPLACE_1_2_lastNormalEnemyAddress_varFrom1_1             ;  bank 1 replace 
                    cmpx     #0                           ; lastNormalEnemyAddress 
                    blo      normalEnemy_b1 
; bug enemy - change positions
                    lda      Y_POS16,u 
                    ldb      X_POS16,u 
                    std      Y_POS,u 
normalEnemy_b1 
REPLACE_1_2_fallDiamondBehaviour_varFrom1_1               ;  bank 1 replace 
                    ldd      #0                           ;fallDiamondBehaviour 
                    std      BEHAVIOUR,u 
                    clr      ANIM_POSITION,u 
nextEnemy 
                    ldu      NEXT_ENEMY_OBJECT,u 
                    bra      handleEnemiesLoop 

allEnemiesHandled 
REPLACE_1_2_diamonbombString_varFrom1_1                   ;  bank 1 replace 
                    ldd      #0                           ;diamonbombString 
                    jmp      bonusCaughtEndSound 

BonusBombCashCaught 
; go thru all enemy objects that are still "normal" enemies (no shield)
; and swith their behaviour to "fallDiamondBehaviour"
; respect "attacker" flag
                    lda      lockPurchased 
                    bita     #ENEMY_DESTRUCTED_FLAG 
                    bne      allEnemiesHandled_C          ; in warp, enemy list is not available 
                    ldu      enemylist_objects_head 
handleEnemiesLoop_C 
                    cmpu     #ENEMY_DONE 
                    beq      allEnemiesHandled_C 
;
; sort out all enemies which should not be 
; "exploded"
                    lda      ALL_PURPOSE,u 
                    bmi      nextEnemy_C                  ; negative is Explosion 
                    ldx      BEHAVIOUR,u 
REPLACE_1_2_enemyPlayerControlledRightBehaviour_varFrom1_3 ;  bank 1 replace 
                    cmpx     #0                           ;enemyPlayerControlledRightBehaviour 
                    beq      nextEnemy_C 
REPLACE_1_2_enemyPlayerControlledLeftBehaviour_varFrom1_3 ;  bank 1 replace 
                    cmpx     #0                           ;enemyPlayerControlledLeftBehaviour 
                    beq      nextEnemy_C 
; handle shield enemies
                    ldx      ENEMY_STRUCT,u 
REPLACE_1_2_enemy3Definition_varFrom1_42                  ;  bank 1 replace 
                    cmpx     #0                           ;enemy3Definition 
                    beq      nextEnemy_C 
REPLACE_1_2_enemySW3DefinitionShield_varFrom1_42          ;  bank 1 replace 
                    cmpx     #0                           ;enemySW3DefinitionShield 
                    beq      nextEnemy_C 
                    inc      bonusHitCount 
                    lda      #-1 
                    sta      ALL_PURPOSE ,u               ; negative means this enemy is an explosion 
                    ldx      BEHAVIOUR,u 
REPLACE_1_2_enemySingleAttackAbsolutBehaviour_varFrom1_4  ;  bank 1 replace 
                    cmpx     #0                           ;enemySingleAttackAbsolutBehaviour 
                    beq      wasAttacker_b1_C 
REPLACE_1_2_enemySingleAttackRelativeBehaviour_varFrom1_4 ;  bank 1 replace 
                    cmpx     #0                           ;enemySingleAttackRelativeBehaviour 
                    bne      wasNotAttacker_b1_C 
wasAttacker_b1_C 
                    dec      attackPatternCount 
wasNotAttacker_b1_C 
; test if enemy is bug, if so get correct position
REPLACE_1_2_lastNormalEnemyAddress_varFrom1_22            ;  bank 1 replace 
                    cmpx     #0                           ; lastNormalEnemyAddress 
                    blo      normalEnemy_b1_C 
; bug enemy - change positions
                    lda      Y_POS16,u 
                    ldb      X_POS16,u 
                    std      Y_POS,u 
normalEnemy_b1_C 
REPLACE_1_2_fallCashBehaviour_varFrom1_2                  ;  bank 1 replace 
                    ldd      #0                           ;fallCashBehaviour 
                    std      BEHAVIOUR,u 
                    clr      ANIM_POSITION,u 
nextEnemy_C 
                    ldu      NEXT_ENEMY_OBJECT,u 
                    bra      handleEnemiesLoop_C 

allEnemiesHandled_C 
REPLACE_1_2_cashbombString_varFrom1_1                     ;  bank 1 replace 
                    ldd      #0                           ;cashbombString 
                    jmp      bonusCaughtEndSound 

BonusTimerCaught 
                    ldd      bonusTimerLength 
                    addd     #250                         ; add five seconds 
                    bpl      timeOk 
                    ldd      #$7fff                       ; maximum timer! 
timeOk 
                    std      bonusTimerLength 
REPLACE_1_2_timerString_varFrom1_31                       ;  bank 1 replace 
                    ldd      #0                           ;timerString 
                    jmp      bonusCaughtEndSound 

BonusSlowerShotCaught 
                    ldd      playerShotSpeed 
                    cmpd     #MIN_SHOT_SPEED 
                    lbls     bonusCaughtEnd_bonusComplete 
                    subd     #SPEED_DELTA 
                    std      playerShotSpeed 
                    ADJUST_SHOT_RADIUS  
; check three in a row are collected
; check fro secret
; check if last bonus was -S
                    lda      lastCollectedBonus 
                    cmpa     TYPE +u_offset1,s 
                    beq      notFirst3Bullets 
; set counter to 1
                    lda      secretBonusCounter 
                    anda     #%11111100                   ; counter to zero 
                    inca                                  ; increase one 
                    sta      secretBonusCounter 
                    bra      continueLessRateNormal 

notFirst3Bullets 
                    lda      secretBonusCounter 
                    anda     #%00000011                   ; counter to zero 
                    cmpa     #%00000010                   ; if old value was two -> than new value will be three -> success! 
                    beq      secretFirst3RateLessFound 
; just increase count by one
                    inc      secretBonusCounter 
                    bra      continueLessRateNormal 

secretFirst3RateLessFound 
                    lda      secretBonusCounter 
                    anda     #%11111100                   ; counter to zero 
                    sta      secretBonusCounter           ; reset counter 
; just store to  discovered secrets!
                    lda      inGameSecrets 
                    anda     #SECRET_3_RATE_SUCKERS 
                    bne      continueLessRateNormal 
                    lda      inGameSecrets 
                    ora      #SECRET_3_RATE_SUCKERS 
                    sta      inGameSecrets 
                    lda      shopAllowFlags 
                    ora      #SHOP_SUPER_BOMB_L 
                    sta      shopAllowFlags 
                    PLAY_SECRET_JINGLE  
REPLACE_1_2_SecretString_varFrom1_3                       ;  bank 1 replace 
                    ldd      #0                           ;SecretString 
                    jmp      bonusCaughtEnd 

continueLessRateNormal 
; check if 3 -rates are collected, if so addsuperbomb
                    lda      secretBonusCounter 
                    anda     #%00001100 
                    lsra     
                    lsra     
                    inca     
                    lsla     
                    lsla     
                    ldb      secretBonusCounter           ; delet old counter otherwise we or it with old value 
                    andb     #%11110011 
                    stb      secretBonusCounter 
                    ora      secretBonusCounter 
                    sta      secretBonusCounter 
                    anda     #%00001100 
                    cmpa     #%00001100 
                    lbne     nosm 
                    inc      smartBombsAvailable 
; reset only "3" counter for bomb add, not any other counter
; sooo... reload bonus counter
                    lda      secretBonusCounter 
                    anda     #%11110011 
                    sta      secretBonusCounter 
                    lda      inGameSecrets 
                    anda     #SECRET_RATE_SUCKERS 
                    bne      secretKnown1 
                    lda      inGameSecrets 
                    ora      #SECRET_RATE_SUCKERS 
                    sta      inGameSecrets 
                    PLAY_SECRET_JINGLE  
REPLACE_1_2_SecretString_varFrom1_1                       ;  bank 1 replace 
                    ldd      #0                           ;SecretString 
                    jmp      bonusCaughtEnd 

secretKnown1 
REPLACE_1_2_smartBombAdded_varFrom1_1                     ;  bank 1 replace 
                    ldd      #0                           ;smartBombAdded 
                    jmp      malusCaughtEnd 

BonusCashDoublerCaught 
                    ldd      playerCashW 
                    addd     playerCashW 
                    ldx      playerCashW 
                    std      playerCashW 
                    cmpx     playerCashW 
                    bls      noRollOver_1 
                    lda      diverseFlags 
                    ora      #BIT_FLAG_CASH_ROLLOVER 
                    sta      diverseFlags 
noRollOver_1 
REPLACE_1_2_cashDouble_varFrom1_1                         ;  bank 1 replace 
                    ldd      #0                           ; cashDouble 
                    jmp      bonusCaughtEndSound 

BonusLifeCaught 
                    lda      playerLives 
                    cmpa     # '9'
                    lbeq     bonusCaughtEnd_bonusComplete 
                    inca     
                    sta      playerLives                  ; not more than 9 lives! 
noExtraLife 
REPLACE_1_2_extraLifeString_varFrom1_1                    ;  bank 1 replace 
                    ldd      #0                           ; extraLifeString 
                    jmp      bonusCaughtEndSound 

BonusDrunkenCaught 
                    ADD_CASH  300 
                    lda      secretBonusCounter 
                    anda     #%00100000                   ; enable drunken master 
                    bne      secretDrunkenFound 
                    lda      #DRUNKEN_TIME 
                    sta      drunkTimer 
                    lda      lastCollectedBonus 
                    cmpa     TYPE +u_offset1,s 
                    beq      notFirstDrunkenBonus 
; set counter to 1
                    lda      secretBonusCounter 
                    anda     #%11111100                   ; counter to zero 
                    inca                                  ; increase one 
                    sta      secretBonusCounter 
                    bra      continueDrunkenNormal 

notFirstDrunkenBonus 
                    lda      secretBonusCounter 
                    anda     #%00000011                   ; counter to zero 
                    cmpa     #%00000010                   ; if old value was two -> than new value will be three -> success! 
                    beq      secretDrunkenFound 
; just increase count by one
                    inc      secretBonusCounter 
                    bra      continueDrunkenNormal 

secretDrunkenFound 
                    lda      secretBonusCounter 
                    anda     #%11111100                   ; counter to zero 
                    ora      #%00100000                   ; enable drunken master 
                    sta      secretBonusCounter           ; reset counter 
REPLACE_1_2_DrunkenMasterString_varFrom1_2                ;  bank 1 replace 
                    ldd      #0                           ;DrunkenMasterString 
                    jmp      bonusCaughtEndSound 

continueDrunkenNormal 
REPLACE_1_2_drunkenString_varFrom1_1                      ;  bank 1 replace 
                    ldd      #0                           ; drunkenString 
                    jmp      bonusCaughtEndSound 

BonusAutofireCaught 
                    lda      diverseFlags                 ; autofire is "1" 
                    ora      #1 
                    sta      diverseFlags                 ; autofire is "1" 
REPLACE_1_2_autofireString_varFrom1_1                     ;  bank 1 replace 
                    ldd      #0                           ; autofireString 
                    jmp      bonusCaughtEndSound 

BonusShotPowerupCaught 
                    inc      bulletDamageAdjust 
                    lda      bulletDamageAdjust 
                    cmpa     #MAX_BULLET_POWER_ADJUST     ; I "THINK" 15 is max - not sure though - lol 
                    blo      shotDamageOk 
                    lda      #MAX_BULLET_POWER_ADJUST 
                    sta      bulletDamageAdjust 
shotDamageOk 
;                    ADJUST_SHOT_DAMAGE
                    ldy      #REPLACE_1_2_damagePlus_varFrom1_1 
                    jmp      adjustAndJumpY 

REPLACE_1_2_damagePlus_varFrom1_1                         ;  bank 1 replace 
                    ldd      #0                           ; damagePlus Double 
                    jmp      bonusCaughtEndSound 

nosm 
REPLACE_1_2_slowerGunSpeed_varFrom1_1                     ;  bank 1 replace 
                    ldd      #0                           ;slowerGunSpeed 
                    jmp      malusCaughtEnd 

BonusMult5Caught 
                    ldd      bonusTimerLength 
                    std      multTimer 
                    lda      multiplyer 
                    anda     #NON_MULTIPLYER_BITS 
                    ora      #MULTIPLY_5_OR 
;                    lda      #5 
                    sta      multiplyer 
                    ldd      # "x5"
                    std      scoreExtraBuffer-1 
                    lda      #$80 
                    sta      scoreExtraBuffer+1 
REPLACE_1_2_multi5String_varFrom1_1                       ;  bank 1 replace 
                    ldd      #0                           ;multi5String 
                    jmp      bonusCaughtEndSound 

BonusMult2Caught 
                    ldd      bonusTimerLength 
                    std      multTimer 
;                    lda      #2 
                    lda      multiplyer 
                    anda     #NON_MULTIPLYER_BITS 
                    ora      #MULTIPLY_2_OR 
                    sta      multiplyer 
                    ldd      # "x2"
                    std      scoreExtraBuffer-1 
                    lda      #$80 
                    sta      scoreExtraBuffer+1 
REPLACE_1_2_multi2String_varFrom1_1                       ;  bank 1 replace 
                    ldd      #0                           ;multi2String 
                    jmp      bonusCaughtEndSound 

BonusShotPlusCaught 
                    lda      playerMaxShotInAir 
                    cmpa     #MAX_PLAYERSHOT_OBJECTS 
                    lbeq     bonusCaughtEnd_bonusComplete 
                    inc      playerMaxShotInAir 
REPLACE_1_2_extraBullet_varFrom1_1                        ;  bank 1 replace 
                    ldd      #0                           ;extraBullet 
                    jmp      bonusCaughtEndSound 

BonusFasterCaught 
                    ldd      playerSpeed 
                    cmpd     #MAX_PLAYER_SPEED 
                    lbhi     bonusCaughtEnd_bonusComplete 
                    addd     #SPEED_DELTA 
                    std      playerSpeed 
REPLACE_1_2_extraSpeed_varFrom1_1                         ;  bank 1 replace 
                    ldd      #0                           ;extraSpeed 
                    jmp      bonusCaughtEndSound 

BonusFasterShotCaught 
                    ldd      playerShotSpeed 
                    cmpd     #MAX_SHOT_SPEED 
                    lbhi     bonusCaughtEnd_bonusComplete 
                    addd     #SPEED_DELTA 
                    std      playerShotSpeed 
                    ADJUST_SHOT_RADIUS  
REPLACE_1_2_extraGunSpeed_varFrom1_1                      ;  bank 1 replace 
                    ldd      #0                           ;extraGunSpeed 
                    jmp      bonusCaughtEndSound 

BonusShot1Caught 
                    lda      playerMaxShotInAir 
                    cmpa     #MAX_PLAYERSHOT_OBJECTS -6   ; max up to 4 shots 
                    bhs      notShotInc1 
                    inc      playerMaxShotInAir 
notShotInc1 
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #1 
                    ble      noDowngradeCheck1 
                    lda      downgradeImmunity 
                    anda     #IMUNITY_BITS 
;                    tst      downgradeImmunity 
; if at least 1 - do not downgrade
                    bne      noDowngrade1 
noDowngradeCheck1 
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #6 
                    bne      noBigLoss 
                    lda      downgradeImmunity            ; while immune -> no biggest loss! 
                    anda     #IMUNITY_BITS 
                    bne      noBigLoss 
                    lda      inGameSecrets 
                    ora      #BIGGEST_LOSS_FLAG 
                    sta      inGameSecrets 
noBigLoss 
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #1 
                    bne      thisIsADowngrade 
                    lda      #1 
                    sta      playerNumberOfBulletsPerShot 
                    clr      playerAnim 
                    ldy      #REPLACE_1_2_extraShot1_varFrom1_1 
                    jmp      adjustAndJumpY 

;                    ADJUST_SHOT_DAMAGE  
REPLACE_1_2_extraShot1_varFrom1_1                         ;  bank 1 replace 
                    ldd      #0                           ;extraShot1 
                    jmp      bonusCaughtEndSound 

thisIsADowngrade 
                    lda      #1 
                    sta      playerNumberOfBulletsPerShot 
                    clr      playerAnim 
                    ldy      #REPLACE_1_2_extraShot1_varFrom1_2 
                    jmp      adjustAndJumpY 

;                    ADJUST_SHOT_DAMAGE  
REPLACE_1_2_extraShot1_varFrom1_2                         ;  bank 1 replace 
                    ldd      #0                           ;extraShot1 
                    jmp      downgradeCaughtEndSound 

noDowngrade1 
immunity2String 
REPLACE_1_2_immunity1String_varFrom1_1                    ;  bank 1 replace 
                    ldd      #0                           ;immunity1String 
                    INIT_MESSAGE_D  
                    jmp      bonusCaughtEnd2 

;
; -----------
;
BonusShot2Caught 
                    lda      playerMaxShotInAir 
                    cmpa     #MAX_PLAYERSHOT_OBJECTS -6   ; max up to 4 shots 
                    bhs      notShotInc2 
                    inc      playerMaxShotInAir 
notShotInc2 
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #2 
                    ble      noDowngradeCheck2 
                    lda      downgradeImmunity 
                    anda     #IMUNITY_BITS 
                    cmpa     #2 
                    bhs      noDowngrade2 
noDowngradeCheck2 
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #2 
                    bls      moDowngrade 
                    lda      #2 
                    sta      playerNumberOfBulletsPerShot 
                    clr      playerAnim 
;                    ADJUST_SHOT_DAMAGE  
                    ldy      #REPLACE_1_2_extraShot2_varFrom1_1 
                    jmp      adjustAndJumpY 

REPLACE_1_2_extraShot2_varFrom1_1                         ;  bank 3 replace 
                    ldd      #0                           ;extraShot2 
                    jmp      downgradeCaughtEndSound 

moDowngrade 
                    lda      #2 
                    sta      playerNumberOfBulletsPerShot 
                    clr      playerAnim 
                    ldy      #REPLACE_1_2_extraShot2_varFrom1_2 ; extraShot2 
                    jmp      adjustAndJumpY 

;                    ADJUST_SHOT_DAMAGE  
REPLACE_1_2_extraShot2_varFrom1_2                         ;  bank 3 replace 
                    ldd      #0                           ;extraShot2 
                    jmp      bonusCaughtEndSound 

noDowngrade2 
REPLACE_1_2_immunity2String_varFrom1_1                    ;  bank 3 replace 
                    ldd      #0                           ;immunity2String 
                    INIT_MESSAGE_D  
                    jmp      bonusCaughtEnd2 

BonusMinestormCaught 
                    ldb      isDemoMode 
                    bne      BonusShot3Caught 
REPLACE_1_2_MineDisplayString_varFrom1_1                  ;  bank 3 replace 
                    ldd      #0                           ;MineDisplayString 
                    INIT_MESSAGE_D  
REPLACE_1_2_startDodger1_varFrom1_1                       ;  bank 3 replace 
                    ldx      #0                           ; startDodger1 
                    jmp      jmpBank1X 

BonusShot3Caught 
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #3 
                    lbeq     BonusShotPlusCaught 
                    bls      noDowngrade_3 
; this is a downgrade
                    lda      #3 
                    sta      playerNumberOfBulletsPerShot 
                    clr      playerAnim 
;                    ADJUST_SHOT_DAMAGE  
                    ldy      #REPLACE_1_2_extraShot3_varFrom1_1 
                    jmp      adjustAndJumpY 

REPLACE_1_2_extraShot3_varFrom1_1                         ;  bank 3 replace 
                    ldd      #0                           ;extraShot3 
                    jmp      downgradeCaughtEndSound 

noDowngrade_3 
                    lda      #3 
                    sta      playerNumberOfBulletsPerShot 
                    clr      playerAnim 
                    ldy      #REPLACE_1_2_extraShot3_varFrom1_2 ; extraShot3 
                    jmp      adjustAndJumpY 

;                    ADJUST_SHOT_DAMAGE  
REPLACE_1_2_extraShot3_varFrom1_2                         ;  bank 3 replace 
                    ldd      #0                           ;extraShot3 
                    jmp      bonusCaughtEndSound 

BonusShot4Caught 
;                    lda      playerNumberOfBulletsPerShot 
;                    cmpa     #4 
;                    lbhs     BonusShotPlusCaught 
;                    lda      playerMaxShotInAir 
;                    cmpa     #6 
;                    bls      do1_4 
;                    dec      playerMaxShotInAir 
;                    dec      playerMaxShotInAir 
;                    dec      playerMaxShotInAir 
;                    dec      playerMaxShotInAir 
;do1_4 
;                    lda      #4 
;                    sta      playerNumberOfBulletsPerShot 
;                    ADJUST_SHOT_DAMAGE  
;REPLACE_1_2_extraShot4_varFrom1_1                         ;  bank 1 replace 
;                    ldd      #0                           ;extraShot4 
;                    jmp      bonusCaughtEnd 
BonusArmorCaught 
                    ldb      isDemoMode 
                    bne      BonusShieldCaught 
                    clr      playerAnim                   ; reset animation counter to 0 
                    lda      #BITFIELD_ARMOR 
                    sta      playerBonusActive 
REPLACE_1_2_extraArmor_varFrom1_1                         ;  bank 1 replace 
                    ldd      #0                           ;extraArmor 
                    jmp      bonusCaughtEndSound 

BonusShieldCaught 
                    clr      playerAnim                   ; reset animation counter to 0 
                    lda      #BITFIELD_SHIELD 
                    sta      playerBonusActive 
                    ldd      bonusTimerLength             ;#1000 ; 50 = 1s 
                    std      playerBonusCounter 
REPLACE_1_2_extraShield_varFrom1_1                        ;  bank 1 replace 
                    ldd      #0                           ;extraShield 
                    jmp      bonusCaughtEndSound 

BonusSwoopCaught 
                    ldb      isDemoMode 
                    bne      BonusShieldCaught 
                    clr      playerAnim                   ; reset animation counter to 0 
                    lda      #BITFIELD_SCOOP 
                    sta      playerBonusActive 
                    ldd      bonusTimerLength             ; #1000 ; 50 = 1s 
                    std      playerBonusCounter 
; check if last bonus was scoop
                    lda      lastCollectedBonus 
                    cmpa     TYPE +u_offset1,s 
                    beq      notFirstScoopBonus 
; set counter to 1
                    lda      secretBonusCounter 
                    anda     #%11111100                   ; counter to zero 
                    inca                                  ; increase one 
                    sta      secretBonusCounter 
                    bra      continueScoopNormal 

notFirstScoopBonus 
                    lda      secretBonusCounter 
                    anda     #%00000011                   ; counter to zero 
                    cmpa     #%00000010                   ; if old value was two -> than new value will be three -> success! 
                    beq      secretScoopFound 
; just increase count by one
                    inc      secretBonusCounter 
                    bra      continueScoopNormal 

secretScoopFound 
                    lda      secretBonusCounter 
                    anda     #%11111100                   ; counter to zero 
                    sta      secretBonusCounter           ; reset counter 
                    lda      lockPurchased 
                    anda     #%00010000 
                    bne      continueScoopNormal 
                    lda      lockPurchased 
                    ora      #%00010000 
                    sta      lockPurchased                ; shield for scoopies! (once) 
                    PLAY_SECRET_JINGLE  
REPLACE_1_2_SecretString_varFrom1_75                      ;  bank 1 replace 
                    ldd      #0                           ;SecretString 
                    jmp      bonusCaughtEnd 

continueScoopNormal 
REPLACE_1_2_extraScoop_varFrom1_1                         ;  bank 1 replace 
                    ldd      #0                           ;extraScoop 
                    jmp      bonusCaughtEndSound 

BonusSlowerCaught 
                    ldd      playerSpeed 
                    cmpd     #MIN_PLAYER_SPEED 
                    lble     bonusCaughtEnd2 
                    subd     #SPEED_DELTA 
                    std      playerSpeed 
; check if last bonus was -S
                    lda      lastCollectedBonus 
                    cmpa     TYPE +u_offset1,s 
                    beq      notFirstSlowerBonus 
; set counter to 1
                    lda      secretBonusCounter 
                    anda     #%11111100                   ; counter to zero 
                    inca                                  ; increase one 
                    sta      secretBonusCounter 
                    bra      continueSlowerNormal 

notFirstSlowerBonus 
                    lda      secretBonusCounter 
                    anda     #%00000011                   ; counter to zero 
                    cmpa     #%00000010                   ; if old value was two -> than new value will be three -> success! 
                    beq      secretslowerFound 
; just increase count by one
                    inc      secretBonusCounter 
                    bra      continueSlowerNormal 

secretslowerFound 
                    lda      secretBonusCounter 
                    anda     #%11111100                   ; counter to zero 
                    sta      secretBonusCounter           ; reset counter 
                    lda      lockPurchased 
                    ora      #%00100000 
                    sta      lockPurchased                ; shield for scoopies! (once) 
                    lda      inGameSecrets 
                    anda     #SECRET_3_SPEED_SUCKERS 
                    bne      continueSlowerNormal 
                    lda      inGameSecrets 
                    ora      #SECRET_3_SPEED_SUCKERS 
                    sta      inGameSecrets 
                    PLAY_SECRET_JINGLE  
REPLACE_1_2_SecretString_varFrom1_2                       ;  bank 1 replace 
                    ldd      #0                           ;SecretString 
                    jmp      bonusCaughtEnd 

secretKnown2 
continueSlowerNormal 
REPLACE_1_2_extraSlow_varFrom1_1                          ;  bank 1 replace 
                    ldd      #0                           ;extraSlow 
                    jmp      malusCaughtEnd 

BonusShotMinusCaught 
                    dec      playerMaxShotInAir 
                    bne      shotCountOk 
                    inc      playerMaxShotInAir 
shotCountOk 
; check fro secret
; check if last bonus was -S
                    lda      lastCollectedBonus 
                    cmpa     TYPE +u_offset1,s 
                    beq      notFirstLessBullets 
; set counter to 1
                    lda      secretBonusCounter 
                    anda     #%11111100                   ; counter to zero 
                    inca                                  ; increase one 
                    sta      secretBonusCounter 
                    bra      continueLessBulletsNormal 

notFirstLessBullets 
                    lda      secretBonusCounter 
                    anda     #%00000011                   ; counter to zero 
                    cmpa     #%00000010                   ; if old value was two -> than new value will be three -> success! 
                    beq      secretFirstLessBulletsFound 
; just increase count by one
                    inc      secretBonusCounter 
                    bra      continueLessBulletsNormal 

secretFirstLessBulletsFound 
                    lda      secretBonusCounter 
                    anda     #%11111100                   ; counter to zero 
                    sta      secretBonusCounter           ; reset counter 
; just store to  discovered secrets!
                    lda      inGameSecrets 
                    anda     #SECRET_3_BULLET_SUCKERS 
                    bne      continueLessBulletsNormal 
                    lda      inGameSecrets 
                    ora      #SECRET_3_BULLET_SUCKERS 
                    sta      inGameSecrets 
                    PLAY_SECRET_JINGLE  
REPLACE_1_2_SecretString_varFrom1_4                       ;  bank 1 replace 
                    ldd      #0                           ;SecretString 
                    jmp      bonusCaughtEnd 

continueLessBulletsNormal 
REPLACE_1_2_extraBulletMiss_varFrom1_1                    ;  bank 1 replace 
                    ldd      #0                           ;extraBulletMiss 
                    jmp      malusCaughtEnd 

BonusMoney200Caught 
                    ADD_CASH  200 
REPLACE_1_2_cash200_varFrom1_1                            ;  bank 1 replace 
                    ldd      #0                           ;cash200 
                    jmp      moneyCaughtEnd 

BonusMoney5Caught 
                    ADD_CASH  5 
REPLACE_1_2_cash5_varFrom1_1                              ;  bank 1 replace 
                    ldd      #0                           ;cash5 
                    jmp      moneyCaughtEnd 

BonusMoney20Caught 
                    ADD_CASH  20 
REPLACE_1_2_cash20_varFrom1_1                             ;  bank 1 replace 
                    ldd      #0                           ;cash20 
                    jmp      moneyCaughtEnd 

BonusMoney50Caught 
                    ADD_CASH  50 
; check fro secret
; check if last bonus was -S
                    lda      lastCollectedBonus 
                    cmpa     TYPE +u_offset1,s 
                    beq      notFirst50Cash 
; set counter to 1
                    lda      secretBonusCounter 
                    anda     #%11111100                   ; counter to zero 
                    inca                                  ; increase one 
                    sta      secretBonusCounter 
                    bra      continue50Normal 

notFirst50Cash 
                    lda      secretBonusCounter 
                    anda     #%00000011                   ; counter to zero 
                    cmpa     #%00000010                   ; if old value was two -> than new value will be three -> success! 
                    beq      secretFirst50CashFound 
; just increase count by one
                    inc      secretBonusCounter 
                    bra      continue50Normal 

secretFirst50CashFound 
                    lda      secretBonusCounter 
                    anda     #%11111100                   ; counter to zero 
                    sta      secretBonusCounter           ; reset counter 
; just store to  discovered secrets!
                    lda      inGameSecrets 
                    anda     #SECRET_3_FIFTY 
                    bne      continue50Normal 
                    lda      inGameSecrets 
                    ora      #SECRET_3_FIFTY 
                    sta      inGameSecrets 
                    PLAY_SECRET_JINGLE  
REPLACE_1_2_SecretString_varFrom1_6                       ;  bank 1 replace 
                    ldd      #0                           ;SecretString 
                    jmp      bonusCaughtEnd 

continue50Normal 
REPLACE_1_2_cash50_varFrom1_1                             ;  bank 1 replace 
                    ldd      #0                           ;cash50 
                    jmp      moneyCaughtEnd 

BonusECaught 
                    lda      bonusCollect 
                    anda     #1 
                    lbne     removeBonus_double_letter    ; nothing done - bonus alread caught 
; here check correct order of EXTRA
                    lda      bonusCollect 
                    bne      destroyExtraOrderE 
                    lda      secretBonusCounter 
                    ora      #$80 
                    sta      secretBonusCounter 
                    bra      contExtraE 

destroyExtraOrderE 
                    lda      secretBonusCounter 
                    anda     #$ff-$80 
                    sta      secretBonusCounter 
contExtraE 
                    lda      bonusCollect 
                    ora      #1 
                    bra      checkExtraAndGoHome 

BonusXCaught 
                    lda      bonusCollect 
                    anda     #2 
                    lbne     removeBonus_double_letter    ; nothing done - bonus alread caught 
; here check correct order of EXTRA
                    lda      bonusCollect 
                    cmpa     #1 
                    beq      contExtraX 
                    lda      secretBonusCounter 
                    anda     #$ff-$80 
                    sta      secretBonusCounter 
contExtraX 
                    lda      bonusCollect 
                    ora      #2 
                    bra      checkExtraAndGoHome 

BonusTCaught 
                    lda      bonusCollect 
                    anda     #4 
                    lbne     removeBonus_double_letter    ; nothing done - bonus alread caught 
; here check correct order of EXTRA
                    lda      bonusCollect 
                    cmpa     #1+2 
                    beq      contExtraT 
                    lda      secretBonusCounter 
                    anda     #$ff-$80 
                    sta      secretBonusCounter 
contExtraT 
                    lda      bonusCollect 
                    ora      #4 
                    bra      checkExtraAndGoHome 

BonusRCaught 
                    lda      bonusCollect 
                    anda     #8 
                    lbne     removeBonus_double_letter    ; nothing done - bonus alread caught 
; here check correct order of EXTRA
                    lda      bonusCollect 
                    cmpa     #1+2+4 
                    beq      contExtraR 
                    lda      secretBonusCounter 
                    anda     #$ff-$80 
                    sta      secretBonusCounter 
contExtraR 
                    lda      bonusCollect 
                    ora      #8 
                    bra      checkExtraAndGoHome 

BonusACaught 
                    lda      bonusCollect 
                    anda     #16 
                    lbne     removeBonus_double_letter    ; nothing done - bonus alread caught 
; here check correct order of EXTRA
                    lda      bonusCollect 
                    cmpa     #1+2+4+8 
                    beq      contExtraA 
                    lda      secretBonusCounter 
                    anda     #$ff-$80 
                    sta      secretBonusCounter 
contExtraA 
                    lda      bonusCollect 
                    ora      #16 
;                    bra      checkExtraAndGoHome 
checkExtraAndGoHome 
                    sta      bonusCollect 
                    CHECK_EXTRA_COMPLETED  
goHomeInit 
                    ldd      #goHomeBonusBehaviour 
                    std      BEHAVIOUR +u_offset1,s 
                    jmp      displayContinueBonus 

downgradeCaughtEndSound 
REPLACE_1_2_downgradeData_varFromIRQ1_2 
                    ldx      #0                           ; downgradeData 
                    INIT_MESSAGE_D  
                    lda      playSoundFlags 
                    anda     #%00111111 
                    ora      #BIT_FLAG_PLAY_FORCE_SFX 
                    sta      playSoundFlags 
                    stx      sfx_pointer_1 
                    stx      sfx_pointer_2 
                    stx      sfx_pointer_3 
bonusCaughtEnd22 
                    lda      TYPE +u_offset1,s 
                    sta      lastCollectedBonus 
                    bra      removeBonus 

malusCaughtEnd 
REPLACE_1_2_malusData_varFromIRQ1_2 
                    ldx      #0                           ; malusData 
                    bra      bonusCaughtEnd 

moneyCaughtEnd 
REPLACE_1_2_moneyData_varFromIRQ1_2 
                    ldx      #0                           ; moneyData 
                    bra      bonusCaughtEnd 

bonusCaughtEndSound 
REPLACE_1_2_bonusData_varFromIRQ1_2 
                    ldx      #0                           ; bonusData 
bonusCaughtEnd 
                    INIT_MESSAGE_D  
; remember last bonus!
                    lda      playSoundFlags 
                    anda     #%11000000 
                    bne      bonusCaughtEnd2 
                    stx      sfx_pointer_1 
bonusCaughtEnd2 
                    lda      TYPE +u_offset1,s 
                    sta      lastCollectedBonus 
                    bra      removeBonus 

bonusCaughtEnd_bonusComplete 
                    ADD_POINTS_BONUS_COMPLETE  
                    bra      removeBonus 

removeBonus_double_letter 
                    lda      secretBonusCounter           ; destroy secetr counter - double letters do not count! 
                    anda     #$ff-$80 
                    sta      secretBonusCounter 
                    ADD_POINTS_DOUBLE_LETTER  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
removeBonus                                               ;#isfunction  
                    leax     u_offset1,s 
                    lds      NEXT_BONUS_OBJECT+u_offset1,s ; preload next user stack 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
UPDATE_EMPTY_BONUS  macro    
                    dec      bonusCount 
                    ldy      bonuslist_empty_head         ; set u free, as new free head 
                    sty      NEXT_BONUS_OBJECT,x          ; load to u the next linked list element 
                    stx      bonuslist_empty_head 
                    endm     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; we must keep DS intackt in this remove -> use y register instead
                    cmpx     bonuslist_objects_head       ; is it the first? 
                    bne      was_not_first_bonus          ; no -> jump 
was_first_bonus 
                    ldy      NEXT_BONUS_OBJECT,x          ; y pointer to next objext 
                    sty      bonuslist_objects_head       ; the next object will be the first 
                    bra      exitRemoveBonus 

was_not_first_bonus                                       ;       find previous, go thru all objects from first and look where "I" am the next... 
                    ldy      bonuslist_objects_head       ; start at list head 
try_next_bonus 
                    cmpx     NEXT_BONUS_OBJECT,y          ; am I the next object of the current investigated list element 
                    beq      found_next_switch_bonus      ; jup -> jump 
                    ldy      NEXT_BONUS_OBJECT,y          ; otherwise load the next as new current 
                    bra      try_next_bonus               ; and search further 

found_next_switch_bonus 
                    ldd      NEXT_BONUS_OBJECT,x          ; we load "our" next object to d 
                    std      NEXT_BONUS_OBJECT,y          ; and store our next in the place of our previous next and thus eleminate ourselfs 
exitRemoveBonus 
                    UPDATE_EMPTY_BONUS                    ; and clean up the empties 
bonusHandleDoneRemoved 
; cleanup afterwards
                    ldb      gameScale 
                    LDA      #$CC 
                    STA      VIA_cntl                     ;/BLANK low and /ZERO low 
                    stB      VIA_t1_cnt_lo 
                    MY_MOVE_TO_A_END  
                    ldd      #0 
                    std      <VIA_port_b 
                    puls     d,pc                         ; (D = y,x, pc = next object) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
goHomeBonusBehaviour                                      ;#isfunction  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                    MY_MOVE_TO_D_START  
                    ldb      #OBJECT_SCALE 
                    stb      VIA_t1_cnt_lo 
                    lda      TYPE+u_offset1,s 
; todo
; check if my type is still collected
; if not remove myself
; while moving up, the other part of extra is
; collected -> than I should disappear since the complete
; extra should disappear
                    ldx      #BonusList 
                    ldx      a,x                          ; in x pointer to current bonus struct 
                    ldx      ,x                           ; pointer to animation list of bonus 
                    tst      animDelayCounter 
                    bpl      noAnimChange_ghb 
                    inc      BONUS_ANIM_POSITION+u_offset1,s 
; check if end of animation (for now always 19 - but that might change -> 0 terminated dw list)
                    lda      BONUS_ANIM_POSITION+u_offset1,s 
                    asla     
                    ldu      a,x                          ; current active animation 
                    bne      displayBonus_ghb 
                    clr      BONUS_ANIM_POSITION+u_offset1,s 
noAnimChange_ghb 
                    lda      BONUS_ANIM_POSITION+u_offset1,s 
                    asla     
                    ldu      a,x                          ; current active animation (no need to load 0 
displayBonus_ghb 
                    lda      TYPE+u_offset1,s 
                    ldx      #BonusHomeCoordinates 
                    ldd      a,x                          ; in d the target coordinates of this bonus 
; check y first
                    cmpa     Y_POS+u_offset1,s 
                    blt      yIsCorrect 
                    inc      Y_POS+u_offset1,s 
                    inc      Y_POS+u_offset1,s 
                    bra      continueTestXBonus 

yIsCorrect 
                    sta      Y_POS+u_offset1,s            ; make exact 
continueTestXBonus 
                    cmpb     X_POS+u_offset1,s 
                    blt      mustReduceCoordinate 
mustIncreaseCoordinate 
                    inc      X_POS+u_offset1,s 
                    inc      X_POS+u_offset1,s 
                    bra      XcoordChangeDone 

mustReduceCoordinate 
                    dec      X_POS+u_offset1,s 
                    dec      X_POS+u_offset1,s 
XcoordChangeDone 
                    subb     X_POS+u_offset1,s 
                    bpl      difIsPositive 
                    negb     
                    cmpb     #$80                         ; neg $80 = $80 
                    bne      difIsPositive 
                    ldb      #$127 
difIsPositive 
                    cmpb     #3                           ; near the target? 
                    bgt      XNotReachedYet 
                    lda      TYPE+u_offset1,s 
                    ldd      a,x                          ; in d the target coordinates of this bonus 
                    stb      X_POS+u_offset1,s            ; make exact 
XNotReachedYet 
                    lda      TYPE+u_offset1,s 
                    ldd      a,x                          ; in d the target coordinates of this bonus 
                    cmpd     Y_POS+u_offset1,s 
                    beq      targetreached 
displayContinueBonus2 
                    lds      NEXT_SHOT_OBJECT+u_offset1,s ; preload next user stack 
                    MY_MOVE_TO_A_END  
                    clra     
                    pulu     b,x,pc 
targetreached 
                    ldb      #1 
                    lda      TYPE +u_offset1,s 
                    beq      doneBonusReached 
                    lslb     
                    cmpa     #BONUS_X 
                    beq      doneBonusReached 
                    lslb     
                    cmpa     #BONUS_T 
                    beq      doneBonusReached 
                    lslb     
                    cmpa     #BONUS_R 
                    beq      doneBonusReached 
                    lslb     
doneBonusReached 
                    orb      bonusDisplay 
                    stb      bonusDisplay 
                    jmp      removeBonus 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bonusSuckedBehaviour                                      ;#isfunction  
                    MY_MOVE_TO_D_START  
;;;;;;
; colision detection bonus -> sucker
; in b is still x position, so start with that
; xTest
                    ldy      suckerAddress 
                    bne      doNotConvertToFalling 
                    ldy      #fallingBonusBehaviour 
                    sty      BEHAVIOUR +u_offset1,s 
                    lda      inGameSecrets 
                    anda     #SECRET_3_FIFTY 
                    beq      simpleDeath 
                    ldb      #BONUS_MONEY_200 
                    stb      TYPE+u_offset1,s 
simpleDeath 
                    jmp      continnueWithFallin 

doNotConvertToFalling 
                    subb     X_POS,y                      ; xpos of sucker 
                    bpl      testPositive_xBonus_up 
                    negb     
testPositive_xBonus_up 
                    cmpb     #30                          ;BONUS_PLAYER_X_RANGE ; sucker x range 
                    bhi      notHit_bonus_up 
; yTest
                    ldb      Y_POS +u_offset1,s 
                    cmpb     Y_POS,y                      ; xpos of sucker 
                    lbgt     removeBonus                  ;suckerCaughtBonus 
;                    lbeq     removeBonus 
notHit_bonus_up 
                    ldb      #OBJECT_SCALE 
                    stb      VIA_t1_cnt_lo 
                    ldb      Y_POS +u_offset1,s 
                    cmpb     Y_POS,y                      ; xpos of sucker 
                    bgt      noyaddBo                     ;suckerCaughtBonus 
                    inc      Y_POS+u_offset1,s            ; preload next user stack 
noyaddBo 
                    lda      X_POS +u_offset1,s 
                    suba     X_POS,y 
                    bpl      noCh 
                    nega     
noCh 
                    cmpa     #5                           ; otherwise money "wobbles" beneath sucker 
                    blt      moveDoneHere 
                    lda      X_POS +u_offset1,s 
                    cmpa     X_POS,y 
                    blt      doAddX 
                    dec      X_POS+u_offset1,s            ; preload next user stack 
                    dec      X_POS+u_offset1,s            ; preload next user stack 
                    dec      X_POS+u_offset1,s            ; preload next user stack 
                    bra      moveDoneHere 

doAddX 
                    inc      X_POS+u_offset1,s            ; preload next user stack 
                    inc      X_POS+u_offset1,s            ; preload next user stack 
                    inc      X_POS+u_offset1,s            ; preload next user stack 
moveDoneHere 
                    lda      TYPE+u_offset1,s 
                    ldx      #BonusList 
                    ldx      a,x                          ; in x pointer to current bonus struct 
                    ldx      ,x                           ; pointer to animation list of bonus 
                    tst      animDelayCounter 
                    bpl      noAnimChange_up 
                    inc      BONUS_ANIM_POSITION+u_offset1,s 
; check if end of animation (for now always 19 - but that might change -> 0 terminated dw list)
                    lda      BONUS_ANIM_POSITION+u_offset1,s 
                    asla     
                    ldu      a,x                          ; current active animation 
                    bne      displayBonus_up 
                    clr      BONUS_ANIM_POSITION+u_offset1,s 
noAnimChange_up 
                    lda      BONUS_ANIM_POSITION+u_offset1,s 
                    asla     
                    ldu      a,x                          ; current active animation (no need to load 0 
displayBonus_up 
                    lds      NEXT_SHOT_OBJECT+u_offset1,s ; preload next user stack 
                    MY_MOVE_TO_A_END  
                    clra     
                    pulu     b,x,pc 
adjustAndJumpY 
                    ADJUST_SHOT_DAMAGE  
                    jmp      ,y 

 endif  
