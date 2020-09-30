; diverse banks, see "if else clauses"
 if  CURRENT_BANK = 3 
;
; End boss "BORG"
;
;;;;;;; *****************************************
;;;;;;; * BANK 3 *
;;;;;;; *****************************************
subInitBoss1 
                    lda      difficulty 
                    beq      noBoss1Change 
                    clr      playerBonusActive            ; disable shield 
noBoss1Change 
                    lda      lockPurchased 
                    ora      #ENEMY_DESTRUCTED_FLAG       ; mark all enemies as dead 
                    sta      lockPurchased 
                    ldd      #0 
                    sta      bossIntroStage 
                    std      scoopEnemy1 
                    std      scoopEnemy2 
                    std      leftSmallGunAnimCounter 
                    std      rightSmallGunAnimCounter 
                    std      leftBigGunAnimCounter 
                    std      rightBigGunAnimCounter 
                    stb      allowBossShots 
                    lda      #$40 
                    std      bossPosY 
                    lda      #MAX_SHOT_OBJECTS_BOSS 
                    jsr      initBossFight 
;
; init boss jump backs
                    ldd      #enemies_done_boss1 
                    std      ENEMY_DONE_A 
                    ldd      #enemiesShots_done_boss1 
                    std      SHOTS_DONE_A 
; done in bank 0
REPLACE_1_2_playerShotsDoneBoss01_varFrom0_0 
                    ldd      #0                           ; 
                    std      PLAYERSHOTS_DONE_A 
                    rts      

;
; .....................................................
;
initBoss1                                                 ;#isfunction  
; destroy scoopies!
                    bsr      subInitBoss1 
                    lda      #BOSS_SPRITE_SCALE 
                    sta      boss1Scale 
; intro
REPLACE_1_2_doBoss1Intro00_varFromIRQ0_9 
                    ldx      #0                           ; doBoss1Intro00 
                    jsr      jsrBank0_fromBank3_T1 
                    bsr      subInitBoss1                 ; music destroys structures 
                    inc      allowBossShots 
                    jsr      clear_all_sound 
                    ldd      #0200                        ; fire "seeking" shot 
                    std      bossTimer 
                    ldb      difficulty 
                    andb     #$f                          ; 
                    beq      easy5 
                    decb     
                    beq      normal5 
                    decb     
                    beq      hard5 
impossible5 
                    ldd      #BOSS1_HITPOINTS *3 
                    bra      difCont5 

hard5 
normal5 
                    ldd      #BOSS1_HITPOINTS *2 
                    bra      difCont5 

easy5 
                    ldd      #BOSS1_HITPOINTS 
difCont5 
                    std      bossHP 
                    lda      diverseFlags 
                    ora      #%00000010                   ; boss 1 
                    sta      diverseFlags 
REPLACE_1_2_adjustShotDamage_varFrom0_41                  ;  bank 0 replace 
                    ldx      #0                           ; adjustShotDamage 
                    jsr      jsrBank0X 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Boss fight 1 Bank 1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
main1Boss1:                                               ;#isfunction  
enemiesShots_done_boss1 
                    lds      #MY_STACK                    ; CBFC ; correct the stack to default address 
                    jsr      bossFightPlayerStuff 
                    clr      bossWasHit 
                    RESET_LASER_SMALL  
                    COL_DETECT_ENEMY_BOSS1  testShot ,1 
                    COL_DETECT_ENEMY_BOSS1  test2Shot ,0 
; test Boss fight done
                    ldx      bossHP 
; "extro"
                    lbmi     extroBoss1 
REPLACE_1_2_displayBoss1_varFrom0_4                       ;  bank 0 replace 
                    ldx      #0                           ; displayBoss1 
                    jsr      jsrBank0X 
                    tst      bossMoveDir 
                    bne      boss1MoveLeft 
boss1MoveRight 
                    inc      bossPosX 
                    lda      bossPosX 
                    cmpa     #$40 
                    ble      boss1MoveDone 
                    inc      bossMoveDir 
                    bra      boss1MoveDone 

boss1MoveLeft 
                    dec      bossPosX 
                    lda      bossPosX 
                    cmpa     #-$40 
                    bge      boss1MoveDone 
                    clr      bossMoveDir 
boss1MoveDone 
                    lda      Vec_Loop_Count+1 
                    anda     #%01111111 
                    cmpa     #%01111111 
                    bne      noShotSpawnBoss1 
; using a bug shot with "playerX" target data
; to spawn "bigBug" target shots
; only we do not want to shoot at the player, but rather a couple of "parallel" target shots
; so we save the original player pos
; use it as a "target" X
; and restore the pos later
                    lda      playerXpos 
                    pshs     a 
                    lda      #5                           ; five "parallel" target shots 
                    sta      tmp3                         ; boss fight tmp 
                    lda      #$88 
                    sta      playerXpos                   ; at imaginary playerX pos 
                    lda      #3                           ; speed 3 - and bugshot 2 normal = target shot 
                    sta      isBugShot 
doAnotherShotBoss1 
                    lda      #$30                         ; y pos of shot 
                    ldb      bossPosX 
                    std      bulletSpawnAt 
                    jsr      spawnShot 
                    lda      playerXpos 
                    adda     #$30 
                    sta      playerXpos 
                    dec      tmp3 
                    bpl      doAnotherShotBoss1 
                    puls     a 
                    sta      playerXpos                   ; player pos restored 
noShotSpawnBoss1 
                    lda      Vec_Loop_Count+1 
                    anda     #%00011111 
                    cmpa     #%00011111                   ; timing for boss shots 
                    bne      noNormalShotBoss1 
                    clr      isBugShot 
                    inc      leftSmallGunAnimStart 
                    inc      rightSmallGunAnimStart 
                    lda      #ANIMATION_DELAY 
                    sta      leftSmallGunAnimDelayCounter 
                    sta      rightSmallGunAnimDelayCounter 
                    lda      #1 
                    sta      leftSmallGunAnimCounter 
                    sta      rightSmallGunAnimCounter 
                    lda      #$18                         ; y spawn pos 
                    ldb      bossPosX 
                    addb     #28                          ; x spawn pos 
                    std      bulletSpawnAt 
                    jsr      spawnShot                    ; "normal" bullet spawn 
                    lda      #$10 
                    ldb      bossPosX 
                    subb     #28 
                    std      bulletSpawnAt 
                    jsr      spawnShot 
noNormalShotBoss1 
                    ldx      bossTimer 
                    leax     -1,x 
                    stx      bossTimer                    ; every "x" rounds spawn a seeking missile 
                    bne      noMissileBoss1 
;...
                    ldx      #250                         ; we could reduce that with higher difficulty? 
                    stx      bossTimer 
                    lda      difficulty 
reduceLoop 
                    beq      noReduce 
                    leax     -40,x 
                    deca     
                    bra      reduceLoop 

noReduce 
                    lda      playerXpos 
                    ldb      bossPosX 
                    lda      #%10000010                   ; missile speed 1 
                    sta      isBugShot                    ; and "MISSILE" seeking type 
                    lda      #$22                         ; y pos 
                    ldb      bossPosX 
                    addb     #46                          ; x pos 
                    std      bulletSpawnAt 
                    jsr      spawnShot                    ; spawn missile 
                    inc      rightBigGunAnimStart 
                    lda      #ANIMATION_DELAY 
                    sta      rightBigGunAnimDelayCounter 
                    lda      #1 
                    sta      rightBigGunAnimCounter 
;...
noMissileBoss1 
; the object lists and smart draw use both stacks
; the object list uses DS as object list pointer
; and the smart draw uses "U" as User stack pointer
                    lda      #DEFAULT_ENEMY_INTENSITY 
                    _INTENSITY_A  
                    lds      enemylist_objects_head 
                    puls     d,pc                         ; (D = y,x) ; do all objects 
enemies_done_boss1 
                    lda      #$7f 
                    _INTENSITY_A  
                    lds      shotlist_objects_head 
                    puls     d,pc                         ; goes back to "enemiesShots_done_boss1" = main1Boss1 
;
; .....................................................
;
; Boss fight done
extroBoss1                                                ;#isfunction  
                    lda      #3 
                    sta      explosionCount 
                    ldx      #extro1PointerSUB 
                    stx      bossExtroPointer 
                    jmp      extroBoss 

extro1PointerSUB 
REPLACE_1_2_displayBoss1_varFrom0_6                       ;  bank 0 replace 
                    ldx      #0                           ; displayBoss1 
                    jmp      jsrBank0X 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 endif  
 if  CURRENT_BANK = 2 
;;;;;;; *****************************************
;;;;;;; * BANK 2 *
;;;;;;; *****************************************
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
displayBoss1 
displayBoss1_0_0                                          ;#isfunction  
; thing to do in odd rounds
; saves about 80 cyles and does no harm
; even round is done in bank 0
; since there the shpots are processed
                    lda      #$60 
                    _INTENSITY_A  
                    sts      tmp4 
                    lds      playershotlist_objects_head 
                    puls     d,pc                         ; (D = y,x) ; do all objects 
playerShotsDoneBoss01 
                    lds      tmp4 
                    tst      bossWasHit 
                    beq      boss1NotHit 
                    jsr      Intensity_7F 
                    bra      intDoneBoss1 

boss1NotHit 
                    jsr      Intensity_3F 
intDoneBoss1 
                    jsr      bossDisplayHead 
displayBoss1L 
                    jsr      calibrationZero50 
                    clra     
                    ldb      gameScale 
                    sta      <VIA_shift_reg 
                    LDA      #$CC 
                    STA      VIA_cntl                     ;/BLANK low and /ZERO low 
                    stB      VIA_t1_cnt_lo 
                    ldd      #0 
                    std      <VIA_port_b 
                    ldd      bossPosY 
                    MY_MOVE_TO_D_START  
                    lda      diverseFlags 
                    anda     #BIT_FLAG_IS_BOSSFIGHT_ANY 
                    lbeq     drawSkullOnly 
                    ldu      #Boss1StaticLeft 
                    lda      boss1Scale 
                    sta      VIA_t1_cnt_lo 
                    MY_MOVE_TO_B_END  
                    jsr      SMVB50_drawSmart 
                    ldd      bossPosY 
                    MY_MOVE_TO_D_START  
                    ldu      #Boss1StaticRight 
                    lda      boss1Scale 
                    sta      VIA_t1_cnt_lo 
                    MY_MOVE_TO_B_END  
                    jsr      SMVB50_drawSmart 
                    ldd      bossPosY 
                    MY_MOVE_TO_D_START  
                    ldu      #Boss1StaticInnerLeft 
                    lda      boss1Scale 
                    sta      VIA_t1_cnt_lo 
                    MY_MOVE_TO_B_END  
                    jsr      SMVB50_drawSmart 
                    ldd      bossPosY 
                    MY_MOVE_TO_D_START  
                    ldu      #Boss1StaticInnerRight 
                    lda      boss1Scale 
                    sta      VIA_t1_cnt_lo 
                    MY_MOVE_TO_B_END  
                    jsr      SMVB50_drawSmart 
                    ldd      bossPosY 
                    MY_MOVE_TO_D_START  
drawSkullOnly 
                    ldu      #Boss1StaticSkull 
                    lda      boss1Scale 
                    sta      VIA_t1_cnt_lo 
                    MY_MOVE_TO_B_END  
                    jsr      SMVB50_drawSmart 
                    ldd      bossPosY 
                    MY_MOVE_TO_D_START  
                    dec      eyeLeftAnimDelayCounter 
                    bpl      boss1EyeAnimStays 
                    lda      #ANIMATION_DELAY 
                    sta      eyeLeftAnimDelayCounter 
                    inc      eyeLeftAnimCounter 
                    ldu      #Boss1EyeAnim 
                    lda      eyeLeftAnimCounter 
                    asla     
                    ldu      a,u 
                    bne      boss1EyeAnimOk 
                    clr      eyeLeftAnimCounter 
boss1EyeAnimOk 
boss1EyeAnimStays 
                    ldu      #Boss1EyeLeft 
                    lda      boss1Scale 
                    sta      VIA_t1_cnt_lo 
                    MY_MOVE_TO_B_END  
                    jsr      SMVB50_drawSmart 
                    ldu      #Boss1EyeAnim 
                    lda      eyeLeftAnimCounter 
                    asla     
                    ldu      a,u 
                    jsr      SMVB50_drawSmart 
                    ldd      bossPosY 
                    MY_MOVE_TO_D_START  
                    ldu      #Boss1EyeRight 
                    lda      boss1Scale 
                    sta      VIA_t1_cnt_lo 
                    MY_MOVE_TO_B_END  
                    jsr      SMVB50_drawSmart 
                    ldu      #Boss1EyeAnim 
                    lda      eyeLeftAnimCounter 
                    asla     
                    ldu      a,u 
                    jsr      SMVB50_drawSmart 
                    ldd      bossPosY 
                    MY_MOVE_TO_D_START  
                    lda      diverseFlags 
                    anda     #BIT_FLAG_IS_BOSSFIGHT_ANY 
                                                          ; tst inBossFight 
                    lbeq     finishDrawEarlyBoss1 
LeftSmallGunDrawBoss1_d_again 
                    ldu      #Boss1GunLeftSmall_0 
                    tst      leftSmallGunAnimStart 
                    beq      LeftSmallGunDrawBoss1 
                    dec      leftSmallGunAnimDelayCounter 
                    bpl      LeftSmallGunDrawBoss1_d 
                    lda      #ANIMATION_DELAY 
                    sta      leftSmallGunAnimDelayCounter 
                    inc      leftSmallGunAnimCounter 
                    lda      leftSmallGunAnimCounter 
                    lsla     
                    ldu      #Boss1GunLeftSmall_Anim 
                    ldu      a,u 
                    bne      LeftSmallGunDrawBoss1_d 
                    clr      leftSmallGunAnimStart 
                    bra      LeftSmallGunDrawBoss1_d_again 

LeftSmallGunDrawBoss1_d 
                    ldu      #Boss1GunLeftSmall_Anim 
                    lda      leftSmallGunAnimCounter 
                    lsla     
                    ldu      a,u 
LeftSmallGunDrawBoss1 
                    lda      boss1Scale 
                    sta      VIA_t1_cnt_lo 
                    MY_MOVE_TO_B_END  
                    jsr      SMVB50_drawSmart 
                    ldd      bossPosY 
                    MY_MOVE_TO_D_START  
RightSmallGunDrawBoss1_d_again 
                    ldu      #Boss1GunRightSmall_0 
                    tst      rightSmallGunAnimStart 
                    beq      RightSmallGunDrawBoss1 
                    dec      rightSmallGunAnimDelayCounter 
                    bpl      RightSmallGunDrawBoss1_d 
                    lda      #ANIMATION_DELAY 
                    sta      rightSmallGunAnimDelayCounter 
                    inc      rightSmallGunAnimCounter 
                    lda      rightSmallGunAnimCounter 
                    lsla     
                    ldu      #Boss1GunRightSmall_Anim 
                    ldu      a,u 
                    bne      RightSmallGunDrawBoss1_d 
                    clr      rightSmallGunAnimStart 
                    bra      RightSmallGunDrawBoss1_d_again 

RightSmallGunDrawBoss1_d 
                    ldu      #Boss1GunRightSmall_Anim 
                    lda      rightSmallGunAnimCounter 
                    lsla     
                    ldu      a,u 
RightSmallGunDrawBoss1 
                    lda      boss1Scale 
                    sta      VIA_t1_cnt_lo 
                    MY_MOVE_TO_B_END  
                    jsr      SMVB50_drawSmart 
;...
                    ldd      bossPosY 
                    MY_MOVE_TO_D_START  
RightBigGunDrawBoss1_d_again 
                    ldu      #Boss1GunRightBig_0 
                    tst      rightBigGunAnimStart 
                    beq      RightBigGunDrawBoss1 
                    dec      rightBigGunAnimDelayCounter 
                    bpl      RightBigGunDrawBoss1_d 
                    lda      #ANIMATION_DELAY 
                    sta      rightBigGunAnimDelayCounter 
                    inc      rightBigGunAnimCounter 
                    lda      rightBigGunAnimCounter 
                    lsla     
                    ldu      #Boss1GunRightBig_Anim 
                    ldu      a,u 
                    bne      RightBigGunDrawBoss1_d 
                    clr      rightBigGunAnimStart 
                    bra      RightBigGunDrawBoss1_d_again 

RightBigGunDrawBoss1_d 
                    ldu      #Boss1GunRightBig_Anim 
                    lda      rightBigGunAnimCounter 
                    lsla     
                    ldu      a,u 
RightBigGunDrawBoss1 
                    lda      boss1Scale 
                    sta      VIA_t1_cnt_lo 
                    MY_MOVE_TO_B_END  
                    jsr      SMVB50_drawSmart 
;....
                    ldd      bossPosY 
                    MY_MOVE_TO_D_START  
                    ldu      #Boss1GunLeftBig_0 
                    lda      boss1Scale 
                    sta      VIA_t1_cnt_lo 
                    MY_MOVE_TO_B_END  
                    jsr      SMVB50_drawSmart 
                    ldd      bossPosY 
                    MY_MOVE_TO_D_START  
                    ldu      #Boss1FumeLeft 
                    ldb      Vec_Loop_Count+1 
                    andb     #1 
                    beq      noOddRoundBoss1 
                    ldu      #Boss1FumeRight 
noOddRoundBoss1 
                    lda      boss1Scale 
                    sta      VIA_t1_cnt_lo 
                    MY_MOVE_TO_B_END  
                    jsr      SMVB50_drawSmart 
drawBosss1Done 
                    rts      

finishDrawEarlyBoss1 
                    MY_MOVE_TO_B_END  
                    bra      drawBosss1Done 

 endif  
 if  CURRENT_BANK = 0 
;;;;;;; *****************************************
;;;;;;; * BANK 0 *
;;;;;;; *****************************************
doBoss1Intro00                                            ;#isfunction  
doBoss1Intro0_0                                           ;#isfunction  
                    ldd      #$3000 
                    std      bossPosY 
                    clr      boss3MouthAnimCounter 
                    lda      #$70 
                    sta      boss3AttachmentScale 
REPLACE_1_2_boss1Music_varFromIRQ1_1 
                    ldu      #0                           ; ; boss1Music 
REPLACE_1_2_PLYINIT_varFromIRQ1_18 
                    ldx      #0                           ; PLYINIT 
                    jsr      jsrBank1_fromBank0_T1 
                    clr      songLoop 
                    lda      #-50 
                    sta      introBossX 
                    nega     
                    sta      introPlayerX 
                    IRQ_TO_0_SHIFT  
                    lda      #150 
                    sta      scoopEnemy1 
Boss1IntroLoop 
                    JSR      Wait_Recal_noShift           ; Vectrex BIOS recalibration 
REPLACE_1_2_playAKSMusicNoLoop_varFromIRQ1_173 
                    ldx      #0                           ; playAKSMusicNoLoop 
                    jsr      jsrBank1_fromBank0_T1 
                    jsr      calibrationZero50 
                    LDy      #bosssIntroMain              ; address of data 
nextScenePart_b1: 
                    ldd      #$6032 
                    stb      VIA_t1_cnt_lo 
                    lda      #$60 
                    ldb      introBossX 
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    LDU      ,y++ 
                    LDd      ,y 
                    beq      lastDraw 
                    MY_MOVE_TO_D_END  
                    jsr      SMVB50_drawSmart 
                    BRA      nextScenePart_b1 

lastDraw 
                    MY_MOVE_TO_D_END  
                    jsr      SMVB50_drawSmart 
contBoss1Draw 
                    jsr      Intensity_5F 
                    lda      #50 
                    sta      VIA_t1_cnt_lo 
                    lda      #$60 
                    ldb      introBossX 
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    lda      bossIntroStage 
                    cmpa     #1 
                    beq      middleShots 
                    cmpa     #2 
                    beq      lastShots 
                    LDu      #bossShots_0                 ; address of data 
                    bra      ShotsCont 

middleShots 
                    ldu      #bossShots_1 
                    bra      ShotsCont 

lastShots 
                    LDu      #bossShots_2                 ; address of data 
ShotsCont 
                    MY_MOVE_TO_D_END  
                    jsr      SMVB50_drawSmart 
                    lda      #50 
                    sta      VIA_t1_cnt_lo 
                    jsr      drawBossPlayerOnly 
                    lda      Vec_Loop_Count+1 
                    anda     #%00000011 
                    bne      noPosChangeb1 
                    ldb      introBossX 
                    beq      noPosChangeb1 
                    inc      introBossX 
                    dec      introPlayerX 
noPosChangeb1 
                    ldb      scoopEnemy1 
                    beq      noWait_b1 
                    dec      scoopEnemy1 
                    lda      scoopEnemy1 
                    cmpa     #100 
                    bne      no100sh 
                    inc      bossIntroStage 
no100sh 
                    cmpa     #50 
                    bne      no50sh 
                    inc      bossIntroStage 
no50sh 
                    jmp      Boss1IntroLoop 

noWait_b1 
REPLACE_1_2_getButtonState_varFromIRQ1_129 
                    ldx      #0                           ; getButtonState 
                    jsr      jsrBank1_fromBank0_T1 
                    ldb      current_button_state 
                    andb     #3 
                    CMPB     #$01                         ; pressed, but last time was unpressed 
                    lbne     Boss1IntroLoop 
                    rts      

; there might be some VLists for animation, in case I leave these in place...
;bosssIntroClosed 
;                    DW       0 
;bosssIntroOpen 
;                    DW       0 
bosssIntroMain 
                    DW       boss_0                       ; list of all single vectorlists in this 
                    DW       boss_1 
                    DW       boss_2 
                    DW       boss_3 
                    DW       boss_4 
                    DW       boss_5 
                    DW       boss_6 
                    DW       boss_7 
                    DW       boss_8 
                    DW       0 
boss_0 
                    db       $31, $01, -$16, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $2F, 0, 0, hi(SMVB50_LightOff_Intensity), lo(SMVB50_LightOff_Intensity) 
                    db       -$03, $01, $1C, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$07, $01, -$03, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0A, $01, $05, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $07, $01, $1C, hi(SMVB50_continue5_single), lo(SMVB50_continue5_single) 
                    db       -$0C, $01, $16 
                    db       -$12, $01, $06 
                    db       -$08, $01, -$04 
                    db       -$02, $01, -$15 
                    db       -$0A, $01, -$0B, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$04, $01, $04, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $ce, $01, $ce , hi(SMVB50_startMove_xyStays_single), lo(SMVB50_startMove_xyStays_single) ; y was -$04; x was $04; y now $CE 
                    db       $ee, $01, $ee , hi(SMVB50_startDraw_xyStays_single), lo(SMVB50_startDraw_xyStays_single) ; y was -$04; x was $04, y now $ee 
                    db       $ce, $01, $ce , hi(SMVB50_startMove_xyStays_single), lo(SMVB50_startMove_xyStays_single) ; y was -$04; x was $04; y now $CE 
                    db       $ee, $01, $ee , hi(SMVB50_startDraw_xyStays_single), lo(SMVB50_startDraw_xyStays_single) ; y was -$04; x was $04, y now $ee 
                    db       $14, $01, $09, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $47, 0, 0, hi(SMVB50_LightOff_Intensity), lo(SMVB50_LightOff_Intensity) 
                    db       -$23, $01, $1C, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $0C, $01, -$20, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $2F, 0, 0, hi(SMVB50_LightOff_Intensity), lo(SMVB50_LightOff_Intensity) 
                    db       $14, $01, $04, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $01, $01, $12, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $05, $01, $02, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$0A, $01, $0D, hi(SMVB50_continue3_single), lo(SMVB50_continue3_single) 
                    db       -$05, $01, -$02 
                    db       $0A, $01, -$0D 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
boss_1 
                    db       -$2C, $01, $69, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $03, $01, $12, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$0C, $01, -$01, hi(SMVB50_continue3_single), lo(SMVB50_continue3_single) 
                    db       -$0B, $01, -$15 
                    db       $14, $01, $04 
                    db       $ce, $01, -$08, hi(SMVB50_startMove_newY_eq_oldX_single), lo(SMVB50_startMove_newY_eq_oldX_single) ; y was $04, now $ce 
                    db       $53, 0, 0, hi(SMVB50_LightOff_Intensity), lo(SMVB50_LightOff_Intensity) 
                    db       $10, $01, $53, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$34, $01, -$59, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $2F, 0, 0, hi(SMVB50_LightOff_Intensity), lo(SMVB50_LightOff_Intensity) 
                    db       $10, $01, $03, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $3D, $01, $36, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$04, $01, -$01, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $0D, $01, -$38, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $07, $01, $02, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$01, $01, $12, hi(SMVB50_continue6_single), lo(SMVB50_continue6_single) 
                    db       -$0F, $01, $18 
                    db       $00, $01, $0D 
                    db       $0E, $01, -$19 
                    db       $01, $01, -$0C 
                    db       -$04, $01, -$01 
                    db       $04, $01, $07, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $47, 0, 0, hi(SMVB50_LightOff_Intensity), lo(SMVB50_LightOff_Intensity) 
                    db       $0F, $01, -$30, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$03, $01, $04, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $2F, 0, 0, hi(SMVB50_LightOff_Intensity), lo(SMVB50_LightOff_Intensity) 
                    db       $08, $01, -$0C, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $03, $01, $0C, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $07, $01, $04, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $47, 0, 0, hi(SMVB50_LightOff_Intensity), lo(SMVB50_LightOff_Intensity) 
                    db       -$19, $01, $24, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
boss_2 
                    db       $18, $01, $7D, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $2F, 0, 0, hi(SMVB50_LightOff_Intensity), lo(SMVB50_LightOff_Intensity) 
                    db       $09, $01, -$04, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $15, $01, -$1C, hi(SMVB50_continue4_single), lo(SMVB50_continue4_single) 
                    db       -$04, $01, -$07 
                    db       -$09, $01, $06 
                    db       -$02, $01, -$04 
                    db       $07, $01, $0F, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $04, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$01, $01, $08, hi(SMVB50_continue3_single), lo(SMVB50_continue3_single) 
                    db       -$14, $01, $18 
                    db       -$05, $01, $00 
                    db       $5F, 0, 0, hi(SMVB50_LightOff_Intensity), lo(SMVB50_LightOff_Intensity) 
                    db       -$44, $01, $69, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $2F, 0, 0, hi(SMVB50_LightOff_Intensity), lo(SMVB50_LightOff_Intensity) 
                    db       $00, $01, -$0E, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$09, $01, -$0A, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$0D, $01, -$02 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
boss_3 
                    db       -$1B, $01, $6E, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $06, $01, $07, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$05, $01, $03, hi(SMVB50_continue7_single), lo(SMVB50_continue7_single) 
                    db       $00, $01, $05 
                    db       $05, $01, $01 
                    db       -$06, $01, $03 
                    db       -$03, $01, $00 
                    db       -$06, $01, -$01 
                    db       -$05, $01, -$06 
                    db       $00, $01, -$07, hi(SMVB50_continue4_single), lo(SMVB50_continue4_single) 
                    db       $05, $01, -$03 
                    db       $07, $01, $01 
                    db       $03, $01, $07 
                    db       $00, $01, $05, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$04, $01, $04, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $09, $01, -$0C, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $00, $01, $09, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $05, $01, $03, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$0A, $01, $06, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$0C, $01, -$06, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$07, $01, -$0B 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
boss_4 
                    db       $25, $01, -$6E, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       -$12, $01, $02, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$04, $01, $02, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       -$05, $01, -$09, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $06, $01, -$02, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $0F, $01, -$03, hi(SMVB50_continue7_single), lo(SMVB50_continue7_single) 
                    db       -$03, $01, $05 
                    db       $03, $01, $02 
                    db       $04, $01, $00 
                    db       $02, $01, $03 
                    db       -$07, $01, $04 
                    db       $02, $01, $02 
                    db       -$01, $01, $05, hi(SMVB50_continue5_single), lo(SMVB50_continue5_single) 
                    db       $08, $01, $03 
                    db       -$01, $01, $06 
                    db       -$13, $01, $00 
                    db       -$04, $01, -$02 
                    db       $09, $01, $02, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $07, $01, $06, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$1E, $01, -$01, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $05, $01, $04, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $ce, $01, -$03, hi(SMVB50_startMove_newY_eq_oldX_single), lo(SMVB50_startMove_newY_eq_oldX_single) ; y was $04, now $ce 
                    db       $15, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$05, $01, $03, hi(SMVB50_continue6_single), lo(SMVB50_continue6_single) 
                    db       -$14, $01, $00 
                    db       $04, $01, -$03 
                    db       -$05, $01, -$03 
                    db       -$04, $01, $02 
                    db       -$07, $01, $03 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
boss_5 
                    db       $11, $01, -$60, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $47, 0, 0, hi(SMVB50_LightOff_Intensity), lo(SMVB50_LightOff_Intensity) 
                    db       $0B, $01, $29, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$02, $01, $24, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       -$0B, $01, -$14, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $2F, 0, 0, hi(SMVB50_LightOff_Intensity), lo(SMVB50_LightOff_Intensity) 
                    db       $10, $01, $1D, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$01, $01, -$02, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $02, $01, -$1E, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$01, $01, -$07, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       -$0E, $01, -$08, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$0D, $01, $04, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$04, $01, -$01, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $04, $01, $01, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $01, $01, -$10, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $0E, $01, -$03 
                    db       -$05, $01, -$0C, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $00, $01, -$1A, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$05, $01, $00, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $ee, $01, $1A, hi(SMVB50_startDraw_newY_eq_oldX_single), lo(SMVB50_startDraw_newY_eq_oldX_single) ; y was $00, now $ee 
                    db       $0B, $01, $01, hi(SMVB50_continue4_single), lo(SMVB50_continue4_single) 
                    db       -$03, $01, $1E 
                    db       -$1E, $01, $0B 
                    db       -$08, $01, -$01 
                    db       -$39, $01, $47, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0A, $01, -$17, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $10, $01, $02, hi(SMVB50_continue3_single), lo(SMVB50_continue3_single) 
                    db       -$06, $01, $18 
                    db       -$14, $01, -$03 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
boss_6 
                    db       -$4A, $01, -$3E, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $47, 0, 0, hi(SMVB50_LightOff_Intensity), lo(SMVB50_LightOff_Intensity) 
                    db       $30, $01, $07, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $29, $01, $0E, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $2F, 0, 0, hi(SMVB50_LightOff_Intensity), lo(SMVB50_LightOff_Intensity) 
                    db       -$1C, $01, -$03, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$0D, $01, -$0B, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $2D, $01, -$1B, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$12, $01, -$0C, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$06, $01, $0F, hi(SMVB50_continue3_single), lo(SMVB50_continue3_single) 
                    db       $12, $01, $0C 
                    db       $06, $01, -$0F 
                    db       $05, $01, $27, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $03, $01, $17, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $06, $01, $03, hi(SMVB50_continue5_single), lo(SMVB50_continue5_single) 
                    db       $14, $01, -$07 
                    db       $0B, $01, -$16 
                    db       -$07, $01, -$1B 
                    db       -$0B, $01, -$08 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
boss_7 
                    db       $38, $01, -$4B, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $01, $01, -$07, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$08, $01, -$19, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$08, $01, $05 
                    db       $47, 0, 0, hi(SMVB50_LightOff_Intensity), lo(SMVB50_LightOff_Intensity) 
                    db       -$19, $01, $31, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $5F, 0, 0, hi(SMVB50_LightOff_Intensity), lo(SMVB50_LightOff_Intensity) 
                    db       -$0A, $01, $6E, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $2F, 0, 0, hi(SMVB50_LightOff_Intensity), lo(SMVB50_LightOff_Intensity) 
                    db       $01, $01, $09, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $15, $01, $07, hi(SMVB50_continue7_single), lo(SMVB50_continue7_single) 
                    db       -$1C, $01, $1B 
                    db       -$16, $01, -$07 
                    db       -$07, $01, -$08 
                    db       -$0B, $01, $0C 
                    db       -$0E, $01, $03 
                    db       -$03, $01, -$13 
                    db       $47, 0, 0, hi(SMVB50_LightOff_Intensity), lo(SMVB50_LightOff_Intensity) 
                    db       $ee, $01, -$37, hi(SMVB50_startDraw_yStays_single), lo(SMVB50_startDraw_yStays_single) ; y was -$03, now $ee 
                    db       $07, $01, -$32, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $2F, 0, 0, hi(SMVB50_LightOff_Intensity), lo(SMVB50_LightOff_Intensity) 
                    db       $08, $01, -$13, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $0B, $01, -$0D, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $5F, 0, 0, hi(SMVB50_LightOff_Intensity), lo(SMVB50_LightOff_Intensity) 
                    db       $1B, $01, -$7F, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $01, $01, $00, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $47, 0, 0, hi(SMVB50_LightOff_Intensity), lo(SMVB50_LightOff_Intensity) 
                    db       -$27, $01, $09, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$01, $01, -$09, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $2F, 0, 0, hi(SMVB50_LightOff_Intensity), lo(SMVB50_LightOff_Intensity) 
                    db       -$0A, $01, -$04, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
boss_8 
                    db       -$1A, $01, -$60, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $08, $01, -$03, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $02, $01, -$08, hi(SMVB50_continue7_single), lo(SMVB50_continue7_single) 
                    db       $0B, $01, $00 
                    db       -$05, $01, $0F 
                    db       -$09, $01, $05 
                    db       -$07, $01, -$09 
                    db       -$05, $01, -$03 
                    db       -$03, $01, -$08 
                    db       $03, $01, -$07, hi(SMVB50_continue4_single), lo(SMVB50_continue4_single) 
                    db       $05, $01, -$04 
                    db       $08, $01, $04 
                    db       $02, $01, $07 
                    db       -$02, $01, $08, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $ee, $01, $07, hi(SMVB50_startDraw_newY_eq_oldX_single), lo(SMVB50_startDraw_newY_eq_oldX_single) ; y was $08, now $ee 
                    db       $05, $01, -$0F, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$05, $01, -$0C, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$08, $01, -$0D, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $10, $01, $08, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $05, $01, $11, hi(SMVB50_continue5_single), lo(SMVB50_continue5_single) 
                    db       -$06, $01, $14 
                    db       -$0F, $01, $07 
                    db       -$13, $01, -$08 
                    db       -$05, $01, -$13 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
bossShots_0 
                    db       $00, $01, -$4A, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $13, $01, -$0C, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, $05, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$13, $01, $0D, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$24, $01, $37, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$26, $01, $1B, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$01, $01, $0D, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $24, $01, -$1B, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $1A, $01, $08, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $ee, $01, -$13, hi(SMVB50_startDraw_yStays_single), lo(SMVB50_startDraw_yStays_single) ; y was $1A, now $ee 
                    db       $04, $01, $05, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$1F, $01, $17, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $1E, $01, $2D, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $1B, $01, -$16, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$05, $01, $50, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$20, $01, $25, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $01, $01, -$06, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$1A, $01, $1B, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, -$07, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $16, $01, -$16, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$04, $01, $45, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$19, $01, $12, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, -$05, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $19, $01, -$12, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$53, $01, -$04, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $22, $01, -$1F, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $06, $01, $06, hi(SMVB50_startMove_yEqx_single), lo(SMVB50_startMove_yEqx_single) ; y is $06 
                    db       -$28, $01, $25, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
bossShots_1 
                    db       $00, $01, -$4A, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $13, $01, -$0B, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, $05, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$13, $01, $0C, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$24, $01, $38, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$26, $01, $15, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$01, $01, $0D, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $24, $01, -$15, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $19, $01, $04, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $1B, $01, -$0F, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $04, $01, $05, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$20, $01, $13, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $1F, $01, $2C, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $1B, $01, -$11, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$05, $01, $50, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$21, $01, $17, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $02, $01, $08, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$1E, $01, $10, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, -$05, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $1A, $01, -$0D, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$04, $01, $45, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$1A, $01, $04, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, -$05, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $1A, $01, -$04, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$55, $01, -$1B, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $24, $01, -$08, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $06, $01, $06, hi(SMVB50_startMove_yEqx_single), lo(SMVB50_startMove_yEqx_single) ; y is $06 
                    db       -$2A, $01, $0B, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
bossShots_2 
                    db       $00, $01, -$4A, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $13, $01, -$0B, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, $05, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$13, $01, $0C, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$24, $01, $38, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$26, $01, $14, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$01, $01, $0C, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $24, $01, -$13, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $19, $01, $03, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $1B, $01, -$0E, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $04, $01, $05, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$20, $01, $11, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $1E, $01, $2B, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $1C, $01, -$0E, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$05, $01, $50, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$21, $01, $0B, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $02, $01, $14, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$1E, $01, $04, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, -$03, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $1A, $01, -$03, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$04, $01, $45, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$1B, $01, -$08, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, -$05, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $1B, $01, $08, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$51, $01, -$2B, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $20, $01, $08, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $06, $01, $06, hi(SMVB50_startMove_yEqx_single), lo(SMVB50_startMove_yEqx_single) ; y is $06 
                    db       -$25, $01, -$08, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 endif  
