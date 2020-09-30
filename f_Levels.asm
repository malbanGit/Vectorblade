; bank 3
                    include  "f_attackPatterns.asm"
                    include  "f_introEnemyDefinitions.asm"
                    include  "f_introFlightPaths.asm"
                    include  "f_waitingPatterns.asm"
; ****************************************************************************************************
failureLevels 
                    dw       failureLevel1 
                    dw       0 
; ****************************************************************************************************
failureLevel1 
                    dw       Level1Intro                  ; so that "enemy count finishes"ok" ; LEVEL_INTRO_PATTERN 
                    dw       0                            ; LEVEL_WAITING_PATTERN 
                    dw       0 
                    dw       0                            ; LEVEL_ENEMY_DEFINITION 
                    db       6*16+0 
;                    db       6                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       0                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_FAILURE+ LEVEL_TYPE_WARP_AFTER 
                    db       2                            ; LEVEL_BULLET_BORDER, 1 
                    db       0                            ; LEVEL_BONUS_BORDER, 1 
                    dw       failureBug1Definition        ; perhaps first Bug entry behaviour ("beam in") 
                    db       5                            ; big Bug Count 
                    db       50                           ; bug shot delay 
; ****************************************************************************************************
; ****************************************************************************************************
levels 
                    dw       level1                       ; normal 
                    dw       level2                       ; normal 
                    dw       level3                       ; biggy 
                    dw       level4                       ; kamikaze, warp 
                    dw       level5                       ; shop 
                    dw       level6                       ; normal 
                    dw       level7                       ; biggy 
                    dw       level8                       ; challenge, warp 
                    dw       level9                       ; normal 
                    dw       level10                      ; shop 
                    dw       level11                      ; biggy 
                    dw       level12                      ; kamikaze, warp 
                    dw       level13                      ; normal 
                    dw       level14                      ; normal 
                    dw       level15                      ; biggy, shop 
                    dw       level16                      ; challenge, warp 
                    dw       level17                      ; normal 
                    dw       level18                      ; normal 
                    dw       level19                      ; biggy 
                    dw       level20                      ; shop, kamikaze, warp 
                    dw       level21                      ; normal 
                    dw       level22                      ; normal 
                    dw       level23                      ; biggy 
                    dw       level24                      ; challenge, warp 
                    dw       level25_Boss2_Queen          ; Queen 
                    dw       level25                      ; normal , shop 
                    dw       level26                      ; normal 
                    dw       level27                      ; biggy 
                    dw       level28                      ; kamikaze, warp 
                    dw       level29                      ; normal 
                    dw       level30                      ; shop 
                    dw       level31                      ; biggy 
                    dw       level32                      ; challenge, warp 
                    dw       level33                      ; normal 
                    dw       level34                      ; normal 
                    dw       level35                      ; biggy, shop 
                    dw       level36                      ; kamikaze, warp 
                    dw       level37                      ; normal 
                    dw       level38                      ; normal 
                    dw       level39                      ; biggy 
                    dw       level40                      ; challenge, warp, shop 
                    dw       level41                      ; normal 
                    dw       level42                      ; normal 
                    dw       level43                      ; biggy 
                    dw       level44                      ; kamikaze, warp 
                    dw       level45                      ; normal, shop 
                    dw       level46                      ; normal 
                    dw       level47                      ; biggy 
                    dw       level48                      ; challenge, warp 
                    dw       level49                      ; normal 
                    dw       level50_Boss3_sinistar       ; Sinistar 
                    dw       level50                      ; normal, shop ; all tie fighter swoop in from all sides 
                    dw       level51                      ; normal, biggy ; vader from both sides 
                    dw       level52                      ; kamikaze, warp ; 3 vader parallel from above 
                    dw       level53                      ; normal ; two shields, 3 x wing 
                    dw       level54                      ; normal; five middle shields all enemy from side 
                    dw       level55                      ; hard; biggy, shop ; from all sides, 
                    dw       level56                      ; challenge, warp 
                    dw       level57                      ; hard; normal; from all sides all enemies 
                    dw       level58                      ; normal ; shield loop 
                    dw       level59                      ; biggy 
                    dw       level60                      ; kamikaze, warp , shop 
                    dw       level61                      ; normal ; make it a 60 spawner with x ids 
                    dw       level62                      ; normal 
                    dw       level63                      ; biggy 
                    dw       level64                      ; challenge, warp 
                    dw       level65                      ; hard; normal shop ; from all sides all enemies 
                    dw       level66                      ; normal 
                    dw       level67                      ; hard; biggy ; from all sides, dropping debris 
                    dw       level68                      ; kamikaze, warp 
                    dw       level69                      ; normal 
                    dw       level70                      ; normal, shop 
                    dw       level71                      ; biggy 
                    dw       level72                      ; challenge, warp 
                    dw       level73                      ; normal 
                    dw       level74                      ; normal 
                    dw       level75_Boss4_deathstar      ; Deathstar 
                    dw       level75                      ; biggy, shop 
                    dw       level76                      ; kamikaze, warp 
                    dw       level77                      ; normal 
                    dw       level78                      ; normal 
                    dw       level79                      ; biggy 
                    dw       level80                      ; challenge, warp , shop 
                    dw       level81                      ; normal - tribble 
                    dw       level82                      ; normal 
                    dw       level83                      ; biggy, 
                    dw       level84                      ; kamikaze, warp 
                    dw       level85                      ; normal , shop 
                    dw       level86                      ; normal 
                    dw       level87                      ; biggy - Bug Nirvana 
                    dw       level88                      ; challenge, warp 
                    dw       level89                      ; normal 
                    dw       level90                      ; normal , shop 
                    dw       level91                      ; biggy 
                    dw       level92                      ; kamikaze, warp 
                    dw       level93                      ; normal 
                    dw       level94                      ; normal 
                    dw       level95                      ; biggy , shop - Bug Nirvana II 
                    dw       level96                      ; challenge, warp 
                    dw       level97                      ; normal 
                    dw       level98                      ; normal 
                    dw       level99                      ; biggy - random shots 
                    dw       level100_Boss1_Borg          ; Borg 
                    dw       0 
; ****************************************************************************************************
; waiting patterns could be coded in 4 bits (1ß values)
; attackpattern could be coded in 3 bits (5 vylues)
; bullet/bonus border could be coded in 4 bits each (eg 16 different values each, with a 4 bit pointer)
; -> 400 bytes could be saved!
; ****************************************************************************************************
level1: 
                    dw       Level1Intro                  ;introPattern1 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern1              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns0 
                    dw       enemyDefinitions1            ; LEVEL_ENEMY_DEFINITION 
                    db       3*16+2 
;                    db       3                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       2                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL + LEVEL_TYPE_DONT_SHOOT_WHILE_WAITING ; 
                    db       1                            ; LEVEL_BULLET_BORDER, 1 
                    db       70                           ; LEVEL_BONUS_BORDER, 1 
level2: 
                    dw       Level2Intro                  ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern1              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns0 
                    dw       enemyDefinitions2            ; LEVEL_ENEMY_DEFINITION 
                    db       4*16+3 
;                    db       4                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       3                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL            ;+ LEVEL_TYPE_DONT_SHOOT_WHILE_WAITING 
                    db       1                            ; LEVEL_BULLET_BORDER, 1 
                    db       80                           ;LEVEL_BONUS_BORDER, 1 
level3: 
                    dw       Level3Intro                  ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern2              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns0 
                    dw       enemyDefinitions3            ; LEVEL_ENEMY_DEFINITION 
                    db       4*16+3 
;                    db       4                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       3                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BIGGY + LEVEL_TYPE_DONT_SHOOT_WHILE_WAITING 
                    db       2                            ; LEVEL_BULLET_BORDER, 1 
                    db       90                           ; LEVEL_BONUS_BORDER, 1 
                    dw       bigBug1Definition 
                    db       1                            ; big Bug Count 
                    db       50                           ; bug shot delay 
level4: 
                    dw       Level4Intro_Kamikaze         ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern1              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns1 
                    dw       enemyDefinitions4            ; LEVEL_ENEMY_DEFINITION 
                    db       4*16+2 
;                    db       4                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       2                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_KAMIKAZE + LEVEL_TYPE_WARP_AFTER 
                    db       2                            ; LEVEL_BULLET_BORDER, 1 
                    db       100                          ;LEVEL_BONUS_BORDER, 1 
level5: 
                    dw       Level5Intro                  ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern2              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns1 
                    dw       enemyDefinitions5            ; LEVEL_ENEMY_DEFINITION 
                    db       4*16+3 
;                    db       4                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       3                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL + LEVEL_TYPE_DONT_SHOOT_WHILE_WAITING+ LEVEL_TYPE_SHOP_AFTER 
                    db       2                            ; LEVEL_BULLET_BORDER, 1 
                    db       90                           ; LEVEL_BONUS_BORDER, 1 
level6: 
                    dw       Level6Intro                  ;introPattern1 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern1              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns1 
                    dw       enemyDefinitions6            ; LEVEL_ENEMY_DEFINITION 
                    db       4*16+4 
;                    db       4                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       4                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL            ; 
                    db       2                            ; LEVEL_BULLET_BORDER, 1 
                    db       100                          ; LEVEL_BONUS_BORDER, 1 
level7: 
                    dw       Level7Intro                  ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern2              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns1 
                    dw       enemyDefinitions7            ; LEVEL_ENEMY_DEFINITION 
                    db       5*16+5 
;                    db       5                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       5                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BIGGY             ; 
                    db       2                            ; LEVEL_BULLET_BORDER, 1 
                    db       100                          ;LEVEL_BONUS_BORDER, 1 
                    dw       bigBug2Definition 
                    db       2                            ; big Bug Count 
                    db       50                           ; bug shot delay 
level8: 
                    dw       Level8Intro_Bonus            ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern1              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns2 
                    dw       enemyDefinitions8            ; LEVEL_ENEMY_DEFINITION 
                    db       0*16+0 
;                    db       0                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       0                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BONUS + LEVEL_TYPE_WARP_AFTER 
                    db       1                            ; LEVEL_BULLET_BORDER, 1 
                    db       150                          ;LEVEL_BONUS_BORDER, 1 
level9: 
                    dw       Level9Intro                  ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern1              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns2 
                    dw       enemyDefinitions9            ; LEVEL_ENEMY_DEFINITION 
                    db       6*16+6 
;                    db       6                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       6                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL 
                    db       2                            ; LEVEL_BULLET_BORDER, 1 
                    db       100                          ;LEVEL_BONUS_BORDER, 1 
level10: 
                    dw       Level10Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern2              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns2 
                    dw       enemyDefinitions10           ; LEVEL_ENEMY_DEFINITION 
                    db       4*16+6 
;                    db       4                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       6                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL + LEVEL_TYPE_SHOP_AFTER 
                    db       3                            ; LEVEL_BULLET_BORDER, 1 
                    db       100                          ;LEVEL_BONUS_BORDER, 1 
level11: 
                    dw       Level11Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern2              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns2 
                    dw       enemyDefinitions11           ; LEVEL_ENEMY_DEFINITION 
                    db       5*16+5 
;                    db       5                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       5                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BIGGY 
                    db       3                            ; LEVEL_BULLET_BORDER, 1 
                    db       100                          ;LEVEL_BONUS_BORDER, 1 
                    dw       bigBug3Definition 
                    db       2                            ; big Bug Count 
                    db       50                           ; bug shot delay 
level12: 
                    dw       Level12Intro_Kamikaze        ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern1              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns1 
                    dw       enemyDefinitions12           ; LEVEL_ENEMY_DEFINITION 
                    db       4*16+6 
;                    db       4                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       6                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_KAMIKAZE + LEVEL_TYPE_WARP_AFTER 
                    db       3                            ; LEVEL_BULLET_BORDER, 1 
                    db       100                          ;LEVEL_BONUS_BORDER, 1 
level13: 
                    dw       Level13Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern2              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns1 
                    dw       enemyDefinitions13           ; LEVEL_ENEMY_DEFINITION 
                    db       4*16+6 
;                    db       4                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       6                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL 
                    db       3                            ; LEVEL_BULLET_BORDER, 1 
                    db       100                          ;LEVEL_BONUS_BORDER, 1 
level14: 
                    dw       Level14Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern2              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns1 
                    dw       enemyDefinitions14           ; LEVEL_ENEMY_DEFINITION 
                    db       4*16+6 
;                    db       4                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       6                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL 
                    db       3                            ; LEVEL_BULLET_BORDER, 1 
                    db       100                          ;LEVEL_BONUS_BORDER, 1 
level15: 
                    dw       Level15Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern2              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns2 
                    dw       enemyDefinitions15           ; LEVEL_ENEMY_DEFINITION 
                    db       7*16+7 
;                    db       7                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       7                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BIGGY + LEVEL_TYPE_SHOP_AFTER 
                    db       3                            ; LEVEL_BULLET_BORDER, 1 
                    db       100                          ;LEVEL_BONUS_BORDER, 1 
                    dw       bigBug1Definition 
                    db       3                            ; big Bug Count 
                    db       50                           ; bug shot delay 
level16: 
                    dw       Level16Intro_Bonus           ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern1              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns2 
                    dw       enemyDefinitions16           ; LEVEL_ENEMY_DEFINITION 
                    db       0*16+0 
;                    db       0                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       0                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BONUS + LEVEL_TYPE_WARP_AFTER 
                    db       1                            ; LEVEL_BULLET_BORDER, 1 
                    db       150                          ;LEVEL_BONUS_BORDER, 1 
level17: 
                    dw       Level17Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern1              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns3 
                    dw       enemyDefinitions17           ; LEVEL_ENEMY_DEFINITION 
                    db       4*16+6 
;                    db       4                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       6                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL 
                    db       3                            ; LEVEL_BULLET_BORDER, 1 
                    db       100                          ;LEVEL_BONUS_BORDER, 1 
level18: 
                    dw       Level18Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern1              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns3 
                    dw       enemyDefinitions18           ; LEVEL_ENEMY_DEFINITION 
                    db       4*16+6 
;                    db       4                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       6                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL 
                    db       3                            ; LEVEL_BULLET_BORDER, 1 
                    db       100                          ;LEVEL_BONUS_BORDER, 1 
level19: 
                    dw       Level19Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern1              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns3 
                    dw       enemyDefinitions19           ; LEVEL_ENEMY_DEFINITION 
                    db       4*16+6 
;                    db       4                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       6                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BIGGY 
                    db       3                            ; LEVEL_BULLET_BORDER, 1 
                    db       100                          ;LEVEL_BONUS_BORDER, 1 
                    dw       bigBug2Definition 
                    db       3                            ; big Bug Count 
                    db       50                           ; bug shot delay 
level20: 
                    dw       Level20Intro_Kamikaze        ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern1              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns1 
                    dw       enemyDefinitions20           ; LEVEL_ENEMY_DEFINITION 
                    db       4*16+6 
;                    db       4                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       6                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_KAMIKAZE + LEVEL_TYPE_SHOP_AFTER + LEVEL_TYPE_WARP_AFTER 
                    db       3                            ; LEVEL_BULLET_BORDER, 1 
                    db       100                          ;LEVEL_BONUS_BORDER, 1 
level21 
                    dw       Level21Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern2              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns2 
                    dw       enemyDefinitions21           ; LEVEL_ENEMY_DEFINITION 
                    db       4*16+6 
;                    db       4                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       6                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL 
                    db       3                            ; LEVEL_BULLET_BORDER, 1 
                    db       100                          ;LEVEL_BONUS_BORDER, 1 
level22 
                    dw       Level22Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern2              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns2 
                    dw       enemyDefinitions22           ; LEVEL_ENEMY_DEFINITION 
                    db       4*16+6 
;                    db       4                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       6                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL 
                    db       3                            ; LEVEL_BULLET_BORDER, 1 
                    db       100                          ;LEVEL_BONUS_BORDER, 1 
level23 
                    dw       Level23Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern1              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns3 
                    dw       enemyDefinitions23           ; LEVEL_ENEMY_DEFINITION 
                    db       4*16+6 
;                    db       4                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       6                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BIGGY 
                    db       3                            ; LEVEL_BULLET_BORDER, 1 
                    db       100                          ;LEVEL_BONUS_BORDER, 1 
                    dw       bigBug3Definition 
                    db       3                            ; big Bug Count 
                    db       100                          ; bug shot delay 
level24 
                    dw       Level24Intro_Bonus           ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern1              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns2 
                    dw       enemyDefinitions24           ; LEVEL_ENEMY_DEFINITION 
                    db       0*16+0 
;                    db       0                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       0                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BONUS + LEVEL_TYPE_WARP_AFTER 
                    db       1                            ; LEVEL_BULLET_BORDER, 1 
                    db       150                          ;LEVEL_BONUS_BORDER, 1 
                                                          ; LEVEL_BONUS_BORDER, 1 
level25: 
                    dw       Level25Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern2              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns3 
                    dw       enemyDefinitions25           ; LEVEL_ENEMY_DEFINITION 
                    db       4*16+6 
;                    db       4                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       6                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL + LEVEL_TYPE_SHOP_AFTER 
                    db       3                            ; LEVEL_BULLET_BORDER, 1 
                    db       100                          ;LEVEL_BONUS_BORDER, 1 
level26: 
                    dw       Level26Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern2              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns3 
                    dw       enemyDefinitions26           ; LEVEL_ENEMY_DEFINITION 
                    db       4*16+6 
;                    db       4                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       6                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL 
                    db       3                            ; LEVEL_BULLET_BORDER, 1 
                    db       100                          ;LEVEL_BONUS_BORDER, 1 
level27: 
                    dw       Level27Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern1              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns1 
                    dw       enemyDefinitions27           ; LEVEL_ENEMY_DEFINITION 
                    db       4*16+5 
;                    db       4                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       5                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BIGGY 
                    db       1                            ; LEVEL_BULLET_BORDER, 1 
                    db       150                          ;LEVEL_BONUS_BORDER, 1 
                    dw       bigBugSin1Definition 
                    db       2                            ; big Bug Count 
                    db       200                          ; bug shot delay 
level28: 
                    dw       Level28Intro_Kamikaze        ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern1              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns1 
                    dw       enemyDefinitions28           ; LEVEL_ENEMY_DEFINITION 
                    db       3*16+6 
;                    db       3                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       6                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_KAMIKAZE + LEVEL_TYPE_WARP_AFTER 
                    db       3                            ; LEVEL_BULLET_BORDER, 1 
                    db       100                          ;LEVEL_BONUS_BORDER, 1 
level29: 
                    dw       Level29Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern2              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns3 
                    dw       enemyDefinitions29           ; LEVEL_ENEMY_DEFINITION 
                    db       4*16+6 
;                    db       4                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       6                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL 
                    db       3                            ; LEVEL_BULLET_BORDER, 1 
                    db       100                          ;LEVEL_BONUS_BORDER, 1 
level30: 
                    dw       Level30Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern2              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns3 
                    dw       enemyDefinitions30           ; LEVEL_ENEMY_DEFINITION 
                    db       4*16+6 
;                    db       4                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       6                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL + LEVEL_TYPE_SHOP_AFTER 
                    db       3                            ; LEVEL_BULLET_BORDER, 1 
                    db       100                          ;LEVEL_BONUS_BORDER, 1 
level31: 
                    dw       Level31Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern1              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns3 
                    dw       enemyDefinitions31           ; LEVEL_ENEMY_DEFINITION 
                    db       5*16+2 
;                    db       5                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       2                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BIGGY 
                    db       2                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
                    dw       bigBugSin2Definition 
                    db       3                            ; big Bug Count 
                    db       50                           ; bug shot delay 
level32: 
                    dw       Level32Intro_Bonus           ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern1              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns2 
                    dw       enemyDefinitions32           ; LEVEL_ENEMY_DEFINITION 
                    db       0*16+0 
;                    db       0                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       0                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BONUS + LEVEL_TYPE_WARP_AFTER 
                    db       1                            ; LEVEL_BULLET_BORDER, 1 
                    db       150                          ;LEVEL_BONUS_BORDER, 1 
level33: 
                    dw       Level33Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern2              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns3 
                    dw       enemyDefinitions33           ; LEVEL_ENEMY_DEFINITION 
                    db       3*16+5 
;                    db       3                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       5                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL 
                    db       1                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
level34: 
                    dw       Level34Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern2              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns4 
                    dw       enemyDefinitions34           ; LEVEL_ENEMY_DEFINITION 
                    db       3*16+7 
;                    db       3                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       7                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL 
                    db       2                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
level35: 
                    dw       Level35Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern2              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns4 
                    dw       enemyDefinitions35           ; LEVEL_ENEMY_DEFINITION 
                    db       3*16+4 
;                    db       3                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       4                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BIGGY + LEVEL_TYPE_SHOP_AFTER 
                    db       2                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
                    dw       bigBugSin3Definition 
                    db       3                            ; big Bug Count 
                    db       100                          ; bug shot delay 
level36: 
                    dw       Level36Intro_Kamikaze        ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern2              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns4 
                    dw       enemyDefinitions36           ; LEVEL_ENEMY_DEFINITION 
                    db       7*16+3 
;                    db       7                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       4                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_KAMIKAZE + LEVEL_TYPE_WARP_AFTER 
                    db       2                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
level37: 
                    dw       Level37Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern2              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns1 
                    dw       enemyDefinitions37           ; LEVEL_ENEMY_DEFINITION 
                    db       4*16+4 
;                    db       4                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       4                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL 
                    db       2                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
level38: 
                    dw       Level38Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern2              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns1 
                    dw       enemyDefinitions38           ; LEVEL_ENEMY_DEFINITION 
                    db       4*16+4 
;                    db       4                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       4                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL 
                    db       2                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
level39: 
                    dw       Level39Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern2              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns2 
                    dw       enemyDefinitions39           ; LEVEL_ENEMY_DEFINITION 
                    db       4*16+2 
;                    db       4                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       2                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BIGGY 
                    db       0                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
                    dw       bigBugSin3Definition100 
                    db       1                            ; big Bug Count 
                    db       40                           ; bug shot delay 
level40: 
                    dw       Level40Intro_Bonus           ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern1              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns1 
                    dw       enemyDefinitions40           ; LEVEL_ENEMY_DEFINITION 
                    db       0*16+0 
;                    db       0                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       0                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BONUS + LEVEL_TYPE_SHOP_AFTER + LEVEL_TYPE_WARP_AFTER 
                    db       0                            ; LEVEL_BULLET_BORDER, 1 
                    db       150                          ;LEVEL_BONUS_BORDER, 1 
level41: 
                    dw       Level41Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern2              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns1 
                    dw       enemyDefinitions41           ; LEVEL_ENEMY_DEFINITION 
                    db       4*16+7 
;                    db       4                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       7                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL 
                    db       2                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
level42: 
                    dw       20                           ;number of enemies in case of "LEVEL_APPEAR_AT_WAITING" 
                    dw       waitingPattern4              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns4 
                    dw       enemyDefinitions42           ; LEVEL_ENEMY_DEFINITION 
                    db       3*16+10 
;                    db       3                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       10                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL + LEVEL_APPEAR_AT_WAITING 
                    db       2                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
level43: 
                    dw       20                           ;number of enemies in case of "LEVEL_APPEAR_AT_WAITING" 
                    dw       waitingPattern2              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns0 
                    dw       enemyDefinitions43           ; LEVEL_ENEMY_DEFINITION 
                    db       10*16+10 
;                    db       10                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       10                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BIGGY + LEVEL_APPEAR_AT_WAITING 
                    db       0                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
                    dw       bigBugSin2Definition100 
                    db       2                            ; big Bug Count 
                    db       40                           ; bug shot delay 
level44: 
                    dw       Level44Intro_Kamikaze        ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern2              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns4 
                    dw       enemyDefinitions44           ; LEVEL_ENEMY_DEFINITION 
                    db       0*16+0 
;                    db       0                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       0                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_KAMIKAZE + LEVEL_TYPE_WARP_AFTER 
                    db       2                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
level45: 
                    dw       20                           ;number of enemies in case of "LEVEL_APPEAR_AT_WAITING" 
                    dw       waitingPattern2              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns1 
                    dw       enemyDefinitions45           ; LEVEL_ENEMY_DEFINITION 
                    db       6*16+10 
;                    db       6                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       10                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL + LEVEL_TYPE_SHOP_AFTER + LEVEL_APPEAR_AT_WAITING 
                    db       3                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
level46: 
                    dw       20                           ;number of enemies in case of "LEVEL_APPEAR_AT_WAITING" 
                    dw       waitingPattern5              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns1 
                    dw       enemyDefinitions46           ; LEVEL_ENEMY_DEFINITION 
                    db       10*16+10 
;                    db       10                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       10                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL + LEVEL_APPEAR_AT_WAITING 
                    db       3                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
level47: 
                    dw       Level47Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern2              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns0 
                    dw       enemyDefinitions47           ; LEVEL_ENEMY_DEFINITION 
                    db       10*16+2 
;                    db       10                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       2                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BIGGY 
                    db       0                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
                    dw       bigBugSin1Definition100 
                    db       2                            ; big Bug Count 
                    db       50                           ; bug shot delay 
level48: 
                    dw       Level48Intro_Bonus           ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern1              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns1 
                    dw       enemyDefinitions48           ; LEVEL_ENEMY_DEFINITION 
                    db       0*16+0 
;                    db       0                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       0                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BONUS + LEVEL_TYPE_WARP_AFTER 
                    db       0                            ; LEVEL_BULLET_BORDER, 1 
                    db       150                          ;LEVEL_BONUS_BORDER, 1 
level49: 
                    dw       Level49Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern5              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns1 
                    dw       enemyDefinitions49           ; LEVEL_ENEMY_DEFINITION 
                    db       10*16+1 
;                    db       10                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       1                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL 
                    db       5                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
level50: 
                    dw       Level50Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern1              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns0 
                    dw       enemyDefinitions50           ; LEVEL_ENEMY_DEFINITION 
                    db       4*16+5 
;                    db       4                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       5                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_SHOP_AFTER 
                    db       0                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
level51: 
                    dw       Level51Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern2              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns2 
                    dw       enemyDefinitions51           ; LEVEL_ENEMY_DEFINITION 
                    db       4*16+4 
;                    db       4                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       4                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BIGGY 
                    db       2                            ; LEVEL_BULLET_BORDER, 1 
                    db       100                          ;LEVEL_BONUS_BORDER, 1 
                    dw       bigBugDestroyerDefinition1 
                    db       1                            ; big Bug Count 
                    db       50                           ; bug shot delay 
level52: 
                    dw       Level52Intro_Kamikaze        ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern2              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns4 
                    dw       enemyDefinitions52           ; LEVEL_ENEMY_DEFINITION 
                    db       4*16+4 
;                    db       4                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       4                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_KAMIKAZE + LEVEL_TYPE_WARP_AFTER 
                    db       2                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
level53: 
                    dw       Level53Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern_2Blocker      ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns4 
                    dw       enemyDefinitions53           ; LEVEL_ENEMY_DEFINITION 
                    db       10*16+10 
;                    db       10                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       10                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL 
                    db       5                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
level54: 
                    dw       Level54Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern_4Blocker      ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns0 
                    dw       enemyDefinitions54           ; LEVEL_ENEMY_DEFINITION 
                    db       4*16+5 
;                    db       4                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       5                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL 
                    db       0                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
level55: 
                    dw       Level55Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern2              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns2 
                    dw       enemyDefinitions55           ; LEVEL_ENEMY_DEFINITION 
                    db       6*16+4 
;                    db       6                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       4                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BIGGY + LEVEL_TYPE_SHOP_AFTER 
                    db       2                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
                    dw       bigBugDestroyerDefinition2 
                    db       2                            ; big Bug Count 
                    db       100                          ; bug shot delay 
level56: 
                    dw       Level56Intro_Bonus           ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern1              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns1 
                    dw       enemyDefinitions56           ; LEVEL_ENEMY_DEFINITION 
                    db       0*16+0 
;                    db       0                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       0                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BONUS + LEVEL_TYPE_WARP_AFTER 
                    db       0                            ; LEVEL_BULLET_BORDER, 1 
                    db       150                          ;LEVEL_BONUS_BORDER, 1 
level57: 
                    dw       Level57Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern5              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns3 
                    dw       enemyDefinitions57           ; LEVEL_ENEMY_DEFINITION 
                    db       5*16+7 
;                    db       5                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       7                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL 
                    db       3                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
level58: 
                    dw       Level58Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern5              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns3 
                    dw       enemyDefinitions58           ; LEVEL_ENEMY_DEFINITION 
                    db       5*16+7 
;                    db       5                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       7                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL 
                    db       3                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
level59: 
                    dw       Level59Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern2              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns2 
                    dw       enemyDefinitions59           ; LEVEL_ENEMY_DEFINITION 
                    db       4*16+4 
;                    db       4                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       4                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BIGGY 
                    db       2                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
                    dw       bigBugDestroyerDefinition3 
                    db       2                            ; big Bug Count 
                    db       100                          ; bug shot delay 
level60: 
                    dw       Level60Intro_Kamikaze        ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern1              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns1 
                    dw       enemyDefinitions60           ; LEVEL_ENEMY_DEFINITION 
                    db       6*16+6 
;                    db       6                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       6                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_KAMIKAZE + LEVEL_TYPE_SHOP_AFTER + LEVEL_TYPE_WARP_AFTER 
                    db       3                            ; LEVEL_BULLET_BORDER, 1 
                    db       100                          ;LEVEL_BONUS_BORDER, 1 
level61: 
                    dw       Level61Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern1              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns2 
                    dw       enemyDefinitions61           ; LEVEL_ENEMY_DEFINITION 
                    db       3*16+3 
;                    db       3                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       3                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL 
                    db       1                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
level62: 
                    dw       Level62Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern1_bottom       ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns2 
                    dw       enemyDefinitions62           ; LEVEL_ENEMY_DEFINITION 
                    db       4*16+4 
;                    db       4                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       4                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL 
                    db       2                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
level63: 
                    dw       Level63Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern4              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns2 
                    dw       enemyDefinitions63           ; LEVEL_ENEMY_DEFINITION 
                    db       4*16+4 
;                    db       4                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       4                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BIGGY 
                    db       2                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
                    dw       bigBugDestroyerDefinition1_b 
                    db       3                            ; big Bug Count 
                    db       100                          ; bug shot delay 
level64: 
                    dw       Level64Intro_Bonus           ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern1              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns1 
                    dw       enemyDefinitions64           ; LEVEL_ENEMY_DEFINITION 
                    db       0*16+0 
;                    db       0                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       0                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BONUS + LEVEL_TYPE_WARP_AFTER 
                    db       0                            ; LEVEL_BULLET_BORDER, 1 
                    db       150                          ;LEVEL_BONUS_BORDER, 1 
level65: 
                    dw       Level65Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern4              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns2 
                    dw       enemyDefinitions65           ; LEVEL_ENEMY_DEFINITION 
                    db       5*16+7 
;                    db       5                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       7                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL +LEVEL_TYPE_SHOP_AFTER 
                    db       3                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
level66: 
                    dw       Level66Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern4              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns2 
                    dw       enemyDefinitions66           ; LEVEL_ENEMY_DEFINITION 
                    db       5*16+7 
;                    db       5                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       7                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL 
                    db       3                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
level67: 
                    dw       Level67Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern2              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns3 
                    dw       enemyDefinitions67           ; LEVEL_ENEMY_DEFINITION 
                    db       5*16+4 
;                    db       5                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       4                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BIGGY 
                    db       2                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
                    dw       bigBugDestroyerDefinition2 
                    db       3                            ; big Bug Count 
                    db       100                          ; bug shot delay 
level68: 
                    dw       Level68Intro_Kamikaze        ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern2              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns4 
                    dw       enemyDefinitions68           ; LEVEL_ENEMY_DEFINITION 
                    db       4*16+4 
;                    db       4                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       4                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_KAMIKAZE + LEVEL_TYPE_WARP_AFTER 
                    db       2                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
level69: 
                    dw       20                           ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern1_bottom       ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns3 
                    dw       enemyDefinitions69           ; LEVEL_ENEMY_DEFINITION 
                    db       5*16+7 
;                    db       5                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       7                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL + LEVEL_APPEAR_AT_WAITING 
                    db       3                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
level70: 
                    dw       Level70Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern4              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns4 
                    dw       enemyDefinitions70           ; LEVEL_ENEMY_DEFINITION 
                    db       5*16+7 
;                    db       5                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       7                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL +LEVEL_TYPE_SHOP_AFTER 
                    db       3                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
level71: 
                    dw       Level71Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern4              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns2 
                    dw       enemyDefinitions71           ; LEVEL_ENEMY_DEFINITION 
                    db       5*16+5 
;                    db       5                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       5                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BIGGY 
                    db       2                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
                    dw       bigBugDestroyerDefinition3 
                    db       3                            ; big Bug Count 
                    db       100                          ; bug shot delay 
level72: 
                    dw       Level72Intro_Bonus           ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern1              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns1 
                    dw       enemyDefinitions72           ; LEVEL_ENEMY_DEFINITION 
                    db       0*16+0 
;                    db       0                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       0                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BONUS + LEVEL_TYPE_WARP_AFTER 
                    db       0                            ; LEVEL_BULLET_BORDER, 1 
                    db       150                          ;LEVEL_BONUS_BORDER, 1 
level73: 
                    dw       Level73Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern1_bottom       ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns4 
                    dw       enemyDefinitions73           ; LEVEL_ENEMY_DEFINITION 
                    db       5*16+7 
;                    db       5                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       7                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL 
                    db       3                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
level74: 
                    dw       Level74Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern4              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns4 
                    dw       enemyDefinitions74           ; LEVEL_ENEMY_DEFINITION 
                    db       5*16+7 
;                    db       5                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       7                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL 
                    db       3                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
level75: 
                    dw       Level75Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern2              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns3 
                    dw       enemyDefinitions75           ; LEVEL_ENEMY_DEFINITION 
                    db       5*16+7 
;                    db       5                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       7                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BIGGY + LEVEL_TYPE_SHOP_AFTER 
                    db       255                          ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
                    dw       BirdOfPreyDefinition1 
                    db       2                            ; big Bug Count 
                    db       100                          ; bug shot delay 
level76: 
                    dw       Level76Intro_Kamikaze        ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern2              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns4 
                    dw       enemyDefinitions76           ; LEVEL_ENEMY_DEFINITION 
                    db       4*16+4 
;                    db       4                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       4                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_KAMIKAZE + LEVEL_TYPE_WARP_AFTER 
                    db       2                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
level77: 
                    dw       Level77Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPatternBigBlock       ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns0 
                    dw       enemyDefinitions77           ; LEVEL_ENEMY_DEFINITION 
                    db       5*16+5 
;                    db       5                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       5                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL 
                    db       1                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
level78: 
                    dw       Level78Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPatternBigBlock       ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns4 
                    dw       enemyDefinitions78           ; LEVEL_ENEMY_DEFINITION 
                    db       8*16+8 
;                    db       8                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       8                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL 
                    db       10                           ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
level79: 
                    dw       Level79Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern2              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns3 
                    dw       enemyDefinitions79           ; LEVEL_ENEMY_DEFINITION 
                    db       5*16+7 
;                    db       5                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       7                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BIGGY 
                    db       255                          ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
                    dw       BirdOfPreyDefinition2 
                    db       4                            ; big Bug Count 
                    db       100                          ; bug shot delay 
level80: 
                    dw       Level80Intro_Bonus           ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern1              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns1 
                    dw       enemyDefinitions80           ; LEVEL_ENEMY_DEFINITION 
                    db       0*16+0 
;                    db       0                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       0                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BONUS + LEVEL_TYPE_SHOP_AFTER + LEVEL_TYPE_WARP_AFTER 
                    db       0                            ; LEVEL_BULLET_BORDER, 1 
                    db       150                          ;LEVEL_BONUS_BORDER, 1 
level81:                                                  ;        tribble 
                    dw       Level81Intro_Tribble         ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern2              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns4 
                    dw       enemyDefinitions81           ; LEVEL_ENEMY_DEFINITION 
                    db       4*16+4 
;                    db       4                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       4                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL 
                    db       2                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
level82: 
                    dw       Level82Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPatternBigBlock2      ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns4 
                    dw       enemyDefinitions82           ; LEVEL_ENEMY_DEFINITION 
                    db       8*16+8 
;                    db       8                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       8                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL 
                    db       10                           ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
level83: 
                    dw       20                           ;Level83Intro ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern5              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns3 
                    dw       enemyDefinitions83           ; LEVEL_ENEMY_DEFINITION 
                    db       5*16+5 
;                    db       5                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       5                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BIGGY + LEVEL_APPEAR_AT_WAITING 
                    db       2                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
                    dw       BirdOfPreyDefinition3 
                    db       4                            ; big Bug Count 
                    db       75                           ; bug shot delay 
level84: 
                    dw       Level84Intro_Kamikaze        ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern1              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns1 
                    dw       enemyDefinitions84           ; LEVEL_ENEMY_DEFINITION 
                    db       5*16+2 
;                    db       5                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       2                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_KAMIKAZE + LEVEL_TYPE_WARP_AFTER 
                    db       2                            ; LEVEL_BULLET_BORDER, 1 
                    db       100                          ;LEVEL_BONUS_BORDER, 1 
level85: 
                    dw       20                           ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern1              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns4 
                    dw       enemyDefinitions85           ; LEVEL_ENEMY_DEFINITION 
                    db       5*16+5 
;                    db       5                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       5                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL +LEVEL_TYPE_SHOP_AFTER+ LEVEL_APPEAR_AT_WAITING 
                    db       2                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
level86: 
                    dw       20                           ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern5              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns3 
                    dw       enemyDefinitions86           ; LEVEL_ENEMY_DEFINITION 
                    db       5*16+5 
;                    db       5                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       5                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL + LEVEL_APPEAR_AT_WAITING 
                    db       2                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
level87: 
                    dw       20                           ;Level83Intro ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern4              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns2 
                    dw       enemyDefinitions87           ; LEVEL_ENEMY_DEFINITION 
                    db       5*16+3 
;                    db       5                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       3                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BIGGY + LEVEL_APPEAR_AT_WAITING 
                    db       2                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
                    dw       BirdOfPreyDefinition4 
                    db       7                            ; big Bug Count 
                    db       75                           ; bug shot delay 
level88: 
                    dw       Level88Intro_Bonus           ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern1              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns1 
                    dw       enemyDefinitions88           ; LEVEL_ENEMY_DEFINITION 
                    db       1*16+1 
;                    db       0                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       0                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BONUS + LEVEL_TYPE_WARP_AFTER 
                    db       0                            ; LEVEL_BULLET_BORDER, 1 
                    db       150                          ;LEVEL_BONUS_BORDER, 1 
level89: 
                    dw       Level89Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern4              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns3 
                    dw       enemyDefinitions89           ; LEVEL_ENEMY_DEFINITION 
                    db       6*16+2                       ; at least two attack patterns, otherwise ion easy there is NONE 
;                    db       6                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       0                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL 
                    db       3                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
level90: 
                    dw       Level90Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern4              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns4 
                    dw       enemyDefinitions90           ; LEVEL_ENEMY_DEFINITION 
                    db       1*16+8 
;                    db       0                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       8                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL +LEVEL_TYPE_SHOP_AFTER 
                    db       2                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
level91: 
                    dw       Level91Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern4              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns3 
                    dw       enemyDefinitions91           ; LEVEL_ENEMY_DEFINITION 
                    db       5*16+3 
;                    db       5                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       3                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BIGGY 
                    db       2                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
                    dw       BirdOfPreyDefinition2 
                    db       3                            ; big Bug Count 
                    db       75                           ; bug shot delay 
level92: 
                    dw       Level92Intro_Kamikaze        ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern1              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns1 
                    dw       enemyDefinitions92           ; LEVEL_ENEMY_DEFINITION 
                    db       5*16+2 
;                    db       5                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       2                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_KAMIKAZE + LEVEL_TYPE_WARP_AFTER 
                    db       2                            ; LEVEL_BULLET_BORDER, 1 
                    db       100                          ;LEVEL_BONUS_BORDER, 1 
level93: 
                    dw       Level93Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern4              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns3 
                    dw       enemyDefinitions93           ; LEVEL_ENEMY_DEFINITION 
                    db       0*16+8 
;                    db       0                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       8                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL 
                    db       3                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
level94: 
                    dw       Level94Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern2              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns4 
                    dw       enemyDefinitions94           ; LEVEL_ENEMY_DEFINITION 
                    db       8*16+0 
;                    db       8                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       0                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL 
                    db       255                          ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
level95: 
                    dw       1                            ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern4              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns3 
                    dw       enemyDefinitions95           ; LEVEL_ENEMY_DEFINITION 
                    db       8*16+8 
;                    db       8                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       8                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BIGGY + LEVEL_TYPE_SHOP_AFTER + LEVEL_APPEAR_AT_WAITING 
                    db       1                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
                    dw       BirdOfPreyDefinition5 
                    db       10                           ; big Bug Count 
                    db       75                           ; bug shot delay 
level96: 
                    dw       Level96Intro_Bonus           ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern1              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns1 
                    dw       enemyDefinitions96           ; LEVEL_ENEMY_DEFINITION 
                    db       0*16+0 
;                    db       0                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       0                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BONUS + LEVEL_TYPE_WARP_AFTER 
                    db       0                            ; LEVEL_BULLET_BORDER, 1 
                    db       150                          ;LEVEL_BONUS_BORDER, 1 
level97: 
                    dw       Level97Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern2              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns4 
                    dw       enemyDefinitions97           ; LEVEL_ENEMY_DEFINITION 
                    db       7*16+1 
;                    db       7                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       1                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL 
                    db       255                          ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
level98: 
                    dw       Level98Intro                 ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern1              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns4 
                    dw       enemyDefinitions98           ; LEVEL_ENEMY_DEFINITION 
                    db       1*16+9 
;                    db       1                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       9                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_NORMAL 
                    db       255                          ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
level99: 
                    dw       1                            ; LEVEL_INTRO_PATTERN 
                    dw       waitingPattern4              ; LEVEL_WAITING_PATTERN 
                    dw       attackPatterns3 
                    dw       enemyDefinitions99           ; LEVEL_ENEMY_DEFINITION 
                    db       8*16+8 
;                    db       8                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       8                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BIGGY + LEVEL_APPEAR_AT_WAITING 
                    db       1                            ; LEVEL_BULLET_BORDER, 1 
                    db       50                           ;LEVEL_BONUS_BORDER, 1 
                    dw       BirdOfPreyDefinition6 
                    db       6                            ; big Bug Count 
                    db       75                           ; bug shot delay 
;
;
level25_Boss2_Queen: 
                    dw       0                            ; LEVEL_INTRO_PATTERN 
                    dw       0                            ; LEVEL_WAITING_PATTERN 
                    dw       0 
                    dw       0                            ; LEVEL_ENEMY_DEFINITION 
                    db       0                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       0                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BOSS2             ; 
                    db       0                            ; LEVEL_BULLET_BORDER, 1 
                    db       0                            ; LEVEL_BONUS_BORDER, 1 
level50_Boss3_sinistar 
                    dw       0                            ; LEVEL_INTRO_PATTERN 
                    dw       0                            ; LEVEL_WAITING_PATTERN 
                    dw       0 
                    dw       0                            ; LEVEL_ENEMY_DEFINITION 
                    db       0                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       0                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BOSS3             ; 
                    db       0                            ; LEVEL_BULLET_BORDER, 1 
                    db       0                            ; LEVEL_BONUS_BORDER, 1 
level75_Boss4_deathstar: 
                    dw       0                            ; LEVEL_INTRO_PATTERN 
                    dw       0                            ; LEVEL_WAITING_PATTERN 
                    dw       0 
                    dw       vaderDefinition              ; LEVEL_ENEMY_DEFINITION 
                    db       4*16+0 
;                    db       4                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       0                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BOSS4             ; 
                    db       3                            ; LEVEL_BULLET_BORDER, 1 
                    db       0 
level100_Boss1_Borg: 
                    dw       0                            ; LEVEL_INTRO_PATTERN 
                    dw       0                            ; LEVEL_WAITING_PATTERN 
                    dw       0 
                    dw       0                            ; LEVEL_ENEMY_DEFINITION 
                    db       0                            ; LEVEL_MAX_SHOTS_IN_AIR max shots in the air 
;                    db       0                            ; LEVEL_MAX_ATTACK_PATTERNS max Attack Patterns in this level allowed - 
                    db       LEVEL_TYPE_BOSS1             ; 
                    db       0                            ; LEVEL_BULLET_BORDER, 1 
                    db       0 
