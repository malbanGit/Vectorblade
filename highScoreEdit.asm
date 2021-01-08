; bank 1
MAX_LETTER          =        29 
MAX_SCALE           =        16 
oldPlace 
;
; **************************************************************************
;
                    bss      
                    org      highScoreTableEnd +6         ;arkosPlayerMemEnd+10 ; somewhere after the shots 
letterDisplayStart  ds       1 
letterCounterTmp    ds       1 
letterDisplayOffset  ds      2                            ; small step offset within a circle (times two!) 
inMoving            ds       1 
editPlayerInitials  ds       4 
savetyLetter        ds       1 
hs_pattern          ds       1 
hs_count            ds       1 
HS_MAX_PLAYERSHOT_OBJECTS  =  1 
hs_playershotobject_list  ds  PlayerShotStruct*(HS_MAX_PLAYERSHOT_OBJECTS) 
hs_playershotobject_list_end  ds  0 
HS_MAX_STAR_OBJECTS  =       5 
hs_stars_list       ds       StarStruct*(HS_MAX_STAR_OBJECTS) 
hs_stars_list_end   ds       0 
saveStack           ds       2 
letterInMovePosition  ds     2                            ; current 
letterTargetPosition  ds     2                            ; target 
letterInMove        ds       1                            ; which letter 
letterFirstFlag     ds       1 
inEdit              ds       1 
ltemp               ds       1 
playerShotCounter   =        patternDelayCounter 
;
; **************************************************************************
;
                    code     
                    org      oldPlace 
;
; **************************************************************************
;
initalsPositions 
                    dw       $30c0 
                    dw       $30d0 
                    dw       $30e0 
;***************************************************************************
jumpToTitle 
                    LDa      #$98                         ;[6] check 
                    STa      <VIA_aux_cntl                ; [4] Shift reg mode = 000 free disable, T1 PB7 enabled 
REPLACE_1_2_main00_varFrom0_1 
                    ldx      #0                           ; 
                    jmp      jmpBankIRQ2X                 ; main00 Read_Btns 

;***************************************************************************
HighScoreTest                                             ;#isfunction  
                    ldd      #0 
                    std      letterTargetPosition 
                    jsr      initHighScoreEdit 
                    clr      inEdit 
                    LDA      #$80 
                    STA      <VIA_aux_cntl                ; Shift reg mode = 000 free disable, T1 PB7 enabled 
HSloop1 
HS_loop1 
                    lda      playerShotCounter 
                    cmpa     #3 
                    bne      notFinishedHSEdit 
REPLACE_1_2_backFromHighScoreEdit_varFrom0_1 
                    ldx      #0                           ; backFromHighScoreEdit 
                    jmp      jmpBankIRQ2X 

notFinishedHSEdit 
                    JSR      Read_Btns                    ; get button status 


 if ADDITIONAL_INPUT = 1
 ldb additionalFlags
 andb #BIT_INPUT_VARIANT
 beq do_hsedit_normalButtons
 ; remap buttons

 ; remap x movement (button 2+3)

 clrb
 lda      $C811                        ; button pressed - any 
 bita #2
 bne goleft_hse
 bita #4
 bne goRight_hse
 bra JoyDone_b_hse
goleft_hse
                    ldb      #-10 
 bra JoyDone_b_hse
goRight_hse
                    ldb      #10 
JoyDone_b_hse

                    stb      Vec_Joy_1_X 
 ; clr button 2,3
 anda #$f-2-4
 bita #1
 beq noButton1_hse
 ora #4

noButton1_hse
; clr button 1
 anda #$f-1
 sta $c811

 ; map button 1 to button 3
 ; delete button 1


do_hsedit_normalButtons
 endif


                    ldb      $C811                        ; button pressed - any 
                    andb     #1                           ; is button 1 
                    beq      notButton1HSE 
REPLACE_1_2_showHSHelp_varFromIRQ0_1 
                    ldx      #0                           ;showHSHelp 
                    jmp      jmpBank0X 

notButton1HSE 
                    ldb      $C811                        ; button pressed - any 
                    andb     #4                           ; is button 3, accept current letter 
                    beq      noAcceptShot 
                    ldd      letterTargetPosition 
                    bne      noAcceptShot 
                    lda      playerShotCounter 
                    ldu      #editPlayerInitials 
                    ldb      savetyLetter 
                    stb      a,u 
                    inc      playerShotCounter 
                    lda      playerShotCounter 
                    ldb      a,u 
                    stb      savetyLetter 
noAcceptShot 
                    ldb      $C811                        ; button pressed - any 
                    andb     #8                           ; is button 4 
                    beq      noHSShoot 
                    tst      playerShotCount 
                    bne      noHSShoot 
                    jsr      spawnPlayerShot 
                    inc      inEdit 
noHSShoot 
                    JSR      Wait_Recal_noShift           ; Vectrex BIOS recalibration 
                    jsr      PLY_PLAY                     ; the ym song only using channel 1 
                    jsr      do_ym_sound2 
                    tst      inMoving 
                    bne      noQuery 
;....
                    tst      inEdit 
                    bne      mh_inputXDoneComplete        ; no movement while shot is on its way 


 if ADDITIONAL_INPUT = 1
 ldb additionalFlags
 andb #BIT_INPUT_VARIANT
 beq do_hsedit_normalButtons2
 ; remap buttons
 bra processJoyButtons
 endif

do_hsedit_normalButtons2
REPLACE_1_2_queryJoystick_varFromIRQ0_2 
                    ldx      #0                           ; queryJoystick 
                    jsr      jsrBank0X 
processJoyButtons
                    LDA      Vec_Joy_1_X                  ; load joystick 1 position X to A 
                    BEQ      mh_inputXDoneComplete        ; no x joystick input available 
                    BMI      mh_inputLeft                 ; joystick moved to left 
mh_inputRight: 
                    lda      #-12 
                    sta      inMoving 
                    inc      letterDisplayStart 
                    lda      letterDisplayStart 
                    cmpa     #MAX_LETTER+1 
                    bne      letOk2 
                    clr      letterDisplayStart 
letOk2 
                    bra      mh_inputXDoneComplete 

mh_inputLeft 
                    lda      #12 
                    sta      inMoving 
                    dec      letterDisplayStart 
                    bpl      letOk1 
                    lda      #MAX_LETTER 
                    sta      letterDisplayStart 
letOk1 
mh_inputXDoneComplete 
noQuery 
                    jsr      calibrationZero7 
                    lda      #$5f 
                    _INTENSITY_A  
                    lda      gameScale 
                    sta      <VIA_t1_lch_lo 
                    ldd      #$8000 
                    MY_MOVE_TO_D_START  
 if  DRAW_FIGHTER_IN_BANK0 = 1 
REPLACE_1_2_doFighterPrep_varFromIRQ0_3 
                    ldx      #0                           ; doFighterPrep 
                    MY_MOVE_TO_B_END  
                    jsr      jsrBank0X                    ; jsrBank0_fromBank1_Shift 
 else  
REPLACE_1_2_drawFighterPrep_varFrom1_13                   ;  bank 3 replace 
                    ldx      #0 
                    MY_MOVE_TO_B_END  
                    jsr      jsrBank3_fromShift_1         ;drawFighterPrep 
 endif  
                    jsr      Reset_Pen 
                    lda      gameScale                    ;#110 
                    _SCALE_A  
                    ldd      #(105*256)+(256-62) 
                    LDX      #HSBOX 
                    jsr      drawBox 
;....
                    jsr      calibrationZero16 
                    jsr      handleLetterInAir 
                    lda      gameScale 
                    sta      <VIA_t1_lch_lo 
                    ldy      #enterScore 
                    ldd      #$51d1 
                    jsr      printVectorStringFast 
                    lda      gameScale 
                    sta      <VIA_t1_lch_lo 
                    ldy      #player_score_6 
                    ldd      #$3000                       ;#$30dc 
                    jsr      printVectorStringFast 
                    lda      Vec_Loop_Count+1 
                    anda     #%00001111 
                    bne      noInitialChange 
                    lda      playerShotCounter 
                    ldu      #editPlayerInitials 
                    ldb      a,u 
                    cmpb     # '_' 
                    beq      changeToLetter 
changeToSpace 
                    ldb      # '_' 
                    bra      storeLetter 

changeToLetter 
                    ldb      savetyLetter 
storeLetter 
                    stb      a,u 
noInitialChange 
 if  OLDINISTIALS = 1 
                    lda      gameScale 
                    sta      <VIA_t1_lch_lo 
                    ldy      #editPlayerInitials 
                    ldd      #$30c0 
                    jsr      printVectorStringFast 
 else  
                    ldy      #editPlayerInitials 
                    clr      ltemp 
initalsloop 
                    lda      gameScale 
                    sta      <VIA_t1_lch_lo 
                    lda      ltemp 
                    ldu      #initalsPositions 
                    lsla     
                    ldd      a,u 
                    MY_MOVE_TO_D_START  
                    lda      #MAX_SCALE 
                    sta      <VIA_t1_lch_lo 
                    lda      ,y+ 
                    SUBA     #32 
                    lsla     
                    ldu      #ABC_8x5 
                    ldu      a,u 
                    inc      ltemp 
                    MY_MOVE_TO_A_END  
                    jsr      SMVB16_drawSmart 
                    _ZERO_VECTOR_BEAM  
                    lda      ,y 
                    bpl      initalsloop 
initialsDone 
 endif  
                    lda      gameScale 
                    sta      <VIA_t1_lch_lo 
                    ldd      letterDisplayOffset 
                    tst      inMoving 
                    beq      letterDisplayOffsetOk 
                    bmi      letterNegativeMoving 
letterPositiveMoving 
                    dec      inMoving 
                    addd     #2 
                    cmpd     #720 
                    blo      letterDisplayOffsetOk 
                    ldd      #0 
                    bra      letterDisplayOffsetOk 

letterNegativeMoving 
                    inc      inMoving 
                    subd     #2 
                    bpl      letterDisplayOffsetOk 
                    addd     #720 
                    bra      letterDisplayOffsetOk 

letterDisplayOffsetOk 
                    std      letterDisplayOffset 
                    bsr      displayLetterCircle 
                    lds      playershotlist_objects_head 
                    lda      #$7f                         ; shots are always bright! 
                    _INTENSITY_A  
                    puls     d,pc 
Player_shots_done_hs 
REPLACE_1_2_hsDoStars_varFrom1_1 
                    ldx      #0                           ; hsDoStars 
                    jmp      jmpBankIRQ3X 

starsDoneIn0 
                    lds      #MY_STACK                    ; CBFC ; correct the stack to default address 
                    jmp      HS_loop1 

;
; **************************************************************************
;
displayLetterCircle                                       ;#isfunction  
                    clr      letterCounterTmp 
                    ldy      #circle360x2 
                    ldd      letterDisplayOffset 
                    leay     d,y 
                    lda      gameScale 
                    sta      <VIA_t1_lch_lo 
                    clr      letterFirstFlag 
letterDisplayLoop 
                    ldd      ,y                           ; coordinate of first letter 
                    asra     
                    adda     #$40 
                    MY_MOVE_TO_D_START  
                    lda      letterCounterTmp 
                    cmpa     #MAX_LETTER +1 
                    beq      letterDisplayDone 
                    inc      letterCounterTmp 
                    ldu      #_abc_8x5 
                    lsla     
                    ldu      a,u                          ; draw smart list of current letter 
                    leay     (360/(MAX_LETTER+1))*2,y     ; init next letter pos 
; intensity
                    lda      letterDisplayStart 
                    cmpa     letterFirstFlag 
                    bne      notFirstLetter 
                    lda      #$7f                         ; first letter has intensity $7f 
                    bra      contDisplayLetterIntensity 

notFirstLetter 
                    lda      ,y 
                    asra     
                    asra     
                    adda     #$40 
                    nega     
                    adda     #$6f 
contDisplayLetterIntensity 
                    inc      letterFirstFlag 
; scale
                    ldb      ,y 
                    asrb     
                    addb     #$40 
                    lsrb     
                    lsrb     
                    lsrb     
                    lsrb     
                    negb     
                    addb     #MAX_SCALE 
                    stb      <VIA_t1_lch_lo               ; using lower scales, leaves "dots" at the end of each "full" vector, since the light is switched of after the "full" scale not the reduced 
                    MY_MOVE_TO_B_END  
                    _INTENSITY_A  
                    jsr      SMVB16_drawSmart 
                    _ZERO_VECTOR_BEAM  
                    lda      gameScale 
                    sta      <VIA_t1_lch_lo 
                    bra      letterDisplayLoop 

letterDisplayDone 
                    MY_MOVE_TO_A_END  
                    _ZERO_VECTOR_BEAM  
                    rts      

;
; **************************************************************************
;
initHighScoreEdit                                         ;#isfunction  
                    lda      #1 
                    sta      songLoop 
                    INIT_MUSIC  hsMusic 
; current achieved HS place is in highScorePosition
                    ldu      #highScoreBlock 
                    lda      difficulty 
                    bpl      normalHScont 
                    leau     HighScoreEntry * 4,u 
normalHScont 
                    lda      highScorePosition            ; place 
                    lsla                                  ; one hs entry is 8 bytes -> times 8 
                    lsla     
                    lsla     
                    leau     a,u 
; copy initials
                    ldd      ,u++ 
                    std      editPlayerInitials 
                    sta      savetyLetter 
                    lda      ,u 
                    ldb      #$80 
                    std      editPlayerInitials +2 
                    clr      playerShotCounter 
                    ldd      #0 
                    sta      playerBonusActive            ; draw fighter without shield 
                    sta      playerShotCount 
                    sta      inMoving 
                    sta      letterDisplayStart 
                    ldd      #$168 
                    std      letterDisplayOffset 
                    ldd      #1000 
                    std      playerShotSpeed 
;                    ldb      #$7f 
;                    stb      gameScale 
                    bsr      initPlayerShotList_highscore 
                    ldd      #Player_shots_done_hs        ; 
                    std      PLAYERSHOTS_DONE_A 
                    bsr      initStars_hs 
                    lda      #-1 
                    sta      doWarpFailure                ; indication for star type warpfailure (!=0) and indication for short stars (negative) 
REPLACE_1_2_starsDoneHs_varFrom1_2 
                    ldd      #0                           ;starsDoneHs 
                    std      STARS_DONE_A 
REPLACE_1_2_spawnStar_varFrom1_21 
                    ldx      #0                           ;spawnStar 
                    jsr      jsrBank3_fromShift_1 
REPLACE_1_2_spawnStar_varFrom1_22 
                    ldx      #0                           ;spawnStar 
                    jsr      jsrBank3_fromShift_1 
REPLACE_1_2_spawnStar_varFrom1_23 
                    ldx      #0                           ;spawnStar 
                    jsr      jsrBank3_fromShift_1 
REPLACE_1_2_spawnStar_varFrom1_24 
                    ldx      #0                           ;spawnStar 
                    jsr      jsrBank3_fromShift_1 
                    rts      

initStars_hs                                              ;#isfunction  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; stars
                    lda      #HS_MAX_STAR_OBJECTS 
                    ldu      #hs_stars_list 
                    stu      starlist_empty_head 
                    ldy      #STARS_DONE 
next_PS_list_entry_ig3_s1_hs 
                    leax     StarStruct,u 
                    stx      NEXT_STAR_OBJECT,u 
                    leau     ,x 
                    deca     
                    bne      next_PS_list_entry_ig3_s1_hs 
                    leau     -StarStruct,u 
                    sty      NEXT_STAR_OBJECT,u 
                    sty      starlist_objects_head 
                    rts      

initPlayerShotList_highscore                              ;#isfunction  
; player shots
                    lda      #HS_MAX_PLAYERSHOT_OBJECTS 
                    ldu      #hs_playershotobject_list 
                    stu      playershotlist_empty_head 
                    ldy      #PLAYERSHOTS_DONE 
next_PS_list_entry_ig3hs 
                    leax     PlayerShotStruct,u 
                    stx      NEXT_PLAYERSHOT_OBJECT,u 
                    leau     ,x 
                    deca     
                    bne      next_PS_list_entry_ig3hs 
                    leau     -PlayerShotStruct,u 
                    sty      NEXT_PLAYERSHOT_OBJECT,u 
                    sty      playershotlist_objects_head 
                    rts      

; **************************************************************************
;
; y pointer to string
; d move to
printVectorStringFast                                     ;#isfunction  
                    MY_MOVE_TO_D_START  
                    lda      #MAX_SCALE 
                    sta      <VIA_t1_lch_lo 
                    MY_MOVE_TO_A_END  
nextLetterPrintVector 
                    lda      ,y+ 
                    bmi      printVectorStringFastDone 
                    SUBA     #32 
                    lsla     
                    ldu      #ABC_8x5 
                    ldu      a,u 
                    jsr      SMVB16_drawSmart 
                    bra      nextLetterPrintVector 

printVectorStringFastDone 
                    _ZERO_VECTOR_BEAM  
                    rts      

;--
SHOT_START_POSITION_Y  =     $88+18                       ; must not be $80 
; shot stuff is copy paste (delete) from bank 3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; new list object to U
; leaves with flags set to result
; (positive = not successfull) ROM
; negative = successfull RAM
; destroys d, u 
newPlayerShotObject                                       ;#isfunction  
                    ldu      playershotlist_empty_head 
                    cmpu     #OBJECT_LIST_COMPARE_ADDRESS 
                    bls      cs_done_nops 
                                                          ; set the new empty head 
                    ldd      NEXT_PLAYERSHOT_OBJECT,u     ; the next in out empty list will be the new 
                    std      playershotlist_empty_head    ; head of our empty list 
                                                          ; load last of current object list 
; the old head is always our next
                    ldd      playershotlist_objects_head 
                    std      NEXT_PLAYERSHOT_OBJECT,u 
; newobject is always head
                    stu      playershotlist_objects_head 
                    inc      playerShotCount              ; and remember that we created a new object 
cs_done_nops 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
spawnPlayerShot                                           ;#isfunction  
                    bsr      newPlayerShotObject          ; "create" (or rather get) new object 
                    leax     ,u                           ; pointer to new object now in X also 
                    cmpu     #OBJECT_LIST_COMPARE_ADDRESS 
                    bls      spawnPlayerShot_end 
                    lda      playSoundFlags 
                    ldu      #BomberShotData              ;0 ; BomberShotData 
                    stu      sfx_pointer_3 
nosfx1 
                    ldd      #highscoreShotBehaviour 
                    std      BEHAVIOUR,x 
                    ldb      #0 
                    lda      #SHOT_START_POSITION_Y       ; pos $80 is impossible for a shot! 
                    std      Y_POS,x                      ; save start pos 
                    clrb     
                    std      Y_POS16,x 
toManyShotsInAir 
spawnPlayerShot_end 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
highscoreShotBehaviour                                    ;#isfunction  
                    MY_MOVE_TO_D_START  
; calc next position
                    ldd      Y_POS16+u_offset1,s          ; preload next user stack 
                    addd     playerShotSpeed 
                    bpl      removeThisPlayerShotInMove   ; and add letter to score 
shot1Ok_1_n 
                    std      Y_POS16+u_offset1,s 
                    sta      Y_POS+u_offset1,s 
shot1PosDone_1_n 
;................
                    ldb      #$ee                         ; light ON, ZERO OFF 
                    MY_MOVE_TO_A_END  
                    nop      
                    stb      <VIA_cntl                    ; [4] ZERO disabled, and BLANK disabled 
                    ldb      #$ee                         ; light ON, ZERO OFF 
                    tfr      a,a 
                    tfr      a,a 
                    stb      <VIA_cntl                    ; [4] ZERO disabled, and BLANK disabled 
                    lds      NEXT_PLAYERSHOT_OBJECT+u_offset1,s ; preload next user stack 
                    ldb      gameScale 
                    stB      VIA_t1_cnt_lo 
                    LDa      #$CC 
                    STA      VIA_cntl                     ;/BLANK low and /ZERO low 
                    ldd      #0 
                    std      <VIA_port_b 
                    puls     d,pc                         ; (D = y,x, pc = next object) 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
UPDATE_EMPTY_PLAYERLIST  macro  
                    dec      playerShotCount 
                    ldy      playershotlist_empty_head    ; set u free, as new free head 
                    sty      NEXT_PLAYERSHOT_OBJECT,x     ; load to u the next linked list element 
                    stx      playershotlist_empty_head 
                    cmpx     testShot 
                    bne      wasNottestShot\? 
                    ldd      #0 
                    std      testShot 
wasNottestShot\? 
                    cmpx     test2Shot 
                    bne      wasNottestShot2\? 
                    ldd      #0 
                    std      test2Shot 
wasNottestShot2\? 
                    endm     
removeThisPlayerShotInMove                                ;#isfunction  
                    ldx      #explosion1Data              ; explosion1Data 
                    stx      sfx_pointer_3 
                    lda      letterDisplayStart 
                    cmpa     #MAX_LETTER 
                    beq      delOne2 
                    sta      letterInMove 
                    lda      playerShotCounter 
                    asla     
                    ldx      #initalsPositions 
                    ldd      a,x 
                    std      letterTargetPosition 
                    ldd      #$0000 
                    std      letterInMovePosition 
                    bra      notReact 

delOne2 
                    jsr      reactOnLetterShot 
notReact 
                    ldb      gameScale 
                    stB      VIA_t1_cnt_lo 
                    LDa      #$CC 
                    STA      VIA_cntl                     ;/BLANK low and /ZERO low 
                    ldd      #0 
                    std      <VIA_port_b 
;removeThisPlayerShot:                                     ;#isfunction  
                    leax     u_offset1,s                  ; x -> pointer object struture (correction of offset) 
                    cmpx     playershotlist_objects_head  ; is it the first? 
                    bne      was_not_first_re             ; no -> jump 
was_first_re 
                    lds      NEXT_PLAYERSHOT_OBJECT,x     ; s pointer to next objext 
                    sts      playershotlist_objects_head  ; the next object will be the first 
                    bra      lazerRemoveEnd 

was_not_first_re                                          ;        find previous, go thru all objects from first and look where "I" am the next... 
                    ldy      playershotlist_objects_head  ; start at list head 
try_next_re 
                    cmpx     NEXT_PLAYERSHOT_OBJECT,y     ; am I the next object of the current investigated list element 
                    beq      found_next_switch_re         ; jup -> jump 
                    ldy      NEXT_PLAYERSHOT_OBJECT,y     ; otherwise load the next as new current 
                    bra      try_next_re                  ; and search further 

found_next_switch_re 
                    lds      NEXT_PLAYERSHOT_OBJECT,x     ; we load "our" next object to s 
                    sts      NEXT_PLAYERSHOT_OBJECT,y     ; and store our next in the place of our previous next and thus eleminate ourselfs 
lazerRemoveEnd 
                    UPDATE_EMPTY_PLAYERLIST               ; if not last, than finish and restore empties 
                    MY_MOVE_TO_B_END  
                    puls     d,pc                         ; (D = y,x) 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;--
displayHSCalibrationText 
                    IRQ_TO_0_SHIFT  
                    ldd      #900 
                    std      playerShotSpeed 
                    jsr      calibrationZero16 
                    lda      gameScale 
                    sta      <VIA_t1_lch_lo 
                    ldy      #enterScore 
                    ldd      #$50c4 
                    jsr      printVectorStringFast 
                    rts      

reactOnLetterShot 
                    ldu      #editPlayerInitials 
                    lda      letterDisplayStart 
                    cmpa     #MAX_LETTER 
                    beq      delOne 
                    adda     # 'A'
                    ldb      playerShotCounter 
                    sta      b,u 
                    inc      playerShotCounter 
endShot 
                    lda      playerShotCounter 
                    ldb      a,u 
                    stb      savetyLetter 
                    rts      

delOne 
                    clr      inEdit 
                    dec      playerShotCounter 
; backspace - 
; go one place back, and replace with SPACE
                    bpl      endShot2 
                    inc      playerShotCounter 
                    bra      endShot 

endShot2 
; restore "old" letter on this position
                    lda      playerShotCounter 
                    inca     
                    ldb      savetyLetter 
                    stb      a,u 
; and backspace delete the letter on the last position
                    ldb      #$20 
                    lda      playerShotCounter 
                    stb      a,u 
                    stb      savetyLetter 
                    rts      

;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;--
enterScore 
                    db       "HIGH SCORE!",$80
                    include  "FastABC.asm"
;
; **************************************************************************
BUZZBOX:            FCB      $00, $3d 
                    FCB      -$10, $00 
                    FCB      $00,-$3d 
                    FCB      $10, $00 
NOBUZZBOX:          FCB      $00, $42 
                    FCB      -$10, $00 
                    FCB      $00,-$42 
                    FCB      $10, $00 
drawBuzzBox 
                    LDX      #BUZZBOX 
                    lda      gameScale 
                    _SCALE_A  
                    ldd      #($38*256)+(-$80+8) 
                    bra      drawBox 

drawNoBuzzBox 
                    LDX      #NOBUZZBOX 
                    lda      gameScale 
                    _SCALE_A  
                    ldd      #($38*256)+($8) 
drawBox 
                    MY_MOVE_TO_D_START  
                    LDA      #$98 
                    STA      <VIA_aux_cntl                ; Shift reg mode = 000 free disable, T1 PB7 enabled 
                    ldb      Vec_Loop_Count+1 
                    ASRB                                  ;Get line pattern from table 
                    ANDB     #$03 
                    LDY      #$F0FD 
                    LDB      B,Y 
                    STB      hs_pattern                   ;Store pattern 
                    MY_MOVE_TO_B_END  
                    LDA      #$81                         ; no move, no mux 
                    sta      <VIA_port_b 
                    LDA      #$18                         ; No T1 control of ramp 
                    STA      <VIA_aux_cntl                ; Shift reg mode = 000 free disable, T1 PB7 enabled 
                    IRQ_TO_0_T1  
                    LDA      #$04                         ;Draw 4 lines 
LF433_hs:           DECA     
                    STA      hs_count 
                    LDD      ,X                           ;Get next coordinate pair 
                    STA      <VIA_port_a                  ;Send Y to A/D 
                    lda      #$80 
                    sta      <VIA_port_b                  ;Enable mux 
                    LEAX     2,X                          ;Point to next coordinate pair 
                    inca     
                    sta      <VIA_port_b                  ;Disable mux 
                    STB      <VIA_port_a                  ;Send X to A/D 
                    ldb      #$1 
                    LDA      hs_pattern                   ;Get default pattern 
                    stb      <VIA_port_b                  ; start moving 
                    STA      <VIA_shift_reg               ;Put pattern in shift register 
                    WAIT14   
                    STA      <VIA_shift_reg               ;Put pattern in shift register 
                    WAIT14   
                    STA      <VIA_shift_reg               ;Put pattern in shift register 
                    WAIT14   
                    STA      <VIA_shift_reg               ;Put pattern in shift register 
                    WAIT14   
                    STA      <VIA_shift_reg               ;Put pattern in shift register 
                    WAIT14   
                    STA      <VIA_shift_reg               ;Put pattern in shift register 
                    WAIT14   
                    STA      <VIA_shift_reg               ;Put pattern in shift register 
                    WAIT14   
                    STA      <VIA_shift_reg               ;Put pattern in shift register 
                    WAIT14   
                    STA      <VIA_shift_reg               ;Put pattern in shift register 
                    LDA      #$81                         ; no move, no mux 
                    sta      <VIA_port_b 
; Don't reset the zero reference if last line is really short?
                    CLR      <VIA_shift_reg               ;Clear shift register (blank output) 
                    LDA      hs_count                     ;Get line counter 
                    BNE      LF433_hs                     ;Go back for more points 
                    IRQ_TO_0_SHIFT  
                    RTS      

HSBOX:              FCB      $00, $7f 
                    FCB      -$1c, $00 
                    FCB      $00,-$7f 
                    FCB      $1c, $00 
handleLetterInAir 
                    ldd      letterTargetPosition 
                    beq      returnNow 
                    cmpd     letterInMovePosition 
                    beq      letterMoveFinished 
                    lda      gameScale 
                    sta      <VIA_t1_lch_lo 
                    ldd      letterInMovePosition 
                    MY_MOVE_TO_D_START  
                    lda      letterInMovePosition 
                    adda     #2 
                    cmpa     letterTargetPosition 
                    blt      posOkY 
                    lda      letterTargetPosition 
posOkY 
                    sta      letterInMovePosition 
                    lda      letterInMovePosition+1 
                    suba     #2 
                    cmpa     letterTargetPosition+1 
                    bgt      posOkX 
                    lda      letterTargetPosition+1 
posOkX 
                    sta      letterInMovePosition+1 
                    lda      #MAX_SCALE 
                    sta      <VIA_t1_lch_lo 
                    lda      letterInMove 
                    ADDA     # 'A'-32 
                    lsla     
                    ldu      #ABC_8x5 
                    ldu      a,u 
                    MY_MOVE_TO_A_END  
                    jsr      SMVB16_drawSmart 
                    _ZERO_VECTOR_BEAM  
returnNow 
                    rts      

letterMoveFinished 
                    clr      inEdit 
                    ldd      #0 
                    std      letterTargetPosition 
                    jmp      reactOnLetterShot 
