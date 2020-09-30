; macros only: bank 3
COL_DETECT_ENEMY_SHOTS_ENEMY  macro  tShot, YBASE, XBASE, DO_MIN_CHECK 
;
; collision detection player shot -> enemy
; only two shots are tested per game round
; two shots
; main must ensure the two to be tested shots are "halfway"
;
; in b is still the xcoordinate of the current enemy that is tested for this shot
; is there a col detection at all if ALL purpose is negative? -> NO
; all behaviours with negative all purpose do not call col detect
; ergo ALL purpuse negtaive serves no purpose anymore!
                    ldx      tShot                        ; load address of current shot structure to be tested 
                    lbeq     notHit\? 
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #6                           ; laser 
                    lbeq     laser_xCheckOnly\? 
                    lda      YBASE +u_offset1,s 
 if  DO_MIN_CHECK == 1                                    ; MIN check is only done with the first to be tested shot 
                    CHECK_MINY_A  
 endif  
; "non" shots have ypos set to max ($7f) therefore below test is always met and goes to noHit
; we do not need to test the shot itself for validity!
; yTest
                    suba     tShot +T_YPOS 
                    lbpl     notHit\? 
                    lbvs     notHit\? 
 if  LARGE_OBJECT = 1 
                    adda     #10                          ; higher y tollerance 
 endif  
                    cmpa     shotYRadius 
                    lblt     notHit\? 
;;;;; y done
xCheckOnly\? 
; xTest
                    addb     #$80                         ; x coordinate enemy now 0 based in b 0-255 
; test center
 if  LARGE_OBJECT = 1 
; if large object, check if middle shot is zero and than test the correct scoopy instead
                    lda      SHOT_RADIUS, x 
; REMOVED since SHOT_RADIUS0 == 0!!! 
;                   cmpa #SHOT_RADIUS0 
                    bne      isBaseShot\? 
                    lda      X_POS,x 
                    adda     #$80 
                    sta      tmp1_tmp 
                    cmpb     tmp1_tmp 
                    lblo     notHitLeftOfCenter\?         ; enemy is on left side of shot 
                    lbhi     notHitRightOfCenter\?        ; enemy is on right side of shot 
isBaseShot\? 
                    addb     #15 
 endif  
                    cmpb     tShot+T_XPOS0_MINUS_1_RADIUS 
                    lblo     notHitLeftOfCenter\?         ; enemy is on left side of shot 
; in b 0 based enemy pos 
 if  LARGE_OBJECT = 1 
                    subb     #30 
 endif  
                    cmpb     tShot+T_XPOS0_PLUS_1_RADIUS 
                    lbhi     notHitRightOfCenter\?        ; enemy is on right side of shot 
;..........
scoopCenterHit\? 
; if only scoop shots are left - we can not hit with "own" cannon
                    ldb      SHOT_RADIUS, x               ; a zero shot cannot hit! (WAS TST) 
                    lbeq     notHit\? 
                    ldd      #notHit\? 
                    std      backJump 
 if  ENEMY_UNDYING = 1 
                    jmp      notHit\? 

 endif  
; normal shot did hit
; not scoopy - NORMAL
_removeCurrentShotAndObject\? 
                    ldd      BEHAVIOUR, x 
REPLACE_2_2_zeroPlayerShotBehaviour_varFrom0_0\? 
                    cmpd     #0 
                    bne      centerHit\? 
; center shot is zero - check if a scoopy might hit!
                    ldb      tmp1 
                    subb     tShot+T_XPOS0_MINUS_1_RADIUS 
                    lbpl     notHitLeftOfCenter\? 
                    ldb      tmp1 
                    subb     tShot+T_XPOS0_PLUS_1_RADIUS 
                    lbmi     notHitRightOfCenter\? 
                    jmp      notHit\?                     ; notHitShotIsZero 

centerHit\? 
                    clr      tmp_isSupershot 
                    ldb      explosionSound               ; (was tst) 
                    bne      noInc\? 
                    inc      explosionSound               ; next game round, play an explosion 
noInc\? 
; laser
                    ldb      SHOT_RADIUS, x               ; 
                    cmpb     #SHOT_RADIUS6 
                    bne      noLaserHere\? 
 if  SCOOPY_HIT_LARGE_OBJECT = 1 
 if  LARGE_OBJECT = 1 
                    clr      laserTmp2 
                    dec      laserTmp2 
 endif  
 endif  
                    jmp      isLazerShot 

noLaserHere\? 
; should I do a "shield" check here, as in object.asm?
; probably yes... but most of the time 
; this works out well...
; AND, shrinked shots can sometimes "weazle" through shield enemies
; which I find cool :-)
                    cmpb     #SHOT_RADIUS5 
                    beq      isFiveShot\? 
 if  LARGE_OBJECT = 1 
                    ldy      BIG_HP +u_offset1,s 
 else  
                    lda      HITPOINTS +u_offset1,s 
 endif  
;                    ldb      SHOT_RADIUS, x 
                    cmpb     #SHOT_RADIUS4 
                    beq      removeShot4_e1\? 
                    cmpb     #SHOT_RADIUS3 
                    beq      removeShot3_e1\? 
                    cmpb     #SHOT_RADIUS2 
                    beq      removeShot2_e1\? 
                    jmp      isNo5Shot 

; five shot is also a "1" time shot
isFiveShot\? 
                    inc      tmp_isSupershot              ; positive is supershot 
                    ldb      SCOOP_SHOTS, x               ; tst 
                    lbeq     shotHasNoScoopies 
 if  SCOOPY_HIT_LARGE_OBJECT = 1 
 if  LARGE_OBJECT = 1 
                    bitb     #$f0 
                    beq      noLeftScoopyBiggy\? 
                    ldb      bulletDamage 
                    negb     
                    sex      
                    addd     BIG_HP +u_offset1,s 
                    std      BIG_HP +u_offset1,s 
noLeftScoopyBiggy\? 
                    bitb     #$f 
                    beq      noRightScoopyBiggy\? 
                    ldb      bulletDamage 
                    negb     
                    sex      
                    addd     BIG_HP +u_offset1,s 
                    std      BIG_HP +u_offset1,s 
noRightScoopyBiggy\? 
                    clr      SCOOP_SHOTS, x 
                    jmp      shotHasNoScoopies 

 endif  
 endif  
                    ldb      #SHOT_RADIUS0 
                    stb      SHOT_RADIUS, x 
                    jmp      shotHandleDone_noBoss 

;--- 
removeShot4_e1\? 
; remove 3 points of damage
 if  LARGE_OBJECT = 1 
                    lda      bulletDamage                 ; should be bulletDamage * 2 
                    lsla     
                    adda     bulletDamage                 ; 3 times damage 
storeAndOut\? 
                    nega     
                    leay     a,y 
 if  SCOOPY_HIT_LARGE_OBJECT = 1 
; remove fullscoopy damage
; and remove scoopy shot
                    ldb      SCOOP_SHOTS, x               ; tst 
; for easyness I assume always a FULL-1 scoopy shot
                    bitb     #$f0 
                    beq      noLeftScoopyBiggy4\? 
                    leay     a,y                          ; 3 times damage 
noLeftScoopyBiggy4\? 
; for easyness I assume always a FULL-1 scoopy shot
                    bitb     #$f 
                    beq      noRightScoopyBiggy4\? 
                    leay     a,y                          ; 3 times damage 
noRightScoopyBiggy4\? 
                    clr      SCOOP_SHOTS, x 
 endif  
                    sty      BIG_HP +u_offset1,s 
                    jmp      isNo5Shot                    ; remove shot, do one damage! 

removeShot3_e1\? 
; remove 2 points of damage
                    lda      bulletDamage                 ; 2 times 
                    lsla     
                    bra      storeAndOut\? 

removeShot2_e1\? 
; remove 1 points of damage
                    lda      bulletDamage                 ; 1 times 
                    bra      storeAndOut\? 

 else                                                     ;--------------------------------------------------------------------- 
                    suba     shiftDoubleBulletDamage      ; should be bulletDamage * 2 
                    lbmi     makeShot3 
                    adda     shiftBulletDamage            ; should be bulletDamage 
                    sta      HITPOINTS +u_offset1,s 
removeShot3_e1\? 
; remove 2 points of damage
                    suba     shiftDoubleBulletDamage 
                    lbmi     makeShot2 
                    adda     shiftBulletDamage 
                    sta      HITPOINTS +u_offset1,s 
removeShot2_e1\? 
; remove 1 points of damage
                    suba     shiftDoubleBulletDamage 
                    lbmi     makeShot1 
                    adda     shiftBulletDamage 
                    sta      HITPOINTS +u_offset1,s 
 endif  
                    jmp      isNo5Shot 

laser_xCheckOnly\? 
                    clr      laserTmp2                    ; laser = main 
                    lda      YBASE +u_offset1,s 
                    sta      laserTmp                     ; y pos 
                    jmp      xCheckOnly\? 

laser_xCheckOnly2\? 
                    lda      #2 
                    sta      laserTmp2                    ; laser = right scoop 
                    lda      YBASE +u_offset1,s 
                    adda     #10                          ; assume 10 lower 
                    bvc      okok\? 
                    lda      #$7f 
okok\? 
                    sta      laserTmp 
                    bra      xCheckOnly2\? 

;..........
;..........
notHitLeftOfCenter\? 
; check if there are scoopies
                    lda      SCOOP_SHOTS,x                ; two nibbles 
                    anda     #$f0 
                    lbeq     notHit\?                     ; we kno there is no right hit possible, because we came from center! 
; side shots are lower - test that here...
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #6                           ; laser 
                    beq      laser_xCheckOnly2\? 
                    lda      YBASE +u_offset1,s 
                    adda     #10                          ; assume 10 lower 
                    suba     tShot +T_YPOS 
                    lbpl     notHit\? 
xCheckOnly2\? 
                                                          ; in b x pos of enemy - 0 based! 
; test left
 if  LARGE_OBJECT = 1 
 endif  
                    cmpb     tShot+T_XPOS0_MINUS_3_RADIUS 
                    lblo     notHit\?                     ; enemy is on left side of left shot 
; left HIT!
; i Do not even have to test right side - since we know it is left of MINUS_1_RADIUS
 if  ENEMY_UNDYING = 1 
                    jmp      notHit\? 

 endif  
                    ldd      #notHit\? 
                    std      backJump 
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #6                           ; laser 
                    lbeq     isLazerShot                  ;shotHandleDone_noBoss ;noScoopReduceLeft\? 
;:::::::::::::::::::::::::
; remove shot when shield
                    ldy      ENEMY_STRUCT+u_offset1,s 
                    ldb      ADDITIONAL_TYPE_INFO,y 
                    andb     #TYPE_SHIELD 
                    beq      noShieldShot1\?              ; remove 
                    lda      SCOOP_SHOTS,x                ; 
                    anda     #$0f 
                    sta      SCOOP_SHOTS,x                ; 
                    lbne     shotHandleDone_noBoss 
                    bra      noScoopyLeft1\? 

noShieldShot1\? 
; remove shot when shield
;:::::::::::::::::::::::::
; left scoopy has hit
                    lda      SCOOP_SHOTS,x                ; 
                    suba     #$20 
                    bpl      multiShotLeftScoop\? 
storeScoopPlusOne\? 
                    adda     #$10 
storeScoop\? 
                    sta      SCOOP_SHOTS,x                ; 
                    lbne     shotHandleDone_noBoss 
noScoopyLeft1\? 
                                                          ; test for radius of shot 
                    lda      SHOT_RADIUS,x 
                    lbeq     shotHasNoScoopies            ; jump out to remove this shot entirely 
                    jmp      shotHandleDone_noBoss        ; go to enemy "hit" handling 

multiShotLeftScoop\? 
; left scoopy with more than one bullet
; in a number of bullets in scoopy -2
 if  LARGE_OBJECT = 1 
                    ldy      BIG_HP +u_offset1,s 
                    adda     #$10 
                    ldb      bulletDamage                 ; should be bulletDamage 
                    negb     
                    leay     b,y 
                    cmpy     #0 
                    bmi      storeScoop\? 
                    beq      storeScoop\? 
                    sty      BIG_HP +u_offset1,s 
                    suba     #$20 
                    bmi      storeScoopPlusOne\? 
                    adda     #$10 
                    ldb      bulletDamage                 ; should be bulletDamage 
                    negb     
                    leay     b,y 
                    cmpy     #0 
                    bmi      storeScoop\? 
                    beq      storeScoop\? 
                    sty      BIG_HP +u_offset1,s 
                    suba     #$20 
                    bmi      storeScoopPlusOne\? 
                    adda     #$10 
                    ldb      bulletDamage                 ; should be bulletDamage 
                    negb     
                    leay     b,y 
                    cmpy     #0 
                    bmi      storeScoop\? 
                    beq      storeScoop\? 
                    sty      BIG_HP +u_offset1,s 
                    bra      storeScoop\? 

 else  
                    adda     #$10 
                    ldb      HITPOINTS +u_offset1,s 
                    subb     shiftBulletDamage            ; should be bulletDamage 
                    bmi      storeScoop\? 
                    beq      storeScoop\? 
                    stb      HITPOINTS +u_offset1,s 
                    suba     #$20 
                    bmi      storeScoopPlusOne\? 
                    adda     #$10 
                    subb     shiftBulletDamage            ; should be bulletDamage 
                    bmi      storeScoop\? 
                    beq      storeScoop\? 
                    stb      HITPOINTS +u_offset1,s 
                    suba     #$20 
                    bmi      storeScoopPlusOne\? 
                    adda     #$10 
                    subb     shiftBulletDamage            ; should be bulletDamage 
                    bmi      storeScoop\? 
                    beq      storeScoop\? 
                    stb      HITPOINTS +u_offset1,s 
                    bra      storeScoop\? 

 endif  
laser_xCheckOnly3\? 
                    lda      #1 
                    sta      laserTmp2                    ; laser = left scoop 
                    lda      YBASE +u_offset1,s 
                    adda     #10                          ; assume 10 lower 
                    bvc      okok2\? 
                    lda      #$7f 
okok2\? 
                    sta      laserTmp 
                    bra      xCheckOnly3\? 

;..........
notHitRightOfCenter\? 
; check if there are scoopies
                    lda      SCOOP_SHOTS,x                ; two nibbles 
                    anda     #$0f 
                    lbeq     notHit\?                     ; we no there is no left hit possible, because we came from center! 
; side shots are lower - test that here...
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #6                           ; laser 
                    beq      laser_xCheckOnly3\? 
                    lda      YBASE +u_offset1,s 
                    adda     #10                          ; assume 10 lower 
                    suba     tShot +T_YPOS 
                    lbpl     notHit\? 
xCheckOnly3\? 
                                                          ; in b x pos of enemy - 0 based! 
; test right
 if  LARGE_OBJECT = 1 
 endif  
                    cmpb     tShot+T_XPOS0_PLUS_3_RADIUS 
                    lbhi     notHit\?                     ; enemy is on right side of right shot 
; right HIT!
; i Do not even have to test right side - since we know it is left of MINUS_1_RADIUS
 if  ENEMY_UNDYING = 1 
                    jmp      notHit\? 

 endif  
                    ldd      #notHit\? 
                    std      backJump 
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #6                           ; laser 
                    lbeq     isLazerShot                  ;shotHandleDone_noBoss ;noScoopReduceRight\? 
;:::::::::::::::::::::::::
; remove shot when shield
                    ldy      ENEMY_STRUCT+u_offset1,s 
                    ldb      ADDITIONAL_TYPE_INFO,y 
                    andb     #TYPE_SHIELD 
                    beq      noShieldShot2\?              ; remove 
                    lda      SCOOP_SHOTS,x                ; 
                    anda     #$f0 
                    sta      SCOOP_SHOTS,x                ; 
                    lbne     shotHandleDone_noBoss 
                    bra      noScoopyRight\? 

noShieldShot2\? 
; remove shot when shield
;:::::::::::::::::::::::::
                    dec      SCOOP_SHOTS,x                ; 
                    beq      noScoopyRight\? 
; right scoopy has hit
                    lda      SCOOP_SHOTS,x                ; 
                    deca     
                    bpl      multiShotRightScoop\? 
storeRightScoopPlusOne\? 
                    inca     
storeRightScoop\? 
                    sta      SCOOP_SHOTS,x                ; 
                    lbne     shotHandleDone_noBoss 
noScoopyRight\? 
                                                          ; test for radius of shot 
                    lda      SHOT_RADIUS,x 
                    lbeq     shotHasNoScoopies            ; jump out to remove this shot entirely 
                    jmp      shotHandleDone_noBoss        ; go to enemy "hit" handling 

multiShotRightScoop\? 
; right scoopy with more than one bullet
; in a number of bullets in scoopy -2
                    inca     
 if  LARGE_OBJECT = 1 
                    ldy      BIG_HP +u_offset1,s 
                    ldb      bulletDamage                 ; should be bulletDamage 
                    negb     
                    leay     b,y 
                    cmpy     #0 
                    bmi      storeRightScoop\? 
                    beq      storeRightScoop\? 
                    sty      BIG_HP +u_offset1,s 
                    suba     #$2 
                    bmi      storeRightScoopPlusOne\? 
                    inca     
                    ldy      BIG_HP +u_offset1,s 
                    ldb      bulletDamage                 ; should be bulletDamage 
                    negb     
                    leay     b,y 
                    cmpy     #0 
                    bmi      storeRightScoop\? 
                    beq      storeRightScoop\? 
                    sty      BIG_HP +u_offset1,s 
                    suba     #$2 
                    bmi      storeRightScoopPlusOne\? 
                    inca     
                    ldy      BIG_HP +u_offset1,s 
                    ldb      bulletDamage                 ; should be bulletDamage 
                    negb     
                    leay     b,y 
                    cmpy     #0 
                    bmi      storeRightScoop\? 
                    lbeq     storeScoop\? 
                    sty      BIG_HP +u_offset1,s 
                    bra      storeRightScoop\? 

 else  
                    ldb      HITPOINTS +u_offset1,s 
                    subb     shiftBulletDamage            ; should be bulletDamage 
                    bmi      storeRightScoop\? 
                    beq      storeRightScoop\? 
                    stb      HITPOINTS +u_offset1,s 
                    suba     #$2 
                    bmi      storeRightScoopPlusOne\? 
                    inca     
                    subb     shiftBulletDamage            ; should be bulletDamage 
                    bmi      storeRightScoop\? 
                    beq      storeRightScoop\? 
                    stb      HITPOINTS +u_offset1,s 
                    suba     #$2 
                    bmi      storeRightScoopPlusOne\? 
                    inca     
                    subb     shiftBulletDamage            ; should be bulletDamage 
                    bmi      storeRightScoop\? 
                    lbeq     storeScoop\? 
                    stb      HITPOINTS +u_offset1,s 
                    bra      storeRightScoop\? 

 endif  
;..........
notHit\? 
                    endm     
COL_DETECT_ENEMY_SHOTS_ENEMY_BUG  macro  tShot, YBASE, XBASE , DO_MIN_CHECK 
;
; collision detection player shot -> enemy
; only two shots are tested per game round
; two shots
; main must ensure the two to be tested shots are "halfway"
; in b is still the xcoordinate of the current enemy that is tested for thisshot
; is there a col detection at all if ALL purpose is negative? -> NO
; all behaviours with negative all purpose do not call col detect
; ergo ALL purpuse negtaive serves no purpose anymore!
                    ldx      tShot 
                    lbeq     notHit\? 
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #6                           ; laser 
                    lbeq     laser_xCheckOnly\? 
                    lda      YBASE +u_offset1,s 
 if  DO_MIN_CHECK == 1 
                    CHECK_MINY_A  
 endif  
; "non" shots have ypos set to max ($7f) therefore below test is always met and goes to noHit
; we do not need to test the shot itself for validity!
; yTest
                    suba     tShot +T_YPOS 
                    lbpl     notHit\? 
                    lbvs     notHit\? 
                                                          ; bugs are also bigger in y dimensions 
                                                          ; but they move so slow - this probably does not 
                                                          ; matter 
                                                          ; anyway - have to test! 
                                                          ; TODO 
                    cmpa     shotYRadius 
                    lblt     notHit\? 
;;;;; y done
xCheckOnly\? 
; xTest
                    addb     #$80                         ; x coordinate enemy now 0 based in b 0-255 
; test center
                    stb      tmp1 
                    addb     #BUG_HIT_X_OFFSET 
                    cmpb     tShot+T_XPOS0_MINUS_1_RADIUS 
                    lblo     notHitLeftOfCenter\?         ; enemy is on left side of shot 
; in b 0 based enemy pos 
                    subb     #2*BUG_HIT_X_OFFSET 
                    cmpb     tShot+T_XPOS0_PLUS_1_RADIUS 
                    lbhi     notHitRightOfCenter\?        ; enemy is on right side of shot 
;..........
scoopCenterHit\? 
; if only scoop shots are left - we can not hit with "own" cannon
                    ldb      SHOT_RADIUS, x               ; a zero shot cannot hit! (TST) 
                    lbeq     notHit\? 
                    ldd      #notHit\? 
                    std      backJump 
 if  ENEMY_UNDYING = 1 
                    jmp      notHit\? 

 endif  
; normal shot did hit
; not scoopy - NORMAL
;---
_removeCurrentShotAndObject\? 
                    ldd      BEHAVIOUR, x 
REPLACE_2_2_zeroPlayerShotBehaviour_varFrom0_1\? 
                    cmpd     #0 
                    bne      centerHit\? 
; center shot is zero - check if a scoopy might hit!
                    ldb      tmp1 
                    subb     tShot+T_XPOS0_MINUS_1_RADIUS 
                    lbpl     notHitLeftOfCenter\? 
                    ldb      tmp1 
                    subb     tShot+T_XPOS0_PLUS_1_RADIUS 
                    lbmi     notHitRightOfCenter\? 
                    jmp      notHit\?                     ; notHitShotIsZero 

centerHit\? 
                    clr      tmp_isSupershot 
                    ldb      explosionSound               ;(tst) 
                    bne      noInc2\? 
                    inc      explosionSound               ; next game round, play an explosion 
noInc2\? 
                    ldb      SHOT_RADIUS, x 
                    cmpb     #SHOT_RADIUS4 
                    beq      removeShot4\? 
                    cmpb     #SHOT_RADIUS3 
                    beq      removeShot3\? 
                    cmpb     #SHOT_RADIUS2 
                    beq      removeShot2\? 
                    cmpb     #SHOT_RADIUS6 
                    lbeq     isLazerShot 
; five shot is also a "1" time shot
                    cmpb     #SHOT_RADIUS5 
                    lbne     isNo5Shot 
                    inc      tmp_isSupershot              ; positive is supershot 
                    ldb      SCOOP_SHOTS, x               ; TST 
                    lbeq     shotHasNoScoopies 
                    ldb      #SHOT_RADIUS0 
                    stb      SHOT_RADIUS, x 
                    jmp      shotHandleDone_Bug 

;---
removeShot4\? 
; remove 2 points of damage
                    lda      BUG_ENEMY_HITPOINTS +u_offset1,s 
; bugs take less damage -> blame vtk!!!
;                    suba     bulletDamage 
                    suba     bulletDamage 
                    suba     bulletDamage 
;  suba #3 ; one is reduced by"ordanary handler
                    sta      BUG_ENEMY_HITPOINTS +u_offset1,s 
                    jmp      isNo5Shot 

removeShot3\? 
; remove 1 points of damage
                    lda      BUG_ENEMY_HITPOINTS +u_offset1,s 
;                    suba     bulletDamage 
                    suba     bulletDamage 
;  suba #2 ; one is reduced by"ordanary handler
                    sta      BUG_ENEMY_HITPOINTS +u_offset1,s 
                    jmp      isNo5Shot 

removeShot2\? 
; remove 1/2 points of damage
;                    lda      BUG_ENEMY_HITPOINTS +u_offset1,s 
;                    suba     bulletDamage 
                    lda      bulletDamage 
                    lsra     
                    nega     
                    adda     BUG_ENEMY_HITPOINTS +u_offset1,s 
;  suba #1 ; one is reduced by"ordanary handler
                    sta      BUG_ENEMY_HITPOINTS +u_offset1,s 
                    jmp      isNo5Shot 

laser_xCheckOnly\? 
                    clr      laserTmp2                    ; laser = main 
                    lda      YBASE +u_offset1,s 
                    sta      laserTmp                     ; y pos 
                    jmp      xCheckOnly\? 

laser_xCheckOnly2\? 
                    lda      #2 
                    sta      laserTmp2                    ; laser = right scoop 
                    lda      YBASE +u_offset1,s 
                    adda     #10                          ; assume 10 lower 
                    bvc      okok\? 
                    lda      #$7f 
okok\? 
                    sta      laserTmp 
                    bra      xCheckOnly2\? 

;..........
;..........
notHitLeftOfCenter\? 
; check if there are scoopies
                    lda      SCOOP_SHOTS,x                ; two nibbles 
                    anda     #$f0 
                    lbeq     notHit\?                     ; we kno there is no right hit possible, because we came from center! 
; side shots are lower - test that here...
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #6                           ; laser 
                    beq      laser_xCheckOnly2\? 
                    lda      YBASE +u_offset1,s 
                    adda     #10                          ; assume 10 lower 
                    suba     tShot +T_YPOS 
                    lbpl     notHit\? 
xCheckOnly2\? 
                    ldb      tmp1                         ; correct b for bug compare 
                                                          ; in b x pos of enemy - 0 based! 
; test left
                    addb     #BUG_HIT_X_OFFSET 
                    cmpb     tShot+T_XPOS0_MINUS_3_RADIUS 
                    lblo     notHit\?                     ; enemy is on left side of left shot 
; left HIT!
; i Do not even have to test right side - since we know it is left of MINUS_1_RADIUS
 if  ENEMY_UNDYING = 1 
                    jmp      notHit\? 

 endif  
                    ldd      #notHit\? 
                    std      backJump 
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #6                           ; laser 
                    lbeq     isLazerShot                  ;shotHandleDone_noBoss ;noScoopReduceLeft\? 
;:::::::::::::::::::::::::
; remove shot when shield
; remove all scoop shots and do damage for all
; here it means do (scoop shot -1)*damage
                    lda      SCOOP_SHOTS,x                ; 
                    lsra     
                    lsra     
                    lsra     
                    lsra     
                    deca     
                    ldb      bulletDamage 
                    mul      
                    negb     
                    addb     BUG_ENEMY_HITPOINTS +u_offset1,s 
                    stb      BUG_ENEMY_HITPOINTS +u_offset1,s 
                    lda      SCOOP_SHOTS,x                ; 
                    anda     #$f                          ; set this shot to 0, but keep left 
                    sta      SCOOP_SHOTS,x                ; 
                    lbne     shotHandleDone_Bug 
noScoopyLeft1\? 
                                                          ; test for radius of shot 
                    lda      SHOT_RADIUS,x 
                    lbeq     shotHasNoScoopies            ; jump out to remove this shot entirely 
                    jmp      shotHandleDone_Bug           ; go to enemy "hit" handling 

laser_xCheckOnly3\? 
                    lda      #1 
                    sta      laserTmp2                    ; laser = left scoop 
                    lda      YBASE +u_offset1,s 
                    adda     #10                          ; assume 10 lower 
                    bvc      okok2\? 
                    lda      #$7f 
okok2\? 
                    sta      laserTmp 
                    bra      xCheckOnly3\? 

;..........
;..........
notHitRightOfCenter\? 
; check if there are scoopies
                    lda      SCOOP_SHOTS,x                ; two nibbles 
                    anda     #$0f 
                    beq      notHit\?                     ; we no there is no left hit possible, because we came from center! 
; side shots are lower - test that here...
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #6                           ; laser 
                    beq      laser_xCheckOnly3\? 
                    lda      YBASE +u_offset1,s 
                    adda     #10                          ; assume 10 lower 
                    suba     tShot +T_YPOS 
                    bpl      notHit\? 
xCheckOnly3\? 
                    ldb      tmp1                         ; correct b for bug compare 
                                                          ; in b x pos of enemy - 0 based! 
; test right
                    subb     #BUG_HIT_X_OFFSET 
                    cmpb     tShot+T_XPOS0_PLUS_3_RADIUS 
                    bhi      notHit\?                     ; enemy is on right side of right shot 
; right HIT!
; i Do not even have to test right side - since we know it is left of MINUS_1_RADIUS
 if  ENEMY_UNDYING = 1 
                    bra      notHit\? 

 endif  
                    ldd      #notHit\? 
                    std      backJump 
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #6                           ; laser 
                    lbeq     isLazerShot                  ;shotHandleDone_noBoss ;noScoopReduceRight\? 
                    lda      SCOOP_SHOTS,x                ; 
                    anda     #$f0 
                    sta      SCOOP_SHOTS,x                ; 
                    lbne     shotHandleDone_Bug 
                    bra      noScoopyRight\? 

noShieldShot2\? 
; remove shot when shield
;:::::::::::::::::::::::::
; remove all scoop shots and do damage for all
; here it means do (scoop shot -1)*damage
                    lda      SCOOP_SHOTS,x                ; 
                    anda     #$f 
                    deca     
                    ldb      bulletDamage 
                    mul      
                    negb     
                    addb     BUG_ENEMY_HITPOINTS +u_offset1,s 
                    stb      BUG_ENEMY_HITPOINTS +u_offset1,s 
                    lda      SCOOP_SHOTS,x                ; 
                    anda     #$f0                         ; set this shot to 0, but keep left 
                    lbne     shotHandleDone_Bug 
noScoopyRight\? 
                                                          ; test for radius of shot 
                    lda      SHOT_RADIUS,x 
                    lbeq     shotHasNoScoopies            ; jump out to remove this shot entirely 
                    jmp      shotHandleDone_Bug           ; go to enemy "hit" handling 

;..........
notHit\? 
                    endm     
COL_DETECT_ALL      macro    
                    lda      Y_POS +u_offset1,s 
                    CHECK_MINY_A  
                    ldx      playershotlist_objects_head 
                    jmp      inLoop\? 

doNextShotLoop\? 
; build a testshot to 1
; x can be used 
                    INIT_SHOT_TEST_X  testShot 
                    ldb      X_POS +u_offset1,s 
                    COL_DETECT_ENEMY_SHOTS_ENEMY  testShot, Y_POS, X_POS, 1 
                    ldx      testShot 
                    beq      testDone\? 
; on a "hit" this may be 0 (null)
enemyOutOfBounds\? 
                    ldx      NEXT_SHOT_OBJECT,x 
inLoop\? 
                    stx      testShot 
                    cmpx     #OBJECT_LIST_COMPARE_ADDRESS 
                    blo      testDone\? 
                    lda      enemyMINY 
                    cmpa     Y_POS,x 
                    bgt      enemyOutOfBounds\? 
                    jmp      doNextShotLoop\? 

testDone\? 
                    endm     
