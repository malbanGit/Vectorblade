;7 secrets in one game - and you can access a shop after each level :slight_smile: - oh shit... didn't test that with the new button configuration.... !=!)§(!=??


;
;                    DB       "VERSION 1.00"            ; Cartridges 1-30
;                    DB       "VERSION 1.01"            ; Cartridges 1-31 - "all" fixed: Immunity 2 games by wheel, was ovewritten bei level rollover
;                    DB       "VERSION 1.02"            ; fixed: Immunity setting could overwrite multiplyer, that caused the mulitplyer to
                                                        ; be "0" whiech effectively was 256 -> huge scores! 
;                    DB       "VERSION 1.03"            ; fixed: bug in boss 4, gamescale positive -> endless loop
                                                        ; fixed: pause mode glitch, shots can go thru shields
                                                        ; fixed:in dodger was potential to get the multiplyers mixed up
                                                        ; added version number to title
;                    DB       "VERSION 1.04"            ; fixed: debounce of button 4 upon entering highscore from desktop upon first entry
;                    DB       "VERSION 1.05"            ; fixed: added a tiny bit of delay in the FLASH write routine, and game save RAM read routine
;                    DB       "VERSION 1.06"            ; fixed: intensity levels to work on "strange" vectrex (CSR)
;                    DB       "VERSION 1.07"            ; fixed: player dead and level clear at the same time, leads to endless loop
                                                        ; fixed: a small bug in secret display, if an achievement in the same byte had been gotten
                                                        ;        but no secret yet, a "no secret yet" message was not displayed!
                                                        ; changed: each level allows now at leat ONE attack pattern
                                                        ;          this way it is not possible to completely ignore enemies in mode easy,
                                                        ;          when positioned "correctly"
                                                        ; added: additional "INPUT" option, hidden (due to not having any space left
                                                        ;        in the config menu go to the top, going pushing up, than "toggles" the input method
                                                        ;        toggle between joystick (default, not changed) and buttons, button mapping as follows
                                                        ; button in title:
                                                        ; 1 Start game
                                                        ; 2 options
                                                        ; 3 high score
                                                        ; 4 achievement
                                                        ; help not available
                                                        ;
                                                        ; button minestorm
                                                        ; 1 throttle speed
                                                        ; 4 increase speed
                                                        ; button 2/3 x movements
                                                        ; no help available
                                                        ;
                                                        ; button highscore edit
                                                        ; 1 keep initial
                                                        ; 4 shoot
                                                        ; button 2/3 letter scrolling
                                                        ; no help available
                                                        ;
                                                        ; button highscore shown
                                                        ; 1 help
                                                        ; 2 switch mode
                                                        ; 4 exit
                                                        ;
                                                        ; button achievments
                                                        ; 1 help
                                                        ; 2/3 scroll
                                                        ; 4 exit
                                                        ;
                                                        ; button config
                                                        ; 1 help
                                                        ; 2/3 scroll up/down
                                                        ; 4 execute
                                                        ; you can not do horizontal settings (level edit)
                                                        ; scroll to the top/top - to toggle input method (not visible)
                                                        ;
                                                        ; buttons in game
                                                        ; button 1 super bomb
                                                        ; button 2/3 x movement
                                                        ; button 4 shot
                                                        ; all 4 buttons pressed = pause
                                                        ;
                                                        ; buttons in pause
                                                        ; button 1 help
                                                        ; button 2/3 y movement
                                                        ; button 4 exit
;                    DB       "VERSION 1.08"            ; changed: switch off joystick on desktop in button mode
                                                        ; changed: icon of "autofire" slightly to make it easier to distinguish with "shot 1"
;                    DB       "VERSION 1.09"            ; fixed: LIVE -> LIFE
                                                        ; fixed: debounce of button 4 in joystick mode, to enter highscore
;                    DB       "VERSION 1.10"            ; fixed: High score stars were not displayed, entered somewhere along those last two revisions :-(
;                    DB       "VERSION 1.11"            ; fixed: Fixed bug discovered by Ralf Kornmann, if data was saved exactly a multiple of 51 times, and
                                                        ;        the vectrex was switched off after that, the game data was corrupted



;
TESTING             =        0                            ; switch between usiong TEST/Debug values (defined below) 
;
TIMER_LEVEL         =        0                            ; if defined there is a time trialmodus, but implementaion not finished. 
                                                          ; todo: no warp, difficulty up, some more powerm no achievements, different high score, no warp 
;
ADDITIONAL_INPUT = 1 ; added with v1.07
;
DO_DYING_BONUS      =        1                            ; on death sprawl up to 5 bonus items, whoch might be lost upon a death 
ERRATIC_STARTING_WITH_HARD  =  1                          ; else startng with NORMAL 
REDUCED_OBJECT_SIZE  =       1                            ; TODO: ram object use only 1 byte to encode the following object (not finished) 
USE_BIG_STACK       =        0                            ; this reduces bonus on screen from 6 to 4 gives 16 bytes more stack 
NMI_HANDLER         =        0                            ; NMI handler is not faulty resistent! 
                                                          ; Enemies have one bullet less (need RAM) 
                                                          ; song: introMusic is replaced with title music (one song less), needed ROM space 
                                                          ; so if "nmi" testing is done, STACK this must be changed 
                                                          ; but beware!!! if lower than $CBFC 
                                                          ; Stack underflow will occur at some stage!!! - unless precaution is taken! 
;
RECORD_GAME_DATA    =        0                            ; if enabled game and gameplay will be saved each level to "gamesave" location ($a000) 
                                                          ; no save game possible 
                                                          ; not enabled with VecFever 
                                                          ; if enabled "normal" save game is disabled! 
                                                          ; less stars 
                                                          ; 1 less player shot 
                                                          ; wheel does not show, and gives random results 
INCLUDE_NMI_TIMING  =        0                            ; NMI handler also displays T1 / T2 (after NMI is entered) 
DRAW_FIGHTER_IN_BANK0  =     1                            ; than different "evolving" fighters are drawn (each shot) ... tiny bit slower than in bank 3 
;
IS_VIA_FAULTY_RESISTENT  =   0                            ; no DEC, INC on VIA_Port_b, no BIOS calls - there are 1 or 2 "new" instances, where this is not correctly handled! 
;
;
 if  NMI_HANDLER = 1 
MY_STACK            =        $CBFB                        ; overall stack frame start, uses (obviously) also interrupt vectors etc 
 else  
MY_STACK            =        $CBFC                        ; overall stack frame start, uses (obviously) also interrupt vectors etc 
 endif  
;
SCOOPY_HIT_LARGE_OBJECT  =   1                            ; if defined, "center" hits on large enemies, also devour scoopy hits automatically 
TEST_ALL_SHOTS      =        0                            ; makes all sorts of trouble with different enemy/size types ; if one, than from a certain enemy count all shots are tested, if not defined than always test with two saelected shots 
ENEMY_THRESHOLD     =        3                            ; or less enemies are tested with ALL shots, more enemies are only tested with 2 selected shots 
USE_NEW_SHOTS       =        0                            ; use vertical shots instead of horizontal shots -> slightly faster but way more ugly! 
BIOS_WR             =        0                            ; use BIOS WR in main loop, slower but more easy to measure! 
ENABLE_STAR_TACSCAN  =       1                            ; if joytick moves - star move opposite 
TEST_VOX            =        1                            ; if enabled Vec Vox is used in game 
CORRECT_START_LEVEL  =       0                            ; if 1, than level 25 == level 25, not boss! 
;
;................
;. VecFever Start
;................
;
; if  VecFever = 1
; Vectorblade ASSUMES a VecFever is present!
; no Further testing is done, VecFever facilities are used without questions... or answers!
; Also VecFever with a IRQ (address-)line and Firmware >= 1.21 is assumed.
;
; In that case options and highscores are saved using the
; ShadowRAM and copy to ROM feature (upper 16k)
; The V4E structure lies in Bank 1 ($8030) - followed by options and the highscore table(s).
;
VECFEVER            =        0
;
;VECFEVER_FAKE = 1 ; don't execute any RAM/ROM copy for persistency
;
;
;
; COLOR LED not working due to timing issues in VecFever
; Thomas disabled LED with IRQ-rom access (V4E type 10)
 if  VECFEVER = 1 
;
;
; if you change code and allow
; you better also change the VecFever save code
; since in RAM there are jump addresses that might no tbe compatible with a previous compiled version
; in a saved game!
ALLOW_SAVING        =        1 
RECORD_GAME_DATA    =        0 
;
RED_LED             equ      $10 
GREEN_LED           equ      $20 
BLUE_LED            equ      $40 
WHITE_LED           equ      RED_LED+GREEN_LED+BLUE_LED 
CYAN_LED            equ      GREEN_LED+BLUE_LED 
YELLOW_LED          equ      RED_LED+GREEN_LED 
MAGENTA_LED         equ      RED_LED+BLUE_LED 
 else  
ALLOW_SAVING        =        1 
 endif  
 if  RECORD_GAME_DATA = 1 
ALLOW_SAVING        =        0                            ; #noDoubleWarn 
 endif  
;
;...............
;. VecFever End
;...............
;
; defines for game difficulties
EASY                =        0 
NORMAL              =        1 
HARD                =        2 
IMPOSSIBLE          =        3 
SUPER_IMPOSSIBLE    =        4 
HARDCORE            =        -1 
;
DRUNKEN_TIME        =        127                          ; positive - or code for "countdown display must be changed! (bank 0 Fighter Prep) 
;
;...................
;. Test values Start
;...................
;
 if  TESTING = 1 
START_LEVEL         =        48                           ;4 ;23;76;24 ;79; SHIELD 
MAX_LEVEL_SELECT_ALLOWED  =  1 
DEFAULT_DIFFICULTY  =        EASY 
TRY_MAJOR_HAVOC     =        0                            ; if defined, after Minestorm the major havoc part is invoked 
SHORT_INVULNERABILITY  =     1                            ; if defined, desturction of armor renders you for 1 second invulnerable (shiled) 
BOSS_FIGHT_DEATH_JUMP  =     0                            ; if 1, than a boss fight doe not jump back a random number of leveks 
ASSUME_CALIBRATION  =        0                            ; the calibrations values of one of my vectrex is assumed... 
SKIP_TITLE_SCREEN   =        0                            ; 
PLAYER_SHIELD_START  =       0                            ;BITFIELD_SCOOP ;BITFIELD_ARMOR = $80 ;BITFIELD_SHIELD = $40 ;BITFIELD_SCOOP = $20 ;BITFIELD_NOT_SCOOP = $ff-$20 
START_SHOT_NUMBER   =        9                            ;2 
START_SHOT_WIDTH    =        4                            ;3 ;1-4 normal shots, 5 triangle shot, 6 lazer 
START_FIGHTER_SPEED  =       900 
START_SHOT_SPEED    =        900 
SPEED_DELTA         =        25                           ; both shot and player 
START_TIMER_MAX     =        250                          ; 10 seconds 
DEAFULT_START_MONEY  =       5000 
MEGAFIEND_HP        =        300 
MONEYSUCKER_HP      =        300 
LOCK_START          =        %00010001                    ; 00SWLLLL S = scoopy shield, W = scoopy lock, LLLL = count of weapon lock 
IMMUNITY_START      =        MULTIPLY_1_OR                ;IMUNITY_1 +MULTIPLY_1_OR ; 1 = shot 1, 2 = shot 2; 
UNLIMITED_BOMBS     =        0 
SMARTBOMB_COUNT     =        5                            ; only in testing 
DIAMOND_COUNT       =        0                            ; only in testing 
START_WITH_SHOP     =        0                            ; if active, scoopies are not initialized for testing! 
ALLOW_BUY_EVERYTHING  =      1 
AUTO_FIRE           =        1 
MANY_MEGA           =        0                            ; if defined - MANY mega aliens will appear (if possible) 
MINESTORM_INVINCIBLE  =      0 
ENEMY_NO_SHOOTING   =        0 
UNDYING             =        1 
NO_ATTACK_PATTERN   =        0 
NO_WOBBLE           =        0 
ENEMY_UNDYING       =        0 
SCOOPY_TEST         =        1                            ; not working, when shop is displayed! 
BUGS_DONT_MOVE      =        0 
BLINKING_SCOOPY_FIRE  =      0                            ; only as test implemented for 4 shots, this draw left/right only each alternate frame 
SCOOPIE_DONT_DIE    =        0 
WARP_FAILURE_BORDER  =       220 
PLAYER_START_LIVES  =        3
START_POWER         =        0                            ;0 ;5 
INGAMESECRETS       =        0                            ;0xff ;SECRET_3_FIFTY ; ff also invokes biggest loss! 
SUPER_DIAMOND_BORDER  =      50 
LEVEL_SELECT        =        1                            ; enable select difficulty levek (by adding achievements 
DIAMOND_STORM       =        0                            ; if set, every mine storm is a diamond storm 
DONT_INCREASE_LEVELS  =      0                            ; if defined repeat the same level all over 
;
;...................
;. Test values End
;...................
;
 else  
;
;...................
;. REAL values Start
;...................
;
DEFAULT_DIFFICULTY  =        EASY 
SHORT_INVULNERABILITY  =     1 
WARP_FAILURE_BORDER  =       220 
IMMUNITY_START      =        0 
LOCK_START          =        0 
START_LEVEL         =        0 
START_SHOT_NUMBER   =        2                            ;2 
START_SHOT_WIDTH    =        1                            ;1-4 normal shots, 5 triangle shot, 6 lazer 
START_FIGHTER_SPEED  =       500 
START_SHOT_SPEED    =        500 
SPEED_DELTA         =        25                           ; both shot and player 
START_TIMER_MAX     =        500                          ; 10 seconds 
MEGAFIEND_HP        =        300 
MONEYSUCKER_HP      =        300 
DEAFULT_START_MONEY  =       0000 
PLAYER_START_LIVES  =        3 
START_POWER         =        0 
INGAMESECRETS       =        0 
SUPER_DIAMOND_BORDER  =      50 
;LEVEL_SELECT        =        1 ; enable select difficulty levek (by adding achievements
 endif  
;
;...................
;. REAL values End
;...................
;
; directions
UP                  =        1 
RIGHT               =        3 
DOWN                =        5 
LEFT                =        7 
NONE                =        0 
;
;***************************************************************************
;***************************************************************************
;***************************************************************************
;
; all banks start with this!
;
; this file is part of Vectorblade, written by Malban in 2018-2020
;
;***************************************************************************
; DEFINE SECTION
;***************************************************************************
; load vectrex bios routine definitions
                    BSS      
                    ORG      $c800 
                    INCLUDE  "inBothBanks1.i"             ; RAM and defines
;***************************************************************************
; HEADER SECTION
;***************************************************************************
; The cartridge ROM starts at address 0
                    CODE     
                    ORG      0 
; for dissi compatability I leave the header in for now!
;
; the first few bytes are mandatory, otherwise the BIOS will not load
; the ROM file, and will start MineStorm instead
                    DB       "g GCE 2020", $80 ; 'g' is copyright sign
                    DW       music1                       ; music from the rom 
                    DB       $F8, $50, $20, -$48          ; hight, width, rel y, rel x (from 0,0) 
                    DB       "VECTORBLADE", $80           ; some game information, ending with $80
version
                    DB       $Fb, $40, -$00, -$40          ; hight, width, rel y, rel x (from 0,0) 
                    DB       "VERSION 1.11",$80               ; some game information
; if  VECFEVER = 1
;                    DB       $F8, $50, -$00, -$50           ; hight, width, rel y, rel x (from 0,0)
;                    DB       "GOLD 5 (VF)", $80            ; some game information, ending with $80
; else
;                    DB       $F8, $50, -$00, -$30           ; hight, width, rel y, rel x (from 0,0)
;                    DB       "GOLD 5", $80                 ; some game information, ending with $80
; endif
zeroPointer 
                    DB       0                            ; end of game header 
;***************************************************************************
; CODE SECTION
;***************************************************************************
                    direct   $d0 
                    jmp      main 
                    direct   $ff 
 if  NMI_HANDLER = 1 
; 11 bytes
                    struct   NMI_struct 
                    ds       ORG_STACK, 2 
                    ds       ORG_BANK, 1 
                    ds       ORG_VIA_PB, 1 
                    ds       ORG_VIA_PA, 1 
                    ds       ORG_VIA_DB, 1 
                    ds       ORG_VIA_DA, 1 
                    ds       ORG_VIA_ACR, 1 
                    ds       ORG_VIA_CNTL, 1 
                    ds       ORG_VIA_IF, 1 
                    ds       ORG_VIA_IE, 1 
                    ds       ORG_VIA_T2, 2 
                    ds       ORG_VIA_T1, 2 
; ds sumRAM,2
                    end struct 
; org stack
                    struct   NMI_Stack_struct 
                    ds       ORG_CC, 1 
                    ds       ORG_D, 2 
                    ds       ORG_DP, 1 
                    ds       ORG_X, 2 
                    ds       ORG_Y, 2 
                    ds       ORG_U, 2 
                    ds       ORG_PC, 2 
                    end struct 
NMI_RAM             =        playershotobject_list 
NMI_STACK           =        enemyobject_list_end         ; need I think at least 12 bytes 
; so if I want to write a "returnable" NMI
; I need to extend the original stack by 12 bytes
; the new stack must be at least 12 bytes deep
; and I need "own" ram of 11+12 = 23 bytes - all in all about 50 bytes "RAM"
                    bss      
                    org      NMI_RAM 
nmi_struct          ds       NMI_struct 
nmi_ypos            ds       1 
nmi_xpos            ds       1 
nmi_print_buffer    ds       7 
nmi_adress_mon      ds       2 
nmi_tmp             ds       1 
                    code     
NMI_HANDLER_FUNCTION 
NMI_HANDLER_STACK_DUMMY 
 if  INCLUDE_NMI_TIMING = 1 
                    ldd      VIA_t2_lo 
                    exg      a,b 
                    std      nmi_struct + ORG_VIA_T2 
                    ldd      VIA_t1_cnt_lo 
                    exg      a,b 
                    std      nmi_struct + ORG_VIA_T1 
 endif  
                    cmps     #NMI_HANDLER_STACK_DUMMY-12  ; minus stored regs length 
                    beq      bouncy_bouncy 
                    sts      nmi_struct + ORG_STACK       ; game_stack_ptr ;game stack save upon first entry 
bouncy_bouncy 
                    lds      #NMI_HANDLER_STACK_DUMMY 
                    ldx      #60000 
bounce_delay 
                    leax     -1,x 
                    bne      bounce_delay 
                    ldy      #NMI_RAM 
                    lda      VIA_DDR_b                    ; if $40 set than bit 1 switch is 0 (this is bit 0 of switch) 
                    ldb      VIA_int_flags                ; if $80 set than bit 1 switch is 0 (this is bit 1 of switch) 
                    sta      ORG_VIA_DB,y 
                    stb      ORG_VIA_IF,y 
; bank in "plain" sight
                    clr      ORG_BANK, y 
                    bita     #$40 
                    bne      noBit0                       ; if != 0, bit is set, than jump (bit 0 = 0) 
                    inc      ORG_BANK, y                  ; bs switch bit 0 = 1 
noBit0 
                    bitb     #$80 
                    bne      noBit1                       ; if != 0, bit is set, than jump (bit 1 = 0) 
                    inc      ORG_BANK, y                  ; bs switch bit 1 = 1 
                    inc      ORG_BANK, y 
noBit1                                                    ;        bit as in "bankswitch bit" 00, 01, 10, 11 (banks) 
                    ldd      VIA_port_b 
                    std      ORG_VIA_PB,y 
                    lda      VIA_DDR_a 
                    sta      ORG_VIA_DA,y 
                    ldd      VIA_aux_cntl 
                    std      ORG_VIA_ACR,y 
                    lda      VIA_int_enable 
                    sta      ORG_VIA_IE,y 
                    lds      #NMI_STACK                   ; stack frame for nmi handler 
; RAM - "checksum"
; this should exclude the original stack
; and the local VIA copies
; flags are not the same
; CB1 not the same ...
; so the sum will not be the same
; ldx #$c80;
; ldd #0
;sumagain
; addd ,x++
; cmpx #$c800+1024
; bne sumagain
; std sumRAM,y
                    ldd      #$c860 
                    std      nmi_adress_mon 
                    ldd      #$fc30 
                    std      Vec_Text_HW 
                    CLR      Vec_Music_Flag               ; no music is playing ->0 (is placed in rottist! 
                    JSR      Init_Music_Buf               ; shadow regs 
                    JSR      Do_Sound                     ; ROM function that does the sound playing, here used to clear all regs 
                    jsr      Init_VIA 
nmi_msg 
                    JSR      Wait_Recal                   ; Vectrex BIOS recalibration 
                    JSR      Intensity_5F                 ; Sets the i 
                    JSR      Read_Btns 
                    ldu      #nmi_output_start 
                    ldy      #nmi_struct 
                    jsr      outPutFrame 
                    ldy      ORG_STACK,y 
                    jsr      outPutFrame 
                    lda      #16 
                    sta      nmi_tmp 
                    ldd      nmi_adress_mon 
                    ldu      #nmi_print_buffer 
                    jsr      dhex_to_uascii 
                    ldd      # ':'*256 + $80
                    std      ,u+ 
                    ldd      #$b080 
                    std      nmi_ypos 
                    ldu      #nmi_print_buffer 
                    jsr      Print_Str_d 
                    ldd      #$a080-16 
                    std      nmi_ypos 
                    ldy      nmi_adress_mon 
monLoop 
                    lda      ,y+ 
                    ldu      #nmi_print_buffer 
                    bsr      ahex_to_uascii 
                    ldd      # ' '*256 + $80
                    std      ,u 
                    ldd      nmi_ypos 
                    addd     #16 
                    std      nmi_ypos 
                    ldu      #nmi_print_buffer 
                    jsr      Print_Str_d 
                    dec      nmi_tmp 
                    bne      monLoop 
                    lda      Vec_Btn_State 
                    bita     #1 
                    beq      noPlus_1 
                    ldd      nmi_adress_mon 
                    addd     #16 
                    std      nmi_adress_mon 
noPlus_1 
                    lda      Vec_Btn_State 
                    bita     #2 
                    beq      noMinus_1 
                    ldd      nmi_adress_mon 
                    subd     #16 
                    std      nmi_adress_mon 
noMinus_1 
                    lda      Vec_Btn_State 
                    bita     #8                           ; button 4 saves to hopefully empty flash era 
                    beq      noSaveNMI 
                                                          ; ensure bank 0 
                    IRQ_TO_0_SHIFT  
                    PB6_TO_0  
REPLACE_1_2_saveGameToFlashNMI_varFromIRQ0_1 
                    ldx      #0                           ; saveGameToFlashNMI 
                    jsr      ,x 
noSaveNMI 
                    jmp      nmi_msg 

;
; .....................................................
;
outPutFrame 
outputContinue 
                    lda      ,u+ 
                    beq      nmi_msg1_done 
                    deca     
                    beq      nmi_do_1byte 
                    jsr      out_2 
                    bra      outputContinue 

nmi_do_1byte 
                    jsr      out_1 
                    bra      outputContinue 

nmi_msg1_done 
                    rts      

;
; .....................................................
;
ahex_to_uascii 
                    AHEX_TOUASCII  
                    rts      

;
; .....................................................
;
out_1 
                    ldd      ,u++ 
                    pshs     d 
                    jsr      Print_Str_d 
                    lda      ,u+ 
                    pshs     u 
                    ldu      #nmi_print_buffer 
                    lda      a,y 
                    bsr      ahex_to_uascii 
                    ldd      # ' '*256 + $80
                    sta      ,u+ 
                    bra      entryOut1 

;
; .....................................................
;
out_2 
                    ldd      ,u++ 
                    pshs     d 
                    jsr      Print_Str_d 
                    lda      ,u+ 
                    pshs     u 
                    ldu      #nmi_print_buffer 
                    ldd      a,y 
                    bsr      dhex_to_uascii 
                    ldd      # ' '*256 + $80
entryOut1 
                    std      ,u++ 
                    ldd      2,s 
                    addd     #$30 
                    ldu      #nmi_print_buffer 
                    jsr      Print_Str_d 
                    puls     u 
                    puls     d,pc 
;
; .....................................................
;
dhex_to_uascii 
                    DHEX_TOUASCII  
                    rts      

;
; .....................................................
;
; format:
; XX byte count or exit 1,2 or 0
; y,x pos
; String
; pointer to data that is output (offset to Y reg)
nmi_output_start 
                    db       2, $70, $a0, "S :", $80, ORG_STACK
                    db       1, $60, $a0, "BS:", $80, ORG_BANK
                    db       1, $40, $10, "PB:", $80, ORG_VIA_PB
                    db       1, $30, $10, "PA:", $80, ORG_VIA_PA
                    db       1, $20, $10, "DB:", $80, ORG_VIA_DB
                    db       1, $10, $10, "DA:", $80, ORG_VIA_DA
                    db       1, $00, $10, "AC:", $80, ORG_VIA_ACR
                    db       1, $f0, $10, "CN:", $80, ORG_VIA_CNTL
                    db       1, $e0, $10, "IF:", $80, ORG_VIA_IF
                    db       1, $d0, $10, "IE:", $80, ORG_VIA_IE
 if  INCLUDE_NMI_TIMING = 1 
                    db       2, $c0, $10, "T1:", $80, ORG_VIA_T1
                    db       2, $b0, $10, "T2:", $80, ORG_VIA_T2
 endif  
;                    db       2, $d0, $a0, "++:", $80, sumRAM
                    db       0 
nmi_output_start2 
                    db       1, $40, $a0, "CC:", $80, ORG_CC
                    db       2, $30, $a0, "D :", $80, ORG_D
                    db       1, $20, $a0, "DP:", $80, ORG_DP
                    db       2, $10, $a0, "X :", $80, ORG_X
                    db       2, $00, $a0, "Y :", $80, ORG_Y
                    db       2, $f0, $a0, "U :", $80, ORG_U
                    db       2, $e0, $a0, "PC:", $80, ORG_PC
                    db       0 
 endif  
                    direct   $d0 
;
; .....................................................
;
jmpBankIRQ0T1 
                    IRQ_TO_0_T1  
                    PB6_TO_0  
                    jmp      ,x 

jsrBank1_fromBank2_T1 
; PB6 1
                    IRQ_TO_0_T1  
                    PB6_TO_1  
                    jsr      ,x 
                    PB6_TO_0  
                    IRQ_TO_1  
                    lda      gameScale 
                    sta      <VIA_t1_cnt_lo 
                    rts      

jsrBank0_fromBank3_T1 
                    IRQ_TO_0_T1  
                    PB6_TO_0  
                    jsr      ,x 
                    PB6_TO_1  
                    IRQ_TO_1  
                    rts      

jsrBank0_fromBank3_Shift 
                    IRQ_TO_0_SHIFT  
                    PB6_TO_0  
                    jsr      ,x 
                    PB6_TO_1  
                    IRQ_TO_1  
                    rts      

jsrBank0_fromBank2_T1 
; PB6 stays
                    IRQ_TO_0_T1  
                    jsr      ,x 
                    IRQ_TO_1  
                    rts      

jsrBank0_fromBank2_Shift 
; PB6 stays
                    IRQ_TO_0_SHIFT  
                    jsr      ,x 
                    IRQ_TO_1  
                    rts      

; for now only changes IRQ and y reg
;...........
jmpBankIRQ0Shift 
                    PB6_TO_0  
                    bra      doShiftIRQ 

;...........
jmpBankIRQ1Shift 
                    PB6_TO_1  
doShiftIRQ 
                    IRQ_TO_0_SHIFT  
                    jmp      ,x 

;...........
jmpBankIRQ2X 
                    IRQ_TO_1  
                    PB6_TO_0  
                    jmp      ,x 

;...........
;_jmpBankIRQ3X
; ATTENTION!
; THIS DOES NOT WORK ON A REAL VECTREX
; DUNNO WHY?
; AUX setting is needed, when SHIFT was changed!
;                    IRQ_TO_1
;                    PB6_TO_1
;                    jmp      ,x
;...........
jmpBankIRQ3X 
                    PB6_TO_1  
                    ldd      #$98                         ; 0 = shift, 
                    sta      <VIA_shift_reg 
                    stb      <VIA_aux_cntl 
                    lda      #%01111111                   ; bit 7 = 0, each other "1" clears the IEflag, bit 6 = T1 
                    sta      <VIA_int_enable 
                    jmp      ,x 

;...........
jsrBank2_fromShift_0 
jsrBank3_fromShift_1 
                    IRQ_TO_1  
                    jsr      ,x 
                    IRQ_TO_0_SHIFT  
                    rts      

;...........
jsrBank1_fromBank3_T1 
; PB6 stays 1
                    IRQ_TO_0_T1  
                    jsr      ,x 
                    IRQ_TO_1  
                    rts      

;...........
jsrBank1_fromBank0_T1 
                    PB6_TO_1  
                    jsr      ,x 
                    PB6_TO_0  
                    rts      

;...........
jsrBank2_fromT1_1 
                    PB6_TO_0  
                    IRQ_TO_1  
                    jsr      ,x 
                    IRQ_TO_0_T1  
                    PB6_TO_1  
                    rts      

jsrBank2_from1_SHIFT 
                    PB6_TO_0  
                    IRQ_TO_1  
                    jsr      ,x 
                    IRQ_TO_0_SHIFT  
                    PB6_TO_1  
                    rts      

jsrBank3_from0_SHIFT 
                    PB6_TO_1  
                    IRQ_TO_1  
                    jsr      ,x 
                    IRQ_TO_0_SHIFT  
                    PB6_TO_0  
                    rts      

jmpBank2_from1 
                    PB6_TO_0  
                    IRQ_TO_1  
                    jmp      ,x 

jmpBank2_from0 
jmpBank3_from1 
                    IRQ_TO_1  
                    jmp      ,x 

;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; initialize jumps across bank
; one accros bank JSR (inclusive all) takes 46 cycles!
;
; these are bank switches only from bank 2 / 3
;
; IRQ is allways not enabled!
;
; bank 0 here means bank 2
; bank 1 here means bank 3
; (remnants from using only 2 banks)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
jsrBank0X 
; ensure bank 0
; ensure bit 6 = 0
;                    PB6_TO_0
                    lda      #$DF                         ; Prepare DDR Registers % 1101 1111 1111 1111 
                    sta      <VIA_DDR_b                   ; all ORB/ORA to output except ORB 5, PB6 goes LOW 
                    lda      #$01                         ; A = $01, B = 0 
                    sta      <VIA_port_b                  ; ORB = $1 (ramp on, mux off), ORA = 0 (DAC) 
                    jsr      ,x 
; ensure bank1
                    ldb      #$9F                         ; Prepare DDR Registers % 1001 1111 1111 1111 
                    stb      <VIA_DDR_b                   ; all ORB/ORA to output except ORB 5, PB6 goes LOW 
                    rts      

;...........
jmpBank0X 
; ensure bank 0
; ensure bit 6 = 0
                    PB6_TO_0  
                    jmp      ,x 

;...........
jsrBank1X 
; ensure bank1
                    lda      #$9F                         ; Prepare DDR Registers % 1001 1111 1111 1111 
                    sta      <VIA_DDR_b                   ; all ORB/ORA to output except ORB 5, PB6 goes LOW 
                    jsr      ,x 
; ensure bank 0
; ensure bit 6 = 0
                    PB6_TO_0  
                    rts      

;...........
jmpBank1X 
; ensure bank 0
; ensure bit 6 = 0
                    lda      #$9F                         ; Prepare DDR Registers % 1001 1111 1111 1111 
                    sta      <VIA_DDR_b                   ; all ORB/ORA to output except ORB 5, PB6 goes LOW 
                    jmp      ,x 

;...........
; changes y instead of d
jsrBank1X_d 
; ensure bank1
                    ldy      #$009f 
                    sty      <VIA_port_a 
                    jsr      ,x 
; ensure bank 0
; ensure bit 6 = 0
                    ldd      #$0100 
                    std      <VIA_port_b 
                    ldd      #$00df 
                    std      <VIA_port_a 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
jmpBackBonusChallenge 
; ensure bank1
                    lda      #$9F                         ; Prepare DDR Registers % 1001 1111 1111 1111 
                    sta      <VIA_DDR_b                   ; all ORB/ORA to output except ORB 5, PB6 goes LOW 
 if  CURRENT_BANK = 3 
                    jmp      bonus_doneChallenge 

 else  
                    jmp      0 

 endif  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
jmpBack1BonusIngame 
; ensure bank1
                    lda      #$9F                         ; Prepare DDR Registers % 1001 1111 1111 1111 
                    sta      <VIA_DDR_b                   ; all ORB/ORA to output except ORB 5, PB6 goes LOW 
 if  CURRENT_BANK = 3 
                    jmp      bonus_done 

 else  
                    jmp      0 

 endif  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
jmpBack3BonusDying 
                    lda      #$9F                         ; Prepare DDR Registers % 1001 1111 1111 1111 
                    sta      <VIA_DDR_b                   ; all ORB/ORA to output except ORB 5, PB6 goes LOW 
 if  CURRENT_BANK = 3 
                    jmp      bonus_done_dying 

 else  
                    jmp      0 

 endif  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
doMainBank0 
                    lda      #$01                         ; A = $01, B = 0 
                    sta      <VIA_port_b                  ; ORB = $1 (ramp on, mux off), ORA = 0 (DAC) 
                    lda      #$DF                         ; Prepare DDR Registers % 1101 1111 1111 1111 
                    sta      <VIA_DDR_b                   ; all ORB/ORA to output except ORB 5, PB6 goes LOW 
 if  CURRENT_BANK = 2 
                    jmp      gameLoopPart0 

 else  
                    jmp      0 

 endif  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
doMainBank0_m 
                    lda      #$01                         ; A = $01, B = 0 
                    sta      <VIA_port_b                  ; ORB = $1 (ramp on, mux off), ORA = 0 (DAC) 
                    lda      #$DF                         ; Prepare DDR Registers % 1101 1111 1111 1111 
                    sta      <VIA_DDR_b                   ; all ORB/ORA to output except ORB 5, PB6 goes LOW 
 if  CURRENT_BANK = 2 
                    jmp      gameLoopPart0_m 

 else  
                    jmp      0 

;
; .....................................................
;
 endif  
 if  CURRENT_BANK = 3 
DRAW_VLP_BANK       =        1 
 endif  
 if  CURRENT_BANK = 2 
DRAW_VLP_BANK       =        1 
 endif  
;
; .....................................................
;
 if  DRAW_VLP_BANK = 1 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; used in boss 3
; must be in bank 0 & 1, since here(0) the letters are
; defined, and the behaviour is located in (1)!
; switching between banks is done within this routine!
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 if  IS_VIA_FAULTY_RESISTENT = 1 
Draw_Vlp0_0 
                    lda      #$01                         ; A = $01, B = 0 
                    sta      <VIA_port_b                  ; ORB = $1 (ramp on, mux off), ORA = 0 (DAC) 
                    lda      #$DF                         ; Prepare DDR Registers % 1101 1111 1111 1111 
                    sta      <VIA_DDR_b                   ; all ORB/ORA to output except ORB 5, PB6 goes LOW 
                    MY_MOVE_TO_A_END  
Draw_VLp_letter: 
                    LDA      1,X                          ;Get next coordinate pair 
                    STA      <VIA_port_a                  ;Send Y to A/D 
                    clrb     
                    stb      <VIA_port_b                  ;Enable mux 
                    incb     
                    LDA      ,X++                         ;Get pattern byte? 
                    stb      <VIA_port_b                  ;Disable mux 
                    LDb      ,X+                          ;Get pattern byte? 
                    STB      <VIA_port_a                  ;Send X to A/D 
                    STA      <VIA_shift_reg               ;Store pattern in shift register 
                    CLR      <VIA_t1_cnt_hi               ;Clear T1H 
                    LDD      #$0040                       ;B-reg = T1 interrupt bit 
LF425_letter: 
                    BITB     <VIA_int_flags               ;Wait for T1 to time out 
                    BEQ      LF425_letter 
                    NOP                                   ;Wait a moment more 
                    STA      <VIA_shift_reg               ;Clear shift register (blank output) 
                    LDA      ,X                           ;Get next pattern byte 
                    BLE      Draw_VLp_letter              ;Go back if high bit of pattern is set 
; zero
                    ldb      gameScale 
                    lda      #$00 
                    stB      VIA_t1_cnt_lo 
                    sta      <VIA_shift_reg 
                    LDa      #$CC 
                    STA      VIA_cntl                     ;/BLANK low and /ZERO low 
                    ldd      #0 
                    std      <VIA_port_b 
; ensure bank1
                    lda      #$9F                         ; Prepare DDR Registers % 1001 1111 1111 1111 
                    sta      <VIA_DDR_b                   ; all ORB/ORA to output except ORB 5, PB6 goes LOW 
                    jmp      ,u 

;
; .....................................................
;
 else  
Draw_Vlp0_0 
                    lda      #$01                         ; A = $01, B = 0 
                    sta      <VIA_port_b                  ; ORB = $1 (ramp on, mux off), ORA = 0 (DAC) 
                    lda      #$DF                         ; Prepare DDR Registers % 1101 1111 1111 1111 
                    sta      <VIA_DDR_b                   ; all ORB/ORA to output except ORB 5, PB6 goes LOW 
                    MY_MOVE_TO_A_END  
Draw_VLp_letter: 
                    LDD      1,X                          ;Get next coordinate pair 
                    STA      <VIA_port_a                  ;Send Y to A/D 
                    CLR      <VIA_port_b                  ;Enable mux 
                    LDA      ,X                           ;Get pattern byte? 
                    LEAX     3,X                          ;Advance to next point in list 
                    INC      <VIA_port_b                  ;Disable mux 
                    STB      <VIA_port_a                  ;Send X to A/D 
                    STA      <VIA_shift_reg               ;Store pattern in shift register 
                    CLR      <VIA_t1_cnt_hi               ;Clear T1H 
                    LDD      #$0040                       ;B-reg = T1 interrupt bit 
LF425_letter: 
                    BITB     <VIA_int_flags               ;Wait for T1 to time out 
                    BEQ      LF425_letter 
                    NOP                                   ;Wait a moment more 
                    STA      <VIA_shift_reg               ;Clear shift register (blank output) 
                    LDA      ,X                           ;Get next pattern byte 
                    BLE      Draw_VLp_letter              ;Go back if high bit of pattern is set 
; zero
                    ldb      gameScale 
                    lda      #$00 
                    stB      VIA_t1_cnt_lo 
                    sta      <VIA_shift_reg 
                    LDa      #$CC 
                    STA      VIA_cntl                     ;/BLANK low and /ZERO low 
                    ldd      #0 
                    std      <VIA_port_b 
; ensure bank1
                    lda      #$9F                         ; Prepare DDR Registers % 1001 1111 1111 1111 
                    sta      <VIA_DDR_b                   ; all ORB/ORA to output except ORB 5, PB6 goes LOW 
                    jmp      ,u 

 endif  
 endif  
;***************************************************************************
main 
