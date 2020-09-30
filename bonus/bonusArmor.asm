BonusArmor 
                    dw       BonusArmor_Anim 
                    db       BONUS_ARMOR                  ; type 
BonusArmorAnim 
BonusArmor_Anim 
                    DW       BonusArmorInner0             ; list of all single vectorlists in this 
                    DW       BonusArmorInner1 
                    DW       BonusArmorInner2 
                    DW       BonusArmorInner3 
                    DW       BonusArmorInner4 
                    DW       BonusArmorInner5 
                    DW       BonusArmorInner6 
                    DW       BonusArmorInner7 
                    DW       BonusArmorInner8 
                    DW       BonusArmorInner7 
                    DW       BonusArmorInner6 
                    DW       BonusArmorInner5 
                    DW       BonusArmorInner4 
                    DW       BonusArmorInner3 
                    DW       BonusArmorInner2 
                    DW       BonusArmorInner1 
                    DW       0 
BonusArmorInner0 
                    db       $1C, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$20, $01, $36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$11, $01, -$0C, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $19, $01, -$2B 
                    db       -$19, $01, -$26 
                    db       $11, $01, -$0C 
                    db       $20, $01, $33 
                    db       $14, $01, $30, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_0), lo(BonusCircle_0) 
BonusArmorInner1 
                    db       $1B, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$1F, $01, $36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0F, $01, -$0C, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $17, $01, -$2B 
                    db       -$17, $01, -$26 
                    db       $0F, $01, -$0C 
                    db       $1F, $01, $33 
                    db       $12, $01, $30, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_1), lo(BonusCircle_1) 
BonusArmorInner2 
                    db       $15, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$18, $01, $36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0C, $01, -$0C, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $12, $01, -$2B 
                    db       -$12, $01, -$26 
                    db       $0C, $01, -$0C 
                    db       $18, $01, $33 
                    db       $0F, $01, $30, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_2), lo(BonusCircle_2) 
BonusArmorInner3 
                    db       $0C, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$0D, $01, $36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$08, $01, -$0C, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $0A, $01, -$2B 
                    db       -$0A, $01, -$26 
                    db       $08, $01, -$0C 
                    db       $0D, $01, $33 
                    db       $09, $01, $30, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_3), lo(BonusCircle_3) 
BonusArmorInner4 
                    db       $03, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$03, $01, $36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$01, $01, -$0C, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $01, $01, -$2B 
                    db       -$01, $01, -$26 
                    db       $01, $01, -$0C 
                    db       $03, $01, $33 
                    db       $01, $01, $30, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_4), lo(BonusCircle_4) 
BonusArmorInner5 
                    db       -$07, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $08, $01, $36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $05, $01, -$0C, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       -$07, $01, -$2B 
                    db       $07, $01, -$26 
                    db       -$05, $01, -$0C 
                    db       -$08, $01, $33 
                    db       -$06, $01, $30, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_5), lo(BonusCircle_5) 
BonusArmorInner6 
                    db       -$10, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $13, $01, $36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $09, $01, -$0C, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       -$0F, $01, -$2B 
                    db       $0F, $01, -$26 
                    db       -$09, $01, -$0C 
                    db       -$13, $01, $33 
                    db       -$0C, $01, $30, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_6), lo(BonusCircle_6) 
BonusArmorInner7 
                    db       -$18, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1C, $01, $36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0E, $01, -$0C, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       -$16, $01, -$2B 
                    db       $16, $01, -$26 
                    db       -$0E, $01, -$0C 
                    db       -$1C, $01, $33 
                    db       -$10, $01, $30, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_7), lo(BonusCircle_7) 
BonusArmorInner8 
                    db       -$1C, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $20, $01, $36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $11, $01, -$0C, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       -$19, $01, -$2B 
                    db       $19, $01, -$26 
                    db       -$11, $01, -$0C 
                    db       -$20, $01, $33 
                    db       -$12, $01, $30, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_8), lo(BonusCircle_8) 
