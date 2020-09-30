Money_5 
                    dw       Money_5_Anim 
                    db       BONUS_MONEY_5                ; type 
Money_20 
                    dw       Money_20_Anim 
                    db       BONUS_MONEY_20               ; type 
Money_50 
                    dw       Money_50_Anim 
                    db       BONUS_MONEY_50               ; type 
Money_200 
                    dw       Money200_Anim 
                    db       BONUS_MONEY_200              ; type 
Money_5_Anim 
                    DW       Money_5_0                    ; list of all single vectorlists in this 
                    DW       Money_5_1 
                    DW       Money_5_2 
                    DW       Money_5_3 
                    DW       Money_5_4 
                    DW       Money_5_5 
                    DW       Money_5_6 
                    DW       Money_5_7 
                    DW       0 
Money_5_0 
                    db       $1B, $01, $11, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$22, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1B, $01, $00, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $00, $01, $22 
                    db       -$1B, $01, $00 
                    db       $00, $01, -$22 
                    db       $43, $01, $50, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_0), lo(RectangleOuter_0) 
Money_5_1 
                    db       $21, $01, $06, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$0E, $01, -$20, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$19, $01, $0A, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $0C, $01, $20 
                    db       -$19, $01, $0A 
                    db       -$0E, $01, -$20 
                    db       $5F, $01, $31, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_1), lo(RectangleOuter_1) 
Money_5_2 
                    db       $1F, $01, -$07, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$18, $01, -$18, hi(SMVB_startDraw_yEqx_single), lo(SMVB_startDraw_yEqx_single) ; y is -$18 
                    db       -$13, $01, $13, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $18, $01, $18 
                    db       -$13, $01, $13 
                    db       -$18, $01, -$18 
                    db       $68, $01, $09, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_2), lo(RectangleOuter_2) 
Money_5_3 
                    db       $1A, $01, -$13, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$20, $01, -$0E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0A, $01, $1B, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $20, $01, $0C 
                    db       -$0A, $01, $1B 
                    db       -$20, $01, -$0E 
                    db       $63, $01, -$1F, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_3), lo(RectangleOuter_3) 
Money_5_4 
                    db       $11, $01, -$1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$22, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $1B, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $22, $01, $00 
                    db       $00, $01, $1B 
                    db       -$22, $01, $00 
                    db       $50, $01, -$43, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_4), lo(RectangleOuter_4) 
Money_5_5 
                    db       $06, $01, -$21, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$20, $01, $0E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0A, $01, $19, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $20, $01, -$0C 
                    db       $0A, $01, $19 
                    db       -$20, $01, $0E 
                    db       $31, $01, -$5F, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_5), lo(RectangleOuter_5) 
Money_5_6 
                    db       -$07, $01, -$1F, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$18, $01, $18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $13, $01, $13, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $18, $01, -$18 
                    db       $13, $01, $13 
                    db       -$18, $01, $18 
                    db       $09, $01, -$68, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_6), lo(RectangleOuter_6) 
Money_5_7 
                    db       -$13, $01, -$1A, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$0E, $01, $20, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1B, $01, $0A, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $0C, $01, -$20 
                    db       $1B, $01, $0A 
                    db       -$0E, $01, $20 
                    db       -$1F, $01, -$63, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_7), lo(RectangleOuter_7) 
Money_50_Anim 
                    DW       Money_50_0                   ; list of all single vectorlists in this 
                    DW       Money_50_1 
                    DW       Money_50_2 
                    DW       Money_50_3 
                    DW       Money_50_4 
                    DW       Money_50_5 
                    DW       Money_50_6 
                    DW       Money_50_7 
                    DW       Money_50_8 
                    DW       Money_50_9 
                    DW       Money_50_10 
                    DW       Money_50_11 
                    DW       Money_50_12 
                    DW       Money_50_13 
                    DW       Money_50_14 
                    DW       Money_50_15 
                    DW       0 
Money_50_0 
                    db       $1B, $01, -$06, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$23, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1B, $01, $00, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $00, $01, $23 
                    db       -$1B, $01, $00 
                    db       $00, $01, -$25 
                    db       $00, $01, $31, hi(SMVB_startMove_yStays_single), lo(SMVB_startMove_yStays_single) ; y was $00, now 0 
                    db       $36, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $23, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$36, $01, $00 
                    db       $00, $01, -$23 
                    db       $43, $01, $42, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_0), lo(RectangleOuter_0) 
Money_50_1 
                    db       $16, $01, -$10, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$0C, $01, -$21, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1A, $01, $0B, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $0E, $01, $20 
                    db       -$19, $01, $0B 
                    db       -$0E, $01, -$22 
                    db       $13, $01, $2D, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $31, $01, -$15, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0E, $01, $20, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$33, $01, $16 
                    db       -$0C, $01, -$21 
                    db       $56, $01, $22, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_1), lo(RectangleOuter_1) 
Money_50_2 
                    db       $0F, $01, -$18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$19, $01, -$19, hi(SMVB_startDraw_yEqx_single), lo(SMVB_startDraw_yEqx_single) ; y is -$19 
                    db       -$13, $01, $14, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $18, $01, $18 
                    db       -$13, $01, $14 
                    db       -$1A, $01, -$19 
                    db       $23, $01, $22, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $27, $01, -$27, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $19, $01, $19, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$27, $01, $27 
                    db       -$19, $01, -$19 
                    db       $5F, $01, -$02, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_2), lo(RectangleOuter_2) 
Money_50_3 
                    db       $05, $01, -$1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$20, $01, -$0E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0B, $01, $19, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $20, $01, $0E 
                    db       -$0A, $01, $18 
                    db       -$22, $01, -$0E 
                    db       $2D, $01, $13, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $15, $01, -$31, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $21, $01, $0C, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$16, $01, $33 
                    db       -$20, $01, -$0E 
                    db       $57, $01, -$25, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_3), lo(RectangleOuter_3) 
Money_50_4 
                    db       -$06, $01, -$1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$23, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $1B, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $23, $01, $00 
                    db       $00, $01, $1B 
                    db       -$25, $01, $00 
                    db       $31, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, -$36, hi(SMVB_startDraw_newY_eq_oldX_single), lo(SMVB_startDraw_newY_eq_oldX_single) ; y was $00, now SHIFT 
                    db       $23, $01, $00, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $00, $01, $36 
                    db       -$23, $01, $00 
                    db       $42, $01, -$43, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_4), lo(RectangleOuter_4) 
Money_50_5 
                    db       -$10, $01, -$16, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$21, $01, $0C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0B, $01, $1A, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $20, $01, -$0E 
                    db       $0B, $01, $19 
                    db       -$22, $01, $0E 
                    db       $2D, $01, -$13, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$15, $01, -$31, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $20, $01, -$0E, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $16, $01, $33 
                    db       -$21, $01, $0C 
                    db       $22, $01, -$56, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_5), lo(RectangleOuter_5) 
Money_50_6 
                    db       -$18, $01, -$0F, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$19, $01, $19, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $14, $01, $13, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $18, $01, -$18 
                    db       $14, $01, $13 
                    db       -$19, $01, $1A 
                    db       $22, $01, -$23, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$27, $01, -$27, hi(SMVB_startDraw_yEqx_single), lo(SMVB_startDraw_yEqx_single) ; y is -$27 
                    db       $19, $01, -$19, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $27, $01, $27 
                    db       -$19, $01, $19 
                    db       -$02, $01, -$5F, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_6), lo(RectangleOuter_6) 
Money_50_7 
                    db       -$1B, $01, -$05, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$0E, $01, $20, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $19, $01, $0B, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $0E, $01, -$20 
                    db       $18, $01, $0A 
                    db       -$0E, $01, $22 
                    db       $13, $01, -$2D, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$31, $01, -$15, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0C, $01, -$21, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $33, $01, $16 
                    db       -$0E, $01, $20 
                    db       -$25, $01, -$57, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_7), lo(RectangleOuter_7) 
Money_50_8 
                    db       -$1B, $01, $06, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, $23, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1B, $01, $00, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $00, $01, -$23 
                    db       $1B, $01, $00 
                    db       $00, $01, $25 
                    db       $00, $01, -$31, hi(SMVB_startMove_yStays_single), lo(SMVB_startMove_yStays_single) ; y was $00, now 0 
                    db       -$36, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$23, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $36, $01, $00 
                    db       $00, $01, $23 
                    db       -$43, $01, -$42, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_8), lo(RectangleOuter_8) 
Money_50_9 
                    db       -$16, $01, $10, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $0C, $01, $21, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1A, $01, -$0B, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$0E, $01, -$20 
                    db       $19, $01, -$0B 
                    db       $0E, $01, $22 
                    db       -$13, $01, -$2D, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$31, $01, $15, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0E, $01, -$20, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $33, $01, -$16 
                    db       $0C, $01, $21 
                    db       -$56, $01, -$22, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_9), lo(RectangleOuter_9) 
Money_50_10 
                    db       -$0F, $01, $18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $19, $01, $19, hi(SMVB_startDraw_yEqx_single), lo(SMVB_startDraw_yEqx_single) ; y is $19 
                    db       $13, $01, -$14, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$18, $01, -$18 
                    db       $13, $01, -$14 
                    db       $1A, $01, $19 
                    db       -$23, $01, -$22, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$27, $01, $27, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$19, $01, -$19, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $27, $01, -$27 
                    db       $19, $01, $19 
                    db       -$5F, $01, $02, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_10), lo(RectangleOuter_10) 
Money_50_11 
                    db       -$05, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $20, $01, $0E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0B, $01, -$19, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$20, $01, -$0E 
                    db       $0A, $01, -$18 
                    db       $22, $01, $0E 
                    db       -$2D, $01, -$13, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$15, $01, $31, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$21, $01, -$0C, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $16, $01, -$33 
                    db       $20, $01, $0E 
                    db       -$57, $01, $25, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_11), lo(RectangleOuter_11) 
Money_50_12 
                    db       $06, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $23, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1B, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$23, $01, $00 
                    db       $00, $01, -$1B 
                    db       $25, $01, $00 
                    db       -$31, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, $36, hi(SMVB_startDraw_newY_eq_oldX_single), lo(SMVB_startDraw_newY_eq_oldX_single) ; y was $00, now SHIFT 
                    db       -$23, $01, $00, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $00, $01, -$36 
                    db       $23, $01, $00 
                    db       -$42, $01, $43, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_12), lo(RectangleOuter_12) 
Money_50_13 
                    db       $10, $01, $16, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $21, $01, -$0C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0B, $01, -$1A, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$20, $01, $0E 
                    db       -$0B, $01, -$19 
                    db       $22, $01, -$0E 
                    db       -$2D, $01, $13, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $15, $01, $31, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$20, $01, $0E, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$16, $01, -$33 
                    db       $21, $01, -$0C 
                    db       -$22, $01, $56, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_13), lo(RectangleOuter_13) 
Money_50_14 
                    db       $18, $01, $0F, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $19, $01, -$19, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$14, $01, -$13, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$18, $01, $18 
                    db       -$14, $01, -$13 
                    db       $19, $01, -$1A 
                    db       -$22, $01, $23, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $27, $01, $27, hi(SMVB_startDraw_yEqx_single), lo(SMVB_startDraw_yEqx_single) ; y is $27 
                    db       -$19, $01, $19, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$27, $01, -$27 
                    db       $19, $01, -$19 
                    db       $02, $01, $5F, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_14), lo(RectangleOuter_14) 
Money_50_15 
                    db       $1B, $01, $05, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $0E, $01, -$20, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$19, $01, -$0B, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$0E, $01, $20 
                    db       -$18, $01, -$0A 
                    db       $0E, $01, -$22 
                    db       -$13, $01, $2D, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $31, $01, $15, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0C, $01, $21, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$33, $01, -$16 
                    db       $0E, $01, -$20 
                    db       $25, $01, $57, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_15), lo(RectangleOuter_15) 
Money_20_Anim 
                    DW       Money_20_0                   ; list of all single vectorlists in this 
                    DW       Money_20_1 
                    DW       Money_20_2 
                    DW       Money_20_3 
                    DW       Money_20_4 
                    DW       Money_20_5 
                    DW       Money_20_6 
                    DW       Money_20_7 
                    DW       Money_20_8 
                    DW       Money_20_9 
                    DW       Money_20_10 
                    DW       Money_20_11 
                    DW       Money_20_12 
                    DW       Money_20_13 
                    DW       Money_20_14 
                    DW       Money_20_15 
                    DW       0 
Money_20_0 
                    db       $1B, $01, -$2B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, $25, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1B, $01, $00, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $00, $01, -$25 
                    db       -$1B, $01, $00 
                    db       $00, $01, $25 
                    db       $00, $01, $0C, hi(SMVB_startMove_yStays_single), lo(SMVB_startMove_yStays_single) ; y was $00, now 0 
                    db       $36, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $23, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$36, $01, $00 
                    db       $00, $01, -$23 
                    db       $43, $01, $39, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_0), lo(RectangleOuter_0) 
Money_20_1 
                    db       $08, $01, -$32, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $0E, $01, $22, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$18, $01, $0A, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$0E, $01, -$21 
                    db       -$19, $01, $0A 
                    db       $0E, $01, $22 
                    db       $05, $01, $0B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $31, $01, -$15, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0E, $01, $20, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$33, $01, $16 
                    db       -$0C, $01, -$21 
                    db       $54, $01, $1B, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_1), lo(RectangleOuter_1) 
Money_20_2 
                    db       -$0A, $01, -$32, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $19, $01, $1A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$14, $01, $13, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$19, $01, -$19 
                    db       -$14, $01, $14 
                    db       $1A, $01, $19 
                    db       $09, $01, $09, hi(SMVB_startMove_yEqx_single), lo(SMVB_startMove_yEqx_single) ; y is $09 
                    db       $27, $01, -$27, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $19, $01, $19, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$27, $01, $27 
                    db       -$19, $01, -$19 
                    db       $58, $01, -$08, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_2), lo(RectangleOuter_2) 
Money_20_3 
                    db       -$1D, $01, -$29, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $22, $01, $0E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0B, $01, $19, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$21, $01, -$0E 
                    db       -$0B, $01, $18 
                    db       $22, $01, $0E 
                    db       $0B, $01, $05, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $15, $01, -$31, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $21, $01, $0C, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$16, $01, $33 
                    db       -$20, $01, -$0E 
                    db       $4E, $01, -$27, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_3), lo(RectangleOuter_3) 
Money_20_4 
                    db       -$2B, $01, -$1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $25, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $1B, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$25, $01, $00 
                    db       $00, $01, $1B 
                    db       $25, $01, $00 
                    db       $0C, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, -$36, hi(SMVB_startDraw_newY_eq_oldX_single), lo(SMVB_startDraw_newY_eq_oldX_single) ; y was $00, now SHIFT 
                    db       $23, $01, $00, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $00, $01, $36 
                    db       -$23, $01, $00 
                    db       $39, $01, -$43, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_4), lo(RectangleOuter_4) 
Money_20_5 
                    db       -$32, $01, -$08, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $22, $01, -$0E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0A, $01, $18, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$21, $01, $0E 
                    db       $0A, $01, $19 
                    db       $22, $01, -$0E 
                    db       $0B, $01, -$05, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$15, $01, -$31, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $20, $01, -$0E, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $16, $01, $33 
                    db       -$21, $01, $0C 
                    db       $1B, $01, -$54, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_5), lo(RectangleOuter_5) 
Money_20_6 
                    db       -$32, $01, $0A, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1A, $01, -$19, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $13, $01, $14, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$19, $01, $19 
                    db       $14, $01, $14 
                    db       $19, $01, -$1A 
                    db       $09, $01, -$09, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$27, $01, -$27, hi(SMVB_startDraw_yEqx_single), lo(SMVB_startDraw_yEqx_single) ; y is -$27 
                    db       $19, $01, -$19, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $27, $01, $27 
                    db       -$19, $01, $19 
                    db       -$08, $01, -$58, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_6), lo(RectangleOuter_6) 
Money_20_7 
                    db       -$29, $01, $1D, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $0E, $01, -$22, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $19, $01, $0B, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$0E, $01, $21 
                    db       $18, $01, $0B 
                    db       $0E, $01, -$22 
                    db       $05, $01, -$0B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$31, $01, -$15, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0C, $01, -$21, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $33, $01, $16 
                    db       -$0E, $01, $20 
                    db       -$27, $01, -$4E, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_7), lo(RectangleOuter_7) 
Money_20_8 
                    db       -$1B, $01, $2B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$25, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1B, $01, $00, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $00, $01, $25 
                    db       $1B, $01, $00 
                    db       $00, $01, -$25 
                    db       $00, $01, -$0C, hi(SMVB_startMove_yStays_single), lo(SMVB_startMove_yStays_single) ; y was $00, now 0 
                    db       -$36, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$23, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $36, $01, $00 
                    db       $00, $01, $23 
                    db       -$43, $01, -$39, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_8), lo(RectangleOuter_8) 
Money_20_9 
                    db       -$08, $01, $32, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$0E, $01, -$22, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $18, $01, -$0A, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $0E, $01, $21 
                    db       $19, $01, -$0A 
                    db       -$0E, $01, -$22 
                    db       -$05, $01, -$0B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$31, $01, $15, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0E, $01, -$20, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $33, $01, -$16 
                    db       $0C, $01, $21 
                    db       -$54, $01, -$1B, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_9), lo(RectangleOuter_9) 
Money_20_10 
                    db       $0A, $01, $32, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$19, $01, -$1A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $14, $01, -$13, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $19, $01, $19 
                    db       $14, $01, -$14 
                    db       -$1A, $01, -$19 
                    db       -$09, $01, -$09, hi(SMVB_startMove_yEqx_single), lo(SMVB_startMove_yEqx_single) ; y is -$09 
                    db       -$27, $01, $27, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$19, $01, -$19, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $27, $01, -$27 
                    db       $19, $01, $19 
                    db       -$58, $01, $08, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_10), lo(RectangleOuter_10) 
Money_20_11 
                    db       $1D, $01, $29, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$22, $01, -$0E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0B, $01, -$19, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $21, $01, $0E 
                    db       $0B, $01, -$18 
                    db       -$22, $01, -$0E 
                    db       -$0B, $01, -$05, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$15, $01, $31, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$21, $01, -$0C, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $16, $01, -$33 
                    db       $20, $01, $0E 
                    db       -$4E, $01, $27, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_11), lo(RectangleOuter_11) 
Money_20_12 
                    db       $2B, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$25, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1B, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $25, $01, $00 
                    db       $00, $01, -$1B 
                    db       -$25, $01, $00 
                    db       -$0C, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, $36, hi(SMVB_startDraw_newY_eq_oldX_single), lo(SMVB_startDraw_newY_eq_oldX_single) ; y was $00, now SHIFT 
                    db       -$23, $01, $00, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $00, $01, -$36 
                    db       $23, $01, $00 
                    db       -$39, $01, $43, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_12), lo(RectangleOuter_12) 
Money_20_13 
                    db       $32, $01, $08, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$22, $01, $0E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0A, $01, -$18, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $21, $01, -$0E 
                    db       -$0A, $01, -$19 
                    db       -$22, $01, $0E 
                    db       -$0B, $01, $05, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $15, $01, $31, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$20, $01, $0E, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$16, $01, -$33 
                    db       $21, $01, -$0C 
                    db       -$1B, $01, $54, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_13), lo(RectangleOuter_13) 
Money_20_14 
                    db       $32, $01, -$0A, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$1A, $01, $19, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$13, $01, -$14, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $19, $01, -$19 
                    db       -$14, $01, -$14 
                    db       -$19, $01, $1A 
                    db       -$09, $01, $09, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $27, $01, $27, hi(SMVB_startDraw_yEqx_single), lo(SMVB_startDraw_yEqx_single) ; y is $27 
                    db       -$19, $01, $19, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$27, $01, -$27 
                    db       $19, $01, -$19 
                    db       $08, $01, $58, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_14), lo(RectangleOuter_14) 
Money_20_15 
                    db       $29, $01, -$1D, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$0E, $01, $22, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$19, $01, -$0B, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $0E, $01, -$21 
                    db       -$18, $01, -$0B 
                    db       -$0E, $01, $22 
                    db       -$05, $01, $0B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $31, $01, $15, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0C, $01, $21, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$33, $01, -$16 
                    db       $0E, $01, -$20 
                    db       $27, $01, $4E, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_15), lo(RectangleOuter_15) 
Money200_Anim 
                    DW       Money_200_0                  ; list of all single vectorlists in this 
                    DW       Money_200_1 
                    DW       Money_200_2 
                    DW       Money_200_3 
                    DW       Money_200_4 
                    DW       Money_200_5 
                    DW       Money_200_6 
                    DW       Money_200_7 
                    DW       Money_200_8 
                    DW       Money_200_9 
                    DW       Money_200_10 
                    DW       Money_200_11 
                    DW       Money_200_12 
                    DW       Money_200_13 
                    DW       Money_200_14 
                    DW       Money_200_15 
                    DW       0 
Money_200_0 
                    db       $1B, $01, -$2B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, $19, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1B, $01, $00, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $00, $01, -$19 
                    db       -$1B, $01, $00 
                    db       $00, $01, $1A 
                    db       $00, $01, $07, hi(SMVB_startMove_yStays_single), lo(SMVB_startMove_yStays_single) ; y was $00, now 0 
                    db       $36, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $14, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$36, $01, $00 
                    db       $00, $01, -$14 
                    db       $00, $01, $1C, hi(SMVB_startMove_yStays_single), lo(SMVB_startMove_yStays_single) ; y was $00, now 0 
                    db       $36, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $14, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$36, $01, $00 
                    db       $00, $01, -$15 
                    db       $43, $01, $2E, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_0), lo(RectangleOuter_0) 
Money_200_1 
                    db       $08, $01, -$32, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $0B, $01, $17, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$19, $01, $0B, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$0A, $01, -$17 
                    db       -$19, $01, $0A 
                    db       $08, $01, $17 
                    db       $04, $01, $07, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $32, $01, -$15, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $08, $01, $13, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$32, $01, $15 
                    db       -$08, $01, -$13 
                    db       $0A, $01, $1A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $34, $01, -$15, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $07, $01, $12, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$33, $01, $15 
                    db       -$08, $01, -$13 
                    db       $51, $01, $11, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_1), lo(RectangleOuter_1) 
Money_200_2 
                    db       -$0A, $01, -$32, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $11, $01, $11, hi(SMVB_startDraw_yEqx_single), lo(SMVB_startDraw_yEqx_single) ; y is $11 
                    db       -$13, $01, $15, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$12, $01, -$12 
                    db       -$14, $01, $14 
                    db       $13, $01, $11 
                    db       $05, $01, $05, hi(SMVB_startMove_yEqx_single), lo(SMVB_startMove_yEqx_single) ; y is $05 
                    db       $26, $01, -$26, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0E, $01, $0E, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$26, $01, $26 
                    db       -$0E, $01, -$0E 
                    db       $13, $01, $15, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $28, $01, -$28, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0D, $01, $0E, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$27, $01, $27 
                    db       -$0E, $01, -$0F 
                    db       $50, $01, -$0F, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_2), lo(RectangleOuter_2) 
Money_200_3 
                    db       -$1D, $01, -$29, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $17, $01, $08, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0A, $01, $1B, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$17, $01, -$0A 
                    db       -$0B, $01, $18 
                    db       $18, $01, $0B 
                    db       $06, $01, $02, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $15, $01, -$32, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $13, $01, $08, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$15, $01, $32 
                    db       -$13, $01, -$08 
                    db       $1A, $01, $0C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $15, $01, -$34, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $12, $01, $08, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$15, $01, $33 
                    db       -$12, $01, -$07 
                    db       $43, $01, -$2D, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_3), lo(RectangleOuter_3) 
Money_200_4 
                    db       -$2B, $01, -$1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1A, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $1B, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$1A, $01, $00 
                    db       $00, $01, $1B 
                    db       $1A, $01, $00 
                    db       $07, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, -$36, hi(SMVB_startDraw_newY_eq_oldX_single), lo(SMVB_startDraw_newY_eq_oldX_single) ; y was $00, now SHIFT 
                    db       $14, $01, $00, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $00, $01, $36 
                    db       -$14, $01, $00 
                    db       $1B, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, -$36, hi(SMVB_startDraw_newY_eq_oldX_single), lo(SMVB_startDraw_newY_eq_oldX_single) ; y was $00, now SHIFT 
                    db       $15, $01, $00, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $00, $01, $36 
                    db       -$15, $01, $00 
                    db       $2E, $01, -$43, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_4), lo(RectangleOuter_4) 
Money_200_5 
                    db       -$32, $01, -$08, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $17, $01, -$0B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0B, $01, $19, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$17, $01, $0A 
                    db       $0A, $01, $19 
                    db       $17, $01, -$08 
                    db       $07, $01, -$04, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$15, $01, -$32, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $13, $01, -$08, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $15, $01, $32 
                    db       -$13, $01, $08 
                    db       $1A, $01, -$0A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$15, $01, -$34, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $12, $01, -$07, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $15, $01, $33 
                    db       -$13, $01, $08 
                    db       $11, $01, -$51, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_5), lo(RectangleOuter_5) 
Money_200_6 
                    db       -$32, $01, $0A, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $11, $01, -$11, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $15, $01, $13, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$12, $01, $12 
                    db       $14, $01, $14 
                    db       $11, $01, -$13 
                    db       $05, $01, -$05, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$26, $01, -$26, hi(SMVB_startDraw_yEqx_single), lo(SMVB_startDraw_yEqx_single) ; y is -$26 
                    db       $0E, $01, -$0E, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $26, $01, $26 
                    db       -$0E, $01, $0E 
                    db       $15, $01, -$13, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$28, $01, -$28, hi(SMVB_startDraw_yEqx_single), lo(SMVB_startDraw_yEqx_single) ; y is -$28 
                    db       $0E, $01, -$0D, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $27, $01, $27 
                    db       -$0F, $01, $0E 
                    db       $00, $01, -$50, hi(SMVB_startMove_yStays_single_sj), lo(SMVB_startMove_yStays_single_sj), hi(RectangleOuter_6), lo(RectangleOuter_6) ; y was -$0F, now 0 
Money_200_7 
                    db       -$29, $01, $1D, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $08, $01, -$17, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1B, $01, $0A, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$0A, $01, $17 
                    db       $18, $01, $0B 
                    db       $0B, $01, -$18 
                    db       $02, $01, -$06, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$32, $01, -$15, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $08, $01, -$13, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $32, $01, $15 
                    db       -$08, $01, $13 
                    db       $0C, $01, -$1A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$34, $01, -$15, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $08, $01, -$12, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $33, $01, $15 
                    db       -$07, $01, $12 
                    db       -$2D, $01, -$43, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_7), lo(RectangleOuter_7) 
Money_200_8 
                    db       -$1B, $01, $2B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$1A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1B, $01, $00, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $00, $01, $1A 
                    db       $1B, $01, $00 
                    db       $00, $01, -$1A 
                    db       $00, $01, -$07, hi(SMVB_startMove_yStays_single), lo(SMVB_startMove_yStays_single) ; y was $00, now 0 
                    db       -$36, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$14, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $36, $01, $00 
                    db       $00, $01, $14 
                    db       $00, $01, -$1B, hi(SMVB_startMove_yStays_single), lo(SMVB_startMove_yStays_single) ; y was $00, now 0 
                    db       -$36, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$15, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $36, $01, $00 
                    db       $00, $01, $15 
                    db       -$43, $01, -$2E, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_8), lo(RectangleOuter_8) 
Money_200_9 
                    db       -$08, $01, $32, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$0B, $01, -$17, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $19, $01, -$0B, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $0A, $01, $17 
                    db       $19, $01, -$0A 
                    db       -$08, $01, -$17 
                    db       -$04, $01, -$07, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$32, $01, $15, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$08, $01, -$13, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $32, $01, -$15 
                    db       $08, $01, $13 
                    db       -$0A, $01, -$1A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$34, $01, $15, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$07, $01, -$12, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $33, $01, -$15 
                    db       $08, $01, $13 
                    db       -$51, $01, -$11, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_9), lo(RectangleOuter_9) 
Money_200_10 
                    db       $0A, $01, $32, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$11, $01, -$11, hi(SMVB_startDraw_yEqx_single), lo(SMVB_startDraw_yEqx_single) ; y is -$11 
                    db       $13, $01, -$15, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $12, $01, $12 
                    db       $14, $01, -$14 
                    db       -$13, $01, -$11 
                    db       -$05, $01, -$05, hi(SMVB_startMove_yEqx_single), lo(SMVB_startMove_yEqx_single) ; y is -$05 
                    db       -$26, $01, $26, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0E, $01, -$0E, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $26, $01, -$26 
                    db       $0E, $01, $0E 
                    db       -$13, $01, -$15, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$28, $01, $28, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0D, $01, -$0E, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $27, $01, -$27 
                    db       $0E, $01, $0F 
                    db       -$50, $01, $0F, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_10), lo(RectangleOuter_10) 
Money_200_11 
                    db       $1D, $01, $29, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$17, $01, -$08, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0A, $01, -$1B, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $17, $01, $0A 
                    db       $0B, $01, -$18 
                    db       -$18, $01, -$0B 
                    db       -$06, $01, -$02, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$15, $01, $32, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$13, $01, -$08, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $15, $01, -$32 
                    db       $13, $01, $08 
                    db       -$1A, $01, -$0C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$15, $01, $34, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$12, $01, -$08, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $15, $01, -$33 
                    db       $12, $01, $07 
                    db       -$43, $01, $2D, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_11), lo(RectangleOuter_11) 
Money_200_12 
                    db       $2B, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$1A, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1B, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $1A, $01, $00 
                    db       $00, $01, -$1B 
                    db       -$1A, $01, $00 
                    db       -$07, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, $36, hi(SMVB_startDraw_newY_eq_oldX_single), lo(SMVB_startDraw_newY_eq_oldX_single) ; y was $00, now SHIFT 
                    db       -$14, $01, $00, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $00, $01, -$36 
                    db       $14, $01, $00 
                    db       -$1B, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, $36, hi(SMVB_startDraw_newY_eq_oldX_single), lo(SMVB_startDraw_newY_eq_oldX_single) ; y was $00, now SHIFT 
                    db       -$15, $01, $00, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $00, $01, -$36 
                    db       $15, $01, $00 
                    db       -$2E, $01, $43, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_12), lo(RectangleOuter_12) 
Money_200_13 
                    db       $32, $01, $08, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$17, $01, $0B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0B, $01, -$19, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $17, $01, -$0A 
                    db       -$0A, $01, -$19 
                    db       -$17, $01, $08 
                    db       -$07, $01, $04, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $15, $01, $32, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$13, $01, $08, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$15, $01, -$32 
                    db       $13, $01, -$08 
                    db       -$1A, $01, $0A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $15, $01, $34, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$12, $01, $07, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$15, $01, -$33 
                    db       $13, $01, -$08 
                    db       -$11, $01, $51, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_13), lo(RectangleOuter_13) 
Money_200_14 
                    db       $32, $01, -$0A, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$11, $01, $11, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$15, $01, -$13, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $12, $01, -$12 
                    db       -$14, $01, -$14 
                    db       -$11, $01, $13 
                    db       -$05, $01, $05, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $26, $01, $26, hi(SMVB_startDraw_yEqx_single), lo(SMVB_startDraw_yEqx_single) ; y is $26 
                    db       -$0E, $01, $0E, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$26, $01, -$26 
                    db       $0E, $01, -$0E 
                    db       -$15, $01, $13, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $28, $01, $28, hi(SMVB_startDraw_yEqx_single), lo(SMVB_startDraw_yEqx_single) ; y is $28 
                    db       -$0E, $01, $0D, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$27, $01, -$27 
                    db       $0F, $01, -$0E 
                    db       $00, $01, $50, hi(SMVB_startMove_yStays_single_sj), lo(SMVB_startMove_yStays_single_sj), hi(RectangleOuter_14), lo(RectangleOuter_14) ; y was $0F, now 0 
Money_200_15 
                    db       $29, $01, -$1D, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$08, $01, $17, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1B, $01, -$0A, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $0A, $01, -$17 
                    db       -$18, $01, -$0B 
                    db       -$0B, $01, $18 
                    db       -$02, $01, $06, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $32, $01, $15, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$08, $01, $13, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$32, $01, -$15 
                    db       $08, $01, -$13 
                    db       -$0C, $01, $1A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $34, $01, $15, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$08, $01, $12, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$33, $01, -$15 
                    db       $07, $01, -$12 
                    db       $2D, $01, $43, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(RectangleOuter_15), lo(RectangleOuter_15) 
