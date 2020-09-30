Rank1 
                    dw       BonusArmor_Anim 
                    db       BONUS_ARMOR                  ; type 
RankMarker1 
                    db       -$4D, $01, -$2F, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $18, $01, -$1B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $7F, $01, $7F, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$1B, $01, $18 
                    db       -$7C, $01, -$7C, hi(SMVB_continue_yd4_yEqx_single), lo(SMVB_continue_yd4_yEqx_single) ; y is -$7C 
                    db       $4D, $01, $2F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts_stay), lo(SMVB_lastDraw_rts_stay) 
RankMarker2 
                    db       -$34, $01, -$52, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $17, $01, -$18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $7C, $01, $7D, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$16, $01, $17 
                    db       -$7D, $01, -$7C, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       -$1A, $01, $1F, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $7D, $01, $7C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$18, $01, $19, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$7E, $01, -$7C, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       $19, $01, -$18, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $4E, $01, $33, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts_stay), lo(SMVB_lastDraw_rts_stay) 
RankMarker3 
                    db       -$38, $01, -$4E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $17, $01, -$17, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
;                    db       $6E, $01, $65, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $6E/2, $01, $65/2, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$6E, $01, $65, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       -$17, $01, -$17, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $57, $01, -$4E 
                    db       -$57, $01, -$4E , hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       $38, $01, $4E, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts_stay), lo(SMVB_lastDraw_rts_stay) 
RankMarker4 
                    db       -$06, $01, -$3C, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $16, $01, -$17, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $5C, $01, $54, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$5C, $01, $54 , hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       -$16, $01, -$17 , hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $44, $01, -$3D 
                    db       -$44, $01, -$3D 
                    db       -$3C, $01, -$17, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $5A, $01, $54, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$5A, $01, $54, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       -$17, $01, -$17 , hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $45, $01, -$3D 
                    db       -$45, $01, -$3D 
                    db       $17, $01, -$17 
                    db       $42, $01, $53, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts_stay), lo(SMVB_lastDraw_rts_stay) 
RankMarker5 
                    db       $15, $01, $39, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$2B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $2B, $01, -$0E, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$2B, $01, -$0E 
                    db       $00, $01, -$2B 
                    db       -$1B, $01, $24 
                    db       -$2B, $01, -$11 
                    db       $18, $01, $26 
                    db       -$18, $01, $26 
                    db       $2B, $01, -$11, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $1B, $01, $24 
                    db       -$15, $01, -$39, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts_stay), lo(SMVB_lastDraw_rts_stay) 
RankMarker6 
                    db       $40, $01, $26, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, -$1D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1C, $01, -$09, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$1C, $01, -$09 
                    db       $00, $01, -$1D 
                    db       -$13, $01, $19 
                    db       -$1D, $01, -$0B 
                    db       $11, $01, $18 
                    db       -$11, $01, $18 
                    db       $1D, $01, -$0A, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $13, $01, $18 
                    db       -$6E, $01, -$02, hi(SMVB_startMove_yd4_single), lo(SMVB_startMove_yd4_single) 
                    db       $00, $01, -$1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1D, $01, -$08, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$1D, $01, -$09 
                    db       $00, $01, -$1D 
                    db       -$13, $01, $18 
                    db       -$1D, $01, -$0A 
                    db       $11, $01, $18 
                    db       -$11, $01, $17 
                    db       $1D, $01, -$0A, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $13, $01, $17 
                    db       $2E, $01, -$24, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts_stay), lo(SMVB_lastDraw_rts_stay) 
RankMarkerCircle_Anim 
                    DW       RankMarkerCircle_0           ; list of all single vectorlists in this 
                    DW       RankMarkerCircle_1 
                    DW       RankMarkerCircle_2 
                    DW       RankMarkerCircle_3 
                    DW       RankMarkerCircle_4 
                    DW       RankMarkerCircle_5 
                    DW       RankMarkerCircle_6 
                    DW       RankMarkerCircle_5 
                    DW       RankMarkerCircle_4 
                    DW       RankMarkerCircle_3 
                    DW       RankMarkerCircle_2 
                    DW       RankMarkerCircle_1 
                    DW       0 
RankMarkerCircle_0 
                    db       -$10, $01, -$7F, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $22, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $20, $01, $07, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $1F, $01, $16 
                    db       $1F, $01, $23 
                    db       $0E, $01, $2B 
                    db       $00, $01, $28 
                    db       -$0E, $01, $2B 
                    db       -$1F, $01, $23 
                    db       -$1F, $01, $16, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$20, $01, $07 
                    db       -$24, $01, $00 
                    db       -$20, $01, -$07 
                    db       -$1F, $01, -$16 
                    db       -$1F, $01, -$23 
                    db       -$0E, $01, -$2B 
                    db       $00, $01, -$28, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $0E, $01, -$2B 
                    db       $1F, $01, -$23 
                    db       $1F, $01, -$16 
                    db       $20, $01, -$07 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
RankMarkerCircle_1 
                    db       -$10, $01, -$7B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $22, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $20, $01, $07, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $1F, $01, $15 
                    db       $1F, $01, $22 
                    db       $0E, $01, $2A 
                    db       $00, $01, $26 
                    db       -$0E, $01, $2A 
                    db       -$1F, $01, $22 
                    db       -$1F, $01, $15, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$20, $01, $07 
                    db       -$24, $01, $00 
                    db       -$20, $01, -$07 
                    db       -$1F, $01, -$15 
                    db       -$1F, $01, -$22 
                    db       -$0E, $01, -$2A 
                    db       $00, $01, -$26, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $0E, $01, -$2A 
                    db       $1F, $01, -$22 
                    db       $1F, $01, -$15 
                    db       $20, $01, -$07 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
RankMarkerCircle_2 
                    db       -$10, $01, -$6E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $22, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $20, $01, $06, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $1F, $01, $13 
                    db       $1F, $01, $1E 
                    db       $0E, $01, $26 
                    db       $00, $01, $22 
                    db       -$0E, $01, $26 
                    db       -$1F, $01, $1E 
                    db       -$1F, $01, $13, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$20, $01, $06 
                    db       -$24, $01, $00 
                    db       -$20, $01, -$06 
                    db       -$1F, $01, -$13 
                    db       -$1F, $01, -$1E 
                    db       -$0E, $01, -$26 
                    db       $00, $01, -$22, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $0E, $01, -$26 
                    db       $1F, $01, -$1E 
                    db       $1F, $01, -$13 
                    db       $20, $01, -$06 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
RankMarkerCircle_3 
                    db       -$10, $01, -$5A, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $22, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $20, $01, $05, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $1F, $01, $10 
                    db       $1F, $01, $18 
                    db       $0E, $01, $1F 
                    db       $00, $01, $1C 
                    db       -$0E, $01, $1F 
                    db       -$1F, $01, $18 
                    db       -$1F, $01, $10, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$20, $01, $05 
                    db       -$24, $01, $00 
                    db       -$20, $01, -$05 
                    db       -$1F, $01, -$10 
                    db       -$1F, $01, -$18 
                    db       -$0E, $01, -$1F 
                    db       $00, $01, -$1C, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $0E, $01, -$1F 
                    db       $1F, $01, -$18 
                    db       $1F, $01, -$10 
                    db       $20, $01, -$05 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
RankMarkerCircle_4 
                    db       -$10, $01, -$40, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $22, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $20, $01, $04, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $1F, $01, $0B 
                    db       $1F, $01, $11 
                    db       $0E, $01, $16 
                    db       $00, $01, $14 
                    db       -$0E, $01, $16 
                    db       -$1F, $01, $11 
                    db       -$1F, $01, $0B, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$20, $01, $04 
                    db       -$24, $01, $00 
                    db       -$20, $01, -$04 
                    db       -$1F, $01, -$0B 
                    db       -$1F, $01, -$11 
                    db       -$0E, $01, -$16 
                    db       $00, $01, -$14, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $0E, $01, -$16 
                    db       $1F, $01, -$11 
                    db       $1F, $01, -$0B 
                    db       $20, $01, -$04 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
RankMarkerCircle_5 
                    db       -$10, $01, -$21, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $22, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $20, $01, $02, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $1F, $01, $06 
                    db       $1F, $01, $09 
                    db       $0E, $01, $0B 
                    db       $00, $01, $0A 
                    db       -$0E, $01, $0B 
                    db       -$1F, $01, $09 
                    db       -$1F, $01, $06, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$20, $01, $02 
                    db       -$24, $01, $00 
                    db       -$20, $01, -$02 
                    db       -$1F, $01, -$06 
                    db       -$1F, $01, -$09 
                    db       -$0E, $01, -$0B 
                    db       $00, $01, -$0A, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $0E, $01, -$0B 
                    db       $1F, $01, -$09 
                    db       $1F, $01, -$06 
                    db       $20, $01, -$02 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
RankMarkerCircle_6 
                    db       $7E, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$7E, $01, $00, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
;    db  $7E, $01,  $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single)
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
