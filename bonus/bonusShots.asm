BonusShot1 
                    dw       BonusShot1_Anim 
                    db       BONUS_SHOT1                  ; type 
BonusShot2 
                    dw       BonusShot2_Anim 
                    db       BONUS_SHOT2                  ; type 
BonusShot3 
                    dw       BonusShot3_Anim 
                    db       BONUS_SHOT3                  ; type 
BonusShot4 
                    dw       BonusShot4_Anim 
                    db       BONUS_SHOT4                  ; type 
BonusShot1Anim 
BonusShot1_Anim 
                    DW       BonusShot1Inner0             ; list of all single vectorlists in this 
                    DW       BonusShot1Inner1 
                    DW       BonusShot1Inner2 
                    DW       BonusShot1Inner3 
                    DW       BonusShot1Inner4 
                    DW       BonusShot1Inner5 
                    DW       BonusShot1Inner6 
                    DW       BonusShot1Inner7 
                    DW       BonusShot1Inner8 
                    DW       BonusShot1Inner7 
                    DW       BonusShot1Inner6 
                    DW       BonusShot1Inner5 
                    DW       BonusShot1Inner4 
                    DW       BonusShot1Inner3 
                    DW       BonusShot1Inner2 
                    DW       BonusShot1Inner1 
                    DW       0 
BonusShot1Inner0 
                    db       -$1F, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $3E, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $11, $01, $30, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_0), lo(BonusCircle_0) 
BonusShot1Inner1 
                    db       -$1E, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $3C, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0F, $01, $30, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_1), lo(BonusCircle_1) 
BonusShot1Inner2 
                    db       -$18, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $30, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0C, $01, $30, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_2), lo(BonusCircle_2) 
BonusShot1Inner3 
                    db       -$0D, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1A, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $08, $01, $30, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_3), lo(BonusCircle_3) 
BonusShot1Inner4 
                    db       -$03, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $06, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $01, $01, $30, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_4), lo(BonusCircle_4) 
BonusShot1Inner5 
                    db       $09, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$12, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$04, $01, $30, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_5), lo(BonusCircle_5) 
BonusShot1Inner6 
                    db       $13, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$26, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$09, $01, $30, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_6), lo(BonusCircle_6) 
BonusShot1Inner7 
                    db       $1B, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$36, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0D, $01, $30, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_7), lo(BonusCircle_7) 
BonusShot1Inner8 
                    db       $1F, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$3E, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0F, $01, $30, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_8), lo(BonusCircle_8) 
BonusShot2Anim 
BonusShot2_Anim 
                    DW       BonusShot2Inner0             ; list of all single vectorlists in this 
                    DW       BonusShot2Inner1 
                    DW       BonusShot2Inner2 
                    DW       BonusShot2Inner3 
                    DW       BonusShot2Inner4 
                    DW       BonusShot2Inner5 
                    DW       BonusShot2Inner6 
                    DW       BonusShot2Inner7 
                    DW       BonusShot2Inner8 
                    DW       BonusShot2Inner7 
                    DW       BonusShot2Inner6 
                    DW       BonusShot2Inner5 
                    DW       BonusShot2Inner4 
                    DW       BonusShot2Inner3 
                    DW       BonusShot2Inner2 
                    DW       BonusShot2Inner1 
                    DW       0 
BonusShot2Inner0 
                    db       $1F, $01, $18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$3E, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$30, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       $3E, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $11, $01, $48, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_0), lo(BonusCircle_0) 
BonusShot2Inner1 
                    db       $1E, $01, $18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$3C, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$30, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       $3C, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0F, $01, $48, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_1), lo(BonusCircle_1) 
BonusShot2Inner2 
                    db       $18, $01, $18, hi(SMVB_continue_yEqx_single), lo(SMVB_continue_yEqx_single) ; y is $18 
                    db       -$30, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$30, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       $30, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0C, $01, $48, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_2), lo(BonusCircle_2) 
BonusShot2Inner3 
                    db       $0D, $01, $18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$1A, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$30, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       $1A, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $08, $01, $48, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_3), lo(BonusCircle_3) 
BonusShot2Inner4 
                    db       $03, $01, $18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$06, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$30, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       $06, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $01, $01, $48, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_4), lo(BonusCircle_4) 
BonusShot2Inner5 
                    db       -$09, $01, $18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $12, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$30, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       -$12, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$04, $01, $48, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_5), lo(BonusCircle_5) 
BonusShot2Inner6 
                    db       -$13, $01, $18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $26, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$30, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       -$26, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$09, $01, $48, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_6), lo(BonusCircle_6) 
BonusShot2Inner7 
                    db       -$1B, $01, $18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $36, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$30, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       -$36, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0D, $01, $48, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_7), lo(BonusCircle_7) 
BonusShot2Inner8 
                    db       -$1F, $01, $18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $3E, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$30, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       -$3E, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0F, $01, $48, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_8), lo(BonusCircle_8) 
BonusShot3Anim 
BonusShot3_Anim 
                    DW       BonusShot3_0                 ; list of all single vectorlists in this 
                    DW       BonusShot3_1 
                    DW       BonusShot3_2 
                    DW       BonusShot3_3 
                    DW       BonusShot3_4 
                    DW       BonusShot3_5 
                    DW       BonusShot3_6 
                    DW       BonusShot3_7 
                    DW       BonusShot3_8 
                    DW       BonusShot3_7 
                    DW       BonusShot3_6 
                    DW       BonusShot3_5 
                    DW       BonusShot3_4 
                    DW       BonusShot3_3 
                    DW       BonusShot3_2 
                    DW       BonusShot3_1 
                    DW       0 
BonusShot3_0 
                    db       -$1F, $01, $1E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $3E, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1E, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       -$3E, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1E, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       $3E, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $11, $01, $4E, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_0), lo(BonusCircle_0) 
BonusShot3_1 
                    db       -$1D, $01, $1E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $3A, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1E, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       -$3A, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1E, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       $3A, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $10, $01, $4E, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_1), lo(BonusCircle_1) 
BonusShot3_2 
                    db       -$17, $01, $1E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $2E, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1E, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       -$2E, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1E, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       $2E, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0C, $01, $4E, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_2), lo(BonusCircle_2) 
BonusShot3_3 
                    db       -$0E, $01, $1E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1C, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1E, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       -$1C, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1E, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       $1C, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $07, $01, $4E, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_3), lo(BonusCircle_3) 
BonusShot3_4 
                    db       -$03, $01, $1E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $06, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1E, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       -$06, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1E, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       $06, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $01, $01, $4E, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_4), lo(BonusCircle_4) 
BonusShot3_5 
                    db       $08, $01, $1E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$10, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1E, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       $10, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1E, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       -$10, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$05, $01, $4E, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_5), lo(BonusCircle_5) 
BonusShot3_6 
                    db       $13, $01, $1E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$26, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1E, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       $26, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1E, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       -$26, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0A, $01, $4E, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_6), lo(BonusCircle_6) 
BonusShot3_7 
                    db       $1A, $01, $1E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$34, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1E, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       $34, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1E, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       -$34, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0F, $01, $4E, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_7), lo(BonusCircle_7) 
BonusShot3_8 
                    db       $1E, $01, $1E, hi(SMVB_continue_yEqx_single), lo(SMVB_continue_yEqx_single) ; y is $1E 
                    db       -$3C, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1E, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       $3C, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1E, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       -$3C, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$11, $01, $4E, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_8), lo(BonusCircle_8) 
BonusShot4Anim 
BonusShot4_Anim 
                    DW       BonusShot4_Impl              ; list of all single vectorlists in this 
                    DW       0 
BonusShot4_Impl 
                    db       $1F, $01, $28, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$3E, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1B, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       $3E, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1A, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       -$3E, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1B, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       $3E, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $11, $01, $58, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_0), lo(BonusCircle_0) 
