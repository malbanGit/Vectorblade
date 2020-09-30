BonusFaster 
                    dw       BonusFaster_Anim 
                    db       BONUS_FASTER                 ; type 
MalusSlower 
                    dw       MalusSpeedAnim 
                    db       BONUS_SLOWER                 ; type 
BonusFasterAnim 
BonusFaster_Anim 
                    DW       BonusFasterInner0            ; list of all single vectorlists in this 
                    DW       BonusFasterInner1 
                    DW       BonusFasterInner2 
                    DW       BonusFasterInner3 
                    DW       BonusFasterInner4 
                    DW       BonusFasterInner5 
                    DW       BonusFasterInner6 
                    DW       BonusFasterInner7 
                    DW       BonusFasterInner8 
                    DW       BonusFasterInner7 
                    DW       BonusFasterInner6 
                    DW       BonusFasterInner5 
                    DW       BonusFasterInner4 
                    DW       BonusFasterInner3 
                    DW       BonusFasterInner2 
                    DW       BonusFasterInner1 
                    DW       0 
BonusFasterInner0 
                    db       -$18, $01, -$24, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       SHITREG_POKE_VALUE, $01, $24, hi(SMVB_startDraw_yStays_single), lo(SMVB_startDraw_yStays_single) ; y was -$18, now SHIFT Poke 
                    db       $24, $01, $18, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $24, $01, -$30 
                    db       $18, $01, $18 
                    db       -$0C, $01, $18 
                    db       $0C, $01, $18, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_0), lo(BonusCircle_0) 
BonusFasterInner1 
                    db       -$16, $01, -$24, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$17, $01, $24, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $23, $01, $18, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $20, $01, -$30 
                    db       $17, $01, $18 
                    db       -$0C, $01, $18 
                    db       $0C, $01, $18, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_1), lo(BonusCircle_1) 
BonusFasterInner2 
                    db       -$12, $01, -$24, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       SHITREG_POKE_VALUE, $01, $24, hi(SMVB_startDraw_yStays_single), lo(SMVB_startDraw_yStays_single) ; y was -$12, now SHIFT Poke 
                    db       $1B, $01, $18, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $1B, $01, -$30 
                    db       $12, $01, $18 
                    db       -$09, $01, $18 
                    db       $09, $01, $18, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_2), lo(BonusCircle_2) 
BonusFasterInner3 
                    db       -$0A, $01, -$24, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$0B, $01, $24, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0F, $01, $18, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $10, $01, -$30 
                    db       $0B, $01, $18 
                    db       -$05, $01, $18 
                    db       $05, $01, $18, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_3), lo(BonusCircle_3) 
BonusFasterInner4 
                    db       -$01, $01, -$24, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$03, $01, $24, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $03, $01, $18, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $02, $01, -$30 
                    db       $03, $01, $18 
                    db       -$01, $01, $18 
                    db       $01, $01, $18, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_4), lo(BonusCircle_4) 
BonusFasterInner5 
                    db       $06, $01, -$24, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $07, $01, $24, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0A, $01, $18, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$09, $01, -$30 
                    db       -$07, $01, $18 
                    db       $03, $01, $18 
                    db       -$03, $01, $18, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_5), lo(BonusCircle_5) 
BonusFasterInner6 
                    db       $0F, $01, -$24, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $0D, $01, $24, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$15, $01, $18, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$16, $01, -$30 
                    db       -$0D, $01, $18 
                    db       $07, $01, $18 
                    db       -$07, $01, $18, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_6), lo(BonusCircle_6) 
BonusFasterInner7 
                    db       $15, $01, -$24, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $13, $01, $24, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1E, $01, $18, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$1F, $01, -$30 
                    db       -$13, $01, $18 
                    db       $0A, $01, $18 
                    db       -$0A, $01, $18, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_7), lo(BonusCircle_7) 
BonusFasterInner8 
                    db       $18, $01, -$24, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $16, $01, $24, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$22, $01, $18, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$24, $01, -$30 
                    db       -$16, $01, $18 
                    db       $0A, $01, $18 
                    db       -$0A, $01, $18, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_8), lo(BonusCircle_8) 
MalusSpeedAnim 
MalusSpeed_Anim 
                    DW       MalusSpeed0                  ; list of all single vectorlists in this 
                    DW       MalusSpeed1 
                    DW       MalusSpeed2 
                    DW       MalusSpeed3 
                    DW       MalusSpeed4 
                    DW       MalusSpeed5 
                    DW       MalusSpeed6 
                    DW       MalusSpeed7 
                    DW       MalusSpeed8 
                    DW       MalusSpeed7 
                    DW       MalusSpeed6 
                    DW       MalusSpeed5 
                    DW       MalusSpeed4 
                    DW       MalusSpeed3 
                    DW       MalusSpeed2 
                    DW       MalusSpeed1 
                    DW       0 
MalusSpeed0 
                    db       $3C, $01, $25, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $0C, $01, -$18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$18, $01, -$17, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$24, $01, $2F 
                    db       -$24, $01, -$18 
                    db       $18, $01, -$23 
                    db       $1E, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, -$1B, hi(SMVB_startDraw_newY_eq_oldX_single), lo(SMVB_startDraw_newY_eq_oldX_single) ; y was $00, now SHIFT 
                    db       $1A, $01, $41, hi(SMVB_startMove_double_sj), lo(SMVB_startMove_double_sj), hi(TriangleOuter_0), lo(TriangleOuter_0) 
MalusSpeed1 
                    db       $3C, $01, $22, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $0C, $01, -$16, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$18, $01, -$15, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$24, $01, $2B 
                    db       -$24, $01, -$16 
                    db       $18, $01, -$21 
                    db       $1E, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, -$18, hi(SMVB_startDraw_newY_eq_oldX_single), lo(SMVB_startDraw_newY_eq_oldX_single) ; y was $00, now SHIFT 
                    db       $34, $01, $79, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(TriangleOuter_1), lo(TriangleOuter_1) 
MalusSpeed2 
                    db       $3C, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $0C, $01, -$12, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$18, $01, -$10, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$24, $01, $22 
                    db       -$24, $01, -$12 
                    db       $18, $01, -$19 
                    db       $1E, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, -$12, hi(SMVB_startDraw_newY_eq_oldX_single), lo(SMVB_startDraw_newY_eq_oldX_single) ; y was $00, now SHIFT 
                    db       $34, $01, $5C, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(TriangleOuter_2), lo(TriangleOuter_2) 
MalusSpeed3 
                    db       $3C, $01, $0F, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $0C, $01, -$0B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$18, $01, -$08, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$24, $01, $13 
                    db       -$24, $01, -$0B 
                    db       $18, $01, -$0D 
                    db       $1E, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, -$0A, hi(SMVB_startDraw_newY_eq_oldX_single), lo(SMVB_startDraw_newY_eq_oldX_single) ; y was $00, now SHIFT 
                    db       $34, $01, $32, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(TriangleOuter_3), lo(TriangleOuter_3) 
MalusSpeed4 
                    db       $3C, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $0C, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$18, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$24, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $18, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1E, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $34, $01, $00, hi(SMVB_continue_single_sj), lo(SMVB_continue_single_sj), hi(TriangleOuter_4), lo(TriangleOuter_4) 
MalusSpeed5 
                    db       $3C, $01, -$0F, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $0C, $01, $0B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$18, $01, $08, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$24, $01, -$13 
                    db       -$24, $01, $0B 
                    db       $18, $01, $0D 
                    db       $1E, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, $0A, hi(SMVB_startDraw_newY_eq_oldX_single), lo(SMVB_startDraw_newY_eq_oldX_single) ; y was $00, now SHIFT 
                    db       $34, $01, -$32, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(TriangleOuter_5), lo(TriangleOuter_5) 
MalusSpeed6 
                    db       $3C, $01, -$1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $0C, $01, $12, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$18, $01, $10, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$24, $01, -$22 
                    db       -$24, $01, $12 
                    db       $18, $01, $19 
                    db       $1E, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, $12, hi(SMVB_startDraw_newY_eq_oldX_single), lo(SMVB_startDraw_newY_eq_oldX_single) ; y was $00, now SHIFT 
                    db       $34, $01, -$5C, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(TriangleOuter_6), lo(TriangleOuter_6) 
MalusSpeed7 
                    db       $3C, $01, -$22, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $0C, $01, $16, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$18, $01, $15, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$24, $01, -$2B 
                    db       -$24, $01, $16 
                    db       $18, $01, $21 
                    db       $1E, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, $18, hi(SMVB_startDraw_newY_eq_oldX_single), lo(SMVB_startDraw_newY_eq_oldX_single) ; y was $00, now SHIFT 
                    db       $34, $01, -$79, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(TriangleOuter_7), lo(TriangleOuter_7) 
MalusSpeed8 
                    db       $3C, $01, -$25, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $0C, $01, $18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$18, $01, $17, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$24, $01, -$2F 
                    db       -$24, $01, $18 
                    db       $18, $01, $23 
                    db       $1E, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, $1B, hi(SMVB_startDraw_newY_eq_oldX_single), lo(SMVB_startDraw_newY_eq_oldX_single) ; y was $00, now SHIFT 
                    db       $1A, $01, -$41, hi(SMVB_startMove_double_sj), lo(SMVB_startMove_double_sj), hi(TriangleOuter_8), lo(TriangleOuter_8) 
