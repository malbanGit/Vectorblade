BonusBombCash 
                    dw       BonusBombCashAnim 
                    db       BONUS_BOMB_CASH              ; type 
BonusBombDiamond 
                    dw       BonusBombDiamondAnim 
                    db       BONUS_BOMB_DIAMOND           ; type 
BonusBombCashAnim 
                    DW       BonusBombCash0               ; list of all single vectorlists in this 
                    DW       BonusBombCash1 
                    DW       BonusBombCash2 
                    DW       BonusBombCash3 
                    DW       BonusBombCash4 
                    DW       BonusBombCash5 
                    DW       BonusBombCash6 
                    DW       BonusBombCash7 
                    DW       BonusBombCash8 
                    DW       BonusBombCash7               ; list of all single vectorlists in this 
                    DW       BonusBombCash6 
                    DW       BonusBombCash5 
                    DW       BonusBombCash4 
                    DW       BonusBombCash3 
                    DW       BonusBombCash2 
                    DW       BonusBombCash1 
                    DW       0 
BonusBombCash0 
                    db       $24, $01, $13, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$03, $01, -$26, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$11, $01, $06, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$1D, $01, $1D 
                    db       -$12, $01, $03 
                    db       -$03, $01, -$26 
                    db       -$08, $01, $0D, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $54, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $0C, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       -$54, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $5A, $01, $2A, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_0), lo(BonusCircle_0) 
BonusBombCash1 
                    db       $21, $01, $13, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$02, $01, -$26, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$10, $01, $06, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$1B, $01, $1D 
                    db       -$12, $01, $03 
                    db       -$01, $01, -$26 
                    db       -$08, $01, $0D, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $4E, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $0C, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       -$4E, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $54, $01, $2A, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_1), lo(BonusCircle_1) 
BonusBombCash2 
                    db       $1B, $01, $13, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$03, $01, -$26, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0C, $01, $06, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$16, $01, $1D 
                    db       -$0E, $01, $03 
                    db       -$01, $01, -$26 
                    db       -$06, $01, $0D, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $3E, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $0C, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       -$3E, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $43, $01, $2A, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_2), lo(BonusCircle_2) 
BonusBombCash3 
                    db       $10, $01, $13, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$01, $01, -$26, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$08, $01, $06, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$0D, $01, $1D 
                    db       -$07, $01, $03 
                    db       -$02, $01, -$26 
                    db       -$03, $01, $0D, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $24, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $0C, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       -$24, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $27, $01, $2A, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_3), lo(BonusCircle_3) 
BonusBombCash4 
                    db       $03, $01, $13, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$26, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$02, $01, $06, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$02, $01, $1D 
                    db       -$02, $01, $03 
                    db       $00, $01, -$26 
                    db       -$01, $01, $0D, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $08, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $0C, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       -$08, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $08, $01, $2A, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_4), lo(BonusCircle_4) 
BonusBombCash5 
                    db       -$0A, $01, $13, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $01, $01, -$26, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $05, $01, $06, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $07, $01, $1D 
                    db       $06, $01, $03 
                    db       $00, $01, -$26 
                    db       $03, $01, $0D, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$18, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $0C, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       $18, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$19, $01, $2A, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_5), lo(BonusCircle_5) 
BonusBombCash6 
                    db       -$15, $01, $13, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $02, $01, -$26, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $09, $01, $06, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $11, $01, $1D 
                    db       $0C, $01, $03 
                    db       $02, $01, -$26 
                    db       $04, $01, $0D, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$32, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $0C, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       $32, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$35, $01, $2A, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_6), lo(BonusCircle_6) 
BonusBombCash7 
                    db       -$1E, $01, $13, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $02, $01, -$26, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0F, $01, $06, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $19, $01, $1D 
                    db       $0F, $01, $03 
                    db       $03, $01, -$26 
                    db       $06, $01, $0D, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$48, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $0C, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       $48, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$4C, $01, $2A, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_7), lo(BonusCircle_7) 
BonusBombCash8 
                    db       -$24, $01, $13, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $03, $01, -$26, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $11, $01, $06, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $1D, $01, $1D 
                    db       $12, $01, $03 
                    db       $03, $01, -$26 
                    db       $08, $01, $0D, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$54, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $0C, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       $54, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$58, $01, $2A, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_8), lo(BonusCircle_8) 
BonusBombDiamondAnim 
                    DW       BonusBombDiamond0            ; list of all single vectorlists in this 
                    DW       BonusBombDiamond1 
                    DW       BonusBombDiamond2 
                    DW       BonusBombDiamond3 
                    DW       BonusBombDiamond4 
                    DW       BonusBombDiamond5 
                    DW       BonusBombDiamond6 
                    DW       BonusBombDiamond7 
                    DW       BonusBombDiamond8 
                    DW       BonusBombDiamond7 
                    DW       BonusBombDiamond6 
                    DW       BonusBombDiamond5 
                    DW       BonusBombDiamond4 
                    DW       BonusBombDiamond3 
                    DW       BonusBombDiamond2 
                    DW       BonusBombDiamond1 
                    DW       0 
BonusBombDiamond0 
                    db       $24, $01, $13, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$26, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$11, $01, -$0F, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$37, $01, $22 
                    db       $37, $01, $22 
                    db       $11, $01, -$0F 
                    db       $0C, $01, $1D, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_0), lo(BonusCircle_0) 
BonusBombDiamond1 
                    db       $21, $01, $13, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$26, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0F, $01, -$0F, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$33, $01, $22 
                    db       $33, $01, $22 
                    db       $0F, $01, -$0F 
                    db       $0C, $01, $1D, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_1), lo(BonusCircle_1) 
BonusBombDiamond2 
                    db       $1B, $01, $13, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$26, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0C, $01, -$0F, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$2A, $01, $22 
                    db       $2A, $01, $22 
                    db       $0C, $01, -$0F 
                    db       $09, $01, $1D, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_2), lo(BonusCircle_2) 
BonusBombDiamond3 
                    db       $10, $01, $13, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$26, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$07, $01, -$0F, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$19, $01, $22 
                    db       $19, $01, $22 
                    db       $07, $01, -$0F 
                    db       $05, $01, $1D, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_3), lo(BonusCircle_3) 
BonusBombDiamond4 
                    db       $03, $01, $13, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$26, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$02, $01, -$0F, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$04, $01, $22 
                    db       $04, $01, $22 
                    db       $02, $01, -$0F 
                    db       $01, $01, $1D, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_4), lo(BonusCircle_4) 
BonusBombDiamond5 
                    db       -$0A, $01, $13, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$26, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $04, $01, -$0F, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $10, $01, $22 
                    db       -$10, $01, $22 
                    db       -$04, $01, -$0F 
                    db       -$03, $01, $1D, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_5), lo(BonusCircle_5) 
BonusBombDiamond6 
                    db       -$15, $01, $13, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$26, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $09, $01, -$0F, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $21, $01, $22 
                    db       -$21, $01, $22 
                    db       -$09, $01, -$0F 
                    db       -$07, $01, $1D, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_6), lo(BonusCircle_6) 
BonusBombDiamond7 
                    db       -$1E, $01, $13, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$26, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0E, $01, -$0F, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $2E, $01, $22 
                    db       -$2E, $01, $22 
                    db       -$0E, $01, -$0F 
                    db       -$0A, $01, $1D, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_7), lo(BonusCircle_7) 
BonusBombDiamond8 
                    db       -$24, $01, $13, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$26, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $11, $01, -$0F, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $37, $01, $22 
                    db       -$37, $01, $22 
                    db       -$11, $01, -$0F 
                    db       -$0A, $01, $1D, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_8), lo(BonusCircle_8) 
