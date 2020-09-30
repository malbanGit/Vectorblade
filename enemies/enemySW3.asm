enemySW3DefinitionShield 
enemySW3Definition_shield 
                    dw       EnemySW3Angle8Table 
                    db       17 
                    dw       EnemySW3WaitAnim 
                    db       0,TYPE_DIRECT_WAIT+TYPE_DONT_SHOOT+TYPE_DONT_ATTACK + TYPE_SHIELD 
EnemySW3Angle8Table 
                    DW       Blob_0                       ; list of all single vectorlists in this 
                    DW       Blob_1 
                    DW       Blob_2 
                    DW       Blob_1 
EnemySW3WaitAnim 
                    DW       Blob_0                       ; list of all single vectorlists in this 
                    DW       Blob_1 
                    DW       Blob_2 
                    DW       Blob_1 
                    DW       0 
Blob_0 
                    db       $0F, $01, $02, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $10, $01, $2B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1D, $01, $1A, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $2A, $01, $0E 
                    db       $2B, $01, -$10 
                    db       $1A, $01, -$1D 
                    db       $0E, $01, -$2A 
                    db       -$10, $01, -$2B 
                    db       -$1D, $01, -$1A 
                    db       -$2A, $01, -$0E, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$2B, $01, $10 
                    db       -$1A, $01, $1D 
                    db       -$0E, $01, $2A 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Blob_1 
                    db       $18, $01, $01, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $0F, $01, $27, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $19, $01, $18, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $25, $01, $0C 
                    db       $27, $01, -$0F 
                    db       $18, $01, -$19 
                    db       $0C, $01, -$25 
                    db       -$0F, $01, -$27 
                    db       -$19, $01, -$18 
                    db       -$25, $01, -$0C, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$27, $01, $0F 
                    db       -$18, $01, $19 
                    db       -$0C, $01, $25 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Blob_2 
                    db       $1F, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $0E, $01, $24, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $17, $01, $15, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $20, $01, $0C 
                    db       $24, $01, -$0E 
                    db       $15, $01, -$17 
                    db       $0C, $01, -$20 
                    db       -$0E, $01, -$24 
                    db       -$17, $01, -$15 
                    db       -$20, $01, -$0C, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$24, $01, $0E 
                    db       -$15, $01, $17 
                    db       -$0C, $01, $20 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
