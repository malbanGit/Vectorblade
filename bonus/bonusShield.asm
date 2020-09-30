BonusShield 
                    dw       BonusShield_Anim 
                    db       BONUS_SHIELD                 ; type 
BonusShield_Anim 
                    DW       BonusShieldInner0            ; list of all single vectorlists in this 
                    DW       BonusShieldInner1 
                    DW       BonusShieldInner2 
                    DW       BonusShieldInner3 
                    DW       BonusShieldInner4 
                    DW       BonusShieldInner5 
                    DW       BonusShieldInner6 
                    DW       BonusShieldInner7 
                    DW       BonusShieldInner8 
                    DW       BonusShieldInner7 
                    DW       BonusShieldInner6 
                    DW       BonusShieldInner5 
                    DW       BonusShieldInner4 
                    DW       BonusShieldInner3 
                    DW       BonusShieldInner2 
                    DW       BonusShieldInner1 
                    DW       0 
BonusShieldInner0 
                    db       $2A, $01, $1E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$2D, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$34, $01, -$1E, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $34, $01, -$1E 
                    db       $2D, $01, $00 
                    db       $00, $01, $3C 
                    db       $06, $01, $12, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_0), lo(BonusCircle_0) 
BonusShieldInner1 
                    db       $27, $01, $1E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$2A, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$31, $01, -$1E, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $31, $01, -$1E 
                    db       $2A, $01, $00 
                    db       $00, $01, $3C 
                    db       $06, $01, $12, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_1), lo(BonusCircle_1) 
BonusShieldInner2 
                    db       $1F, $01, $1E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$20, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$27, $01, -$1E, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $27, $01, -$1E 
                    db       $20, $01, $00 
                    db       $00, $01, $3C 
                    db       $05, $01, $12, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_2), lo(BonusCircle_2) 
BonusShieldInner3 
                    db       $12, $01, $1E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$13, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$17, $01, -$1E, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $17, $01, -$1E 
                    db       $13, $01, $00 
                    db       $00, $01, $3C 
                    db       $03, $01, $12, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_3), lo(BonusCircle_3) 
BonusShieldInner4 
                    db       $04, $01, $1E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$04, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$04, $01, -$1E, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $04, $01, -$1E 
                    db       $04, $01, $00 
                    db       $00, $01, $3C 
                    db       $00, $01, $12, hi(SMVB_startMove_yStays_single_sj), lo(SMVB_startMove_yStays_single_sj), hi(BonusCircle_4), lo(BonusCircle_4) ; y was $00, now 0 
BonusShieldInner5 
                    db       -$0C, $01, $1E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $0D, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0E, $01, -$1E, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$0E, $01, -$1E 
                    db       -$0D, $01, $00 
                    db       $00, $01, $3C 
                    db       -$01, $01, $12, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_5), lo(BonusCircle_5) 
BonusShieldInner6 
                    db       -$19, $01, $1E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1A, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $20, $01, -$1E, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$20, $01, -$1E 
                    db       -$1A, $01, $00 
                    db       $00, $01, $3C 
                    db       -$03, $01, $12, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_6), lo(BonusCircle_6) 
BonusShieldInner7 
                    db       -$24, $01, $1E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $27, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $2B, $01, -$1E, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$2B, $01, -$1E 
                    db       -$27, $01, $00 
                    db       $00, $01, $3C 
                    db       -$04, $01, $12, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_7), lo(BonusCircle_7) 
BonusShieldInner8 
                    db       -$2A, $01, $1E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $2D, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $33, $01, -$1E, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$33, $01, -$1E 
                    db       -$2D, $01, $00 
                    db       $00, $01, $3C 
                    db       -$04, $01, $12, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_8), lo(BonusCircle_8) 
