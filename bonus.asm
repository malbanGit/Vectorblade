; bank 2
 if  CURRENT_BANK = 2 
                    include  "bonus/bonusOuter3d.asm"
                    include  "bonus/bonusRectangle.asm"
                    include  "bonus/bonusCircle.asm"
                    include  "bonus/bonusTriangle.asm"
                    include  "bonus/bonusAdditional.asm"
                    include  "bonus/bonusExtra.asm"
                    include  "bonus/bonusMoney.asm"
                    include  "bonus/bonusFaster.asm"
                    include  "bonus/bonusFasterShot.asm"
                    include  "bonus/bonusShotplus.asm"
                    include  "bonus/bonusScoop.asm"
                    include  "bonus/bonusShield.asm"
                    include  "bonus/bonusArmor.asm"
                    include  "bonus/bonusShots.asm"
                    include  "bonus/bonusMinestorm.asm"
                    include  "bonus/bonusMultiply.asm"
                    include  "bonus/bonusBombs.asm"
                    include  "bonus/bonusTimer.asm"
                    include  "bonus/bonusRankmarker.asm"
                    include  "bonus/bonusCashDoubler.asm"
                    include  "bonus/bonusShotPowerup.asm"
                    include  "bonus/bonusDrunken.asm"
                    include  "bonus/bonusAutofire.asm"
; accessed by type
BonusHomeCoordinates                                      ;      E X T R A 
                    db       $70, $90 
                    db       $60, $90 
                    db       $50, $90 
                    db       $40, $90 
                    db       $30, $90 
;                    db       $7d, $90 
;                    db       $7d, $90+20 
;                    db       $7d, $90+20+20 
;                    db       $7d, $90+20+20+20 
;                    db       $7d, $90+20+20+20+20 
                    dw       Money_200 
BonusList 
                    dw       BonusE                       ; Type 0 
                    dw       BonusX                       ; Type 2 
                    dw       BonusT                       ; Type 4 
                    dw       BonusR                       ; Type 6 
                    dw       BonusA                       ; Type 8 
                    dw       BonusShotsplus 
                    dw       BonusFaster 
                    dw       BonusFasterShot 
                    dw       MalusSlower 
                    dw       MalusShot 
                    dw       Money_5 
                    dw       Money_20 
                    dw       Money_50 
                    dw       BonusArmor 
                    dw       BonusShield 
                    dw       BonusScoop 
                    dw       BonusShot1 
                    dw       BonusShot2 
                    dw       BonusShot3 
                    dw       BonusShot4 
                    dw       BonusMinestorm 
                    dw       BonusMult2 
                    dw       BonusMult5 
                    dw       BonusBombCash 
                    dw       BonusBombDiamond 
                    dw       BonusTimer 
                    dw       BonusSlowerShot 
                    dw       BonusCashDoubler 
                    dw       BonusShotPowerup 
                    dw       BonusLife 
                    dw       BonusDrunken 
                    dw       BonusAutofire 
                    dw       0 
;
;
;
; Random ranges (chance of X in 255)
BONUS_E_RANGE       =        5 
BONUS_X_RANGE       =        5 
BONUS_T_RANGE       =        5 
BONUS_R_RANGE       =        5 
BONUS_A_RANGE       =        5 
BONUS_SLOWER_RANGE  =        10 
BONUS_SHOTMINUS_RANGE  =     10 
BONUS_SHOTPLUS_RANGE  =      10 
BONUS_FASTER_SHOT_RANGE  =   4 
BONUS_FASTER_RANGE  =        10 
BONUS_ARMOR_RANGE   =        3 
BONUS_SHIELD_RANGE  =        3 
BONUS_SCOOP_RANGE   =        8 
BONUS_SHOT1_RANGE   =        15 
BONUS_SHOT2_RANGE   =        16 
BONUS_SHOT3_RANGE   =        4 
BONUS_MINESTORM_RANGE  =     2 
BONUS_MULT2_RANGE   =        8 
BONUS_MULT5_RANGE   =        2 
BONUS_BOMB_CASH_RANGE  =     2 
BONUS_BOMB_DIAMOND_RANGE  =  2 
BONUS_TIMER_RANGE   =        2 
BONUS_SLOWER_SHOT_RANGE  =   10 
BONUS_MONEY_20_RANGE  =      30 
BONUS_MONEY_50_RANGE  =      5 
BONUS_CASH_DOUBLER_RANGE  =  1 
BONUS_SHOT_POWERUP_RANGE  =  1                            ; 0.5 in reality 
BONUS_LIFE_RANGE    =        1 
BONUS_DRUNKEN_RANGE  =       2 
BONUS_AUTOFIRE_RANGE  =      1 
;->BONUS_MONEY_5_RANGE  =      71 
; BONUS_MONEY_5_RANGE = REST
BONUS_COMPARE_BASE  =        0 
BONUS_E_COMPARE     =        BONUS_COMPARE_BASE + BONUS_E_RANGE 
BONUS_X_COMPARE     =        BONUS_E_COMPARE + BONUS_X_RANGE 
BONUS_T_COMPARE     =        BONUS_X_COMPARE + BONUS_T_RANGE 
BONUS_R_COMPARE     =        BONUS_T_COMPARE + BONUS_R_RANGE 
BONUS_A_COMPARE     =        BONUS_R_COMPARE + BONUS_A_RANGE 
BONUS_SLOWER_COMPARE  =      BONUS_A_COMPARE + BONUS_SLOWER_RANGE 
BONUS_SHOTMINUS_COMPARE  =   BONUS_SLOWER_COMPARE + BONUS_SHOTMINUS_RANGE 
BONUS_SHOTPLUS_COMPARE  =    BONUS_SHOTMINUS_COMPARE + BONUS_SHOTPLUS_RANGE 
BONUS_FASTER_SHOT_COMPARE  =  BONUS_SHOTPLUS_COMPARE + BONUS_FASTER_SHOT_RANGE 
BONUS_FASTER_COMPARE  =      BONUS_FASTER_SHOT_COMPARE + BONUS_FASTER_RANGE 
BONUS_ARMOR_COMPARE  =       BONUS_FASTER_COMPARE + BONUS_ARMOR_RANGE 
BONUS_SHIELD_COMPARE  =      BONUS_ARMOR_COMPARE + BONUS_SHIELD_RANGE 
BONUS_SCOOP_COMPARE  =       BONUS_SHIELD_COMPARE + BONUS_SCOOP_RANGE 
BONUS_SHOT1_COMPARE  =       BONUS_SCOOP_COMPARE + BONUS_SHOT1_RANGE 
BONUS_SHOT2_COMPARE  =       BONUS_SHOT1_COMPARE + BONUS_SHOT2_RANGE 
BONUS_SHOT3_COMPARE  =       BONUS_SHOT2_COMPARE + BONUS_SHOT3_RANGE 
BONUS_MINESTORM_COMPARE  =   BONUS_SHOT3_COMPARE + BONUS_MINESTORM_RANGE 
BONUS_MULT2_COMPARE  =       BONUS_MINESTORM_COMPARE + BONUS_MULT2_RANGE 
BONUS_MULT5_COMPARE  =       BONUS_MULT2_COMPARE + BONUS_MULT5_RANGE 
BONUS_BOMB_CASH_COMPARE  =   BONUS_MULT5_COMPARE + BONUS_BOMB_CASH_RANGE 
BONUS_BOMB_DIAMOND_COMPARE  =  BONUS_BOMB_CASH_COMPARE + BONUS_BOMB_DIAMOND_RANGE 
BONUS_TIMER_COMPARE  =       BONUS_BOMB_DIAMOND_COMPARE + BONUS_TIMER_RANGE 
BONUS_SLOWER_SHOT_COMPARE  =  BONUS_TIMER_COMPARE + BONUS_SLOWER_SHOT_RANGE 
BONUS_MONEY_20_COMPARE  =    BONUS_SLOWER_SHOT_COMPARE + BONUS_MONEY_20_RANGE 
BONUS_MONEY_50_COMPARE  =    BONUS_MONEY_20_COMPARE + BONUS_MONEY_50_RANGE 
BONUS_CASH_DOUBLER_COMPARE  =  BONUS_MONEY_50_COMPARE + BONUS_CASH_DOUBLER_RANGE 
BONUS_SHOT_POWERUP_COMPARE  =  BONUS_CASH_DOUBLER_COMPARE + BONUS_SHOT_POWERUP_RANGE 
BONUS_LIFE_COMPARE  =        BONUS_SHOT_POWERUP_COMPARE + BONUS_LIFE_RANGE 
BONUS_DRUNKEN_COMPARE  =     BONUS_LIFE_COMPARE + BONUS_DRUNKEN_RANGE 
BONUS_AUTOFIRE_COMPARE  =    BONUS_DRUNKEN_COMPARE + BONUS_AUTOFIRE_RANGE 
;
;
;
; bonus pointer in X
initBonus                                                 ;#isfunction  
                    RANDOM_A2  
 if  TESTING = 1 
; bmi noChange
; lda #BONUS_MINESTORM_COMPARE
; bra noChange_2
noChange 
; lda #BONUS_DRUNKEN_COMPARE
;noChange_2
 endif  
;
                    cmpa     #BONUS_E_COMPARE 
                    bhi      nextB1 
                    ldb      #BONUS_E 
                    jmp      BonusDecided 

nextB1 
                    cmpa     #BONUS_X_COMPARE 
                    bhi      nextB2 
                    ldb      #BONUS_X 
                    jmp      BonusDecided 

nextB2 
                    cmpa     #BONUS_T_COMPARE 
                    bhi      nextB3 
                    ldb      #BONUS_T 
                    jmp      BonusDecided 

nextB3 
                    cmpa     #BONUS_R_COMPARE 
                    bhi      nextB4 
                    ldb      #BONUS_R 
                    jmp      BonusDecided 

nextB4 
                    cmpa     #BONUS_A_COMPARE 
                    bhi      nextB5 
                    ldb      #BONUS_A 
                    jmp      BonusDecided 

nextB5 
                    cmpa     #BONUS_SLOWER_COMPARE 
                    bhi      nextB6 
                    ldb      #BONUS_SLOWER 
                    jmp      BonusDecided 

nextB6 
                    cmpa     #BONUS_SHOTMINUS_COMPARE 
                    bhi      nextB7a 
                    ldb      #BONUS_SHOTMINUS 
                    jmp      BonusDecided 

nextB7a 
                    cmpa     #BONUS_SHOTPLUS_COMPARE 
                    bhi      nextB7 
                    ldb      #BONUS_SHOTPLUS 
                    jmp      BonusDecided 

nextB7 
                    cmpa     #BONUS_FASTER_SHOT_COMPARE 
                    bhi      nextB8a 
                    ldb      #BONUS_FASTER_SHOT 
                    jmp      BonusDecided 

nextB8a 
                    cmpa     #BONUS_FASTER_COMPARE 
                    bhi      nextBA 
                    ldb      #BONUS_FASTER 
                    jmp      BonusDecided 

nextBA 
                    cmpa     #BONUS_ARMOR_COMPARE 
                    bhi      nextBB 
                    ldb      #BONUS_ARMOR 
                    jmp      BonusDecided 

nextBB 
                    cmpa     #BONUS_SHIELD_COMPARE 
                    bhi      nextBC 
                    ldb      #BONUS_SHIELD 
                    jmp      BonusDecided 

nextBC 
                    cmpa     #BONUS_SCOOP_COMPARE 
                    bhi      nextBD 
                    ldb      #BONUS_SCOOP 
                    jmp      BonusDecided 

nextBD 
                    cmpa     #BONUS_SHOT1_COMPARE 
                    bhi      nextBE 
                    ldb      #BONUS_SHOT1 
                    jmp      BonusDecided 

nextBE 
                    cmpa     #BONUS_SHOT2_COMPARE 
                    bhi      nextBE2 
shot2AfterAll 
                    ldb      #BONUS_SHOT2 
                    jmp      BonusDecided 

nextBE2 
                    cmpa     #BONUS_SHOT3_COMPARE 
                    bhi      nextBF 
; todo enable bonus shot3
                    lda      achievements + 5 
                    bita     #ACHIEVEMENT_FLAG_BYTE6_MINESTORM_DRUNKEN 
                    beq      shot2AfterAll 
                    ldb      #BONUS_SHOT3 
                    jmp      BonusDecided 

nextBF 
                    cmpa     #BONUS_MINESTORM_COMPARE 
                    bhi      nextBF2 
                    ldb      #BONUS_MINESTORM 
                    jmp      BonusDecided 

nextBF2 
                    cmpa     #BONUS_MULT2_COMPARE         ; 
                    bhi      nextBM2 
                    ldb      #BONUS_MULT2 
                    jmp      BonusDecided 

nextBM2 
                    cmpa     #BONUS_MULT5_COMPARE         ; 
                    bhi      nextBM5 
                    ldb      #BONUS_MULT5 
                    jmp      BonusDecided 

nextBM5 
                    cmpa     #BONUS_BOMB_CASH_COMPARE     ; 
                    bhi      nextBCash 
                    tst      difficulty 
                    lbmi     initBonus                    ; try again - hopefully nomoney :-) 
                    ldb      #BONUS_BOMB_CASH 
                    jmp      BonusDecided 

nextBCash 
                    cmpa     #BONUS_BOMB_DIAMOND_COMPARE  ; 
                    bhi      nextBDiamond 
                    ldb      difficulty 
                    andb     #1 
                    bne      getDiamondBomb               ; try again - hopefully nomoney :-) 
; diamond bomb only above level 50
                    ldb      levelCount 
                    cmpb     #51 
                    blo      gainTwentyCash 
getDiamondBomb 
                    ldb      #BONUS_BOMB_DIAMOND 
                    jmp      BonusDecided 

nextBDiamond 
                    cmpa     #BONUS_TIMER_COMPARE         ; 
                    bhi      nextBTimer 
                    ldb      #BONUS_TIMER 
                    jmp      BonusDecided 

nextBTimer 
                    cmpa     #BONUS_SLOWER_SHOT_COMPARE 
                    bhi      nextBI_ss 
                    ldb      #BONUS_SLOWER_SHOT 
                    jmp      BonusDecided 

nextBI_ss 
                    cmpa     #BONUS_MONEY_20_COMPARE 
                    bhi      nextOver20 
gainTwentyCash 
                    tst      difficulty 
                    lbmi     initBonus                    ; try again - hopefully nomoney :-) 
                    ldb      #BONUS_MONEY_20 
                    jmp      BonusDecided 

nextOver20 
                    cmpa     #BONUS_MONEY_50_COMPARE 
                    bhi      nextOver50 
                    tst      difficulty 
                    lbmi     initBonus                    ; try again - hopefully nomoney :-) 
gainFiftyCash 
                    ldb      #BONUS_MONEY_50 
                    jmp      BonusDecided 

nextOver50 
                    cmpa     #BONUS_CASH_DOUBLER_COMPARE 
                    bhi      nextnoCash 
do50instead 
                    ldb      difficulty 
                    lbmi     initBonus                    ; try again - hopefully nomoney :-) 
; cash double only above level 25
                    bne      getCashDouble 
                    ldb      levelCount 
                    cmpb     #25 
                    blo      gainFiftyCash 
getCashDouble 
                    ldb      #BONUS_CASH_DOUBLER 
                    bra      BonusDecided 

nextnoCash 
                    cmpa     #BONUS_SHOT_POWERUP_COMPARE 
                    bhi      nextnoPowerUp 
                    lda      difficulty                   ; only show power up bonus in non easy difficulty! 
                    anda     #$f 
                    beq      nextNoExtraLife 
                    RANDOM_A  
                    cmpa     #128 
                    bhi      do50instead 
                    ldb      #BONUS_SHOT_POWERUP 
                    bra      BonusDecided 

nextnoPowerUp 
                    cmpa     #BONUS_LIFE_COMPARE 
                    bhi      nextNoExtraLife 
                    lda      achievements + 1 
                    bita     #ACHIEVEMENT_FLAG_BYTE2_9LIVES 
                    beq      nextNoDrunken                ; 5 cash 
                    ldb      difficulty 
                    bmi      nextNoDrunken                ; 5 cash 
                    ldb      #BONUS_EXTRA_LIFE 
                    bra      BonusDecided 

nextNoExtraLife 
                    cmpa     #BONUS_DRUNKEN_COMPARE 
                    bhi      nextNoDrunken 
                    ldb      difficulty 
                    andb     #1 
                    bne      getDrunken                   ; t 
; drunken only above level 21
                    ldb      levelCount 
                    cmpb     #21 
                    blo      gainTwentyCash 
getDrunken 
                    ldb      #BONUS_DRUNKEN 
                    bra      BonusDecided 

nextNoDrunken 
                    cmpa     #BONUS_AUTOFIRE_COMPARE 
                    bhi      nextNoAutofire 
                    ldb      difficulty 
                    andb     #1 
                    bne      getAutofire                  ; t 
; autofire only above level 75
                    ldb      levelCount 
                    cmpb     #76 
                    lblo     gainTwentyCash 
getAutofire 
                    ldb      #BONUS_AUTOFIRE 
                    bra      BonusDecided 

nextNoAutofire 
; default bonus - Money 5
                    tst      difficulty 
                    lbmi     initBonus                    ; try again - hopefully nomoney :-) 
                    ldb      #BONUS_MONEY_5 
BonusDecided 
                    stb      TYPE,x 
                    RANDOM_A  
                    anda     #%10000000 
                    sta      BONUS_ANIM_POSITION,x 
                    ldd      #fallingBonusBehaviour 
                    std      BEHAVIOUR,x 
                    rts      

;
; ******************************************************************
;
initRank                                                  ;#isfunction  
                    clrb     
                    lda      X_POS, x 
                    cmpa     #-80 
                    blt      rankInitDone 
                    incb     
                    cmpa     #-40 
                    blt      rankInitDone 
                    incb     
                    cmpa     #0 
                    blt      rankInitDone 
                    incb     
                    cmpa     #40 
                    blt      rankInitDone 
                    incb     
                    cmpa     #80 
                    blt      rankInitDone 
                    incb     
rankInitDone 
                    lslb                                  ; double type 
                    lda      rankDrop 
                    sta      X_POS,x 
                    stb      TYPE,x                       ; 0 to 10 
                    clr      BONUS_ANIM_POSITION,x 
                    ldd      #fallingRankBehaviour 
                    std      BEHAVIOUR,x 
                    rts      

;
; ******************************************************************
;
 else                                                     ; bank = 3 
BonusStaticLists 
                    dw       BonusEList 
                    dw       BonusXList 
                    dw       BonusTList 
                    dw       BonusRList 
                    dw       BonusAList 
BonusXList 
                    db       $30, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$60, $01, -$36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $36, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $60, $01, -$36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
BonusRList 
                    db       -$30, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $31, $01, -$24, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1B, $01, $24, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $14, $01, -$36 
                    db       -$60, $01, $00 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
BonusAList 
                    db       -$2E, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $5E, $01, -$1B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$60, $01, -$1B, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       $30, $01, $0E, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, $1A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
BonusTList 
                    db       $30, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$60, $01, $1B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $60, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
BonusEList 
                    db       $30, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$60, $01, $00, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $00, $01, $36 
                    db       $30, $01, -$0F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, -$27, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
 endif  
