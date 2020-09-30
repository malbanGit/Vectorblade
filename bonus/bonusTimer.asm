BonusTimer 
                    dw       BonusTimerAnim 
                    db       BONUS_TIMER                  ; type 
BonusTimerAnim 
BonusTimerAnim 
                    DW       BonusTimer0                  ; list of all single vectorlists in this 
                    DW       BonusTimer1 
                    DW       BonusTimer2 
                    DW       BonusTimer3 
                    DW       BonusTimer4 
                    DW       BonusTimer5 
                    DW       BonusTimer6 
                    DW       BonusTimer7 
                    DW       BonusTimer8 
                    DW       BonusTimer7 
                    DW       BonusTimer6 
                    DW       BonusTimer5 
                    DW       BonusTimer4 
                    DW       BonusTimer3 
                    DW       BonusTimer2 
                    DW       BonusTimer1 
                    DW       0 
BonusTimer0 
                    db       $3A, $01, $0A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$3A, $01, -$0A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $10, $01, $22, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $20, $01, $0E, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_0), lo(BonusCircle_0) 
BonusTimer1 
                    db       $36, $01, $0A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$36, $01, -$0A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $0F, $01, $22, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1E, $01, $0E, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_1), lo(BonusCircle_1) 
BonusTimer2 
                    db       $2B, $01, $0A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$2B, $01, -$0A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $0C, $01, $22, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $18, $01, $0E, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_2), lo(BonusCircle_2) 
BonusTimer3 
                    db       $19, $01, $0A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$19, $01, -$0A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $07, $01, $22, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0E, $01, $0E, hi(SMVB_startMove_yEqx_single_sj), lo(SMVB_startMove_yEqx_single_sj), hi(BonusCircle_3), lo(BonusCircle_3) ; y is $0E 
BonusTimer4 
                    db       $06, $01, $0A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$06, $01, -$0A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $01, $01, $22, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $03, $01, $0E, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_4), lo(BonusCircle_4) 
BonusTimer5 
                    db       -$10, $01, $0A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $10, $01, -$0A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$04, $01, $22, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$09, $01, $0E, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_5), lo(BonusCircle_5) 
BonusTimer6 
                    db       -$24, $01, $0A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $24, $01, -$0A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, $22, hi(SMVB_startDraw_newY_eq_oldX_single), lo(SMVB_startDraw_newY_eq_oldX_single) ; y was -$0A, now SHIFT 
                    db       -$12, $01, $0E, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_6), lo(BonusCircle_6) 
BonusTimer7 
                    db       -$31, $01, $0A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $31, $01, -$0A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$0D, $01, $22, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1B, $01, $0E, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_7), lo(BonusCircle_7) 
BonusTimer8 
                    db       -$39, $01, $0A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $39, $01, -$0A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$10, $01, $22, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1E, $01, $0E, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_8), lo(BonusCircle_8) 
