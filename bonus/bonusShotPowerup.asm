BonusShotPowerup 
                    dw       BonusShotPowerupAnim 
                    db       BONUS_SHOT_POWERUP           ; type 
BonusShotPowerupAnim 
BonusShotPowerupAnim 
                    DW       BonusShotPowerup0            ; list of all single vectorlists in this 
                    DW       BonusShotPowerup1 
                    DW       BonusShotPowerup2 
                    DW       BonusShotPowerup3 
                    DW       BonusShotPowerup4 
                    DW       BonusShotPowerup5 
                    DW       BonusShotPowerup6 
                    DW       BonusShotPowerup7 
                    DW       BonusShotPowerup8 
                    DW       BonusShotPowerup7 
                    DW       BonusShotPowerup6 
                    DW       BonusShotPowerup5 
                    DW       BonusShotPowerup4 
                    DW       BonusShotPowerup3 
                    DW       BonusShotPowerup2 
                    DW       BonusShotPowerup1 
                    DW       0 
BonusShotPowerup0 
                    db       -$1F, $01, -$13, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $3E, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $1D, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       -$07, $01, $09 
                    db       -$11, $01, $00 
                    db       -$07, $01, -$09 
                    db       $00, $01, -$1D 
                    db       $30, $01, $43, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_0), lo(BonusCircle_0) 
BonusShotPowerup1 
                    db       -$1D, $01, -$13, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $3A, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $1D, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       -$07, $01, $09 
                    db       -$0F, $01, $00 
                    db       -$07, $01, -$09 
                    db       $00, $01, -$1D 
                    db       $2D, $01, $43, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_1), lo(BonusCircle_1) 
BonusShotPowerup2 
                    db       -$17, $01, -$13, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $2E, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $1D, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       -$05, $01, $09 
                    db       -$0D, $01, $00 
                    db       -$05, $01, -$09 
                    db       $00, $01, -$1D 
                    db       $23, $01, $43, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_2), lo(BonusCircle_2) 
BonusShotPowerup3 
                    db       -$0E, $01, -$13, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1C, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $1D, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       -$03, $01, $09 
                    db       -$08, $01, $00 
                    db       -$03, $01, -$09 
                    db       $00, $01, -$1D 
                    db       $15, $01, $43, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_3), lo(BonusCircle_3) 
BonusShotPowerup4 
                    db       -$03, $01, -$13, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $06, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $1D, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       -$01, $01, $09 
                    db       -$01, $01, $00 
                    db       -$01, $01, -$09 
                    db       $00, $01, -$1D 
                    db       $04, $01, $43, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_4), lo(BonusCircle_4) 
BonusShotPowerup5 
                    db       $08, $01, -$13, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$10, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $1D, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $01, $01, $09 
                    db       $05, $01, $00 
                    db       $02, $01, -$09 
                    db       $00, $01, -$1D 
                    db       -$0D, $01, $43, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_5), lo(BonusCircle_5) 
BonusShotPowerup6 
                    db       $13, $01, -$13, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$26, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $1D, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $05, $01, $09 
                    db       $0A, $01, $00 
                    db       $04, $01, -$09 
                    db       $00, $01, -$1D 
                    db       $00, $01, $43, hi(SMVB_startMove_newY_eq_oldX_single_sj), lo(SMVB_startMove_newY_eq_oldX_single_sj), hi(BonusCircle_6), lo(BonusCircle_6) ; y was -$1D, now 0 
BonusShotPowerup7 
                    db       $1A, $01, -$13, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$34, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $1D, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $06, $01, $09 
                    db       $0E, $01, $00 
                    db       $06, $01, -$09 
                    db       $00, $01, -$1D 
                    db       -$29, $01, $43, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_7), lo(BonusCircle_7) 
BonusShotPowerup8 
                    db       $1E, $01, -$13, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$3C, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $1D, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $06, $01, $09 
                    db       $11, $01, $00 
                    db       $07, $01, -$09 
                    db       $00, $01, -$1D 
                    db       -$2F, $01, $43, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_8), lo(BonusCircle_8) 
