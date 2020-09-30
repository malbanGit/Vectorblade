BonusCashDoubler 
                    dw       BonusCashDoublerAnim 
                    db       BONUS_CASH_DOUBLER           ; type 
BonusCashDoublerAnim 
                    DW       BonusCashDoubler0            ; list of all single vectorlists in this 
                    DW       BonusCashDoubler1 
                    DW       BonusCashDoubler2 
                    DW       BonusCashDoubler3 
                    DW       BonusCashDoubler4 
                    DW       BonusCashDoubler5 
                    DW       BonusCashDoubler6 
                    DW       BonusCashDoubler7 
                    DW       BonusCashDoubler8 
                    DW       BonusCashDoubler7 
                    DW       BonusCashDoubler6 
                    DW       BonusCashDoubler5 
                    DW       BonusCashDoubler4 
                    DW       BonusCashDoubler3 
                    DW       BonusCashDoubler2 
                    DW       BonusCashDoubler1 
                    DW       0 
BonusCashDoubler0 
                    db       -$17, $01, $14, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$08, $01, -$0C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$10, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $1F, $01, -$11 
                    db       $1F, $01, $11 
                    db       $00, $01, $10 
                    db       -$08, $01, $0C 
                    db       $19, $01, $1C, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_0), lo(BonusCircle_0) 
BonusCashDoubler1 
                    db       -$15, $01, $14, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$08, $01, -$0C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$10, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $1D, $01, -$11 
                    db       $1D, $01, $11 
                    db       $00, $01, $10 
                    db       -$08, $01, $0C 
                    db       $18, $01, $1C, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_1), lo(BonusCircle_1) 
BonusCashDoubler2 
                    db       -$11, $01, $14, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$06, $01, -$0C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$10, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $17, $01, -$11 
                    db       $17, $01, $11 
                    db       $00, $01, $10 
                    db       -$06, $01, $0C 
                    db       $12, $01, $1C, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_2), lo(BonusCircle_2) 
BonusCashDoubler3 
                    db       -$0A, $01, $14, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$04, $01, -$0C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$10, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $0E, $01, -$11 
                    db       $0E, $01, $11 
                    db       $00, $01, $10 
                    db       -$04, $01, $0C 
                    db       $0B, $01, $1C, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_3), lo(BonusCircle_3) 
BonusCashDoubler4 
                    db       -$02, $01, $14, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$01, $01, -$0C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$10, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $03, $01, -$11 
                    db       $03, $01, $11 
                    db       $00, $01, $10 
                    db       -$01, $01, $0C 
                    db       $02, $01, $1C, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_4), lo(BonusCircle_4) 
BonusCashDoubler5 
                    db       $06, $01, $14, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $02, $01, -$0C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$10, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       -$08, $01, -$11 
                    db       -$08, $01, $11 
                    db       $00, $01, $10 
                    db       $02, $01, $0C 
                    db       -$07, $01, $1C, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_5), lo(BonusCircle_5) 
BonusCashDoubler6 
                    db       $0E, $01, $14, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $05, $01, -$0C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$10, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       -$13, $01, -$11 
                    db       -$13, $01, $11 
                    db       $00, $01, $10 
                    db       $05, $01, $0C 
                    db       -$0F, $01, $1C, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_6), lo(BonusCircle_6) 
BonusCashDoubler7 
                    db       $14, $01, $14, hi(SMVB_continue_yEqx_single), lo(SMVB_continue_yEqx_single) ; y is $14 
                    db       $06, $01, -$0C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$10, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       -$1A, $01, -$11 
                    db       -$1A, $01, $11 
                    db       $00, $01, $10 
                    db       $06, $01, $0C 
                    db       -$15, $01, $1C, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_7), lo(BonusCircle_7) 
BonusCashDoubler8 
                    db       $17, $01, $14, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $07, $01, -$0C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$10, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       -$1E, $01, -$11 
                    db       -$1E, $01, $11 
                    db       $00, $01, $10 
                    db       $07, $01, $0C 
                    db       -$18, $01, $1C, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_8), lo(BonusCircle_8) 
