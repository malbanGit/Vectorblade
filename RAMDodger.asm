                    org      starobject_list + 3*StarStruct 
;
;***************************************************************************
; Variable / RAM SECTION
;***************************************************************************
; insert your variables (RAM usage) in the BSS section
; user RAM starts at $c880 
;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Game vars
;;;;;;;;;;;;;;;;;;;;;;;;;
;
; followed by the storage area for abve defined lists
;
;
MAX_DODGE_OBJECTS   =        16                           ; must be smaller ENEMY OBJECT 
dodgeObject_list    ds       EnemyStruct*(MAX_DODGE_OBJECTS) 
dodgeObject_list_end  ds     0 
oldString           ds       3 
bonusCollectSave    ds       1 
levelCountSave      ds       1 
dodgerGotKilled     ds       1 
isDiamondRun        ds       1 
textIntensity       ds       0 
dodgerAngle1        ds       1 
textFadeDirection   ds       0 
dodgerAngle2        ds       1 
landingbayPos       ds       0                            ; word 3 byte! x = word 
fighterPos          ds       0                            ; word 
textPointer         ds       0                            ; word 
dodgerAngle3        ds       1 
dodgerAngle4        ds       1 
textDisplayDone     ds       0 
dodgerAccel         ds       2 
dodgeResult         =        dodgerAngle4 
dodgerProgress      ds       2 
dodgerFinishedIndicator  ds  1 
rotateBuf 
landingFighterXSpeed16  ds   0 
ROT_MINE1                                                 ;        'DUMB' MINE 
                    ds       7*3+1 
ROT_MINE2                                                 ;        'MAGNETIC' MINE 
                    ds       9*3+1 
ROT_MINE3                                                 ;        'DUMB FIRE-BALL' MINE 
                    ds       10*3+1 
ROT_MINE4                                                 ;        'MAGNETIC FIRE-BALL' MINE 
                    ds       10*3+1 
