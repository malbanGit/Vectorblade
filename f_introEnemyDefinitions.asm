; bank 3
; ****************************************************************************************************
enemyDefinitions1: 
                    db       1                            ; after 1 repeat 
                    dw       enemy1Definition 
enemyDefinitions2: 
                    db       1                            ; after 1 repeat 
                    dw       enemy2Definition 
enemyDefinitions3: 
                    db       2                            ; after 2 repeat 
                    dw       enemy2Definition2 
                    dw       enemy1Definition2 
enemyDefinitions4   =        enemyDefinitions3 
enemyDefinitions5   =        enemyDefinitions3 
enemyDefinitions6: 
                    db       2                            ; after 2 repeat 
                    dw       enemy1Definition, enemy1Definition_dw 
enemyDefinitions7: 
                    db       3                            ; after 2 repeat 
                    dw       enemy1Definition, enemy1Definition_dw , enemy2Definition_dw 
enemyDefinitions8   =        enemyDefinitions3 
enemyDefinitions9   =        enemyDefinitions3 
enemyDefinitions10: 
                    db       4                            ; after 2 repeat 
                    dw       enemy1Definition, enemy2Definition, enemy2Definition, enemy4Definition 
enemyDefinitions11  =        enemyDefinitions3 
enemyDefinitions12: 
                    db       2                            ; after 2 repeat 
                    dw       enemy2Definition 
                    dw       enemy1Definition 
enemyDefinitions13: 
                    db       6                            ; after 6 repeat 
                    dw       enemy1Definition_dw, enemy1Definition2, enemy1Definition_dw, enemy2Definition2, enemy2Definition_dw, enemy4Definition 
enemyDefinitions14: 
                    db       6                            ; after 6 repeat 
                    dw       enemy1Definition_dw, enemy1Definition2, enemy1Definition_dw, enemy4Definition, enemy2Definition_dw, enemy4Definition 
enemyDefinitions15  =        enemyDefinitions14 
enemyDefinitions16  =        enemyDefinitions12 
enemyDefinitions17: 
                    db       3                            ; after 2 repeat 
                    dw       enemy1Definition2, enemy2Definition2, enemy4Definition2 
enemyDefinitions18: 
                    db       2                            ; after 2 repeat 
                    dw       enemy1Definition3, enemy2Definition2 
enemyDefinitions19  =        enemyDefinitions18 
enemyDefinitions20  =        enemyDefinitions10 
enemyDefinitions21: 
                    db       2                            ; after 2 repeat 
                    dw       enemy1Definition3, enemy2Definition2 
enemyDefinitions22: 
                    db       6                            ; after 2 repeat 
                    dw       enemy1Definition3, enemy2Definition3, enemy4Definition, enemy1Definition_dw, enemy2Definition_dw, enemy2Definition_dw 
enemyDefinitions23  =        enemyDefinitions22 
enemyDefinitions24: 
                    db       2                            ; after 2 repeat 
                    dw       enemy1Definition3, enemy2Definition3 
enemyDefinitions25: 
                    db       2                            ; after 1 repeat 
                    dw       enemySin1Definition , enemySin2Definition 
enemyDefinitions26: 
                    db       4                            ; after 4 repeat 
                    dw       enemySin1Definition_noID, enemySin1Definition , enemySin2Definition_noID , enemySin2Definition 
enemyDefinitions27  =        enemyDefinitions26 
enemyDefinitions28 
                    db       2 
                    dw       enemySin1Definition_noShot , enemySin2Definition_noShot 
enemyDefinitions29: 
                    db       6                            ; after 6 repeat 
                    dw       enemySin1Definition_noID, enemySin2Definition_noID 
                    dw       enemySin1Definition_noID, enemySin2Definition_noID 
                    dw       enemySin1Definition, enemySin2Definition 
enemyDefinitions30: 
                    db       2                            ; after 1 repeat 
                    dw       enemySin1Definition_debris , enemySin2Definition 
enemyDefinitions31  =        enemyDefinitions25 
enemyDefinitions32: 
                    db       2                            ; after 1 repeat 
                    dw       enemySin1Definition_bonus , enemySin2Definition_bonus 
enemyDefinitions33: 
                    db       8                            ; after 1 repeat 
                    dw       enemySin1Definition_glas_debris_wait , enemySin2Definition_glas_debris_wait 
                    dw       enemySin1Definition_glas_debris_wait , enemySin2Definition_glas_debris_wait 
                    dw       enemySin1Definition_glas_debris_wait , enemySin2Definition_glas_debris_wait 
                    dw       enemySin1Definition_debris , enemySin2Definition_debris 
enemyDefinitions34  =        enemyDefinitions33 
enemyDefinitions35: 
                    db       2                            ; after 1 repeat 
                    dw       enemySin1Definition, enemySin2Definition 
enemyDefinitions36: 
                    db       3                            ; after 1 repeat 
                    dw       enemySin1Definition, enemySin2Definition, enemySin3Definition 
enemyDefinitions37: 
                    db       1                            ; after 1 repeat 
                    dw       enemySin3Definition 
enemyDefinitions38  =        enemyDefinitions37 
enemyDefinitions39  =        enemyDefinitions36 
enemyDefinitions40  =        enemyDefinitions36 
enemyDefinitions41 
                    db       4                            ; after 4 repeat 
                    dw       enemySin1Definition_noID, enemySin2Definition_noID, enemySin3Definition, enemySin3Definition 
enemyDefinitions42  =        enemyDefinitions37 
enemyDefinitions43  =        enemyDefinitions37 
enemyDefinitions44: 
                    db       2                            ; after 2 repeat 
                    dw       enemySin1Definition_glas_debris_wait , enemySin2Definition_glas_debris_wait 
enemyDefinitions45: 
                    db       1                            ; after 2 repeat 
                    dw       enemySin2Definition_debris 
enemyDefinitions46: 
                    db       1                            ; after 2 repeat 
                    dw       enemySin1Definition_debris 
enemyDefinitions47  =        enemyDefinitions25 
enemyDefinitions48  =        enemyDefinitions36 
enemyDefinitions49  =        enemyDefinitions26 
enemyDefinitions50: 
                    db       6                            ; after 3 repeat 
                    dw       enemySW1Definition_1_wait, enemySW1Definition_2_wait, enemySW1Definition_3_wait 
                    dw       enemySW1Definition_1, enemySW1Definition_2, enemySW1Definition_3 
enemyDefinitions51: 
                    db       1                            ; after 3 repeat 
                    dw       enemySW2Definition_3 
enemyDefinitions52: 
                    db       1                            ; after 3 repeat 
                    dw       enemySW2Definition_2 
enemyDefinitions53: 
                    db       5                            ; after 3 repeat 
                    dw       enemySW3Definition_shield, enemySW3Definition_shield 
                    dw       enemySW4Definition, enemySW4Definition, enemySW4Definition 
enemyDefinitions54: 
                    db       20                           ; after 3 repeat 
                    dw       enemySW3Definition_shield, enemySW3Definition_shield, enemySW3Definition_shield, enemySW3Definition_shield, enemySW3Definition_shield 
                    dw       enemySW2Definition_1, enemySW2Definition_2, enemySW2Definition_1, enemySW2Definition_1, enemySW2Definition_2 
                    dw       enemySW1Definition_1, enemySW4Definition, enemySW4Definition, enemySW1Definition_1, enemySW1Definition_1 
                    dw       enemySW2Definition_1, enemySW2Definition_2, enemySW2Definition_1, enemySW2Definition_2, enemySW2Definition_1 
enemyDefinitions55  =        enemyDefinitions50 
enemyDefinitions56: 
                    db       2 
                    dw       enemySW1Definition_1, enemySW2Definition_1 
enemyDefinitions57 
                    db       3                            ; after 3 repeat 
                    dw       enemySW1Definition_1, enemySW1Definition_2, enemySW1Definition_3 
enemyDefinitions58 
                    db       23                           ; after 3 repeat 
                    dw       enemySW3Definition_shield, enemySW3Definition_shield, enemySW3Definition_shield 
                    dw       enemySW2Definition_1, enemySW2Definition_2, enemySW2Definition_1, enemySW2Definition_1, enemySW2Definition_2 
                    dw       enemySW1Definition_1, enemySW4Definition, enemySW4Definition, enemySW1Definition_1, enemySW1Definition_1 
                    dw       enemySW2Definition_1, enemySW2Definition_2, enemySW2Definition_1, enemySW2Definition_2, enemySW2Definition_1 
                    dw       enemySW2Definition_1, enemySW2Definition_2, enemySW2Definition_1, enemySW2Definition_2, enemySW2Definition_1 
enemyDefinitions59 
                    db       3 
                    dw       enemySW1Definition_1, enemySW2Definition_1, enemySW4Definition_1 
enemyDefinitions60 
                    db       1 
                    dw       enemySW4Definition_1 
enemyDefinitions61 
                    db       7 
                    dw       enemySW1Definition_1, enemySW2Definition_1,enemySW1Definition_1, enemySW2Definition_1, enemySW1Definition_1, enemySW2Definition_1, enemySW4Definition_1 
enemyDefinitions62  =        enemyDefinitions61 
enemyDefinitions63  =        enemyDefinitions61 
enemyDefinitions64  =        enemyDefinitions61 
enemyDefinitions65: 
                    db       20                           ; after 3 repeat 
                    dw       enemySW2Definition_1, enemySW2Definition_2, enemySW2Definition_1, enemySW2Definition_1, enemySW2Definition_2 
                    dw       enemySW2Definition_1, enemySW2Definition_2, enemySW2Definition_1, enemySW2Definition_1, enemySW2Definition_2 
                    dw       enemySW2Definition_1, enemySW4Definition, enemySW4Definition, enemySW2Definition_1, enemySW2Definition_1 
                    dw       enemySW1Definition_1, enemySW1Definition_2, enemySW1Definition_1, enemySW1Definition_2, enemySW1Definition_1 
enemyDefinitions66: 
                    db       4 
                    dw       enemySW2Definition_3_debris, enemySW2Definition_3_debris_wait 
                    dw       enemySW1Definition_3_debris, enemySW1Definition_3_debris_wait 
enemyDefinitions67  =        enemyDefinitions66 
enemyDefinitions68  =        enemyDefinitions61 
enemyDefinitions69 
                    db       7 
                    dw       enemySW1Definition_1_hp, enemySW2Definition_1_hp,enemySW1Definition_1_hp, enemySW2Definition_1_hp, enemySW1Definition_1_hp, enemySW2Definition_1_hp, enemySW4Definition_1 
enemyDefinitions70: 
                    db       6                            ; after 3 repeat 
                    dw       enemySW1Definition_1_wait, enemySW1Definition_2_wait, enemySW1Definition_3_wait 
                    dw       enemySW1Definition_1_hp, enemySW2Definition_1_hp, enemySW1Definition_1_hp 
enemyDefinitions71  =        enemyDefinitions61 
enemyDefinitions72  =        enemyDefinitions61 
enemyDefinitions73  =        enemyDefinitions61 
enemyDefinitions74  =        enemyDefinitions70 
enemyDefinitions75 
                    db       1 
                    dw       enemyTR1Definition_1 
enemyDefinitions76 
                    db       3 
                    dw       enemyTR1Definition_1, enemyTR2Definition_1, enemyTR3Definition_1 
enemyDefinitions77 
                    db       32 
                    dw       enemy3Definition, enemy3Definition, enemy3Definition, enemy3Definition, enemy3Definition 
                    dw       enemy3Definition, enemy3Definition, enemy3Definition, enemy3Definition, enemy3Definition 
                    dw       enemy3Definition, enemy3Definition 
                    dw       enemyTR1Definition_1, enemyTR2Definition_1, enemyTR3Definition_1, enemyTR1Definition_1, enemyTR2Definition_1 
                    dw       enemyTR1Definition_1, enemyTR2Definition_1, enemyTR3Definition_1, enemyTR1Definition_1, enemyTR2Definition_1 
                    dw       enemyTR1Definition_1, enemyTR2Definition_1, enemyTR3Definition_1, enemyTR1Definition_1, enemyTR2Definition_1 
                    dw       enemyTR1Definition_1, enemyTR2Definition_1, enemyTR3Definition_1, enemyTR1Definition_1, enemyTR2Definition_1 
enemyDefinitions78  =        enemyDefinitions77 
enemyDefinitions79 
                    db       4 
                    dw       enemyTR3Definition_2, enemyTR3Definition_2, enemyTR3Definition_2, enemyTR3Definition_1_clone 
enemyDefinitions80  =        enemyDefinitions76 
enemyDefinitions81 
                    db       1 
                    dw       enemyTribble 
enemyDefinitions82 
                    db       20 
                    dw       enemy3Definition, enemy3Definition, enemy3Definition, enemy3Definition, enemy3Definition 
                    dw       enemy3Definition, enemy3Definition, enemy3Definition, enemy3Definition, enemy3Definition 
                    dw       enemy3Definition, enemy3Definition 
                    dw       enemyTR3Definition_1_clone, enemyTR3Definition_1_clone, enemyTR3Definition_1_clone, enemyTR3Definition_1_clone, enemyTR3Definition_1_clone 
                    dw       enemyTR3Definition_1_clone, enemyTR3Definition_1_clone, enemyTR3Definition_1_clone 
enemyDefinitions83 
                    db       1 
                    dw       enemyTR3Definition_1_fast 
enemyDefinitions84 
                    db       1 
                    dw       enemyTR2Definition_1_fast 
enemyDefinitions85 
                    db       1 
                    dw       enemyTR1Definition_1_fast 
enemyDefinitions86  =        enemyDefinitions84 
enemyDefinitions87 
                    db       2 
                    dw       enemyTR1Definition_1_fast, enemyTR3Definition_1_fast 
enemyDefinitions88 
                    db       1 
                    dw       enemyTR2Definition_1 
enemyDefinitions89 
                    db       20 
                    dw       enemyTR3Definition_1_clone, enemyTR3Definition_1_clone, enemyTR3Definition_1_clone, enemyTR3Definition_1_clone, enemyTR3Definition_1_clone 
                    dw       enemyTR3Definition_1_clone, enemyTR3Definition_1_clone, enemyTR3Definition_1_clone, enemyTR3Definition_1_clone, enemyTR3Definition_1_clone 
                    dw       enemyTR3Definition_1_clone, enemyTR3Definition_1_clone, enemyTR3Definition_1_clone, enemyTR3Definition_1_clone 
                    dw       enemy3Definition, enemy3Definition, enemy3Definition, enemy3Definition, enemy3Definition, enemy3Definition 
enemyDefinitions90  =        enemyDefinitions89 
enemyDefinitions91 
                    db       20 
                    dw       enemyTR1Definition_1_fast, enemyTR1Definition_1_fast, enemyTR1Definition_1_fast, enemyTR1Definition_1_fast, enemyTR1Definition_1_fast 
                    dw       enemyTR1Definition_1_fast, enemyTR1Definition_1_fast, enemyTR1Definition_1_fast, enemyTR1Definition_1_fast, enemyTR1Definition_1_fast 
                    dw       enemyTR1Definition_1_fast, enemyTR1Definition_1_fast, enemyTR1Definition_1_fast, enemyTR1Definition_1_fast 
                    dw       enemy3Definition, enemy3Definition, enemy3Definition, enemy3Definition, enemy3Definition, enemy3Definition 
enemyDefinitions92 
                    db       2 
                    dw       enemyTR3Definition_1_fast, enemyTR1Definition_1_fast 
enemyDefinitions93 
                    db       1 
                    dw       enemyTR3Definition_1_clone 
enemyDefinitions94  =        enemyDefinitions93 
enemyDefinitions95  =        enemyDefinitions93 
enemyDefinitions96 
                    db       1 
                    dw       enemyTR3Definition_1 
enemyDefinitions97 
                    db       3 
                    dw       enemyTR3Definition_1_clone, enemyTR1Definition_1_fast, enemyTR2Definition_1_fast 
enemyDefinitions98  =        enemyDefinitions97 
enemyDefinitions99  =        enemyDefinitions95 
;
;
vaderDefinition 
                    db       1                            ; after 1 repeat 
                    dw       enemyVader 
