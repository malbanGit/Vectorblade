BonusShotsplus 
                    dw       BonusShotsplus_Anim 
                    db       BONUS_SHOTPLUS               ; type 
MalusShot 
                    dw       MalusShotAnim 
                    db       BONUS_SHOTMINUS              ; type 
BonusShotsplusAnim 
BonusShotsplus_Anim 
                    DW       BonusExtraBulletInner0       ; list of all single vectorlists in this 
                    DW       BonusExtraBulletInner1 
                    DW       BonusExtraBulletInner2 
                    DW       BonusExtraBulletInner3 
                    DW       BonusExtraBulletInner4 
                    DW       BonusExtraBulletInner5 
                    DW       BonusExtraBulletInner6 
                    DW       BonusExtraBulletInner7 
                    DW       BonusExtraBulletInner8 
                    DW       BonusExtraBulletInner7 
                    DW       BonusExtraBulletInner6 
                    DW       BonusExtraBulletInner5 
                    DW       BonusExtraBulletInner4 
                    DW       BonusExtraBulletInner3 
                    DW       BonusExtraBulletInner2 
                    DW       BonusExtraBulletInner1 
                    DW       0 
BonusExtraBulletInner0 
                    db       $18, $01, $24, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$18, $01, -$18, hi(SMVB_startDraw_yEqx_single), lo(SMVB_startDraw_yEqx_single) ; y is -$18 
                    db       -$18, $01, $18, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$18, $01, -$30 
                    db       $30, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$18, $01, $30, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $18, $01, $0C, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_0), lo(BonusCircle_0) 
BonusExtraBulletInner1 
                    db       $16, $01, $24, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$16, $01, -$18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$16, $01, $18, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$17, $01, -$30 
                    db       $2D, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$17, $01, $30, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $17, $01, $0C, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_1), lo(BonusCircle_1) 
BonusExtraBulletInner2 
                    db       $12, $01, $24, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$12, $01, -$18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$12, $01, $18, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$12, $01, -$30 
                    db       $24, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$12, $01, $30, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $12, $01, $0C, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_2), lo(BonusCircle_2) 
BonusExtraBulletInner3 
                    db       $0A, $01, $24, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$0A, $01, -$18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0A, $01, $18, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$0B, $01, -$30 
                    db       $15, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$0B, $01, $30, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $0B, $01, $0C, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_3), lo(BonusCircle_3) 
BonusExtraBulletInner4 
                    db       $01, $01, $24, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$01, $01, -$18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$01, $01, $18, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$03, $01, -$30 
                    db       $04, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$03, $01, $30, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $03, $01, $0C, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_4), lo(BonusCircle_4) 
BonusExtraBulletInner5 
                    db       -$06, $01, $24, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $06, $01, -$18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $06, $01, $18, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $07, $01, -$30 
                    db       -$0D, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $07, $01, $30, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$07, $01, $0C, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_5), lo(BonusCircle_5) 
BonusExtraBulletInner6 
                    db       -$0F, $01, $24, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $0F, $01, -$18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0F, $01, $18, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $0D, $01, -$30 
                    db       -$1C, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $0D, $01, $30, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$0D, $01, $0C, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_6), lo(BonusCircle_6) 
BonusExtraBulletInner7 
                    db       -$15, $01, $24, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $15, $01, -$18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $15, $01, $18, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $13, $01, -$30 
                    db       -$28, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $13, $01, $30, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$13, $01, $0C, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_7), lo(BonusCircle_7) 
BonusExtraBulletInner8 
                    db       -$18, $01, $24, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $18, $01, -$18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $18, $01, $18, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $16, $01, -$30 
                    db       -$2E, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $16, $01, $30, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$16, $01, $0C, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_8), lo(BonusCircle_8) 
MalusShotAnim 
                    DW       MalusShot0                   ; list of all single vectorlists in this 
                    DW       MalusShot1 
                    DW       MalusShot2 
                    DW       MalusShot3 
                    DW       MalusShot4 
                    DW       MalusShot5 
                    DW       MalusShot6 
                    DW       MalusShot7 
                    DW       MalusShot8 
                    DW       MalusShot7 
                    DW       MalusShot6 
                    DW       MalusShot5 
                    DW       MalusShot4 
                    DW       MalusShot3 
                    DW       MalusShot2 
                    DW       MalusShot1 
                    DW       0 
MalusShot0 
                    db       $16, $01, $07, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $15, $01, $17, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $17, $01, -$25, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$5A, $01, $00 
                    db       $17, $01, $23 
                    db       $17, $01, -$15 
                    db       $00, $01, -$19, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, -$1B, hi(SMVB_startDraw_yStays_single), lo(SMVB_startDraw_yStays_single) ; y was $00, now SHIFT Poke 
                    db       $3C, $01, $7F, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(TriangleOuter_0), lo(TriangleOuter_0) 
MalusShot1 
                    db       $16, $01, $07, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $15, $01, $14, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $17, $01, -$22, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$5A, $01, $00 
                    db       $17, $01, $22 
                    db       $17, $01, -$14 
                    db       $00, $01, -$17, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, -$1A, hi(SMVB_startDraw_yStays_single), lo(SMVB_startDraw_yStays_single) ; y was $00, now SHIFT Poke 
                    db       $3C, $01, $76, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(TriangleOuter_1), lo(TriangleOuter_1) 
MalusShot2 
                    db       $16, $01, $06, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $15, $01, $0F, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $17, $01, -$1B, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$5A, $01, $00 
                    db       $17, $01, $19 
                    db       $17, $01, -$0D 
                    db       $00, $01, -$12, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, -$13, hi(SMVB_startDraw_yStays_single), lo(SMVB_startDraw_yStays_single) ; y was $00, now SHIFT Poke 
                    db       $3C, $01, $59, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(TriangleOuter_2), lo(TriangleOuter_2) 
MalusShot3 
                    db       $16, $01, $03, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $15, $01, $09, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $17, $01, -$0F, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$5A, $01, $00 
                    db       $17, $01, $0D 
                    db       $17, $01, -$07 
                    db       $00, $01, -$0A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, -$09, hi(SMVB_startDraw_yStays_single), lo(SMVB_startDraw_yStays_single) ; y was $00, now SHIFT Poke 
                    db       $3C, $01, $2F, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(TriangleOuter_3), lo(TriangleOuter_3) 
MalusShot4 
                    db       $16, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $15, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $17, $01, $00, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$5A, $01, $00 
                    db       $17, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $3C, $01, $00, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(TriangleOuter_4), lo(TriangleOuter_4) 
MalusShot5 
                    db       $16, $01, -$03, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $15, $01, -$09, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $17, $01, $0F, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$5A, $01, $00 
                    db       $17, $01, -$0D 
                    db       $17, $01, $07 
                    db       $00, $01, $0A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, $09, hi(SMVB_startDraw_yStays_single), lo(SMVB_startDraw_yStays_single) ; y was $00, now SHIFT Poke 
                    db       $3C, $01, -$2F, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(TriangleOuter_5), lo(TriangleOuter_5) 
MalusShot6 
                    db       $16, $01, -$06, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $15, $01, -$0F, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $17, $01, $1B, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$5A, $01, $00 
                    db       $17, $01, -$19 
                    db       $17, $01, $0D 
                    db       $00, $01, $12, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, $13, hi(SMVB_startDraw_yStays_single), lo(SMVB_startDraw_yStays_single) ; y was $00, now SHIFT Poke 
                    db       $3C, $01, -$59, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(TriangleOuter_6), lo(TriangleOuter_6) 
MalusShot7 
                    db       $16, $01, -$07, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $15, $01, -$14, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $17, $01, $22, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$5A, $01, $00 
                    db       $17, $01, -$22 
                    db       $17, $01, $14 
                    db       $00, $01, $17, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, $1A, hi(SMVB_startDraw_yStays_single), lo(SMVB_startDraw_yStays_single) ; y was $00, now SHIFT Poke 
                    db       $3C, $01, -$76, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(TriangleOuter_7), lo(TriangleOuter_7) 
MalusShot8 
                    db       $16, $01, -$07, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $15, $01, -$17, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $17, $01, $25, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$5A, $01, $00 
                    db       $17, $01, -$23 
                    db       $17, $01, $15 
                    db       $00, $01, $19, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, $1B, hi(SMVB_startDraw_yStays_single), lo(SMVB_startDraw_yStays_single) ; y was $00, now SHIFT Poke 
                    db       $3C, $01, -$7F, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(TriangleOuter_8), lo(TriangleOuter_8) 
