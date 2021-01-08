; bank 0
;---------------------------------------------
; a display list in y
; returns in U the number of pressed button (3,4)
showMESSAGE                                               ;#isfunction
                    CLR      Vec_Music_Flag               ; no music is playing ->0 (is placed in rottist!
                    JSR      Init_Music_Buf               ; shadow regs
                    JSR      Do_Sound                     ; ROM function that does the sound playing, here used to clear all regs
waitTollReleaseLoop2
                    JSR      getButtonState               ; get button status
                    anda     #%1111                       ; button 4 unpause
                    cmpa     #%1111
                    bne      waitTollReleaseLoop2
                    pshs     y
showMESSAGELoop
                    clra
                    sta      <VIA_shift_reg
                    JSR      Wait_Recal_noShift           ; Vectrex BIOS recalibration
                    lda      #$4f
                    _INTENSITY_A
                    lda      #-2
                    sta      Vec_Text_Height
                    lda      #$38
                    sta      Vec_Text_Width
                    lda      #$80
                    sta      <VIA_t1_cnt_lo
                    ldy      ,s
                    IRQ_TO_0_SHIFT
printMessageAgain
                    ldd      ,y++
                    beq      printDoneMessage
                    ldu      ,y++
                    jsr      syncPrintStrd
                    _ZERO_VECTOR_BEAM
                    bra      printMessageAgain

printDoneMessage
                    JSR      getButtonState               ; get button status
                    bita     #8
                    beq      button4Pressed
                    bita     #4
                    bne      showMESSAGELoop
button3Pressed
                    ldu      #3
                    bra      waitTollReleaseLoop

button4Pressed
                    ldu      #4
waitTollReleaseLoop
                    JSR      getButtonState               ; get button status
                    anda     #%1111                       ; button 4 unpause
                    cmpa     #%1111
                    bne      waitTollReleaseLoop
                    leas     2,s
                    rts

;---------------------------------------------
calStringD1         db       "WELCOME TO THE CALIBRATION!",$80
calStringD2         db       "SINCE EACH VECTREX IS A TINY",$80
calStringD3         db       "LITTLE BIT DIFFERENT - AND",$80
calStringD4         db       "WE NEED TO SQUEEZE EVERY BIT",$80
calStringD5         db       "OF SPEED OUT OF IT.",$80
calStringD6         db       "WE NEED TO CONFIGURE...",$80
calStringD7         db       "VECTORBLADE!",$80
displayList1
                    dw       $6090, calStringD1
                    dw       $4090, calStringD2
                    dw       $3090, calStringD3
                    dw       $2090, calStringD4
                    dw       $1090, calStringD5
                    dw       $0090, calStringD6
                    dw       $e0d0, calStringD7
                    dw       0
acalStringD1        db       "FIRST INFORMATION WE NEED...",$80
acalStringD2        db       "IS THIS VECTREX A SO CALLED",$80
acalStringD3        db       "\"BUZZ\" - VECTREX",$80
acalStringD4        db       "OR A",$80
acalStringD5        db       "\"NO BUZZ\" VECTREX?",$80
acalStringD6        db       "(JOYSTICK LEFT/RIGHT)",$80
displayList2
                    dw       $6090, acalStringD1
                    dw       $4090, acalStringD2
                    dw       $3090, acalStringD3
                    dw       $2090, acalStringD4
                    dw       $f090, acalStringD5
                    dw       0
bcalStringD1        db       "NOW WE NEED TO CALIBRATE",$80
bcalStringD2        db       "THE VECTOR DRAWING. USE",$80
bcalStringD3        db       "JOYSTICK UP/DOWN FOR COARSE ",$80
bcalStringD4        db       "TUNING AND BUTTON 2/3 FOR FINE",$80
bcalStringD5        db       "TUNING.",$80
bcalStringD6        db       "IF NOTHING CHANGES - PERHAPS",$80
bcalStringD7        db       "YOU HAVE A \"BUZZ\" AFTERALL!",$80
displayList3
                    dw       $6090, bcalStringD1
                    dw       $5090, bcalStringD2
                    dw       $4090, bcalStringD3
                    dw       $3090, bcalStringD4
                    dw       $2090, bcalStringD5
                    dw       $0090, bcalStringD6
                    dw       $f090, bcalStringD7
                    dw       0
scalStringD1        db       "THE RECTANGLE REPRESENTS THE",$80
scalStringD2        db       "GAMESIZE.",$80
scalStringD3        db       "DEPENDING ON YOUR VECTREX, YOU",$80
scalStringD4        db       "MIGHT NEED TO RESIZE FOR THE",$80
scalStringD5        db       "USE WITH THE OVERLAY.",$80
scalStringD6        db       "BEWARE! A TOO SMALL PLAYFIELD",$80
scalStringD7        db       "CORRUPTS COLLISION DETECTION!",$80
displayListSize
                    dw       $6090, scalStringD1
                    dw       $5090, scalStringD2
                    dw       $3090, scalStringD3
                    dw       $2090, scalStringD4
                    dw       $1090, scalStringD5
                    dw       $f090, scalStringD6
                    dw       $e090, scalStringD7
                    dw       0
swcalStringD1       db       "THIS LITTLE FELLOW IS ONE",$80
swcalStringD2       db       "SWARM ELEMENT OF THE QUEEN!",$80
swcalStringD3       db       "IT WILL NEVER BE DISPLAYED",$80
swcalStringD4       db       "PERFECTLY!",$80
swcalStringD5       db       "BUT YOU CAN CHOOSE THE LOOK",$80
swcalStringD6       db       "YOU PERSONALLY LIKE BEST!",$80
displayListSwarm
                    dw       $6090, swcalStringD1
                    dw       $5090, swcalStringD2
                    dw       $4090, swcalStringD3
                    dw       $3090, swcalStringD4
                    dw       $2090, swcalStringD5
                    dw       $1090, swcalStringD6
                    dw       0
bscalStringD1       db       "THE BOSSES ARE DRAWN WITH A",$80
bscalStringD2       db       "WIDELY DIFFERENT SCALE THAN ANY",$80
bscalStringD3       db       "OTHER CHARACTER - ALIGN THEM",$80
bscalStringD4       db       "AS WELL AS POSSIBLE!",$80
displayListBoss
                    dw       $6090, bscalStringD1
                    dw       $5090, bscalStringD2
                    dw       $4090, bscalStringD3
                    dw       $3090, bscalStringD4
                    dw       0
nbscalStringD1      db       "ALL OTHER ELEMENTS ARE DRAWN",$80
nbscalStringD2      db       "USING A STANDARD SCALE - SO ",$80
nbscalStringD3      db       "PLEASE, AS THE LAST CALIBRATION",$80
nbscalStringD4      db       "ITEM - ALSO ALIGN THE VECTORS ",$80
nbscalStringD5      db       "AS WELL AS POSSIBLE!",$80
nbscalStringD6      db       "DONE!",$80
displayListNormal
                    dw       $6090, nbscalStringD1
                    dw       $5090, nbscalStringD2
                    dw       $4090, nbscalStringD3
                    dw       $3090, nbscalStringD4
                    dw       $2090, nbscalStringD5
                    dw       $00e8, nbscalStringD6
                    dw       0
;---------------------------------------------
b2calStringD1       db       "THE TEXT SHOULD BE ALIGNED",$80
b2calStringD2       db       "HORIZONTALLY AS STRAIGHT AS",$80
b2calStringD3       db       "POSSIBLE.",$80
b2calStringD4       db       "USE BUTTON 4 TO CONTINUE TO",$80
b2calStringD5       db       "THE NEXT CALIBRATION SCREEN.",$80
displayList4
                    dw       $6090, b2calStringD1
                    dw       $5090, b2calStringD2
                    dw       $4090, b2calStringD3
                    dw       $2090, b2calStringD4
                    dw       $1090, b2calStringD5
                    dw       0
;---------------------------------------------
hsStringD1          db       "MOVE LEFT/RIGHT TO PLACE THE",$80
hsStringD2          db       "LETTER OVER THE SHIP.",$80
hsStringD3          db       "BUTTON 4 FIRES AND THUS ",$80
hsStringD4          db       "SELECTS THE LETTER.",$80
hsStringD5          db       "BUTTON 3 CONFIRMS CURRENT",$80
hsStringD6          db       "LETTER.",$80
displayListHS
                    dw       $6090, hsStringD1
                    dw       $5090, hsStringD2
                    dw       $3090, hsStringD3
                    dw       $2090, hsStringD4
                    dw       $0090, hsStringD5
                    dw       $f090, hsStringD6
                    dw       0
showHSHelp
                    ldy      #displayListHS
                    jsr      showMESSAGE
REPLACE_1_2_HSloop1_varFromIRQ1_3                         ;  bank 1 replace
                    ldx      #0                           ; HSloop1
                    jmp      jmpBank1X

;---------------------------------------------
hspStringD1         db       "DISPLAY OF THE TOP 4",$80
hspStringD2         db       "VECTORBLADE SCORES!",$80
hspStringD3         db       "BUTTON 2 SWITCHES MODES!",$80
displayListHSPure
                    dw       $6090, hspStringD1
                    dw       $5090, hspStringD2
                    dw       $4090, hspStringD3
                    dw       0
showHSPureHelp
                    ldy      #displayListHSPure
                    jsr      showMESSAGE
REPLACE_1_2_edithighscoreinner_varFromIRQ1_3              ;  bank 1 replace
                    ldx      #0                           ; edithighscoreinner
                    jmp      jmpBank1X

; ------------------------
psStringD1          db       "PAUSE MODE SHOWS CURRENT",$80
psStringD2          db       "STATUS INFORMATION.",$80
psStringD3          db       "UP/DOWN SCROLLS THE TEXT.",$80
psStringD4          db       "\"???\" REPRESENT STATS OR",$80
psStringD5          db       "SECRETS YOU HAVE NOT",$80
psStringD6          db       "DISCOVERED YET.",$80
displayListPS
                    dw       $6090, psStringD1
                    dw       $5090, psStringD2
                    dw       $3090, psStringD3
                    dw       $1090, psStringD4
                    dw       $0090, psStringD5
                    dw       $f090, psStringD6
                    dw       0
ps1StringD1         db       "SAVE GAME",$80
ps1StringD2         db       "MOVING UP TO THE DISK ICON",$80
ps1StringD3         db       "ALLOWS SAVING OF THE",$80
ps1StringD4         db       "CURRENT GAME.",$80
displayListPS1
                    dw       $6090, ps1StringD1
                    dw       $4090, ps1StringD2
                    dw       $3090, ps1StringD3
                    dw       $2090, ps1StringD4
                    dw       0
showPSHelp
                    ldy      #displayListPS
                    jsr      showMESSAGE
                    ldy      #displayListPS1
                    jsr      showMESSAGE
REPLACE_1_2_PSloop1_varFrom0_3                            ;  bank 2 replace
                    ldx      #0                           ; PSloop1
                    jmp      jmpBank2_from0

; ------------------------
msStringD1          db       "GUIDE YOUR SHIP THRU THE",$80
msStringD2          db       "MINESTORM!",$80
msStringD3          db       "LEFT/RIGHT MOVES THE SHIP.",$80
msStringD4          db       "BUTTON 4 ACCELERATES,",$80
msStringD5          db       "BUTTON 3 SLOWS DOWN.",$80
msStringD6          db       "REACH THE END OF THE MINESTORM",$80
msStringD7          db       "FOR YOUR REWARD!",$80
displayListMS
                    dw       $6090, msStringD1
                    dw       $5090, msStringD2
                    dw       $3090, msStringD3
                    dw       $1090, msStringD4
                    dw       $f090, msStringD5
                    dw       $d090, msStringD6
                    dw       $c090, msStringD7
                    dw       0
showMSHelp
                    ldy      #displayListMS
                    jsr      showMESSAGE
; correct highscore size
                    ldd      #$f850
                    std      Vec_Text_HW
REPLACE_1_2_MSloop1_varFrom1_3                            ;  bank 3 replace
                    ldx      #0                           ; MSloop1
                    jmp      jmpBankIRQ3X

; ------------------------
vbStringt1          db       "THIS IS YOUR \"DESKTOP\", FROM",$80
vbStringt2          db       "HERE YOU CAN ENTER THE GAME,",$80
vbStringt3          db       "VIEW HIGH SCORES OR ACHIEVEMENTS",$80
vbStringt4          db       "OR CHANGE THE SETTINGS FOR",$80
vbStringt5          db       "VECTORBLADE!",$80
displayListTI1
                    dw       $6090, vbStringt1
                    dw       $5090, vbStringt2
                    dw       $3090, vbStringt3
                    dw       $2090, vbStringt4
                    dw       $0090, vbStringt5
                    dw       0
vb2Stringt1         db       "USE THE JOYSTICK TO HIGHLIGHT",$80
vb2Stringt2         db       "THE SECTION YOU WOULD LIKE TO",$80
vb2Stringt3         db       "ENTER AND PRESS A BUTTON.",$80
vb2Stringt4         db       "PRESSING BUTTON 1 WILL SHOW A",$80
vb2Stringt5         db       "SHORT HELP TEXT ON MOST",$80
vb2Stringt6         db       "SCREENS! I WISH YOU A NICE",$80
vb2Stringt7         db       "VECTORBLADE!",$80
displayListTI2
                    dw       $6090, vb2Stringt1
                    dw       $5090, vb2Stringt2
                    dw       $4090, vb2Stringt3
                    dw       $2090, vb2Stringt4
                    dw       $1090, vb2Stringt5
                    dw       $0090, vb2Stringt6
                    dw       $e090, vb2Stringt7
                    dw       0
showTitleHelp
                    ldy      #displayListTI1
                    jsr      showMESSAGE
                    ldy      #displayListTI2
                    jsr      showMESSAGE
REPLACE_1_2_Titleloop1_varFrom0_3                         ;  bank 3 replace
                    ldx      #0                           ; Titleloop1
                    jmp      jmpBankIRQ2X

; ------------------------
asStringD1          db       "HERE YOU SEE A LIST OF ALL",$80
asStringD2          db       "POSSIBLE ACHIEVEMENTS YOU",$80
asStringD3          db       "CAN REACH PLAYING VECTORBLADE.",$80
asStringD4          db       "THREE THINGS ARE LISTED:",$80
asStringD5          db       "TITLE: NAME OF THE ACHIEVEMENT",$80
asStringD6          db       "WHEN: WHAT TO DO TO GET IT",$80
asStringD7          db       "REWARD: WHAT YOUR REWARD IS",$80
displayListAS1
                    dw       $6090, asStringD1
                    dw       $5090, asStringD2
                    dw       $4090, asStringD3
                    dw       $2090, asStringD4
                    dw       $0090, asStringD5
                    dw       $e090, asStringD6
                    dw       $c090, asStringD7
                    dw       0
as2StringD1a        db       "USE THE JOYSTICK (UP/DOWN)",$80
as2StringD2a        db       "TO SCROLL THRU ALL ITEMS.",$80
as2StringD3a        db       "PRESS BUTTON 4 TO EXIT.",$80
displayListAS2a
                    dw       $6090, as2StringD1a
                    dw       $5090, as2StringD2a
                    dw       $3090, as2StringD3a
                    dw       0
as2StringD1         db       "A SMALL CHECK MARK AT THE TOP",$80
as2StringD2         db       "INDICATES THAT YOU ALREADY",$80
as2StringD3         db       "GOT THE ACHIEVEMENT.",$80
as2StringD4         db       "THE REWARD WILL BE APPLIED",$80
as2StringD5         db       "WITH EVERY NEW GAME YOU PLAY!",$80
as2StringD6         db       "ENJOY!",$80
displayListAS2
                    dw       $6090, as2StringD1
                    dw       $5090, as2StringD2
                    dw       $4090, as2StringD3
                    dw       $2090, as2StringD4
                    dw       $1090, as2StringD5
                    dw       $f090, as2StringD6
                    dw       0
showASHelp
                    ldy      #displayListAS1
                    jsr      showMESSAGE
                    ldy      #displayListAS2a
                    jsr      showMESSAGE
                    ldy      #displayListAS2
                    jsr      showMESSAGE
REPLACE_1_2_displayAchievementReturn_varFromIRQ1_3        ;  bank 1 replace
                    ldx      #0                           ; displayAchievementReturn
                    jmp      jmpBank1X

; ------------------------
; ------------------------
ssStringD1          db       "IN THE SHOP YOU CAN BUY NEW",$80
ssStringD2          db       "EQUIPMENT FOR YOUR SHIP.",$80
ssStringD3          db       "USE THE JOYSTICK TO MOVE",$80
ssStringD4          db       "THRU THE LIST (UP/DOWN).",$80
ssStringD5          db       "PRESS BUTTON 4 TO PURCHASE.",$80
ssStringD6          db       "TO EXIT SCROLL TO \"DONE\"",$80
ssStringD7          db       "AND PRESS BUTTON 3!",$80
displayListShop1
                    dw       $6090, ssStringD1
                    dw       $5090, ssStringD2
                    dw       $4090, ssStringD3
                    dw       $3090, ssStringD4
                    dw       $1090, ssStringD5
                    dw       $f090, ssStringD6
                    dw       $e090, ssStringD7
                    dw       0
ss2StringD1         db       "MOST ITEMS IN THE SHOP CAN",$80
ss2StringD2         db       "ALSO BE GOTTEN AS BONUS DROPS",$80
ss2StringD3         db       "DURING THE GAME.",$80
ss2StringD4         db       "SOME ITEMS ARE EXCLUSIVE TO",$80
ss2StringD5         db       "THE SHOP THOUGH.",$80
ss2StringD6         db       "THERE ARE ALSO ITEMS NOT",$80
ss2StringD7         db       "AVAILABLE FROM THE START...",$80
displayListShop2
                    dw       $6090, ss2StringD1
                    dw       $5090, ss2StringD2
                    dw       $4090, ss2StringD3
                    dw       $2090, ss2StringD4
                    dw       $1090, ss2StringD5
                    dw       $e090, ss2StringD6
                    dw       $d090, ss2StringD7
                    dw       0
ss3StringD1         db       "...THESE ARE MARKED WITH N/A",$80
ss3StringD2         db       "AND WILL (MIGHT) BE AVAILABLE",$80
ss3StringD3         db       "LATER IN THE GAME.",$80
ss3StringD4         db       "FOLLOWING THE ITEMS EXCLUSIVE",$80
ss3StringD5         db       "TO THE SHOP...",$80
displayListShop3
                    dw       $6090, ss3StringD1
                    dw       $5090, ss3StringD2
                    dw       $4090, ss3StringD3
                    dw       $2090, ss3StringD4
                    dw       $1090, ss3StringD5
                    dw       0
ss4StringD1         db       "AUTOFIRE",$80
ss4StringD2         db       "HOLDING DOWN BUTTON 1 OR 4",$80
ss4StringD3         db       "AUTOMATICALLY KEEPS FIRING!",$80
ss4StringD4         db       "POWER",$80
ss4StringD5         db       "INCREASES THE OVERALL DAMAGE",$80
ss4StringD6         db       "YOUR SHOTS DO!",$80
displayListShop4
                    dw       $6090, ss4StringD1
                    dw       $5090, ss4StringD2
                    dw       $4090, ss4StringD3
                    dw       $2090, ss4StringD4
                    dw       $1090, ss4StringD5
                    dw       $0090, ss4StringD6
                    dw       0
ss5StringD1         db       "LOCK",$80
ss5StringD2         db       "PREVENTS ONE SHIP DOWNGRADE",$80
ss5StringD3         db       "WHEN DYING (CAN BE PURCHASED",$80
ss5StringD4         db       "MULTIPLE TIMES)",$80
ss5StringD5         db       "BOMB",$80
ss5StringD6         db       "ONE SUPERBOMB, DESTROYS ALL",$80
ss5StringD7         db       "ORDINARY ALIENS (BUTTON 2)",$80
displayListShop5
                    dw       $6090, ss5StringD1
                    dw       $5090, ss5StringD2
                    dw       $4090, ss5StringD3
                    dw       $3090, ss5StringD4
                    dw       $1090, ss5StringD5
                    dw       $0090, ss5StringD6
                    dw       $f090, ss5StringD7
                    dw       0
ss6StringD1         db       "IMMUNE",$80
ss6StringD2         db       "IMMUNITY TO 1 SHOT BONUS",$80
ss6StringD3         db       "DROPS",$80
ss6StringD4         db       "SECRET",$80
ss6StringD5         db       "A TEXT DESCRIBING HOW TO FIND",$80
ss6StringD6         db       "SOME SECRETS (CAN BE BOUGHT",$80
ss6StringD7         db       "MULTIPLE TIMES)",$80
displayListShop6
                    dw       $6090, ss6StringD1
                    dw       $5090, ss6StringD2
                    dw       $4090, ss6StringD3
                    dw       $2090, ss6StringD4
                    dw       $1090, ss6StringD5
                    dw       $0090, ss6StringD6
                    dw       $f090, ss6StringD7
                    dw       0
showShopHelp
                    ldy      #displayListShop1
                    jsr      showMESSAGE
                    ldy      #displayListShop2
                    jsr      showMESSAGE
                    ldy      #displayListShop3
                    jsr      showMESSAGE
                    ldy      #displayListShop4
                    jsr      showMESSAGE
                    ldy      #displayListShop5
                    jsr      showMESSAGE
                    ldy      #displayListShop6
                    jsr      showMESSAGE
                    ldd      #$f850
                    std      Vec_Text_HW
REPLACE_1_2_shopLoop_varFromIRQ1_3                        ;  bank 1 replace
                    ldx      #0                           ; shopLoop
                    jmp      jmpBank1X

; ------------------------
opStringt1          db       "SETTINGS FOR VECTORBLADE!",$80
opStringt2          db       "SELECT THE OPTION USING THE",$80
opStringt3          db       "JOYSTICK UP/DOWN.",$80
opStringt4          db       "TO ENTER/CHANGE A SETTING ",$80
opStringt5          db       "PRESS BUTTON 4.",$80
opStringt6          db       "FOLLOWING THINGS CAN BE",$80
opStringt7          db       "CONFIGURED: ...",$80
displayListOP1
                    dw       $6090, opStringt1
                    dw       $4090, opStringt2
                    dw       $3090, opStringt3
                    dw       $1090, opStringt4
                    dw       $0090, opStringt5
                    dw       $e090, opStringt6
                    dw       $d090, opStringt7
                    dw       0
op2Stringt1         db       "DIFFICULTY",$80
op2Stringt2         db       "IF YOU UNLOCKED THE ABILITY",$80
op2Stringt3         db       "TO CHANGE THE DIFFICULTY, YOU",$80
op2Stringt4         db       "CAN CYCLE THRU THESE USING ",$80
op2Stringt5         db       "BUTTON 4.",$80
op2Stringt6         db       "MODE",$80
;op2Stringt7         db       "CHOSE BETWEEN NORMAL/HARDCORE.",$80
op2Stringt7         db       "CHOSE BETWEEN NORMAL",$80
op2Stringt8         db       "AND HARDCORE MODE.",$80
displayListOP2
                    dw       $6090, op2Stringt1
                    dw       $5090, op2Stringt2
                    dw       $4090, op2Stringt3
                    dw       $3090, op2Stringt4
                    dw       $2090, op2Stringt5
                    dw       $0090, op2Stringt6
                    dw       $F090, op2Stringt7
                    dw       $E090, op2Stringt8
                    dw       0
op3Stringt1         db       "CALIBRATE",$80
op3Stringt2         db       "ON EACH DIFFERENT VECTREX YOU",$80
op3Stringt3         db       "PLAY, YOU SHOULD CALIBRATE",$80
op3Stringt4         db       "VECTORBLADE ANEW.",$80
op3Stringt5         db       "RESET",$80
op3Stringt6         db       "RESET ALL SAVED VALUES TO",$80
op3Stringt7         db       "DEFAULT STARTING VALUES.",$80
displayListOP3
                    dw       $6090, op3Stringt1
                    dw       $5090, op3Stringt2
                    dw       $4090, op3Stringt3
                    dw       $3090, op3Stringt4
                    dw       $1090, op3Stringt5
                    dw       $0090, op3Stringt6
                    dw       $f090, op3Stringt7
                    dw       0
op4Stringt1         db       "DISPLAY SECRETS",$80
op4Stringt2         db       "DISPLAY THE SECRET MESSAGES",$80
op4Stringt3         db       "YOU BOUGHT IN THE SHOP.",$80
displayListOP4
                    dw       $6090, op4Stringt1
                    dw       $5090, op4Stringt2
                    dw       $4090, op4Stringt3
                    dw       0
op5Stringt1         db       "LOAD SAVED GAME",$80
op5Stringt2         db       "IF YOU HAVE A SAVED GAME -",$80
op5Stringt3         db       "MOVING TO THE DISK ICON",$80
op5Stringt4         db       "ALLOWS CONTINUING.",$80
displayListOP5
                    dw       $6090, op5Stringt1
                    dw       $4090, op5Stringt2
                    dw       $3090, op5Stringt3
                    dw       $2090, op5Stringt4
                    dw       0
showOptionHelp
                    ldy      #displayListOP1
                    jsr      showMESSAGE
                    ldy      #displayListOP2
                    jsr      showMESSAGE
                    ldy      #displayListOP3
                    jsr      showMESSAGE
                    ldy      #displayListOP4
                    jsr      showMESSAGE
                    ldy      #displayListOP5
                    jsr      showMESSAGE
REPLACE_1_2_optionsLoop_varFrom0_3                        ;  bank 2 replace
                    ldx      #0                           ; optionsLoop
                    jmp      jmpBankIRQ2X

; ------------------------
firstStringt1       db       "FIRST TIME MESSAGE!",$80
firstStringt2       db       "DURING CALIBRATION OR NEARLY",$80
firstStringt3       db       "ANYWHERE IN VECTORBLADE, ",$80
firstStringt4       db       "PRESS BUTTON 1 FOR A SHORT",$80
firstStringt5       db       "HELP TEXT.",$80
firstStringt6       db       "(AND BUTTON 4 TO EXIT)",$80
displayListFirst1
                    dw       $60a4, firstStringt1
                    dw       $4090, firstStringt2
                    dw       $3090, firstStringt3
                    dw       $2090, firstStringt4
                    dw       $1090, firstStringt5
                    dw       $f090, firstStringt6
                    dw       0
showFirstHelp
                    ldy      #displayListFirst1
                    jsr      showMESSAGE
REPLACE_1_2_doCalib0_varFrom0_3                           ;  bank 2 replace
                    ldx      #0                           ; doCalib0
                    jmp      jmpBankIRQ2X

; ------------------------
bdfirstStringt1     db       "YOUR SHIP WAS DESTROYED!",$80
bdfirstStringt2     db       "YOU HAVE TO GET",$80
bdfirstStringt3     db       "A RESERVE VECTORBLADE. ",$80
bdfirstStringt4     db       "WHILE YOU DO THAT NEW WAVES",$80
bdfirstStringt5     db       "OF ENEMIES FORM...",$80
bdfirstStringt6     db       "(YOU WENT BACK SOME LEVELS)",$80
displayListFirst1bd
                    dw       $6090, bdfirstStringt1
                    dw       $4090, bdfirstStringt2
                    dw       $3090, bdfirstStringt3
                    dw       $1090, bdfirstStringt4
                    dw       $0090, bdfirstStringt5
                    dw       $e090, bdfirstStringt6
                    dw       0
showBossDeath
                    ldy      #displayListFirst1bd
                    jsr      showMESSAGE
; correct highscore size
                    ldd      #$f850
                    std      Vec_Text_HW
REPLACE_1_2_backFromBothDeathMessage_varFrom1_3           ;  bank 3 replace
                    ldx      #0                           ; backFromBothDeathMessage
                    jmp      jmpBankIRQ3X

smNoString          db       "NO SECRET MESSAGES YET!",$80
displaySecretMessageNone
                    dw       $6090, smNoString
                    dw       0
showSecretMessageNone
                    ldy      #displaySecretMessageNone
                    jsr      showMESSAGE
; correct highscore size
                    ldd      #$f850
                    std      Vec_Text_HW
                    rts

sm11String          db       "SECRET MESSAGE 1",$80
sm12String          db       "FIVE UFOS MUST PASS, THEN",$80
sm13String          db       "THE MOTHER APPEARS WHICH",$80
sm14String          db       "DROPS BIG MONEY!",$80
displaySecretMessage1
                    dw       $6090, sm11String
                    dw       $4090, sm12String
                    dw       $3090, sm13String
                    dw       $2090, sm14String
                    dw       0
showSecretMessage1
                    ldy      #displaySecretMessage1
                    jsr      showMESSAGE
; correct highscore size
                    ldd      #$f850
                    std      Vec_Text_HW
                    rts

sm21String          db       "SECRET MESSAGE 2",$80
sm22String          db       "COLLECTING ORDERED DROPS",$80
sm23String          db       "CORRECTLY WILL GIVE YOU",$80
sm24String          db       "GREAT BENEFITS!",$80
displaySecretMessage2
                    dw       $6090, sm21String
                    dw       $4090, sm22String
                    dw       $3090, sm23String
                    dw       $2090, sm24String
                    dw       0
showSecretMessage2
                    ldy      #displaySecretMessage2
                    jsr      showMESSAGE
; correct highscore size
                    ldd      #$f850
                    std      Vec_Text_HW
                    rts

sm31String          db       "SECRET MESSAGE 3",$80
sm32String          db       "THREE TIMES IN A ROW OF",$80
sm33String          db       "SOMETHING BAD GIVES YOU",$80
sm34String          db       "SOMETHING GOOD!",$80
displaySecretMessage3
                    dw       $6090, sm31String
                    dw       $4090, sm32String
                    dw       $3090, sm33String
                    dw       $2090, sm34String
                    dw       0
showSecretMessage3
                    ldy      #displaySecretMessage3
                    jsr      showMESSAGE
; correct highscore size
                    ldd      #$f850
                    std      Vec_Text_HW
                    rts

sm41String          db       "SECRET MESSAGE 4",$80
sm42String          db       "THE MONEY SUCKER CAN DROP",$80
sm43String          db       "HUGE AMOUNTS OF MONEY WHEN ",$80
sm44String          db       "KILLED. PROVIDED YOU",$80 
sm45String          db       "COLLECTED 150 CREDITS WITH",$80
sm46String          db       "THREE CONSECUTIVE DROPS!",$80
displaySecretMessage4
                    dw       $6090, sm41String
                    dw       $4090, sm42String
                    dw       $3090, sm43String
                    dw       $2090, sm44String
                    dw       $1090, sm45String
                    dw       $0090, sm46String
                    dw       0
showSecretMessage4
                    ldy      #displaySecretMessage4
                    jsr      showMESSAGE
; correct highscore size
                    ldd      #$f850
                    std      Vec_Text_HW
                    rts

sm51String          db       "SECRET MESSAGE 5",$80
sm52String          db       "COLLECT 50 DIAMONDS TO",$80
sm53String          db       "ENTER THE",$80
sm54String          db       "SUPER DIAMOND LEVEL!",$80
displaySecretMessage5
                    dw       $6090, sm51String
                    dw       $4090, sm52String
                    dw       $3090, sm53String
                    dw       $2090, sm54String
                    dw       0
showSecretMessage5
                    ldy      #displaySecretMessage5
                    jsr      showMESSAGE
; correct highscore size
                    ldd      #$f850
                    std      Vec_Text_HW
                    rts

sm61String          db       "SECRET MESSAGE 6",$80
sm62String          db       "THREE TIMES SCOOPIES",$80
sm63String          db       "MAKES THEM STAY EVEN",$80
sm64String          db       "AFTER A WARP!",$80
displaySecretMessage6
                    dw       $6090, sm61String
                    dw       $4090, sm62String
                    dw       $3090, sm63String
                    dw       $2090, sm64String
                    dw       0
showSecretMessage6
                    ldy      #displaySecretMessage6
                    jsr      showMESSAGE
; correct highscore size
                    ldd      #$f850
                    std      Vec_Text_HW
                    rts

sm71String          db       "SECRET MESSAGE 7",$80
sm72String          db       "FINISHING 100 LEVELS ON",$80
sm73String          db       "EASY MAKES YOU",$80
sm74String          db       "IMMUNE TO 1 SHOTS!",$80
sm75String          db       "FINISHING 100 LEVELS ON",$80
sm76String          db       "NORMAL MAKES YOU",$80
sm77String          db       "IMMUNE TO 2 SHOTS!",$80
displaySecretMessage7
                    dw       $6090, sm71String
                    dw       $4090, sm72String
                    dw       $3090, sm73String
                    dw       $2090, sm74String
                    dw       $0090, sm75String
                    dw       $f090, sm76String
                    dw       $e090, sm77String
                    dw       0
showSecretMessage7
                    ldy      #displaySecretMessage7
                    jsr      showMESSAGE
; correct highscore size
                    ldd      #$f850
                    std      Vec_Text_HW
                    rts

rsm71String         db       "RESET!",$80
rsm72String         db       "THIS WILL RESET ALL:",$80
rsm73String         db       "- HIGH SCORES",$80
rsm74String         db       "- CALIBRATIONS",$80
rsm75String         db       "- ACHIEVEMENTS",$80
rsm76String         db       "ARE YOU SURE?",$80
rsm77String         db       "(BUTTON 3 YES, BUTTON 4 NO)",$80
rdisplayResetMessage
                    dw       $6090, rsm71String
                    dw       $4090, rsm72String
                    dw       $3090, rsm73String
                    dw       $2090, rsm74String
                    dw       $1090, rsm75String
                    dw       $f090, rsm76String
                    dw       $e090, rsm77String
                    dw       0
showResetMessage
                    ldy      #rdisplayResetMessage
                    jsr      showMESSAGE
; correct highscore size
                    ldd      #$f850
                    std      Vec_Text_HW
                    rts

svg71String         db       "SAVE GAME!",$80
svg72String         db       "DO YOU WANT TO SAVE",$80
svg73String         db       "THE CURRENT GAME?",$80
;svg74String         db       "(BUTTON 3 YES, BUTTON 4 NO)",$80
displaySaveMessage
                    dw       $6090, svg71String
                    dw       $4090, svg72String
                    dw       $3090, svg73String
                    dw       $1090, rsm77String;svg74String
                    dw       0
showSaveMessage:
                    ldy      #displaySaveMessage
                    jsr      showMESSAGE
; correct highscore size
                    ldd      #$f850
                    std      Vec_Text_HW
                    rts

ldg71String         db       "LOAD GAME!",$80
ldg72String         db       "DO YOU WANT TO LOAD",$80
ldg73String         db       "THE SAVED GAME?",$80
ldg74String         db       "NO HIGH SCORE POSSIBLE!",$80
ldg75String         db       "NO ACHIEVEMENTS POSSIBLE!",$80
;ldg76String         db       "(BUTTON 3 YES, BUTTON 4 NO)",$80
displayLoadMessage
                    dw       $6090, ldg71String
                    dw       $4090, ldg72String
                    dw       $3090, ldg73String
                    dw       $1090, ldg74String
                    dw       $0090, ldg75String
                    dw       $e090, rsm77String
                    dw       0
showLoadMessage
                    ldy      #displayLoadMessage
                    jsr      showMESSAGE
; correct highscore size
                    ldd      #$f850
                    std      Vec_Text_HW
                    rts

yes71String         db       "YES!",$80
YesMessage
                    dw       $6090, yes71String
                    dw       0
showYesMessage
                    ldy      #YesMessage
                    jsr      showMESSAGE
; correct highscore size
                    ldd      #$f850
                    std      Vec_Text_HW
                    rts

no71String          db       "NO!",$80
NoMessage
                    dw       $6090, no71String
                    dw       0
showNoMessage
                    ldy      #NoMessage
                    jsr      showMESSAGE
; correct highscore size
                    ldd      #$f850
                    std      Vec_Text_HW
                    rts





inputJoystick1          db       "INPUT:",$80
inputJoystick2          db       "JOYSTICK",$80
inputJoystick3          db       "BUTTONS",$80


inputJoystickMessage
                    dw       $6090, inputJoystick1
                    dw       $4090, inputJoystick2
                    dw       0
showJoystickMessage
                    ldy      #inputJoystickMessage
showMessgCont
                    jsr      showMESSAGE
; correct highscore size
                    ldd      #$f850
                    std      Vec_Text_HW
                    rts

inputButtonMessage
                    dw       $6090, inputJoystick1
                    dw       $4090, inputJoystick3
                    dw       0
showButtonMessage
                    ldy      #inputButtonMessage
 bra showMessgCont




