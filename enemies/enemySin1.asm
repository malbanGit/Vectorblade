enemySin1Definition 
                    dw       EnemySin1Angle8Table 
                    db       3 
                    dw       EnemySin1WaitAnim 
                    db       2,0                          ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemySin1Definition_noID 
                    dw       EnemySin1Angle8Table 
                    db       3 
                    dw       EnemySin1WaitAnim 
                    db       2,TYPE_DONT_WAIT             ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemySin1Definition_noShot 
                    dw       EnemySin1Angle8Table 
                    db       3 
                    dw       EnemySin1WaitAnim 
                    db       2,TYPE_DONT_SHOOT            ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemySin1Definition_bonus 
                    dw       EnemySin1Angle8Table 
                    db       2 
                    dw       EnemySin1WaitAnim 
                    db       3,0                          ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemySin1Definition_debris 
                    dw       EnemySin1Angle8Table 
                    db       3 
                    dw       EnemySin1WaitAnim 
                    db       3,0+TYPE_DEBRIS_BOMBER       ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemySin1Definition_glas_debris_wait 
                    dw       EnemySin1Angle8Table 
                    db       1 
                    dw       EnemySin1WaitAnim 
                    db       1,0+TYPE_DEBRIS_BOMBER+TYPE_DONT_WAIT ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
EnemySin1WaitAnim 
                    DW       EnemySin_0                   ; list of all single vectorlists in this 
                    DW       EnemySin_8 
                    DW       EnemySin_0 
                    DW       EnemySin_9 
                    DW       0 
EnemySin1Angle8Table 
                    DW       EnemySin_0                   ; list of all single vectorlists in this 
                    DW       EnemySin_1 
                    DW       EnemySin_2 
                    DW       EnemySin_3 
                    DW       EnemySin_4 
                    DW       EnemySin_5 
                    DW       EnemySin_6 
                    DW       EnemySin_7 
                    DW       0 
EnemySin_0 
                    db       $2C, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $1E, $01, -$30, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$38, $01, $0D, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$12, $01, -$3D 
                    db       $7E, $01, -$0D 
                    db       $69, $01, $29 
                    db       -$1B, $01, -$29 
                    db       -$2A, $01, $46 
                    db       $47, $01, $3E 
                    db       $00, $01, -$2E, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$47, $01, $3E 
                    db       $2A, $01, $46 
                    db       $1B, $01, -$29 
                    db       -$69, $01, $29, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       -$7E, $01, -$0E, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       $12, $01, -$3B, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $38, $01, $0D 
                    db       -$1E, $01, -$31 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
EnemySin_1 
                    db       $41, $01, -$33, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $37, $01, -$0D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$31, $01, -$1E, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $1F, $01, -$38 
                    db       $62, $01, $50 
                    db       $2D, $01, $67 
                    db       $0A, $01, -$30 
                    db       -$4F, $01, $14 
                    db       $06, $01, $5E 
                    db       $21, $01, -$21, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$5E, $01, -$06 
                    db       -$14, $01, $4F 
                    db       $30, $01, -$0A 
                    db       -$67, $01, -$2D, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       -$4F, $01, -$63, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $36, $01, -$1D 
                    db       $1F, $01, $31 
                    db       $0D, $01, -$38 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
EnemySin_2 
                    db       $74, $01, -$48, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $30, $01, $1E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0D, $01, -$38, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $3D, $01, -$12 
                    db       $0D, $01, $7E 
                    db       -$29, $01, $69 
                    db       $29, $01, -$1B 
                    db       -$46, $01, -$2A 
                    db       -$3E, $01, $47 
                    db       $2E, $01, $00, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$3E, $01, -$47 
                    db       -$46, $01, $2A 
                    db       $29, $01, $1B 
                    db       -$29, $01, -$69 
                    db       $0E, $01, -$7E 
                    db       $3B, $01, $12 
                    db       -$0D, $01, $38, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $31, $01, -$1E 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
EnemySin_3 
                    db       $53, $01, -$19, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $0D, $01, $37, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1E, $01, -$31, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $38, $01, $1F 
                    db       -$50, $01, $62 
                    db       -$67, $01, $2D, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       $30, $01, $0A, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$14, $01, -$4F 
                    db       -$5E, $01, $06 
                    db       $21, $01, $21 
                    db       $06, $01, -$5E 
                    db       -$4F, $01, -$14 
                    db       $0A, $01, $30 
                    db       $2D, $01, -$67, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $63, $01, -$4F 
                    db       $1D, $01, $36 
                    db       -$31, $01, $1F 
                    db       $38, $01, $0D 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
EnemySin_4 
                    db       $5E, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$1E, $01, $30, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $38, $01, -$0D, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $12, $01, $3D 
                    db       -$7E, $01, $0D, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       -$69, $01, -$29, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       $1B, $01, $29, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $2A, $01, -$46 
                    db       -$47, $01, -$3E 
                    db       $00, $01, $2E 
                    db       $47, $01, -$3E 
                    db       -$2A, $01, -$46 
                    db       -$1B, $01, $29 
                    db       $69, $01, -$29, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $7E, $01, $0E 
                    db       -$12, $01, $3B 
                    db       -$38, $01, -$0D 
                    db       $1E, $01, $31 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
EnemySin_5 
                    db       $53, $01, $19, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$37, $01, $0D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $31, $01, $1E, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$1F, $01, $38 
                    db       -$62, $01, -$50 
                    db       -$2D, $01, -$67 
                    db       -$0A, $01, $30 
                    db       $4F, $01, -$14 
                    db       -$06, $01, -$5E 
                    db       -$21, $01, $21, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $5E, $01, $06 
                    db       $14, $01, -$4F 
                    db       -$30, $01, $0A 
                    db       $67, $01, $2D 
                    db       $4F, $01, $63 
                    db       -$36, $01, $1D 
                    db       -$1F, $01, -$31, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$0D, $01, $38 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
EnemySin_6 
                    db       $74, $01, $48, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$30, $01, -$1E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0D, $01, $38, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$3D, $01, $12 
                    db       -$0D, $01, -$7E 
                    db       $29, $01, -$69 
                    db       -$29, $01, $1B 
                    db       $46, $01, $2A 
                    db       $3E, $01, -$47 
                    db       -$2E, $01, $00, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $3E, $01, $47 
                    db       $46, $01, -$2A 
                    db       -$29, $01, -$1B 
                    db       $29, $01, $69 
                    db       -$0E, $01, $7E 
                    db       -$3B, $01, -$12 
                    db       $0D, $01, -$38, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$31, $01, $1E 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
EnemySin_7 
                    db       $41, $01, $33, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$0D, $01, -$37, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1E, $01, $31, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$38, $01, -$1F 
                    db       $50, $01, -$62 
                    db       $67, $01, -$2D 
                    db       -$30, $01, -$0A 
                    db       $14, $01, $4F 
                    db       $5E, $01, -$06 
                    db       -$21, $01, -$21, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$06, $01, $5E 
                    db       $4F, $01, $14 
                    db       -$0A, $01, -$30 
                    db       -$2D, $01, $67 
                    db       -$63, $01, $4F 
                    db       -$1D, $01, -$36 
                    db       $31, $01, -$1F, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$38, $01, -$0D 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
EnemySin_8 
                    db       $2D, $01, $0D, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $15, $01, -$35, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$35, $01, $17, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$1C, $01, -$39 
                    db       $7A, $01, -$23 
                    db       $6E, $01, $16 
                    db       -$21, $01, -$24 
                    db       -$1D, $01, $4D 
                    db       $50, $01, $30 
                    db       -$08, $01, -$2D, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       -$3B, $01, $49 
                    db       $36, $01, $3E 
                    db       $13, $01, -$2D 
                    db       -$60, $01, $3B 
                    db       -$7F, $01, $08, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       $08, $01, -$3E, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $39, $01, $04 
                    db       -$26, $01, -$2B 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
EnemySin_9 
                    db       $2D, $01, -$0D, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $26, $01, -$2A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$39, $01, $04, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$08, $01, -$40 
                    db       $7F, $01, $09 
                    db       $60, $01, $3B 
                    db       -$13, $01, -$2D 
                    db       -$36, $01, $3E 
                    db       $3B, $01, $49 
                    db       $08, $01, -$2D, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$50, $01, $30 
                    db       $1D, $01, $4D 
                    db       $21, $01, -$24 
                    db       -$6E, $01, $16, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       -$7A, $01, -$24, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       $1C, $01, -$37, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $35, $01, $17 
                    db       -$15, $01, -$36 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
