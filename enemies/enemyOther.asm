SaucerWindowAnim 
                    DW       SaucerWindow_0               ; list of all single vectorlists in this 
                    DW       SaucerWindow_1 
                    DW       SaucerWindow_2 
                    DW       SaucerWindow_3 
                    DW       SaucerWindow_4 
                    DW       SaucerWindow_5 
                    DW       SaucerWindow_6 
                    DW       SaucerWindow_7 
                    DW       0 
SaucerWindow_0 
                    db       $6A, $01, -$4E, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$10, $01, $27, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $35, $01, $34, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $04, $01, -$1D 
                    db       $09, $01, $4B, hi(SMVB_startMove_double_sj), lo(SMVB_startMove_double_sj), hi(Saucer), lo(Saucer) 
SaucerWindow_1 
                    db       $7C, $01, $31, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $00, $01, -$28, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$2E, $01, $32, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $13, $01, $23 
                    db       $33, $01, -$59, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(Saucer), lo(Saucer) 
SaucerWindow_2 
                    db       $66, $01, $3B, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $2B, $01, -$3B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1A, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$39, $01, $1A 
                    db       $0E, $01, $3B 
                    db       $43, $01, -$40, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(Saucer), lo(Saucer) 
SaucerWindow_3 
                    db       $60, $01, $21, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $37, $01, -$1B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$18, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$3D, $01, -$03 
                    db       $06, $01, $36 
                    db       $4F, $01, -$0C, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(Saucer), lo(Saucer) 
SaucerWindow_4 
                    db       $5D, $01, $11, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $40, $01, -$05, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$24, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$40, $01, -$0E 
                    db       $00, $01, $37 
                    db       $56, $01, $14, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(Saucer), lo(Saucer) 
SaucerWindow_5 
                    db       $5D, $01, -$03, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $3E, $01, $05, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$19, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$3E, $01, -$19 
                    db       $00, $01, $2D 
                    db       $55, $01, $3D, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(Saucer), lo(Saucer) 
SaucerWindow_6 
                    db       $5E, $01, -$13, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $3C, $01, $14, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1D, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$3C, $01, -$27 
                    db       $00, $01, $30 
                    db       $53, $01, $5D, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(Saucer), lo(Saucer) 
SaucerWindow_7 
                    db       $5E, $01, -$24, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $3C, $01, $1D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$1A, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$33, $01, -$37 
                    db       -$09, $01, $34 
                    db       $53, $01, $7F, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(Saucer), lo(Saucer) 
Saucer 
                    db       $0A, $01, -$3A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0A, $01, -$3A, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$21, $01, -$3D 
                    db       -$29, $01, -$39 
                    db       $15, $01, -$47 
                    db       -$33, $01, -$42 
                    db       -$4D, $01, $4E 
                    db       -$19, $01, $2C 
                    db       -$15, $01, $2A, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $0A, $01, $37 
                    db       -$18, $01, $39 
                    db       -$05, $01, $25 
                    db       $05, $01, $25 
                    db       $18, $01, $39 
                    db       -$0A, $01, $37 
                    db       $15, $01, $2A, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $19, $01, $2C 
                    db       $4D, $01, $4E 
                    db       $33, $01, -$42 
                    db       -$15, $01, -$47 
                    db       $29, $01, -$39 
                    db       $21, $01, -$3D 
                    db       -$29, $01, -$70, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       -$14, $01, $64, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $42, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $14, $01, $64, hi(SMVB_continue_single), lo(SMVB_continue_single) 
; only for very cranky?
;                    db       -$29, $01, -$10, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
MoneyMothershipAnim 
                    DW       MoneyMothership_0            ; list of all single vectorlists in this 
                    DW       MoneyMothership_1 
                    DW       MoneyMothership_2 
                    DW       MoneyMothership_3 
                    DW       MoneyMothership_4 
                    DW       MoneyMothership_5 
                    DW       0 
MoneyMothership_0 
                    db       -$0A, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1D, $01, $23, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $27, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $7B, $01, -$27 
                    db       $30, $01, $30, hi(SMVB_startMove_yEqx_single), lo(SMVB_startMove_yEqx_single) ; y is $30 
                    db       -$27, $01, $7B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $27, $01, $00, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $23, $01, $1D 
                    db       $23, $01, -$1D 
                    db       $27, $01, $00 
                    db       -$27, $01, -$7B 
                    db       $47, $01, -$49, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       -$72, $01, -$72, hi(SMVB_startDraw_yEqx_single), lo(SMVB_startDraw_yEqx_single) ; y is -$72 
                    db       -$7E, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$68, $01, $72, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $7E, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $68, $01, $72, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $7E, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $72, $01, -$72, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$5E, $01, -$1C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $7B, $01, $27, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$27, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $1D, $01, -$23 
                    db       -$1D, $01, -$23 
                    db       $00, $01, -$27 
                    db       -$7B, $01, $27 
                    db       -$30, $01, -$30, hi(SMVB_startMove_yEqx_single), lo(SMVB_startMove_yEqx_single) ; y is -$30 
                    db       $27, $01, $09, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $13, $01, $4A, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$13, $01, $4A 
                    db       -$4A, $01, $13 
                    db       -$4A, $01, -$13 
                    db       -$13, $01, -$4A 
                    db       $13, $01, -$4A 
                    db       $4A, $01, -$13 
                    db       $23, $01, $0A, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $27, $01, -$7B 
                    db       -$27, $01, $00 
                    db       -$23, $01, -$1D 
                    db       -$23, $01, $1D 
                    db       -$27, $01, $00 
                    db       $27, $01, $7B 
                    db       -$30, $01, $30, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$7B, $01, -$27, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $27, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$1D, $01, $23 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
MoneyMothership_1 
                    db       -$02, $01, -$3C, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $13, $01, $2C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0A, $01, $21, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $40, $01, -$02, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $21, $01, $3A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$45, $01, $6D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $25, $01, $0A, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $1C, $01, $26 
                    db       $2C, $01, -$13 
                    db       $21, $01, $0A 
                    db       -$02, $01, -$40, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $58, $01, -$34, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       -$28, $01, -$46, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       -$7B, $01, -$20, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$41, $01, $29, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       -$22, $01, $7B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $23, $01, $45, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $7B, $01, $20, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $46, $01, -$28, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       -$56, $01, -$34, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $6D, $01, $45, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0A, $01, -$25, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $26, $01, -$1C 
                    db       -$13, $01, -$2C 
                    db       $0A, $01, -$21 
                    db       -$40, $01, $02, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$21, $01, -$3A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $22, $01, $12, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$01, $01, $4B, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$25, $01, $43 
                    db       -$4B, $01, -$01 
                    db       -$43, $01, -$25 
                    db       $01, $01, -$4B 
                    db       $25, $01, -$43 
                    db       $4B, $01, $01 
                    db       $21, $01, $13, hi(SMVB_continue6_single), lo(SMVB_continue6_single) 
                    db       $45, $01, -$6D 
                    db       -$25, $01, -$0A 
                    db       -$1C, $01, -$26 
                    db       -$2C, $01, $13 
                    db       -$21, $01, -$0A 
                    db       $02, $01, $40, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$3A, $01, $21, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$6D, $01, -$45, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0A, $01, $25, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$26, $01, $1C 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
MoneyMothership_2 
                    db       $16, $01, -$75, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $06, $01, $2F, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$13, $01, $21, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $7E, $01, $1D 
                    db       $12, $01, $3D, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$5F, $01, $59, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $20, $01, $13, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $12, $01, $2A 
                    db       $2F, $01, -$06 
                    db       $21, $01, $13 
                    db       $1D, $01, -$7E 
                    db       $61, $01, -$1D, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       -$14, $01, -$4C, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       -$72, $01, -$40, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$48, $01, $17, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       -$40, $01, $72, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $10, $01, $4A, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $72, $01, $40, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $4C, $01, -$14, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       -$45, $01, -$49, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $59, $01, $5F, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $13, $01, -$20, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $2A, $01, -$12 
                    db       -$06, $01, -$2F 
                    db       $13, $01, -$21 
                    db       -$7E, $01, -$1D , hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       -$12, $01, -$3D, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $1E, $01, $1B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$16, $01, $48, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$36, $01, $38 
                    db       -$48, $01, -$16 
                    db       -$38, $01, -$36 
                    db       $16, $01, -$48 
                    db       $36, $01, -$38 
                    db       $48, $01, $16 
                    db       $1A, $01, $1B, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $5F, $01, -$59 
                    db       -$20, $01, -$13 
                    db       -$12, $01, -$2A 
                    db       -$2F, $01, $06 
                    db       -$21, $01, -$13 
                    db       -$1D, $01, $7E 
                    db       -$3D, $01, $12, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$59, $01, -$5F, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$13, $01, $20, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$2A, $01, $12 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
MoneyMothership_3 
                    db       $1D, $01, -$53, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$05, $01, $2E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1B, $01, $1B, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $72, $01, $3E 
                    db       $00, $01, $3E, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$72, $01, $3E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1B, $01, $1B, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $05, $01, $2E 
                    db       $2E, $01, $05 
                    db       $1B, $01, $1B 
                    db       $3E, $01, -$72 
                    db       $65, $01, -$02, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       $00, $01, -$50, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       -$5B, $01, -$5B, hi(SMVB_startMove_yEqx_single), lo(SMVB_startMove_yEqx_single) ; y is -$5B 
                    db       -$4C, $01, $04, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       -$5B, $01, $5B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$04, $01, $4C, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $5B, $01, $5B, hi(SMVB_startMove_yEqx_single), lo(SMVB_startMove_yEqx_single) ; y is $5B 
                    db       $50, $01, $00, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       -$31, $01, -$57, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $3E, $01, $72, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1B, $01, -$1B, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $2E, $01, -$05 
                    db       $05, $01, -$2E 
                    db       $1B, $01, -$1B 
                    db       -$72, $01, -$3E 
                    db       $00, $01, -$3E, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $14, $01, $1F, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$27, $01, $41, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$41, $01, $27 
                    db       -$41, $01, -$27 
                    db       -$27, $01, -$41 
                    db       $27, $01, -$41 
                    db       $41, $01, -$27 
                    db       $41, $01, $27 
                    db       $13, $01, $22, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $72, $01, -$3E 
                    db       -$1B, $01, -$1B 
                    db       -$05, $01, -$2E 
                    db       -$2E, $01, -$05 
                    db       -$1B, $01, -$1B 
                    db       -$3E, $01, $72 
                    db       -$3E, $01, $00, hi(SMVB_startMove_yStays_single), lo(SMVB_startMove_yStays_single) ; y is -$3E 
                    db       $01, $01, -$72, hi(SMVB_startDraw_yStays_single), lo(SMVB_startDraw_yStays_single) ; y was -$3E, now SHIFT Poke 
                    db       -$1B, $01, $1B, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$2E, $01, $05 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
MoneyMothership_4 
                    db       $36, $01, -$65, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$12, $01, $2A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$20, $01, $13, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $5F, $01, $59 
                    db       -$12, $01, $3D, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$7E, $01, $1D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $13, $01, $21, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       -$06, $01, $2F 
                    db       $2A, $01, $12 
                    db       $13, $01, $20 
                    db       $59, $01, -$5F 
                    db       $63, $01, $19, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       $14, $01, -$4C, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       -$40, $01, -$72, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$4A, $01, -$10, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       -$72, $01, $40, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$17, $01, $48, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $40, $01, $72, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $4C, $01, $14, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       -$17, $01, -$60, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $1D, $01, $7E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $21, $01, -$13, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $2F, $01, $06 
                    db       $12, $01, -$2A 
                    db       $20, $01, -$13 
                    db       -$5F, $01, -$59 
                    db       $12, $01, -$3D, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $0C, $01, $22, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$38, $01, $36, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$48, $01, $16 
                    db       -$36, $01, -$38 
                    db       -$16, $01, -$48 
                    db       $38, $01, -$36 
                    db       $48, $01, -$16 
                    db       $36, $01, $38 
                    db       $0A, $01, $26, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $7E, $01, -$1D 
                    db       -$13, $01, -$21 
                    db       $06, $01, -$2F 
                    db       -$2A, $01, -$12 
                    db       -$13, $01, -$20 
                    db       -$59, $01, $5F 
                    db       -$3D, $01, -$12, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$1D, $01, -$7E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$21, $01, $13, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$2F, $01, -$06 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
MoneyMothership_5 
                    db       $52, $01, -$71, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$1C, $01, $26, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$25, $01, $0A, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $45, $01, $6D 
                    db       -$21, $01, $3A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$40, $01, -$02, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $0A, $01, $21, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       -$13, $01, $2C 
                    db       $26, $01, $1C 
                    db       $0A, $01, $25 
                    db       $6D, $01, -$45 
                    db       $59, $01, $32, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       $28, $01, -$46, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       -$20, $01, -$7B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$45, $01, -$23, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       -$7B, $01, $22, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$29, $01, $41, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $20, $01, $7B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $46, $01, $28, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $03, $01, -$63, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$02, $01, $40, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $21, $01, -$0A, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $2C, $01, $13 
                    db       $1C, $01, -$26 
                    db       $25, $01, -$0A 
                    db       -$45, $01, -$6D 
                    db       $21, $01, -$3A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $01, $01, $28, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$43, $01, $25, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$4B, $01, $01 
                    db       -$25, $01, -$43 
                    db       -$01, $01, -$4B 
                    db       $43, $01, -$25 
                    db       $4B, $01, -$01 
                    db       $25, $01, $43 
                    db       $00, $01, $23, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $40, $01, $02, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$0A, $01, -$21, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $13, $01, -$2C 
                    db       -$26, $01, -$1C 
                    db       -$0A, $01, -$25 
                    db       -$6D, $01, $45 
                    db       -$3A, $01, -$21, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $02, $01, -$40, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       -$21, $01, $0A, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$2C, $01, -$13 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
MoneySuckerBase 
                    db       $4A, $01, -$20, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $51, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$21, $01, $15, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$40, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $00, $01, $5E, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $55, $01, $00 
                    db       $20, $01, $15 
                    db       -$20, $01, $0B 
                    db       -$55, $01, $00 
                    db       $00, $01, $36 
                    db       $75, $01, $00 
                    db       $2D, $01, $17, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$2D, $01, $16 
                    db       -$75, $01, $00 
                    db       $00, $01, $34, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $75, $01, $00, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $2D, $01, $16 
                    db       -$2D, $01, $17 
                    db       -$75, $01, $00 
                    db       $00, $01, $36 
                    db       $55, $01, $00 
                    db       $20, $01, $0B 
                    db       -$20, $01, $15, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$55, $01, $00 
                    db       $00, $01, $5E 
                    db       $40, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $21, $01, $15, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$51, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$4A, $01, -$20, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$0D, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $50, $01, $0F, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $2B, $01, -$55, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1E, $01, -$23, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $1D, $01, -$32, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0D, $01, -$2B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $09, $01, -$24, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$22, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$0D, $01, -$24 
                    db       -$13, $01, -$2E, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$1D, $01, -$36, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$11, $01, -$21, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$33, $01, -$58, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$4B, $01, $06, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
MoneySuckerBaseAnim 
                    DW       MoneySuckerBase_0            ; list of all single vectorlists in this 
                    DW       MoneySuckerBase_1 
                    DW       MoneySuckerBase_2 
                    DW       MoneySuckerBase_1 
                    DW       0 
MoneySuckerBase_0 
                    db       $09, $01, $7E, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$20, $01, -$0C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $20, $01, -$3A, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$37, $01, -$15 
                    db       $37, $01, -$17 
                    db       -$17, $01, -$0A 
                    db       $17, $01, -$17 
                    db       -$4D, $01, -$09 
                    db       $4D, $01, -$22 
                    db       -$17, $01, -$0B, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $17, $01, -$0A 
                    db       -$37, $01, -$2A 
                    db       $37, $01, -$2A 
                    db       -$17, $01, -$0A 
                    db       $17, $01, -$0B 
                    db       -$4D, $01, -$22 
                    db       $4D, $01, -$09, hi(SMVB_continue6_single), lo(SMVB_continue6_single) 
                    db       -$17, $01, -$17 
                    db       $17, $01, -$0A 
                    db       -$37, $01, -$17 
                    db       $37, $01, -$15 
                    db       -$20, $01, -$3A 
                    db       $20, $01, -$0C, hi(SMVB_continue_single_sj), lo(SMVB_continue_single_sj), hi(MoneySuckerBase), lo(MoneySuckerBase) 
MoneySuckerBase_1 
                    db       $09, $01, $7E, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$1D, $01, -$15, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $19, $01, -$30, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$30, $01, -$0C 
                    db       $34, $01, -$21 
                    db       -$1B, $01, -$03 
                    db       $17, $01, -$1E 
                    db       -$40, $01, -$0E 
                    db       $43, $01, -$15 
                    db       -$16, $01, -$13, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $13, $01, -$0D 
                    db       -$33, $01, -$21 
                    db       $30, $01, -$30 
                    db       -$10, $01, -$0A 
                    db       $11, $01, -$16 
                    db       -$44, $01, -$21 
                    db       $44, $01, $00, hi(SMVB_continue6_single), lo(SMVB_continue6_single) 
                    db       -$11, $01, -$16 
                    db       $11, $01, -$02 
                    db       -$32, $01, -$16 
                    db       $34, $01, -$1E 
                    db       -$1C, $01, -$35 
                    db       $20, $01, -$11, hi(SMVB_continue_single_sj), lo(SMVB_continue_single_sj), hi(MoneySuckerBase), lo(MoneySuckerBase) 
MoneySuckerBase_2 
                    db       $09, $01, $7E, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$1D, $01, -$15, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $10, $01, -$2E, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$27, $01, -$17 
                    db       $2D, $01, -$18 
                    db       -$1A, $01, -$06 
                    db       $14, $01, -$1B 
                    db       -$34, $01, -$17 
                    db       $3B, $01, -$0C 
                    db       -$11, $01, -$13, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $10, $01, -$0D 
                    db       -$30, $01, -$28 
                    db       $2D, $01, -$24 
                    db       -$0E, $01, -$0A 
                    db       $0B, $01, -$1B 
                    db       -$3D, $01, -$1B 
                    db       $44, $01, -$06, hi(SMVB_continue6_single), lo(SMVB_continue6_single) 
                    db       -$11, $01, -$16 
                    db       $0A, $01, -$01 
                    db       -$25, $01, -$18 
                    db       $2B, $01, -$1A 
                    db       -$1A, $01, -$32 
                    db       $21, $01, -$17, hi(SMVB_continue_single_sj), lo(SMVB_continue_single_sj), hi(MoneySuckerBase), lo(MoneySuckerBase) 
MegaFiendBase 
                    db       -$36, $01, -$5A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1B, $01, -$36, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $ee, $01, -$36, hi(SMVB_startDraw_xyStays_single), lo(SMVB_startDraw_xyStays_single) ; y was -$1B; x was -$36, y now ee 
                    db       $43, $01, -$17, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       -$1A, $01, -$1B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1B, $01, $1B, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $00, $01, $2E 
                    db       $1B, $01, $1B 
                    db       $1A, $01, -$1B 
                    db       $00, $01, -$2E 
                    db       $3A, $01, -$62, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       -$24, $01, $48, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $10, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $24, $01, $48 
                    db       -$12, $01, $12 
                    db       -$50, $01, -$31, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $50, $01, -$31, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $12, $01, $12, hi(SMVB_continue_yEqx_single), lo(SMVB_continue_yEqx_single) ; y is $12 
                    db       -$74, $01, -$52, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, $2E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1A, $01, $1B, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       -$1B, $01, -$1B 
                    db       $00, $01, -$2E 
                    db       $1B, $01, -$1B 
                    db       $1A, $01, $1B 
                    db       -$7C, $01, $09, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $23, $01, -$6C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $09, $01, -$1A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $2D, $01, -$49, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $3D, $01, $00, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $12, $01, $5A 
                    db       $04, $01, $44, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$3E, $01, $43, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $3E, $01, $43, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$04, $01, $44, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$12, $01, $5A, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$34, $01, $00 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
MegaFiendAnim 
                    DW       MegaFiend_0                  ; list of all single vectorlists in this 
                    DW       MegaFiend_1 
                    DW       MegaFiend_2 
                    DW       MegaFiend_1 
                    DW       0 
MegaFiend_0 
                    db       $12, $01, $43, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$37, $01, -$20, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $2B, $01, -$14, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$1F, $01, -$1F 
                    db       $25, $01, -$29 
                    db       -$20, $01, -$25 
                    db       $1C, $01, -$24 
                    db       -$2E, $01, -$20 
                    db       $37, $01, -$1F 
                    db       $0E, $01, $08, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$4E, $01, -$2D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $5B, $01, $0A, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $36, $01, -$7F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$5A, $01, -$1A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $51, $01, $47, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$12, $01, $5B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$27, $01, $31, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1B, $01, $20, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$20, $01, $24 
                    db       $1B, $01, $24 
                    db       -$13, $01, $2A 
                    db       $18, $01, $1F 
                    db       -$14, $01, $14 
                    db       $20, $01, $1F 
                    db       -$1B, $01, -$09, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$5B, $01, $25, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $5B, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $3F, $01, $3F, hi(SMVB_startMove_yEqx_single), lo(SMVB_startMove_yEqx_single) ; y is $3F 
                    db       -$48, $01, -$09, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$2E, $01, $36, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $25, $01, -$12 
                    db       $4A, $01, $1B 
                    db       $19, $01, $51, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(MegaFiendBase), lo(MegaFiendBase) 
MegaFiend_1 
                    db       $12, $01, $43, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$37, $01, -$28, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $2D, $01, -$1A, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$28, $01, -$1D 
                    db       $2C, $01, -$1D 
                    db       -$24, $01, -$2D 
                    db       $20, $01, -$23 
                    db       -$25, $01, -$21 
                    db       $2E, $01, -$17 
                    db       $0E, $01, $08, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$40, $01, -$35, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $4D, $01, $12, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $36, $01, -$7F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$5B, $01, -$11, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $52, $01, $3E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$12, $01, $5B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$27, $01, $2D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1B, $01, $1D, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$20, $01, $24 
                    db       $1B, $01, $2F 
                    db       -$13, $01, $21 
                    db       $1B, $01, $1F 
                    db       -$1B, $01, $10 
                    db       $24, $01, $28 
                    db       -$1B, $01, -$09, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$58, $01, $32, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $58, $01, -$0D, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $3F, $01, $3F, hi(SMVB_startMove_yEqx_single), lo(SMVB_startMove_yEqx_single) ; y is $3F 
                    db       -$48, $01, -$09, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$38, $01, $27, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $2F, $01, -$03 
                    db       $48, $01, $1B 
                    db       $1B, $01, $51, hi(SMVB_startMove_newY_eq_oldX_single_sj), lo(SMVB_startMove_newY_eq_oldX_single_sj), hi(MegaFiendBase), lo(MegaFiendBase) ; y is $1B 
MegaFiend_2 
                    db       $12, $01, $43, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$2F, $01, -$2B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $25, $01, -$19, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$28, $01, -$1B 
                    db       $2B, $01, -$25 
                    db       -$23, $01, -$2A 
                    db       $20, $01, -$1F 
                    db       -$22, $01, -$25 
                    db       $2B, $01, -$16 
                    db       $11, $01, $0C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$43, $01, -$3E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $4D, $01, $1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $36, $01, -$7F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$51, $01, -$13, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $48, $01, $40, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$12, $01, $5B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$21, $01, $29, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $18, $01, $21, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$23, $01, $23 
                    db       $1B, $01, $2C 
                    db       -$13, $01, $21 
                    db       $1B, $01, $20 
                    db       -$1B, $01, $0E 
                    db       $24, $01, $2D 
                    db       -$1B, $01, -$09, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$58, $01, $2D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $58, $01, -$08, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $3F, $01, $3F, hi(SMVB_startMove_yEqx_single), lo(SMVB_startMove_yEqx_single) ; y is $3F 
                    db       -$49, $01, -$03, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$2E, $01, $30, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $26, $01, -$12 
                    db       $4A, $01, $1B 
                    db       $19, $01, $51, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(MegaFiendBase), lo(MegaFiendBase) 
WarperAnimData 
                    DW       Warper_0                     ; list of all single vectorlists in this 
                    DW       Warper_1 
                    DW       Warper_2 
                    DW       Warper_3 
                    DW       Warper_4 
                    DW       Warper_5 
                    DW       Warper_6 
                    DW       Warper_7 
                    DW       Warper_8 
                    DW       Warper_9 
                    DW       Warper_10 
                    DW       Warper_11 
                    DW       Warper_12 
                    DW       0 
Warper_0 
                    db       -$5A, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $4D, $01, -$32, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$34, $01, $1A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1A, $01, $34, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$4F, $01, $17 
                    db       $4F, $01, $17 
                    db       $1A, $01, $34 
                    db       $34, $01, $1A 
                    db       $17, $01, $4F 
                    db       $17, $01, -$4F 
                    db       $34, $01, -$1A, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $1A, $01, -$34 
                    db       $4F, $01, -$17 
                    db       -$4F, $01, -$17 
                    db       -$1A, $01, -$34 
                    db       -$34, $01, -$1A 
                    db       -$17, $01, -$4F 
                    db       -$17, $01, $4F, hi(SMVB_continue_yStays_single), lo(SMVB_continue_yStays_single) ; y is -$17 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
Warper_1 
                    db       -$59, $01, -$13, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $53, $01, -$2A, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$35, $01, $13, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$23, $01, $30, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$4F, $01, $12 
                    db       $4A, $01, $1E 
                    db       $13, $01, $35 
                    db       $30, $01, $23 
                    db       $12, $01, $4F 
                    db       $1E, $01, -$4A 
                    db       $35, $01, -$13, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $23, $01, -$30 
                    db       $4F, $01, -$12 
                    db       -$4A, $01, -$1E 
                    db       -$13, $01, -$35 
                    db       -$30, $01, -$23 
                    db       -$12, $01, -$4F 
                    db       -$1E, $01, $4A, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
Warper_2 
                    db       -$55, $01, -$2A, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $56, $01, -$20, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$36, $01, $0F, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$26, $01, $2C, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$52, $01, $05 
                    db       $44, $01, $2A 
                    db       $0F, $01, $36 
                    db       $2C, $01, $26 
                    db       $05, $01, $52 
                    db       $2A, $01, -$44 
                    db       $36, $01, -$0F, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $26, $01, -$2C 
                    db       $52, $01, -$05 
                    db       -$44, $01, -$2A 
                    db       -$0F, $01, -$36 
                    db       -$2C, $01, -$26 
                    db       -$05, $01, -$52 
                    db       -$2A, $01, $44, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
Warper_3 
                    db       -$4F, $01, -$3E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $59, $01, -$15, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$36, $01, $08, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$2A, $01, $25, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$53, $01, -$04 
                    db       $40, $01, $34 
                    db       $08, $01, $36 
                    db       $25, $01, $2A 
                    db       -$04, $01, $53 
                    db       $34, $01, -$40 
                    db       $36, $01, -$08, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $2A, $01, -$25 
                    db       $53, $01, $04 
                    db       -$40, $01, -$34 
                    db       -$08, $01, -$36 
                    db       -$25, $01, -$2A 
                    db       $04, $01, -$53 
                    db       -$34, $01, $40, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
Warper_4 
                    db       -$45, $01, -$50, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $5A, $01, -$0A, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$36, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$2F, $01, $20, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$51, $01, -$0D 
                    db       $3A, $01, $3B 
                    db       $00, $01, $36 
                    db       $20, $01, $2F 
                    db       -$0D, $01, $51 
                    db       $3B, $01, -$3A 
                    db       $36, $01, $00, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $2F, $01, -$20 
                    db       $51, $01, $0D 
                    db       -$3A, $01, -$3B 
                    db       $00, $01, -$36 
                    db       -$20, $01, -$2F 
                    db       $0D, $01, -$51 
                    db       -$3B, $01, $3A, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
Warper_5 
                    db       -$38, $01, -$65, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $5A, $01, $01, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$37, $01, -$07, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$33, $01, $1C, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$4F, $01, -$17 
                    db       $31, $01, $40 
                    db       -$07, $01, $37 
                    db       $1C, $01, $33 
                    db       -$17, $01, $4F 
                    db       $40, $01, -$31 
                    db       $37, $01, $07, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $33, $01, -$1C 
                    db       $4F, $01, $17 
                    db       -$31, $01, -$40 
                    db       $07, $01, -$37 
                    db       -$1C, $01, -$33 
                    db       $17, $01, -$4F 
                    db       -$40, $01, $31, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
Warper_6 
                    db       -$2D, $01, -$75, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $5A, $01, $0C, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$34, $01, -$0F, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$36, $01, $16, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$4C, $01, -$21 
                    db       $2B, $01, $47 
                    db       -$0F, $01, $34 
                    db       $16, $01, $36 
                    db       -$21, $01, $4C 
                    db       $47, $01, -$2B 
                    db       $34, $01, $0F, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $36, $01, -$16 
                    db       $4C, $01, $21 
                    db       -$2B, $01, -$47 
                    db       $0F, $01, -$34 
                    db       -$16, $01, -$36 
                    db       $21, $01, -$4C 
                    db       -$47, $01, $2B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
Warper_7 
                    db       -$0E, $01, -$42, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $58, $01, $18, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$36, $01, -$16, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$34, $01, $0F, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$47, $01, -$2B 
                    db       $21, $01, $4C 
                    db       -$16, $01, $36 
                    db       $0F, $01, $34 
                    db       -$2B, $01, $47 
                    db       $4C, $01, -$21 
                    db       $36, $01, $16, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $34, $01, -$0F 
                    db       $47, $01, $2B 
                    db       -$21, $01, -$4C 
                    db       $16, $01, -$36 
                    db       -$0F, $01, -$34 
                    db       $2B, $01, -$47 
                    db       -$4C, $01, $21, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
Warper_8 
                    db       -$06, $01, -$48, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $55, $01, $21, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$33, $01, -$1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$37, $01, $07, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$40, $01, -$31 
                    db       $17, $01, $4F 
                    db       -$1C, $01, $33 
                    db       $07, $01, $37 
                    db       -$31, $01, $40 
                    db       $4F, $01, -$17 
                    db       $33, $01, $1C, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $37, $01, -$07 
                    db       $40, $01, $31 
                    db       -$17, $01, -$4F 
                    db       $1C, $01, -$33 
                    db       -$07, $01, -$37 
                    db       $31, $01, -$40 
                    db       -$4F, $01, $17, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
Warper_9 
                    db       $04, $01, -$4E, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $4F, $01, $2C, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$2F, $01, -$20, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$36, $01, $00, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$3B, $01, -$3A 
                    db       $0D, $01, $51 
                    db       -$20, $01, $2F 
                    db       $00, $01, $36 
                    db       -$3A, $01, $3B 
                    db       $51, $01, -$0D 
                    db       $2F, $01, $20, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $36, $01, $00 
                    db       $3B, $01, $3A 
                    db       -$0D, $01, -$51 
                    db       $20, $01, -$2F 
                    db       $00, $01, -$36 
                    db       $3A, $01, -$3B 
                    db       -$51, $01, $0D, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
Warper_10 
                    db       $0D, $01, -$53, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $49, $01, $36, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$2A, $01, -$25, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$36, $01, -$08, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$34, $01, -$40 
                    db       $04, $01, $53 
                    db       -$25, $01, $2A 
                    db       -$08, $01, $36 
                    db       -$40, $01, $34 
                    db       $53, $01, -$04 
                    db       $2A, $01, $25, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $36, $01, $08 
                    db       $34, $01, $40 
                    db       -$04, $01, -$53 
                    db       $25, $01, -$2A 
                    db       $08, $01, -$36 
                    db       $40, $01, -$34 
                    db       -$53, $01, $04, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
Warper_11 
                    db       $17, $01, -$56, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $43, $01, $3F, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$26, $01, -$2C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$36, $01, -$0F, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$2A, $01, -$44 
                    db       -$05, $01, $52 
                    db       -$2C, $01, $26 
                    db       -$0F, $01, $36 
                    db       -$44, $01, $2A 
                    db       $52, $01, $05 
                    db       $26, $01, $2C, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $36, $01, $0F 
                    db       $2A, $01, $44 
                    db       $05, $01, -$52 
                    db       $2C, $01, -$26 
                    db       $0F, $01, -$36 
                    db       $44, $01, -$2A 
                    db       -$52, $01, -$05, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
Warper_12 
                    db       $22, $01, -$58, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $3B, $01, $46, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$23, $01, -$30, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$35, $01, -$13, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$1E, $01, -$4A 
                    db       -$12, $01, $4F 
                    db       -$30, $01, $23 
                    db       -$13, $01, $35 
                    db       -$4A, $01, $1E 
                    db       $4F, $01, $12 
                    db       $23, $01, $30, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $35, $01, $13 
                    db       $1E, $01, $4A 
                    db       $12, $01, -$4F 
                    db       $30, $01, -$23 
                    db       $13, $01, -$35 
                    db       $4A, $01, -$1E 
                    db       -$4F, $01, -$12, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
FallingCash 
                    DW       FallingCash_0                ; list of all single vectorlists in this 
                    DW       FallingCash_1 
                    DW       FallingCash_2 
                    DW       FallingCash_3 
                    DW       FallingCash_4 
                    DW       FallingCash_5 
                    DW       FallingCash_6 
                    DW       FallingCash_7 
                    DW       FallingCash_8 
                    DW       FallingCash_9 
                    DW       FallingCash_10 
                    DW       FallingCash_11 
                    DW       FallingCash_12 
                    DW       FallingCash_13 
                    DW       FallingCash_14 
                    DW       FallingCash_15 
                    DW       FallingCash_16 
                    DW       0 
FallingCash_0 
                    db       $53, $01, $3F, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$7E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$50, $01, $00, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $00, $01, $7E 
                    db       $50, $01, $00 
                    db       -$3F, $01, -$49, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, -$26, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $38, $01, $1D, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$43, $01, $00 
                    db       $03, $01, $3D, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, -$22, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1F, $01, $00, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $00, $01, $22 
                    db       $1F, $01, $00 
                    db       $00, $01, -$22 
                    db       -$3E, $01, $22, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, -$22, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
FallingCash_1 
                    db       $3A, $01, $4A, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $2E, $01, -$76, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$4C, $01, -$1E, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$2E, $01, $76 
                    db       $4C, $01, $1E 
                    db       -$20, $01, -$5B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $0E, $01, -$24, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $29, $01, $2F, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$3F, $01, -$18 
                    db       -$13, $01, $3A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $0B, $01, -$1F, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1E, $01, $0B, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$0C, $01, $1F 
                    db       $1D, $01, $0C 
                    db       $0C, $01, -$1F 
                    db       -$46, $01, $08, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $0B, $01, -$1F, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
FallingCash_2 
                    db       $1F, $01, $4B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $54, $01, -$5E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$3C, $01, -$38, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$54, $01, $5E 
                    db       $3C, $01, $38 
                    db       $02, $01, -$62, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $19, $01, -$1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $16, $01, $3A, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$31, $01, -$2C 
                    db       -$28, $01, $2F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $17, $01, -$19, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $17, $01, $15, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$16, $01, $18 
                    db       $17, $01, $16 
                    db       $16, $01, -$18 
                    db       -$45, $01, -$12, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $17, $01, -$19, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
FallingCash_3 
                    db       $05, $01, $41, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $71, $01, -$3A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$25, $01, -$48, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$71, $01, $3A 
                    db       $25, $01, $48 
                    db       $25, $01, -$5A, hi(SMVB_startMove_yStays_single), lo(SMVB_startMove_yStays_single) ; y is $25 
                    db       $22, $01, -$11, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$02, $01, $3F, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$1E, $01, -$3C 
                    db       -$35, $01, $1D, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $1F, $01, -$0E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0E, $01, $1B, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$1F, $01, $10 
                    db       $0F, $01, $1C 
                    db       $1D, $01, -$10 
                    db       -$3A, $01, -$29, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $1F, $01, -$0E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
FallingCash_4 
                    db       -$11, $01, $2E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $7F, $01, -$0C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$07, $01, -$50, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$7F, $01, $0C 
                    db       $07, $01, $50 
                    db       $43, $01, -$46, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $27, $01, -$02, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$19, $01, $39, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$06, $01, -$42 
                    db       -$3B, $01, $07, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $21, $01, -$02, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $03, $01, $1F, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$22, $01, $02 
                    db       $03, $01, $20 
                    db       $21, $01, -$02 
                    db       -$26, $01, -$3D, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $21, $01, -$02, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
FallingCash_5 
                    db       -$1D, $01, $15, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $79, $01, $23, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $17, $01, -$4D, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$79, $01, -$23 
                    db       -$17, $01, $4D 
                    db       $58, $01, -$28, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $24, $01, $0B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$2C, $01, $2D, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $14, $01, -$41 
                    db       -$3B, $01, -$0E, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $1F, $01, $09, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$08, $01, $1F, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$20, $01, -$09 
                    db       -$09, $01, $1E 
                    db       $20, $01, $09 
                    db       -$0E, $01, -$46, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $1F, $01, $09, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
FallingCash_6 
                    db       -$20, $01, -$06, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $65, $01, $4D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $31, $01, -$41, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$65, $01, -$4D 
                    db       -$31, $01, $41 
                    db       $60, $01, -$06, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $1F, $01, $17, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$39, $01, $1B, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $28, $01, -$36 
                    db       -$31, $01, -$23, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $19, $01, $15, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$12, $01, $19, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$1A, $01, -$14 
                    db       -$13, $01, $19 
                    db       $1A, $01, $14 
                    db       $0C, $01, -$47, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $19, $01, $15, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
FallingCash_7 
                    db       -$1A, $01, -$21, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $44, $01, $6C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $46, $01, -$2A, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$44, $01, -$6C 
                    db       -$46, $01, $2A 
                    db       $5E, $01, $1E, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $13, $01, $20, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$3D, $01, $04, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $38, $01, -$22 
                    db       -$22, $01, -$33, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y is -$22 
                    db       $12, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1C, $01, $11, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$10, $01, -$1C 
                    db       -$1C, $01, $10 
                    db       $12, $01, $1B 
                    db       $24, $01, -$3C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $12, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
FallingCash_8 
                    db       -$09, $01, -$37, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $18, $01, $7D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $50, $01, -$0F, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$18, $01, -$7D 
                    db       -$50, $01, $0F 
                    db       $4C, $01, $3D, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $07, $01, $25, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$3C, $01, -$12, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $42, $01, -$0D 
                    db       -$0D, $01, -$3B, hi(SMVB_startMove_newY_eq_oldX_single), lo(SMVB_startMove_newY_eq_oldX_single) ; y is -$0D 
                    db       $05, $01, $21, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1E, $01, $06, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$06, $01, -$20 
                    db       -$20, $01, $05 
                    db       $06, $01, $21 
                    db       $39, $01, -$2D, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $05, $01, $21, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
FallingCash_9 
                    db       $0F, $01, -$46, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$18, $01, $7D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $50, $01, $0F, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $18, $01, -$7D 
                    db       -$50, $01, -$0F 
                    db       $30, $01, $54, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$06, $01, $26, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$31, $01, -$28, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $41, $01, $0D 
                    db       $09, $01, -$3C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$06, $01, $21, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$20, $01, -$06, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $06, $01, -$20 
                    db       -$1F, $01, -$07 
                    db       -$05, $01, $21 
                    db       $44, $01, -$15, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$06, $01, $21, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
FallingCash_10 
                    db       $2A, $01, -$4B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$44, $01, $6C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $46, $01, $2A, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $44, $01, -$6C 
                    db       -$46, $01, -$2A 
                    db       $0F, $01, $5F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$14, $01, $21, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$20, $01, -$36, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $39, $01, $23 
                    db       $1E, $01, -$35, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$12, $01, $1B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1A, $01, -$0F, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $10, $01, -$1C 
                    db       -$1A, $01, -$11 
                    db       -$12, $01, $1C 
                    db       $48, $01, $05, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$12, $01, $1B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
FallingCash_11 
                    db       $45, $01, -$47, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$65, $01, $4D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $31, $01, $41, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $65, $01, -$4D 
                    db       -$31, $01, -$41 
                    db       -$15, $01, $5F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$1D, $01, $17, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0B, $01, -$3E, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $28, $01, $36 
                    db       $2F, $01, -$27, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$1A, $01, $14, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$13, $01, -$19, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $1A, $01, -$14 
                    db       -$13, $01, -$1A 
                    db       -$19, $01, $15 
                    db       $3F, $01, $1E, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$1A, $01, $14, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
FallingCash_12 
                    db       $5C, $01, -$38, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$79, $01, $23, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $17, $01, $4D, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $79, $01, -$23 
                    db       -$17, $01, -$4D 
                    db       -$34, $01, $51, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$25, $01, $0A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0C, $01, -$3D, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $14, $01, $40 
                    db       $39, $01, -$13, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$20, $01, $09, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$09, $01, -$1E, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $20, $01, -$09 
                    db       -$09, $01, -$1F 
                    db       -$1F, $01, $09 
                    db       $31, $01, $34, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$20, $01, $09, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
FallingCash_13 
                    db       $6E, $01, -$22, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$7F, $01, -$0C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$07, $01, $50, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $7F, $01, $0C 
                    db       $07, $01, -$50 
                    db       -$4F, $01, $37, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$25, $01, -$04, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $21, $01, -$33, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$05, $01, $43 
                    db       $3C, $01, $02, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$21, $01, -$02, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $02, $01, -$20, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $22, $01, $02 
                    db       $02, $01, -$1F 
                    db       -$21, $01, -$02 
                    db       $1C, $01, $41, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$21, $01, -$02, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
FallingCash_14 
                    db       $76, $01, -$07, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$71, $01, -$3A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$25, $01, $48, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $71, $01, $3A 
                    db       $25, $01, -$48 
                    db       -$5E, $01, $17, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$22, $01, -$11, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $33, $01, -$25, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$1D, $01, $3B 
                    db       $36, $01, $1A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$1D, $01, -$10, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0D, $01, -$1C, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $1F, $01, $10 
                    db       $0E, $01, -$1D 
                    db       -$1F, $01, -$0E 
                    db       $02, $01, $47, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$1D, $01, -$10, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
FallingCash_15 
                    db       $73, $01, $13, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$54, $01, -$5E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$3C, $01, $38, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $54, $01, $5E 
                    db       $3C, $01, -$38 
                    db       -$60, $01, -$0C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$19, $01, -$1B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $3C, $01, -$11, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$31, $01, $2D 
                    db       $2B, $01, $2C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$16, $01, -$18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $17, $01, -$16, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $16, $01, $18 
                    db       $18, $01, -$14 
                    db       -$17, $01, -$19 
                    db       -$18, $01, $43, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$16, $01, -$18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
FallingCash_16 
                    db       $68, $01, $2C, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$2E, $01, -$76, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$4C, $01, $1E, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $2E, $01, $76 
                    db       $4C, $01, -$1E 
                    db       -$56, $01, -$2D, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$0E, $01, -$24, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $3F, $01, $08, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$3F, $01, $18 
                    db       $19, $01, $38, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$0C, $01, -$1F, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1D, $01, -$0C, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $0C, $01, $1F 
                    db       $1D, $01, -$0B 
                    db       -$0B, $01, -$1F 
                    db       -$2F, $01, $36, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$0C, $01, -$1F, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
