; bank 3
; attack patterns in increasing difficulty
;
; attackRightStupid - kamikaze absolut
; attackLeftStupid - kamikaze absolut
; attackMiddleStupid - kamikaze absolut
; attackLoopingAndFlyRight - fly by
; attackLoopingAndFlyLeft - fly by
; attackDirect2 - attack direct
; attackDropDead
; attackSingleLooping - attack direct fast
; attackMiddleZigZag
; attackDirect4 - attack direct fast
; ****************************************************************************************************
; 4 pointer to "possible" attack patters for this level
attackPatterns0 
                    dw       attackMiddleStupid 
                    dw       attackRightStupid 
                    dw       attackMiddleStupid 
                    dw       attackLeftStupid 
attackPatterns1 
                    dw       attackLoopingAndFlyRight 
                    dw       attackLoopingAndFlyLeft 
                    dw       attackLoopingAndFlyRight 
                    dw       attackLoopingAndFlyLeft 
attackPatterns2 
                    dw       attackLoopingAndFlyRight 
                    dw       attackLoopingAndFlyLeft 
                    dw       attackSingleLooping 
                    dw       attackDirect2 
attackPatterns3 
                    dw       attackLoopingAndFlyRight 
                    dw       attackDirect2 
                    dw       attackDirect4 
                    dw       attackSingleLooping 
attackPatterns4 
                    dw       attackLoopingAndFlyLeft 
                    dw       attackDropDead 
                    dw       attackMiddleZigZag 
                    dw       attackSingleLooping 
attackPatternsIntro 
                    dw       attackDirect2 
                    dw       attackMiddleZigZagDirect 
                    dw       attackDirect4 
                    dw       attackDropDead 
;
; Single attack pattern
; TYPE of pattern, pattern address/data
; SINGLE_ATTACK_RELATIVE_PATTERN  =  0                      ; relative means - it uses the current address of the enemy as start 
; SINGLE_ATTACK_TARGET_ENEMY_PATTERN  =  1                  ; TARGET - uses somehow the players coordinate as coordinate info 
; SINGLE_ATTACK_ABSOLUT_PATTERN  =  -1                      ; moves from current position to an absolut screen position 
; struct SingleAttackPatternLine
;      ds SINGLE_ATTACK_PATTERN_TYPE,2
;      ds SINGLE_ATTACK_PATTERN_POINTER,2 ; when pointer = 0, than end of list
;  end struct
; pointer to 0 subpattern = end of pattern collection
; db speed
; db type
; dw pointer or db y,x pos
attackMiddleStupid 
                    dw       0+SINGLE_ATTACK_RELATIVE_PATTERN, singleLoopingOnlyPattern 
                    db       1,SINGLE_ATTACK_ABSOLUT_PATTERN 
                    db       -$7d, $00                    ; go down move to absolut screen position -128 ,0 bottom middle 
                    dw       0,0                          ; end is delay and go home 
attackLeftStupid 
                    dw       0+SINGLE_ATTACK_RELATIVE_PATTERN, singleLoopingOnlyPattern 
                    db       1,SINGLE_ATTACK_ABSOLUT_PATTERN 
                    db       -$7d, -$60                   ; go down move to absolut screen position -128 ,0 bottom middle 
                    dw       0,0                          ; end is delay and go home 
attackRightStupid 
                    dw       0+SINGLE_ATTACK_RELATIVE_PATTERN, singleLoopingOnlyPattern 
                    db       1,SINGLE_ATTACK_ABSOLUT_PATTERN 
                    db       -$7d, $60                    ; go down move to absolut screen position -128 ,0 bottom middle 
                    dw       0,0                          ; end is delay and go home 
attackDirect2 
                    db       2, SINGLE_ATTACK_TARGET_ENEMY_PATTERN,0,0 ; end is delay and go home 
;
                    dw       0,0                          ; end is delay and go home 
attackDirect4 
                    db       3, SINGLE_ATTACK_TARGET_ENEMY_PATTERN,0,0 ; end is delay and go home 
;
                    dw       0,0                          ; end is delay and go home 
attackLoopingAndFlyRight 
                    dw       0+SINGLE_ATTACK_RELATIVE_PATTERN, singleLoopingOnlyPattern 
                    db       1,SINGLE_ATTACK_ABSOLUT_PATTERN 
                    db       $20, $60                     ; go down move to absolut screen position -128 ,0 bottom middle 
                    db       2,SINGLE_ATTACK_ABSOLUT_PATTERN 
                    db       -$58, $60                    ; go down move to absolut screen position -128 ,0 bottom middle 
                    db       3,SINGLE_ATTACK_ABSOLUT_PATTERN 
                    db       -$58, $80                    ; go down move to absolut screen position -128 ,0 bottom middle 
                                                          ; db 0, SINGLE_ATTACK_JUMP 
                                                          ;dw attackMiddleLoopEndless 
                    dw       0,0                          ; end is delay and go home 
attackMiddleLoopEndless 
                    db       1,SINGLE_ATTACK_ABSOLUT_PATTERN 
                    db       $0, $0                       ; go down move to absolut screen position -128 ,0 bottom middle 
                    dw       0+SINGLE_ATTACK_RELATIVE_PATTERN, singleLoopingOnlyPattern 
                    db       0, SINGLE_ATTACK_JUMP 
                    dw       attackMiddleLoopEndless 
attackLoopingAndFlyLeft 
                    dw       0+SINGLE_ATTACK_RELATIVE_PATTERN, singleLoopingOnlyPattern 
                    db       1,SINGLE_ATTACK_ABSOLUT_PATTERN 
                    db       $20, -$60                    ; go down move to absolut screen position -128 ,0 bottom middle 
                    db       2,SINGLE_ATTACK_ABSOLUT_PATTERN 
                    db       -$40, -$60                   ; go down move to absolut screen position -128 ,0 bottom middle 
                    db       3,SINGLE_ATTACK_ABSOLUT_PATTERN 
                    db       -$40, $7f                    ; go down move to absolut screen position -128 ,0 bottom middle 
                    dw       0,0                          ; end is delay and go home 
attackSingleLooping 
                    dw       0+SINGLE_ATTACK_RELATIVE_PATTERN, singleLoopingRelativePattern 
;
                    db       3,SINGLE_ATTACK_ABSOLUT_PATTERN 
                    db       0, 0                         ; go down move to absolut screen position -128 ,0 bottom middle 
;
                    db       3, SINGLE_ATTACK_TARGET_ENEMY_PATTERN,0,0 ; end is delay and go home 
;
                    dw       0,0                          ; end is delay and go home 
;........
attackMiddleZigZag 
                    dw       0+SINGLE_ATTACK_RELATIVE_PATTERN, singleLoopingOnlyPattern 
attackMiddleZigZagDirect 
                    db       3,SINGLE_ATTACK_ABSOLUT_PATTERN 
                    db       $00, $00                     ; go down move to absolut screen position -128 ,0 bottom middle 
                    dw       0+SINGLE_ATTACK_RELATIVE_PATTERN, attackZig 
                    dw       0+SINGLE_ATTACK_RELATIVE_PATTERN, attackZag 
                    dw       0+SINGLE_ATTACK_RELATIVE_PATTERN, attackZig 
                    dw       0+SINGLE_ATTACK_RELATIVE_PATTERN, attackZag 
                    dw       0+SINGLE_ATTACK_RELATIVE_PATTERN, attackZig 
                    dw       0+SINGLE_ATTACK_RELATIVE_PATTERN, attackZag 
                    db       2, SINGLE_ATTACK_TARGET_ENEMY_PATTERN,0,0 ; end is delay and go home 
                    dw       0,0                          ; end is delay and go home 
;........
attackDropDead 
                    db       1,SINGLE_ATTACK_ABSOLUT_PATTERN 
                    db       $40, $00                     ; go down move to absolut screen position -128 ,0 bottom middle 
                    db       3,SINGLE_ATTACK_ABSOLUT_PATTERN 
                    db       $30, $70                     ; go down move to absolut screen position -128 ,0 bottom middle 
                    db       3,SINGLE_ATTACK_ABSOLUT_PATTERN 
                    db       $20, -$70                    ; go down move to absolut screen position -128 ,0 bottom middle 
                    db       3,SINGLE_ATTACK_ABSOLUT_PATTERN 
                    db       $10, $0                      ; go down move to absolut screen position -128 ,0 bottom middle 
                    db       3, SINGLE_ATTACK_TARGET_ENEMY_PATTERN,0,0 ; end is delay and go home 
                    dw       0,0                          ; end is delay and go home 
;........
; this one lets the attacker fly a looping from the current position
; and ends at the same position, but head pointing downwards
; start address is realtive and taken as 0,0
; internal coordinates are realtive as well
singleLoopingRelativePattern                              ;  speed 100 
                    db       10 , 0 
                    dw       100 , 0 
                    db       ( 0 /ANGLE_DIF)*2 , 2        ; P_PATTERN_TARGET_RADIUS 
;
                    db       10 , 10 
                    dw       70 , 70 
                    db       ( 45 /ANGLE_DIF)*2 , 2 
;
                    db       0 , 10 
                    dw       0 , 100 
                    db       ( 90 /ANGLE_DIF)*2 , 2 
;
                    db       -10 , 10 
                    dw       -71 , 70 
                    db       ( 135 /ANGLE_DIF)*2 , 2 
;
                    db       -10 , 0 
                    dw       -100 , 0 
                    db       ( 180 /ANGLE_DIF)*2 , 2 
;
                    db       -10 , 0 
                    dw       -100 , 0 
                    db       ( 180 /ANGLE_DIF)*2 , 2 
;
                    db       -90 , -30 
                    dw       -380 , -127 
                    db       ( (198+ANGLE_DIF/2) /ANGLE_DIF)*2 , 2 
;
                    dw       0,0,0,0 
singleLoopingOnlyPattern                                  ;  speed 100 
                    db       10 , 0 
                    dw       100 , 0 
                    db       ( 0 /ANGLE_DIF)*2 , 2 
;
                    db       10 , 10 
                    dw       70 , 70 
                    db       ( 45 /ANGLE_DIF)*2 , 2 
;
                    db       0 , 10 
                    dw       0 , 100 
                    db       ( 90 /ANGLE_DIF)*2 , 2 
;
                    db       -10 , 10 
                    dw       -71 , 70 
                    db       ( 135 /ANGLE_DIF)*2 , 2 
;
                    db       -10 , 0 
                    dw       -100 , 0 
                    db       ( 180 /ANGLE_DIF)*2 , 2 
;
                    db       -10 , 0 
                    dw       -100 , 0 
                    db       ( 180 /ANGLE_DIF)*2 , 2 
;
                    dw       0,0,0,0 
attackZig                                                 ;        speed 400 
                    db       -10 , 50 
                    dw       -118 , 588 
                    db       (( 102 /ANGLE_DIF)*2)%16 , 3 
                    dw       0,0,0,0 
attackZag                                                 ;        speed 400 
                    db       -10 , -50 
                    dw       -118 , -589 
                    db       (( 258 /ANGLE_DIF)*2)%16 , 3 
                    dw       0,0,0,0 
