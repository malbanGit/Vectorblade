BonusMult2 
                    dw       BonusMult2Anim 
                    db       BONUS_MULT2                  ; type 
BonusMult5 
                    dw       BonusMult5Anim 
                    db       BONUS_MULT5                  ; type 
BonusMult2Anim 
                    DW       BonusMult20                  ; list of all single vectorlists in this 
                    DW       BonusMult21 
                    DW       BonusMult22 
                    DW       BonusMult23 
                    DW       BonusMult24 
                    DW       BonusMult25 
                    DW       BonusMult26 
                    DW       BonusMult27 
                    DW       BonusMult28 
                    DW       BonusMult27 
                    DW       BonusMult26 
                    DW       BonusMult25 
                    DW       BonusMult24 
                    DW       BonusMult23 
                    DW       BonusMult22 
                    DW       BonusMult21 
                    DW       0 
BonusMult20 
                    db       $10, $01, -$25, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$22, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $22, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $15, $01, $13, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$47, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $15, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       $47, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0B, $01, $11, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_0), lo(BonusCircle_0) 
BonusMult21 
                    db       $0F, $01, -$25, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$1F, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $1F, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $13, $01, $13, hi(SMVB_startMove_yEqx_single), lo(SMVB_startMove_yEqx_single) ; y is $13 
                    db       -$41, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $15, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       $41, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0B, $01, $11, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_1), lo(BonusCircle_1) 
BonusMult22 
                    db       $0C, $01, -$25, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$19, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $19, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0F, $01, $13, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$34, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $15, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       $34, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $09, $01, $11, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_2), lo(BonusCircle_2) 
BonusMult23 
                    db       $07, $01, -$25, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$0E, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $0E, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $09, $01, $13, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$1F, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $15, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       $1F, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $05, $01, $11, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_3), lo(BonusCircle_3) 
BonusMult24 
                    db       $01, $01, -$25, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$02, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $02, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $13, hi(SMVB_startMove_yStays_single), lo(SMVB_startMove_yStays_single) ; y was $02, now 0 
                    db       -$06, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $15, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       $06, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $01, $01, $11, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_4), lo(BonusCircle_4) 
BonusMult25 
                    db       -$04, $01, -$25, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $08, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$08, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$06, $01, $13, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, $00, hi(SMVB_startDraw_newY_eq_oldX_single), lo(SMVB_startDraw_newY_eq_oldX_single) ; y was $13, now SHIFT 
                    db       $00, $01, $15, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       -$13, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$03, $01, $11, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_5), lo(BonusCircle_5) 
BonusMult26 
                    db       -$0A, $01, -$25, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $14, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$14, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0C, $01, $13, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $2B, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $15, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       -$2B, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$06, $01, $11, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_6), lo(BonusCircle_6) 
BonusMult27 
                    db       -$0D, $01, -$25, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1C, $01, $1C, hi(SMVB_startDraw_yEqx_single), lo(SMVB_startDraw_yEqx_single) ; y is $1C 
                    db       $00, $01, -$1C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, $1C, hi(SMVB_startDraw_newY_eq_oldX_single), lo(SMVB_startDraw_newY_eq_oldX_single) ; y was -$1C, now SHIFT 
                    db       -$12, $01, $13, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $3D, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $15, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       -$3D, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$09, $01, $11, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_7), lo(BonusCircle_7) 
BonusMult28 
                    db       -$10, $01, -$25, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $22, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$22, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$15, $01, $13, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $47, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $15, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       -$47, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$09, $01, $11, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_8), lo(BonusCircle_8) 
BonusMult5Anim 
                    DW       BonusMult50                  ; list of all single vectorlists in this 
                    DW       BonusMult51 
                    DW       BonusMult52 
                    DW       BonusMult53 
                    DW       BonusMult54 
                    DW       BonusMult55 
                    DW       BonusMult56 
                    DW       BonusMult57 
                    DW       BonusMult58 
                    DW       BonusMult57 
                    DW       BonusMult56 
                    DW       BonusMult55 
                    DW       BonusMult54 
                    DW       BonusMult53 
                    DW       BonusMult52 
                    DW       BonusMult51 
                    DW       0 
BonusMult50 
                    db       $10, $01, -$25, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$22, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $22, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $14, $01, $09, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$46, $01, $10, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $46, $01, $14, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $0C, $01, $0C, hi(SMVB_startMove_yEqx_single_sj), lo(SMVB_startMove_yEqx_single_sj), hi(BonusCircle_0), lo(BonusCircle_0) ; y is $0C 
BonusMult51 
                    db       $0F, $01, -$25, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$1F, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $1F, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $12, $01, $09, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$40, $01, $10, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $01, $14, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $0C, $01, $0C, hi(SMVB_startMove_yEqx_single_sj), lo(SMVB_startMove_yEqx_single_sj), hi(BonusCircle_1), lo(BonusCircle_1) ; y is $0C 
BonusMult52 
                    db       $0C, $01, -$25, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$19, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $19, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0F, $01, $09, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$34, $01, $10, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $34, $01, $14, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $09, $01, $0C, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_2), lo(BonusCircle_2) 
BonusMult53 
                    db       $07, $01, -$25, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$0E, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $0E, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $09, $01, $09, hi(SMVB_startMove_yEqx_single), lo(SMVB_startMove_yEqx_single) ; y is $09 
                    db       -$1F, $01, $10, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1F, $01, $14, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $05, $01, $0C, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_3), lo(BonusCircle_3) 
BonusMult54 
                    db       $01, $01, -$25, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$02, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $02, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $09, hi(SMVB_startMove_yStays_single), lo(SMVB_startMove_yStays_single) ; y was $02, now 0 
                    db       -$06, $01, $10, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $06, $01, $14, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $01, $01, $0C, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_4), lo(BonusCircle_4) 
BonusMult55 
                    db       -$04, $01, -$25, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $08, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$08, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$06, $01, $09, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $13, $01, $10, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$13, $01, $14, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$03, $01, $0C, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_5), lo(BonusCircle_5) 
BonusMult56 
                    db       -$0A, $01, -$25, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $14, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$14, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0B, $01, $09, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $2A, $01, $10, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$2A, $01, $14, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$07, $01, $0C, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_6), lo(BonusCircle_6) 
BonusMult57 
                    db       -$0D, $01, -$25, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1C, $01, $1C, hi(SMVB_startDraw_yEqx_single), lo(SMVB_startDraw_yEqx_single) ; y is $1C 
                    db       $00, $01, -$1C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, $1C, hi(SMVB_startDraw_newY_eq_oldX_single), lo(SMVB_startDraw_newY_eq_oldX_single) ; y was -$1C, now SHIFT 
                    db       -$11, $01, $09, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $3C, $01, $10, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$3C, $01, $14, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$0A, $01, $0C, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_7), lo(BonusCircle_7) 
BonusMult58 
                    db       -$10, $01, -$25, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $22, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$22, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$14, $01, $09, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $46, $01, $10, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$46, $01, $14, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$0A, $01, $0C, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_8), lo(BonusCircle_8) 
