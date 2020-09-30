enemy4Definition 
                    dw       Enemy4Angle8Table 
                    db       5 
                    dw       Enemy4WaitAnim 
                    db       2,TYPE_CAN_CLONE, 128+20     ; ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemy4Definition2 
                    dw       Enemy4Angle8Table 
                    db       10 
                    dw       Enemy4WaitAnim 
                    db       3,TYPE_CAN_CLONE, 128+64+10  ; ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
Enemy4WaitAnim 
                    DW       Enemy4_0                     ; list of all single vectorlists in this 
                    DW       Enemy4_9 
                    DW       Enemy4_8 
                    DW       Enemy4_9 
                    DW       0 
Enemy4Angle8Table 
                    DW       Enemy4_0                     ; list of all single vectorlists in this 
                    DW       Enemy4_1 
                    DW       Enemy4_2 
                    DW       Enemy4_3 
                    DW       Enemy4_4 
                    DW       Enemy4_5 
                    DW       Enemy4_6 
                    DW       Enemy4_7 
                    DW       0 
Enemy4_0 
                    db       $2F, $01, $0E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$35, $01, $07, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$2A, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $35, $01, $07 
                    db       -$22, $01, -$18 
                    db       -$09, $01, -$47 
                    db       $74, $01, $27 
                    db       $06, $01, $25 
                    db       $1E, $01, $0E 
                    db       $25, $01, -$0A, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$16, $01, $1D 
                    db       $16, $01, $1D 
                    db       -$25, $01, -$0A 
                    db       -$1E, $01, $0E 
                    db       -$06, $01, $25 
                    db       -$74, $01, $27 
                    db       $09, $01, -$47, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $22, $01, -$18 
                    db       $f0, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Enemy4_1 
                    db       $34, $01, -$1D, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$2A, $01, -$20, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $20, $01, -$20, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $20, $01, $2A 
                    db       -$06, $01, -$28 
                    db       $29, $01, -$3A 
                    db       $38, $01, $70 
                    db       -$15, $01, $20 
                    db       $0A, $01, $1C 
                    db       $22, $01, $13, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$26, $01, $05 
                    db       -$05, $01, $26 
                    db       -$13, $01, -$22 
                    db       -$1C, $01, -$0A 
                    db       -$20, $01, $15 
                    db       -$70, $01, -$38 
                    db       $3A, $01, -$29, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $28, $01, $06 
                    db       $f0, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Enemy4_2 
                    db       $59, $01, -$38, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$07, $01, -$35, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $2A, $01, $00, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$07, $01, $35 
                    db       $18, $01, -$22 
                    db       $47, $01, -$09 
                    db       -$27, $01, $74 
                    db       -$25, $01, $06 
                    db       -$0E, $01, $1E 
                    db       $0A, $01, $25, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$1D, $01, -$16 
                    db       -$1D, $01, $16 
                    db       $0A, $01, -$25 
                    db       -$0E, $01, -$1E 
                    db       -$25, $01, -$06 
                    db       -$27, $01, -$74 
                    db       $47, $01, $09, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $18, $01, $22 
                    db       $f0, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Enemy4_3 
                    db       $42, $01, -$19, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $20, $01, -$2A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $20, $01, $20, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$2A, $01, $20 
                    db       $28, $01, -$06 
                    db       $3A, $01, $29 
                    db       -$70, $01, $38 , hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       -$20, $01, -$15 , hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$1C, $01, $0A 
                    db       -$13, $01, $22 
                    db       -$05, $01, -$26 
                    db       -$26, $01, -$05 
                    db       $22, $01, -$13 
                    db       $0A, $01, -$1C 
                    db       -$15, $01, -$20 , hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $38, $01, -$70 
                    db       $29, $01, $3A 
                    db       -$06, $01, $28 
                    db       $f0, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Enemy4_4 
                    db       $4F, $01, -$07, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $35, $01, -$07, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $2A, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$35, $01, -$07 
                    db       $22, $01, $18 
                    db       $09, $01, $47 
                    db       -$74, $01, -$27 
                    db       -$06, $01, -$25 
                    db       -$1E, $01, -$0E 
                    db       -$25, $01, $0A, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $16, $01, -$1D 
                    db       -$16, $01, -$1D 
                    db       $25, $01, $0A 
                    db       $1E, $01, -$0E 
                    db       $06, $01, -$25 
                    db       $74, $01, -$27 
                    db       -$09, $01, $47, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$22, $01, $18 
                    db       $f0, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Enemy4_5 
                    db       $4D, $01, $0E, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $2A, $01, $20, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$20, $01, $20, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$20, $01, -$2A 
                    db       $06, $01, $28 
                    db       -$29, $01, $3A 
                    db       -$38, $01, -$70 
                    db       $15, $01, -$20 
                    db       -$0A, $01, -$1C 
                    db       -$22, $01, -$13, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $26, $01, -$05 
                    db       $05, $01, -$26 
                    db       $13, $01, $22 
                    db       $1C, $01, $0A 
                    db       $20, $01, -$15 
                    db       $70, $01, $38 
                    db       -$3A, $01, $29, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$28, $01, -$06 
                    db       $f0, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Enemy4_6 
                    db       $75, $01, $38, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $07, $01, $35, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$2A, $01, $00, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $07, $01, -$35 
                    db       -$18, $01, $22 
                    db       -$47, $01, $09 
                    db       $27, $01, -$74 
                    db       $25, $01, -$06 
                    db       $0E, $01, -$1E 
                    db       -$0A, $01, -$25, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $1D, $01, $16 
                    db       $1D, $01, -$16 
                    db       -$0A, $01, $25 
                    db       $0E, $01, $1E 
                    db       $25, $01, $06 
                    db       $27, $01, $74 
                    db       -$47, $01, -$09, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$18, $01, -$22 
                    db       $f0, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Enemy4_7 
                    db       $4A, $01, $33, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$20, $01, $2A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$20, $01, -$20, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $2A, $01, -$20 
                    db       -$28, $01, $06 
                    db       -$3A, $01, -$29 
                    db       $70, $01, -$38 
                    db       $20, $01, $15 
                    db       $1C, $01, -$0A 
                    db       $13, $01, -$22, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $05, $01, $26 
                    db       $26, $01, $05 
                    db       -$22, $01, $13 
                    db       -$0A, $01, $1C 
                    db       $15, $01, $20 
                    db       -$38, $01, $70 
                    db       -$29, $01, -$3A, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $06, $01, -$28 
                    db       $f0, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Enemy4_8 
                    db       $2F, $01, $0E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$2F, $01, $03, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$22, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $2F, $01, $03 
                    db       -$14, $01, -$1E 
                    db       -$30, $01, -$36 
                    db       $7C, $01, $27 
                    db       $17, $01, $1A 
                    db       $1E, $01, $0E 
                    db       $25, $01, -$0A, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$16, $01, $1D 
                    db       $16, $01, $1D 
                    db       -$25, $01, -$0A 
                    db       -$1E, $01, $0E 
                    db       -$17, $01, $1A 
                    db       -$7C, $01, $27 
                    db       $30, $01, -$36, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $14, $01, -$1E 
                    db       $f0, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Enemy4_9 
                    db       $2F, $01, $0E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$33, $01, $03, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$22, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $33, $01, $03 
                    db       -$1E, $01, -$18 
                    db       -$17, $01, -$46 
                    db       $74, $01, $29 
                    db       $10, $01, $22 
                    db       $1E, $01, $0E 
                    db       $25, $01, -$0A, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$16, $01, $1D 
                    db       $16, $01, $1D 
                    db       -$25, $01, -$0A 
                    db       -$1E, $01, $0E 
                    db       -$0D, $01, $22 
                    db       -$77, $01, $29 
                    db       $17, $01, -$46, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $1E, $01, -$18 
                    db       $f0, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
