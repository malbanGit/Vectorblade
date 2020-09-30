enemy2Definition 
                    dw       Enemy2Angle8Table 
                    db       1                            ; hp 
                    dw       Enemy2WaitAnim 
                    db       2,0 
enemy2Definition2 
                    dw       Enemy2Angle8Table 
                    db       2 
                    dw       Enemy2WaitAnim 
                    db       2,0 
enemy2Definition3 
                    dw       Enemy2Angle8Table 
                    db       5 
                    dw       Enemy2WaitAnim 
                    db       3,0 
enemy2Definition_dw 
                    dw       Enemy2Angle8Table 
                    db       2                            ; hp 
                    dw       Enemy2WaitAnim 
                    db       2,TYPE_DONT_WAIT 
Enemy2WaitAnim 
                    DW       Enemy2_0 
                    DW       Enemy2_8 
                    DW       Enemy2_0 
                    DW       Enemy2_9 
                    DW       0 
Enemy2Angle8Table 
                    DW       Enemy2_0                     ; list of all single vectorlists in this 
                    DW       Enemy2_1 
                    DW       Enemy2_2 
                    DW       Enemy2_3 
                    DW       Enemy2_4 
                    DW       Enemy2_5 
                    DW       Enemy2_6 
                    DW       Enemy2_7 
                    DW       0 
Enemy2_0 
                    db       $18, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $2F, $01, $11, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$47, $01, $2E, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $4D, $01, $3A 
                    db       $50, $01, -$0B 
                    db       $2E, $01, -$2F 
                    db       -$52, $01, -$23 
                    db       $52, $01, -$0B 
                    db       $0C, $01, -$11 
                    db       -$0C, $01, -$11, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$52, $01, -$0B 
                    db       $52, $01, -$1E 
                    db       -$2E, $01, -$34 
                    db       -$50, $01, -$0B 
                    db       -$4D, $01, $3F 
                    db       $47, $01, $29 
                    db       -$2F, $01, $11, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Enemy2_1 
                    db       $2E, $01, -$35, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $14, $01, $2E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$52, $01, -$10, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $0C, $01, $5C 
                    db       $43, $01, $32 
                    db       $40, $01, $00 
                    db       -$1F, $01, -$53 
                    db       $3F, $01, $31 
                    db       $17, $01, -$02 
                    db       $02, $01, -$17, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$31, $01, -$3F 
                    db       $4F, $01, $24 
                    db       $04, $01, -$45 
                    db       -$32, $01, -$43 
                    db       -$61, $01, -$07 
                    db       $15, $01, $4D 
                    db       -$2E, $01, -$14, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Enemy2_2 
                    db       $63, $01, -$4B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$11, $01, $2F, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$2E, $01, -$47, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$3A, $01, $4D 
                    db       $0B, $01, $50 
                    db       $2F, $01, $2E 
                    db       $23, $01, -$52 
                    db       $0B, $01, $52 
                    db       $11, $01, $0C 
                    db       $11, $01, -$0C, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $0B, $01, -$52 
                    db       $1E, $01, $52 
                    db       $34, $01, -$2E 
                    db       $0B, $01, -$50 
                    db       -$3F, $01, -$4D 
                    db       -$29, $01, $47 
                    db       -$11, $01, -$2F, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Enemy2_3 
                    db       $4C, $01, -$1A, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$2E, $01, $14, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $10, $01, -$52, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$5C, $01, $0C 
                    db       -$32, $01, $43 
                    db       $00, $01, $40 
                    db       $53, $01, -$1F 
                    db       -$31, $01, $3F 
                    db       $02, $01, $17 
                    db       $17, $01, $02, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $3F, $01, -$31 
                    db       -$24, $01, $4F 
                    db       $45, $01, $04 
                    db       $43, $01, -$32 
                    db       $07, $01, -$61 
                    db       -$4D, $01, $15 
                    db       $14, $01, -$2E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Enemy2_4 
                    db       $57, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$2F, $01, -$11, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $47, $01, -$2E, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       -$4D, $01, -$3A 
                    db       -$50, $01, $0B 
                    db       -$2E, $01, $2F 
                    db       $52, $01, $23 
                    db       -$52, $01, $0B , hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       -$0C, $01, $11 , hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $0C, $01, $11 
                    db       $52, $01, $0B 
                    db       -$52, $01, $1E , hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       $2E, $01, $34 , hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $50, $01, $0B 
                    db       $4D, $01, -$3F 
                    db       -$47, $01, -$29 
                    db       $2F, $01, -$11 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Enemy2_5 
                    db       $4C, $01, $1A, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$14, $01, -$2E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $52, $01, $10, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$0C, $01, -$5C 
                    db       -$43, $01, -$32 
                    db       -$40, $01, $00 
                    db       $1F, $01, $53 
                    db       -$3F, $01, -$31 
                    db       -$17, $01, $02 
                    db       -$02, $01, $17, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $31, $01, $3F 
                    db       -$4F, $01, -$24 
                    db       -$04, $01, $45 
                    db       $32, $01, $43 
                    db       $61, $01, $07 
                    db       -$15, $01, -$4D 
                    db       $2E, $01, $14, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Enemy2_6 
                    db       $63, $01, $4B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $11, $01, -$2F, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $2E, $01, $47, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $3A, $01, -$4D 
                    db       -$0B, $01, -$50 
                    db       -$2F, $01, -$2E 
                    db       -$23, $01, $52 
                    db       -$0B, $01, -$52 
                    db       -$11, $01, -$0C 
                    db       -$11, $01, $0C, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$0B, $01, $52 
                    db       -$1E, $01, -$52 
                    db       -$34, $01, $2E 
                    db       -$0B, $01, $50 
                    db       $3F, $01, $4D 
                    db       $29, $01, -$47 
                    db       $11, $01, $2F, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Enemy2_7 
                    db       $2E, $01, $35, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       SHITREG_POKE_VALUE, $01, -$14, hi(SMVB_startDraw_yStays_single), lo(SMVB_startDraw_yStays_single) ; y was $2E, now SHIFT Poke 
                    db       -$10, $01, $52, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $5C, $01, -$0C 
                    db       $32, $01, -$43 
                    db       $00, $01, -$40 
                    db       -$53, $01, $1F 
                    db       $31, $01, -$3F 
                    db       -$02, $01, -$17 
                    db       -$17, $01, -$02, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$3F, $01, $31 
                    db       $24, $01, -$4F 
                    db       -$45, $01, -$04 
                    db       -$43, $01, $32 
                    db       -$07, $01, $61 
                    db       $4D, $01, -$15 
                    db       -$14, $01, $2E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Enemy2_8 
                    db       $1E, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $29, $01, $11, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$41, $01, $34, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $47, $01, $41 
                    db       $50, $01, -$0D 
                    db       $29, $01, -$34 
                    db       -$4D, $01, -$29 
                    db       $52, $01, -$0B 
                    db       $0C, $01, -$11 
                    db       -$0C, $01, -$11, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$52, $01, -$0B 
                    db       $4D, $01, -$29 
                    db       -$29, $01, -$34 
                    db       -$50, $01, -$0D 
                    db       -$47, $01, $41 
                    db       $41, $01, $34 
                    db       -$29, $01, $11, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Enemy2_9 
                    db       $13, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $34, $01, $11, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$4C, $01, $29, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $52, $01, $34 
                    db       $50, $01, -$0B 
                    db       $34, $01, -$29 
                    db       -$58, $01, -$1E 
                    db       $52, $01, -$0B 
                    db       $0C, $01, -$11 
                    db       -$0C, $01, -$11, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$52, $01, -$0B 
                    db       $58, $01, -$18 
                    db       -$34, $01, -$2F 
                    db       -$50, $01, -$0B 
                    db       -$52, $01, $3A 
                    db       $4C, $01, $23 
                    db       -$34, $01, $11, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
