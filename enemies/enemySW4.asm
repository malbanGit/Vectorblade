enemySW4Definition1 
enemySW4Definition_1 
                    dw       EnemySW4Angle8Table 
                    db       20 
                    dw       EnemySW4WaitAnim 
                    db       3,TYPE_NONE                  ; ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemySW4Definition 
                    dw       EnemySW4Angle8Table 
                    db       20 
                    dw       EnemySW4WaitAnim 
                    db       3,TYPE_CAN_CLONE, 64+00+20   ; ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
EnemySW4WaitAnim 
                    DW       XWing_0                      ; list of all single vectorlists in this 
                    DW       XWing_8                      ; list of all single vectorlists in this 
                    DW       XWing_0                      ; list of all single vectorlists in this 
                    DW       XWing_9                      ; list of all single vectorlists in this 
                    DW       0 
EnemySW4Angle8Table 
                    DW       XWing_0                      ; list of all single vectorlists in this 
                    DW       XWing_1 
                    DW       XWing_2 
                    DW       XWing_3 
                    DW       XWing_0 
                    DW       XWing_5 
                    DW       XWing_6 
                    DW       XWing_7 
                    DW       0 
XWing_0 
                    db       $7A, $01, $17, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$6F, $01, -$18, hi(SMVB_startDraw_yd4_single), lo(SMVB_startDraw_yd4_single) 
                    db       $6F, $01, -$16, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$25, $01, $03, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$27, $01, -$7D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $41, $01, $68, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $58, $01, -$68 
                    db       -$37, $01, $76 
                    db       $09, $01, $1B 
                    db       -$09, $01, $1B 
                    db       $37, $01, $76 
                    db       -$55, $01, -$67 
                    db       -$44, $01, $67, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $13, $01, -$40, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$20, $01, $40, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       $19, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $7D, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $1C, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$60, hi(SMVB_startMove_tripple), lo(SMVB_startMove_tripple) 
                    db       -$1C, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$7D, $01, $00, hi(SMVB_startMove_yd4_single), lo(SMVB_startMove_yd4_single) 
                    db       -$19, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
XWing_1 
                    db       $7C, $01, $0B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$71, $01, -$0E, hi(SMVB_startDraw_yd4_single), lo(SMVB_startDraw_yd4_single) 
                    db       $6C, $01, -$21, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$24, $01, $08, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$34, $01, -$78, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $4C, $01, $60, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $4C, $01, -$70 
                    db       -$29, $01, $7A 
                    db       $0B, $01, $1A 
                    db       -$06, $01, $1C 
                    db       $43, $01, $70 
                    db       -$5F, $01, -$5E 
                    db       -$3A, $01, $6D, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $0D, $01, -$41, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$1A, $01, $42, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       $19, $01, -$02, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $7D, $01, -$0D, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $1C, $01, -$02, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0A, $01, -$60, hi(SMVB_startMove_tripple), lo(SMVB_startMove_tripple) 
                    db       -$1B, $01, $02, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$7D, $01, $0E, hi(SMVB_startMove_yd4_single), lo(SMVB_startMove_yd4_single) 
                    db       -$19, $01, $02, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
XWing_2 
                    db       $7C, $01, -$02, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$72, $01, -$02, hi(SMVB_startDraw_yd4_single), lo(SMVB_startDraw_yd4_single) 
                    db       $68, $01, -$2C, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$24, $01, $0B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$3F, $01, -$71, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $55, $01, $57, hi(SMVB_continue6_single), lo(SMVB_continue6_single) 
                    db       $40, $01, -$78 
                    db       -$1D, $01, $7E 
                    db       $0E, $01, $19 
                    db       -$03, $01, $1C 
                    db       $4E, $01, $68 
                    db       -$68, $01, -$52, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       -$2D, $01, $71, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $05, $01, -$42, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$11, $01, $45, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       $18, $01, -$07, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $79, $01, -$19, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $1C, $01, -$06, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$14, $01, -$5E, hi(SMVB_startMove_tripple), lo(SMVB_startMove_tripple) 
                    db       -$1C, $01, $06, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$79, $01, $1B, hi(SMVB_startMove_yd4_single), lo(SMVB_startMove_yd4_single) 
                    db       -$19, $01, $05, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
XWing_3 
                    db       $7B, $01, -$0F, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$71, $01, $0B, hi(SMVB_startDraw_yd4_single), lo(SMVB_startDraw_yd4_single) 
                    db       $62, $01, -$37, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$21, $01, $0F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$4B, $01, -$6A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $5E, $01, $4D, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $32, $01, -$7D 
                    db       -$07, $01, $40, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $11, $01, $17, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $00, $01, $1C 
                    db       $58, $01, $5F 
                    db       -$70, $01, -$47, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       -$21, $01, $77, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$01, $01, -$42, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$0A, $01, $46, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       $18, $01, -$07, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $76, $01, -$27, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $1B, $01, -$09, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1E, $01, -$5B, hi(SMVB_startMove_tripple), lo(SMVB_startMove_tripple) 
                    db       -$1A, $01, $09, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$76, $01, $27, hi(SMVB_startMove_yd4_single), lo(SMVB_startMove_yd4_single) 
                    db       -$19, $01, $07, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
XWing_4 
                    db       $7A, $01, $17, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$6F, $01, -$18, hi(SMVB_startDraw_yd4_single), lo(SMVB_startDraw_yd4_single) 
                    db       $6F, $01, -$16, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$25, $01, $03, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$27, $01, -$7D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $41, $01, $68, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $58, $01, -$68 
                    db       -$37, $01, $76 
                    db       $09, $01, $1B 
                    db       -$09, $01, $1B 
                    db       $37, $01, $76 
                    db       -$55, $01, -$67 
                    db       -$44, $01, $67, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $13, $01, -$40, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$20, $01, $40, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       $19, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $7D, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $1C, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$60, hi(SMVB_startMove_tripple), lo(SMVB_startMove_tripple) 
                    db       -$1C, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$7D, $01, $00, hi(SMVB_startMove_yd4_single), lo(SMVB_startMove_yd4_single) 
                    db       -$19, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
XWing_5 
                    db       $77, $01, $24, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$6A, $01, -$24, hi(SMVB_startDraw_yd4_single), lo(SMVB_startDraw_yd4_single) 
                    db       $6F, $01, -$0B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$24, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$0D, $01, -$40, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $35, $01, $6E, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $64, $01, -$5F 
                    db       -$43, $01, $70 
                    db       $06, $01, $1C 
                    db       -$0B, $01, $1A 
                    db       $29, $01, $7A 
                    db       -$4A, $01, -$6E 
                    db       -$4E, $01, $5E, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $35, $01, -$7A 
                    db       -$4E, $01, $78, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $19, $01, $02, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $7D, $01, $0E, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $1B, $01, $02, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0A, $01, -$60, hi(SMVB_startMove_tripple), lo(SMVB_startMove_tripple) 
                    db       -$1C, $01, -$02, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$7D, $01, -$0D, hi(SMVB_startMove_yd4_single), lo(SMVB_startMove_yd4_single) 
                    db       -$19, $01, -$02, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
XWing_6 
                    db       $72, $01, $30, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$67, $01, -$2F, hi(SMVB_startDraw_yd4_single), lo(SMVB_startDraw_yd4_single) 
                    db       $71, $01, $01, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$25, $01, -$03, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$06, $01, -$41, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $29, $01, $73, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $6C, $01, -$54 
                    db       -$4E, $01, $68 
                    db       $03, $01, $1C 
                    db       -$0E, $01, $19 
                    db       $1D, $01, $7E 
                    db       -$3D, $01, -$76 
                    db       -$58, $01, $55, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $3F, $01, -$74 
                    db       -$58, $01, $6F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $19, $01, $05, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $79, $01, $1B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $1C, $01, $06, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $14, $01, -$5E, hi(SMVB_startMove_tripple), lo(SMVB_startMove_tripple) 
                    db       -$1C, $01, -$06, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$79, $01, -$19, hi(SMVB_startMove_yd4_single), lo(SMVB_startMove_yd4_single) 
                    db       -$18, $01, -$07, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
XWing_7 
                    db       $6C, $01, $3B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$61, $01, -$39, hi(SMVB_startDraw_yd4_single), lo(SMVB_startDraw_yd4_single) 
                    db       $70, $01, $0D, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$23, $01, -$08, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, -$41, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $1D, $01, $77, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $74, $01, -$47 
                    db       -$58, $01, $5F , hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       $00, $01, $1C , hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       -$11, $01, $17 , hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $07, $01, $40, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$30, $01, -$7C, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$60, $01, $4C 
                    db       $4C, $01, -$6C 
                    db       -$65, $01, $65, hi(SMVB_startMove_yd4_single), lo(SMVB_startMove_yd4_single) 
                    db       $19, $01, $07, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $76, $01, $27, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $1A, $01, $09, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1E, $01, -$5B, hi(SMVB_startMove_tripple), lo(SMVB_startMove_tripple) 
                    db       -$1B, $01, -$09, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$76, $01, -$27, hi(SMVB_startMove_yd4_single), lo(SMVB_startMove_yd4_single) 
                    db       -$18, $01, -$07, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
XWing_8 
                    db       $7A, $01, $17, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$6F, $01, -$18, hi(SMVB_startDraw_yd4_single), lo(SMVB_startDraw_yd4_single) 
                    db       $6F, $01, -$16, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$25, $01, $03, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$20, $01, -$7D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $3A, $01, $68, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $52, $01, -$68 
                    db       -$31, $01, $76 
                    db       $09, $01, $1B 
                    db       -$09, $01, $1B 
                    db       $31, $01, $76 
                    db       -$4F, $01, -$67 
                    db       -$3D, $01, $67, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $10, $01, -$40, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$1C, $01, $40, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       $19, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $6F, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $1D, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$60, hi(SMVB_startMove_tripple), lo(SMVB_startMove_tripple) 
                    db       -$1D, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$6F, $01, $00, hi(SMVB_startMove_yd4_single), lo(SMVB_startMove_yd4_single) 
                    db       -$19, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
XWing_9 
                    db       $7A, $01, $17, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$6F, $01, -$18, hi(SMVB_startDraw_yd4_single), lo(SMVB_startDraw_yd4_single) 
                    db       $6F, $01, -$16, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$25, $01, $03, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$2D, $01, -$7D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $47, $01, $68, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $5F, $01, -$68 
                    db       -$3E, $01, $76 
                    db       $09, $01, $1B 
                    db       -$09, $01, $1B 
                    db       $3E, $01, $76 
                    db       -$5C, $01, -$67 
                    db       -$4A, $01, $67, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $16, $01, -$40, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$23, $01, $40, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       $19, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $44, $01, $00, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       $1D, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$60, hi(SMVB_startMove_tripple), lo(SMVB_startMove_tripple) 
                    db       -$1D, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$44, $01, $00, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       -$19, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
