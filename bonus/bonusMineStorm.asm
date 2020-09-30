BonusMinestorm 
                    dw       BonusMineStormAnim 
                    db       BONUS_MINESTORM              ; type 
BonusMineStormAnim 
                    fdb      MineStorm0                   ; list of all single vectorlists in this 
                    fdb      MineStorm1 
                    fdb      MineStorm2 
                    fdb      MineStorm3 
                    fdb      MineStorm4 
                    fdb      MineStorm5 
                    fdb      MineStorm6 
                    fdb      MineStorm7 
                    fdb      MineStorm8 
                    fdb      MineStorm7 
                    fdb      MineStorm6 
                    fdb      MineStorm5 
                    fdb      MineStorm4 
                    fdb      MineStorm3 
                    fdb      MineStorm2 
                    fdb      MineStorm1 
                    DW       0 
MineStorm0 
                    db       -$18, $01, $18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $12, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1C, $01, -$15, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $16, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0C, $01, -$0F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $24, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$16, $01, $1B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $1A, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $20, $01, $21, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_0), lo(BonusCircle_0) 
MineStorm1 
                    db       -$16, $01, $18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $10, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$19, $01, -$15, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $15, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0C, $01, -$0F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $20, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$14, $01, $1B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $19, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1E, $01, $21, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_1), lo(BonusCircle_1) 
MineStorm2 
                    db       -$12, $01, $18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $0E, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$15, $01, -$15, hi(SMVB_startMove_yEqx_single), lo(SMVB_startMove_yEqx_single) ; y is -$15 
                    db       $10, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$09, $01, -$0F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $1B, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$10, $01, $1B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $13, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $18, $01, $21, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_2), lo(BonusCircle_2) 
MineStorm3 
                    db       -$0A, $01, $18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $07, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0C, $01, -$15, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $09, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$04, $01, -$0F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $10, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0A, $01, $1B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $0B, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0E, $01, $21, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_3), lo(BonusCircle_3) 
MineStorm4 
                    db       -$01, $01, $18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $01, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$03, $01, -$15, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $02, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$0F, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       $02, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$02, $01, $1B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $02, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $03, $01, $21, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_4), lo(BonusCircle_4) 
MineStorm5 
                    db       $06, $01, $18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$05, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $08, $01, -$15, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$06, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $03, $01, -$0F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$09, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $06, $01, $1B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$07, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$09, $01, $21, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_5), lo(BonusCircle_5) 
MineStorm6 
                    db       $0F, $01, $18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$0C, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $12, $01, -$15, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$0E, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $08, $01, -$0F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$16, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0D, $01, $1B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$10, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$12, $01, $21, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_6), lo(BonusCircle_6) 
MineStorm7 
                    db       $15, $01, $18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$11, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1A, $01, -$15, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$14, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0B, $01, -$0F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$1F, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $13, $01, $1B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$16, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1B, $01, $21, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_7), lo(BonusCircle_7) 
MineStorm8 
                    db       $18, $01, $18, hi(SMVB_continue_yEqx_single), lo(SMVB_continue_yEqx_single) ; y is $18 
                    db       -$12, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1C, $01, -$15, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$16, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0C, $01, -$0F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$24, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $16, $01, $1B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$1A, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1E, $01, $21, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_8), lo(BonusCircle_8) 
