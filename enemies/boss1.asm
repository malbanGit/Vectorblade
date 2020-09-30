Boss1StaticLeft 
                    db       $15, $01, -$4D, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $16, $01, -$4D 
                    db       $00, $01, $13, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$08, $01, $00, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, -$13, hi(SMVB50_startDraw_newY_eq_oldX_single), lo(SMVB50_startDraw_newY_eq_oldX_single) ; y was $00, now SHIFT 
                    db       -$14, $01, $13, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $00, $01, -$13, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$09, $01, $00, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, $13, hi(SMVB50_startDraw_newY_eq_oldX_single), lo(SMVB50_startDraw_newY_eq_oldX_single) ; y was $00, now SHIFT 
                    db       -$12, $01, -$13, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $00, $01, $13, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$08, $01, $00, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, -$13, hi(SMVB50_startDraw_newY_eq_oldX_single), lo(SMVB50_startDraw_newY_eq_oldX_single) ; y was $00, now SHIFT 
                    db       -$0B, $01, -$18, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$03, $01, -$06, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$1A, $01, $00, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$02, $01, $06 
                    db       -$0E, $01, $04, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $08, $01, -$04, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $64, $01, $00, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $54, $01, $01 
                    db       $00, $01, $22, hi(SMVB50_startMove_newY_eq_oldX_single), lo(SMVB50_startMove_newY_eq_oldX_single) ; y was $01, now 0 
                    db       -$55, $01, $01, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$64, $01, $00, hi(SMVB50_continue3_single), lo(SMVB50_continue3_single) 
                    db       -$08, $01, -$04 
                    db       -$0C, $01, -$06 
                    db       $00, $01, -$11, hi(SMVB50_continue_zero_single), lo(SMVB50_continue_zero_single) 
                    db       $0C, $01, -$05, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $00, $01, $26, hi(SMVB50_continue_zero_single), lo(SMVB50_continue_zero_single) 
                    db       $0F, $01, $00, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $00, $01, -$05, hi(SMVB50_continue_newY_eq_oldX_single), lo(SMVB50_continue_newY_eq_oldX_single) ; y is $00 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss1StaticRight 
                    db       $15, $01, $4C, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $16, $01, $4C 
                    db       $00, $01, -$13, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$08, $01, $00, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, $13, hi(SMVB50_startDraw_newY_eq_oldX_single), lo(SMVB50_startDraw_newY_eq_oldX_single) ; y was $00, now SHIFT 
                    db       -$14, $01, -$13, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $00, $01, $13, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$09, $01, $00, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, -$13, hi(SMVB50_startDraw_newY_eq_oldX_single), lo(SMVB50_startDraw_newY_eq_oldX_single) ; y was $00, now SHIFT 
                    db       -$12, $01, $13, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $00, $01, -$13, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$08, $01, $00, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, $13, hi(SMVB50_startDraw_newY_eq_oldX_single), lo(SMVB50_startDraw_newY_eq_oldX_single) ; y was $00, now SHIFT 
                    db       -$0B, $01, $19, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$03, $01, $05, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$1A, $01, $00, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$02, $01, -$05 
                    db       -$0E, $01, -$04, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $08, $01, $04, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $64, $01, $00, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $55, $01, -$01 
                    db       $01, $01, -$22, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$56, $01, -$02, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$64, $01, $00, hi(SMVB50_continue7_single), lo(SMVB50_continue7_single) 
                    db       -$08, $01, $04 
                    db       -$0C, $01, $07 
                    db       $00, $01, $10 
                    db       $0C, $01, $06 
                    db       $00, $01, -$26 
                    db       $0F, $01, $00 
                    db       $00, $01, $04, hi(SMVB50_continue_newY_eq_oldX_single), lo(SMVB50_continue_newY_eq_oldX_single) ; y is $00 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss1StaticInnerLeft 
                    db       -$18, $01, -$6B, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $47, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, -$18, hi(SMVB50_continue3_single), lo(SMVB50_continue3_single) 
                    db       -$47, $01, $00 
                    db       $00, $01, $18 
                    db       -$3F, $01, $2B, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $25, $01, -$48, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $68, $01, $00, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $01, $01, $1D, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $00, $01, -$1C, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $28, $01, $1E, hi(SMVB50_continue3_single), lo(SMVB50_continue3_single) 
                    db       $00, $01, $1D 
                    db       -$28, $01, -$1F 
                    db       $2C, $01, $20, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $00, $01, -$1A, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $0C, $01, $09, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $00, $01, $5C 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss1StaticInnerRight 
                    db       -$18, $01, $6A, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $00, $01, $17, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $47, $01, $00, hi(SMVB50_continue3_single), lo(SMVB50_continue3_single) 
                    db       $00, $01, -$17 
                    db       -$47, $01, $00 
                    db       -$3F, $01, -$2C, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $25, $01, $49, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $68, $01, $00, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $01, $01, -$1D, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $28, $01, -$1F, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, $1C, hi(SMVB50_continue3_single), lo(SMVB50_continue3_single) 
                    db       -$28, $01, $1E 
                    db       $00, $01, -$1B 
                    db       $2C, $01, -$21, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $00, $01, $1A, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $0C, $01, -$08, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $00, $01, -$5B 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss1StaticSkull 
                    db       -$49, $01, -$35, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $1C, $01, $0E, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $07, $01, $26, hi(SMVB50_continue7_single), lo(SMVB50_continue7_single) 
                    db       -$07, $01, $25 
                    db       -$1C, $01, $0F 
                    db       $0C, $01, $07 
                    db       $34, $01, $24 
                    db       $42, $01, $00 
                    db       $29, $01, -$20 
                    db       $00, $01, -$7E, hi(SMVB50_continue7_single), lo(SMVB50_continue7_single) 
                    db       -$29, $01, -$1F 
                    db       -$42, $01, $00 
                    db       -$34, $01, $23 
                    db       -$0C, $01, $07 
                    db       -$0D, $01, -$04 
                    db       -$13, $01, $06 
                    db       -$0B, $01, $0D, hi(SMVB50_continue6_single), lo(SMVB50_continue6_single) 
                    db       -$09, $01, $24 
                    db       $08, $01, $21 
                    db       $0C, $01, $13 
                    db       $13, $01, $05 
                    db       $0D, $01, -$04 
                    db       $1C, $01, -$0F, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $06, $01, $0A, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $30, $01, $1D, hi(SMVB50_continue7_single), lo(SMVB50_continue7_single) 
                    db       $1A, $01, $00 
                    db       $21, $01, -$1C 
                    db       $00, $01, -$60 
                    db       -$21, $01, -$1B 
                    db       -$1A, $01, $00 
                    db       -$30, $01, $1D 
                    db       -$06, $01, $09, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       -$02, $01, $12, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $00, $01, $23, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$0D, $01, $00, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, -$23, hi(SMVB50_startDraw_newY_eq_oldX_single), lo(SMVB50_startDraw_newY_eq_oldX_single) ; y was $00, now SHIFT 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss1EyeLeft 
                    db       $2E, $01, -$24, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       -$08, $01, -$16, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$16, $01, -$07, hi(SMVB50_continue7_single), lo(SMVB50_continue7_single) 
                    db       -$14, $01, $08 
                    db       -$06, $01, $15 
                    db       $08, $01, $14 
                    db       $12, $01, $08 
                    db       $17, $01, -$08 
                    db       $07, $01, -$14 
                    db       -$1D, $01, $01, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts_stay), lo(SMVB50_lastDraw_rts_stay) 
Boss1EyeRight 
                    db       $2B, $01, $24, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       -$07, $01, -$14, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$14, $01, -$07, hi(SMVB50_continue7_single), lo(SMVB50_continue7_single) 
                    db       -$15, $01, $08 
                    db       -$05, $01, $13 
                    db       $06, $01, $13 
                    db       $14, $01, $09 
                    db       $16, $01, -$07 
                    db       $05, $01, -$15 
                    db       -$1A, $01, $00, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts_stay), lo(SMVB50_lastDraw_rts_stay) 
Boss1FumeLeft 
                    db       $3B, $01, -$46, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $3C, $01, -$47 
                    db       $41, $01, $09, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, -$0F, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$42, $01, -$05, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $42, $01, -$05, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $00, $01, -$08, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$42, $01, -$02, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $42, $01, -$06, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       -$01, $01, -$0C, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$40, $01, $0B, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss1FumeRight 
                    db       $3B, $01, $47, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       $41, $01, -$0A, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, $0F, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$42, $01, $05, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $42, $01, $04, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $00, $01, $08, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$42, $01, $03, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $42, $01, $06, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $00, $01, $13, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$41, $01, -$0E, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss1EyeAnim 
                    DW       Boss1EyeAnim_0               ; list of all single vectorlists in this 
                    DW       Boss1EyeAnim_1 
                    DW       Boss1EyeAnim_2 
                    DW       Boss1EyeAnim_3 
                    DW       Boss1EyeAnim_4 
                    DW       Boss1EyeAnim_5 
                    DW       Boss1EyeAnim_6 
                    DW       Boss1EyeAnim_7 
                    DW       Boss1EyeAnim_8 
                    DW       Boss1EyeAnim_9 
                    DW       Boss1EyeAnim_10 
                    DW       Boss1EyeAnim_11 
                    DW       Boss1EyeAnim_12 
                    DW       Boss1EyeAnim_13 
                    DW       Boss1EyeAnim_14 
                    DW       0 
Boss1EyeAnim_0 
                    db       -$0F, $01, $0B, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss1EyeAnim_1 
                    db       -$12, $01, $04, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss1EyeAnim_2 
                    db       -$12, $01, -$04, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss1EyeAnim_3 
                    db       -$0F, $01, -$0B, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss1EyeAnim_4 
                    db       -$09, $01, -$10, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss1EyeAnim_5 
                    db       -$02, $01, -$12, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss1EyeAnim_6 
                    db       $06, $01, -$12, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss1EyeAnim_7 
                    db       $0C, $01, -$0E, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss1EyeAnim_8 
                    db       $11, $01, -$08, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss1EyeAnim_9 
                    db       $13, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss1EyeAnim_10 
                    db       $11, $01, $07, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss1EyeAnim_11 
                    db       $0D, $01, $0E, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss1EyeAnim_12 
                    db       $06, $01, $12, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss1EyeAnim_13 
                    db       -$02, $01, $13, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss1EyeAnim_14 
                    db       -$09, $01, $10, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss1GunLeftSmall_Anim 
                    DW       Boss1GunLeftSmall_0          ; list of all single vectorlists in this 
                    DW       Boss1GunLeftSmall_1 
                    DW       Boss1GunLeftSmall_2 
                    DW       Boss1GunLeftSmall_3 
                    DW       0 
Boss1GunLeftSmall_0 
                    db       -$42, $01, -$47, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $1A, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $0F, $01, -$08, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$29, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$05, $01, $02, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$2A, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, $05, hi(SMVB50_startMove_newY_eq_oldX_single), lo(SMVB50_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       $2A, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss1GunLeftSmall_1 
                    db       -$3A, $01, -$47, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $1A, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $0F, $01, -$08, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$29, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$05, $01, $02, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$2A, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, $05, hi(SMVB50_startMove_newY_eq_oldX_single), lo(SMVB50_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       $2A, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss1GunLeftSmall_2 
                    db       -$36, $01, -$47, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $1A, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $0F, $01, -$08, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$29, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$05, $01, $02, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$2A, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, $05, hi(SMVB50_startMove_newY_eq_oldX_single), lo(SMVB50_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       $2A, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss1GunLeftSmall_3 
                    db       -$2E, $01, -$47, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $1A, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $0F, $01, -$08, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$29, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$05, $01, $02, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$2A, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, $05, hi(SMVB50_startMove_newY_eq_oldX_single), lo(SMVB50_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       $2A, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss1GunRightSmall_Anim 
                    DW       Boss1GunRightSmall_0         ; list of all single vectorlists in this 
                    DW       Boss1GunRightSmall_1 
                    DW       Boss1GunRightSmall_2 
                    DW       Boss1GunRightSmall_3 
                    DW       0 
Boss1GunRightSmall_0 
                    db       -$28, $01, $47, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       -$1A, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$05, $01, $01, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$2A, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, $06, hi(SMVB50_startMove_newY_eq_oldX_single), lo(SMVB50_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       $2A, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $05, $01, $01, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $29, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss1GunRightSmall_1 
                    db       -$3A, $01, $47, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $1A, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $0F, $01, $08, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$29, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$05, $01, -$02, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$2A, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, -$05, hi(SMVB50_startMove_newY_eq_oldX_single), lo(SMVB50_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       $2A, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss1GunRightSmall_2 
                    db       -$36, $01, $47, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $1A, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $0F, $01, $08, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$29, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$05, $01, -$02, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$2A, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, -$05, hi(SMVB50_startMove_newY_eq_oldX_single), lo(SMVB50_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       $2A, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, $02, hi(SMVB50_continue_newY_eq_oldX_single), lo(SMVB50_continue_newY_eq_oldX_single) ; y is $00 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss1GunRightSmall_3 
                    db       -$2E, $01, $47, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $1A, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $0F, $01, $08, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$29, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$05, $01, -$01, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$2A, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, -$04, hi(SMVB50_startMove_newY_eq_oldX_single), lo(SMVB50_startMove_newY_eq_oldX_single) ; y was $00, now 0 
                    db       $2A, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss1GunLeftBig_Anim 
                    DW       Boss1GunLeftBig_0            ; list of all single vectorlists in this 
                    DW       Boss1GunLeftBig_1 
                    DW       Boss1GunLeftBig_2 
                    DW       Boss1GunLeftBig_3 
                    DW       0 
Boss1GunLeftBig_0 
                    db       -$51, $01, -$74, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $47, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $04, $01, $02, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $28, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, -$08, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$28, $01, $00 
                    db       -$04, $01, $01, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$47, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss1GunLeftBig_1 
                    db       -$4C, $01, -$74, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $47, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$01, $01, $02, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $28, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, -$08, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$28, $01, $00 
                    db       $01, $01, $01, hi(SMVB50_startMove_yEqx_single), lo(SMVB50_startMove_yEqx_single) ; y is $01 
                    db       -$47, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss1GunLeftBig_2 
                    db       -$49, $01, -$74, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $47, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$04, $01, $02, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $28, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, -$08, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$28, $01, $00 
                    db       $04, $01, $01, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$47, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss1GunLeftBig_3 
                    db       -$46, $01, -$74, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $47, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$07, $01, $02, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $28, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, -$08, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$28, $01, $00 
                    db       $07, $01, $01, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$47, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss1GunRightBig_Anim 
                    DW       Boss1GunRightBig_0           ; list of all single vectorlists in this 
                    DW       Boss1GunRightBig_1 
                    DW       Boss1GunRightBig_2 
                    DW       Boss1GunRightBig_3 
                    DW       0 
Boss1GunRightBig_0 
                    db       -$51, $01, $74, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $47, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $04, $01, -$02, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $28, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, $08, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$28, $01, $00 
                    db       -$04, $01, -$01, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$47, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss1GunRightBig_1 
                    db       -$4C, $01, $74, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $47, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$01, $01, -$02, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $28, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, $08, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$28, $01, $00 
                    db       $01, $01, -$01, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$47, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss1GunRightBig_2 
                    db       -$49, $01, $74, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $47, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$04, $01, -$02, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $28, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, $08, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$28, $01, $00 
                    db       $04, $01, -$01, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$47, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Boss1GunRightBig_3 
                    db       -$46, $01, $74, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $47, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$07, $01, -$02, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $28, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, $08, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$28, $01, $00 
                    db       $07, $01, -$01, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$47, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
