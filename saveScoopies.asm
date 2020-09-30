; bank 2
; this entire file is only for saving stack!
; scoopy 1 always last
; scoopy 2 always second last
; plus 15 for minestorm save
SAVE1_ENEMY_ADDRESS  =       playershotobject_list_end - EnemyStruct-6 ; playershotobject_list +15 
SAVE2_ENEMY_ADDRESS  =       playershotobject_list_end - (EnemyStruct*2+6) ; playershotobject_list + EnemyStruct +15 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; saves the scoopies to a save position (in playershotObject list)
; save for minestorm
; save for Warp
ensureScoopiesSafety                                      ;#isfunction  
                    SCOOPY_SAVE  
                    rts      

; copyies scoopies from their current posiion
; to the beginning of an enemy list
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ensureScoopiesLoaded                                      ;#isfunction  
                    SCOOPY_LOAD  
                    rts      
