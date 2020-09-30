bossfightStart      =        enemyobject_list_end -5*BonusStruct ;enemyobject_list+ 10 *MAX_ENEMY_OBJECTS 
                    org      bossfightStart 
; 23 byte following
introBossX          =        bossPosY 
introPlayerX        =        bossPosX 
bossPosY            ds       1 
bossPosX            ds       1 
bossMoveDir         ds       1 
bossTimer           ds       2 
explosionCount      ds       0 
bossHP              ds       2 
bossExtroPointer    ds       0 
bossWasHit          ds       1 
tmp3                ds       1 
bossfightStart_second  ds    0 
bossExplosionSpace1  =       starobject_list              ; ??? bossMoveDir 
bossExplosionSpace2  =       bossExplosionSpace1 + BossExplosion 
bossExplosionSpace3  =       bossExplosionSpace2 + BossExplosion 
; BOSS 1
boss1Scale=boss3Xpos16 
                    org      bossfightStart_second 
leftSmallGunAnimDelayCounter  ds  1 
eyeLeftAnimDelayCounter  ds  1 
eyeLeftAnimCounter  ds       1 
leftSmallGunAnimCounter  ds  1 
leftSmallGunAnimStart  ds    1 
rightSmallGunAnimDelayCounter  ds  1 
rightSmallGunAnimCounter  ds  1 
rightSmallGunAnimStart  ds   1 
leftBigGunAnimDelayCounter  ds  1 
leftBigGunAnimCounter  ds    1 
leftBigGunAnimStart  ds      1 
rightBigGunAnimDelayCounter  ds  1 
rightBigGunAnimCounter  ds   1 
rightBigGunAnimStart  ds     1 
calibrationStage    ds       0 
; BOSS 2
                    org      bossfightStart_second 
swarmCounter        ds       1 
intensityBoss2Intro  ds      1 
antennaDelayCounter  ds      1 
antennaAnimCounter  ds       1 
boss2Scale          ds       1 
boss2Direction      ds       1                            ; 1 = grow; 0 = shrink 
maxSwarmAttacker    ds       1                            ; 1 = grow; 0 = shrink 
; BOSS 3
                    org      bossfightStart_second 
boss3MouthAnimCounter  ds    1 
boss3AttachmentScale  ds     1 
boss3LetterCannonPointer  ds  2 
boss3LetterCannonWait  ds    1 
boss3ShieldCount    ds       1 
boss3HPCompare      ds       2 
boss3MovementPointer  ds     2 
boss3YposNow16      ds       2 
boss3XposNow16      ds       2 
                    org      bossfightStart -4 
; four to much!
boss3Ypos16         ds       2 
boss3Xpos16         ds       2 
; BOSS 4
                    org      enemyobject_list_end -10*EnemyStruct 
boss4WeaponAnimCounter  ds   1 
boss4WeaponActive   ds       1 
boss4ShotStage      ds       1 
boss4ShotStageDelayCounter  ds  1 
boss4ShotLineCounter  ds     1 
boss4LaserStartTmp  ds       2 
boss4LaserTargetTmp  ds      2 
maxYSum             ds       1 
lukeX               ds       1 
displayExplosions   ds       1 
BOSS4_LASER_COUNT   =        3 
                    struct   Boss4LaserBeam 
                    ds       boss4LaserTarget, 2 
                    ds       boss4shotMax, 1 
                    ds       boss4shotMin, 1 
                    end struct 
                    struct   Boss4GroundExplosion 
                    ds       ExPosy, 1 
                    ds       ExPosx, 1 
                    ds       ExSizeCounter, 1 
                    ds       ExSize, 1 
                    end struct 
; org bossfightStart -4- BOSS4_LASER_COUNT*(Boss4LaserBeam+Boss4GroundExplosion)
signFlag            ds       1 
b4_divide_tmp       ds       1 
b4_tmp1             ds       2 
b4_tmp2             ds       1 
boss4laserData      ds       Boss4LaserBeam * BOSS4_LASER_COUNT 
boss4explosionData  ds       Boss4GroundExplosion * BOSS4_LASER_COUNT 
