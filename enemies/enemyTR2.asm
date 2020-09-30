enemyTR2Definition1 
enemyTR2Definition_1 
                    dw       EnemyTR2Angle8Table 
                    db       3 
                    dw       EnemyTR2WaitAnim 
                    db       1,0                          ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemyTR2Definition_1_fast 
                    dw       EnemyTR2Angle8Table 
                    db       10 
                    dw       EnemyTR2WaitAnim 
                    db       3,0                          ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
EnemyTR2WaitAnim 
                    DW       Tamarian_0                   ; list of all single vectorlists in this 
                    DW       Tamarian_8 
                    DW       Tamarian_9 
                    DW       Tamarian_8 
                    DW       0 
EnemyTR2Angle8Table 
                    DW       Tamarian_0                   ; list of all single vectorlists in this 
                    DW       Tamarian_1 
                    DW       Tamarian_2 
                    DW       Tamarian_3 
                    DW       Tamarian_4 
                    DW       Tamarian_5 
                    DW       Tamarian_6 
                    DW       Tamarian_7 
                    DW       0 
Tamarian_0 
                    db       $01, $01, -$34, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1A, $01, $11, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $46, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$1A, $01, $11 
                    db       $4B, $01, -$2E, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       -$12, $01, -$30, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$2B, $01, $2B, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$49, $01, -$22 
                    db       $00, $01, $50, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $49, $01, -$22, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $2B, $01, $2B 
                    db       $12, $01, -$30 
                    db       $0B, $01, $07, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $77, $01, -$30, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$77, $01, -$30, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       $00, $01, $60, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$0B, $01, -$07, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, -$52, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Tamarian_1 
                    db       $28, $01, -$44, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $06, $01, $1E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$33, $01, $33, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$1E, $01, -$06 
                    db       $55, $01, $14, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       $16, $01, -$30, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$3C, $01, $00, hi(SMVB_continue6_single), lo(SMVB_continue6_single) 
                    db       -$1B, $01, -$4C 
                    db       -$73, $01, $73 
                    db       $4C, $01, $1B 
                    db       $00, $01, $3C 
                    db       $30, $01, -$16 
                    db       $02, $01, $0F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $75, $01, $30, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$30, $01, -$75, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$45, $01, $45 
                    db       -$02, $01, -$0F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $38, $01, -$38, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Tamarian_2 
                    db       $60, $01, -$46, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$11, $01, $1A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$46, $01, $00, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$11, $01, -$1A 
                    db       $2E, $01, $4B, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       $30, $01, -$12, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$2B, $01, -$2B, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $22, $01, -$49 
                    db       -$50, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $22, $01, $49, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$2B, $01, $2B 
                    db       $30, $01, $12 
                    db       -$07, $01, $0B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $30, $01, $77, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $30, $01, -$77, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$60, $01, $00 
                    db       $07, $01, -$0B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $52, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
; changed
Tamarian_3 
                    db       $5C, $01, -$14, hi(SMVB_continue_tripple), lo(SMVB_continue_tripple) 
                    db       -$1E, $01, $06, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$33, $01, -$33, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $06, $01, -$1E 
                    db       -$14, $01, $55, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       $30, $01, $16, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$3C, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $4C, $01, -$1B 
                    db       -$73, $01, -$73 , hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       -$1B, $01, $4C , hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$3C, $01, $00 
                    db       $16, $01, $30 
                    db       -$0F, $01, $02, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$30, $01, $75, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $75, $01, -$30, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$45, $01, -$45 , hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       $0F, $01, -$02, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $38, $01, $38, hi(SMVB_startDraw_yEqx_single), lo(SMVB_startDraw_yEqx_single) ; y is $38 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Tamarian_4 
                    db       $5D, $01, $11, hi(SMVB_continue_tripple), lo(SMVB_continue_tripple) 
                    db       -$1A, $01, -$11, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$46, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $1A, $01, -$11 
                    db       -$4B, $01, $2E, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       $12, $01, $30, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $2B, $01, -$2B, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $49, $01, $22 
                    db       $00, $01, -$50, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$49, $01, $22, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$2B, $01, -$2B 
                    db       -$12, $01, $30 
                    db       -$0B, $01, -$07, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$77, $01, $30, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $77, $01, $30, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $00, $01, -$60 
                    db       $0B, $01, $07, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, $52, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Tamarian_5 
                    db       $65, $01, $44, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$06, $01, -$1E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $33, $01, -$33, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $1E, $01, $06 
                    db       -$55, $01, -$14, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       -$16, $01, $30, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $3C, $01, $00, hi(SMVB_continue6_single), lo(SMVB_continue6_single) 
                    db       $1B, $01, $4C 
                    db       $73, $01, -$73 
                    db       -$4C, $01, -$1B 
                    db       $00, $01, -$3C 
                    db       -$30, $01, $16 
                    db       -$02, $01, -$0F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$75, $01, -$30, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $30, $01, $75, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $45, $01, -$45 
                    db       $02, $01, $0F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$38, $01, $38, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Tamarian_6 
                    db       $2C, $01, $46, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $11, $01, -$1A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $46, $01, $00, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $11, $01, $1A 
                    db       -$2E, $01, -$4B, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       -$30, $01, $12, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $2B, $01, $2B, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$22, $01, $49 
                    db       $50, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$22, $01, -$49, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $2B, $01, -$2B 
                    db       -$30, $01, -$12 
                    db       $07, $01, -$0B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$30, $01, -$77, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$30, $01, $77, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $60, $01, $00 
                    db       -$07, $01, $0B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$52, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Tamarian_7 
                    db       $05, $01, $3D, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1E, $01, -$06, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $33, $01, $33, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$06, $01, $1E 
                    db       $14, $01, -$55, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       -$30, $01, -$16, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $3C, hi(SMVB_continue6_single), lo(SMVB_continue6_single) 
                    db       -$4C, $01, $1B 
                    db       $73, $01, $73 
                    db       $1B, $01, -$4C 
                    db       $3C, $01, $00 
                    db       -$16, $01, -$30 
                    db       $0F, $01, -$02, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $30, $01, -$75, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$75, $01, $30, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $45, $01, $45 
                    db       -$0F, $01, $02, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$38, $01, -$38, hi(SMVB_startDraw_yEqx_single), lo(SMVB_startDraw_yEqx_single) ; y is -$38 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Tamarian_8 
                    db       $05, $01, -$34, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1A, $01, $11, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $46, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$1A, $01, $11 
                    db       $49, $01, -$2E, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       -$12, $01, -$30, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$2B, $01, $2B, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$49, $01, -$22 
                    db       $00, $01, $50, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $49, $01, -$22, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $2B, $01, $2B 
                    db       $12, $01, -$30 
                    db       $0B, $01, $07, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $77, $01, -$30, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$77, $01, -$30, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       $00, $01, $60, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$0B, $01, -$07, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, -$52, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Tamarian_9 
                    db       $0A, $01, -$34, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1A, $01, $11, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $45, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$1A, $01, $11 
                    db       $46, $01, -$2E, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       -$12, $01, -$30, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$2B, $01, $2B, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$49, $01, -$22 
                    db       $00, $01, $50, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $49, $01, -$22, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $2B, $01, $2B 
                    db       $12, $01, -$30 
                    db       $0B, $01, $07, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $77, $01, -$30, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$77, $01, -$30, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       $00, $01, $60, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$0B, $01, -$07, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, -$52, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
