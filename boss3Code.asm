; diverse banks, see "if else clauses"
 if  CURRENT_BANK = 3 
;
; Boss "Sinistar"
;
BOSS_Y_POSSITION_3  =        $60 
;;;;;;; *****************************************
;;;;;;; * BANK 3 *
;;;;;;; *****************************************
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
subInitBoss3 
                    lda      lockPurchased 
                    ora      #ENEMY_DESTRUCTED_FLAG 
                    sta      lockPurchased 
; destroy scoopies!
                    ldd      #0 
                    sta      bossIntroStage 
                    std      scoopEnemy1 
                    std      scoopEnemy2 
                    lda      #MAX_SHOT_OBJECTS_BOSS 
                    jsr      initBossFight 
; enemies
                    lda      #MAX_ENEMY_OBJECTS_BOSS3 
                    ldu      #enemyobject_list 
                    stu      enemylist_empty_head 
                    ldy      #ENEMY_DONE 
next_list_entry_igb3 
                    leax     EnemyStruct,u 
                    stx      NEXT_ENEMY_OBJECT,u 
                    clr      BIT_MASK,u 
                    leau     ,x 
                    deca     
                    bne      next_list_entry_igb3 
                    leau     -EnemyStruct,u 
                    sty      NEXT_ENEMY_OBJECT,u 
                    sty      enemylist_objects_head 
                    sta      boss2Direction 
                    lda      #50 
                    sta      boss2Scale 
                    sta      boss3LetterCannonWait 
                    clr      boss3ShieldCount 
                    ldd      #boss3Shots 
                    std      boss3LetterCannonPointer 
                    ldd      #BOSS3_HITPOINTS 
                    std      boss3HPCompare 
                                                          ; ldd #boss3MoveData 
                    lda      difficulty 
                    anda     #$f 
                    lsla     
loadAgaina 
                    ldu      #boss3MoveData 
                    ldu      a,u 
                    bne      movementOka 
                    suba     #2 
                    bra      loadAgaina 

movementOka 
                    stu      boss3MovementPointer 
;                    std      boss3MovementPointer 
                    rts      

;
; .....................................................
;
initBoss3                                                 ;#isfunction  
; Boss  intro
                    bsr      subInitBoss3 
REPLACE_1_2_initTitleRAM_varFrom0_17 
                    ldx      #0                           ; initTitleRAM 
                    jsr      jsrBank0X 
REPLACE_1_2_doBoss3Intro00_varFromIRQ0_9 
                    ldx      #0                           ; doBoss3Intro00 
                    jsr      jsrBank0_fromBank3_T1 
                    bsr      subInitBoss3 
; initialize boss fight 3 for real
; done in bank 0
REPLACE_1_2_playerShotsDoneBoss03_varFrom0_0 
                    ldd      #0                           ; 
                    std      PLAYERSHOTS_DONE_A 
                    ldd      #BOSS_Y_POSSITION_3*256 
                    std      bossPosY 
                    jsr      initMovementBoss3 
;
                    lda      diverseFlags 
                    ora      #%00000110                   ; boss 3 flag 
                    sta      diverseFlags 
REPLACE_1_2_adjustShotDamage_varFrom0_43                  ;  bank 0 replace 
                    ldx      #0                           ; adjustShotDamage 
                    jsr      jsrBank0X 
                    ldb      difficulty 
                    andb     #$f                          ; 
                    beq      easy7 
                    decb     
                    beq      normal7 
                    decb     
                    beq      hard7 
impossible7 
                    ldd      #BOSS3_HITPOINTS *3 
                    bra      difCont7 

normal7 
hard7 
                    ldd      #BOSS3_HITPOINTS*2 
                    bra      difCont7 

easy7 
                    ldd      #BOSS3_HITPOINTS 
difCont7 
                    std      bossHP 
                    ldd      #enemies_done_boss3 
                    std      ENEMY_DONE_A 
                    ldd      #enemiesShots_done_boss3 
                    std      SHOTS_DONE_A 
;
; .....................................................
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
main1Boss3:                                               ;#isfunction  
enemiesShots_done_boss3 
                    lds      #MY_STACK                    ; CBFC ; correct the stack to default address 
; initialize all "round" stuff for player
                    jsr      bossFightPlayerStuff 
                    clr      bossWasHit 
                    RESET_LASER_SMALL  
; in x the current shot object pointer
                    ldy      #testShot 
                    ldx      ,y 
                    beq      backToTestBoss3_1 
                    ldd      #backToTestBoss3_1 
                    std      backJump 
                    jmp      coldetectBoss3_4 

backToTestBoss3_1 
                    ldy      #test2Shot 
                    ldx      ,y 
                    beq      backToTestBoss3_2 
                    ldd      #backToTestBoss3_2 
                    std      backJump 
                    jmp      coldetectBoss3_4 

backToTestBoss3_2 
; check for boss deat
                    ldx      bossHP 
                    lbmi     extroBoss3 
bossFightNotDoneBoss3 
; ....................  move boss
                                                          ; check if destination is reached 
                                                          ; if so get next moevement pointer 
                                                          ; and init next movement 
                    ldu      boss3YposNow16 
                    ldd      boss3Ypos16 
                    leau     d,u 
                    stu      boss3YposNow16 
                    ldu      boss3XposNow16 
                    ldd      boss3Xpos16 
                    leau     d,u 
                    stu      boss3XposNow16 
                    lda      boss3YposNow16 
                    ldb      boss3XposNow16 
                    ldu      boss3MovementPointer 
                    std      bossPosY 
                    suba     ,u 
                    bpl      isNotNegBoss3y 
                    nega     
isNotNegBoss3y 
                    cmpa     #4 
                    bhi      boss3TargetNotReached 
                    lda      bossPosY+1 
                    suba     1,u 
                    bpl      isNotNegBoss3x 
                    nega     
isNotNegBoss3x 
                    cmpa     #4 
                    bhi      boss3TargetNotReached 
                    leau     3,u 
                    stu      boss3MovementPointer 
                    ldd      ,u 
                    bne      boss3NextTargetOk 
                    lda      difficulty 
                    anda     #$f 
                    lsla     
loadAgain 
                    ldu      #boss3MoveData 
                    ldu      a,u 
                    bne      movementOk 
                    suba     #2 
                    bra      loadAgain 

movementOk 
                    stu      boss3MovementPointer 
boss3NextTargetOk 
                    jsr      initMovementBoss3 
boss3TargetNotReached 
; ................ boss move done
;
; ................ check boss collision 
                    ldd      bossPosY 
                    cmpa     #-60 
                    bgt      boss3NotDirectHit 
                    addb     #80                          ; make unsigned 
                    stb      tmp1_tmp 
                    ldb      playerXpos 
                    addb     #80 
                    subb     tmp1_tmp 
                    bpl      noNegPosBoss3 
                    negb     
noNegPosBoss3 
                    cmpb     #$20 
                    bhi      boss3NotDirectHit 
                    inc      playerWasHitFor 
; ................ check boss collision done
;
; ................ check boss damage and shield stuff
boss3NotDirectHit 
                    ldd      bossHP 
                    cmpd     boss3HPCompare 
                    bgt      noHPChangeBoss3 
                    ldd      boss3HPCompare 
                    subd     #40 
                    std      boss3HPCompare 
                    inc      boss3ShieldCount 
; init exploding shield
REPLACE_1_2_explosion1Data_varFromIRQ1_31 
                    ldu      #0                           ;explosion1Data 
                    stu      sfx_pointer_3 
; ................ check boss damage and shield stuff done
;
noHPChangeBoss3 
; display boss in bank 0
REPLACE_1_2_displayBoss3_varFrom0_9                       ;  bank 0 replace 
                    ldx      #0                           ; displayBoss3 
                    jsr      jsrBank0X 
; disable calibration
                    ldb      #$CC 
                    stb      <VIA_cntl 
                    ldd      #$8100 
                    std      <VIA_port_b 
                    deca     
                    sta      <VIA_port_b 
                    lda      #$82 
                    std      <VIA_port_b 
                    ldd      #$8300 
                    stb      <VIA_port_a 
                    sta      <VIA_port_b 
;
; ................ boss shooting
;
                    lda      bossPosY 
                    bmi      noNewShotBoss3 
                    dec      boss3LetterCannonWait 
                    bne      noNewShotBoss3 
                    ldx      boss3LetterCannonPointer 
                    ldy      ,x++ 
                    bne      shotBoss3Ok 
                    ldx      #boss3Shots 
                    ldy      ,x++ 
shotBoss3Ok 
                    lda      ,x+                          ; speed 3 (lower 4 nibbles), and target shot (upper 4 nibbles = 0) 
                    sta      isBugShot 
                    lda      ,x+                          ; wait for next shot 
                    sta      boss3LetterCannonWait 
 if  TEST_VOX = 1 
                    ldd      ,x++ 
                    std      vox_addr 
 endif  
                    stx      boss3LetterCannonPointer 
                    lda      playerXpos 
                    pshs     a 
                    suba     ,y+ 
                    bvc      boss3ysubok 
                    lda      #$80 
boss3ysubok 
                    sta      playerXpos 
nextLetterBoss3 
                    ldd      bossPosY                     ; add some value 
                    std      bulletSpawnAt 
                    jsr      spawnShot 
                    cmpx     #OBJECT_LIST_COMPARE_ADDRESS 
                    bls      noNewShotBoss3_a 
                    ldd      ,y++ 
                    std      BEHAVIOUR,x 
                    lda      playerXpos 
                    adda     #20 
                    bvc      boss3yaddok 
                    lda      #$7f 
boss3yaddok 
                    sta      playerXpos 
                    ldd      ,y 
                    bne      nextLetterBoss3 
noNewShotBoss3_a 
                    puls     a 
                    sta      playerXpos 
noNewShotBoss3 
;
; ................ boss shooting done
;
; display other objects/shots
; boss two HAS no enemies!
;                    lda      #DEFAULT_ENEMY_INTENSITY 
;                    _INTENSITY_A  
;                    lds      enemylist_objects_head 
;                    puls     d,pc                           ; (D = y,x) ; do all objects 
enemies_done_boss3 
                    lda      #$7f 
                    _INTENSITY_A  
                    lds      shotlist_objects_head 
                    puls     d,pc                         ; jumps back to enemiesShots_done_boss3 = main1Boss3 
;
; .....................................................
;
; boss 3 movement list
boss3MoveData 
                    dw       sinDif0Move 
                    dw       sinDif1Move 
                    dw       sinDif3Move 
                    dw       sinDif2Move 
                    dw       sinDif3Move 
                    dw       0 
                    dw       0 
                    dw       0 
                    dw       0 
                    dw       0 
sinDif3Move 
                    db       110, -110 ,8 
                    db       -120,-110, 4 
                    db       110, -110 ,4 
                    db       110, 0 ,8 
                    db       -120 ,0, 4 
                    db       110, 0 ,4 
                    db       110, 110 ,8 
                    db       -120 ,110, 4 
                    db       110, 110 ,4 
                    db       110, 0 ,8 
                    db       -120 ,0, 4 
                    db       110, 0 ,4 
                    db       0,0 
sinDif2Move 
                    db       110,-110,4                   ; y,x,speed 
                    db       0, 110,4                     ; y,x,speed 
                    db       0,-110,4                     ; y,x,speed 
                    db       0, 110,4                     ; y,x,speed 
                    db       0,-110,4                     ; y,x,speed 
                    db       1,1 ,8 
                    db       -120 ,0, 8 
                    db       1,1 ,4 
                    db       120,110,4                    ; y,x,speed 
                    db       0,0 
sinDif1Move 
                    db       110,-110,4                   ; y,x,speed 
                    db       0, 110,4                     ; y,x,speed 
                    db       -120,-110,4                  ; y,x,speed 
                    db       20, 20,4                     ; y,x,speed 
                    db       20,-20,2                     ; y,x,speed 
                    db       20, 20,2                     ; y,x,speed 
                    db       20,-20,2                     ; y,x,speed 
                    db       110,110,4                    ; y,x,speed 
                    db       0,0 
sinDif0Move 
; org
                    db       110,-110,3                   ; y,x,speed 
                    db       10, 110,4                    ; y,x,speed 
                    db       -120, 80,4                   ; y,x,speed 
                    db       10, 110,3                    ; y,x,speed 
                    db       110,-110,2                   ; y,x,speed 
                    db       110,110,1                    ; y,x,speed 
                    db       0,0 
; boss 3 "shots"
boss3Run 
                    db       20                           ; how far backwards from curretn player X, des the first letter hit (increased by 20) 
                    dw       letter_R_AtPlayerBehaviour 
                    dw       letter_U_AtPlayerBehaviour 
                    dw       letter_N_AtPlayerBehaviour 
                    dw       0 
boss3Run2 
                    db       20                           ; how far backwards from curretn player X, des the first letter hit (increased by 20) 
                    dw       letter_R_AtPlayerBehaviour 
                    dw       letter_U_AtPlayerBehaviour 
                    dw       letter_N_AtPlayerBehaviour 
                    dw       letter_SIGN_AtPlayerBehaviour, 0 
                    dw       0 
boss3Coward 
                    db       60                           ; how far backwards from curretn player X, des the first letter hit (increased by 20) 
                    dw       letter_C_AtPlayerBehaviour, letter_O_AtPlayerBehaviour, letter_W_AtPlayerBehaviour 
                    dw       letter_A_AtPlayerBehaviour, letter_R_AtPlayerBehaviour, letter_D_AtPlayerBehaviour, 0 
boss3IHUNGER 
                    db       60                           ; how far backwards from curretn player X, des the first letter hit (increased by 20) 
                    dw       letter_I_AtPlayerBehaviour, letter_SPACE_AtPlayerBehaviour, letter_H_AtPlayerBehaviour 
                    dw       letter_U_AtPlayerBehaviour, letter_N_AtPlayerBehaviour, letter_G_AtPlayerBehaviour 
                    dw       letter_E_AtPlayerBehaviour, letter_R_AtPlayerBehaviour, 0 
boss3BEWARE 
                    db       70                           ; how far backwards from curretn player X, des the first letter hit (increased by 20) 
                    dw       letter_B_AtPlayerBehaviour, letter_E_AtPlayerBehaviour, letter_W_AtPlayerBehaviour, letter_A_AtPlayerBehaviour 
                    dw       letter_R_AtPlayerBehaviour, letter_E_AtPlayerBehaviour, letter_SIGN_AtPlayerBehaviour, 0 
;//"Beware, I live!", "I hunger, coward!", "I am Sinistar!", "Run! Run! Run!", "Beware, coward!", "I hunger!", "Run, coward!", and a loud roaring sound.
; shot structs
 if  TEST_VOX = 1 
boss3Shots 
                    dw       boss3Run 
                    db       2, 30                        ; speed, rounds to wait, till next 
REPLACE_0_2_voxRun_varFromIRQ0_1  dw  0 
                    dw       boss3Run 
                    db       3, 30                        ; speed, rounds to wait, till next 
REPLACE_0_2_voxRun_varFromIRQ0_2  dw  0 
                    dw       boss3Run2 
                    db       4, 100                       ; speed, rounds to wait, till next 
REPLACE_0_2_voxRun_varFromIRQ0_3  dw  0 
                    dw       boss3Coward 
                    db       3, 100                       ; speed, rounds to wait, till next 
REPLACE_0_2_voxCoward_varFromIRQ0_1  dw  0 
                    dw       boss3IHUNGER 
                    db       3, 100                       ; speed, rounds to wait, till next 
REPLACE_0_2_voxIHunger_varFromIRQ0_1  dw  0 
                    dw       boss3BEWARE 
                    db       2, 100                       ; speed, rounds to wait, till next 
REPLACE_0_2_voxBeware_varFromIRQ0_1  dw  0 
                    dw       0                            ; repeat 
 else  
boss3Shots 
                    dw       boss3Run 
                    db       2, 30                        ; speed, rounds to wait, till next 
                    dw       boss3Run 
                    db       3, 30                        ; speed, rounds to wait, till next 
                    dw       boss3Run2 
                    db       4, 100                       ; speed, rounds to wait, till next 
                    dw       boss3Coward 
                    db       3, 100                       ; speed, rounds to wait, till next 
                    dw       boss3IHUNGER 
                    db       3, 100                       ; speed, rounds to wait, till next 
                    dw       boss3BEWARE 
                    db       2, 100                       ; speed, rounds to wait, till next 
                    dw       0                            ; repeat 
 endif  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Boss fight done
extroBoss3                                                ;#isfunction  
                    lda      #3 
                    sta      explosionCount 
                    ldx      #extro3PointerSUB 
                    stx      bossExtroPointer 
                    jmp      extroBoss 

extro3PointerSUB 
REPLACE_1_2_displayBoss3001_varFrom0_1                    ;  bank 0 replace 
                    ldx      #0                           ; displayBoss3001 
                    jmp      jsrBank0X 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 endif  
 if  CURRENT_BANK = 2 
;;;;;;; *****************************************
;;;;;;; * BANK 2 *
;;;;;;; *****************************************
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
displayFullSinistar 
                    jsr      calibrationZero50 
                    clra     
                    ldb      gameScale 
                    sta      <VIA_shift_reg 
                    LDA      #$CC 
                    STA      VIA_cntl                     ;/BLANK low and /ZERO low 
                    stB      VIA_t1_cnt_lo 
                    ldd      #0 
                    std      <VIA_port_b 
;.....................
                    LDY      #SinistarMain                ; address of data 
nextBoss3Part_a 
                    ldu      ,y++ 
                    beq      headDoneBoss3 
                    ldb      gameScale 
                    stB      VIA_t1_cnt_lo 
                    ldd      bossPosY 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    jsr      my_Moveto_d                  ; Moveto_d 
 else  
                    JSR      Moveto_d 
 endif  
                    lda      #50 
                    sta      VIA_t1_cnt_lo 
                    jsr      SMVB50_drawSmart             ; uses Y now 
                    bra      nextBoss3Part_a 

headDoneBoss3 
;.....................
                    LDY      #SinistarAttachments         ; address of data 
                    lda      boss3ShieldCount 
                    lsla     
                    leay     a,y 
                    tst      boss3AttachmentScale 
                    beq      nodecBoss3 
                    dec      boss3AttachmentScale 
nodecBoss3 
nextBoss3Part_b 
                    ldu      ,y++ 
                    beq      attachmentsDoneBoss3 
                    ldb      gameScale 
                    stB      VIA_t1_cnt_lo 
                    ldd      bossPosY 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    jsr      my_Moveto_d                  ; Moveto_d 
 else  
                    JSR      Moveto_d 
 endif  
                    ldb      boss3AttachmentScale 
                    beq      noAttachmentFlying 
                    stB      VIA_t1_cnt_lo 
                    lda      ,u 
                    ldb      2,u 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    jsr      my_Moveto_d                  ; Moveto_d 
 else  
                    JSR      Moveto_d 
 endif  
noAttachmentFlying 
                    lda      #50 
                    sta      VIA_t1_cnt_lo 
                    jsr      SMVB50_drawSmart 
                    bra      nextBoss3Part_b 

attachmentsDoneBoss3 
;.....................
                    ldb      gameScale 
                    stB      VIA_t1_cnt_lo 
                    ldd      bossPosY 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    jsr      my_Moveto_d                  ; Moveto_d 
 else  
                    JSR      Moveto_d 
 endif  
                    LDY      #SinistarMouthAnim 
                    tst      animDelayCounter 
                    bne      notAnimNextBoss3 
                    inc      boss3MouthAnimCounter 
                    lda      boss3MouthAnimCounter 
                    lsla     
                    ldu      a,y 
                    bne      notAnimNextBoss3 
                    clr      boss3MouthAnimCounter 
notAnimNextBoss3 
                    lda      boss3MouthAnimCounter 
                    lsla     
                    ldu      a,y 
                    lda      #50 
                    sta      VIA_t1_cnt_lo 
                    jsr      SMVB50_drawSmart 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
displayBoss3 
displayBoss3_0_0                                          ;#isfunction  
                    sts      tmp4 
                    lda      #$60 
                    _INTENSITY_A  
                    lds      playershotlist_objects_head 
                    puls     d,pc                         ; (D = y,x) ; do all objects 
playerShotsDoneBoss03 
                    lds      tmp4 
; check if boss was hit (change intensity)
                    tst      bossWasHit 
                    beq      boss3NotHit 
                    jsr      Intensity_7F 
                    bra      intDoneBoss3 

boss3NotHit 
                    jsr      Intensity_3F 
intDoneBoss3 
                    jsr      bossDisplayHead 
displayBoss3001                                           ;#isfunction  
displayBoss3_0_0_1                                        ;#isfunction  
                    jsr      calibrationZero50 
                    clra     
                    ldb      gameScale 
                    sta      <VIA_shift_reg 
                    LDA      #$CC 
                    STA      VIA_cntl                     ;/BLANK low and /ZERO low 
                    stB      VIA_t1_cnt_lo 
                    ldd      #0 
                    std      <VIA_port_b 
                    clr      boss3AttachmentScale 
                    ldd      bossPosY 
                    jsr      displayFullSinistar 
                    jsr      calibrationZero7 
                    rts      

 endif  
 if  CURRENT_BANK = 0 
;;;;;;; *****************************************
;;;;;;; * BANK 0 *
;;;;;;; *****************************************
doBoss3Intro00                                            ;#isfunction  
doBoss3Intro0_0                                           ;#isfunction  
                    ldd      #$3000 
                    std      bossPosY 
                    clr      boss3MouthAnimCounter 
                    lda      #$70 
                    sta      boss3AttachmentScale 
REPLACE_1_2_boss3Music_varFromIRQ1_1 
                    ldu      #0                           ; ; boss3Music 
REPLACE_1_2_PLYINIT_varFromIRQ1_8 
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
boss3IntroLoop 
                    JSR      Wait_Recal_noShift           ; Vectrex BIOS recalibration 
;                    jsr      Intensity_5F 
                    jsr      Intensity_3F 
REPLACE_1_2_playAKSMusicNoLoop_varFromIRQ1_73 
                    ldx      #0                           ; playAKSMusicNoLoop 
                    jsr      jsrBank1_fromBank0_T1 
                    jsr      calibrationZero50 
                    LDy      #SinsitarIntroMain           ; address of data 
nextScenePart_b3: 
                    lda      #50 
                    sta      VIA_t1_cnt_lo 
                    LDU      ,y++ 
                    beq      contBoss3Draw 
                    clra     
                    ldb      introBossX 
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    MY_MOVE_TO_D_END  
                    jsr      SMVB50_drawSmart 
                    BRA      nextScenePart_b3 

contBoss3Draw 
                    lda      bossIntroStage 
                    cmpa     #1 
                    beq      middleMouth 
                    cmpa     #2 
                    beq      closedMouth 
                    LDy      #SinsitarIntroClosed         ; address of data 
                    bra      MouthCont 

middleMouth 
                    ldy      #SinsitarIntroMiddle 
                    bra      MouthCont 

closedMouth 
                    LDy      #SinsitarIntroOpen           ; address of data 
; #0 open
; #1 half
; #2 closed
MouthCont 
nextScenePart_b3o: 
                    lda      #50 
                    sta      VIA_t1_cnt_lo 
                    LDU      ,y++ 
                    beq      contBoss3ODraw 
                    clra     
                    ldb      introBossX 
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    MY_MOVE_TO_D_END  
                    jsr      SMVB50_drawSmart 
                    BRA      nextScenePart_b3o 

contBoss3ODraw 
                    jsr      drawBossPlayerOnly 
                    lda      Vec_Loop_Count+1 
                    anda     #%00000011 
                    bne      noPosChangeB3 
                    ldb      introBossX 
                    beq      noPosChangeB3 
                    inc      introBossX 
                    dec      introPlayerX 
noPosChangeB3 
                    ldb      scoopEnemy1 
                    beq      noWait_b3 
                    dec      scoopEnemy1 
                    lda      scoopEnemy1 
                    cmpa     #100 
                    bne      no100_sin 
                    inc      bossIntroStage 
no100_sin 
                    cmpa     #50 
                    bne      no50_sin 
                    inc      bossIntroStage 
no50_sin 
                    jmp      boss3IntroLoop 

noWait_b3 
REPLACE_1_2_getButtonState_varFromIRQ1_29 
                    ldx      #0                           ; getButtonState 
                    jsr      jsrBank1_fromBank0_T1 
                    ldb      current_button_state 
                    andb     #3 
                    CMPB     #$01                         ; pressed, but last time was unpressed 
                    lbne     boss3IntroLoop 
                    rts      

SinsitarIntroClosed 
                    DW       SinsitarIntroClosed_0        ; list of all single vectorlists in this 
                    DW       SinsitarIntroClosed_1 
                    DW       SinsitarIntroClosed_2 
                    DW       0 
SinsitarIntroClosed_0 
                    db       $40, $01, -$12, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       -$2C, $01, $06, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$25, $01, $14, hi(SMVB50_continue7_single), lo(SMVB50_continue7_single) 
                    db       $11, $01, $02 
                    db       -$12, $01, $08 
                    db       -$04, $01, $16 
                    db       $02, $01, $10 
                    db       $10, $01, $0F 
                    db       -$24, $01, -$07 
                    db       $04, $01, -$18, hi(SMVB50_continue5_single), lo(SMVB50_continue5_single) 
                    db       -$04, $01, -$1E 
                    db       $31, $01, -$2D 
                    db       $09, $01, -$13 
                    db       $05, $01, $11 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
SinsitarIntroClosed_1 
                    db       $36, $01, $2B, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $0B, $01, -$04, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $09, $01, $10, hi(SMVB50_continue3_single), lo(SMVB50_continue3_single) 
                    db       $04, $01, -$0A 
                    db       $12, $01, $04 
                    db       $01, $01, $08, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$25, $01, $1D, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$05, $01, -$0E, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
SinsitarIntroClosed_2 
                    db       $15, $01, -$4C, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       -$36, $01, -$14, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$27, $01, -$51, hi(SMVB50_continue4_single), lo(SMVB50_continue4_single) 
                    db       $00, $01, $30 
                    db       $23, $01, $50 
                    db       $26, $01, $0D 
                    db       $0B, $01, $3B, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$2E, $01, -$14, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $26, $01, -$0D, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$2C, $01, -$11, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$23, $01, -$4B, hi(SMVB50_continue6_single), lo(SMVB50_continue6_single) 
                    db       $00, $01, $29 
                    db       $20, $01, $3E 
                    db       $09, $01, $03 
                    db       $02, $01, $05 
                    db       $30, $01, $16 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
SinsitarIntroMiddle 
                    DW       SinsitarIntroMiddle_0        ; list of all single vectorlists in this 
                    DW       SinsitarIntroMiddle_1 
                    DW       SinsitarIntroMiddle_2 
                    DW       0 
SinsitarIntroMiddle_0 
                    db       -$02, $01, -$51, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       -$1E, $01, -$0E, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$27, $01, -$51, hi(SMVB50_continue4_single), lo(SMVB50_continue4_single) 
                    db       $00, $01, $30 
                    db       $23, $01, $50 
                    db       $11, $01, $08 
                    db       $0A, $01, $37, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$18, $01, -$0C, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $0D, $01, -$17, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$13, $01, -$08, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$23, $01, -$4B, hi(SMVB50_continue6_single), lo(SMVB50_continue6_single) 
                    db       $00, $01, $29 
                    db       $20, $01, $3E 
                    db       $09, $01, $03 
                    db       $02, $01, $05 
                    db       $1B, $01, $0F 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
SinsitarIntroMiddle_1 
                    db       $26, $01, $25, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $0B, $01, -$04, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $09, $01, $10, hi(SMVB50_continue3_single), lo(SMVB50_continue3_single) 
                    db       $04, $01, -$0A 
                    db       $22, $01, $0A 
                    db       $01, $01, $08, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$25, $01, $1D, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$05, $01, -$0E, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
SinsitarIntroMiddle_2 
                    db       $40, $01, -$12, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       -$3C, $01, $04, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$25, $01, $14, hi(SMVB50_continue7_single), lo(SMVB50_continue7_single) 
                    db       $11, $01, $02 
                    db       -$12, $01, $08 
                    db       -$04, $01, $16 
                    db       $02, $01, $10 
                    db       $10, $01, $0F 
                    db       -$24, $01, -$07 
                    db       $04, $01, -$18, hi(SMVB50_continue5_single), lo(SMVB50_continue5_single) 
                    db       -$04, $01, -$1E 
                    db       $31, $01, -$2D 
                    db       $09, $01, -$13 
                    db       $05, $01, $11 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
SinsitarIntroOpen 
                    DW       SinsitarIntroOpen_0          ; list of all single vectorlists in this 
                    DW       SinsitarIntroOpen_1 
                    DW       SinsitarIntroOpen_2 
                    DW       0 
SinsitarIntroOpen_0 
                    db       $40, $01, -$12, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       -$48, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$25, $01, $14, hi(SMVB50_continue7_single), lo(SMVB50_continue7_single) 
                    db       $11, $01, $02 
                    db       -$12, $01, $08 
                    db       -$04, $01, $16 
                    db       $02, $01, $10 
                    db       $10, $01, $0F 
                    db       -$24, $01, -$07 
                    db       $04, $01, -$18, hi(SMVB50_continue5_single), lo(SMVB50_continue5_single) 
                    db       -$04, $01, -$1E 
                    db       $31, $01, -$2D 
                    db       $09, $01, -$13 
                    db       $05, $01, $11 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
SinsitarIntroOpen_1 
                    db       $1A, $01, $25, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $0B, $01, -$04, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $09, $01, $10, hi(SMVB50_continue3_single), lo(SMVB50_continue3_single) 
                    db       $04, $01, -$0A 
                    db       $2E, $01, $0A 
                    db       $01, $01, $08, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$25, $01, $1D, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$05, $01, -$0E, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
SinsitarIntroOpen_2 
                    db       -$04, $01, -$54, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       -$1D, $01, -$0C, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$27, $01, -$51, hi(SMVB50_continue4_single), lo(SMVB50_continue4_single) 
                    db       $00, $01, $30 
                    db       $23, $01, $50 
                    db       $09, $01, $03 
                    db       $00, $01, $32, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$05, $01, -$01, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $05, $01, -$17, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$0B, $01, -$08, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$23, $01, -$4B, hi(SMVB50_continue6_single), lo(SMVB50_continue6_single) 
                    db       $00, $01, $29 
                    db       $20, $01, $3E 
                    db       $09, $01, $03 
                    db       $02, $01, $05 
                    db       $17, $01, $0C 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
SinsitarIntroMain 
                    DW       SinsitarIntroMain_0          ; list of all single vectorlists in this 
                    DW       SinsitarIntroMain_1 
                    DW       SinsitarIntroMain_2 
                    DW       SinsitarIntroMain_3 
                    DW       SinsitarIntroMain_4 
                    DW       SinsitarIntroMain_5 
                    DW       SinsitarIntroMain_6 
                    DW       SinsitarIntroMain_7 
                    DW       0 
SinsitarIntroMain_0 
                    db       $4A, $01, -$7E, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $0C, $01, -$22, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $1D, $01, $36, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       -$02, $01, -$0F, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $40, $01, -$56, hi(SMVB50_startDraw_double), lo(SMVB50_startDraw_double) 
                    db       -$11, $01, $54, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       -$07, $01, $1E, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       -$11, $01, $06, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$06, $01, $21, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$0F, $01, $12, hi(SMVB50_continue3_single), lo(SMVB50_continue3_single) 
                    db       $00, $01, -$4A 
                    db       -$0A, $01, $18 
                    db       -$17, $01, $09, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$03, $01, -$06, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$05, $01, $0C, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
SinsitarIntroMain_1 
                    db       $51, $01, -$03, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $03, $01, $04, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$1C, $01, $16, hi(SMVB50_continue7_single), lo(SMVB50_continue7_single) 
                    db       -$03, $01, -$06 
                    db       $05, $01, -$01 
                    db       $06, $01, -$0B 
                    db       -$04, $01, -$04 
                    db       $08, $01, -$03 
                    db       $0B, $01, $07 
                    db       -$0A, $01, $00, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$02, $01, $03, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $11, $01, $22, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $4D, $01, -$22, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
SinsitarIntroMain_2 
                    db       $79, $01, -$07, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $24, $01, -$2F, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$0A, $01, $1F, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$1B, $01, $22 
                    db       $01, $01, -$12, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $ee, $01, $0B, hi(SMVB50_startDraw_newY_eq_oldX_single), lo(SMVB50_startDraw_newY_eq_oldX_single) ; y was -$12, now $ee 
                    db       $06, $01, $0B, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$08, $01, $0A, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$39, $01, $19, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $0B, $01, $0D, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $51, $01, $47, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$2E, $01, -$6A, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $ce, $01, $3B, hi(SMVB50_startMove_yStays_single), lo(SMVB50_startMove_yStays_single) ; y was -$2E, now $ce 
                    db       -$14, $01, $68, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$38, $01, -$73, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
SinsitarIntroMain_3 
                    db       $4A, $01, $4A, hi(SMVB50_continue_yEqx_single), lo(SMVB50_continue_yEqx_single) ; y is $4A 
                    db       -$06, $01, $29, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$13, $01, $00, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $01, $01, -$24 
                    db       -$0D, $01, -$0C, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $00, $01, $1E, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $05, $01, $04, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $1E, $01, $05, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $07, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $12, $01, -$16, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$07, $01, $1F, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $17, $01, $00, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $24, $01, -$2B, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$0D, $01, -$29, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
SinsitarIntroMain_4 
                    db       $43, $01, $12, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       -$08, $01, $02, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $08, $01, $03, hi(SMVB50_continue4_single), lo(SMVB50_continue4_single) 
                    db       $00, $01, $12 
                    db       -$08, $01, $02 
                    db       $08, $01, $05 
                    db       $03, $01, -$0C, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$01, $01, -$06, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$0A, $01, -$03, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $00, $01, $0B, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$05, $01, -$18, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $08, $01, -$05, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$05, $01, -$08, hi(SMVB50_continue_newY_eq_oldX_single), lo(SMVB50_continue_newY_eq_oldX_single) ; y is -$05 
                    db       $0A, $01, -$10, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $02, $01, -$05, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
SinsitarIntroMain_5 
                    db       $76, $01, -$07, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       -$1C, $01, $06, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $10, $01, $04, hi(SMVB50_continue7_single), lo(SMVB50_continue7_single) 
                    db       -$05, $01, $2B 
                    db       -$0F, $01, $04 
                    db       $16, $01, $0C 
                    db       $10, $01, $33 
                    db       $0C, $01, -$22 
                    db       $05, $01, $01 
                    db       $08, $01, -$08, hi(SMVB50_continue7_single), lo(SMVB50_continue7_single) 
                    db       $0B, $01, $08 
                    db       $1B, $01, -$0C 
                    db       -$0A, $01, -$08 
                    db       -$0F, $01, -$1D 
                    db       $2B, $01, -$1F 
                    db       $0F, $01, -$14 
                    db       -$05, $01, -$1E, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
SinsitarIntroMain_6 
                    db       $7A, $01, -$2D, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $5E, $01, -$65, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$42, $01, $20, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $5B, $01, $00, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$2F, $01, $34, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$06, $01, $29, hi(SMVB50_continue3_single), lo(SMVB50_continue3_single) 
                    db       $25, $01, -$33 
                    db       $10, $01, -$2A 
                    db       -$04, $01, $02, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$01, $01, -$11, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, -$1D, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$05, $01, -$19, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$1A, $01, -$2F, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
SinsitarIntroMain_7 
                    db       $53, $01, -$6F, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $04, $01, -$1F, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$21, $01, $00, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$03, $01, $52 
                    db       -$1F, $01, $1F, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0A, $01, -$71, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$1D, $01, $00, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$05, $01, $4C 
                    db       -$16, $01, $06, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $05, $01, -$49, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $0A, $01, $00, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $29, $01, $00, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0D, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 endif  
