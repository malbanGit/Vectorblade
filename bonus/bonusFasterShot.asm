BonusFasterShot 
                    dw       BonusFasterShot_Anim 
                    db       BONUS_FASTER_SHOT            ; type 
BonusSlowerShot 
                    dw       BonusSlowerShotAnim 
                    db       BONUS_SLOWER_SHOT            ; type 
BonusFasterShotAnim 
BonusFasterShot_Anim 
                    DW       BonusFasterShotInner0        ; list of all single vectorlists in this 
                    DW       BonusFasterShotInner1 
                    DW       BonusFasterShotInner2 
                    DW       BonusFasterShotInner3 
                    DW       BonusFasterShotInner4 
                    DW       BonusFasterShotInner5 
                    DW       BonusFasterShotInner6 
                    DW       BonusFasterShotInner7 
                    DW       BonusFasterShotInner8 
                    DW       BonusFasterShotInner7 
                    DW       BonusFasterShotInner6 
                    DW       BonusFasterShotInner5 
                    DW       BonusFasterShotInner4 
                    DW       BonusFasterShotInner3 
                    DW       BonusFasterShotInner2 
                    DW       BonusFasterShotInner1 
                    DW       0 
BonusFasterShotInner0 
                    db       -$18, $01, $18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       SHITREG_POKE_VALUE, $01, -$18, hi(SMVB_startDraw_newY_eq_oldX_single), lo(SMVB_startDraw_newY_eq_oldX_single) ; y was $18, now SHIFT 
                    db       -$18, $01, -$18, hi(SMVB_continue_newY_eq_oldX_single), lo(SMVB_continue_newY_eq_oldX_single) ; y is -$18 
                    db       $1B, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $18, $01, $18, hi(SMVB_startDraw_yEqx_single), lo(SMVB_startDraw_yEqx_single) ; y is $18 
                    db       -$18, $01, $18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $2D, $01, $18, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_0), lo(BonusCircle_0) 
BonusFasterShotInner1 
                    db       -$16, $01, $18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $16, $01, -$18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$16, $01, -$18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $19, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $16, $01, $18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$16, $01, $18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $2A, $01, $18, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_1), lo(BonusCircle_1) 
BonusFasterShotInner2 
                    db       -$12, $01, $18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $12, $01, -$18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$12, $01, -$18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $13, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $12, $01, $18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$12, $01, $18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $23, $01, $18, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_2), lo(BonusCircle_2) 
BonusFasterShotInner3 
                    db       -$0A, $01, $18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $0A, $01, -$18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0A, $01, -$18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $0B, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, $18, hi(SMVB_startDraw_yStays_single), lo(SMVB_startDraw_yStays_single) ; y was $0B, now SHIFT Poke 
                    db       -$0B, $01, $18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $14, $01, $18, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_3), lo(BonusCircle_3) 
BonusFasterShotInner4 
                    db       -$01, $01, $18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $01, $01, -$18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$01, $01, -$18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $01, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $03, $01, $18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$03, $01, $18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $04, $01, $18, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_4), lo(BonusCircle_4) 
BonusFasterShotInner5 
                    db       $06, $01, $18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$06, $01, -$18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $06, $01, -$18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$07, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$06, $01, $18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $06, $01, $18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$0C, $01, $18, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_5), lo(BonusCircle_5) 
BonusFasterShotInner6 
                    db       $0F, $01, $18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$0F, $01, -$18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0F, $01, -$18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$10, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$0F, $01, $18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0F, $01, $18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$1B, $01, $18, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_6), lo(BonusCircle_6) 
BonusFasterShotInner7 
                    db       $15, $01, $18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$15, $01, -$18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $15, $01, -$18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, $00, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was -$18, now 0 
                    db       -$13, $01, $18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $13, $01, $18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$25, $01, $18, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_7), lo(BonusCircle_7) 
BonusFasterShotInner8 
                    db       $18, $01, $18, hi(SMVB_continue_yEqx_single), lo(SMVB_continue_yEqx_single) ; y is $18 
                    db       -$18, $01, -$18, hi(SMVB_startDraw_yEqx_single), lo(SMVB_startDraw_yEqx_single) ; y is -$18 
                    db       $18, $01, -$18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$1B, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$18, $01, $18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $18, $01, $18, hi(SMVB_continue_newY_eq_oldX_single), lo(SMVB_continue_newY_eq_oldX_single) ; y is $18 
                    db       -$2B, $01, $18, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_8), lo(BonusCircle_8) 
BonusSlowerShot_Anim 
BonusSlowerShotAnim 
                    DW       BonusSlowerShot0             ; list of all single vectorlists in this 
                    DW       BonusSlowerShot1 
                    DW       BonusSlowerShot2 
                    DW       BonusSlowerShot3 
                    DW       BonusSlowerShot4 
                    DW       BonusSlowerShot5 
                    DW       BonusSlowerShot6 
                    DW       BonusSlowerShot7 
                    DW       BonusSlowerShot8 
                    DW       BonusSlowerShot7 
                    DW       BonusSlowerShot6 
                    DW       BonusSlowerShot5 
                    DW       BonusSlowerShot4 
                    DW       BonusSlowerShot3 
                    DW       BonusSlowerShot2 
                    DW       BonusSlowerShot1 
                    DW       0 
BonusSlowerShot0 
                    db       $0F, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $18, $01, $18, hi(SMVB_startDraw_yEqx_single), lo(SMVB_startDraw_yEqx_single) ; y is $18 
                    db       -$1B, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$16, $01, -$18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $16, $01, -$18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1B, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$18, $01, $18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $43, $01, $52, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(TriangleOuter_0), lo(TriangleOuter_0) 
BonusSlowerShot1 
                    db       $0F, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $18, $01, $16, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1B, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$16, $01, -$16, hi(SMVB_startDraw_yEqx_single), lo(SMVB_startDraw_yEqx_single) ; y is -$16 
                    db       $16, $01, -$16, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1B, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$18, $01, $16, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $43, $01, $4C, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(TriangleOuter_1), lo(TriangleOuter_1) 
BonusSlowerShot2 
                    db       $0F, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $18, $01, $10, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1B, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$16, $01, -$10, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $16, $01, -$10, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1B, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$18, $01, $10, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $43, $01, $3A, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(TriangleOuter_2), lo(TriangleOuter_2) 
BonusSlowerShot3 
                    db       $0F, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $18, $01, $09, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1B, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$16, $01, -$09, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $16, $01, -$09, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1B, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$18, $01, $09, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $43, $01, $1F, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(TriangleOuter_3), lo(TriangleOuter_3) 
BonusSlowerShot4 
                    db       $0F, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $18, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1B, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$16, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $16, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1B, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$18, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $43, $01, $00, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(TriangleOuter_4), lo(TriangleOuter_4) 
BonusSlowerShot5 
                    db       $0F, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $18, $01, -$09, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1B, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$16, $01, $09, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $16, $01, $09, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1B, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$18, $01, -$09, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $43, $01, -$1F, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(TriangleOuter_5), lo(TriangleOuter_5) 
BonusSlowerShot6 
                    db       $0F, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $18, $01, -$10, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1B, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$16, $01, $10, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $16, $01, $10, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1B, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$18, $01, -$10, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $43, $01, -$3A, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(TriangleOuter_6), lo(TriangleOuter_6) 
BonusSlowerShot7 
                    db       $0F, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $18, $01, -$16, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1B, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$16, $01, $16, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $16, $01, $16, hi(SMVB_continue_newY_eq_oldX_single), lo(SMVB_continue_newY_eq_oldX_single) ; y is $16 
                    db       $1B, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$18, $01, -$16, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $43, $01, -$4C, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(TriangleOuter_7), lo(TriangleOuter_7) 
BonusSlowerShot8 
                    db       $0F, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $18, $01, -$18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1B, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$16, $01, $18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $16, $01, $18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1B, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$18, $01, -$18, hi(SMVB_startDraw_yEqx_single), lo(SMVB_startDraw_yEqx_single) ; y is -$18 
                    db       $43, $01, -$52, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(TriangleOuter_8), lo(TriangleOuter_8) 
