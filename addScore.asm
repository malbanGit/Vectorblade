; bank 2+3
; input score in d
; output adds score to ascii score 
; held in player_score_... (in y)
; destroys x
; 9999 max 
addScore_d                                                ;#isfunction  
                    LDX      #$0000                       ;Initialize BCD result to zero 
LF861_1x_d          CMPD     #999                         ;Add in the thousands 
                    BLS      LF861_1x_dd 
                    SUBD     #1000 
                    LEAX     $1000,X 
                    BRA      LF861_1x_d 

LF861_1x_dd 
                    CMPD     #99                          ;Add in the hundreds 
                    BLS      LF861_1x 
                    SUBD     #100 
                    LEAX     $0100,X 
                    BRA      LF861_1x_dd 

checkScore 
                    ldx      #0 
; ldy #player_score is assumed!
                    bra      compareScore_in 

;
; .....................................................
;
addScore_b                                                ;#isfunction  
; convert to bcd 
                    LDX      #$0000                       ;Initialize BCD result to zero 
LF861_1x 
                    CMPb     #99                          ;Add in the hundreds 
                    BLS      LF86D_1x 
                    SUBb     #100 
                    LEAX     $0100,X 
                    BRA      LF861_1x 

LF86D_1x            CMPb     #9                           ;Add in the tens 
                    BLS      LF878_1x 
                    SUBb     #10 
                    LEAX     $10,X 
                    BRA      LF86D_1x 

LF878_1x            LEAx     b,X                          ;Add in the ones 
compareScore_in 
                    TFR      X,D                          ;Move it to the D-register 
                    andb     #$f 
                    addb     6,y 
                    cmpb     # '9'
                    ble      score0_ok 
                    inc      5,y 
                    subb     #10 
score0_ok 
                    stb      6,y 
                    TFR      X,D 
                    rorb     
                    rorb     
                    rorb     
                    rorb     
                    andb     #$f 
                    addb     5,y 
                    cmpb     # '9'
                    ble      score1_ok 
                    inc      4,y 
                    subb     #10 
score1_ok 
                    stb      5,y 
                    tfr      a,b 
                    andb     #$f 
                    addb     4,y 
                    cmpb     # '9'
                    ble      score2_ok 
                    inc      3,y 
                    subb     #10 
score2_ok 
                    stb      4,y 
                    rora     
                    rora     
                    rora     
                    rora     
                    anda     #$f 
                    adda     3,y 
                    cmpa     # '9'
                    ble      score3_ok 
                    inc      2,y 
                    suba     #10 
; special case, since here score of more than 10 in this digit can be added (25)
                    cmpa     # '9'
                    ble      score3_ok 
                    inc      2,y 
                    suba     #10 
                    cmpa     # '9'
                    ble      score3_ok 
                    inc      2,y 
                    suba     #10 
score3_ok 
                    sta      3,y 
compare10000 
                    ldb      2,y 
                    cmpb     # '9'
                    ble      compare100000                ; score_restok? if this one did 
                    inc      1,y 
                    subb     #10 
                    stb      2,y 
compare100000 
                    ldb      1,y 
                    cmpb     # '9'
                    ble      score_restok 
                    inc      0,y 
                    subb     #10 
                    stb      1,y 
                    ldb      0,y 
                    cmpb     # '9'
                    ble      score_restok 
; place 9 to every digit - because of roll over
; todo remember rollover? -> than digits can be kept...
                    ldd      # '99'
                    std      0,y 
                    std      2,y 
                    std      4,y 
                    stb      6,y 
score_restok 
                    jmp      ,u 
