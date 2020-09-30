enemySW2Definition_1 
                    dw       EnemySW2Angle8Table 
                    db       5 
                    dw       EnemySW2WaitAnim 
                    db       1,0                          ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemySW2Definition_1_hp 
                    dw       EnemySW2Angle8Table 
                    db       20 
                    dw       EnemySW2WaitAnim 
                    db       1,0                          ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemySW2Definition_2 
                    dw       EnemySW2Angle8Table 
                    db       5 
                    dw       EnemySW2WaitAnim 
                    db       2,0                          ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemySW2Definition_2_debris 
                    dw       EnemySW2Angle8Table 
                    db       3 
                    dw       EnemySW2WaitAnim 
                    db       2,0+TYPE_DEBRIS_BOMBER       ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemySW2Definition_2_debris_wait 
                    dw       EnemySW2Angle8Table 
                    db       3 
                    dw       EnemySW2WaitAnim 
                    db       2,0+TYPE_DEBRIS_BOMBER+TYPE_DONT_WAIT ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemySW2Definition_3 
                    dw       EnemySW2Angle8Table 
                    db       5 
                    dw       EnemySW2WaitAnim 
                    db       3,0                          ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemySW2Definition_3_debris 
                    dw       EnemySW2Angle8Table 
                    db       3 
                    dw       EnemySW2WaitAnim 
                    db       3,0+TYPE_DEBRIS_BOMBER       ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemySW2Definition_3_debris_wait 
                    dw       EnemySW2Angle8Table 
                    db       3 
                    dw       EnemySW2WaitAnim 
                    db       3,0+TYPE_DEBRIS_BOMBER+TYPE_DONT_WAIT ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemySW2Definition_1_wait 
                    dw       EnemySW2Angle8Table 
                    db       5 
                    dw       EnemySW2WaitAnim 
                    db       1,TYPE_DONT_WAIT             ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemySW2Definition_2_wait 
                    dw       EnemySW2Angle8Table 
                    db       5 
                    dw       EnemySW2WaitAnim 
                    db       2,TYPE_DONT_WAIT             ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemySW2Definition_3_wait 
                    dw       EnemySW2Angle8Table 
                    db       5 
                    dw       EnemySW2WaitAnim 
                    db       3,TYPE_DONT_WAIT             ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
EnemySW2WaitAnim 
                    DW       ImperialFighterSW_8          ; list of all single vectorlists in this 
                    DW       ImperialFighterSW_0 
                    DW       ImperialFighterSW_9 
                    DW       ImperialFighterSW_0 
                    DW       0 
EnemySW2Angle8Table 
                    DW       ImperialFighterSW_0          ; list of all single vectorlists in this 
                    DW       ImperialFighterSW_1 
                    DW       ImperialFighterSW_2 
                    DW       ImperialFighterSW_3 
                    DW       ImperialFighterSW_4 
                    DW       ImperialFighterSW_5 
                    DW       ImperialFighterSW_6 
                    DW       ImperialFighterSW_7 
                    DW       0 
ImperialFighterSW_0 
                    db       $22, $01, -$15, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, $2A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $51, $01, $21, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$72, $01, $2C, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       $7B, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$72, $01, -$2C, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       $22, $01, -$21, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $00, $01, -$2A 
                    db       -$22, $01, -$21 
                    db       $72, $01, -$2C 
                    db       -$7B, $01, $00, hi(SMVB_continue_yd6_double), lo(SMVB_continue_yd6_double) 
                    db       $72, $01, $2C, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$51, $01, $21, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
ImperialFighterSW_1 
                    db       $20, $01, -$13, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $05, $01, $2A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $53, $01, $1A, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$6C, $01, $36, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       $79, $01, -$0C, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $7B, $01, -$0E 
                    db       -$77, $01, -$1F, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       $1F, $01, -$24, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$05, $01, -$2B 
                    db       -$25, $01, -$1D 
                    db       $6D, $01, -$37 
                    db       -$7A, $01, $0E, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       -$7A, $01, $0C, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $76, $01, $1F 
                    db       -$4D, $01, $29, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
ImperialFighterSW_2 
                    db       $1F, $01, -$09, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $08, $01, $2A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $56, $01, $10, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$66, $01, $42, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       $78, $01, -$1B, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $78, $01, -$19 
                    db       -$78, $01, -$13, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       $1A, $01, -$27, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$09, $01, -$29 
                    db       -$27, $01, -$19 
                    db       $66, $01, -$42 
                    db       -$78, $01, $19, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       -$79, $01, $19, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $79, $01, $13 
                    db       -$48, $01, $31, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
ImperialFighterSW_3 
                    db       $1E, $01, $01, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $0E, $01, $29, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $55, $01, $05, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$5D, $01, $4D, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       $74, $01, -$26, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $74, $01, -$25 
                    db       -$79, $01, -$07, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       $16, $01, -$29, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$0E, $01, -$2A 
                    db       -$29, $01, -$14 
                    db       $5E, $01, -$4C 
                    db       -$73, $01, $26, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       -$76, $01, $26, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $7A, $01, $06 
                    db       -$43, $01, $38, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
ImperialFighterSW_4 
                    db       $22, $01, -$15, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, $2A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $51, $01, $21, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$72, $01, $2C, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       $7B, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$72, $01, -$2C, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       $22, $01, -$21, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $00, $01, -$2A 
                    db       -$22, $01, -$21 
                    db       $72, $01, -$2C 
                    db       -$7B, $01, $00, hi(SMVB_continue_yd6_double), lo(SMVB_continue_yd6_double) 
                    db       $72, $01, $2C, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$51, $01, $21, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
ImperialFighterSW_5 
                    db       $25, $01, -$1E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$05, $01, $2A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $4E, $01, $29, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$76, $01, $1F, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       $7A, $01, $0E, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $79, $01, $0C 
                    db       -$6C, $01, -$37, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       $26, $01, -$1D, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $04, $01, -$2B 
                    db       -$1F, $01, -$24 
                    db       $76, $01, -$1F 
                    db       -$7A, $01, -$0E, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       -$79, $01, -$0C, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $6C, $01, $37 
                    db       -$54, $01, $19, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
ImperialFighterSW_6 
                    db       $29, $01, -$27, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$09, $01, $29, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $48, $01, $31, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$79, $01, $13, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       $79, $01, $19, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $78, $01, $1A 
                    db       -$66, $01, -$42, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       $27, $01, -$1A, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $09, $01, -$29 
                    db       -$1A, $01, -$27 
                    db       $79, $01, -$13 
                    db       -$79, $01, -$19, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       -$78, $01, -$1A, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $66, $01, $42 
                    db       -$55, $01, $10, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
ImperialFighterSW_7 
                    db       $2E, $01, -$2F, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$0E, $01, $29, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $43, $01, $37, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$7A, $01, $05, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       $75, $01, $27, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $74, $01, $26 
                    db       -$5D, $01, -$4D, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       $29, $01, -$14, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $0D, $01, -$28 
                    db       -$16, $01, -$2B 
                    db       $7A, $01, -$05 
                    db       -$75, $01, -$27, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       -$74, $01, -$26, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $5D, $01, $4D 
                    db       -$55, $01, $07, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
ImperialFighterSW_8 
                    db       $22, $01, -$1C, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, $2A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $51, $01, $21, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$72, $01, $2C, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       $7B, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$72, $01, -$2C, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       $22, $01, -$21, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $00, $01, -$2A 
                    db       -$22, $01, -$21 
                    db       $72, $01, -$2B 
                    db       -$7B, $01, $00, hi(SMVB_continue_yd6_double), lo(SMVB_continue_yd6_double) 
                    db       $72, $01, $2B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$51, $01, $21, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
ImperialFighterSW_9 
                    db       $22, $01, -$0E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, $2A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $51, $01, $21, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$72, $01, $2B, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       $7B, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$72, $01, -$2B, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       $22, $01, -$21, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $00, $01, -$2A 
                    db       -$22, $01, -$21 
                    db       $72, $01, -$2C 
                    db       -$7B, $01, $00, hi(SMVB_continue_yd6_double), lo(SMVB_continue_yd6_double) 
                    db       $72, $01, $2C, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$51, $01, $21, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
