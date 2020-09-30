; bank 2
; temporary RAM
pauseLineStart      =        laserLowestYRight 
pauseLineCount      =        laserLowestYLeft 
pauseLinePos        =        laserEnemyPointerRight 
lastPauseDir        =        laserLowestY 
pauseScrollOffsertY  =       laserEnemyPointerLeft 
PAUSE_SCROLL_OFFSET  =       40 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
TEST_PAUSE_WRITING  macro    
                    dec      pauseLineCount 
                    lbeq     pauseWritingDone 
                    endm     
;
; .....................................................
;
DEC_YPOS_to_d       macro    
                    TEST_PAUSE_WRITING  
                    ldd      pauseLinePos 
                    suba     #$10 
                    sta      pauseLinePos 
                    adda     pauseScrollOffsertY 
                    endm     
;
; .....................................................
;
LDD_CURRENT_SECONDARY_POS  macro  posx 
                    lda      pauseLinePos 
                    adda     pauseScrollOffsertY 
                    ldb      #posx 
                    endm     
;
; .....................................................
;
fillLevelString                                           ;#isfunction  
                    ldb      levelCount 
                    incb     
                    cmpb     #25 
                    ble      flsCont 
                    decb                                  ; correct boss 
                    cmpb     #50 
                    ble      flsCont 
                    decb                                  ; correct boss 
                    cmpb     #75 
                    ble      flsCont 
                    decb                                  ; correct boss 
flsCont 
fillLevelStringB 
                    sex      
                    ldu      #levelConversionString 
                    jsr      wordToDecString 
                    leau     3,u 
                    jsr      leadingZeroToSpace 
                    rts      

;
; .....................................................
;
; all possible stat "lines"
pstartLines 
                    dw       line14                       ; difficulty 
                    dw       line0_                       ; rank 
                    dw       line0                        ; level 
                    dw       line2                        ; lives 
                    dw       line1                        ; cash 
                    dw       line3 
                    dw       line4 
                    dw       line19_4 
                    dw       line5 
                    dw       line6 
                    dw       line7                        ; speed 
                    dw       line9                        ; Bullet 
                    dw       line8                        ; rate 
                    dw       line19_3 
                    dw       line19_5 
                    dw       line19_6 
                    dw       line9b 
                    dw       line10 
                    dw       line11 
                    dw       line12 
                    dw       line13 
                    dw       line19_1 
                    dw       line19_2 
                    dw       line19a 
                    dw       line20 
                    dw       line21 
                    dw       line22 
                    dw       line23 
                    dw       line24 
                    dw       line25 
                    dw       0 
DrunkString1 
                    db       "*Hicks* !",$80
DrunkString2 
                    db       "Nice ... bright bullets",$80
DrunkString3 
                    db       "... everywhere ...",$80
DrunkString4 
                    db       "so shiny.",$80
drunkenPause 
                    ldd      #$f850 
                    std      Vec_Text_HW 
                    JSR      getButtonState               ; get button status 
                    bita     #8                           ; button 4 unpause 
                    bne      drunkPauseCont 
                    lda      #$fb                         ;10 
                    sta      Vec_Text_HW 
REPLACE_1_2_main12_varFrom1_2                             ;  bank 1 replace 
                    ldx      #0                           ; main12 
                    jmp      jmpBank1X 

drunkPauseCont 
                    jsr      Intensity_5F 
                    lda      gameScale 
                    sta      <VIA_t1_cnt_lo 
                    ldd      #$4088 
                    ldu      #DrunkString1 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    ldd      #$2088 
                    ldu      #DrunkString2 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    ldd      #$1088 
                    ldu      #DrunkString3 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    ldd      #$0088 
                    ldu      #DrunkString4 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    ldd      #$e088 
                    ldu      #DrunkString1 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    bra      pauseLoop 

;
; .....................................................
;
pause00:                                                  ;#isfunction  
pause_0_0:                                                ;#isfunction  
                    JSR      Init_Music_Buf               ; shadow regs 
REPLACE_1_2_copySoundRegs_varFromIRQ1_5 
                    ldx      #0                           ; copySoundRegs 
                    jsr      jsrBank1_fromBank2_T1 
                    clr      pauseLineStart 
                    clr      lastPauseDir 
                    clr      pauseScrollOffsertY 
;;;;;
pauseLoop 
PSloop1 
                    lda      pauseScrollOffsertY 
                    beq      doNothingOffsetty 
                    bpl      decreaseOffsetPause 
                    inc      pauseScrollOffsertY 
                    inc      pauseScrollOffsertY 
                    bra      doNothingOffsetty 

decreaseOffsetPause 
                    dec      pauseScrollOffsertY 
                    dec      pauseScrollOffsertY 
doNothingOffsetty 
                    ldb      <VIA_t2_hi 
                    stb      t2_rest 
                    clra     
                    sta      <VIA_shift_reg 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    JSR      my_wait_recal                ;Wait_Recal 
 else  
                    JSR      Wait_Recal 
 endif  
                    tst      drunkTimer 
                    lbne     drunkenPause 
                    ldd      #$f850 
                    std      Vec_Text_HW 
                    lda      #5 
                    sta      pauseLineCount 
                    jsr      Joy_Digital_vertical_0_0 
                    lda      Vec_Joy_1_Y 
                    beq      clearPuaseChange 
                    cmpa     lastPauseDir 
                    beq      noJoyPauseChange 
                    tst      Vec_Joy_1_Y 
                    bpl      pauseDirDown 
pauseDirUp 
                    sta      lastPauseDir 
                    ldb      #5                           ; page scroll 5 lines per page 
scrollOnUp 
                    inc      pauseLineStart 
                    lda      pauseLineStart 
                    adda     #4 
                    ldx      #pstartLines 
                    lsla     
                    ldx      a,x 
                    bne      doPageScrollUp 
                    dec      pauseLineStart 
                    bra      noJoyPauseChange 

doPageScrollUp 
                    lda      #-PAUSE_SCROLL_OFFSET 
                    sta      pauseScrollOffsertY 
                    decb     
                    bne      scrollOnUp 
                    bra      noJoyPauseChange 

pauseDirDown 
                    sta      lastPauseDir 
                    lda      pauseLineStart 
                    lbeq     askSaveGame 
                    ldb      #5                           ; page scroll 5 lines per page 
scrollOnDown 
                    dec      pauseLineStart 
                    bpl      doPageScrollDown 
                    clr      pauseLineStart 
                    bra      noJoyPauseChange 

doPageScrollDown 
                    lda      #PAUSE_SCROLL_OFFSET 
                    sta      pauseScrollOffsertY 
                    decb     
                    bne      scrollOnDown 
                    bra      noJoyPauseChange 

clearPuaseChange 
                    sta      lastPauseDir 
noJoyPauseChange 
                    JSR      getButtonState               ; get button status 
                    bita     #1                           ; button 4 unpause 
                    bne      noPauseHelp 
REPLACE_1_2_showPSHelp_varFromIRQ0_1 
                    ldx      #0                           ;showPSHelp 
                    jmp      doShiftIRQ 

noPauseHelp 
                    bita     #8                           ; button 4 unpause 
                    bne      pauseCont 
 jmp backFromPause
;REPLACE_1_2_main12_varFrom1_1                             ;  bank 1 replace 
;                    ldx      #0                           ; main12 
;                    jmp      jmpBank1X 

;inStorageCont
pauseCont 
; Print highscore
REPLACE_1_2_displayScore_varFrom1_1                       ;  bank 1 replace 
                    ldx      #0                           ; displayScore 
                    jsr      jsrBank1X 
                    lda      #$5f 
                    _INTENSITY_A  
                    lda      gameScale 
                    sta      VIA_t1_cnt_lo 
; Print PAUSE
                    ldd      #$58d0                       ;6ad0 
                    ldu      #pauseString                 ;pauseString 
                    jsr      Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    lda      #$fb                         ;10 
                    sta      Vec_Text_HW 
                    lda      #5 
                    sta      pauseLineCount 
                    ldd      #$2690                       ;#$26a0 
                    std      pauseLinePos 
                    lda      pauseLineStart 
                    ldx      #pstartLines 
                    lsla     
                    leax     a,x 
                    ldd      pauseLinePos 
                    adda     pauseScrollOffsertY 
                    jmp      [,x] 

line14 
                    lda      difficulty 
                    anda     #0xf                         ; blend out "hardcore" 
                    bne      line15 
                    ldu      #pEasyString 
                    bra      difDone 

line15 
                    cmpa     #1 
                    bne      line16 
                    ldu      #pnormaString 
                    bra      difDone 

line16 
                    cmpa     #2 
                    bne      line17 
                    ldu      #phardString 
                    bra      difDone 

line17 
                    cmpa     #3 
                    bne      line18 
                    ldu      #pimpossibleString 
                    bra      difDone 

line18 
                    ldu      #psuperimpossibleString 
                    bra      difDone 

difDone 
                    ldd      pauseLinePos 
                    adda     pauseScrollOffsertY 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    DEC_YPOS_to_d  
line0_ 
                    lda      officerRankTmp 
                    ldu      #rankPointer 
                    lsla     
                    ldu      a,u 
                    ldd      pauseLinePos 
                    adda     pauseScrollOffsertY 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    DEC_YPOS_to_d  
line0 
; Print Level + number
;                    ldd      pauseLinePos 
                    ldu      #currentLeveString 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    jsr      fillLevelString 
                    lda      pauseLinePos 
                    LDD_CURRENT_SECONDARY_POS  $50 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    DEC_YPOS_to_d  
line2 
; print lives+ number
                    ldu      #LivesString                 ;LivesString 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    ldu      #playerLivesString 
                    LDD_CURRENT_SECONDARY_POS  $46 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    DEC_YPOS_to_d  
line1 
; Print Cash + number
                    tst      difficulty 
                    bmi      noChashDisplay 
                    ldu      #cashString                  ;cashString 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    ldd      playerCashW 
                    ldu      #StringOutputBuffer_4 
                    jsr      wordToDecString 
                    LDD_CURRENT_SECONDARY_POS  $30 
                    ldu      #StringOutputBuffer_4 
                    jsr      syncPrintStrd                ; Print5Strd 
noChashDisplay 
                    _ZERO_VECTOR_BEAM  
                    DEC_YPOS_to_d  
line3 
; print shots fired + number
                    ldu      #shotsFiredString            ;shotsFiredString 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    ldd      playerShotCountW 
                    ldu      #StringOutputBuffer_4 
                    jsr      wordToDecString 
                    LDD_CURRENT_SECONDARY_POS  $30 
                    ldu      #StringOutputBuffer_4 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    DEC_YPOS_to_d  
line4 
; print enemies hit + number
                    ldu      #enemiesHitString            ;enemiesHitString 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    ldd      playerHitCountW 
                    ldu      #StringOutputBuffer_4 
                    jsr      wordToDecString 
                    LDD_CURRENT_SECONDARY_POS  $30 
                    ldu      #StringOutputBuffer_4 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    DEC_YPOS_to_d  
line19_4 
; WEAPON
                    lda      playerNumberOfBulletsPerShot 
                    deca     
                    lsla     
                    ldu      #Weapons 
                    ldu      a,u 
                    ldd      pauseLinePos 
                    adda     pauseScrollOffsertY 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    DEC_YPOS_to_d  
line5 
; print timer + number
                    ldu      #timerString2                ;timerString2 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    ldd      bonusTimerLength 
                    MY_LSL_D                              ; *2 (/ 100 - but that is only leave out the last two 00 from printing! 
                    ldu      #StringOutputBuffer_4 
                    jsr      wordToDecString 
                    jsr      leadingZeroToSpace 
                    ldd      StringOutputBuffer_3 
                    std      StringOutputBuffer_1 
                    lda      StringOutputBuffer_4 
                    sta      StringOutputBuffer_2 
                    ldd      #$2020 
                    std      StringOutputBuffer_4 
                    LDD_CURRENT_SECONDARY_POS  $30 
                    ldu      #StringOutputBuffer_4 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    DEC_YPOS_to_d  
line6 
; Print power + number
;                    ldd      pauseLinePos 
                    ldu      #powerString 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    clra     
                    ldb      bulletDamage 
                    ldu      #StringOutputBuffer_4 
                    jsr      wordToDecString 
                    jsr      leadingZeroToSpace 
                    LDD_CURRENT_SECONDARY_POS  $30 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    DEC_YPOS_to_d  
line7 
; Print speed + number
;                    ldd      pauseLinePos 
                    ldu      #shipSpeedString 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    ldd      playerSpeed 
                    ldu      #StringOutputBuffer_4 
                    jsr      wordToDecString 
                    jsr      leadingZeroToSpace 
                    LDD_CURRENT_SECONDARY_POS  $30 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    DEC_YPOS_to_d  
line9 
; Print bullets + number
                    ldu      #bulletsString 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    clra     
                    ldb      playerMaxShotInAir 
                    ldu      #StringOutputBuffer_4 
                    jsr      wordToDecString 
                    jsr      leadingZeroToSpace 
                    LDD_CURRENT_SECONDARY_POS  $30 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    DEC_YPOS_to_d  
line8 
; Print rate + number
;                    ldd      pauseLinePos 
                    ldu      #rateString 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    ldd      playerShotSpeed 
                    ldu      #StringOutputBuffer_4 
                    jsr      wordToDecString 
                    jsr      leadingZeroToSpace 
                    LDD_CURRENT_SECONDARY_POS  $30 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    DEC_YPOS_to_d  
line19_3 
; RANK MARKER
                    ldu      #rankMarkerString 
;                    ldd      pauseLinePos 
                    jsr      syncPrintStrd                ; Print5Strd ; Print5Strd 5Strd 
                    _ZERO_VECTOR_BEAM  
                    ldb      smartBombsAvailable 
                    clra     
                    ldu      #StringOutputBuffer_6 
                    lda      rankCollected 
                    bita     #COLLECTED_RANK1 
                    bne      rank1Collected 
                    ldb      # '0'
                    bra      rank1BuildDone 

rank1Collected 
                    ldb      # '1'
rank1BuildDone 
                    stb      ,u+ 
                    bita     #COLLECTED_RANK2 
                    bne      rank2Collected 
                    ldb      # '0'
                    bra      rank2BuildDone 

rank2Collected 
                    ldb      # '1'
rank2BuildDone 
                    stb      ,u+ 
                    bita     #COLLECTED_RANK3 
                    bne      rank3Collected 
                    ldb      # '0'
                    bra      rank3BuildDone 

rank3Collected 
                    ldb      # '1'
rank3BuildDone 
                    stb      ,u+ 
                    bita     #COLLECTED_RANK4 
                    bne      rank4Collected 
                    ldb      # '0'
                    bra      rank4BuildDone 

rank4Collected 
                    ldb      # '1'
rank4BuildDone 
                    stb      ,u+ 
                    bita     #COLLECTED_RANK5 
                    bne      rank5Collected 
                    ldb      # '0'
                    bra      rank5BuildDone 

rank5Collected 
                    ldb      # '1'
rank5BuildDone 
                    stb      ,u+ 
                    bita     #COLLECTED_RANK6 
                    bne      rank6Collected 
                    ldb      # '0'
                    bra      rank6BuildDone 

rank6Collected 
                    ldb      # '1'
rank6BuildDone 
                    stb      ,u+ 
                    ldb      #$80 
                    stb      ,u+ 
                    ldu      #StringOutputBuffer_6 
                    LDD_CURRENT_SECONDARY_POS  $25 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    DEC_YPOS_to_d  
line19_5 
; ARMOR/SHIELD/SUCKING
BITFIELD_ARMOR      =        $80 
BITFIELD_SHIELD     =        $40 
BITFIELD_SCOOP      =        $20 
BITFIELD_NOT_SCOOP  =        $ff-$20 
;
;
                    lda      playerBonusActive 
                    cmpa     #$80 
                    bne      notArmor 
                    ldu      #armorPauseString 
                    bra      print19_5 

notArmor 
                    cmpa     #$40 
                    bne      notShield 
                    ldu      #shieldPauseString 
                    bra      print19_5 

notShield 
                    cmpa     #$20 
                    bne      notScoop 
                    ldu      #scoopPauseString 
                    bra      print19_5 

notScoop 
                    ldu      #secretUNKOWN2 
print19_5 
                    ldd      pauseLinePos 
                    adda     pauseScrollOffsertY 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    DEC_YPOS_to_d  
line19_6 
; AUTOFIRE
                    ldb      diverseFlags 
                    andb     #BIT_FLAG_AUTOFIRE 
                    beq      line20_6 
                    ldu      #autofirePauseString 
                    bra      line20_6a 

line20_6 
                    ldu      #noautofirePauseString 
line20_6a 
                    ldd      pauseLinePos 
                    adda     pauseScrollOffsertY 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    DEC_YPOS_to_d  
;
line9b 
                    ldu      #secretUNKOWN 
                    ldb      lockPurchased 
                    andb     #%00100000 
                    beq      line9b_1 
                    ldu      #pScoopShieldString 
line9b_1 
                    ldd      pauseLinePos 
                    adda     pauseScrollOffsertY 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    DEC_YPOS_to_d  
line10 
; Print bullets + immunity 1
                    ldu      #secretUNKOWN 
                    lda      downgradeImmunity 
                    anda     #IMUNITY_BITS 
                    beq      line10_unkown 
                    ldu      #immunity1String             ; 
line10_unkown 
                    ldd      pauseLinePos 
                    adda     pauseScrollOffsertY 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    DEC_YPOS_to_d  
line11 
; Print bullets + immunity 2
                    ldu      #secretUNKOWN 
                    lda      downgradeImmunity 
                    anda     #IMUNITY_2 
                    cmpa     #2 
                    bne      line11_unkown 
                    ldu      #immunity2String_            ; 
line11_unkown 
                    ldd      pauseLinePos 
                    adda     pauseScrollOffsertY 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    DEC_YPOS_to_d  
; Weapon lock
line12 
                    ldb      lockPurchased 
                    andb     #%00001111 
                    beq      line12_unkown 
                    ldd      pauseLinePos 
                    adda     pauseScrollOffsertY 
                    ldu      #wlockString 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    clra     
                    ldb      lockPurchased 
                    andb     #%00001111 
                    ldu      #StringOutputBuffer_4 
                    jsr      wordToDecString 
                    jsr      leadingZeroToSpace 
                    LDD_CURRENT_SECONDARY_POS  $30 
                    bra      line13_a 

line12_unkown 
                    ldd      pauseLinePos 
                    adda     pauseScrollOffsertY 
                    ldu      #secretUNKOWN 
line13_a 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    DEC_YPOS_to_d  
;
line13 
                    ldu      #secretUNKOWN 
                    ldb      lockPurchased 
                    andb     #%00010000 
                    beq      line13_unkown 
                    ldu      #slockString 
line13_unkown 
                    ldd      pauseLinePos 
                    adda     pauseScrollOffsertY 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    DEC_YPOS_to_d  
line19_1 
                    lda      inGameSecrets 
                    anda     #SECRET_3_BULLET_SUCKERS 
                    beq      line19_1_unkown 
                    ldu      #superBombsAvailable 
                    ldd      pauseLinePos 
                    adda     pauseScrollOffsertY 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    ldb      smartBombsAvailable 
                    clra     
                    ldu      #StringOutputBuffer_4 
                    jsr      wordToDecString 
                    jsr      leadingZeroToSpace 
                    LDD_CURRENT_SECONDARY_POS  $30 
                    bra      line19_2a 

line19_1_unkown 
                    ldu      #secretUNKOWN 
                    ldd      pauseLinePos 
                    adda     pauseScrollOffsertY 
line19_2a 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    DEC_YPOS_to_d  
line19_2 
                    lda      inGameSecrets 
                    anda     #SECRET_3_BULLET_SUCKERS 
                    beq      line19_2_unkown 
                    ldu      #superDiamondsCollected 
                    ldd      pauseLinePos 
                    adda     pauseScrollOffsertY 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    ldb      diamondCount 
                    clra     
                    ldu      #StringOutputBuffer_4 
                    jsr      wordToDecString 
                    jsr      leadingZeroToSpace 
                    LDD_CURRENT_SECONDARY_POS  $30 
                    bra      line19a_a 

line19_2_unkown 
                    ldu      #secretUNKOWN 
                    ldd      pauseLinePos 
                    adda     pauseScrollOffsertY 
line19a_a 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    DEC_YPOS_to_d  
line19a 
                    ldu      #secretUNKOWN 
                    lda      inGameSecrets 
                    anda     #SECRET_RATE_SUCKERS 
                    beq      line19a_unkown 
                    ldu      #secretSuperBomb 
line19a_unkown 
                    ldd      pauseLinePos 
                    adda     pauseScrollOffsertY 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    DEC_YPOS_to_d  
line20 
                    ldu      #secretUNKOWN 
                    lda      inGameSecrets 
                    anda     #SECRET_ORDERED_EXTRA 
                    beq      line20_unkown 
                    ldu      #secretLaser 
line20_unkown 
                    ldd      pauseLinePos 
                    adda     pauseScrollOffsertY 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    DEC_YPOS_to_d  
line21 
                    ldu      #secretUNKOWN 
                    lda      inGameSecrets 
                    anda     #SECRET_3_SPEED_SUCKERS 
                    beq      line21_unkown 
                    ldu      #secretshield 
line21_unkown 
                    ldd      pauseLinePos 
                    adda     pauseScrollOffsertY 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    DEC_YPOS_to_d  
line22 
                    ldu      #secretUNKOWN 
                    lda      inGameSecrets 
                    anda     #SECRET_3_BULLET_SUCKERS 
                    beq      line22_unkown 
                    ldu      #secretStatus 
line22_unkown 
                    ldd      pauseLinePos 
                    adda     pauseScrollOffsertY 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    DEC_YPOS_to_d  
line23 
                    ldu      #secretUNKOWN 
                    lda      inGameSecrets 
                    anda     #SECRET_3_RATE_SUCKERS 
                    beq      line23_unkown 
                    ldu      #secretDodger2 
line23_unkown 
                    ldd      pauseLinePos 
                    adda     pauseScrollOffsertY 
                    jsr      syncPrintStrd                ; Print5Strd ; Print5Strd nt5Strd 
                    _ZERO_VECTOR_BEAM  
                    DEC_YPOS_to_d  
line24 
                    ldu      #secretUNKOWN 
                    lda      inGameSecrets 
                    anda     #SECRET_ORDERED_RANKS 
                    beq      line24_unkown 
                    ldu      #secretDodger5 
line24_unkown 
                    ldd      pauseLinePos 
                    adda     pauseScrollOffsertY 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    DEC_YPOS_to_d  
line25 
                    ldu      #secretUNKOWN 
                    lda      inGameSecrets 
                    anda     #SECRET_3_FIFTY 
                    beq      line25_unkown 
                    ldu      #secretPayback 
line25_unkown 
                    ldd      pauseLinePos 
                    adda     pauseScrollOffsertY 
                    jsr      syncPrintStrd                ; Print5Strd 
                    _ZERO_VECTOR_BEAM  
                    DEC_YPOS_to_d  
line26 
pauseWritingDone 
                    jsr      calibrationZero7 
                    lda      gameScale 
                    sta      <VIA_t1_cnt_lo 
                    lda      pauseLineStart 
                    cmpa     #$19 
                    beq      noPageDown 
                    lda      pauseScrollOffsertY 
                    bpl      noHiIntDown 
;                    jsr      Intensity_7F // intensity is taboo it destroys patterns
                    lda      #$7f 
                    _INTENSITY_A  
noHiIntDown 
                    ldd      #$a060 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    jsr      my_Moveto_d                  ; Moveto_d 
 else  
                    JSR      Moveto_d 
 endif  
                    lda      #7 
                    sta      <VIA_t1_cnt_lo 
                    ldu      #arrowDoubleDown 
                    jsr      SMVB_drawSmart 
                    lda      pauseLineStart 
                    lbeq     updiskDraw 
noPageDown 
                    lda      gameScale 
                    sta      <VIA_t1_cnt_lo 
                    lda      pauseScrollOffsertY 
                    bmi      noHiIntUp 
                    beq      noHiIntUp 
;                    jsr      Intensity_7F // intensity is taboo it destroys patterns
                    lda      #$7f 
                    _INTENSITY_A  
                    bra      passedHiINt 

noHiIntUp 
;                    jsr      Intensity_3F // intensity is taboo it destroys patterns
                    lda      #$3f 
                    _INTENSITY_A  
passedHiINt 
                    ldd      #$5860 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    jsr      my_Moveto_d                  ; Moveto_d 
 else  
                    JSR      Moveto_d 
 endif  
                    lda      #7 
                    sta      <VIA_t1_cnt_lo 
                    ldu      #arrowDoubleUp 
                    jsr      SMVB_drawSmart 
                    jmp      pauseLoop 

updiskDraw 
 if  RECORD_GAME_DATA 
 else  
                    lda      gameScale 
                    sta      <VIA_t1_cnt_lo 
                    lda      #$3f 
                    _INTENSITY_A  
                    ldd      #$5860 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    jsr      my_Moveto_d                  ; Moveto_d 
 else  
                    JSR      Moveto_d 
 endif  
                    lda      #7 
                    sta      <VIA_t1_cnt_lo 
                    ldu      #UpDisk 
                    jsr      SMVB_drawSmart 
 endif  
                    jmp      pauseLoop 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
arrowDoubleDown 
;                    db       $00, $01, $50, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
;                    db       -$50, $01, -$50, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
;                    db       $50, $01, -$50 
;                    db       $53, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
;                    db       $00, $01, $50, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
;                    db       -$50, $01, -$50, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
;                    db       $50, $01, -$50 
;                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
arrowDown 
                    db       -$50, $01, $50, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $50, $01, $50, hi(SMVB_continue_newY_eq_oldX_single), lo(SMVB_continue_newY_eq_oldX_single) ; y is $50 
                    db       $00, $01, -$50, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
arrowDoubleUp 
;                    db       $00, $01, $50, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
;                    db       $50, $01, -$50, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
;                    db       -$50, $01, -$50 
;                    db       -$53, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
;                    db       $00, $01, $50, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
;                    db       $50, $01, -$50, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
;                    db       -$50, $01, -$50 
;                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
arrowUp 
                    db       $50, $01, $50, hi(SMVB_startDraw_yEqx_single), lo(SMVB_startDraw_yEqx_single) ; y is $50 
                    db       -$50, $01, $50, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$50, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
UpDisk 
                    db       -$42, $01, $44, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, $10, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0A, $01, $00, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $00, $01, -$10 
                    db       $0A, $01, $00 
                    db       -$0C, $01, -$4F, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       $00, $01, $5B, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $5B, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $00, $01, -$5B, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$5B, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $57, $01, $37, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       $00, $01, $18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$30, $01, $00, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $00, $01, -$18 
                    db       $30, $01, $00 
                    db       $07, $01, $23, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$3F, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$69, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $3F, $01, $00 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
pauseString 
                    db       "PAUSE",$80
currentLeveString 
                    db       "Level",$80
shotsFiredString 
                    db       "Shots fired",$80
timerString2 
                    db       "Timer",$80
enemiesHitString 
                    db       "Enemies hit",$80
ratioString 
                    db       "Ratio",$80
cashString 
                    db       "Cash",$80
LivesString 
                    db       "Lives",$80
powerString 
                    db       "Power",$80
shipSpeedString 
                    db       "Speed",$80
rateString 
                    db       "Rate",$80
bulletsString 
                    db       "Bullets",$80
immunity1String 
                    db       "Immunity 1",$80
immunity2String_ 
                    db       "Immunity 2",$80
wlockString 
                    db       "Weapon lock",$80
slockString 
                    db       "Scoopy lock",$80
pAutofireString 
                    db       "Autofire",$80
pScoopShieldString 
                    db       "Scoopy shield",$80
pEasyString 
                    db       "Easy",$80
pnormaString 
                    db       "Normal",$80
phardString 
                    db       "Hard",$80
pimpossibleString 
                    db       "Absurd",$80
psuperimpossibleString 
                    db       "Maniac",$80
Weapons 
                    dw       Weapon1 
                    dw       Weapon2 
                    dw       Weapon3 
                    dw       Weapon4 
                    dw       Weapon5 
                    dw       Weapon6 
Weapon1 
                    db       "Weapon 1 Shot", $80
Weapon2 
                    db       "Weapon 2 Shot", $80
Weapon3 
                    db       "Weapon 3 Shot", $80
Weapon4 
                    db       "Weapon 4 Shot", $80
Weapon5 
                    db       "Weapon Blaster", $80
Weapon6 
                    db       "Weapon Laser", $80
armorPauseString 
                    db       "Armor active", $80
shieldPauseString 
                    db       "Shield active", $80
scoopPauseString 
                    db       "Scoop active", $80
autofirePauseString 
                    db       "Autofire", $80
noautofirePauseString 
                    db       "No autofire", $80
rankMarkerString 
                    db       "Rankmarker",$80
superBombsAvailable 
                    db       "Superbombs",$80
superDiamondsCollected 
                    db       "Diamonds",$80
secretSuperBomb 
                    db       "SECRET: Superbomb",$80
secretLaser 
                    db       "SECRET: E X T R A",$80
secretshield 
                    db       "SECRET: Scoop shield",$80
secretStatus 
                    db       "SECRET: More Stats",$80
secretDodger2 
                    db       "SECRET: Dodger 2x",$80
secretDodger5 
                    db       "SECRET: Dodger 5x",$80
secretPayback 
                    db       "SECRET: Payback",$80
secretUNKOWN 
                    db       "???",$80
secretUNKOWN2 
                    db       "---",$80
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                    include  "ranks.i"
askSaveGame 
 if  ALLOW_SAVING = 1 
                    lda      flashAvailable 
                    anda     # FLASH_AVAILABLE_BIT        ; no game available 
                    lbeq     pauseLoop 
REPLACE_1_2_showSaveMessage_varFromIRQ0_1 
                    ldx      #0                           ;showSaveMessage 
                    jsr      jsrBank0_fromBank2_Shift 
                    cmpu     #3                           ; yes 
                    bne      doNotSaveAfterAll 
 if  VECFEVER = 1 
REPLACE_1_2_saveGameToVecFever_varFromIRQ1_1 
                    ldx      #0                           ;saveGameToVecFever 
                    jmp      jmpBankIRQ1Shift 

 else  
REPLACE_1_2_saveGameToFlash_varFromIRQ0_423 
                    ldx      #0                           ;saveGameToFlash 
                    jmp      doShiftIRQ 

 endif  
doNotSaveAfterAll 
 endif  
                    jmp      pauseLoop 
