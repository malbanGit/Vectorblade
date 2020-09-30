enemySin2Definition 
                    dw       EnemySin2Angle8Table 
                    db       5 
                    dw       EnemySin2WaitAnim 
                    db       2,0                          ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemySin2Definition_noID 
                    dw       EnemySin2Angle8Table 
                    db       5 
                    dw       EnemySin2WaitAnim 
                    db       2,TYPE_DONT_WAIT             ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemySin2Definition_noShot 
                    dw       EnemySin2Angle8Table 
                    db       5 
                    dw       EnemySin2WaitAnim 
                    db       2,TYPE_DONT_SHOOT            ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemySin2Definition_bonus 
                    dw       EnemySin2Angle8Table 
                    db       2 
                    dw       EnemySin2WaitAnim 
                    db       3,0                          ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemySin2Definition_debris 
                    dw       EnemySin2Angle8Table 
                    db       5 
                    dw       EnemySin2WaitAnim 
                    db       3,0+TYPE_DEBRIS_BOMBER       ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemySin2Definition_glas_debris_wait 
                    dw       EnemySin2Angle8Table 
                    db       1 
                    dw       EnemySin2WaitAnim 
                    db       1,0+TYPE_DEBRIS_BOMBER+TYPE_DONT_WAIT ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
EnemySin2WaitAnim 
                    DW       EnemySin2_2 
                    DW       EnemySin2_3_0 
                    DW       EnemySin2_4 
                    DW       EnemySin2_5_0 
                    DW       EnemySin2_6 
                    DW       EnemySin2_7_0 
                    DW       EnemySin2_8 
                    DW       EnemySin2_9_0 
                    DW       0 
EnemySin2Angle8Table 
                    DW       EnemySin2_2 
                    DW       EnemySin2_3 
                    DW       EnemySin2_4 
                    DW       EnemySin2_5 
                    DW       EnemySin2_6 
                    DW       EnemySin2_7 
                    DW       EnemySin2_8 
                    DW       EnemySin2_9 
                    DW       0 
EnemySin2_0 
                    db       -$48, $01, -$48, hi(SMVB_continue_yd4_yEqx_single), lo(SMVB_continue_yd4_yEqx_single) ; y is -$48 
                    db       $00, $01, -$46, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $48, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $00, $01, $48, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $47, $01, $00 
                    db       $00, $01, $47, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$48, $01, $00, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $00, $01, $47 
                    db       -$48, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $00, $01, -$47, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$46, $01, $00 
                    db       $00, $01, -$47, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $48, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $47, $01, -$24, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $6C, $01, $6B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$6C, $01, $6B, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       -$6B, $01, -$6B, hi(SMVB_continue_yd4_yEqx_single), lo(SMVB_continue_yd4_yEqx_single) ; y is -$6B 
                    db       $6A, $01, -$6B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
EnemySin2_1 
                    db       -$64, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$34, $01, -$31, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $67, $01, -$67, hi(SMVB_continue6_single), lo(SMVB_continue6_single) 
                    db       $31, $01, $34 
                    db       $31, $01, -$34 
                    db       $67, $01, $67 
                    db       -$34, $01, $31 
                    db       $34, $01, $31 
                    db       -$67, $01, $67, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       -$31, $01, -$34, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$31, $01, $34 
                    db       -$67, $01, -$67, hi(SMVB_continue_yd4_yEqx_single), lo(SMVB_continue_yd4_yEqx_single) ; y is -$67 
                    db       $34, $01, -$31, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1C, $01, -$48, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $48, $01, $00, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $00, $01, $48, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$48, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $00, $01, -$48, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
EnemySin2_2 
                    db       $77, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $5D, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$5D, $01, $00, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(EnemySin2_0), lo(EnemySin2_0) 
EnemySin2_3 
                    db       $78, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $42, $01, $42, hi(SMVB_startDraw_yEqx_single), lo(SMVB_startDraw_yEqx_single) ; y is $42 
                    db       -$42, $01, -$42, hi(SMVB_startMove_yEqx_single_sj), lo(SMVB_startMove_yEqx_single_sj), hi(EnemySin2_1), lo(EnemySin2_1) ; y is -$42 
EnemySin2_3_0 
                    db       $78, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $42, $01, $42, hi(SMVB_startDraw_yEqx_single), lo(SMVB_startDraw_yEqx_single) ; y is $42 
                    db       -$42, $01, -$42, hi(SMVB_startMove_yEqx_single_sj), lo(SMVB_startMove_yEqx_single_sj), hi(EnemySin2_0), lo(EnemySin2_0) ; y is -$42 
EnemySin2_4 
                    db       $78, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, $5D, hi(SMVB_startDraw_newY_eq_oldX_single), lo(SMVB_startDraw_newY_eq_oldX_single) ; y is $00 
                    db       $00, $01, -$5D, hi(SMVB_startMove_yStays_single_sj), lo(SMVB_startMove_yStays_single_sj), hi(EnemySin2_0), lo(EnemySin2_0) ; y is $00 
EnemySin2_5 
                    db       $78, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$42, $01, $42, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $42, $01, -$42, hi(SMVB_startMove_newY_eq_oldX_single_sj), lo(SMVB_startMove_newY_eq_oldX_single_sj), hi(EnemySin2_1), lo(EnemySin2_1) ; y is $42 
EnemySin2_5_0 
                    db       $78, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$42, $01, $42, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $42, $01, -$42, hi(SMVB_startMove_newY_eq_oldX_single_sj), lo(SMVB_startMove_newY_eq_oldX_single_sj), hi(EnemySin2_0), lo(EnemySin2_0) ; y is $42 
EnemySin2_6 
                    db       $78, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$5D, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $5D, $01, $00, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(EnemySin2_0), lo(EnemySin2_0) 
EnemySin2_7 
                    db       $78, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$42, $01, -$42, hi(SMVB_startDraw_yEqx_single), lo(SMVB_startDraw_yEqx_single) ; y was -$42 
                    db       $42, $01, $42, hi(SMVB_startMove_yEqx_single_sj), lo(SMVB_startMove_yEqx_single_sj), hi(EnemySin2_1), lo(EnemySin2_1) ; y is $42 
EnemySin2_7_0 
                    db       $78, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$42, $01, -$42, hi(SMVB_startDraw_yEqx_single), lo(SMVB_startDraw_yEqx_single) ; y was -$42 
                    db       $42, $01, $42, hi(SMVB_startMove_yEqx_single_sj), lo(SMVB_startMove_yEqx_single_sj), hi(EnemySin2_0), lo(EnemySin2_0) ; y is $42 
EnemySin2_8 
                    db       $78, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$5D, hi(SMVB_startDraw_newY_eq_oldX_single), lo(SMVB_startDraw_newY_eq_oldX_single) ; y is $00 
                    db       $00, $01, $5D, hi(SMVB_startMove_yStays_single_sj), lo(SMVB_startMove_yStays_single_sj), hi(EnemySin2_0), lo(EnemySin2_0) ; y is $00 
EnemySin2_9 
                    db       $78, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $42, $01, -$42, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$42, $01, $42, hi(SMVB_startMove_newY_eq_oldX_single_sj), lo(SMVB_startMove_newY_eq_oldX_single_sj), hi(EnemySin2_1), lo(EnemySin2_1) ; y is -$42 
EnemySin2_9_0 
                    db       $78, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $42, $01, -$42, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$42, $01, $42, hi(SMVB_startMove_newY_eq_oldX_single_sj), lo(SMVB_startMove_newY_eq_oldX_single_sj), hi(EnemySin2_0), lo(EnemySin2_0) ; y is -$42 
