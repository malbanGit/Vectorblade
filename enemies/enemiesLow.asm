enemySaucerDefinition 
REPLACE_0_2_SaucerWindowAnim_varFromIRQ1_1                ;  bank 1 replace 
                    dw       0                            ;SaucerWindowAnim 
                    db       0 
REPLACE_0_2_SaucerWindowAnim_varFromIRQ1_2                ;  bank 1 replace 
                    dw       0                            ;SaucerWindowAnim 
                    db       0,0                          ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemyMoneyMothershipDefinition 
REPLACE_0_2_MoneyMothershipAnim_varFromIRQ1_1             ;  bank 1 replace 
                    dw       0                            ;MoneyMothershipAnim 
                    db       0 
REPLACE_0_2_MoneyMothershipAnim_varFromIRQ1_2             ;  bank 1 replace 
                    dw       0                            ;MoneyMothershipAnim 
                    db       0,0                          ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemyMegaFiend 
REPLACE_0_2_MegaFiendAnim_varFromIRQ1_1                   ;  bank 1 replace 
                    dw       0                            ;MegaFiendAnim 
                    db       0 
REPLACE_0_2_MegaFiendAnim_varFromIRQ1_2                   ;  bank 1 replace 
                    dw       0                            ;MegaFiendAnim 
                    db       0,0                          ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemyMoneySucker 
REPLACE_0_2_MoneySuckerBaseAnim_varFromIRQ1_1             ;  bank 1 replace 
                    dw       0                            ;MoneySuckerBaseAnim 
                    db       0 
REPLACE_0_2_MoneySuckerBaseAnim_varFromIRQ1_2             ;  bank 1 replace 
                    dw       0                            ;MoneySuckerBaseAnim 
higherThanBiggies 
                    db       0,0                          ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
                    include  "enemies/enemy1.asm"
                    include  "enemies/enemy2.asm"
                    include  "enemies/enemy3.asm"         ; blocker
                    include  "enemies/enemy4.asm"
                    include  "enemies/enemySin1.asm"
                    include  "enemies/enemySin2.asm"
                    include  "enemies/enemySin3.asm"
                    include  "enemies/bugs.asm"
                    include  "enemies/swarmer.asm"
failureBug1Definition 
                    dw       0                            ;not used MUST be zero to identify a bug enemy 
                    db       100                          ; hp 
REPLACE_0_2_WarperAnimData_varFromIRQ1_1                  ;  bank 1 replace 
                    dw       0                            ; WarperAnimData 
                    db       3,TYPE_NONE                  ;1+128 ,TYPE_NONE ; bullet speed and is missile 
