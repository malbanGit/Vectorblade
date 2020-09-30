SinistarMain 
                    DW       Sinistar_0                   ; list of all single vectorlists in this 
                    DW       Sinistar_1 
                    DW       0 
SinistarMouthAnim 
                    fdb      Sinistar_Mouth_0 
                    fdb      Sinistar_Mouth_1 
                    fdb      Sinistar_Mouth_2 
                    DW       0 
SinistarAttachments 
                    DW       Sinistar_2 
                    DW       Sinistar_3 
                    DW       Sinistar_4 
                    DW       Sinistar_5 
                    DW       Sinistar_6 
                    DW       Sinistar_7 
                    DW       Sinistar_8 
                    DW       Sinistar_9 
                    DW       Sinistar_10 
                    DW       Sinistar_11 
                    DW       0 
Sinistar_0 
                    db       $4A, $01, -$25, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       -$2D, $01, $25, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $2D, $01, $29, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       -$07, $01, -$07, hi(SMVB50_startMove_yEqx_single), lo(SMVB50_startMove_yEqx_single) ; y is -$07 
                    db       $09, $01, -$0F, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, -$24, hi(SMVB50_continue_yd4_single), lo(SMVB50_continue_yd4_single) 
                    db       -$09, $01, -$0E , hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       -$27, $01, -$26, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $13, $01, $04, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $31, $01, -$15, hi(SMVB50_continue7_single), lo(SMVB50_continue7_single) 
                    db       -$16, $01, $31 
                    db       -$1B, $01, -$1C 
                    db       -$1C, $01, $43 
                    db       $1D, $01, $43 
                    db       $1A, $01, -$1C 
                    db       $17, $01, $31 
                    db       -$31, $01, -$15, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$13, $01, $03 
                    db       -$16, $01, -$37, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $12, $01, $12, hi(SMVB50_startDraw_yEqx_single), lo(SMVB50_startDraw_yEqx_single) ; y is $12 
                    db       -$0E, $01, $07, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$04, $01, -$19 
                    db       -$18, $01, -$0F, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$05, $01, -$07, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $14, $01, $08, hi(SMVB50_continue3_single), lo(SMVB50_continue3_single) 
                    db       -$14, $01, $08 
                    db       $05, $01, -$08 
                    db       $18, $01, -$0E, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $12, $01, -$12, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$0E, $01, -$07, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$04, $01, $19 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Sinistar_1 
                    db       -$2A, $01, -$28, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $15, $01, -$1C, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $12, $01, $0F, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       -$04, $01, $04, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$15, $01, $08, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$1C, $01, $00, hi(SMVB50_continue3_single), lo(SMVB50_continue3_single) 
                    db       -$1D, $01, $1D 
                    db       $05, $01, $04 
                    db       $00, $01, $0C , hi(SMVB50_continue_yd4_single), lo(SMVB50_continue_yd4_single) 
                    db       -$04, $01, $05 , hi(SMVB50_continue4_single), lo(SMVB50_continue4_single) 
                    db       $1D, $01, $1D 
                    db       $1C, $01, $00 
                    db       $12, $01, $09 
                    db       $05, $01, $05, hi(SMVB50_startMove_yEqx_single), lo(SMVB50_startMove_yEqx_single) ; y is $05 
                    db       -$10, $01, $0F, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$16, $01, -$1C, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $46, $01, $1D, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $00, $01, $2C, hi(SMVB50_startDraw_yd4_single), lo(SMVB50_startDraw_yd4_single) 
                    db       -$29, $01, -$56, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $29, $01, $29 
                    db       -$19, $01, -$08, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$28, $01, -$2A, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$0A, $01, -$02, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $08, $01, -$02 
                    db       $00, $01, -$1E , hi(SMVB50_continue_yd4_single), lo(SMVB50_continue_yd4_single) 
                    db       -$07, $01, -$01 , hi(SMVB50_continue3_single), lo(SMVB50_continue3_single) 
                    db       $0A, $01, -$02 
                    db       $25, $01, -$25 
                    db       $1C, $01, -$0D, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$29, $01, $29, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $28, $01, -$56, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $00, $01, $2C , hi(SMVB50_continue_yd4_single), lo(SMVB50_continue_yd4_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Sinistar_2 
                    db       -$51, $01, -$06, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       -$21, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $05, $01, -$19, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $0C, $01, -$03 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Sinistar_3 
                    db       -$62, $01, -$22, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $06, $01, -$18, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $25, $01, $00, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $00, $01, -$21 , hi(SMVB50_continue_yd4_single), lo(SMVB50_continue_yd4_single) 
                    db       $12, $01, -$02 , hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       -$3E, $01, $3C, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $24, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Sinistar_4 
                    db       -$24, $01, -$66, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $19, $01, -$07, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, $30, hi(SMVB50_continue_yd4_single), lo(SMVB50_continue_yd4_single) 
                    db       -$19, $01, -$2A, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $00, $01, $34, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Sinistar_5 
                    db       $00, $01, -$3C, hi(SMVB50_continue_yd4_single), lo(SMVB50_continue_yd4_single) 
                    db       SHITREG_POKE_VALUE, $01, -$32, hi(SMVB50_startDraw_yStays_single), lo(SMVB50_startDraw_yStays_single) ; y was $00, now SHIFT Poke 
                    db       $15, $01, $07, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Sinistar_6 
                    db       $43, $01, -$22, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $29, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $05, $01, $1B, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$25, $01, $00 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Sinistar_7 
                    db       $43, $01, $22, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $29, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $04, $01, -$1B, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$25, $01, $00 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Sinistar_8 
                    db       $00, $01, $3D, hi(SMVB50_continue_yd4_single), lo(SMVB50_continue_yd4_single) 
                    db       SHITREG_POKE_VALUE, $01, $31, hi(SMVB50_startDraw_yStays_single), lo(SMVB50_startDraw_yStays_single) ; y was $00, now SHIFT Poke 
                    db       $14, $01, -$08, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Sinistar_9 
                    db       -$24, $01, $66, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $19, $01, $07, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, -$30, hi(SMVB50_continue_yd4_single), lo(SMVB50_continue_yd4_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Sinistar_10 
                    db       -$62, $01, $22, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $06, $01, $18, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $25, $01, $00, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $00, $01, $22 , hi(SMVB50_continue_yd4_single), lo(SMVB50_continue_yd4_single) 
                    db       $12, $01, $03 , hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $00, $01, $07, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, -$33, hi(SMVB50_startDraw_yStays_single), lo(SMVB50_startDraw_yStays_single) ; y was $00, now SHIFT Poke 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Sinistar_11 
                    db       -$51, $01, $06, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       -$22, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $05, $01, $19, hi(SMVB50_continue3_single), lo(SMVB50_continue3_single) 
                    db       $0C, $01, $03 
                    db       $24, $01, $00 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Sinistar_Mouth_0 
                    db       -$3D, $01, $11, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $0F, $01, $11, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $15, $01, $00, hi(SMVB50_continue4_single), lo(SMVB50_continue4_single) 
                    db       -$24, $01, -$11 
                    db       $0A, $01, -$03 
                    db       -$0A, $01, -$02 
                                                          ; setting y to zero (VIA A) from an old (- value) takes more time!!! 
                    db       $00, $01, -$17-6, hi(SMVB50_continue_yd4_single), lo(SMVB50_continue_yd4_single) 
                    db       $0F, $01, -$11, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $15, $01, $00 
                    db       -$24, $01, $11, hi(SMVB50_continue_yd4_single), lo(SMVB50_continue_yd4_single) 
                    db       $0A, $01, $03, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$0A, $01, $03 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Sinistar_Mouth_1 
                    db       -$34, $01, $11, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $0F, $01, $11, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $0C, $01, $00, hi(SMVB50_continue4_single), lo(SMVB50_continue4_single) 
                    db       -$1B, $01, -$11 
                    db       $0A, $01, -$03 
                    db       -$0A, $01, -$02 
                                                          ; setting y to zero (VIA A) from an old (- value) takes more time!!! 
                    db       $00, $01, -$17-6, hi(SMVB50_continue_yd4_single), lo(SMVB50_continue_yd4_single) 
                    db       $0F, $01, -$11, hi(SMVB50_continue5_single), lo(SMVB50_continue5_single) 
                    db       $0C, $01, $00 
                    db       -$1B, $01, $11 
                    db       $0A, $01, $03 
                    db       -$0A, $01, $03 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
Sinistar_Mouth_2 
                    db       -$2B, $01, $11, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $0F, $01, $11, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $03, $01, $00, hi(SMVB50_continue4_single), lo(SMVB50_continue4_single) 
                    db       -$12, $01, -$11 
                    db       $0A, $01, -$03 
                    db       -$0A, $01, -$02 
                                                          ; setting y to zero (VIA A) from an old (- value) takes more time!!! 
                    db       $00, $01, -$17-6, hi(SMVB50_continue_yd4_single), lo(SMVB50_continue_yd4_single) 
                    db       $0F, $01, -$11, hi(SMVB50_continue5_single), lo(SMVB50_continue5_single) 
                    db       $03, $01, $00 
                    db       -$12, $01, $11 
                    db       $0A, $01, $03 
                    db       -$0A, $01, $03 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
