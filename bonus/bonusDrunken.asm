BonusDrunken 
                    dw       BonusDrunken_Anim 
                    db       BONUS_DRUNKEN                ; type 
BonusDrunken_Anim 
                    DW       BonusDrunken_0               ; list of all single vectorlists in this 
                    DW       BonusDrunken_1 
                    DW       BonusDrunken_2 
                    DW       BonusDrunken_3 
                    DW       BonusDrunken_4 
                    DW       BonusDrunken_5 
                    DW       BonusDrunken_6 
                    DW       BonusDrunken_7 
                    DW       BonusDrunken_8 
                    DW       BonusDrunken_9 
                    DW       BonusDrunken_10 
                    DW       BonusDrunken_11 
                    DW       BonusDrunken_12 
                    DW       BonusDrunken_13 
                    DW       0 
BonusDrunken_0 
                    db       -$2B, $01, -$36, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1E, $01, $19, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$06, $01, $12, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$1E, $01, $16, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $06, $01, $12, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $1E, $01, $19, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1E, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $1E, $01, -$19, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$06, $01, -$12, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$1E, $01, -$16, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $05, $01, -$12, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $1F, $01, -$19, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $36, $01, $05, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$34, $01, -$13, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$3E, $01, $00, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$0C, $01, $44 
                    db       $0C, $01, $44 
                    db       $3E, $01, $00 
                    db       $34, $01, -$14 
                    db       $0D, $01, -$1F 
                    db       $26, $01, -$06 
                    db       $00, $01, -$15, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$26, $01, -$07 
                    db       -$0D, $01, -$20 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
BonusDrunken_1 
                    db       $25, $01, -$34, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $10, $01, $1E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $26, $01, $03, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $02, $01, $16 
                    db       -$26, $01, $09 
                    db       -$0A, $01, $20 
                    db       -$31, $01, $18 
                    db       -$3E, $01, $06 
                    db       -$12, $01, -$43 
                    db       $06, $01, -$44, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $3D, $01, -$05 
                    db       $36, $01, $0E 
                    db       -$37, $01, -$0B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$21, $01, $16, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$01, $01, $16, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $21, $01, $13, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $04, $01, $15, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$1D, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1E, $01, -$03, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$1F, $01, -$16, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$05, $01, -$17, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $1C, $01, -$17, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $03, $01, -$15, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$1D, $01, -$11, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
BonusDrunken_2 
                    db       $20, $01, -$37, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $12, $01, $1D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $27, $01, $00, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $04, $01, $16 
                    db       -$25, $01, $0B 
                    db       -$07, $01, $20 
                    db       -$31, $01, $1D 
                    db       -$3B, $01, $0B 
                    db       -$19, $01, -$41 
                    db       $01, $01, -$44, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $3C, $01, -$0A 
                    db       $37, $01, $09 
                    db       -$37, $01, -$01, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$0D, $01, -$08, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$02, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$10, $01, $0D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $0B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $23, $01, $11, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $13, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$19, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1E, $01, -$06, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$23, $01, -$12, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$11, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $1A, $01, -$1D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
BonusDrunken_3 
                    db       -$38, $01, -$31, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1F, $01, $0D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$01, $01, $11, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$17, $01, $1D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1E, $01, -$08, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$24, $01, -$0D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$01, $01, -$12, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $1B, $01, -$1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $38, $01, -$01, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$37, $01, -$05, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$3C, $01, $11, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $06, $01, $43 
                    db       $1D, $01, $3F 
                    db       $3B, $01, -$10 
                    db       $2F, $01, -$21 
                    db       $04, $01, -$21 
                    db       $23, $01, -$0F 
                    db       -$06, $01, -$15, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$26, $01, $03 
                    db       -$15, $01, -$1B 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
BonusDrunken_4 
                    db       -$34, $01, -$08, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $15, $01, -$21, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $07, $01, $16, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$24, $01, -$0B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$03, $01, -$0B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $0E, $01, -$0F, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $02, $01, -$01, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $0F, $01, $06, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $36, $01, -$09, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$38, $01, $01, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$39, $01, $15, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $0C, $01, $43 
                    db       $23, $01, $3C 
                    db       $38, $01, -$17 
                    db       $2B, $01, -$24 
                    db       $02, $01, -$1F 
                    db       $21, $01, -$13 
                    db       -$07, $01, -$15, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$27, $01, $07 
                    db       -$16, $01, -$1A 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
BonusDrunken_5 
                    db       -$1A, $01, -$24, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$1F, $01, -$0D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $01, $01, $14, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $1B, $01, -$1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $38, $01, -$01, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$37, $01, -$05, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$3C, $01, $11, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $06, $01, $43 
                    db       $1D, $01, $3F 
                    db       $3B, $01, -$10 
                    db       $2F, $01, -$21 
                    db       $04, $01, -$21 
                    db       $23, $01, -$0F 
                    db       -$06, $01, -$15, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$26, $01, $03 
                    db       -$15, $01, -$1B 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
BonusDrunken_6 
                    db       -$36, $01, -$33, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $10, $01, -$0D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $02, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $0D, $01, $08, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $38, $01, $01, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$38, $01, -$09, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$3C, $01, $0A, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$01, $01, $44 
                    db       $19, $01, $41 
                    db       $3B, $01, -$0B 
                    db       $31, $01, -$1D 
                    db       $07, $01, -$20 
                    db       $25, $01, -$0B 
                    db       -$04, $01, -$16, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$27, $01, $00 
                    db       -$11, $01, -$1D 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
BonusDrunken_7 
                    db       $2A, $01, -$31, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$35, $01, -$13, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$3E, $01, $00, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$0C, $01, $44 
                    db       $0C, $01, $44 
                    db       $3E, $01, $00 
                    db       $34, $01, -$14 
                    db       $0D, $01, -$1F 
                    db       $26, $01, -$07 
                    db       $00, $01, -$15, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$26, $01, -$06 
                    db       -$0C, $01, -$20 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
BonusDrunken_8 
                    db       -$31, $01, $37, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $10, $01, $0C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $02, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $0D, $01, -$09, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $38, $01, -$06, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$37, $01, $0E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$3D, $01, -$05, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$06, $01, -$44 
                    db       $12, $01, -$43 
                    db       $3E, $01, $06 
                    db       $31, $01, $18 
                    db       $0A, $01, $20 
                    db       $26, $01, $09 
                    db       -$02, $01, $16, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$26, $01, $03 
                    db       -$0F, $01, $1E 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
BonusDrunken_9 
                    db       -$1A, $01, $24, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$1F, $01, $0D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $01, $01, -$14, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $1B, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $39, $01, $01, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$38, $01, $05, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$3C, $01, -$11, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $06, $01, -$43 
                    db       $1D, $01, -$3F 
                    db       $3B, $01, $10 
                    db       $2F, $01, $21 
                    db       $04, $01, $21 
                    db       $23, $01, $0F 
                    db       -$06, $01, $15, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$26, $01, -$03 
                    db       -$14, $01, $1B 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
BonusDrunken_10 
                    db       -$34, $01, $08, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $15, $01, $21, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $07, $01, -$16, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$24, $01, $0B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$03, $01, $0B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $0E, $01, $0F, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $02, $01, $01, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $0F, $01, -$06, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $36, $01, $09, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$38, $01, -$01, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$39, $01, -$15, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $0C, $01, -$43 
                    db       $23, $01, -$3C 
                    db       $38, $01, $17 
                    db       $2B, $01, $24 
                    db       $02, $01, $1F 
                    db       $21, $01, $13 
                    db       -$07, $01, $15, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$27, $01, -$07 
                    db       -$16, $01, $1A 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
BonusDrunken_11 
                    db       -$39, $01, $31, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1F, $01, -$0D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$11, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$17, $01, -$1D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1E, $01, $08, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$24, $01, $0D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$01, $01, $12, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $1B, $01, $1D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $38, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$37, $01, $05, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$3C, $01, -$11, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $06, $01, -$43 
                    db       $1D, $01, -$3F 
                    db       $3B, $01, $10 
                    db       $2F, $01, $21 
                    db       $04, $01, $21 
                    db       $23, $01, $0F 
                    db       -$06, $01, $15, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$26, $01, -$03 
                    db       -$15, $01, $1B 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
BonusDrunken_12 
                    db       $20, $01, $37, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $12, $01, -$1D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $27, $01, $00, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $04, $01, -$16 
                    db       -$25, $01, -$0B 
                    db       -$07, $01, -$20 
                    db       -$31, $01, -$1D 
                    db       -$3B, $01, -$0B 
                    db       -$19, $01, $41 
                    db       $01, $01, $44, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $3C, $01, $0A 
                    db       $37, $01, -$09 
                    db       -$37, $01, $01, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$0E, $01, $08, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$01, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$10, $01, -$0D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$0B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $20, $01, -$13, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $01, $01, -$12, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$19, $01, -$1D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1E, $01, $06, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$23, $01, $13, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$01, $01, $0F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $1C, $01, $1F, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
BonusDrunken_13 
                    db       -$0E, $01, -$2E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$20, $01, $16, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $02, $01, -$19, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $1D, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$04, $01, $15, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$22, $01, $13, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $02, $01, -$14, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $1D, $01, $18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $03, $01, $14, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$1D, $01, $11, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$03, $01, -$13, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $21, $01, $16, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $37, $01, -$0B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$36, $01, $0E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$3D, $01, -$05, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$06, $01, -$44 
                    db       $12, $01, -$43 
                    db       $3E, $01, $06 
                    db       $31, $01, $18 
                    db       $0A, $01, $20 
                    db       $26, $01, $09 
                    db       -$02, $01, $16, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$26, $01, $03 
                    db       -$10, $01, $1E 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
