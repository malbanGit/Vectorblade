enemySin3Definition 
                    dw       EnemySin3Angle8Table 
                    db       5                            ; HP 
                    dw       EnemySin3WaitAnim 
                    db       3,TYPE_CAN_CLONE, 128+64+20  ; ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
EnemySin3WaitAnim 
                    DW       Ufo_0                        ; list of all single vectorlists in this 
                    DW       Ufo_8 
                    DW       Ufo_9 
                    DW       Ufo_10 
                    DW       Ufo_9 
                    DW       Ufo_8 
                    DW       0 
EnemySin3Angle8Table 
                    DW       Ufo_0                        ; list of all single vectorlists in this 
                    DW       Ufo_1 
                    DW       Ufo_2 
                    DW       Ufo_3 
                    DW       Ufo_4 
                    DW       Ufo_5 
                    DW       Ufo_6 
                    DW       Ufo_7 
                    DW       0 
Ufo_0 
                    db       $0C, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $2C, $01, $4B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$07, $01, $44, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $12, $01, $0D 
                    db       $14, $01, -$15 
                    db       $12, $01, -$49 
                    db       $16, $01, -$3E 
                    db       -$16, $01, -$3E 
                    db       $32, $01, -$1A 
                    db       $11, $01, $58, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$11, $01, $58 
                    db       -$32, $01, -$1A 
                    db       $00, $01, -$7C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$12, $01, -$49, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$15, $01, -$15, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$13, $01, $11 
                    db       $09, $01, $40 
                    db       -$2C, $01, $4B 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Ufo_1 
                    db       $22, $01, -$36, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$16, $01, $54, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$35, $01, $2C, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $04, $01, $15 
                    db       $1D, $01, $00 
                    db       $41, $01, -$27 
                    db       $3A, $01, -$1D 
                    db       $1D, $01, -$3A 
                    db       $36, $01, $12 
                    db       -$33, $01, $48, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$48, $01, $33 
                    db       -$12, $01, -$36 
                    db       $57, $01, -$57, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $27, $01, -$41, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$01, $01, -$1D, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$19, $01, -$03 
                    db       -$27, $01, $34 
                    db       -$54, $01, $16 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Ufo_2 
                    db       $58, $01, -$4C, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$4B, $01, $2C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$44, $01, -$07, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$0D, $01, $12 
                    db       $15, $01, $14 
                    db       $49, $01, $12 
                    db       $3E, $01, $16 
                    db       $3E, $01, -$16 
                    db       $1A, $01, $32 
                    db       -$58, $01, $11, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$58, $01, -$11 
                    db       $1A, $01, -$32 
                    db       $7C, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $49, $01, -$12, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $15, $01, -$15, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$11, $01, -$13 
                    db       -$40, $01, $09 
                    db       -$4B, $01, -$2C 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Ufo_3 
                    db       $47, $01, -$1B, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$54, $01, -$16, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$2C, $01, -$35, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$15, $01, $04 
                    db       $00, $01, $1D 
                    db       $27, $01, $41 
                    db       $1D, $01, $3A 
                    db       $3A, $01, $1D 
                    db       -$12, $01, $36 
                    db       -$48, $01, -$33, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$33, $01, -$48 
                    db       $36, $01, -$12 
                    db       $57, $01, $57, hi(SMVB_startMove_yEqx_single), lo(SMVB_startMove_yEqx_single) ; y is $57 
                    db       $41, $01, $27, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1D, $01, -$01, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $03, $01, -$19 
                    db       -$34, $01, -$27 
                    db       -$16, $01, -$54 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Ufo_4 
                    db       $52, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$2C, $01, -$4B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $07, $01, -$44, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$12, $01, -$0D 
                    db       -$14, $01, $15 
                    db       -$12, $01, $49 
                    db       -$16, $01, $3E 
                    db       $16, $01, $3E 
                    db       -$32, $01, $1A 
                    db       -$11, $01, -$58, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $11, $01, -$58 
                    db       $32, $01, $1A 
                    db       $00, $01, $7C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $12, $01, $49, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $15, $01, $15, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $13, $01, -$11 
                    db       -$09, $01, -$40 
                    db       $2C, $01, -$4B 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Ufo_5 
                    db       $47, $01, $1B, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $16, $01, -$54, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $35, $01, -$2C, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$04, $01, -$15 
                    db       -$1D, $01, $00 
                    db       -$41, $01, $27 
                    db       -$3A, $01, $1D 
                    db       -$1D, $01, $3A 
                    db       -$36, $01, -$12 
                    db       $33, $01, -$48, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $48, $01, -$33 
                    db       $12, $01, $36 
                    db       -$57, $01, $57, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$27, $01, $41, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $01, $01, $1D, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $19, $01, $03 
                    db       $27, $01, -$34 
                    db       $54, $01, -$16 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Ufo_6 
                    db       $58, $01, $4C, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $4B, $01, -$2C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $44, $01, $07, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $0D, $01, -$12 
                    db       -$15, $01, -$14 
                    db       -$49, $01, -$12 
                    db       -$3E, $01, -$16 
                    db       -$3E, $01, $16 
                    db       -$1A, $01, -$32 
                    db       $58, $01, -$11, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $58, $01, $11 
                    db       -$1A, $01, $32 
                    db       -$7C, $01, $00, hi(SMVB_startMove_yd4_single), lo(SMVB_startMove_yd4_single) 
                    db       -$49, $01, $12, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$15, $01, $15, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $11, $01, $13 
                    db       $40, $01, -$09 
                    db       $4B, $01, $2C 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Ufo_7 
                    db       $22, $01, $36, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $54, $01, $16, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $2C, $01, $35, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $15, $01, -$04 
                    db       $00, $01, -$1D 
                    db       -$27, $01, -$41 
                    db       -$1D, $01, -$3A 
                    db       -$3A, $01, -$1D 
                    db       $12, $01, -$36 
                    db       $48, $01, $33, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $33, $01, $48 
                    db       -$36, $01, $12 
                    db       -$57, $01, -$57, hi(SMVB_startMove_yEqx_single), lo(SMVB_startMove_yEqx_single) ; y is -$57 
                    db       -$41, $01, -$27, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1D, $01, $01, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$03, $01, $19 
                    db       $34, $01, $27 
                    db       $16, $01, $54 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Ufo_8 
                    db       $26, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $12, $01, $4B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$07, $01, $44, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $12, $01, $0D 
                    db       $14, $01, -$15 
                    db       $12, $01, -$49 
                    db       $16, $01, -$3E 
                    db       -$16, $01, -$3E 
                    db       $32, $01, -$1A 
                    db       $11, $01, $58, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$11, $01, $58 
                    db       -$32, $01, -$1A 
                    db       $00, $01, -$7C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$12, $01, -$49, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$15, $01, -$15, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$13, $01, $11 
                    db       $09, $01, $40 
                    db       -$12, $01, $4B 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Ufo_9 
                    db       $3F, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$07, $01, $4B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$07, $01, $44, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $12, $01, $0D 
                    db       $14, $01, -$15 
                    db       $12, $01, -$49 
                    db       $16, $01, -$3E 
                    db       -$16, $01, -$3E 
                    db       $32, $01, -$1A 
                    db       $11, $01, $58, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$11, $01, $58 
                    db       -$32, $01, -$1A 
                    db       $00, $01, -$7C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$12, $01, -$49, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$15, $01, -$15, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$13, $01, $11 
                    db       $09, $01, $40 
                    db       $07, $01, $4B 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Ufo_10 
                    db       $58, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$20, $01, $4B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$07, $01, $44, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $12, $01, $0D 
                    db       $14, $01, -$15 
                    db       $12, $01, -$49 
                    db       $16, $01, -$3E 
                    db       -$16, $01, -$3E 
                    db       $32, $01, -$1A 
                    db       $11, $01, $58, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$11, $01, $58 
                    db       -$32, $01, -$1A 
                    db       $00, $01, -$7C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$12, $01, -$49, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$15, $01, -$15, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$13, $01, $11 
                    db       $09, $01, $40 
                    db       $20, $01, $4B 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
