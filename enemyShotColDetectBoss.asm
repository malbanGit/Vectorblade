; macros only: bank 3
BOSS1_HIT_X_OFFSET  =        60 
BOSS1_Y_LOW         =        20 
COL_DETECT_ENEMY_BOSS1  macro  tShot 
; colision detection player shot -> enemy
; only two shots are tested per game round
; two shots
; main must ensure the two to be tested shots are "halfway"
; in b is still the xcoordinate of the current enemy that is tested for thisshot
; is there a col detection at all if ALL purpose is negative? -> NO
; all behaviours with negative all purpose do not call col detect
; ergo ALL purpuse negtaive serves no purpose anymore!
                    ldx      tShot 
                    beq      notHit\? 
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #6                           ; laser 
                    beq      xCheckOnly_laser\? 
; "non" shots have ypos set to max ($7f) therefore below test is always met and goes to noHit
; we do not need to test the shot itself for validity!
; yTest
; for "easyness" - just we say here if 
; y pos of shot is >= enemyPos than we hit!
                    lda      #BOSS1_Y_LOW 
                    sta      enemyMINY 
                    cmpa     tShot +T_YPOS 
                    bge      notHit\? 
;;;;; y done
xCheckOnly\? 
; xTest
                    ldb      bossPosX 
                    addb     #$80                         ; x coordinate enemy now 0 based in b 0-255 
; test center
                    stb      tmp1 
                    addb     #BOSS1_HIT_X_OFFSET 
                    bcc      testOnB3_1\? 
                    ldb      #$ff 
testOnB3_1\? 
                    cmpb     tShot+T_XPOS0_MINUS_1_RADIUS 
                    blo      notHit\?                     ; enemy is on left side of shot 
; in b 0 based enemy pos 
                    subb     #2*BOSS1_HIT_X_OFFSET 
                    bcc      testOnB3_2\? 
                    ldb      #$00 
testOnB3_2\? 
                    cmpb     tShot+T_XPOS0_PLUS_1_RADIUS 
                    bhi      notHit\?                     ; enemy is on right side of shot 
;..........
; if only scoop shots are left - we can not hit with "own" cannon
                    ldd      #notHit\? 
                    std      backJump 
                    inc      tmp2_tmp_unique 
                    jmp      removeCurrentShotAndObjectBoss 

xCheckOnly_laser\? 
                    lda      #BOSS1_Y_LOW                 ; pos of boss2, boss start at the top 
; suba #$20; reduce by some offset to get the "mouth" part
; for laser cut off
                    sta      laserTmp 
                    clr      laserTmp2                    ; main laser only 
                    bra      xCheckOnly\? 

;..........
notHit\? 
                    endm     
BOSS2_HIT_X_OFFSET  =        7 
BOSS2_Y_LOW         =        20 
COL_DETECT_ENEMY_BOSS2  macro  tShot 
;
                    ldx      tShot 
                    beq      notHit\? 
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #6                           ; laser 
                    beq      xCheckOnly_laser\? 
; "non" shots have ypos set to max ($7f) therefore below test is always met and goes to noHit
; we do not need to test the shot itself for validity!
; yTest
; for "easyness" - just we say here if 
; y pos of shot is >= enemyPos than we hit!
                    lda      bossPosY                     ; pos of boss2, boss start at the top 
                    suba     #$48                         ; reduce by some offset to get the "mouth" part 
                    sta      enemyMINY 
                    cmpa     tShot +T_YPOS 
                    bge      notHit\? 
;;;;; y done
xCheckOnly\? 
; xTest
                    ldb      bossPosX 
                    addb     #$80                         ; x coordinate enemy now 0 based in b 0-255 
; test center
                    stb      tmp1 
                    addb     #BOSS2_HIT_X_OFFSET 
                    cmpb     tShot+T_XPOS0_MINUS_1_RADIUS 
                    blo      notHit\?                     ; enemy is on left side of shot 
; in b 0 based enemy pos 
                    subb     #2*BOSS2_HIT_X_OFFSET 
                    cmpb     tShot+T_XPOS0_PLUS_1_RADIUS 
                    bhi      notHit\?                     ; enemy is on right side of shot 
;..........
; no scoopy with boss Swarm!
_scoopCenterHit\? 
; if only scoop shots are left - we can not hit with "own" cannon
                    ldd      #notHit\? 
                    std      backJump 
                    inc      tmp2_tmp_unique 
                    jmp      removeCurrentShotAndObjectBoss 

xCheckOnly_laser\? 
                    lda      bossPosY                     ; pos of boss2, boss start at the top 
                    suba     #$48                         ; reduce by some offset to get the "mouth" part 
; for laser cut off
                    sta      laserTmp 
                    clr      laserTmp2                    ; main laser only 
                    bra      xCheckOnly\? 

;..........
notHit\? 
                    endm     
; todo
; EXACTLY SAME AS BOSS 4
BOSS3_HIT_X_OFFSET  =        30 
COL_DETECT_ENEMY_BOSS3  macro  tShot 
;
                    ldx      tShot 
                    beq      notHit\? 
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #6                           ; laser 
                    beq      xCheckOnly_laser\? 
; "non" shots have ypos set to max ($7f) therefore below test is always met and goes to noHit
; we do not need to test the shot itself for validity!
; yTest
; for "easyness" - just we say here if 
; y pos of shot is >= enemyPos than we hit!
;
                    lda      bossPosY                     ; pos of boss2, boss start at the top 
                    suba     #$28 
                    sta      enemyMINY 
                    ldb      bossPosY                     ; pos of boss2, boss start at the top 
                    sex      
; subd #$28; reduce by some offset to get the "mouth" part
                    std      tmp3_tmp 
                    ldb      tShot +T_YPOS 
                    sex      
                    subd     tmp3_tmp 
                    bpl      nonNegb2\? 
                    std      tmp3_tmp 
                    clra     
                    clrb     
                    subd     tmp3_tmp 
nonNegb2\? 
                    cmpd     #$28 
                    bhi      notHit\? 
;;;;; y done
xCheckOnly\? 
; xTest
                    ldb      bossPosX 
                    addb     #$80                         ; x coordinate enemy now 0 based in b 0-255 
; test center
                    stb      tmp1 
                    addb     #BOSS3_HIT_X_OFFSET 
                    bcc      testOnB3_1\? 
                    ldb      #$ff 
testOnB3_1\? 
                    cmpb     tShot+T_XPOS0_MINUS_1_RADIUS 
                    blo      notHit\?                     ; enemy is on left side of shot 
; in b 0 based enemy pos 
                    subb     #2*BOSS3_HIT_X_OFFSET 
                    bcc      testOnB3_2\? 
                    ldb      #$00 
testOnB3_2\? 
                    cmpb     tShot+T_XPOS0_PLUS_1_RADIUS 
                    bhi      notHit\?                     ; enemy is on right side of shot 
;..........
; no scoopy with boss Swarm!
_scoopCenterHit\? 
; if only scoop shots are left - we can not hit with "own" cannon
                    ldd      #notHit\? 
                    std      backJump 
                    inc      tmp2_tmp_unique 
                    jmp      removeCurrentShotAndObjectBoss 

xCheckOnly_laser\? 
                    lda      bossPosY                     ; pos of boss2, boss start at the top 
                    suba     #$20                         ; reduce by some offset to get the "mouth" part 
; for laser cut off
                    sta      laserTmp 
                    clr      laserTmp2                    ; main laser only 
                    bra      xCheckOnly\? 

;..........
notHit\? 
                    endm     
; todo
BOSS4_HIT_X_OFFSET  =        30 
COL_DETECT_ENEMY_BOSS4  macro  tShot 
;
                    ldx      tShot 
                    beq      notHit\? 
                    lda      playerNumberOfBulletsPerShot 
                    cmpa     #6                           ; laser 
                    beq      xCheckOnly_laser\? 
; "non" shots have ypos set to max ($7f) therefore below test is always met and goes to noHit
; we do not need to test the shot itself for validity!
; yTest
; for "easyness" - just we say here if 
; y pos of shot is >= enemyPos than we hit!
;
                    lda      bossPosY                     ; pos of boss2, boss start at the top 
                    suba     #$28 
                    sta      enemyMINY 
;
                    ldb      bossPosY                     ; pos of boss2, boss start at the top 
                    sex      
; subd #$28; reduce by some offset to get the "mouth" part
                    std      tmp3_tmp 
                    ldb      tShot +T_YPOS 
                    sex      
                    subd     tmp3_tmp 
                    bpl      nonNegb2\? 
                    std      tmp3_tmp 
                    clra     
                    clrb     
                    subd     tmp3_tmp 
nonNegb2\? 
                    cmpd     #$28 
                    bhi      notHit\? 
;;;;; y done
xCheckOnly\? 
; xTest
                    ldb      bossPosX 
                    addb     #$80                         ; x coordinate enemy now 0 based in b 0-255 
; test center
                    stb      tmp1 
                    addb     #BOSS4_HIT_X_OFFSET 
                    bcc      testOnB3_1\? 
                    ldb      #$ff 
testOnB3_1\? 
                    cmpb     tShot+T_XPOS0_MINUS_1_RADIUS 
                    blo      notHit\?                     ; enemy is on left side of shot 
; in b 0 based enemy pos 
                    subb     #2*BOSS4_HIT_X_OFFSET 
                    bcc      testOnB3_2\? 
                    ldb      #$00 
testOnB3_2\? 
                    cmpb     tShot+T_XPOS0_PLUS_1_RADIUS 
                    bhi      notHit\?                     ; enemy is on right side of shot 
;..........
; no scoopy with boss Swarm!
_scoopCenterHit\? 
; if only scoop shots are left - we can not hit with "own" cannon
                    ldd      #notHit\? 
                    std      backJump 
                    inc      tmp2_tmp_unique 
                    jmp      removeCurrentShotAndObjectBoss 

xCheckOnly_laser\? 
                    lda      bossPosY                     ; pos of boss2, boss start at the top 
                    suba     #$20                         ; reduce by some offset to get the "mouth" part 
; for laser cut off
                    sta      laserTmp 
                    clr      laserTmp2                    ; main laser only 
                    bra      xCheckOnly\? 

;..........
notHit\? 
                    endm     
