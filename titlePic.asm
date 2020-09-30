; bank 1
;*************************************************************************
                    bss      
                    org      arkosPlayerMemEnd 
animCounter         ds       1 
animDelay           ds       1 
titlePos            ds       2 
titleIntensity      ds       1 
shipPosY            ds       1 
shipPosX            ds       1 
shipScale           ds       1 
shipDisplay         ds       1 
counter             ds       1 
                    code     
;*************************************************************************
MY_MOVE_TO_D_START_NS  macro  
                    STA      <VIA_port_a                  ;Store Y in D/A register 
                    LDA      #$CE                         ;Blank low, zero high? 
                    STA      <VIA_cntl                    ; 
                    CLRA     
                    STA      <VIA_port_b                  ;Enable mux ; hey dis si "break integratorzero 440" 
 if  IS_VIA_FAULTY_RESISTENT = 1 
                    inca     
                    sta      <VIA_port_b 
                    deca     
 else  
                    inc      <VIA_port_b 
 endif  
                    STB      <VIA_port_a                  ;Store X in D/A register 
                    STA      <VIA_t1_cnt_hi               ;enable timer 
                    endm     
;*************************************************************************
displayTitlePicture 
; jsr PLY_STOP
                    lda      #-10 
                    sta      songLoop 
                    ldu      #introMusic                  ; echoMusic 
                    jsr      PLYINIT 
                    ldd      #$807f 
                    std      shipPosY 
                    clr      shipDisplay 
                    lda      #7 
                    sta      shipScale 
                    ldd      #0 
                    std      Vec_Loop_Count 
                    std      animCounter 
                    sta      <VIA_shift_reg 
                    std      titlePos 
                    lda      #-40 
                    sta      titleIntensity 
                    clr      songLoop 
                    lda      #50 
                    sta      counter 
                    clr      current_button_state 
                    incb     
;                    JSR      getButtonState                 ; get button status 
displayTitleLoop2 
; blend title in
; scroll title up
; play new music
; display ship
displayTitleLoop 
                    tst      songOver 
                    bne      notOver 
                    jsr      beQuiet 
                    dec      titleIntensity 
                    dec      titleIntensity 
cccccc 
                    dec      counter 
                    lbeq     returnToCaller 
notOver 
                    JSR      getButtonState               ; get button status 
                    andb     #%00000011 
                    cmpb     #1 
                    lbeq     returnToCaller 
                    IRQ_TO_0_SHIFT  
                    jSR      Wait_Recal_noShift           ; Vectrex BIOS recalibration 
; this is a "recalibrate"
                    LDd      #$7F7F 
                    MY_MOVE_TO_D_START_NS  
                    MY_MOVE_TO_B_END  
                    _ZERO_VECTOR_BEAM  
                    LDd      #$8080 
                    MY_MOVE_TO_D_START_NS  
                    MY_MOVE_TO_B_END  
                    _ZERO_VECTOR_BEAM  
                    jsr      Reset_Pen                    ; stabelize display? 
                    MY_MOVE_TO_D_START_NS  
                    jsr      PLY_PLAY 
                    jsr      do_ym_sound2 
                    lda      titleIntensity 
                    jsr      Intensity_a 
                    IRQ_TO_0_SHIFT  
                    jsr      calibrationZero7 
                    lda      #80 
                    sta      <VIA_t1_cnt_lo 
                    ldd      titlePos 
                    MY_MOVE_TO_D_START_NS  
                    tst      songOver 
                    beq      notHighYet 
                    inc      titleIntensity 
                    lda      titleIntensity 
                    cmpa     #$4f 
                    blt      notbrightyet 
                    lda      #$4f 
                    sta      titleIntensity 
                    inc      titlePos 
                    lda      titlePos 
                    cmpa     #126 
                    blo      notHighYet 
                    lda      #126 
                    sta      titlePos 
notHighYet 
notbrightyet 
                    LDy      #titleWritingData            ; address of data 
                    LDU      ,y++ 
not_lastTitlePart 
                    lda      #VB_SPRITE_SCALE 
                    sta      VIA_t1_cnt_lo 
                    MY_MOVE_TO_B_END  
                    jsr      SMVB_drawSmart 
nextScenePart: 
                    lda      #80 
                    sta      <VIA_t1_cnt_lo 
                    ldd      titlePos 
                    MY_MOVE_TO_D_START_NS  
                    LDU      ,y++ 
                    LDa      ,y 
                    bne      not_lastTitlePart 
                    lda      #VB_SPRITE_SCALE 
                    sta      VIA_t1_cnt_lo 
                    MY_MOVE_TO_B_END  
                    jsr      SMVB_drawSmart 
nextTitlePart 
                    lda      titlePos 
                    cmpa     #126 
                    lblo     displayTitleLoop2 
                    tst      shipDisplay 
                    lbne     displayTitleLoop2 
; display SHIP
                    ldd      shipPosY 
                    cmpb     #40 
                    blt      slower1 
                    adda     #4 
                    subb     #4 
                    std      shipPosY 
                    bra      shipMoveCont_S9 

slower1 
                    cmpb     #20 
                    blt      slower2 
                    adda     #2 
                    subb     #3 
                    std      shipPosY 
                    bra      shipMoveCont_S9 

slower2 
                    cmpb     #-10 
                    blt      slower3 
                    adda     #1 
                    subb     #1 
                    std      shipPosY 
                    bra      shipMoveCont_S9 

slower3 
                    cmpb     #-20 
                    blt      slower4 
                    adda     #1 
                    subb     #3 
                    std      shipPosY 
                    bra      shipMoveCont_S9 

slower4 
                    cmpb     #-40 
                    blt      slower5 
                    adda     #1 
                    subb     #4 
                    std      shipPosY 
                    bra      shipMoveCont_S9 

slower5 
                    adda     #1 
                    subb     #5 
                    std      shipPosY 
shipMoveCont_S9 
                    cmpb     #0 
                    bne      b_not0_s9 
                    dec      shipScale 
b_not0_s9 
                    cmpb     #-20 
                    bne      b_not20_s9 
                    dec      shipScale 
b_not20_s9 
                    cmpb     #-31 
                    bne      b_not30_s9 
                    dec      shipScale 
b_not30_s9 
                    cmpb     #-43 
                    bne      b_not40_s9 
                    dec      shipScale 
b_not40_s9 
                    cmpb     #-63 
                    bne      b_not50_s9 
                    dec      shipScale 
b_not50_s9 
                    cmpb     #-90 
                    bgt      b_not11_s9 
                    inc      shipDisplay 
b_not11_s9 
                    LDy      #shipScenario                ; address of data 
nextShipPart: 
                    lda      #$c0 
                    sta      VIA_t1_cnt_lo 
                    ldd      shipPosY 
                    MY_MOVE_TO_D_START_NS  
                    LDU      ,y++ 
                    LDa      ,y 
                    beq      lastShipPart 
                    lda      shipScale                    ;#SPRITE_SCALE9 
                    sta      VIA_t1_cnt_lo 
                    MY_MOVE_TO_B_END  
                    jsr      SMVB_drawSmart 
                    bra      nextShipPart 

lastShipPart 
                    dec      animDelay 
                    bpl      noAnimChangeTS9_pre 
                    inc      animCounter 
                    lda      #ANIMATION_DELAY 
                    sta      animDelay 
noAnimChangeTS9_pre 
                    lda      shipScale                    ;#SPRITE_SCALE9 
                    sta      VIA_t1_cnt_lo 
                    MY_MOVE_TO_B_END  
                    jsr      SMVB_drawSmart 
nextTitlePart2 
noAnimChangeTS9 
                    lda      animCounter 
                    lsla     
                    ldu      #shipEngine_animData 
                    leau     a,u 
                    ldd      ,u 
                    bne      animIsOk_TS9 
                    sta      animCounter 
                    bra      noAnimChangeTS9 

animIsOk_TS9 
                    LDd      #$CEc0                       ;Blank low, zero high? 
                    STA      <VIA_cntl 
                    stb      VIA_t1_cnt_lo 
                    ldd      shipPosY 
                    MY_MOVE_TO_D_START_NS  
                    lda      shipScale                    ;#SPRITE_SCALE9 
                    sta      VIA_t1_cnt_lo 
                    ldu      ,u 
                    MY_MOVE_TO_B_END  
                    jsr      SMVB_drawSmart 
                    jmp      displayTitleLoop 

returnToCaller 
                    lda      additionalFlags 
                    ora      #BIT_TITLE_SEEN 
                    sta      additionalFlags 
                    rts      

;***************************************************************************
; DATA SECTION
;***************************************************************************
shipScenario 
                    DW       ScenList_0                   ; list of all single vectorlists in this 
                    DW       ScenList_1 
                    DW       ScenList_2 
                    DW       ScenList_3 
                    DW       ScenList_4 
                    DW       ScenList_5 
                    DW       ScenList_6 
                    DW       ScenList_7 
                    DW       ScenList_8 
                    DW       ScenList_9 
                    DW       ScenList_10 
                    DW       ScenList_11 
                    DW       ScenList_12 
                    DW       ScenList_13 
                    DW       ScenList_14 
                    DW       ScenList_15 
                    DW       0 
ScenList_0 
                    db       -$69, $01, $57, hi(SMVB_continue_tripple), lo(SMVB_continue_tripple) 
                    db       $4F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       -$55, $01, -$2D, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
ScenList_1 
                    db       -$6F, $01, $0C, hi(SMVB_continue_quadro), lo(SMVB_continue_quadro) 
                    db       $5F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       -$76, $01, $0A, hi(SMVB_startDraw_octo), lo(SMVB_startDraw_octo) 
                    db       $4F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       -$5A, $01, -$2D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       $0F, $01, -$11, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $5F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       $6A, $01, $11, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $4F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       $4D, $01, -$5D, hi(SMVB_startDraw_hex), lo(SMVB_startDraw_hex) 
                    db       $3F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       $30, $01, -$12, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $4F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       $46, $01, -$55, hi(SMVB_startDraw_tripple), lo(SMVB_startDraw_tripple) 
                    db       $3F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       $00, $01, -$32, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$39, $01, -$2E, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$3C, $01, $06 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
ScenList_2 
                    db       -$6A, $01, -$42, hi(SMVB_continue_octo), lo(SMVB_continue_octo) 
                    db       -$02, $01, $2A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
ScenList_3 
                    db       -$65, $01, -$65, hi(SMVB_continue_quadro), lo(SMVB_continue_quadro) 
                    db       $4F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       $43, $01, -$5B, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $3F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       $2E, $01, -$20, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$12, $01, -$2E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
ScenList_4 
                    db       -$25, $01, -$65, hi(SMVB_continue_hex), lo(SMVB_continue_hex) 
                    db       $5F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       $3D, $01, -$60, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $3F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       -$06, $01, -$3E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$2D, $01, -$24, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$3E, $01, $08 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
ScenList_5 
                    db       $2D, $01, -$7B, hi(SMVB_continue_octo), lo(SMVB_continue_octo) 
                    db       $1F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       $14, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0D, $01, $06, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $09, $01, $19 
                    db       $4F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       -$16, $01, $5A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       -$14, $01, $06, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $3F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       -$1B, $01, $3E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
ScenList_6 
                    db       $17, $01, -$65, hi(SMVB_continue_octo), lo(SMVB_continue_octo) 
                    db       $4F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       $5C, $01, -$1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $5F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       $75, $01, $5A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $4F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       -$09, $01, $4E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $5F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       -$25, $01, $7D, hi(SMVB_startDraw_octo), lo(SMVB_startDraw_octo) 
                    db       -$25, $01, $7D, hi(SMVB_continue_quadro), lo(SMVB_continue_quadro) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
ScenList_7 
                    db       -$4B, $01, $6A, hi(SMVB_continue_hex), lo(SMVB_continue_hex) 
                    db       $4F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       $2B, $01, -$5B, hi(SMVB_startDraw_tripple), lo(SMVB_startDraw_tripple) 
                    db       $3F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       $27, $01, -$0E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $4F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       $53, $01, -$13, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $5F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       $64, $01, $34, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $4F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       $07, $01, $45, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
ScenList_8 
                    db       $08, $01, $79, hi(SMVB_continue_quadro), lo(SMVB_continue_quadro) 
                    db       $51, $01, $24, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $1E, $01, -$5B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $5F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       $31, $01, $61, hi(SMVB_startDraw_hex), lo(SMVB_startDraw_hex) 
                    db       $1F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       $1E, $01, $16, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
ScenList_9 
                    db       $3E, $01, $7D, hi(SMVB_continue_octo), lo(SMVB_continue_octo) 
                    db       $3F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       $32, $01, $2D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $5F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       $12, $01, -$79, hi(SMVB_startDraw_quadro), lo(SMVB_startDraw_quadro) 
                    db       $3F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       $2E, $01, -$0A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $5F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       $0A, $01, -$65, hi(SMVB_startDraw_tripple), lo(SMVB_startDraw_tripple) 
                    db       $1F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       -$1E, $01, -$1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1F, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
ScenList_10 
                    db       $6A, $01, $53, hi(SMVB_continue_hex), lo(SMVB_continue_hex) 
                    db       $3F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       $1B, $01, $32, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
ScenList_11 
                    db       $5B, $01, $74, hi(SMVB_continue_hex), lo(SMVB_continue_hex) 
                    db       $5F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       -$20, $01, -$7B, hi(SMVB_startDraw_octo), lo(SMVB_startDraw_octo) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
ScenList_12 
                    db       $76, $01, -$49, hi(SMVB_continue_quadro), lo(SMVB_continue_quadro) 
                    db       $1F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       $1F, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1E, $01, $15, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $5F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       -$18, $01, $69, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $3F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       -$21, $01, $12, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $5F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       -$1C, $01, $6F, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
ScenList_13 
                    db       $79, $01, -$0F, hi(SMVB_continue_quadro), lo(SMVB_continue_quadro) 
                    db       $3F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       -$0D, $01, -$22, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
ScenList_14 
                    db       $4B, $01, -$3D, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $5F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       $51, $01, -$66, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $4F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       $19, $01, -$57, hi(SMVB_startDraw_tripple), lo(SMVB_startDraw_tripple) 
                    db       -$15, $01, -$48, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $3F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       -$2A, $01, -$1E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $4F, 0, 0, hi(SMVB_LightOff_Intensity), lo(SMVB_LightOff_Intensity) 
                    db       -$48, $01, $2B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
ScenList_15 
                    db       $00, $01, -$79, hi(SMVB_continue_quadro), lo(SMVB_continue_quadro) 
                    db       -$5A, $01, $15, hi(SMVB_startDraw_octo), lo(SMVB_startDraw_octo) 
                    db       -$5A, $01, $15, hi(SMVB_continue_quadro), lo(SMVB_continue_quadro) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
shipEngine_animData 
                    DW       AnimList_0                   ; list of all single vectorlists in this 
                    DW       AnimList_1 
                    DW       AnimList_2 
                    DW       AnimList_3 
                    DW       0 
AnimList_0 
                    db       -$41, $01, $7C, hi(SMVB_continue_quadro), lo(SMVB_continue_quadro) 
                    db       $08, $01, -$1B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $13, $01, -$24, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $1B, $01, -$63, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $34, $01, $7E, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       $11, $01, -$23, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $07, $01, -$1C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $22, $01, -$6D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$49, $01, -$4D, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$26, $01, $75, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$12, $01, $3F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$22, $01, $64, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
AnimList_1 
                    db       -$2C, $01, $58, hi(SMVB_continue_hex), lo(SMVB_continue_hex) 
                    db       $03, $01, -$1A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $17, $01, -$31, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $0D, $01, -$45, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $34, $01, $73, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       $12, $01, -$23, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0F, $01, -$23, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $28, $01, -$6B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$55, $01, -$27, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$26, $01, $7B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0F, $01, $28, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$19, $01, $47, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
AnimList_2 
                    db       -$2C, $01, $5D, hi(SMVB_continue_hex), lo(SMVB_continue_hex) 
                    db       $00, $01, -$20, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0C, $01, -$31, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $ee, $01, -$39, hi(SMVB_startDraw_yStays_single), lo(SMVB_startDraw_yStays_single) ; y was $0C, now $ee 
                    db       $1F, $01, -$45, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $0E, $01, -$29, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $12, $01, $6A, hi(SMVB_startMove_tripple), lo(SMVB_startMove_tripple) 
                    db       $ee, $01, -$14, hi(SMVB_startDraw_yStays_single), lo(SMVB_startDraw_yStays_single) ; y was $12, now $ee 
                    db       $1E, $01, -$33, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $ee, $01, -$54, hi(SMVB_startDraw_yStays_single), lo(SMVB_startDraw_yStays_single) ; y was $1E, now $ee 
                    db       $11, $01, -$37, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $0A, $01, -$2B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$48, $01, -$44, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$12, $01, $42, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1D, $01, $4A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$1E, $01, $65, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$19, $01, $44, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$09, $01, $1D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
AnimList_3 
                    db       -$42, $01, $69, hi(SMVB_continue_tripple), lo(SMVB_continue_tripple) 
                    db       -$0C, $01, $32, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $4C, $01, $2A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $1E, $01, -$5E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $42, $01, $52, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$1E, $01, $5B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$11, $01, $2E, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$14, $01, $24, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$53, $01, -$06, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $21, $01, -$66, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$5E, $01, -$05, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$06, $01, $25, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
titleWritingData 
                    DW       titleWriting_0               ; list of all single vectorlists in this 
                    DW       titleWriting_1 
                    DW       titleWriting_2 
                    DW       titleWriting_3 
                    DW       titleWriting_4 
                    DW       titleWriting_5 
                    DW       titleWriting_6 
                    DW       titleWriting_7 
                    DW       titleWriting_8 
                    DW       titleWriting_9 
                    DW       titleWriting_10 
                    DW       titleWriting_11 
                    DW       titleWriting_12 
                    DW       titleWriting_13 
                    DW       titleWriting_14 
                    DW       titleWriting_15 
                    DW       titleWriting_16 
                    DW       titleWriting_17 
                    DW       titleWriting_18 
                    DW       titleWriting_19 
                    DW       titleWriting_20 
                    DW       0 
titleWriting_0 
                    db       $1D, $01, $66, hi(SMVB_continue_octo), lo(SMVB_continue_octo) 
                    db       $1D, $01, $66, hi(SMVB_continue_quadro), lo(SMVB_continue_quadro) 
                    db       $3A, $01, -$49, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $19, $01, -$42, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $11, $01, -$71, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $00, $01, -$5C, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$0C, $01, -$65, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$10, $01, -$57, hi(SMVB_continue_octo), lo(SMVB_continue_octo) 
                    db       -$10, $01, -$57, hi(SMVB_continue_quadro), lo(SMVB_continue_quadro) 
                    db       -$03, $01, -$47, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $03, $01, -$62, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
titleWriting_1 
                    db       $1B, $01, -$59, hi(SMVB_continue_octo), lo(SMVB_continue_octo) 
                    db       $1B, $01, -$59, hi(SMVB_continue_quadro), lo(SMVB_continue_quadro) 
                    db       -$6A, $01, -$39, hi(SMVB_startDraw_quadro), lo(SMVB_startDraw_quadro) 
                    db       $74, $01, -$48, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $0D, $01, -$17, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$32, $01, -$7C 
                    db       -$0C, $01, $3B 
                    db       -$70, $01, $40, hi(SMVB_continue_tripple), lo(SMVB_continue_tripple) 
                    db       -$0E, $01, $23, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $21, $01, $4C 
                    db       $19, $01, $1F 
                    db       $79, $01, $31, hi(SMVB_continue_quadro), lo(SMVB_continue_quadro) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
titleWriting_2 
                    db       $20, $01, -$7D, hi(SMVB_continue_octo), lo(SMVB_continue_octo) 
                    db       $00, $01, $46, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $06, $01, $53, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $12, $01, $56, hi(SMVB_continue_octo), lo(SMVB_continue_octo) 
                    db       $12, $01, $56, hi(SMVB_continue_quadro), lo(SMVB_continue_quadro) 
                    db       $0C, $01, $65, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $00, $01, $4B, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$0D, $01, $6E, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$19, $01, $47, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$2C, $01, $4B, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
titleWriting_3 
;                db       $0, $01, $0, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$1B, $01, -$64, hi(SMVB_continue_octo), lo(SMVB_continue_octo) 
                    db       -$1B, $01, -$64, hi(SMVB_continue_quadro), lo(SMVB_continue_quadro) 
                    db       -$33, $01, $4C, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       -$3B, $01, $79, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$0C, $01, $4F, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $06, $01, $51, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $10, $01, $5A, hi(SMVB_continue_octo), lo(SMVB_continue_octo) 
                    db       $10, $01, $5A, hi(SMVB_continue_quadro), lo(SMVB_continue_quadro) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
titleWriting_4 
                    db       $0, $01, $0, hi(SMVB_continue_single), lo(SMVB_continue_single) ; cranky support 
                    db       -$4A, $01, $78, hi(SMVB_continue_quadro), lo(SMVB_continue_quadro) 
                    db       $61, $01, $00, hi(SMVB_startDraw_hex), lo(SMVB_startDraw_hex) 
                    db       $16, $01, -$42, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $17, $01, $55, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$71, $01, $00, hi(SMVB_continue_hex), lo(SMVB_continue_hex) 
                    db       -$14, $01, -$20, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
titleWriting_5 
                    db       $0, $01, $0, hi(SMVB_continue_single), lo(SMVB_continue_single) ; cranky support 
                    db       -$39, $01, $5B, hi(SMVB_continue_hex), lo(SMVB_continue_hex) 
                    db       -$11, $01, -$64, hi(SMVB_startDraw_octo), lo(SMVB_startDraw_octo) 
                    db       -$11, $01, -$64, hi(SMVB_continue_quadro), lo(SMVB_continue_quadro) 
                    db       -$04, $01, -$4C, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $0F, $01, -$45, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $19, $01, -$41, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $36, $01, -$4D, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $56, $01, -$39 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
titleWriting_6 
                    db       -$11, $01, $75, hi(SMVB_continue_octo), lo(SMVB_continue_octo) 
                    db       -$3D, $01, -$64, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0B, $01, -$17, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $24, $01, $00 
                    db       -$1B, $01, -$55, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $20, $01, -$1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $57, $01, $0D, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $26, $01, $29, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $1B, $01, $70 
                    db       -$21, $01, $23 
                    db       $2E, $01, $00 
                    db       $0C, $01, $4A 
                    db       -$69, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $00, $01, $22, hi(SMVB_continue_newY_eq_oldX_single), lo(SMVB_continue_newY_eq_oldX_single) ; y is $00 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
titleWriting_7 
                    db       $17, $01, $4F, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $73, $01, $00, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $11, $01, -$3E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1D, $01, $54, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$67, $01, $00, hi(SMVB_continue_tripple), lo(SMVB_continue_tripple) 
                    db       $13, $01, $43, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$10, $01, $2F, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$43, $01, $03, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$2B, $01, -$1E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$30, $01, -$72, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $17, $01, -$25, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $5E, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
titleWriting_8 
                    db       $03, $01, $4F, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$04, $01, -$3B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1D, $01, -$03, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$0B, $01, -$3D 
                    db       -$55, $01, -$04, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$2E, $01, -$3E, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $23, $01, -$10 
                    db       $5B, $01, $06, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $0B, $01, -$3F, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1E, $01, $4A, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$25, $01, -$01, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $17, $01, $3B 
                    db       -$09, $01, $21 
                    db       -$1F, $01, $14 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
titleWriting_9 
                    db       -$3D, $01, -$65, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$2E, $01, -$25, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$2D, $01, -$6D, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$07, $01, -$29, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $1A, $01, -$20 
                    db       $60, $01, $1B, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $26, $01, $2B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1D, $01, $58, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$2A, $01, $2E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$40, $01, $04, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
titleWriting_10 
                    db       $0C, $01, -$6C, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$0F, $01, -$36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$24, $01, -$19, hi(SMVB_continue6_single), lo(SMVB_continue6_single) 
                    db       -$46, $01, -$06 
                    db       $1A, $01, $5A 
                    db       $1B, $01, $1F 
                    db       $37, $01, -$05 
                    db       $0D, $01, -$1F 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
titleWriting_11 
                    db       $06, $01, $76, hi(SMVB_continue_tripple), lo(SMVB_continue_tripple) 
                    db       -$11, $01, -$53, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$60, $01, -$07, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $1F, $01, $6C 
                    db       $17, $01, $0D 
                    db       $26, $01, $00 
                    db       $15, $01, -$1F 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
titleWriting_12 
                    db       $02, $01, $79, hi(SMVB_continue_octo), lo(SMVB_continue_octo) 
                    db       $02, $01, $79, hi(SMVB_continue_quadro), lo(SMVB_continue_quadro) 
                    db       -$10, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$17, $01, -$45, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $16, $01, -$04 
                    db       $11, $01, $49 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
titleWriting_13 
                    db       $01, $01, $5F, hi(SMVB_continue_octo), lo(SMVB_continue_octo) 
                    db       $01, $01, $5F, hi(SMVB_continue_quadro), lo(SMVB_continue_quadro) 
                    db       -$11, $01, -$63, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$6A, $01, -$09, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $29, $01, $6C 
                    db       $52, $01, $00 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
titleWriting_14 
                    db       -$08, $01, $69, hi(SMVB_continue_octo), lo(SMVB_continue_octo) 
                    db       -$08, $01, $69, hi(SMVB_continue_quadro), lo(SMVB_continue_quadro) 
                    db       $00, $01, -$28, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $7D, $01, $00, hi(SMVB_continue_tripple), lo(SMVB_continue_tripple) 
                    db       -$27, $01, -$7E, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$11, $01, $32 
                    db       -$5E, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $21, $01, -$23, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$18, $01, -$6C 
                    db       -$20, $01, -$22 
                    db       -$5A, $01, -$0D, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$1B, $01, $1C, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1D, $01, $51, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$23, $01, $00, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$09, $01, $1B 
                    db       $46, $01, $67 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
titleWriting_15 
                    db       -$10, $01, $70, hi(SMVB_continue_octo), lo(SMVB_continue_octo) 
                    db       -$10, $01, $70, hi(SMVB_continue_quadro), lo(SMVB_continue_quadro) 
                    db       -$0C, $01, -$51, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $29, $01, -$1D, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $57, $01, $1C, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $1F, $01, $24, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $12, $01, $50, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$0B, $01, $1C, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$28, $01, $10 
                    db       -$28, $01, -$1F 
                    db       -$15, $01, -$47, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$1B, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1E, $01, $71, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$55, $01, -$78, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
titleWriting_16 
                    db       $01, $01, $66, hi(SMVB_continue_octo), lo(SMVB_continue_octo) 
                    db       -$54, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$27, $01, -$6B, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $68, $01, $0B 
                    db       $13, $01, $60 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
titleWriting_17 
                    db       $04, $01, -$5A, hi(SMVB_continue_hex), lo(SMVB_continue_hex) 
                    db       $51, $01, $00, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $0A, $01, -$36, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $19, $01, $49, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$3D, $01, $00, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $00, $01, $71 
                    db       -$2F, $01, -$7D 
                    db       -$64, $01, $00, hi(SMVB_continue_quadro), lo(SMVB_continue_quadro) 
                    db       $0C, $01, $47, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$4E, $01, -$77 
                    db       $10, $01, -$21 
                    db       $1E, $01, $00 
                                                          ; db $7B, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_tripple) 
                    db       82, $01, $00, hi(SMVB_continue_tripple), lo(SMVB_continue_tripple) 
                    db       -$53, $01, -$63, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$0A, $01, -$49, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $21, $01, -$23 
                    db       $58, $01, $13, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $34, $01, $21, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $0D, $01, $46, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$08, $01, $1F, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$26, $01, $0E 
                    db       $00, $01, $2C 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
titleWriting_18 
                    db       $00, $01, -$70, hi(SMVB_continue_hex), lo(SMVB_continue_hex) 
                    db       $0A, $01, $40, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       -$18, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$23, $01, -$62, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $3E, $01, $09, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $1A, $01, $12 
                    db       $02, $01, $18 
                    db       -$13, $01, $10 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
titleWriting_19 
                    db       -$05, $01, -$66, hi(SMVB_continue_octo), lo(SMVB_continue_octo) 
                    db       -$49, $01, -$69, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       -$0C, $01, -$51, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $28, $01, -$1D 
                    db       $58, $01, $1D, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $1F, $01, $22, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $11, $01, $51, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$0C, $01, $1E, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$29, $01, $0F 
                    db       -$28, $01, -$1E 
                    db       -$15, $01, -$47, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$1B, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $19, $01, $5E, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
titleWriting_20 
                    db       $02, $01, -$74, hi(SMVB_continue_octo), lo(SMVB_continue_octo) 
                    db       -$11, $01, -$47, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$16, $01, $02, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $18, $01, $45 
                    db       $0F, $01, $00 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
