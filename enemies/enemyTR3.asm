enemyTR3Definition1 
enemyTR3Definition_1 
                    dw       EnemyTR3Angle8Table 
                    db       3 
                    dw       EnemyTR3WaitAnim 
                    db       1,0                          ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemyTR3Definition_1_fast 
                    dw       EnemyTR3Angle8Table 
                    db       10 
                    dw       EnemyTR3WaitAnim 
                    db       3,0                          ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemyTR3Definition_2 
                    dw       EnemyTR3Angle8Table 
                    db       10 
                    dw       EnemyTR3WaitAnim 
                    db       3,0                          ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemyTR3Definition_1_clone 
                    dw       EnemyTR3Angle8Table 
                    db       30 
                    dw       EnemyTR3WaitAnim 
                    db       2,TYPE_CAN_CLONE, 64+00+20   ; ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
EnemyTR3WaitAnim 
                    DW       Klingon_0                    ; list of all single vectorlists in this 
                    DW       Klingon_8 
                    DW       Klingon_9 
                    DW       Klingon_8 
                    DW       0 
EnemyTR3Angle8Table 
_SM_animData 
                    DW       Klingon_0                    ; list of all single vectorlists in this 
                    DW       Klingon_1 
                    DW       Klingon_2 
                    DW       Klingon_3 
                    DW       Klingon_4 
                    DW       Klingon_5 
                    DW       Klingon_6 
                    DW       Klingon_7 
                    DW       0 
; change
Klingon_0 
                    db       $03, $01, $0A, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $12, $01, $12, hi(SMVB_startDraw_yEqx_single), lo(SMVB_startDraw_yEqx_single) ; y is $12 
                    db       -$2A, $01, $5E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $75, $01, $00 , hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       -$3F, $01, -$12 , hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $4F, $01, -$5E 
                    db       $57, $01, -$05 
                    db       $1D, $01, $13 
                    db       $31, $01, -$18 
                    db       -$31, $01, -$18, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       -$1D, $01, $13 
                    db       -$57, $01, -$05 
                    db       -$4F, $01, -$5E 
                    db       $3F, $01, -$12 
                    db       -$75, $01, $00, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       $2A, $01, $5E , hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$12, $01, $12, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Klingon_1 
                    db       $20, $01, -$52, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, $1A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$5F, $01, $25, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $52, $01, $51 
                    db       -$20, $01, -$38 
                    db       $7A, $01, -$0B 
                    db       $42, $01, $3A 
                    db       $06, $01, $23 
                    db       $34, $01, $11 
                    db       -$11, $01, -$34, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$23, $01, -$06 
                    db       -$3A, $01, -$42 
                    db       $0B, $01, -$7A 
                    db       $38, $01, $20 
                    db       -$51, $01, -$52 
                    db       -$25, $01, $5F 
                    db       -$1A, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Klingon_2 
                    db       $76, $01, -$7D, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$12, $01, $12, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$5E, $01, -$2A, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $00, $01, $75 
                    db       $12, $01, -$3F 
                    db       $5E, $01, $4F 
                    db       $05, $01, $57 
                    db       -$13, $01, $1D 
                    db       $18, $01, $31 
                    db       $18, $01, -$31, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$13, $01, -$1D 
                    db       $05, $01, -$57 
                    db       $5E, $01, -$4F 
                    db       $12, $01, $3F 
                    db       $00, $01, -$75 
                    db       -$5E, $01, $2A 
                    db       -$12, $01, -$12, hi(SMVB_continue_yEqx_single), lo(SMVB_continue_yEqx_single) ; y is -$12 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Klingon_3 
                    db       $69, $01, -$30, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$1A, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$25, $01, -$5F, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$51, $01, $52 
                    db       $38, $01, -$20 
                    db       $0B, $01, $7A 
                    db       -$3A, $01, $42 
                    db       -$23, $01, $06 
                    db       -$11, $01, $34 
                    db       $34, $01, -$11, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $06, $01, -$23 
                    db       $42, $01, -$3A 
                    db       $7A, $01, $0B 
                    db       -$20, $01, $38 
                    db       $52, $01, -$51 
                    db       -$5F, $01, -$25 
                    db       $00, $01, -$1A, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Klingon_4 
                    db       $7E, $01, -$05, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$12, $01, -$12, hi(SMVB_startDraw_yEqx_single), lo(SMVB_startDraw_yEqx_single) ; y is -$12 
                    db       $2A, $01, -$5E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$75, $01, $00, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       $3F, $01, $12 , hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       -$4F, $01, $5E 
                    db       -$57, $01, $05 
                    db       -$1D, $01, -$13 
                    db       -$31, $01, $18 
                    db       $31, $01, $18, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $1D, $01, -$13 
                    db       $57, $01, $05 
                    db       $4F, $01, $5E 
                    db       -$3F, $01, $12 
                    db       $75, $01, $00 
                    db       -$2A, $01, -$5E 
                    db       $12, $01, -$12, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Klingon_5 
                    db       $70, $01, $29, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $00, $01, -$1A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $5F, $01, -$25, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$52, $01, -$51 
                    db       $20, $01, $38 
                    db       -$7A, $01, $0B , hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) ; CHANGED 
                    db       -$42, $01, -$3A , hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$06, $01, -$23 
                    db       -$34, $01, -$11 
                    db       $11, $01, $34, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $23, $01, $06 
                    db       $3A, $01, $42 
                    db       -$0B, $01, $7A 
                    db       -$38, $01, -$20 
                    db       $51, $01, $52 
                    db       $25, $01, -$5F 
                    db       $1A, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Klingon_6 
                    db       $45, $01, $3E, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $12, $01, -$12, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $5E, $01, $2A, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $00, $01, -$75 
                    db       -$12, $01, $3F 
                    db       -$5E, $01, -$4F 
                    db       -$05, $01, -$57 
                    db       $13, $01, -$1D 
                    db       -$18, $01, -$31 
                    db       -$18, $01, $31, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $13, $01, $1D 
                    db       -$05, $01, $57 
                    db       -$5E, $01, $4F 
                    db       -$12, $01, -$3F 
                    db       $00, $01, $75 
                    db       $5E, $01, -$2A 
                    db       $12, $01, $12, hi(SMVB_continue_yEqx_single), lo(SMVB_continue_yEqx_single) ; y is $12 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Klingon_7 
                    db       $2E, $01, $60, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1A, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $25, $01, $5F, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $51, $01, -$52 
                    db       -$38, $01, $20 
                    db       -$0B, $01, -$7A 
                    db       $3A, $01, -$42 
                    db       $23, $01, -$06 
                    db       $11, $01, -$34 
                    db       -$34, $01, $11, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$06, $01, $23 
                    db       -$42, $01, $3A 
                    db       -$7A, $01, -$0B 
                    db       $20, $01, -$38 
                    db       -$52, $01, $51 
                    db       $5F, $01, $25 
                    db       $00, $01, $1A, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Klingon_8 
                    db       $08, $01, $0A, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $0D, $01, $12, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$2A, $01, $5A, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $75, $01, $00 , hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       -$3F, $01, -$12 , hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $4F, $01, -$5A 
                    db       $57, $01, -$05 
                    db       $1D, $01, $13 
                    db       $31, $01, -$18 
                    db       -$31, $01, -$18, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       -$1D, $01, $13 
                    db       -$57, $01, -$05 
                    db       -$4F, $01, -$5A 
                    db       $3F, $01, -$12 
                    db       -$75, $01, $00 , hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       $2A, $01, $5A , hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$0D, $01, $12 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Klingon_9 
                    db       $0D, $01, $0A, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $08, $01, $12, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$2A, $01, $56, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $75, $01, $00 , hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       -$3F, $01, -$12 , hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $4F, $01, -$56 
                    db       $57, $01, -$05 
                    db       $1D, $01, $13 
                    db       $31, $01, -$18 
                    db       -$31, $01, -$18, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       -$1D, $01, $13 
                    db       -$57, $01, -$05 
                    db       -$4F, $01, -$56 
                    db       $3F, $01, -$12 
                    db       -$75, $01, $00 , hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       $2A, $01, $56 , hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$08, $01, $12 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
enemyTribble 
                    dw       enemyTribbleAngle8Table 
                    db       1 
                    dw       enemyTribbleWaitAnim 
                    db       1,0                          ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemyTribbleWaitAnim 
                    DW       Tribble_0 
                    DW       Tribble_1 
                    DW       0 
enemyTribbleAngle8Table 
                    DW       Tribble_0 
                    DW       Tribble_1 
                    DW       Tribble_0 
                    DW       Tribble_1 
                    DW       Tribble_0 
                    DW       Tribble_1 
                    DW       Tribble_0 
                    DW       Tribble_1 
                    DW       0 
Tribble_0 
                    db       -$02, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $29, $01, -$1A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$07, $01, -$36, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $35, $01, $15 
                    db       $16, $01, -$35 
                    db       $26, $01, $24 
                    db       $2F, $01, -$12 
                    db       -$05, $01, $38 
                    db       $37, $01, $0C 
                    db       -$2B, $01, $26, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $22, $01, $28 
                    db       -$32, $01, $01 
                    db       $08, $01, $30 
                    db       -$30, $01, -$16 
                    db       -$24, $01, $22 
                    db       -$15, $01, -$2B 
                    db       -$35, $01, $10, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $0C, $01, -$35 
                    db       -$2F, $01, -$21 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Tribble_1 
                    db       $22, $01, $56, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $0A, $01, -$2F, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$2B, $01, -$21, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $34, $01, -$17 
                    db       -$15, $01, -$35 
                    db       $34, $01, -$01 
                    db       $14, $01, -$2E 
                    db       $25, $01, $2A 
                    db       $2F, $01, -$1F 
                    db       -$03, $01, $3A, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $34, $01, $05 
                    db       -$22, $01, $24 
                    db       $27, $01, $1C 
                    db       -$32, $01, $13 
                    db       -$01, $01, $31 
                    db       -$2E, $01, -$0F 
                    db       -$19, $01, $31, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$1E, $01, -$2E 
                    db       -$38, $01, $0A 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
