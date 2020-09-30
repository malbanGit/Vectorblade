enemySW1Definition1 
enemySW1Definition_1 
                    dw       EnemySW1Angle8Table 
                    db       3 
                    dw       EnemySW1WaitAnim 
                    db       1,0                          ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemySW1Definition_1_hp 
                    dw       EnemySW1Angle8Table 
                    db       20 
                    dw       EnemySW1WaitAnim 
                    db       1,0                          ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemySW1Definition_2 
                    dw       EnemySW1Angle8Table 
                    db       3 
                    dw       EnemySW1WaitAnim 
                    db       2,0                          ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemySW1Definition_2_debris 
                    dw       EnemySW1Angle8Table 
                    db       3 
                    dw       EnemySW1WaitAnim 
                    db       2,0+TYPE_DEBRIS_BOMBER       ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemySW1Definition_2_debris_wait 
                    dw       EnemySW1Angle8Table 
                    db       3 
                    dw       EnemySW1WaitAnim 
                    db       2,0+TYPE_DEBRIS_BOMBER+TYPE_DONT_WAIT ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemySW1Definition_3 
                    dw       EnemySW1Angle8Table 
                    db       3 
                    dw       EnemySW1WaitAnim 
                    db       3,0                          ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemySW1Definition_3_debris 
                    dw       EnemySW1Angle8Table 
                    db       3 
                    dw       EnemySW1WaitAnim 
                    db       3,0+TYPE_DEBRIS_BOMBER       ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemySW1Definition_3_debris_wait 
                    dw       EnemySW1Angle8Table 
                    db       3 
                    dw       EnemySW1WaitAnim 
                    db       3,0+TYPE_DEBRIS_BOMBER+TYPE_DONT_WAIT ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemySW1Definition_1_wait 
                    dw       EnemySW1Angle8Table 
                    db       3 
                    dw       EnemySW1WaitAnim 
                    db       1,TYPE_DONT_WAIT             ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemySW1Definition_2_wait 
                    dw       EnemySW1Angle8Table 
                    db       3 
                    dw       EnemySW1WaitAnim 
                    db       2,TYPE_DONT_WAIT             ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemySW1Definition_3_wait 
                    dw       EnemySW1Angle8Table 
                    db       3 
                    dw       EnemySW1WaitAnim 
                    db       3,TYPE_DONT_WAIT             ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
EnemySW1WaitAnim 
                    DW       TieFighterSW_0               ; list of all single vectorlists in this 
                    DW       TieFighterSW_8 
                    DW       TieFighterSW_0 
                    DW       TieFighterSW_9 
                    DW       0 
EnemySW1Angle8Table 
                    DW       TieFighterSW_0               ; list of all single vectorlists in this 
                    DW       TieFighterSW_1 
                    DW       TieFighterSW_2 
                    DW       TieFighterSW_3 
                    DW       TieFighterSW_4 
                    DW       TieFighterSW_5 
                    DW       TieFighterSW_6 
                    DW       TieFighterSW_7 
                    DW       0 
TieFighterSW_0 
                    db       $6A, $01, -$19, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$2C, $01, $0D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $18, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $2C, $01, $0D 
                    db       -$0D, $01, $10, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$23, $01, $6E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $08, $01, $02, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $37, $01, -$7A 
                    db       $16, $01, -$10 
                    db       $6D, $01, -$09 
                    db       $00, $01, -$0C 
                    db       -$6D, $01, -$09, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       -$16, $01, -$10, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$37, $01, -$7A 
                    db       -$08, $01, $02 
                    db       $23, $01, $6E 
                    db       -$40, $01, $21 
                    db       $00, $01, $10 
                    db       $40, $01, $21 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
TieFighterSW_1 
                    db       $67, $01, -$17, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$2A, $01, $11, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $02, $01, $18, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $2D, $01, $08 
                    db       -$0A, $01, $12, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$18, $01, $70, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $08, $01, $02, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $2B, $01, -$7F 
                    db       $13, $01, -$13 
                    db       $6C, $01, -$13 
                    db       -$01, $01, -$0D 
                    db       -$6E, $01, $03, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       -$17, $01, -$0E, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$45, $01, -$74 
                    db       -$06, $01, $04 
                    db       $2F, $01, $68 
                    db       -$3D, $01, $27 
                    db       $01, $01, $11 
                    db       $44, $01, $1B 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
TieFighterSW_2 
                    db       $65, $01, -$15, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$28, $01, $15, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $05, $01, $17, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $2D, $01, $04 
                    db       -$09, $01, $12, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$0B, $01, $72, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $07, $01, $02, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $0F, $01, -$41, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $11, $01, -$14, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $6A, $01, -$1F 
                    db       -$03, $01, -$0C 
                    db       -$6D, $01, $0D, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       -$17, $01, -$0B, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$51, $01, -$6C 
                    db       -$07, $01, $05 
                    db       $3A, $01, $63 
                    db       -$39, $01, $2D 
                    db       $04, $01, $11 
                    db       $45, $01, $12 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
TieFighterSW_3 
                    db       $62, $01, -$14, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$25, $01, $19, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $07, $01, $17, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $2F, $01, -$01 
                    db       -$08, $01, $14, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, $73, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $09, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $07, $01, -$43, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $0F, $01, -$16, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $65, $01, -$29 
                    db       -$04, $01, -$0C 
                    db       -$6B, $01, $19, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       -$18, $01, -$09, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$5C, $01, -$62 
                    db       -$06, $01, $05 
                    db       $44, $01, $5D 
                    db       -$34, $01, $31 
                    db       $07, $01, $12 
                    db       $46, $01, $0B 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
TieFighterSW_4 
                    db       $6A, $01, -$19, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$2C, $01, $0D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $18, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $2C, $01, $0D 
                    db       -$0D, $01, $10, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$23, $01, $6E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $08, $01, $02, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $37, $01, -$7A 
                    db       $16, $01, -$10 
                    db       $6D, $01, -$09 
                    db       $00, $01, -$0C 
                    db       -$6D, $01, -$09, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       -$16, $01, -$10, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$37, $01, -$7A 
                    db       -$08, $01, $02 
                    db       $23, $01, $6E 
                    db       -$40, $01, $21 
                    db       $00, $01, $10 
                    db       $40, $01, $21 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
TieFighterSW_5 
                    db       $6C, $01, -$1A, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$2D, $01, $08, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$02, $01, $18, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $2A, $01, $11 
                    db       -$0D, $01, $10, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$2F, $01, $68, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $06, $01, $04, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $45, $01, -$74 
                    db       $17, $01, -$0E 
                    db       $6E, $01, $03 
                    db       $01, $01, -$0D 
                    db       -$6C, $01, -$13, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       -$13, $01, -$13, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$2B, $01, -$7F 
                    db       -$08, $01, $02 
                    db       $18, $01, $70 
                    db       -$44, $01, $1B 
                    db       -$01, $01, $11 
                    db       $3D, $01, $27 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
TieFighterSW_6 
                    db       $6F, $01, -$1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$2D, $01, $04, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$05, $01, $17, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $28, $01, $15 
                    db       -$0F, $01, $0E, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$3A, $01, $63, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $07, $01, $05, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $51, $01, -$6C 
                    db       $17, $01, -$0B 
                    db       $6D, $01, $0D 
                    db       $03, $01, -$0C 
                    db       -$6A, $01, -$1F, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       -$11, $01, -$14, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$0F, $01, -$41, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$07, $01, $02, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $0B, $01, $72 
                    db       -$45, $01, $12 
                    db       -$04, $01, $11 
                    db       $39, $01, $2D 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
TieFighterSW_7 
                    db       $73, $01, -$1B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$2F, $01, -$01, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$07, $01, $17, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $25, $01, $19 
                    db       -$10, $01, $0B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$44, $01, $5D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $06, $01, $05, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $5C, $01, -$62 
                    db       $18, $01, -$09 
                    db       $6B, $01, $19 
                    db       $04, $01, -$0C 
                    db       -$65, $01, -$29, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       -$0F, $01, -$16, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$07, $01, -$43, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$09, $01, $00, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $00, $01, $73 
                    db       -$46, $01, $0B 
                    db       -$07, $01, $12 
                    db       $34, $01, $31 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
TieFighterSW_8 
                    db       $6A, $01, -$19, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$2C, $01, $0D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $18, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $2C, $01, $0D 
                    db       -$0D, $01, $10, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$1B, $01, $6E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $07, $01, $02, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $30, $01, -$7A 
                    db       $16, $01, -$10 
                    db       $6D, $01, -$09 
                    db       $00, $01, -$0C 
                    db       -$6D, $01, -$09, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       -$16, $01, -$10, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$30, $01, -$7A 
                    db       -$07, $01, $02 
                    db       $1B, $01, $6E 
                    db       -$40, $01, $21 
                    db       $00, $01, $10 
                    db       $40, $01, $21 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
TieFighterSW_9 
                    db       $6A, $01, -$19, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$2C, $01, $0D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $18, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $2C, $01, $0D 
                    db       -$0D, $01, $10, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$2A, $01, $6E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $07, $01, $02, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $3F, $01, -$7A 
                    db       $16, $01, -$10 
                    db       $6D, $01, -$09 
                    db       $00, $01, -$0C 
                    db       -$6D, $01, -$09, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       -$16, $01, -$10, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$3F, $01, -$7A 
                    db       -$07, $01, $02 
                    db       $2A, $01, $6E 
                    db       -$40, $01, $21 
                    db       $00, $01, $10 
                    db       $40, $01, $21 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
