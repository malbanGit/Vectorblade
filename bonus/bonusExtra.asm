BonusE 
                    dw       BonusE_Anim 
                    db       BONUS_E                      ; type 
BonusX 
                    dw       BonusX_Anim 
                    db       BONUS_X                      ; type 
BonusT 
                    dw       BonusT_Anim 
                    db       BONUS_T                      ; type 
BonusR 
                    dw       BonusR_Anim 
                    db       BONUS_R                      ; type 
BonusA 
                    dw       BonusA_Anim 
                    db       BONUS_A                      ; type 
BonusA_Anim 
                    DW       BonusA_Anim_0                ; list of all single vectorlists in this 
                    DW       BonusA_Anim_1 
                    DW       BonusA_Anim_2 
                    DW       BonusA_Anim_3 
                    DW       BonusA_Anim_4 
                    DW       BonusA_Anim_5 
                    DW       BonusA_Anim_6 
                    DW       BonusA_Anim_7 
                    DW       BonusA_Anim_8 
                    DW       BonusA_Anim_7 
                    DW       BonusA_Anim_6 
                    DW       BonusA_Anim_5 
                    DW       BonusA_Anim_4 
                    DW       BonusA_Anim_3 
                    DW       BonusA_Anim_2 
                    DW       BonusA_Anim_1 
                    DW       0 
BonusA_Anim_0 
                    db       -$2E, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $5E, $01, -$1B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$60, $01, -$1B, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       $30, $01, $0E, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, $1A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$5A, $01, -$0D, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(LetterOuter3d_0), lo(LetterOuter3d_0) 
BonusA_Anim_1 
                    db       -$2B, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $58, $01, -$1B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$5A, $01, -$1B, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       $2D, $01, $0E, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, $1A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$58, $01, -$0D, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(LetterOuter3d_1), lo(LetterOuter3d_1) 
BonusA_Anim_2 
                    db       -$21, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $43, $01, -$1B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$44, $01, -$1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $22, $01, $0E, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, $1A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$49, $01, -$0D, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(LetterOuter3d_2), lo(LetterOuter3d_2) 
BonusA_Anim_3 
                    db       -$12, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $24, $01, -$1B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$24, $01, -$1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $12, $01, $0E, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, $1A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$30, $01, -$0D, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(LetterOuter3d_3), lo(LetterOuter3d_3) 
BonusA_Anim_4 
                    db       $00, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$1B, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $00, $01, $0E, hi(SMVB_startMove_yStays_single), lo(SMVB_startMove_yStays_single) ; y was $00, now 0 
                    db       SHITREG_POKE_VALUE, $01, $1A, hi(SMVB_startDraw_yStays_single), lo(SMVB_startDraw_yStays_single) ; y was $00, now SHIFT Poke 
                    db       -$0F, $01, -$0D, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(LetterOuter3d_4), lo(LetterOuter3d_4) 
BonusA_Anim_5 
                    db       $12, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$24, $01, -$1B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $24, $01, -$1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$12, $01, $0E, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, $1A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $15, $01, -$0D, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(LetterOuter3d_5), lo(LetterOuter3d_5) 
BonusA_Anim_6 
                    db       $21, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$43, $01, -$1B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $44, $01, -$1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$22, $01, $0E, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, $1A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $34, $01, -$0D, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(LetterOuter3d_6), lo(LetterOuter3d_6) 
BonusA_Anim_7 
                    db       $2B, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$58, $01, -$1B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $5A, $01, -$1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$2D, $01, $0E, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, $1A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $4E, $01, -$0D, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(LetterOuter3d_7), lo(LetterOuter3d_7) 
BonusA_Anim_8 
                    db       $2E, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$5E, $01, -$1B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $60, $01, -$1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$30, $01, $0E, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, $1A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $5A, $01, -$0D, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(LetterOuter3d_8), lo(LetterOuter3d_8) 
BonusR_Anim 
                    DW       BonusR_Anim_0                ; list of all single vectorlists in this 
                    DW       BonusR_Anim_1 
                    DW       BonusR_Anim_2 
                    DW       BonusR_Anim_3 
                    DW       BonusR_Anim_4 
                    DW       BonusR_Anim_5 
                    DW       BonusR_Anim_6 
                    DW       BonusR_Anim_7 
                    DW       BonusR_Anim_8 
                    DW       BonusR_Anim_7 
                    DW       BonusR_Anim_6 
                    DW       BonusR_Anim_5 
                    DW       BonusR_Anim_4 
                    DW       BonusR_Anim_3 
                    DW       BonusR_Anim_2 
                    DW       BonusR_Anim_1 
                    DW       0 
BonusR_Anim_0 
                    db       -$30, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $31, $01, -$24, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1B, $01, $24, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $14, $01, -$36 
                    db       -$60, $01, $00 
                    db       -$2A, $01, $1B, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(LetterOuter3d_0), lo(LetterOuter3d_0) 
BonusR_Anim_1 
                    db       -$2D, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $2E, $01, -$24, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1A, $01, $24, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $12, $01, -$36 
                    db       -$5A, $01, $00 
                    db       -$2B, $01, $1B, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(LetterOuter3d_1), lo(LetterOuter3d_1) 
BonusR_Anim_2 
                    db       -$22, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $23, $01, -$24, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $12, $01, $24, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $0F, $01, -$36 
                    db       -$44, $01, $00 
                    db       -$27, $01, $1B, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(LetterOuter3d_2), lo(LetterOuter3d_2) 
BonusR_Anim_3 
                    db       -$12, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $12, $01, -$24, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0A, $01, $24, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $08, $01, -$36 
                    db       -$24, $01, $00 
                    db       -$1E, $01, $1B, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(LetterOuter3d_3), lo(LetterOuter3d_3) 
BonusR_Anim_4 
                    db       $00, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       SHITREG_POKE_VALUE, $01, -$24, hi(SMVB_startDraw_yStays_single), lo(SMVB_startDraw_yStays_single) ; y was $00, now SHIFT Poke 
                    db       $00, $01, $24, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $00, $01, -$36 
                    db       -$0F, $01, $1B, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(LetterOuter3d_4), lo(LetterOuter3d_4) 
BonusR_Anim_5 
                    db       $12, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$12, $01, -$24, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0A, $01, $24, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$08, $01, -$36 
                    db       $24, $01, $00 
                    db       $03, $01, $1B, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(LetterOuter3d_5), lo(LetterOuter3d_5) 
BonusR_Anim_6 
                    db       $22, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$23, $01, -$24, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$12, $01, $24, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$0F, $01, -$36 
                    db       $44, $01, $00 
                    db       $12, $01, $1B, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(LetterOuter3d_6), lo(LetterOuter3d_6) 
BonusR_Anim_7 
                    db       $2D, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$2E, $01, -$24, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1A, $01, $24, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$12, $01, -$36 
                    db       $5A, $01, $00 
                    db       $21, $01, $1B, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(LetterOuter3d_7), lo(LetterOuter3d_7) 
BonusR_Anim_8 
                    db       $30, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$31, $01, -$24, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1B, $01, $24, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$14, $01, -$36 
                    db       $60, $01, $00 
                    db       $2A, $01, $1B, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(LetterOuter3d_8), lo(LetterOuter3d_8) 
BonusT_Anim 
                    DW       BonusT_Anim_0                ; list of all single vectorlists in this 
                    DW       BonusT_Anim_1 
                    DW       BonusT_Anim_2 
                    DW       BonusT_Anim_3 
                    DW       BonusT_Anim_4 
                    DW       BonusT_Anim_5 
                    DW       BonusT_Anim_6 
                    DW       BonusT_Anim_7 
                    DW       BonusT_Anim_8 
                    DW       BonusT_Anim_7 
                    DW       BonusT_Anim_6 
                    DW       BonusT_Anim_5 
                    DW       BonusT_Anim_4 
                    DW       BonusT_Anim_3 
                    DW       BonusT_Anim_2 
                    DW       BonusT_Anim_1 
                    DW       0 
BonusT_Anim_0 
                    db       $30, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$60, $01, $1B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $60, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$45, $01, $00, hi(SMVB_startMove_double_sj), lo(SMVB_startMove_double_sj), hi(LetterOuter3d_0), lo(LetterOuter3d_0) 
BonusT_Anim_1 
                    db       $2D, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$5A, $01, $1B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $5A, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$42, $01, $00, hi(SMVB_startMove_double_sj), lo(SMVB_startMove_double_sj), hi(LetterOuter3d_1), lo(LetterOuter3d_1) 
BonusT_Anim_2 
                    db       $22, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$44, $01, $1B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $44, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$6B, $01, $00, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(LetterOuter3d_2), lo(LetterOuter3d_2) 
BonusT_Anim_3 
                    db       $12, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$24, $01, $1B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $24, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$42, $01, $00, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(LetterOuter3d_3), lo(LetterOuter3d_3) 
BonusT_Anim_4 
                    db       $00, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       SHITREG_POKE_VALUE, $01, -$36, hi(SMVB_startDraw_yStays_single), lo(SMVB_startDraw_yStays_single) ; y was $00, now SHIFT Poke 
                    db       $00, $01, $1B, hi(SMVB_startMove_yStays_single), lo(SMVB_startMove_yStays_single) ; y was $00, now 0 
                    db       -$0F, $01, $00, hi(SMVB_continue_single_sj), lo(SMVB_continue_single_sj), hi(LetterOuter3d_4), lo(LetterOuter3d_4) 
BonusT_Anim_5 
                    db       -$12, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $24, $01, $1B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$24, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $27, $01, $00, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(LetterOuter3d_5), lo(LetterOuter3d_5) 
BonusT_Anim_6 
                    db       -$22, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $44, $01, $1B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$44, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $56, $01, $00, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(LetterOuter3d_6), lo(LetterOuter3d_6) 
BonusT_Anim_7 
                    db       -$2D, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $5A, $01, $1B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$5A, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $7B, $01, $00, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(LetterOuter3d_7), lo(LetterOuter3d_7) 
BonusT_Anim_8 
                    db       -$30, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $60, $01, $1B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$60, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $45, $01, $00, hi(SMVB_startMove_double_sj), lo(SMVB_startMove_double_sj), hi(LetterOuter3d_8), lo(LetterOuter3d_8) 
BonusX_Anim 
                    DW       BonusX_Anim_0                ; list of all single vectorlists in this 
                    DW       BonusX_Anim_1 
                    DW       BonusX_Anim_2 
                    DW       BonusX_Anim_3 
                    DW       BonusX_Anim_4 
                    DW       BonusX_Anim_5 
                    DW       BonusX_Anim_6 
                    DW       BonusX_Anim_7 
                    DW       BonusX_Anim_8 
                    DW       BonusX_Anim_7 
                    DW       BonusX_Anim_6 
                    DW       BonusX_Anim_5 
                    DW       BonusX_Anim_4 
                    DW       BonusX_Anim_3 
                    DW       BonusX_Anim_2 
                    DW       BonusX_Anim_1 
                    DW       0 
BonusX_Anim_0 
                    db       $30, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$60, $01, -$36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $36, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $60, $01, -$36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$45, $01, $0D, hi(SMVB_startMove_double_sj), lo(SMVB_startMove_double_sj), hi(LetterOuter3d_0), lo(LetterOuter3d_0) 
BonusX_Anim_1 
                    db       $2D, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$5A, $01, -$36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $36, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $5A, $01, -$36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$42, $01, $0D, hi(SMVB_startMove_double_sj), lo(SMVB_startMove_double_sj), hi(LetterOuter3d_1), lo(LetterOuter3d_1) 
BonusX_Anim_2 
                    db       $22, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$44, $01, -$36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $36, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $44, $01, -$36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$6B, $01, $1B, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(LetterOuter3d_2), lo(LetterOuter3d_2) 
BonusX_Anim_3 
                    db       $12, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$24, $01, -$36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $36, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $24, $01, -$36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$42, $01, $1B, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(LetterOuter3d_3), lo(LetterOuter3d_3) 
BonusX_Anim_4 
                    db       $00, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       SHITREG_POKE_VALUE, $01, -$36, hi(SMVB_startDraw_yStays_single), lo(SMVB_startDraw_yStays_single) ; y was $00, now SHIFT Poke 
                    db       $00, $01, $36, hi(SMVB_startMove_yStays_single), lo(SMVB_startMove_yStays_single) ; y was $00, now 0 
                    db       SHITREG_POKE_VALUE, $01, -$36, hi(SMVB_startDraw_yStays_single), lo(SMVB_startDraw_yStays_single) ; y was $00, now SHIFT Poke 
                    db       -$0F, $01, $1B, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(LetterOuter3d_4), lo(LetterOuter3d_4) 
BonusX_Anim_5 
                    db       -$12, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $24, $01, -$36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $36, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$24, $01, -$36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $27, $01, $1B, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(LetterOuter3d_5), lo(LetterOuter3d_5) 
BonusX_Anim_6 
                    db       -$22, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $44, $01, -$36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $36, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$44, $01, -$36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $56, $01, $1B, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(LetterOuter3d_6), lo(LetterOuter3d_6) 
BonusX_Anim_7 
                    db       -$2D, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $5A, $01, -$36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $36, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$5A, $01, -$36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $7B, $01, $1B, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(LetterOuter3d_7), lo(LetterOuter3d_7) 
BonusX_Anim_8 
                    db       -$30, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $60, $01, -$36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $36, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$60, $01, -$36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $45, $01, $0D, hi(SMVB_startMove_double_sj), lo(SMVB_startMove_double_sj), hi(LetterOuter3d_8), lo(LetterOuter3d_8) 
BonusE_Anim 
                    DW       BonusE_Anim_0                ; list of all single vectorlists in this 
                    DW       BonusE_Anim_1 
                    DW       BonusE_Anim_2 
                    DW       BonusE_Anim_3 
                    DW       BonusE_Anim_4 
                    DW       BonusE_Anim_5 
                    DW       BonusE_Anim_6 
                    DW       BonusE_Anim_7 
                    DW       BonusE_Anim_8 
                    DW       BonusE_Anim_7 
                    DW       BonusE_Anim_6 
                    DW       BonusE_Anim_5 
                    DW       BonusE_Anim_4 
                    DW       BonusE_Anim_3 
                    DW       BonusE_Anim_2 
                    DW       BonusE_Anim_1 
                    DW       0 
BonusE_Anim_0 
                    db       $30, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$60, $01, $00, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $00, $01, $36 
                    db       $30, $01, -$0F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, -$27, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$5A, $01, $1B, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(LetterOuter3d_0), lo(LetterOuter3d_0) 
BonusE_Anim_1 
                    db       $2D, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$5A, $01, $00, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $00, $01, $36 
                    db       $2D, $01, -$0F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, -$27, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$58, $01, $1B, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(LetterOuter3d_1), lo(LetterOuter3d_1) 
BonusE_Anim_2 
                    db       $22, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$44, $01, $00, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $00, $01, $36 
                    db       $22, $01, -$0F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, -$27, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$49, $01, $1B, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(LetterOuter3d_2), lo(LetterOuter3d_2) 
BonusE_Anim_3 
                    db       $12, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$24, $01, $00, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $00, $01, $36 
                    db       $12, $01, -$0F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, -$27, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$30, $01, $1B, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(LetterOuter3d_3), lo(LetterOuter3d_3) 
BonusE_Anim_4 
                    db       $00, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       SHITREG_POKE_VALUE, $01, -$36, hi(SMVB_startDraw_yStays_single), lo(SMVB_startDraw_yStays_single) ; y was $00, now SHIFT Poke 
                    db       $00, $01, $36, hi(SMVB_continue_yStays_single), lo(SMVB_continue_yStays_single) ; y is $00 
                    db       $00, $01, -$0F, hi(SMVB_startMove_yStays_single), lo(SMVB_startMove_yStays_single) ; y was $00, now 0 
                    db       SHITREG_POKE_VALUE, $01, -$27, hi(SMVB_startDraw_yStays_single), lo(SMVB_startDraw_yStays_single) ; y was $00, now SHIFT Poke 
                    db       -$0F, $01, $1B, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(LetterOuter3d_4), lo(LetterOuter3d_4) 
BonusE_Anim_5 
                    db       -$12, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $24, $01, $00, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $00, $01, $36 
                    db       -$12, $01, -$0F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, -$27, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $15, $01, $1B, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(LetterOuter3d_5), lo(LetterOuter3d_5) 
BonusE_Anim_6 
                    db       -$22, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $44, $01, $00, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $00, $01, $36 
                    db       -$22, $01, -$0F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, -$27, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $34, $01, $1B, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(LetterOuter3d_6), lo(LetterOuter3d_6) 
BonusE_Anim_7 
                    db       -$2D, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $5A, $01, $00, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $00, $01, $36 
                    db       -$2D, $01, -$0F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, -$27, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $4E, $01, $1B, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(LetterOuter3d_7), lo(LetterOuter3d_7) 
BonusE_Anim_8 
                    db       -$30, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $60, $01, $00, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $00, $01, $36 
                    db       -$30, $01, -$0F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, -$27, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $5A, $01, $1B, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(LetterOuter3d_8), lo(LetterOuter3d_8) 
