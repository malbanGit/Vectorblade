                    org      end_static_ram 
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
; less shots with NMI to
; prevent stack overflow!
 if  NMI_HANDLER = 1 
MAX_SHOT_OBJECTS_BOSS  =     15                           ; shots are extended over stars and bonus during boss fight! 
MAX_SHOT_OBJECTS    =        8 
 else  
MAX_SHOT_OBJECTS_BOSS  =     19                           ; shots are extended over stars and bonus during boss fight! 
MAX_SHOT_OBJECTS    =        10 
 endif  
shotobject_list     ds       ShotStruct*(MAX_SHOT_OBJECTS) 
shotobject_list_end  ds      0 
shotobject_list_end19  =     shotobject_list+ShotStruct*(MAX_SHOT_OBJECTS_BOSS) 
; only to identify objects in RAM
shotobject1         =        shotobject_list 
shotobject2         =        shotobject_list + 01*ShotStruct 
shotobject3         =        shotobject_list + 02*ShotStruct 
shotobject4         =        shotobject_list + 03*ShotStruct 
shotobject5         =        shotobject_list + 04*ShotStruct 
shotobject6         =        shotobject_list + 05*ShotStruct 
shotobject7         =        shotobject_list + 06*ShotStruct 
shotobject8         =        shotobject_list + 07*ShotStruct 
shotobject9         =        shotobject_list + 08*ShotStruct 
shotobject10        =        shotobject_list + 09*ShotStruct 
;
 if  USE_BIG_STACK = 1 
MAX_BONUS_OBJECTS   =        4 
 else  
MAX_BONUS_OBJECTS   =        6 
 endif  
bonusobject_list    ds       BonusStruct*(MAX_BONUS_OBJECTS) 
bonusobject_list_end  ds     0 
; only to identify objects in RAM
bonusobject1        =        bonusobject_list 
bonusobject2        =        bonusobject_list + 01*BonusStruct 
bonusobject3        =        bonusobject_list + 02*BonusStruct 
bonusobject4        =        bonusobject_list + 03*BonusStruct 
bonusobject5        =        bonusobject_list + 04*BonusStruct 
bonusobject6        =        bonusobject_list + 05*BonusStruct 
;
MAX_STAR_OBJECTS_WARP  =     19                           ;20 ; stars are expanded in warp into the enemy region 
MAX_STAR_OBJECTS    =        5 
starobject_list     ds       StarStruct*(MAX_STAR_OBJECTS ) 
starobject_list_end  ds      0 
; only to identify objects in RAM
starobject1         =        starobject_list 
starobject2         =        starobject_list + 01*StarStruct 
starobject3         =        starobject_list + 02*StarStruct 
starobject4         =        starobject_list + 03*StarStruct 
starobject5         =        starobject_list + 04*StarStruct 
 if  RECORD_GAME_DATA = 1 
MAX_STAR_OBJECTS    =        2                            ; #noDoubleWarn 
putByteRAM          =        starobject3 
 endif  
;
MAX_ENEMY_OBJECTS_BOSS3  =   15 
MAX_ENEMY_OBJECTS_BOSS4  =   5 
MAX_ENEMY_OBJECTS   =        20 
enemyobject_list    ds       EnemyStruct*(MAX_ENEMY_OBJECTS ) 
enemyobject_list_end  ds     0 
; only to identify objects in RAM
enemyobject1        =        enemyobject_list 
enemyobject2        =        enemyobject_list + 01*EnemyStruct 
enemyobject3        =        enemyobject_list + 02*EnemyStruct 
enemyobject4        =        enemyobject_list + 03*EnemyStruct 
enemyobject5        =        enemyobject_list + 04*EnemyStruct 
enemyobject6        =        enemyobject_list + 05*EnemyStruct 
enemyobject7        =        enemyobject_list + 06*EnemyStruct 
enemyobject8        =        enemyobject_list + 07*EnemyStruct 
enemyobject9        =        enemyobject_list + 08*EnemyStruct 
enemyobjecta        =        enemyobject_list + 09*EnemyStruct 
enemyobjectb        =        enemyobject_list + 10*EnemyStruct 
enemyobjectc        =        enemyobject_list + 11*EnemyStruct 
enemyobjectd        =        enemyobject_list + 12*EnemyStruct 
enemyobjecte        =        enemyobject_list + 13*EnemyStruct 
enemyobjectf        =        enemyobject_list + 14*EnemyStruct 
enemyobjectg        =        enemyobject_list + 15*EnemyStruct 
enemyobjecth        =        enemyobject_list + 16*EnemyStruct 
enemyobjecti        =        enemyobject_list + 17*EnemyStruct 
enemyobjectj        =        enemyobject_list + 18*EnemyStruct 
enemyobjectk        =        enemyobject_list + 19*EnemyStruct 
;
MAX_PLAYERSHOT_OBJECTS  =    10 
 if  RECORD_GAME_DATA = 1 
MAX_PLAYERSHOT_OBJECTS  =    9                            ; #noDoubleWarn 
 endif  
playershotobject_list  ds    PlayerShotStruct*(MAX_PLAYERSHOT_OBJECTS) 
playershotobject_list_end  ds  0 
; only to identify objects in RAM
playerShotobject1   =        playershotobject_list 
playerShotobject2   =        playershotobject_list + 01*PlayerShotStruct 
playerShotobject3   =        playershotobject_list + 02*PlayerShotStruct 
playerShotobject4   =        playershotobject_list + 03*PlayerShotStruct 
playerShotobject5   =        playershotobject_list + 04*PlayerShotStruct 
playerShotobject6   =        playershotobject_list + 05*PlayerShotStruct 
playerShotobject7   =        playershotobject_list + 06*PlayerShotStruct 
playerShotobject8   =        playershotobject_list + 07*PlayerShotStruct 
playerShotobject9   =        playershotobject_list + 08*PlayerShotStruct 
playerShotobjecta   =        playershotobject_list + 09*PlayerShotStruct 
;
; reuse
FIREWOKRS_PARTICLE_COUNT  =  30 
fwobject_list       =        enemyobject_list 
fwobject_list_end   =        fwobject_list + (FIREWOKRS_PARTICLE_COUNT * VelocityParticle) 
; must be smaller than  playershotobject_list_end  - (EnemyStruct*2)
;
MAX_SWARM_OBJECTS   =        30                           ;7 
swarmobject_list    =        bonusobject_list 
swarmobject_list_end  =      enemyobject_list_end +SwarmEnemy*(MAX_SWARM_OBJECTS ) 
; game over candle
candle1             =        playerShotobject6 
ccounter            =        playerShotobject5 
cDisplayCounter     =        ccounter+1 
baseLight           =        cDisplayCounter+1 
waiterVal           =        baseLight+1 
BIGGESTX            =        waiterVal+1                  ; = 10 
LOWESTX             =        BIGGESTX+1                   ; = -10 
BIGGESTY            =        LOWESTX+1                    ; = 10 
LOWESTY             =        BIGGESTY+1                   ; = 0 ;-5 -10 
phase               =        LOWESTY+1 
smoke               =        candle1 
;-----
; 
; here after comes directly the STACK
;
; on occasion stack overwrite the last player shot,
; but SUPPOSEDLY only when no player shots are active.
; Known:
; - Achievement display
; - VecVox on level intro display
; - playing music pieces (e.g. intro to boss)
; - boss kills player (shots are not drawn anymore)
