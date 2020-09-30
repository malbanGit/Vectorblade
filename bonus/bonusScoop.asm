BonusScoop 
                    dw       BonusScoop_Anim 
                    db       BONUS_SCOOP                  ; type 
BonusScoop_Anim 
                    DW       BonusScoopInner0             ; list of all single vectorlists in this 
                    DW       BonusScoopInner1 
                    DW       BonusScoopInner2 
                    DW       BonusScoopInner3 
                    DW       BonusScoopInner4 
                    DW       BonusScoopInner5 
                    DW       BonusScoopInner6 
                    DW       BonusScoopInner7 
                    DW       BonusScoopInner8 
                    DW       BonusScoopInner7 
                    DW       BonusScoopInner6 
                    DW       BonusScoopInner5 
                    DW       BonusScoopInner4 
                    DW       BonusScoopInner3 
                    DW       BonusScoopInner2 
                    DW       BonusScoopInner1 
                    DW       0 
BonusScoopInner0 
                    db       -$24, $01, -$30, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, $60, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $18, $01, -$0C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, -$48, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $18, $01, $0C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, $30, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $18, $01, -$0C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, -$18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0C, $01, $3C, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_0), lo(BonusCircle_0) 
BonusScoopInner1 
                    db       -$21, $01, -$30, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, $60, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $17, $01, -$0C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, -$48, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $14, $01, $0C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, $30, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $17, $01, -$0C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, -$18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0C, $01, $3C, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_1), lo(BonusCircle_1) 
BonusScoopInner2 
                    db       -$1B, $01, -$30, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, $60, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $12, $01, -$0C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, -$48, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $12, $01, $0C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, $30, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $12, $01, -$0C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, -$18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $09, $01, $3C, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_2), lo(BonusCircle_2) 
BonusScoopInner3 
                    db       -$10, $01, -$30, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, $60, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0A, $01, -$0C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, -$48, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0C, $01, $0C, hi(SMVB_startMove_yEqx_single), lo(SMVB_startMove_yEqx_single) ; y is $0C 
                    db       $00, $01, $30, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0A, $01, -$0C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, -$18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $05, $01, $3C, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_3), lo(BonusCircle_3) 
BonusScoopInner4 
                    db       -$03, $01, -$30, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, $60, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $02, $01, -$0C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, -$48, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $02, $01, $0C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, $30, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $02, $01, -$0C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, -$18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $01, $01, $3C, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_4), lo(BonusCircle_4) 
BonusScoopInner5 
                    db       $0A, $01, -$30, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, $60, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$07, $01, -$0C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, -$48, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$06, $01, $0C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, $30, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$07, $01, -$0C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, -$18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$03, $01, $3C, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_5), lo(BonusCircle_5) 
BonusScoopInner6 
                    db       $15, $01, -$30, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, $60, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0E, $01, -$0C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, -$48, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0E, $01, $0C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, $30, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0E, $01, -$0C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, -$18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$07, $01, $3C, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_6), lo(BonusCircle_6) 
BonusScoopInner7 
                    db       $1E, $01, -$30, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, $60, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$14, $01, -$0C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, -$48, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$14, $01, $0C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, $30, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$14, $01, -$0C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, -$18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0A, $01, $3C, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_7), lo(BonusCircle_7) 
BonusScoopInner8 
                    db       $24, $01, -$30, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, $60, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$18, $01, -$0C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, -$48, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$18, $01, $0C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, $30, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$18, $01, -$0C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, -$18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0A, $01, $3C, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_8), lo(BonusCircle_8) 
