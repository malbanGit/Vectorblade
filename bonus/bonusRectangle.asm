RectangleOuter_0 
                    db       $00, $01, -$7E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$50, $01, $00, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $00, $01, $7E 
                    db       $50, $01, $00 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
RectangleOuter_1 
                    db       -$32, $01, -$74, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$4A, $01, $1E, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $32, $01, $74 
                    db       $4A, $01, -$1E 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
RectangleOuter_2 
                    db       -$59, $01, -$59, hi(SMVB_startDraw_yEqx_single), lo(SMVB_startDraw_yEqx_single) ; y is -$59 
                    db       -$39, $01, $39, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $59, $01, $59 
                    db       $39, $01, -$39 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
RectangleOuter_3 
                    db       -$74, $01, -$32, hi(SMVB_startDraw_yd4_single), lo(SMVB_startDraw_yd4_single) 
                    db       -$1E, $01, $4A, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $74, $01, $32 
                    db       $1E, $01, -$4A 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
RectangleOuter_4 
                    db       -$7E, $01, $00, hi(SMVB_startDraw_yd4_single), lo(SMVB_startDraw_yd4_single) 
                    db       $00, $01, $50, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $7E, $01, $00 
                    db       $00, $01, -$50 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
RectangleOuter_5 
                    db       -$74, $01, $32, hi(SMVB_startDraw_yd4_single), lo(SMVB_startDraw_yd4_single) 
                    db       $1E, $01, $4A, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $74, $01, -$32 
                    db       -$1E, $01, -$4A 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
RectangleOuter_6 
                    db       -$59, $01, $59, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $39, $01, $39, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $59, $01, -$59 
                    db       -$39, $01, -$39 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
RectangleOuter_7 
                    db       -$32, $01, $74, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $4A, $01, $1E, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $32, $01, -$74 
                    db       -$4A, $01, -$1E 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
RectangleOuter_8 
                    db       $00, $01, $7E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $50, $01, $00, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $00, $01, -$7E 
                    db       -$50, $01, $00 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
RectangleOuter_9 
                    db       $32, $01, $74, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $4A, $01, -$1E, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$32, $01, -$74 
                    db       -$4A, $01, $1E 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
RectangleOuter_10 
                    db       $59, $01, $59, hi(SMVB_startDraw_yEqx_single), lo(SMVB_startDraw_yEqx_single) ; y is $59 
                    db       $39, $01, -$39, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$59, $01, -$59 
                    db       -$39, $01, $39 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
RectangleOuter_11 
                    db       $74, $01, $32, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1E, $01, -$4A, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$74, $01, -$32, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       -$1E, $01, $4A, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
RectangleOuter_12 
                    db       $7E, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$50, hi(SMVB_continue_newY_eq_oldX_single), lo(SMVB_continue_newY_eq_oldX_single) ; y is $00 
                    db       -$7E, $01, $00, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       $00, $01, $50, hi(SMVB_continue_newY_eq_oldX_single), lo(SMVB_continue_newY_eq_oldX_single) ; y is $00 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
RectangleOuter_13 
                    db       $74, $01, -$32, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1E, $01, -$4A, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$74, $01, $32, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       $1E, $01, $4A, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
RectangleOuter_14 
                    db       $59, $01, -$59, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$39, $01, -$39, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$59, $01, $59 
                    db       $39, $01, $39 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
RectangleOuter_15 
                    db       $32, $01, -$74, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$4A, $01, -$1E, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$32, $01, $74 
                    db       $4A, $01, $1E 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
