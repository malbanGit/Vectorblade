; CBFC as TOP Stack is as yet unused RAM!
; still possible RAM savings!
; flashAvailable     only 1 bit needed!
; I don't really want to touch those:
; tacScan             ds       1 ; only two values +1/-1
; difficulty          ds       1 ; really only the lowest 4 bits
; SAVE2_ENEMY_ADDRESS = cbc0
; SAVE1_ENEMY_ADDRESS = cbd5
                    BSS      
                    org      $c80e 
diamondCount        ds       1                            ; 
isBugShot           ds       1                            ; speed of bugshot, and "flag" if bugshot 
nextBugEnemyCount   ds       1 
lastJoyMove         ds       0                            ; only used in shop 
enemyMINY           ds       1 
bonusHitCount       ds       1 
bonusSpawnCount     ds       1 
;
;GAMEPHASE_INTRO     =        0                            ; level attack wave phase 
;GAMEPHASE_INGAME    =        1                            ; in game phase (not attack waves) 
; game_phase          ds       1 
lastCollectedBonus  ds       1 
globalPatternWobble  ds      1                            ; offset of enemies in "waiting" position -16 - + 16 
globalPatternWobbleDirection  ds  1                       ; direction of wobble movemnt positive = add, negative = sub 
levelBulletBorder   ds       1 
levelBonusBorder    ds       1 
attackPatternCount  ds       1 
attackPatternInitiated  ds   1                            ; BIT FLAG only one attack pattern initiated per round 
;
; Vec Joys should not be moved
;lastJoyMove         ds       0 
Vec_Joy_1_X_        ds       1                            ; EQU $C81B ;Joystick 1 left/right; #noDoubleWarn 
Vec_Joy_1_Y_        ds       1                            ; EQU $C81C ;Joystick 1 up/down; #noDoubleWarn 
sfx_pointer_1       ds       2                            ; sfx player used 
sfx_pointer_2       ds       2                            ; sfx player used 
;
;
t2_rest             ds       1                            ; how much time is left in level 
tacScan             ds       1                            ; only two values +1/-1 
levelCount          ds       1 
random_seed2        ds       1 
; 0 bytes left! next is Vec_Loop_Count -> which I use
_Vec_Loop_Count     ds       2                            ; $c825 / $c826 Vec_Loop_Count 
introWaveEnemyCount  ds      1                            ; for the current intro pattern the # of spawned, enemies, ; VecBightness 
suckerAddress       ds       2                            ; Vec_Dot_Dwell, Vec_Pattern 
; after that some "String stuff" I use wihtin print sync String
;
;;;;;;;;;;;
                    org      _Vec_Str_Ptr                 ; Vec_Counters ; $c82e 17 byte 
levelTimer          ds       2                            ; 
tmp_div1 
bonusSpawnPosition  ds       2 
; following 5 definitions are the jmp (on stack) addresses back to the main game loop
; from the 5 different linked lists
; these can be set in RAM, since lists can be reused in different game sections
STARS_DONE_A        ds       2                            ; 
ENEMY_DONE_A        ds       2                            ; 
SHOTS_DONE_A        ds       2                            ; 
BONUS_DONE_A        ds       2                            ; 
PLAYERSHOTS_DONE_A  ds       2                            ; #handle_after 
STARS_DONE          =        STARS_DONE_A-2 
ENEMY_DONE          =        ENEMY_DONE_A-2 
SHOTS_DONE          =        SHOTS_DONE_A-2 
PLAYERSHOTS_DONE    =        PLAYERSHOTS_DONE_A-2 
BONUS_DONE          =        BONUS_DONE_A-2 
; reuse!
FW_PARTICLES_DONE   =        ENEMY_DONE 
FW_PARTICLES_DONE_A  =       ENEMY_DONE_A 
OBJECT_LIST_COMPARE_ADDRESS  ds  0                        ; compare value to above 5 addresses - these must be greater than above addreses, 
                                                          ; compare is used to decide whether list is empty or not 
warpSpeed           ds       0 
bonusAnimCount      ds       0 
lightningOn         ds       1                            ; BIT FLAG when an enemy is hit by bullet - but not destroyed - the enemy "flashes", this indicates a current flash (reset by next normal colored enemy) 
shotYRadius         ds       1                            ; is allways negated value -> easier/faster compare! 
levelEnemyCountUID  ds       1                            ; during level intro - each "permanent" enemy receives a UID, this is the counter for that 
_Vec_Rfrsh          ds       2                            ; $C83d / $C83e when using Wait Recal -> than this is Vec_Rfrsh -> not to be overwritten! 
; than follows the Vec_Music double buffer
; I use that also to optimize PSG writing
;;;;;;;;;;;
                    org      $c84d 
allowBossShots      ds       0                            ; 1 = allow, 0, = no allow 
introWaveEnemyDelayCount  ds  1                           ; delay countdown between appearance of enemies in current intro pattern 
                                                          ; IntroPattern->P_DELAY_BETWEEN_ENEMIES 
superDiamondAnimCounter  ds  0 
levelEnemyCount     ds       1                            ; UID counter for each enemy per level, used only during intro to position each spawned enemy 
superDiamondPosition  ds     0 
introWaveCurrentPattern  ds  2                            ; pointer to current active intro pattern 
superDiamondAnimCounter2  ds  0 
introWaveCurrentPatternCount  ds  1                       ; number of current pattern in level structure (from 0 terminated list) 
;
scoopEnemy1         ds       2                            ; right 
;
current_button_state  ds     1                            ; state of joystick button only bit 0 for current and bit 1 for last, ANY button 
last_button_state   ds       1                            ; for convenience - a copy of above for the last gameround 
;
playerAnim          ds       1 
playAnimDelayCounter  ds     1 
player_score        ds       0                            ; 7 digit score 
player_score_6      ds       1 
player_score_5      ds       1 
player_score_4      ds       1 
player_score_3      ds       1 
player_score_2      ds       1 
player_score_1      ds       1 
player_score_0      ds       1 
player_score_80     ds       1 
scoreExtraBuffer    ds       2 
playerCashW         ds       2 
; still only one Fighter direct bonus active at any one given time
; newer bonus trumps older bonus
BITFIELD_ARMOR      =        $80 
BITFIELD_SHIELD     =        $40 
BITFIELD_SCOOP      =        $20 
BITFIELD_NOT_SCOOP  =        $ff-$20 
;
playerBonusActive   ds       1                            ; bitfield for SHIELD, SUCKER ... 
;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Game vars
;;;;;;;;;;;;;;;;;;;;;;;;;
colorCycleCount     ds       1                            ; messenger 
animDelayCounter    ds       1 
patternDelayCounter  ds      1                            ; count down value to when the next intro pattern starts (value defined in pattern) 
scoopEnemy2         ds       2                            ; left 
bugsSpawnedInLevel  ds       1                            ; if zero, than no bugs, otherwise count of bugs yet to spawn 
;
random_seed         ds       1 
bonusCollect        ds       1                            ; the current "letter" bonus are remembered here per "bit" 
bulletSpawnAt       ds       2                            ; one enemy is allowed to shoot per round, the one and only allowed shots start coordinates (0 - no shot) 
sfx_pointer_3       ds       2                            ; sfx player used 
playerShotCountW    ds       2                            ; statistics 
playerHitCountW     ds       2 
playerXpos          ds       2                            ; 16 bit current x position of player - hi byte is used to position 
playerSpeed         ds       2                            ; 16 bit left/right speed of player 255 = 1 "pixel" 
playerMaxShotInAir  ds       1                            ; maximum number of shots player is currently allowed to have in the air 
playerNumberOfBulletsPerShot  ds  1                       ; current number of bullets per shot (1-4) 
playerShotSpeed     ds       2                            ; speed of shots fired by player (16 bit) 
playerWasHitFor     ds       1 
selected            ds       0 
tmp1                ds       1                            ; Vec_Music_Flag - used in pasue! ; used in objectEnemy for sign checks of coordinates 
                                                          ; used as size in level intro display!; used as scale and counter... 
;;;;;;;;
calibButton         ds       0 
shotSpeed           ds       1 
; 0 bytes left?
;;;;;;;;;;;
; this is $c880                    ORG      $c880                        ; start of our ram space 
warpLen             ds       0 
explosionSound      ds       1                            ; each round set to 0, when an enemy is hit during round this is "inc"ed. And a sound played in next round 
; all kinds of object list, partly reused
;
;
starlist_empty_head  ds      2                            ; if empty these contain a value that points to a RTS, smaller than OBJECT_LIST_COMPARE_ADDRESS 
starlist_objects_head  ds    2                            ; if greater OBJECT_LIST_COMPARE_ADDRESS, than this is a pointer to a RAM location of an Object 
starCount           ds       1 
; Four different "stack" linked lists for Objects 
; 1) all enemies (and explosions)
enemylist_empty_head  ds     2                            ; if empty these contain a value that points to a RTS, smaller than OBJECT_LIST_COMPARE_ADDRESS 
enemylist_objects_head  ds   2                            ; if greater OBJECT_LIST_COMPARE_ADDRESS, than this is a pointer to a RAM location of an Object 
enemyCount          ds       1 
;
; reuse
fwlist_empty_head   =        enemylist_empty_head 
fwlist_objects_head  =       enemylist_objects_head 
;
;
; 2) all Player shots
playershotlist_empty_head  ds  2                          ; if empty these contain a value that points to a RTS, smaller than OBJECT_LIST_COMPARE_ADDRESS 
playershotlist_objects_head  ds  2                        ; if greater OBJECT_LIST_COMPARE_ADDRESS, than this is a pointer to a RAM location of an Object 
playerShotCount     ds       1 
;
; 3) all Enemy shots
shotlist_empty_head  ds      2                            ; if empty these contain a value that points to a RTS, smaller than OBJECT_LIST_COMPARE_ADDRESS 
shotlist_objects_head  ds    2                            ; if greater OBJECT_LIST_COMPARE_ADDRESS, than this is a pointer to a RAM location of an Object 
shotCount           ds       1 
;
; 4) all Bonus "things"
bonuslist_empty_head  ds     2                            ; if empty these contain a value that points to a RTS, smaller than OBJECT_LIST_COMPARE_ADDRESS 
bonuslist_objects_head  ds   2                            ; if greater OBJECT_LIST_COMPARE_ADDRESS, than this is a pointer to a RAM location of an Object 
bonusCount          ds       1 
tmp16_tmp2          =        tmp_debug +2                 ; end of game count only 
;
;;;;;;;;;;;;;;;;;;;;;;;;;
; following two can be used in game
; before usage they must be reinit however!
joystickDir         ds       0                            ; only used in desktop/title ; also stores on easy the destroyed warp enemy count 
in_moveFlag         ds       1                            ; indicates this is the first batch of start to be displayed -> does in move macro stuff 
tmp2_tmp_unique     ds       1 
FLASH_AVAILABLE_BIT  =       %00000001 
SAVEGAME_AVAILABLE_BIT  =    %00000010 
SAVEGAME_IS_ACTIVE_BIT  =    %00000100 
flashAvailable      ds       1                            ; bit: 1 yes, 0 no 
; use this as bitfiled for sound (and other things)
BIT_FLAG_PLAY_YM    =        %10000000 
BIT_FLAG_PLAY_FORCE_SFX  =   %01000000                    ; -> three voices sfx (e.g. secret chime) 
BIT_FLAG_AUTOFIRE   =        %00000001 
BIT_FLAG_IS_BOSSFIGHT_ANY  =  %00001110 
BIT_BIG_ENEMY_IN_PLAY  =     %00010000 
BIT_FLAG_CASH_ROLLOVER  =    %00100000 
playSoundFlags      ds       0 
diverseFlags        ds       1 
;
;################################################################################
;################################################################################
;################################################################################
;********************************************************************
; save to eEprom Starts here!
; one "direct" copy of current OptionStruct from flash
SHOP_TRIPPLE_WEAPON  =       %00000001 
SHOP_QUAD_WEAPON    =        %00000010 
SHOP_SUPER_WEAPON   =        %00000100 
SHOP_LASER_WEAPON   =        %00001000 
SHOP_LOCK           =        %00010000 
SHOP_SUPER_BOMB_L   =        %00100000 
SHOP_RANK           =        %01000000 
SHOP_IMMUN1         =        %10000000 
;
Ram_Options_Start   ds       0 
calibrationValue6   ds       1                            ; swarm 
calibrationValue7   ds       1                            ; Calibration ZeroRef value (Kristof Tuts) stored here 
calibrationValue16  ds       1                            ; major havoc 
calibrationValueString  ds   1                            ; text -> STRING_SCALE 
calibrationValue50  ds       1                            ; boss 
gameScale           ds       1 
shopAllowFlags      ds       1                            ; can be calculated from achievements and in game secrets! 
; saved bits
BIT_INPUT_VARIANT  =         %00000100 ; 0 = default, ; 1 =  1,2 move, 3 bomb, 4 fire, joy = pause
BIT_RAN_CALIBRATION  =       %00000010 
BIT_BUZZ_NOBUZZ     =        %00000001 
; lowest 4 bits are saved
; highest 4 bits are erased with load
; variable bits (only used per game - not saved)
BIT_TITLE_SEEN      =        %10000000 
 if  TEST_VOX = 1 
BIT_VOX_FULL        =        %00100000                    ; if zero -> vox full 
 endif  
additionalFlags     ds       1                            ; %00000001 = 1 No Buzz, 0 = buzz 
achievements        ds       1+5                          ; 40 bitflags 
secretFlags         ds       1 
maxLevelReached     ds       1                            ; saved - but not shown (yet?) 
Ram_Options_End     ds       0 
;
; 
IMUNITY_1_BIT       =        0x01 
IMUNITY_2_BIT       =        0x02 
IMUNITY_1           =        0x01 
IMUNITY_2           =        0x02 
IMUNITY_BITS        =        IMUNITY_1_BIT + IMUNITY_2_BIT 
; is BITSAVE
; MMMM MMII
; II = 1 imunity to 1 shot, = 2 imunity to 1 and 2 shot
; M = Multiplyer bits, max 63
MULTIPLYER_BITS     =        %11111100                    ; Max 63 
NON_MULTIPLYER_BITS  =       IMUNITY_BITS 
;
MULTIPLY_0_AND      =        %00000000 + NON_MULTIPLYER_BITS 
MULTIPLY_1_AND      =        %00000100 + NON_MULTIPLYER_BITS 
MULTIPLY_2_AND      =        %00001000 + NON_MULTIPLYER_BITS 
MULTIPLY_5_AND      =        %00010100 + NON_MULTIPLYER_BITS 
MULTIPLY_1_OR       =        %00000100 
MULTIPLY_2_OR       =        %00001000 
MULTIPLY_5_OR       =        %00010100 
MULTIPLY_5_ALL_AND       =        %00011100 

;
multiplyer          ds       0                            ; current multiply factor (1 = default) 
downgradeImmunity   ds       1                            ; only 1 or 2 can also be calculated 
currentFlashROMStart  ds     2                            ; located in old HS block 
;
                    struct   OptionStruct 
                    ds       O_CALIB_SWARM, 1 
                    ds       O_CALIB_VECTOR, 1 
                    ds       O_CALIB_MH, 1 
                    ds       O_CALIB_TEXT, 1 
                    ds       O_CALIB_BOSS, 1 
                    ds       O_GAMESCALE, 1 
                    ds       O_SHOP_ALLOW, 1 
                    ds       O_ADDITIONAL_FLAGS, 1        ; 
                    ds       O_ACHIEVEMENTS, 6            ; 
                    ds       O_SECRETS, 1                 ; 
                    ds       O_MAX_LEVEL, 1               ; 
                    end struct 
;
                    struct   FlashBlock 
                    ds       OPTION_BLOCK, OptionStruct   ;OptionStruct 
                    ds       HIGHSCORE_BLOCK, HighScoreEntry*4 ; or more 
                    ds       HARDCORE_BLOCK, HighScoreEntry*4 ; or more 
                    end struct 
;
tmp16_tmp           ds       0                            ; bug behaviour internal ; end of game word 
tmp_debug           ds       6                            ; attation before dumping -> resued below 
bonusDisplay        ds       1                            ; the current "letter" bonus are remembered here per "bit" for DISPLAY 
; MUST not be reused!
playerLivesString   =        tmp_debug +2                 ; ds 4 
playerLives         =        playerLivesString+2 
MESSAGE_STATE_STAY  =        0                            ; 
MESSAGE_STATE_SCROLL_NORMAL_OUT  =  1                     ; 
MESSAGE_STATE_SCROLL_MESSAGE_IN  =  2                     ; 
MESSAGE_STATE_STAY_TIMED  =  3                            ; 
MESSAGE_STATE_SCROLL_MESSAGE_OUT  =  4                    ; 
MESSAGE_STATE_SCROLL_NORMAL_IN  =  5                      ; 
;;;
messageState        ds       1 
messageTimer        ds       1 
messagePointer      ds       2 
playerBonusCounter  ds       2                            ; countdown each 2 round, thus 255 about 10s 
;
;
                    struct   PlayerExplosion 
                    ds       EX_MAX_SIZE, 1 
                    ds       EX_START_SIZE, 1 
                    ds       EX_STEP, 1 
                    end struct 
                    struct   BossExplosion 
                    ds       EX_MAX_SIZE, 1 
                    ds       EX_START_SIZE, 1 
                    ds       EX_STEP, 1 
                    ds       EXPLOSION_POS, 2 
                    end struct 
playerExplosionSpace  ds     0 
StringOutputBuffer  ds       0 
StringOutputBuffer_6  ds     1 
StringOutputBuffer_5  ds     1 
levelConversionString  ds    0 
laserTag            ds       0                            ; needed between start of enemy objects and laser test 
StringOutputBuffer_4  ds     1 
laserTmp            ds       0 
_tmpY               ds       0 
tmp1_tmp            ds       0                            ; really only temporary not accross round 
StringOutputBuffer_3  ds     1 
_tmpX               ds       0 
tmp2_tmp            ds       0                            ; really only temporary not accross round, used by boss2 to indicate boss hit in shot tests 
StringOutputBuffer_2  ds     1 
tmp3_tmp            ds       0                            ; really only temporary not accross round ; 3 is "INNER" of 1 and 2 
vox_tmp1            ds       0 
StringOutputBuffer_1  ds     1 
tmp_count           ds       0 
tmp_isSupershot     ds       0 
tmp4_tmp            ds       0                            ; really only temporary not accross round 
vox_tmp2            ds       0 
StringOutputBuffer_0  ds     1 
laserTmp2           ds       0 
vox_tmp3            ds       0 
StringOutputBuffer_80  ds    1 
;
;
; per game round only two of the player shots are tested
; agains the enemies
; the current to be tested shot is pointer stored in "testShot"
;
                    struct   TestShot 
                    ds       SHOT_ORG, 2 
                    ds       T_YPOS, 1 
                    ds       T_XPOS0_MINUS_1_RADIUS, 1 
                    ds       T_XPOS0_PLUS_1_RADIUS, 1 
                    ds       T_XPOS0_MINUS_3_RADIUS, 1 
                    ds       T_XPOS0_PLUS_3_RADIUS, 1 
                    end struct 
;
testShot            ds       TestShot 
test2Shot           ds       TestShot 
Vec_Str_Ptr         ds       0                            ; ATTENTION!!! 
tmp4                ds       0                            ; bossfight stores DS (bank 0), while player shots are displayed 
stringScale         ds       0                            ; used while printing string with vectors 
backJump            ds       2 
inversePatttern     ds       1                            ; only used during intro patterns 
patternEnemyCount   ds       1 
tmp8_tmp=           patternEnemyCount                     ; tmp 8 is only used in failure behaviour - no collision with pattern 
; 9 bytes of RAM for the damned restricted laser
currentPrintedOption  =      laserLowestYLeft 
selectedOption      =        laserLowestY 
currentLetterPos    =        laserEnemyPointer 
currentLetterDirection  =    laserEnemyPointer+1 
optionDir           =        laserEnemyPointerLeft 
laserEnemyPointer   ds       2 
laserLowestY        ds       1 
laserLowestYLeft    ds       1 
laserEnemyPointerLeft  ds    2 
laserLowestYRight   ds       1 
laserEnemyPointerRight  ds   2 
;
difficulty          ds       1                            ; really only the lowest 4 bits , highest bit hardcore = 1, not hardcore = 0 
levelMaxAttackPatterns  ds   1 
levelMaxEnemyShots  ds       1 
bulletDamage        ds       1                            ; damage one bullet does, if negative than only damage in even rounds (laser) (not supported any longer!) 
shiftBulletDamage   ds       1                            ; same as above, shifted to upper 5 bits for fast usage 
shiftDoubleBulletDamage  ds  1                            ; same as above, doubled and shifted 
;
bonusTimerLength    ds       2                            ; time a bonus lasts 
currentLevelPointer  ds      2                            ; pointer to current level structure 
multTimer           ds       2                            ; timer for score multiplyer 
;enemyDestructed     ds       1                            ; 
; lock handling is BITSAVE
; not GAMEPHASE_INTRO     ; in game phase (not attack waves) 
GAMEPHASE_INTRO     =        0x80                         ; level attack wave phase 
ENEMY_DESTRUCTED_FLAG  =     $40 
lockPurchased       ds       1                            ; lower nibble is lock count, upper nibble is IDSW - 
                                                          ; I - if set than INTRO phase of game! 
                                                          ; D - enemyDestructed -a flag, indicates, that there are NO live enemies (boss/warp) 
                                                          ; W = 1 keep scoopies in warp, 
                                                          ; W = 0 lose scoopies in Warp, 
                                                          ; S = 0 scoopies can be killed, 
                                                          ; S = 1 scoopies are shielded, 
smartBombsAvailable  ds      1 
saucerCount         ds       1 
bossIntroStage      =        saucerCount 
levelMaxEnemy       ds       1 
rankDrop            ds       1                            ; xpos 
rankCollected       ds       1 
officerRankTmp      ds       1 
doWarpFailure       ds       1                            ; 0-3 ; negative hs stars 
bulletDamageAdjust  ds       1 
SECRET_3_SPEED_SUCKERS  =    %00000001 
SECRET_RATE_SUCKERS  =       %00000010 
SECRET_3_BULLET_SUCKERS  =   %00000100 
SECRET_3_RATE_SUCKERS  =     %00001000 
SECRET_ORDERED_EXTRA  =      %00010000 
SECRET_3_FIFTY      =        %00100000 
SECRET_ORDERED_RANKS  =      %01000000 
BIGGEST_LOSS_FLAG   =        %10000000 
; hidden Secret 3 Scoops!
inGameSecrets       ds       1 
perfectBonus        ds       1                            ; doublings 
secretBonusCounter  ds       1                            ; ERD0rrbb 
; rr rate counter "overall", 
; bb counter of consecutive same bonus
; E=1 extra still in order, 
; R=1 rank still in order 
; D=1 drunken master
levelsPlayed        ds       2 
drunkTimer          ds       1 
 if  TEST_VOX = 1 
vox_addr            ds       2 
filler              ds       0                            ; 1 for continues save ; #noDoubleWarn 
 else  
filler              ds       0                            ; 3 ; #noDoubleWarn 
 endif  
 if  RECORD_GAME_DATA = 1 
saveState           ds       1                            ; if 1 = than playback, if 0 than save 
buttonTmp           ds       1                            ; transport byte 
pauseSave           ds       1 
actionPointer       ds       2                            ; if saving, than pointer to next address, where to save joy information, if loading - than next "read" 
 endif  
;
end_static_ram      ds       0 
;
 if  NMI_HANDLER = 1 
chosenStartLevel    =        zeroPointer                  ; not possible to chose a start level other than 0 with NMI active 
 else  
chosenStartLevel    =        $cbfd 
 endif  
isDemoMode          =        $cbfe 
realEnemyCount      =        $cbff 
