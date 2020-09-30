; all banks
; this file is part of Vectorblade, written by Malban in 2018-2020
;
START_BANK          EQU      0 
EXPLOSION_MAX_SCALE  =       25 
MAX_BULLET_POWER_ADJUST  =   6 
;
 if  USE_NEW_SHOTS = 1                                    ; if = 0, than old "INIT_SHOT_TEST" must be used! 
SHOT_RADIUS0        =        0 
SHOT_RADIUS1        =        9                            ; all Radius must be different 
SHOT_RADIUS2        =        8                            ; the radius is also used to determine the current shot type! 
SHOT_RADIUS3        =        7 
SHOT_RADIUS4        =        6                            ; maximum, otherwise col detect fucks up! 
SHOT_RADIUS5        =        11                           ; all Radius must be different 
SHOT_RADIUS6        =        10                           ; all Radius must be different 
 else  
SHOT_RADIUS0        =        0 
SHOT_RADIUS1        =        9                            ; all Radius must be different 
SHOT_RADIUS2        =        14                           ; the radius is also used to determine the current shot type! 
SHOT_RADIUS3        =        18 
SHOT_RADIUS4        =        24                           ; maximum, otherwise col detect fucks up! 
SHOT_RADIUS5        =        10                           ; all Radius must be different 
SHOT_RADIUS6        =        8                            ; all Radius must be different 
 endif  
COLLECTED_RANK1     =        1 
COLLECTED_RANK2     =        2 
COLLECTED_RANK3     =        4 
COLLECTED_RANK4     =        8 
COLLECTED_RANK5     =        16 
COLLECTED_RANK6     =        32 
COLLECTED_RANK_NEGATIVE  =   64                           ; not implemented 
;
SAUCER_START_DELAY  =        10                           ; seconds 
; 
SUCKER_YPOS         =        $d0 
MONEY_SUCK_WAIT     =        10                           ; rounds = 1/5 second 
; 
MAX_PLAYER_EXPLOSION_SIZE  =  35 
; 
MESSAGE_STATE_STAY  =        0                            ; for the message "system" 
MESSAGE_STATE_SCROLL_NORMAL_OUT  =  1                     ; 
MESSAGE_STATE_SCROLL_MESSAGE_IN  =  2                     ; 
MESSAGE_STATE_STAY_TIMED  =  3                            ; 
MESSAGE_STATE_SCROLL_MESSAGE_OUT  =  4                    ; 
MESSAGE_STATE_SCROLL_NORMAL_IN  =  5                      ; 
;
; 
PLAYER_YPOS         =        $80 
MAX_PLAYER_SPEED    =        1000 
MIN_PLAYER_SPEED    =        200 
MAX_SHOT_SPEED      =        1000 
MIN_SHOT_SPEED      =        200 
;
DELAY_TO_REAPEAR    =        50                           ; 1 s - how long the enemies "disappear" after their initial attack phase 
OBJECT_SCALE        =        7                            ;9 
STRING_SCALE        =        25 
ANIMATION_DELAY     =        3                            ; for ALL animation in game 
DEFAULT_ENEMY_INTENSITY  =   $3f 
ATTACK_PATTERN_PROBABILITY  =  2 
HIT_FLASH_LENGTH    =        5                            ; should be smaller than smallest P_START_DELAY_OF_PATTERN 
VB_SPRITE_SCALE50   =        50 
BOSS_SPRITE_SCALE   =        VB_SPRITE_SCALE50 
;
LEVEL_TYPE_NORMAL   =        1 
LEVEL_TYPE_KAMIKAZE  =       2 
LEVEL_TYPE_BIGGY    =        3 
LEVEL_TYPE_BONUS    =        4                            ; akill all to get special bonus, enemies don't shoot 
LEVEL_TYPE_BOSS1    =        5 
LEVEL_TYPE_BOSS2    =        6 
LEVEL_TYPE_BOSS3    =        7 
LEVEL_TYPE_BOSS4    =        8 
LEVEL_TYPE_FAILURE  =        9 
LEVEL_TYPE_SHOP_AFTER  =     %10000000 
LEVEL_TYPE_WARP_AFTER  =     %01000000 
LEVEL_TYPE_DONT_SHOOT_WHILE_WAITING  =  %00100000 
LEVEL_APPEAR_AT_WAITING  =   %00010000 
CLONE_MAX_ENEMY_DISPLAYED  =  12                          ; only allow cloning when maximum 12 enemies are visible! 
;;;;;
; enemy behaviour defines
TYPE_NONE           =        0 
TYPE_DIRECT_WAIT    =        %00000001                    ; they don't delay after attack pattern in "off" but move directly to their waiting position 
TYPE_DONT_SHOOT     =        %00000010                    ; they never shhot 
TYPE_DONT_ATTACK    =        %00000100                    ; they never enter an attack pattern 
TYPE_DONT_WAIT      =        %00001000                    ; kamikaze type attackers which do never wait 
_UNUSED_TYPE_SINGLE_ANIMATION  =  %00010000               ; this enemy has no "angle" it always animates the "same" (not implemented 
TYPE_CAN_CLONE      =        %00100000                    ; while starting an attack pattern, enemy can clone itself 
TYPE_DEBRIS_BOMBER  =        %01000000                    ; does not explode while dying, but drops a "debris" bomb :-) 
TYPE_SHIELD         =        %10000000                    ; can not be destroyed, doesn't count as "level finsih enemy", they don't wobble while waiting 
;
; Single attack pattern
; TYPE of pattern, pattern address/data
SINGLE_ATTACK_RELATIVE_PATTERN  =  0                      ; relative means - it uses the current position of the enemy as start 
SINGLE_ATTACK_TARGET_ENEMY_PATTERN  =  1                  ; TARGET - uses somehow the players coordinate as coordinate info 
SINGLE_ATTACK_ABSOLUT_PATTERN  =  2                       ; moves from current position to an absolut screen position 
SINGLE_ATTACK_JUMP  =        3                            ; init another pattern , position int speed, subposition set to 0 
;
BOSS2_HITPOINTS     =        100                          ; Insect Queen 
BOSS1_HITPOINTS     =        200                          ; Mecha 
BOSS3_HITPOINTS     =        380                          ; Sinistar 
BOSS4_HITPOINTS     =        200                          ; Death star 
;
SWARM_MIN_X         =        -$20                         ; rectangle where the swarm will move in (or is headed to) 
SWARM_MAX_X         =        $20 
SWARM_MIN_Y         =        -$40 
SWARM_MAX_Y         =        -$10 
SWARM_HP            =        1                            ; hit points of a single swarm member 
;
TRIBBLE_MIN_X       =        -$40                         ; rectangle where the tribbles will move in (or is headed to) 
TRIBBLE_MAX_X       =        $40 
TRIBBLE_MIN_Y       =        -$40 
TRIBBLE_MAX_Y       =        $40 
;
;
A_SNIPER_RANK3      =        000*2 
A_SNIPER_RANK2      =        001*2 
A_SNIPER_RANK1      =        002*2 
A_SCORE_RANK5       =        003*2 
A_SCORE_RANK4       =        004*2 
A_SCORE_RANK3       =        005*2 
A_SCORE_RANK2       =        006*2 
A_SCORE_RANK1       =        007*2 
;
A_MONEY_RANK5       =        008*2 
A_MONEY_RANK4       =        009*2 
A_MONEY_RANK3       =        010*2 
A_MONEY_RANK2       =        011*2 
A_MONEY_RANK1       =        012*2 
A_GREEDY            =        013*2 
A_9LIVES            =        014*2 
A_ALL               =        015*2 
;
A_BLADEMASTER_RANK_5  =      16*2 
A_BLADEMASTER_RANK_4  =      17*2 
A_BLADEMASTER_RANK_3  =      18*2 
A_BLADEMASTER_RANK_2  =      19*2 
A_BLADEMASTER_RANK_1  =      20*2 
A_TRIPPLE           =        21*2 
A_QUADRO            =        22*2 
A_LASER             =        23*2 
;
A_OFFICER_RANK4     =        24*2 
A_OFFICER_RANK3     =        25*2 
A_OFFICER_RANK2     =        26*2 
A_OFFICER_RANK1     =        27*2 
A_SPY_RANK4         =        28*2 
A_SPY_RANK3         =        29*2 
A_SPY_RANK2         =        30*2 
A_SPY_RANK1         =        31*2 
;
A_BONUS_RANK4       =        32*2 
A_BONUS_RANK3       =        33*2 
A_BONUS_RANK2       =        34*2 
A_BONUS_RANK1       =        35*2 
A_LOSS              =        36*2 
;
A_FALCON            =        37*2 
A_DRUNKEN           =        38*2 
;
ACHIEVEMENT_FLAG_BYTE1_SNIPER_RANK3  =  %00000001         ; checked at the end of each game 
ACHIEVEMENT_FLAG_BYTE1_SNIPER_RANK2  =  %00000010 
ACHIEVEMENT_FLAG_BYTE1_SNIPER_RANK1  =  %00000100 
ACHIEVEMENT_FLAG_BYTE1_SCORER_RANK5  =  %00001000         ; checked at the end of each game 
ACHIEVEMENT_FLAG_BYTE1_SCORER_RANK4  =  %00010000 
ACHIEVEMENT_FLAG_BYTE1_SCORER_RANK3  =  %00100000 
ACHIEVEMENT_FLAG_BYTE1_SCORER_RANK2  =  %01000000 
ACHIEVEMENT_FLAG_BYTE1_SCORER_RANK1  =  %10000000 
;
ACHIEVEMENT_FLAG_BYTE2_COLLECTOR_RANK5  =  %00000001      ; checked at the start of each shop 
ACHIEVEMENT_FLAG_BYTE2_COLLECTOR_RANK4  =  %00000010 
ACHIEVEMENT_FLAG_BYTE2_COLLECTOR_RANK3  =  %00000100 
ACHIEVEMENT_FLAG_BYTE2_COLLECTOR_RANK2  =  %00001000 
ACHIEVEMENT_FLAG_BYTE2_COLLECTOR_RANK1  =  %00010000 
ACHIEVEMENT_FLAG_BYTE2_GREEDY  =  %00100000               ; check when collected / bought 
ACHIEVEMENT_FLAG_BYTE2_9LIVES  =  %01000000               ; checked when a live is bought 
ACHIEVEMENT_FLAG_BYTE2_ALL  =  %10000000                  ; checked at the end of each game 
;
ACHIEVEMENT_FLAG_BYTE3_BLADEMASTER_RANK5  =  %00000001    ; checked each roll over 
ACHIEVEMENT_FLAG_BYTE3_BLADEMASTER_RANK4  =  %00000010 
ACHIEVEMENT_FLAG_BYTE3_BLADEMASTER_RANK3  =  %00000100 
ACHIEVEMENT_FLAG_BYTE3_BLADEMASTER_RANK2  =  %00001000 
ACHIEVEMENT_FLAG_BYTE3_BLADEMASTER_RANK1  =  %00010000 
ACHIEVEMENT_FLAG_BYTE3_TRIPPLE  =  %00100000              ; checked on EXTRA / level finish 
ACHIEVEMENT_FLAG_BYTE3_QUADRO  =  %01000000 
ACHIEVEMENT_FLAG_BYTE3_LASER  =  %10000000 
;
ACHIEVEMENT_FLAG_BYTE4_OFFICER_RANK4  =  %00000001        ; checked on officer level up! (after shop) 
ACHIEVEMENT_FLAG_BYTE4_OFFICER_RANK3  =  %00000010 
ACHIEVEMENT_FLAG_BYTE4_OFFICER_RANK2  =  %00000100 
ACHIEVEMENT_FLAG_BYTE4_OFFICER_RANK1  =  %00001000 
ACHIEVEMENT_FLAG_BYTE4_SPY_RANK4  =  %00010000            ; check when secret is discovered / end of game 
ACHIEVEMENT_FLAG_BYTE4_SPY_RANK3  =  %00100000 
ACHIEVEMENT_FLAG_BYTE4_SPY_RANK2  =  %01000000 
ACHIEVEMENT_FLAG_BYTE4_SPY_RANK1  =  %10000000 
;
ACHIEVEMENT_FLAG_BYTE5_NOT_DONE1  =  %00000001            ; bit "number" 0-7 
ACHIEVEMENT_FLAG_BYTE5_NOT_DONE2  =  %00000010            ; up that "secret message" was read already! 
ACHIEVEMENT_FLAG_BYTE5_NOT_DONE3  =  %00000100 
ACHIEVEMENT_FLAG_BYTE5_CHALLENGER_RANK4  =  %00001000     ; check after challenge 
ACHIEVEMENT_FLAG_BYTE5_CHALLENGER_RANK3  =  %00010000 
ACHIEVEMENT_FLAG_BYTE5_CHALLENGER_RANK2  =  %00100000 
ACHIEVEMENT_FLAG_BYTE5_CHALLENGER_RANK1  =  %01000000 
ACHIEVEMENT_FLAG_BYTE5_BIGGEST_LOSS  =  %10000000         ; check on shot on collect 
;
ACHIEVEMENT_FLAG_BYTE6_MINESTORM_FALCON  =  %00000001     ; checked at the end of each minestorm 
ACHIEVEMENT_FLAG_BYTE6_MINESTORM_DRUNKEN  =  %00000010 
;
SCOOP_RIGHT_PLAYER_XOFFSET  =  23 
SCOOP_LEFT_PLAYER_XOFFSET  =  -23 
SCOOP_PLAYER_YPOS   =        $82 
;
;
;
; can not drop randomly - only frommoney mothership!
BONUS_MONEY_200     =        -2 
; random drops
BONUS_E             =        0*2 
BONUS_X             =        1*2 
BONUS_T             =        2*2 
BONUS_R             =        3*2 
BONUS_A             =        4*2 
BONUS_SHOTPLUS      =        5*2 
BONUS_FASTER        =        6*2 
BONUS_FASTER_SHOT   =        7*2 
BONUS_SLOWER        =        8*2 
BONUS_SHOTMINUS     =        9*2 
BONUS_MONEY_5       =        10*2 
BONUS_MONEY_20      =        11*2 
BONUS_MONEY_50      =        12*2 
BONUS_ARMOR         =        13*2 
BONUS_SHIELD        =        14*2 
BONUS_SCOOP         =        15*2 
BONUS_SHOT1         =        16*2 
BONUS_SHOT2         =        17*2 
BONUS_SHOT3         =        18*2 
BONUS_SHOT4         =        19*2 
BONUS_MINESTORM     =        20*2 
BONUS_MULT2         =        21*2 
BONUS_MULT5         =        22*2 
BONUS_BOMB_CASH     =        23*2 
BONUS_BOMB_DIAMOND  =        24*2 
BONUS_TIMER         =        25*2 
BONUS_SLOWER_SHOT   =        26*2 
BONUS_CASH_DOUBLER  =        27*2 
BONUS_SHOT_POWERUP  =        28*2 
BONUS_EXTRA_LIFE    =        29*2 
BONUS_DRUNKEN       =        30*2 
BONUS_AUTOFIRE      =        31*2 
;
;
; load vectrex bios routine definitions
                    INCLUDE  "VECTREXVB.I"                ; vectrex function includes
                    INCLUDE  "macro.i"                    ; vectrex macro includes
;
; *******************************************************************
; ********************** STRUCTRUES *********************************
; *******************************************************************
; 10 bytes
                    struct   SwarmEnemy 
                    ds       Y_POS,1                      ; D current position ; BUG TARGET POS 
                    ds       X_POS,1                      ; D ; BUG TARGET POS 
                    ds       BEHAVIOUR,2                  ; PC 
                    ds       NEXT_ENEMY_OBJECT,2          ; positive = end of list 
                    ds       SWARM_ALL_PURPOSE,1          ; flash length when hit (might be bits) 3 bits max 
;SWARM_ALL_PURPOSE
; high bits have movemnt info
; vvhh xfff 
; f = flash counter
; vertical 
; v0 0 = no vertical movement
; 11 = up
; 01 = down
; 00 = not used
; horizontal 
; h0 0 = no horzontal movement
; 11 = left
; 01 = right
; 00 = not used
                    ds       SWARM_MOVEMENT_INFO,1 
                    ds       SWARM_ANIM_POS,1             ; 
                    ds       SWARM_HIT_POINTS,1           ; 
; SWARM_MOVEMENT_INFO = -1 go to startpos
; sxxx cccc = counter till movement changes
; s = 1 -> start -> move to startposition 
; x = not used
                    end struct 
; 10 bytes
                    struct   ExplodingEnemySwarm 
                    ds       Y_POS,1                      ; D current position ; BUG TARGET POS 
                    ds       X_POS,1                      ; D ; BUG TARGET POS 
                    ds       BEHAVIOUR,2                  ; PC 
                    ds       NEXT_ENEMY_OBJECT,2          ; positive = end of list 
                    ds       filler,1                     ;SWARM_ALL_PURPOSE,1 ; #noDoubleWarn 
                    ds       filler,1                     ; #noDoubleWarn 
                    ds       SWARM_EXPLOSION_INTENSITY, 1 ; #noDoubleWarn 
                    ds       SWARM_EXPLOSION_SCALE, 1     ; #noDoubleWarn 
                    end struct 
;
; ****************************************************************************************************
;
; 11 bytes - "like" swarm
                    struct   TribbleEnemyStruct 
                    ds       Y_POS,1                      ; D current position ; BUG TARGET POS 
                    ds       X_POS,1                      ; D ; BUG TARGET POS 
                    ds       BEHAVIOUR,2                  ; PC 
                    ds       NEXT_ENEMY_OBJECT,2          ; positive = end of list 
                    ds       TRIBBLE_ALL_PURPOSE,1        ; flash length when hit (might be bits) 3 bits max 
                    ds       TRIBBLE_MOVEMENT_INFO,1 
                    ds       TRIBBLE_ANIM_POS,1           ; 
                    ds       TRIBBLE_HIT_POINTS,1         ; 
                    ds       TRIBBLE_LIFE_TIME,1          ; 
                    end struct 
;
; ****************************************************************************************************
;
; 21 byte
                    struct   EnemyStruct 
                    ds       RELATIVE_HI_Y, 0 
RELATIVE_HI_X       =        RELATIVE_HI_Y +1 
                    ds       Y_POS,1                      ; D current position ; BUG TARGET POS 
                    ds       X_POS,1                      ; D ; BUG TARGET POS 
                    ds       BEHAVIOUR,2                  ; PC 
                    ds       NEXT_ENEMY_OBJECT,2          ; positive = end of list 
                    ds       RELATIVE_LO_Y, 0 
RELATIVE_LO_X       =        RELATIVE_LO_Y +1 
                    ds       Y_POS16,2                    ; D current position for calculation only , Y is pos, y low is addy 
                    ds       TARGET_RELATIVE_Y, 0 
TARGET_RELATIVE_X   =        TARGET_RELATIVE_Y+1 
                    ds       X_POS16,2                    ; D current position for calculation only 
                    ds       TARGET_ABSOLUT_Y,0           ; if attack pattern is absolut - than here go the target coordinates 
                    ds       SUB_PATTERN,1                ; is 2 bytes, but shares second byte with ANIM count 
                    ds       TARGET_ABSOLUT_X,1 
                    ds       BUG_SHOT_DELAY, 0 
                    ds       INVERSE_INTRO_PATTERN, 0 
                    ds       ANGLE_HOMEFLIGHT,1           ; in absolut movement the lower 3 bits are speed and angle is 0-7 instead 0-14 
                    ds       BUG_ADDS_YX, 0 
                    ds       MY_PATTERN, 2                ; 
                    ds       ANIM_POSITION,0              ; current position in animation table of vectorlists 
                    ds       SUB_PATTERN_POSITION, 0      ; lower nibble when attack pattern 
                    ds       PATTERN_POSITION, 1          ; where in the current pattern are we? 
                                                          ; uper nibble, when attack pattern 
                                                          ; which pattern "trail" to follow 
                    ds       BUG_APPEARING_INTENSITY ,0 
                    ds       BUG_MOVEMENT_DOUBLER, 0 
                    ds       POSITION, 1                  ; UID of curretn enemies -> defines position in waiting state 
                    ds       ALL_PURPOSE, 1               ; delay, negative -> explosion, positive countdown for enemy Hit Brightness (<= HIT_FLASH_LENGTH only) 
                                                          ; speed of falling debris 
                    ds       HITPOINTS, 0                 ; hit points = upper 5 bits 
                    ds       BUG_ENEMY_HITPOINTS, 0       ; all 8 bits 
                    ds       BIT_MASK, 1                  ; shot delay = lower 3 bits 
                    ds       ENEMY_STRUCT, 2              ; this can be reduced to one byte! 
                    end struct 
;
                    struct   ExplodingEnemyStruct 
                    ds       Y_POS,1                      ; D current position ; BUG TARGET POS 
                    ds       X_POS,1                      ; D ; BUG TARGET POS 
                    ds       BEHAVIOUR,2                  ; PC 
                    ds       NEXT_ENEMY_OBJECT,2          ; positive = end of list 
                    ds       SMARTLIST_ORG,2 
                    ds       filler, 2                    ; #noDoubleWarn 
                    ds       filler, 1                    ; #noDoubleWarn 
                    ds       filler, 1                    ; #noDoubleWarn 
                    ds       filler, 1                    ; #noDoubleWarn 
                    ds       filler, 2                    ; #noDoubleWarn 
                    ds       filler, 1                    ; #noDoubleWarn 
                    ds       EXPLOSION_INTENSITY, 1       ; #noDoubleWarn 
                    ds       ALL_PURPOSE, 1               ; delay, negative -> explosion, positive countdown for enemy Hit Brightness (<= HIT_FLASH_LENGTH only) 
                    ds       EXPLOSION_SCALE, 1           ; #noDoubleWarn 
                    ds       ENEMY_STRUCT, 2              ; this can be reduced to one byte! 
                    end struct 
;
                    struct   EnemyStructRepell 
                    ds       Y_POS,1                      ; D current position ; BUG TARGET POS 
                    ds       X_POS,1                      ; D ; BUG TARGET POS 
                    ds       BEHAVIOUR,2                  ; PC 
                    ds       NEXT_ENEMY_OBJECT,2          ; positive = end of list 
                    ds       Y_POS16,2                    ; D current position for calculation only , Y is pos, y low is addy 
                    ds       X_POS16,2                    ; D current position for calculation only 
                    ds       XPOS_LOCKED,1                ; # 
                    ds       WAS_ANIM_COUNT, 1            ; count down to next animation sequence 
                    ds       ANGLE_REPELL,1               ; 
                    ds       Y_ADD16,2                    ; 
                    ds       X_ADD16,2 
                    ds       ALL_PURPOSE, 1               ; delay, negative -> explosion, positive countdown for enemy Hit Brightness (<= HIT_FLASH_LENGTH only) 
                    ds       BIT_MASK, 1                  ; shot delay = lower 3 bits 
                    ds       ENEMY_STRUCT, 2              ; this can be reduced to one byte! 
                    end struct 
;
                    struct   SaucerStruct 
                    ds       Y_POS,1                      ; D current position ; BUG TARGET POS 
                    ds       X_POS,1                      ; D ; BUG TARGET POS 
                    ds       BEHAVIOUR,2                  ; PC 
                    ds       NEXT_ENEMY_OBJECT,2          ; positive = end of list 
                    ds       BIG_HP,2                     ; D current position for calculation only , Y is pos, y low is addy 
                    ds       STAY_HERE_LOOP_COUNTER,1     ; 1 byte ; D current position for calculation only 
                    ds       LASER_X,1                    ; 1 byte ; D current position for calculation only 
                    ds       MONEY_SUCK_TIMER,1           ; is 2 bytes, but shares second byte with ANIM count 
                    ds       BACK_OR_FORTH, 1 
                    ds       ANGLE_HOMEFLIGHT,1           ; in absolut movement the lower 3 bits are speed and angle is 0-7 instead 0-14 
                    ds       MY_PATTERN, 2                ; 
                    ds       PATTERN_POSITION, 1          ; where in the current pattern are we? 
                                                          ; uper nibble, when attack pattern 
                                                          ; which pattern "trail" to follow 
                    ds       POSITION, 1                  ; UID of curretn enemies -> defines position in waiting state 
                    ds       ALL_PURPOSE, 1               ; delay, negative -> explosion, positive countdown for enemy Hit Brightness (<= HIT_FLASH_LENGTH only) 
                                                          ; speed of falling debris 
                    ds       BIT_MASK, 1                  ; shot delay = lower 3 bits 
                    ds       ENEMY_STRUCT, 2              ; this can be reduced to one byte! 
                    end struct                            ; 
; ****************************************************************************************************
;
                    struct   ShotStruct 
                    ds       Y_POS_NOW16, 0 
                    ds       Y_POS,1                      ; D current position 
                    ds       X_POS,1                      ; D 
                    ds       BEHAVIOUR,2                  ; PC 
                    ds       NEXT_SHOT_OBJECT,2           ; positive = end of list 
                    ds       Y_POS16 ,2                   ; 
                    ds       X_POS16 ,2                   ; 
                    ds       SHOT_SPEED, 0                ; only missile and "normal" 
                    ds       X_POS_NOW16, 2 
                    end struct 
;
                    struct   MissileShotStruct 
                    ds       Y_POS_NOW16, 0 
                    ds       Y_POS,1                      ; D current position 
                    ds       X_POS,1                      ; D 
                    ds       BEHAVIOUR,2                  ; PC 
                    ds       NEXT_SHOT_OBJECT,2           ; positive = end of list 
                    ds       DIRECTION_CHANGE_COUNTER, 1 
                    ds       MISSILE_X_ADD, 1 
                    ds       filler, 2                    ; #noDoubleWarn 
                    ds       SHOT_SPEED, 1 
                    ds       fillerMissile, 1 
                    end struct 
;
; ****************************************************************************************************
;
                    struct   BonusStruct 
                    ds       Y_POS,1                      ; D current position 
                    ds       X_POS,1                      ; 
                    ds       BEHAVIOUR,2                  ; PC 
                    ds       NEXT_BONUS_OBJECT,2          ; positive = end of list 
                    ds       TYPE, 1 
                    ds       BONUS_ANIM_POSITION, 1       ; low 6 bit - anim, hi 2 bit speed 
                    end struct 
;
; ****************************************************************************************************
;
; 13 for 4 stars
                    struct   StarStruct 
                    ds       Y1_POS,1                     ; D current position 
                    ds       X1_POS,1                     ; D 
                    ds       BEHAVIOUR,2                  ; PC 
                    ds       NEXT_STAR_OBJECT,2           ; positive = end of list 
                    ds       RADIUS,0                     ; 
                    ds       TWINKLE,1                    ; 
                    ds       Y2_POS,1                     ; 
                    ds       X2_POS,1                     ; 
                    ds       Y3_POS,1                     ; 
                    ds       X3_POS,1                     ; 
                    ds       Y4_POS,1                     ; 
                    ds       X4_POS,1                     ; 
                    end struct 
;
; ****************************************************************************************************
;
; 10 bytes
                    struct   PlayerShotStruct 
                    ds       Y_POS_REL, 0 
                    ds       Y_POS,1                      ; D current position 
                    ds       X_POS_REL, 0 
                    ds       X_POS,1                      ; 
                    ds       BEHAVIOUR,2                  ; PC 
                    ds       NEXT_PLAYERSHOT_OBJECT,2     ; 
                    ds       Y_POS16,2                    ; 
                    ds       SHOT_RADIUS, 1               ; 
                    ds       SCOOP_SHOTS, 1               ; upper nibble left, lower nibble right , bit 0+1: 001 1 SHOT, 010 2 SHOT, 011 3 SHOT, 100 4 SHOT 
                    end struct 
;
                    struct   PlayerLazerShotStruct 
                    ds       Y_POS,1                      ; D current position 
                    ds       X_POS,1                      ; 
                    ds       BEHAVIOUR,2                  ; PC 
                    ds       NEXT_PLAYERSHOT_OBJECT,2     ; 
                    ds       LAZER_WOBBLE,1               ; alternating 0 and != 0, left or right slope starting 
                    ds       LAZER_TIMER,1 
                    ds       SHOT_RADIUS, 1               ; 
                    ds       SCOOP_SHOTS, 1               ; upper nibble left, lower nibble right , bit 0+1: 001 1 SHOT, 010 2 SHOT, 011 3 SHOT, 100 4 SHOT 
                    end struct 
;
; ****************************************************************************************************
;
                    struct   LevelDefinition 
                    ds       LEVEL_ENEMY_COUNT,0          ; or in case of direct appearence the number of enemies! 
                    ds       LEVEL_INTRO_PATTERN,2        ; or in case of direct appearence the number of enemies! 
                    ds       LEVEL_WAITING_PATTERN,2 
                    ds       LEVEL_ATTACK_PATTERN,2       ; pointer to attack pattern list - pointer to 4 pointers to attack patterns 
                    ds       LEVEL_ENEMY_DEFINITION,2 
                    ds       LEVEL_MAX_ITEMS, 1           ; high nibble max shots, low nibble max attack patterns 
;                    ds       LEVEL_MAX_SHOTS_IN_AIR, 1 
;                    ds       LEVEL_MAX_ATTACK_PATTERNS, 1 
                    ds       LEVEL_TYPE, 1 
                    ds       LEVEL_BULLET_BORDER, 1       ; how probable is it that enemies shoots 
                    ds       LEVEL_BONUS_BORDER, 1        ; how probable is it that bonus drops 
                    ds       LEVEL_BUG_DEFINITION, 2 
                    ds       LEVEL_BUG_COUNT, 1 
                    ds       LEVEL_SHOT_DELAY_BUG, 1 
                    end struct 
;
; ****************************************************************************************************
;
                    struct   IntroLine 
                    ds       LINE_PATTERN_DEF, 2 
                    ds       LINE_PATTERN_INVERS ,1 
                    ds       LINE_PATTERN_ENEMY_COUNT ,1 
                    end struct 
;
; ****************************************************************************************************
;
;
; when flight pattern definition
; how enemies enter the level
; calcs are done in an Excel sheet
                    struct   PatternLine 
                    ds       P_YPOS, 1 
                    ds       P_XPOS, 1 
                    ds       P_YADD, 2 
                    ds       P_XADD, 2 
                    ds       P_ANGLE,1 
                    ds       P_PATTERN_TARGET_RADIUS ,0   ;depending on speed 
                    ds       P_PAD ,1                     ; this is now SPEED offset for compare! 
                    end struct 
;
                    struct   IntroPattern 
                    ds       P_DELAY_BETWEEN_ENEMIES, 1 
                    ds       P_START_DELAY_OF_PATTERN, 1 
                    ds       P_PATTERN_PATTERN_START, 0 
                                                          ; arbitraty number of PatternLine, end with both y and xadder = 0 
                    end struct 
;
                    struct   SingleAttackPatternLine 
                    ds       SINGLE_ATTACK_PATTERN_NEXT_NO, 0 
                    ds       SINGLE_ATTACK_SPEED,1 
                    ds       SINGLE_ATTACK_PATTERN_TYPE,1 
                    ds       SINGLE_ATTACK_PATTERN_POINTER,2 ; when pointer = 0, than end of list 
                    end struct 
;
; ****************************************************************************************************
;
                    struct   EnemyDefinition 
                    ds       ANGLE8_TABLE,2               ; if zero -> BigBug 
                    ds       BUG_ENEMY_HP, 0 
                    ds       ENEMY_STRENGTH,1             ; see above 
                    ds       WAIT_ANIM_TABLE,2 
                    ds       ENEMY_DEBRIS_SPEED, 0 
                    ds       ENEMY_BULLET_SPEED, 1        ; bug only (for now), lower nibble speed, uppernibble 
                                                          ; #mt3n, m= 1 can fire missiles, t = 1 can fire target shots, 3 = 1 can fire tripples 
                                                          ; if m = 1 than always missile 
                                                          ; if 3 = 1 than always tripple (if not missile) 
                                                          ; t else 
                                                          ; if debris - than ALSO speed of falling debris 
                    ds       ADDITIONAL_TYPE_INFO,1 
                    ds       CLONE_INFO, 1                ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
                    end struct 
;;;;;
; ****************************************************************************************************
                    struct   RocketEmitter 
                    ds       FW_Y_POS, 2 
                    ds       FW_BEHAVIOUR, 2 
                    ds       FW_NEXT_OBJECT, 2 
                    ds       FW_X_POS, 2 
                    ds       FW_Y_VEL, 2 
                    ds       FW_X_VEL, 2 
                    ds       FW_AGE, 1 
                    ds       FW_ZERO_RGAL ,1 
                    end struct 
                    struct   VelocityParticle 
                    ds       FW_Y_POS, 2 
                    ds       FW_BEHAVIOUR, 2 
                    ds       FW_NEXT_OBJECT, 2 
                    ds       FW_X_POS, 2 
                    ds       FW_Y_VEL, 2 
                    ds       FW_X_VEL, 2 
                    ds       FW_AGE, 1 
                    ds       FW_ZERO ,1 
                    end struct 
; ****************************************************************************************************
;
;
u_offset1           =        -NEXT_ENEMY_OBJECT           ; behaviour offset is determined by next structure element 
; ****************************************************************************************************
                    struct   HighScoreEntry 
                    ds       HS_NAME,3                    ; 
                    ds       HS_BCD_SCORE,4               ; 
                    ds       HS_LEVEL,1                   ; 
                    end struct 4 
; ****************************************************************************************************
                    struct   FlameParameter 
                    ds       POS, 2 
                    ds       Y_UPDATE, 1 
                    ds       Y_OFFSET, 1 
                    ds       X_OFFSET, 1 
                    ds       X_WAITER, 1 
                    ds       Y_WAITER, 1 
                    ds       X_RESET, 1 
                    ds       Y_RESET, 1 
                    ds       SCALE_POS, 1 
                    ds       FLAME_INT_MAX, 1 
                    ds       COUNTER, 1 
                    ds       VALUES, 2 
                    end struct 
;
;
XWAIT               =        3 
YWAIT               =        4 
;
; ****************************************************************************************************
;
;
; RAM that is "always" the same
                    include  "RAMLayoutStatic.asm"
; RAM for "in game"
                    include  "RAMLayoutInGame.asm"
; RAM used in title screen
                    include  "RAMLayoutInTitle.asm"
; RAM used in dodger
                    include  "RAMDodger.asm"
; RAM used in boss fights
                    include  "RAMBoss.asm"
