;BANK 0
Y_OFFSET_DESKTOP    =        $28 
; all things "desktop" 
; desktop as in command center of Vec T Rex
;
; "must" be included beforehand, so some
; vars (pointers) are known
                    include  "titleScenery.asm"
; some variable in RAM
                    bss      
TITLE_DISPLAY_MAN   =        %00000001 
TITLE_MUST_INIT_STAGE  =     %10000000 
TITLE_DESKTOP_LIT   =        %00000010 
titleRoundCounter   ds       2 
desktop_flags       ds       1 
screenSize          ds       1 
screenIntensity     ds       1 
iconIntensity       ds       1 
interStageCounter   ds       1 
introStage          ds       1 
stageRAM_start      ds       0 
                    code     
;.....................................................................
; first time on desktop 
; init all
initAllTitle 
                    clr      introStage 
                    lda      #TITLE_MUST_INIT_STAGE 
                    sta      desktop_flags 
                    clr      iconIntensity 
                    lda      #$1f 
                    sta      screenIntensity 
                    ldd      #0 
                    std      titleRoundCounter 
                    rts      

;.....................................................................
; init for "storyboard player"
initScenery1                                              ;#isfunction  
                    clr      screenSize 
                    clr      interStageCounter 
                    ldu      #(laneRAM-laneData) 
                    leau     laneData,u 
                    ldx      #lane1Data 
                    jsr      initLane 
                    ldd      #0 
                    sta      stageCounter 
                    std      roundCounter 
                    leau     laneData,u 
                    std      ,u 
                    rts      

;.....................................................................
;
; this is called from the "title" loop
; and does one step of desktop "animation"
;.....................................................................
oneVBTitleStep                                            ;#isfunction  
; ...................
; get current joystick position and remember it
                    clr      joystickDir 
                    jsr      queryJoystick 
;
                    lda      Vec_Joy_1_X 
                    beq      notLeftt 
                    bmi      notRightt 
                    lda      #RIGHT 
                    sta      joystickDir 
                    bra      joystickDone 

notRightt 
                    lda      #LEFT 
                    sta      joystickDir 
                    bra      joystickDone 

notLeftt 
                    lda      Vec_Joy_1_Y 
                    beq      joystickDone 
                    bmi      notUpt 
                    lda      #UP 
                    sta      joystickDir 
                    bra      joystickDone 

notUpt 
                    lda      #DOWN 
                    sta      joystickDir 
notDownt 
joystickDone 
; ...................
; draw command center
; screen is drawn "dim" from start - but gets brighter when swiched on
                    lda      screenIntensity 
                    _INTENSITY_A                          ; Intensity_a 
                    lda      gameScale 
                    sta      <VIA_t1_cnt_lo 
                    ldu      #CommandCenter_0             ; screen 
                    jsr      draw_synced_list_fromzero__noshift 
                    lda      iconIntensity 
                    ldb      joystickDir 
                    cmpb     #RIGHT 
                    bne      notRight2t 
                    lda      #$5f 
notRight2t 
                    _INTENSITY_A  
                    ldu      #CommandCenter_1             ; arrow right 
                    jsr      draw_synced_list_fromzero__noshift 
                    lda      iconIntensity 
                    ldb      joystickDir 
                    cmpb     #UP 
                    bne      notUp2t 
                    lda      #$5f 
notUp2t 
                    _INTENSITY_A  
                    ldu      #CommandCenter_2             ; arrow 
                    jsr      draw_synced_list_fromzero__noshift 
                    lda      iconIntensity 
                    ldb      joystickDir 
                    cmpb     #LEFT 
                    bne      notLeft2t 
                    lda      #$5f 
notLeft2t 
                    _INTENSITY_A  
                    ldu      #CommandCenter_3             ; arrow left 
                    jsr      draw_synced_list_fromzero__noshift 
                    lda      iconIntensity 
                    ldb      joystickDir 
                    cmpb     #DOWN 
                    bne      notDown2t 
                    lda      #$5f 
notDown2t 
; ...................
; draw icons
                    _INTENSITY_A  
                    ldu      #CommandCenter_4             ; arrow 
                    jsr      draw_synced_list_fromzero__noshift 
; calibration for smart lists
                    jsr      calibrationZero7 
                    lda      iconIntensity 
                    ldb      joystickDir 
                    cmpb     #DOWN 
                    bne      notDown2t_icon 
                    lda      #$5f 
notDown2t_icon 
                    _INTENSITY_A  
; V1.06
 ldb #1
 STB     <VIA_port_b     ;turn off mux
; draw high score stairs
                    ldd      #$da00 
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    lda      #$05 
                    sta      <VIA_t1_cnt_lo 
                    ldu      #HSStairs 
                    MY_MOVE_TO_A_END  
                    jsr      SMVB_drawSmart 
; draw high fighter (anim)
                    lda      iconIntensity 
                    ldb      joystickDir 
                    cmpb     #UP 
                    bne      notUp2t_icon 
                    lda      #$5f 
notUp2t_icon 
                    _INTENSITY_A  
; V1.06
 ldb #1
 STB     <VIA_port_b     ;turn off mux
                    ldd      #$5700 
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    lda      #$05 
                    sta      <VIA_t1_cnt_lo 
                    clrb     
                    ldu      #SM_Fighter_Anim 
                    lda      Vec_Loop_Count+1 
                    anda     #2 
                    beq      zeroF 
                    ldb      #2 
zeroF 
                    ldu      b,u 
                    MY_MOVE_TO_A_END  
                    jsr      SMVB_drawSmart 
                    _ZERO_VECTOR_BEAM  
                                                          ; jsr calibrationZero7 
                    lda      gameScale 
                    sta      <VIA_t1_cnt_lo 
; draw tools (options)
                    lda      iconIntensity 
                    ldb      joystickDir 
                    cmpb     #RIGHT 
                    bne      notRight2t_icon 
                    lda      #$5f 
notRight2t_icon 
                    _INTENSITY_A  
; V1.06
 ldb #1
 STB     <VIA_port_b     ;turn off mux
                    ldd      #$1657 
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    lda      #$05 
                    sta      <VIA_t1_cnt_lo 
                    ldu      #HSOptions 
                    MY_MOVE_TO_A_END  
                    jsr      SMVB_drawSmart 
                                                          ; jsr calibrationZero7 
; draw scroll (achievements)
                    lda      iconIntensity 
                    ldb      joystickDir 
                    cmpb     #LEFT 
                    bne      notLeft2t_icon 
                    lda      #$5f 
notLeft2t_icon 
                    _INTENSITY_A  
; V1.06
 ldb #1
 STB     <VIA_port_b     ;turn off mux
                    ldd      #$1ea3 
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    lda      #$05 
                    sta      <VIA_t1_cnt_lo 
                    ldu      #HSAchievements 
                    MY_MOVE_TO_A_END  
                    jsr      SMVB_drawSmart 
; draw console - always
                    lda      #$1f 
                    ldb      desktop_flags 
                    andb     #TITLE_DESKTOP_LIT 
                    beq      notLit 
                    lda      #$3f 
notLit 
                    jsr      Intensity_a 
                    _LDD     -$36-Y_OFFSET_DESKTOP, $4b 
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    lda      #$07 
                    sta      <VIA_t1_cnt_lo 
                    ldu      #HSConsole 
                    MY_MOVE_TO_A_END  
                    jsr      SMVB_drawSmart 
                    ldb      desktop_flags 
                    andb     #TITLE_DISPLAY_MAN 
                    beq      doAStage 
                                                          ; jsr calibrationZero7 
                    lda      #80 
                    sta      <VIA_t1_cnt_lo 
                    lda      #-60 -Y_OFFSET_DESKTOP 
                    ldb      #55 
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    lda      #$07                         ; 9 
                    sta      <VIA_t1_cnt_lo 
                    ldu      #HSMJStandingBack 
                    MY_MOVE_TO_A_END  
                    jsr      SMVB_drawSmart 
                    jsr      Reset_Pen 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; now different "stages" of the desktop will be done
; as of now x stages ... 
; 0 scroll text
; 1 intro do enemies
; 2 particles 
;
; if more are to come, than I will do a proper "switch case"
doAStage 
                    ldx      #stagesPointer 
                    lda      introStage 
                    lsla     
                    ldx      a,x 
                    bne      stageOk 
                    clr      introStage 
                    lda      #TITLE_MUST_INIT_STAGE 
                    sta      desktop_flags 
                    bra      doAStage 

stageOk 
                    jmp      ,x 

;
; .....................................................
;
stagesPointer 
                    dw       doStageSwitchLightsOn 
                    dw       doStageManComes 
                    dw       doStageScroller 
                    dw       doStageManGoes 
                    dw       doStageWait 
                    dw       doStageBonusExplain 
                    dw       doStageParticles 
                    dw       doStageDemo 
                    dw       0 
;
; .....................................................
;
initStageStageWait                                        ;#isfunction  
                    ldd      #0 
                    std      titleRoundCounter 
                    lda      desktop_flags 
                    anda     #$ff-TITLE_MUST_INIT_STAGE 
                    sta      desktop_flags 
                    rts      

;
; .....................................................
;
doStageWait 
                    lda      desktop_flags 
                    bpl      initIsDoneStageWait 
                    bsr      initStageStageWait 
initIsDoneStageWait 
                    ldd      titleRoundCounter 
                    addd     #1 
                    std      titleRoundCounter 
                    cmpd     #100                         ; 2 seconds 
                    bne      exitWait 
                    inc      introStage 
                    lda      desktop_flags 
                    ora      #TITLE_MUST_INIT_STAGE 
                    sta      desktop_flags 
exitWait 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;; STAGE -2 scroll text ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
initStageStageSwitchLightsOn                              ;#isfunction  
                    ldd      #0 
                    std      titleRoundCounter 
                    lda      desktop_flags 
                    anda     #$ff-TITLE_MUST_INIT_STAGE 
                    sta      desktop_flags 
                    lda      #$1f 
                    sta      screenIntensity 
                    clr      iconIntensity 
                    rts      

;
; .....................................................
;
doStageSwitchLightsOn                                     ;#isfunction  
                    lda      desktop_flags 
                    bpl      initIsDoneStageSwitchLightsOn 
                    bsr      initStageStageSwitchLightsOn 
initIsDoneStageSwitchLightsOn 
                    ldd      titleRoundCounter 
                    addd     #1 
                    std      titleRoundCounter 
                    ldx      titleRoundCounter 
                    cmpx     #25                          ; half a second 
                    blo      exitThis 
                    cmpx     #25 
                    bne      not25 
                    lda      desktop_flags 
                    ora      #TITLE_DESKTOP_LIT 
                    sta      desktop_flags 
                    rts      

not25 
                    cmpx     #30 
                    bne      not30 
                    lda      desktop_flags 
                    anda     #$ff-TITLE_DESKTOP_LIT 
                    sta      desktop_flags 
                    rts      

not30 
                    cmpx     #35 
                    bne      not35 
                    lda      desktop_flags 
                    ora      #TITLE_DESKTOP_LIT 
                    sta      desktop_flags 
                    rts      

not35 
                    cmpx     #40 
                    bne      not40 
                    lda      desktop_flags 
                    anda     #$ff-TITLE_DESKTOP_LIT 
                    sta      desktop_flags 
                    rts      

not40 
                    cmpx     #45 
                    bne      not45 
                    lda      desktop_flags 
                    ora      #TITLE_DESKTOP_LIT 
                    sta      desktop_flags 
                    rts      

not45 
                    cmpx     #70 
                    bne      not70 
                    lda      #$2f 
                    sta      screenIntensity 
                    rts      

not70 
                    ldd      titleRoundCounter+1 
                    anda     #%00000011 
                    bne      noLighter 
                    inc      iconIntensity 
                    rts      

noLighter 
                    cmpx     #150 
                    bne      exitThis 
                    lda      #$2f 
                    sta      iconIntensity 
                    inc      introStage 
                    lda      desktop_flags 
                    ora      #TITLE_MUST_INIT_STAGE 
                    sta      desktop_flags 
exitThis 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;; STAGE 0 scroll text ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                    include  "titleScroll.asm"    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                    bss      
                    org      stageRAM_start 
it_stringCounter    ds       1                            ; which string in the pointer list to start with 
it_lineCounter      ds       1                            ; line for the scroll line within one string (bitmap) 
it_linePrintOffset  ds       1                            ; compensation offset while printing for line gap between two strings 
it_xlinePrintOffset  ds      1                            ; x offset of line (used to ensure MID alignment) 
tmp2_lc             ds       1                            ; counter of how many string lines have been processed within the scroller (coutdown from BITMAP_LINES_TITLE) 
tmp3_lc             ds       1 
                    code     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
initStageScroller                                         ;#isfunction  
                    clr      it_stringCounter 
                    clr      it_lineCounter 
                    clr      it_linePrintOffset 
                    ldd      #IntroTextScrollPointers 
                    lda      desktop_flags 
                    anda     #$ff-TITLE_MUST_INIT_STAGE 
                    sta      desktop_flags 
                    rts      

MAX_STRING_NO_DISPLAY  =     89                           ;64 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; scroller
doStageScroller                                           ;#isfunction  
                    lda      desktop_flags 
                    bpl      initIsDoneStageScroller 
                    bsr      initStageScroller 
initIsDoneStageScroller 
                    lda      #$38                         ;30;28 ; scale used for positioning of scroller (strength is maxed $) changing -> waits in scroller must be adjusted 
                    sta      <VIA_t1_cnt_lo 
                    jsr      Reset_Pen 
                    jsr      Intensity_5F 
                    ldd      #$7fa0                       ;$7f90;$7f81 ; move to 
                    suba     it_linePrintOffset 
                    tfr      d,x 
                    ldu      #IntroTextScrollPointers 
                    ldb      it_stringCounter 
                    clra     
                    MY_LSL_D  
                    ldu      d,u 
                    lda      it_lineCounter 
                    jsr      printStringList_25_Sync_direct 
                    lda      Vec_Loop_Count+1 
                    anda     #%11                         ; decrease scroller each 3rd round 
                    bne      noChangeStageScroller 
                    lda      it_linePrintOffset 
                    bne      offsetChangeOnly 
                    lda      it_lineCounter 
                    inca     
                    cmpa     #FONT_HEIGHT 
                    bne      staLineCounter 
                    clra     
                    ldb      it_linePrintOffset 
                    addb     #SPACE_BETWEEN_STRINGS 
                    stb      it_linePrintOffset 
                    ldb      it_stringCounter 
                    incb     
                    cmpb     #MAX_STRING_NO_DISPLAY       ; number of max string lines printed at the moment (should be determined somehow) 
                    bne      keepStrinGlines 
                    bra      StageScrollerFinished 

                    clrb     
keepStrinGlines 
                    stb      it_stringCounter 
staLineCounter 
                    sta      it_lineCounter 
noChangeStageScroller 
                    rts      

offsetChangeOnly 
                    ldb      it_linePrintOffset 
                    subb     #SPACE_BETWEEN_LINES 
                    stb      it_linePrintOffset 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;; STAGE 0 END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                    bss      
                    org      stageRAM_start 
sceneryLooped       ds       1                            ; indicator, rthat scenery has reseted this round! 
                    code     
StageScrollerFinished 
                    inc      introStage 
                    lda      desktop_flags 
                    ora      #TITLE_MUST_INIT_STAGE 
                    sta      desktop_flags 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;; STAGE -1a ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
initStageManGoes 
                    lda      #$2f 
                    sta      screenIntensity 
                    clr      stageCounter 
                    clr      interStageCounter 
                    clr      sceneryLooped 
                    lda      desktop_flags 
                    anda     #$ff-TITLE_MUST_INIT_STAGE -TITLE_DISPLAY_MAN 
                    sta      desktop_flags 
                    jsr      initScenery1 
                    lda      #23                          ; skip 18 stages 
                    sta      titleRoundCounter 
doNextLane2 
                    ldy      #laneRAM 
doNextLane1 
                    ldd      ,y 
                    beq      lanesDone1 
                    jsr      initNextElementSilent 
                    leay     laneData,y 
                    bra      doNextLane1 

lanesDone1 
                    dec      titleRoundCounter 
                    bne      doNextLane2 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
doStageManGoes 
                    lda      desktop_flags 
                    bpl      initIsDoneStageManGoes 
                    bsr      initStageManGoes 
initIsDoneStageManGoes 
                    lda      sceneryLooped                ; scenery had reseted -> go to next stage! 
                    beq      checkOn_st2 
                    inc      introStage 
                    lda      desktop_flags 
                    ora      #TITLE_MUST_INIT_STAGE 
                    sta      desktop_flags 
                    jmp      doAStage 

checkOn_st2 
                    jsr      Reset_Pen 
                    jsr      oneScenarioStep1 
                    _ZERO_VECTOR_BEAM  
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;; STAGE -1b ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
initStageManComes 
                    lda      #$2f 
                    sta      screenIntensity 
                    clr      stageCounter 
                    clr      interStageCounter 
                    clr      sceneryLooped 
                    lda      desktop_flags 
                    anda     #$ff-TITLE_MUST_INIT_STAGE 
                    sta      desktop_flags 
                    jmp      initScenery1 

doStageManComes 
                    lda      desktop_flags 
                    bpl      initIsDoneStageManComes 
                    bsr      initStageManComes 
initIsDoneStageManComes 
; do sceneries of enemies
; Scenery: _GTitle1.xml (new )
;
; look in what scenery stage we are
;
                    lda      sceneryLooped                ; scenery had reseted -> go to next stage! 
                    beq      checkOn_st 
                    inc      introStage 
                    lda      desktop_flags 
                    ora      #TITLE_MUST_INIT_STAGE 
                    sta      desktop_flags 
                    jmp      doAStage 

checkOn_st 
                    lda      stageCounter 
                    cmpa     #2                           ; from that stage on grow the screen 
                    blo      lowerStageManComes           ; lower stage 2, than draw nothing special 
                    bne      higherStageManComes 
drawStageManComes 
                    lda      desktop_flags 
                    ora      #TITLE_DISPLAY_MAN 
                    sta      desktop_flags 
;stage 2 screen was switched on and increases in size and brightness
                    inc      interStageCounter 
                    inc      interStageCounter 
                    inc      interStageCounter 
                    inc      interStageCounter 
                    inc      interStageCounter 
                    bpl      sizeiscok_2 
                    lda      #$7f 
                    sta      interStageCounter 
                    inc      introStage 
                    lda      #$5f                         ;interStageCounter 
                    sta      screenIntensity 
                    lda      desktop_flags 
                    ora      #TITLE_MUST_INIT_STAGE 
                    sta      desktop_flags 
sizeiscok_2 
                    lda      interStageCounter 
                    sta      <VIA_t1_cnt_lo 
                    ldu      #CommandCenter_0 
                    jsr      draw_synced_list_fromzero__noshift ; this is only drawn when growing, the full grown screen switches to higher intensity of the "normal" desktop 
                    _ZERO_VECTOR_BEAM  
                    rts      

higherStageManComes 
LAST_STAGES_1       =        3                            ;+19 
                    lda      stageCounter 
                    cmpa     #2                           ;3 
                    bne      lowerStageManComes 
                    lda      #5 
                    sta      stageCounter 
                    lda      desktop_flags 
                    ora      #TITLE_DISPLAY_MAN 
                    sta      desktop_flags 
                    rts      

lowerStageManComes 
                    jsr      Reset_Pen 
                    jsr      oneScenarioStep1 
                    _ZERO_VECTOR_BEAM  
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;; STAGE 1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
initStageBonusExplain                                     ;#isfunction  
                    clr      stageCounter 
                    clr      interStageCounter 
                    clr      sceneryLooped 
                    lda      desktop_flags 
                    anda     #$ff-TITLE_MUST_INIT_STAGE 
                    sta      desktop_flags 
                    jmp      initScenery1 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
doStageBonusExplain                                       ;#isfunction  
                    lda      desktop_flags 
                    bpl      initIsDoneStageBonusExplain 
                    bsr      initStageBonusExplain 
initIsDoneStageBonusExplain 
; do sceneries of enemies
; Scenery: _GTitle1.xml (new )
;
; look in what scenery stage we are
;
                    lda      sceneryLooped                ; scenery had reseted -> go to next stage! 
                    beq      checkOn_1 
                    inc      introStage 
                    lda      desktop_flags 
                    ora      #TITLE_MUST_INIT_STAGE 
                    sta      desktop_flags 
                    jmp      doAStage 

checkOn_1 
                    lda      stageCounter 
                    cmpa     #2                           ; from that stage on grow the screen 
                    lblo     lowerStageBonusExplain       ; lower stage 2, than draw nothing special 
                    bne      higherStageBonusExplain 
drawStageBonusExplain 
;stage 2 screen was switched on and increases in size and brightness
                    inc      interStageCounter 
                    inc      interStageCounter 
                    inc      interStageCounter 
                    inc      interStageCounter 
                    inc      interStageCounter 
                    bpl      sizeiscok_1 
                    lda      #$7f 
                    sta      interStageCounter 
sizeiscok_1 
                    lda      interStageCounter 
                    sta      <VIA_t1_cnt_lo 
                    ldu      #CommandCenter_0 
                    jsr      draw_synced_list_fromzero__noshift ; this is only drawn when growing, the full grown screen switches to higher intensity of the "normal" desktop 
                    _ZERO_VECTOR_BEAM  
                    bra      fromlower2_1 

higherStageBonusExplain 
                    lda      #$5f                         ;interStageCounter 
                    sta      screenIntensity 
fromlower2_1 
LAST_STAGES         =        3 +19 
                    lda      stageCounter 
                    cmpa     #LAST_STAGES 
                    bhi      noMan_1 
                    lda      desktop_flags 
                    ora      #TITLE_DISPLAY_MAN 
                    sta      desktop_flags 
noMan_1 
                    lda      stageCounter 
                    cmpa     #3 
                    blo      noTextDisplay_1 
                    lsla     
                    ldu      #textPointer2 
                    ldu      a,u 
                    beq      noTextDisplay_1 
                    ldd      Vec_Text_Height 
                    pshs     d 
                    ldd      #$fb40 
                    std      Vec_Text_Height 
                    IRQ_TO_0_T1  
                    lda      gameScale 
                    sta      VIA_t1_cnt_lo 
                    ldb      ,u+ 
                    clra     
                    jsr      syncPrintStrd 
                    puls     d 
                    std      Vec_Text_Height 
                    IRQ_TO_0_SHIFT  
                    lda      #$2f 
                    jsr      Intensity_a 
                    _ZERO_VECTOR_BEAM  
noTextDisplay_1 
lowerStageBonusExplain 
                    jsr      Reset_Pen 
                    jsr      oneScenarioStep1 
                    _ZERO_VECTOR_BEAM  
                    lda      #$2f 
                    jsr      Intensity_a 
                    lda      stageCounter 
                    cmpa     #5 +18                       ; from that stage on switch the screen off 
                    blo      returnnow1_1 
                    lda      #$2f                         ;interStageCounter 
                    sta      screenIntensity 
                    lda      desktop_flags 
                    anda     #$ff-TITLE_DISPLAY_MAN 
                    sta      desktop_flags 
returnnow1_1 
                    rts      

textPointer2 
                    dw       0 
                    dw       0 
                    dw       0 
                    dw       shot1 
                    dw       shot2 
                    dw       faster 
                    dw       slower 
                    dw       sfaster 
                    dw       sslower 
                    dw       extrabullet 
                    dw       lessbullet 
                    dw       scoopEnemy 
                    dw       shielding 
                    dw       armoring 
                    dw       mining 
                    dw       mul2 
                    dw       mul5 
                    dw       cashbomb 
                    dw       diamondbomb 
                    dw       timering 
                    dw       doubleCash 
                    dw       powerUp 
                    dw       liveup 
                    dw       0 
                    dw       0 
                    dw       0 
                    dw       0 
                    dw       0 
                    dw       0 
;
ONE_CHAR            =        2 
HALF_ONE_CHAR       =        3 
TWO_CHAR            =        4 
HALF_TWO_CHAR       =        5 
THREE_CHAR          =        6 
FOUR_CHAR           =        8 
HALF_FOUR_CHAR      =        9 
CHAR_WIDTH          =        5 
ORIGIN_TEXT         =        -66 
shot1               db       ORIGIN_TEXT+28, "ONE SHOT",$80
shot2               db       ORIGIN_TEXT+28, "TWO SHOT",$80
faster              db       ORIGIN_TEXT+CHAR_WIDTH*HALF_ONE_CHAR-1, "SHIP FASTER",$80 ; half
slower              db       ORIGIN_TEXT+CHAR_WIDTH*HALF_ONE_CHAR-1, "SHIP SLOWER",$80 ; half
sfaster             db       ORIGIN_TEXT+CHAR_WIDTH*HALF_ONE_CHAR-1, "SHOT FASTER",$80 ; half
sslower             db       ORIGIN_TEXT+CHAR_WIDTH*HALF_ONE_CHAR-1, "SHOT SLOWER",$80 ; half
extrabullet         db       ORIGIN_TEXT+CHAR_WIDTH*ONE_CHAR, "MORE BULLETS",$80
lessbullet          db       ORIGIN_TEXT+CHAR_WIDTH*ONE_CHAR, "LESS BULLETS",$80 
scoopEnemy          db       ORIGIN_TEXT+CHAR_WIDTH*HALF_ONE_CHAR-1, "SCOOP ENEMY",$80 ; half
shielding           db       ORIGIN_TEXT+CHAR_WIDTH*FOUR_CHAR-4, "SHIELD",$80
armoring            db       ORIGIN_TEXT+CHAR_WIDTH*HALF_FOUR_CHAR-4, "ARMOR",$80 ; half
mining              db       ORIGIN_TEXT+CHAR_WIDTH*HALF_TWO_CHAR-1, "MINESTORM",$80 ; half
mul2                db       ORIGIN_TEXT+CHAR_WIDTH*ONE_CHAR, "MULTIPLY X 2",$80
mul5                db       ORIGIN_TEXT+CHAR_WIDTH*ONE_CHAR, "MULTIPLY X 5",$80
cashbomb            db       ORIGIN_TEXT+CHAR_WIDTH*HALF_TWO_CHAR-1, "CASH BOMB",$80 ; half
diamondbomb         db       ORIGIN_TEXT+CHAR_WIDTH*ONE_CHAR, "DIAMOND BOMB",$80
timering            db       ORIGIN_TEXT+CHAR_WIDTH*TWO_CHAR, "BONUS TIME",$80
doubleCash          db       ORIGIN_TEXT+CHAR_WIDTH*HALF_ONE_CHAR-1, "DOUBLE CASH",$80 ; half
powerUp             db       ORIGIN_TEXT+28, "POWER UP",$80
liveup              db       ORIGIN_TEXT+CHAR_WIDTH*TWO_CHAR, "EXTRA LIFE",$80
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;; STAGE 1 END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;; STAGE 2 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                    include  "particles.asm"
                    bss      
                    org      stageRAM_start 
;
u_offset1           =        -NEXT_OBJECT                 ; behaviour offset is determined by next structure element 
PARTICLES_DONE_A    ds       2                            ; 
PARTICLES_DONE      =        PARTICLES_DONE_A-2 
; jump back addresses
; for "last" behaviour routine
;
PLIST_COMPARE_ADDRESS: 
startParticleRAM    ds       0 
anglechangeCountDown  ds     1 
angleChangePointer  ds       2 
emitterData1        ds       EmitterData 
emitterData2        ds       EmitterData 
emitterData3        ds       EmitterData 
;random_seed         ds       1 
plist_empty_head    ds       2                            ; if empty these contain a value that points to a RTS, smaller than OBJECT_LIST_COMPARE_ADDRESS 
plist_objects_head  ds       2                            ; if greater OBJECT_LIST_COMPARE_ADDRESS, than this is a pointer to a RAM location of an Object 
pCount              ds       1 
pobject_list        ds       Particle*PARTICLE1_MAX_COUNT 
pobject_list_end    ds       0 
;
; ROM
                    code     
initStageParticles 
                    jsr      initParticle1 
                    ldd      #0 
                    std      Vec_Loop_Count 
                    lda      desktop_flags 
                    anda     #$ff-TITLE_MUST_INIT_STAGE 
                    sta      desktop_flags 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
doStageParticles 
                    lda      desktop_flags 
                    bpl      initIsDoneStageParticles 
                    bsr      initStageParticles 
initIsDoneStageParticles 
                    ldd      Vec_Loop_Count 
                    cmpd     #750                         ; 15 seconds particle demo 
                    blo      stayWithParticels 
                    lda      desktop_flags 
                    ora      #TITLE_MUST_INIT_STAGE 
                    sta      desktop_flags 
                    inc      introStage 
                    jmp      doAStage 

stayWithParticels 
                    JSR      Intensity_3F                 ; Sets the intensity of the 
                                                          ; jmp playParticle1; 
                    lda      #23 
                    sta      <VIA_t1_cnt_lo 
                    jmp      playParticle1                ; playParticleInteractive 

initStageDemo 
                    lda      desktop_flags 
                    anda     #$ff-TITLE_MUST_INIT_STAGE 
                    sta      desktop_flags 
                    rts      

doStageDemo 
                    lda      desktop_flags 
                    bpl      initIsDoneStageDemo 
                    bsr      initStageDemo 
initIsDoneStageDemo 
                    lda      #1 
                    sta      isDemoMode 
REPLACE_1_2_main11_varFrom1_21                            ;  bank 1 replace 
                    ldx      #0                           ; main11 
                    jmp      jmpBankIRQ3X 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;; STAGE 2 END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CommandCenter_0: 
                    DB       $01, -$16, +$28              ; sync and move to y, x 
                    DB       $FF, +$12, +$19              ; draw, y, x 
                    DB       $FF, +$38, +$00              ; draw, y, x 
                    DB       $FF, +$13, -$18              ; draw, y, x 
                    DB       $FF, +$00, -$50              ; draw, y, x 
                    DB       $FF, -$13, -$19              ; draw, y, x 
                    DB       $FF, -$38, +$00              ; draw, y, x 
                    DB       $FF, -$12, +$19              ; draw, y, x 
                    DB       $FF, +$00, +$50              ; draw, y, x 
                    DB       $02                          ; endmarker 
CommandCenter_1: 
                    DB       $01, +$19, +$32              ; sync and move to y, x 
                    DB       $00, +$00, +$32              ; additional sync move to y, x 
                    DB       $00, +$00, +$06              ; additional sync move to y, x 
                    DB       $FF, -$19, -$20              ; draw, y, x 
                    DB       $FF, +$32, +$00              ; draw, y, x 
                    DB       $FF, -$18, +$20              ; draw, y, x 
                    DB       $02                          ; endmarker 
CommandCenter_2: 
                    DB       $01, +$46, +$00              ; sync and move to y, x 
                    DB       $00, +$26, +$00              ; additional sync move to y, x 
                    DB       $FF, -$1A, +$22              ; draw, y, x 
                    DB       $FF, +$00, -$46              ; draw, y, x 
                    DB       $FF, +$1A, +$24              ; draw, y, x 
                    DB       $02                          ; endmarker 
CommandCenter_3: 
                    DB       $01, +$18, -$32              ; sync and move to y, x 
                    DB       $00, +$00, -$32              ; additional sync move to y, x 
                    DB       $00, +$00, -$06              ; additional sync move to y, x 
                    DB       $FF, +$1A, +$20              ; draw, y, x 
                    DB       $FF, -$32, +$00              ; draw, y, x 
                    DB       $FF, +$18, -$20              ; draw, y, x 
                    DB       $02                          ; endmarker 
CommandCenter_4: 
                    DB       $01, -$39, +$00              ; sync and move to y, x 
                    DB       $FF, +$1A, -$22              ; draw, y, x 
                    DB       $FF, +$00, +$46              ; draw, y, x 
                    DB       $FF, -$1A, -$23              ; draw, y, x 
                    DB       $02                          ; endmarker 
HSStairs 
                    db       -$24, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$12, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $ee, $01, -$7F, hi(SMVB_startDraw_newY_eq_oldX_single), lo(SMVB_startDraw_newY_eq_oldX_single) ; y was $00, now $ee 
                    db       -$48, $01, $00, hi(SMVB_continue6_single), lo(SMVB_continue6_single) 
                    db       $00, $01, $7F 
                    db       $48, $01, $00 
                    db       $00, $01, $7F 
                    db       -$48, $01, $00 
                    db       $00, $01, -$7F 
                    db       $12, $01, $36, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, $12, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $12, $01, $00, hi(SMVB_continue_newY_eq_oldX_single), lo(SMVB_continue_newY_eq_oldX_single) ; y is $12 
                    db       $ce, $01, -$12, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now $ce 
                    db       $ee, $01, $12, hi(SMVB_startDraw_yStays_single), lo(SMVB_startDraw_yStays_single) ; y was $00, now $ee 
                    db       $12, $01, $00, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $00, $01, -$12 
                    db       $12, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $49, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$6C, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$49, $01, $00 
                    db       -$12, $01, -$12, hi(SMVB_startMove_yEqx_single), lo(SMVB_startMove_yEqx_single) ; y is -$12 
                    db       $00, $01, $12, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$12, $01, $00, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $00, $01, -$12 
                    db       -$12, $01, $00 
                    db       $00, $01, $12 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
HSOptions 
                    db       $07, $01, -$0A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $4D, $01, -$4C, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $02, $01, $0B 
                    db       $35, $01, -$35 
                    db       -$15, $01, -$15 
                    db       -$35, $01, $35 
                    db       $0C, $01, $03 
                    db       -$4D, $01, $4E 
                    db       -$08, $01, $06, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $08, $01, $09 
                    db       -$18, $01, $15 
                    db       -$05, $01, -$06 
                    db       $15, $01, -$18 
                    db       -$15, $01, -$57, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $15, $01, -$15, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $69, $01, $7E, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $15, $01, -$15 
                    db       $2B, $01, $2A 
                    db       -$40, $01, $40 
                    db       -$2A, $01, $00 
                    db       $00, $01, -$2B 
                    db       $15, $01, -$15 
                    db       -$69, $01, -$7E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
HSAchievements 
                    db       -$13, $01, -$17, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$17, $01, -$04, hi(SMVB_continue6_single), lo(SMVB_continue6_single) 
                    db       -$16, $01, $0C 
                    db       $01, $01, $1D 
                    db       -$7A, $01, -$15 
                    db       -$14, $01, $08 
                    db       -$0E, $01, $1B 
                    db       $03, $01, $4F, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $12, $01, $11, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $19, $01, $03 
                    db       $15, $01, -$0D 
                    db       -$06, $01, -$57 
                    db       $4D, $01, $25, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $4E, $01, $25, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$17, $01, $16, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$22, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$02, $01, -$5C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$03, $01, -$5C, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $22, $01, $07, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1C, $01, -$19, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, $04, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, $58, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       -$39, $01, $16, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$5B, $01, -$18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$20, $01, -$4C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$21, $01, -$4D, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1A, $01, $10, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $7C, $01, -$2A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $14, $01, $0F, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $17, $01, -$07, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $02, $01, -$0F 
                    db       -$13, $01, -$07 
                    db       -$0B, $01, $0D 
                    db       $11, $01, $06 
                    db       -$79, $01, $17, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$0A, $01, -$10, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $01, $01, $1F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $09, $01, -$0F, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$23, $01, $0E, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $1A, $01, $01, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $06, $01, $40, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $03, $01, -$4D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$18, $01, $06, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $09, $01, -$0C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0F, $01, -$10, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$0D, $01, $0B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $08, $01, $15, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$02, $01, -$0A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $0D, $01, $06, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0E, $01, -$18, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$14, $01, -$04, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
HSConsole 
                    db       $45, $01, -$67, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $28, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1C, $01, $06, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$06, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$16, $01, $2A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$0C, $01, $28, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $25, $01, -$48, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       $08, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $30, $01, -$0E, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $6E, $01, $36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$42, $01, $75, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$7A, $01, -$3E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $44, $01, -$71, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $00, $01, -$74, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$60, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $4F, $01, $0A, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$37, $01, $56, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$4B, $01, $03, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $48, $01, $07, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $00, $01, $41, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$48, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $14, $01, $3E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $7F, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$06, $01, -$5A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$30, $01, $08, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0C, $01, -$38, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $24, $01, -$22, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $30, $01, -$14, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$0E, $01, -$22, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
HSMJStandingBack 
                    db       $33, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0A, $01, $0F, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $00, $01, $25 
                    db       -$0E, $01, $10 
                    db       -$32, $01, $00 
                    db       -$21, $01, $01, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$37, $01, -$0A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$7D, $01, $1A, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$1E, $01, $0F 
                    db       $00, $01, -$2E 
                    db       $43, $01, -$02 
                    db       $27, $01, -$11 
                    db       -$23, $01, -$14 
                    db       -$47, $01, -$01 
                    db       $00, $01, -$2E, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $26, $01, $15 
                    db       $76, $01, $15 
                    db       $3A, $01, -$15 
                    db       -$08, $01, $01, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$15, $01, -$0C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$13, $01, $00, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       -$25, $01, -$0F 
                    db       $3A, $01, -$06 
                    db       $26, $01, $06 
                    db       $15, $01, $1A 
                    db       $00, $01, -$02, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$0B, $01, $2E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $09, $01, $30, hi(SMVB_continue6_single), lo(SMVB_continue6_single) 
                    db       -$3B, $01, $12 
                    db       -$37, $01, -$23 
                    db       $31, $01, $0D 
                    db       $15, $01, -$04 
                    db       -$03, $01, -$06 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
; pointers are only needed/used in determining the start of the printing
; the text itself must be continuous from the
; start pointer passed to the scroll function
IntroTextScrollPointers 
                    dw       line01a_it 
                    dw       line01b_it 
                    dw       line01_it 
                    dw       line02_it 
                    dw       line03_it 
                    dw       line04_it 
                    dw       line05_it 
                    dw       line06_it 
                    dw       line07_it 
                    dw       line08_it 
                    dw       line09_it 
                    dw       line10_it 
                    dw       line11_it 
                    dw       line12_it 
                    dw       line13_it 
                    dw       line14_it 
                    dw       line15_it 
                    dw       line16_it 
                    dw       line17_it 
                    dw       line18_it 
                    dw       line19_it 
                    dw       line20_it 
                    dw       line21_it 
                    dw       line22_it 
                    dw       line23_it 
                    dw       line24_it 
                    dw       line25_it 
                    dw       line18_ita 
                    dw       line19_ita 
                    dw       line20_ita 
                    dw       line51_ita 
                    dw       line22_ita 
                    dw       line23_ita 
                    dw       line24_ita 
                    dw       line25_ita 
                    dw       line26_it 
                    dw       line27_it 
                    dw       line28_it 
                    dw       line29_it 
                    dw       line30_it 
                    dw       line31_it 
                    dw       line32_it 
                    dw       line33_it 
                    dw       line34_it 
                    dw       line35_it 
                    dw       line36_it 
                    dw       line37_it 
                    dw       line38_it 
                    dw       line39_it 
                    dw       line40_it 
                    dw       line41_it 
                    dw       line42_it 
                    dw       line43_it 
                    dw       line44_it 
                    dw       line45_it 
                    dw       line46_it 
                    dw       line47_it 
                    dw       line48_it 
                    dw       line49_it 
                    dw       line50_it 
                    dw       line51_it 
                    dw       line52_it 
                    dw       line52_1_it 
                    dw       line52_2_it 
                    dw       line52_3_it 
                    dw       line52_4_it 
                    dw       line52ae1_it 
                    dw       line52ae2_it 
                    dw       line52a1_it 
                    dw       line52a2_it 
                    dw       line52a3_it 
                    dw       line52a4_it 
                    dw       line52a_it 
                    dw       line52c_it 
                    dw       line52d_it 
                    dw       line52e_it 
                    dw       line52f_it 
                    dw       line52g_it 
                    dw       line53_it 
                    dw       line54_it 
                    dw       line55_it 
                    dw       line56_it 
                    dw       line57_it 
                    dw       line58_it 
                    dw       line59_it 
                    dw       line60_it 
                    dw       line61_it 
                    dw       line62_it 
                    dw       line63_it 
                    dw       line64_it 
                    dw       line65_it 
                    dw       line66_it 
                    dw       line67_it 
                    dw       line68_it 
                    dw       line69_it 
                    dw       line70_it 
                    dw       line71_it 
                    dw       line72_it 
                    dw       line73_it 
                    DW       0 
NONE_CHAR           equ      0 
HALF_CHAR           equ      10 
QUAR_CHAR           equ      5 
scrollTextsDirect 
line01a_it          db       NONE_CHAR, " ",$80 
line01b_it          db       NONE_CHAR, " ",$80 
line01_it           db       NONE_CHAR, " ",$80 
line02_it           db       NONE_CHAR, " ",$80 
line03_it           db       NONE_CHAR, " ",$80 
line04_it           db       NONE_CHAR, " ",$80 
line05_it           db       NONE_CHAR, " ",$80 
line06_it           db       NONE_CHAR, " ",$80 
line07_it           db       NONE_CHAR, "VECTORBLADE",$80
line08_it           db       NONE_CHAR, " ",$80 
line09_it           db       NONE_CHAR, " ",$80 
line10_it           db       NONE_CHAR, " ",$80 
line11_it           db       NONE_CHAR, " ",$80 
line12_it           db       NONE_CHAR, "  WRITTEN",$80
line13_it           db       HALF_CHAR, "    BY",$80
line14_it           db       HALF_CHAR , "  MALBAN",$80
line15_it           db       NONE_CHAR, " ",$80
line16_it           db       NONE_CHAR, " ",$80 
line17_it           db       NONE_CHAR, " ",$80
line18_it           db       NONE_CHAR, " ",$80
line19_it           db       NONE_CHAR, "   MUSIC",$80
line20_it           db       HALF_CHAR, "    BY",$80
line21_it           db       NONE_CHAR, "    VTK",$80
line22_it           db       NONE_CHAR, " ",$80
line23_it           db       NONE_CHAR, " ",$80
line24_it           db       NONE_CHAR, " ",$80
line25_it           db       NONE_CHAR, " ",$80
line18_ita          db       NONE_CHAR, " ADDITIONAL",$80
line19_ita          db       NONE_CHAR, "    GFX",$80
line20_ita          db       HALF_CHAR, "    BY",$80
line51_ita          db       HALF_CHAR, " SELANSKI",$80
line22_ita          db       NONE_CHAR, " ",$80
line23_ita          db       NONE_CHAR, " ",$80
line24_ita          db       NONE_CHAR, " ",$80
line25_ita          db       NONE_CHAR, " ",$80
line26_it           db       NONE_CHAR, " ENJOY THE",$80 
line27_it           db       NONE_CHAR, "   GAME!",$80
line28_it           db       NONE_CHAR, " ",$80
line29_it           db       NONE_CHAR, " ",$80
line30_it           db       NONE_CHAR, " ",$80
line31_it           db       NONE_CHAR, " ",$80
line32_it           db       NONE_CHAR, " GREETINGS",$80
line33_it           db       HALF_CHAR, "    TO",$80
line34_it           db       NONE_CHAR, " ",$80
line35_it           db       HALF_CHAR, "   ALEX",$80
line36_it           db       HALF_CHAR, "  THOMAS",$80
line37_it           db       NONE_CHAR, "VECTREXMAD!",$80
line38_it           db       NONE_CHAR, "  KRISTOF",$80
line39_it           db       HALF_CHAR, "  SASCHA",$80
line40_it           db       HALF_CHAR, "   PEER",$80
line41_it           db       HALF_CHAR, " CHRIS P.",$80
line42_it           db       HALF_CHAR, " CHRIS M.",$80
line43_it           db       HALF_CHAR, " CHRIS T.",$80
line44_it           db       HALF_CHAR, " CHRIS R.",$80
line45_it           db       NONE_CHAR, "  RICHARD",$80
line46_it           db       NONE_CHAR, "   GAUZE",$80
line47_it           db       HALF_CHAR, "  GEORGE",$80
line48_it           db       HALF_CHAR, "   CLAY",$80
line49_it           db       HALF_CHAR, "   JOHN",$80
line50_it           db       HALF_CHAR, "   JUAN",$80
line51_it           db       HALF_CHAR, " SELANSKI",$80
line52_it           db       NONE_CHAR, "VECTREXROLI",$80
line52_1_it         db       NONE_CHAR, "   BRETT",$80
line52_2_it         db       HALF_CHAR, "  NATHAN",$80
line52_3_it         db       HALF_CHAR, "  GRAHAM",$80
line52_4_it         db       HALF_CHAR, "   TONY",$80
line52ae1_it        db       NONE_CHAR, " ",$80
line52ae2_it        db       NONE_CHAR, " ",$80
line52a1_it         db       NONE_CHAR, "  SPECIAL",$80
line52a2_it         db       HALF_CHAR, "  THANKS",$80
line52a3_it         db       HALF_CHAR, " FOR HELP",$80
line52a4_it         db       NONE_CHAR, "AND TESTING",$80
line52a_it          db       NONE_CHAR, " ",$80
line52c_it          db       HALF_CHAR, "  HELMUT",$80
line52d_it          db       HALF_CHAR, "  JEROME",$80
line52e_it          db       NONE_CHAR, "    VTK",$80
line52f_it          db       NONE_CHAR, "    NIC",$80
line52g_it          db       HALF_CHAR, "   PEER",$80
line53_it           db       NONE_CHAR, " ",$80
line54_it           db       NONE_CHAR, " ",$80
line55_it           db       NONE_CHAR, " ",$80
line56_it           db       NONE_CHAR, " ",$80
line57_it           db       NONE_CHAR, " ",$80
line58_it           db       NONE_CHAR, " ",$80
line59_it           db       HALF_CHAR, " KEEP THE",$80 
line60_it           db       NONE_CHAR, "  VECTREX",$80 
line61_it           db       HALF_CHAR, "  ALIVE!",$80 
line62_it           db       NONE_CHAR, " ",$80 
line63_it           db       NONE_CHAR, " ",$80 
line64_it           db       NONE_CHAR, " ",$80 
line65_it           db       NONE_CHAR, " ",$80 
line66_it           db       NONE_CHAR, " ",$80 
line67_it           db       NONE_CHAR, " ",$80 
line68_it           db       NONE_CHAR, " ",$80 
line69_it           db       NONE_CHAR, " ",$80 
line70_it           db       NONE_CHAR, " ",$80 
line71_it           db       NONE_CHAR, " ",$80 
line72_it           db       NONE_CHAR, " ",$80 
line73_it           db       NONE_CHAR, " ",$80 
                    db       -1                           ; = end 
