LetterOuter3d_0 
                    db       $5A, $01, -$5A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $5A, $01, $5A, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$5A, $01, $5A , hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       -$5A, $01, -$5A , hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $5A, $01, -$5A 
                    db       $5A, $01, $5A 
                    db       -$5A, $01, $5A , hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       -$5A, $01, -$5A , hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
LetterOuter3d_1 
                    db       $52, $01, -$5A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $54, $01, $5A, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$54, $01, $5A , hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       -$52, $01, -$5A , hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $0A, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $54, $01, -$5A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $52, $01, $5A, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$52, $01, $5A , hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       -$54, $01, -$5A , hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
LetterOuter3d_2 
                    db       $3F, $01, -$5A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $3E, $01, $5A, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$3E, $01, $5A 
                    db       -$3F, $01, -$5A 
                    db       $15, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $3E, $01, -$5A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $3F, $01, $5A, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$3F, $01, $5A 
                    db       -$3E, $01, -$5A 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
LetterOuter3d_3 
                    db       $23, $01, -$5A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $22, $01, $5A, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$22, $01, $5A 
                    db       -$23, $01, -$5A 
                    db       $1B, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $22, $01, -$5A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $23, $01, $5A, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$23, $01, $5A 
                    db       -$22, $01, -$5A 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
LetterOuter3d_4 
                    db       $00, $01, -$5A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $5A, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $00, $01, -$5A, hi(SMVB_continue_yStays_single), lo(SMVB_continue_yStays_single) ; y is $00 
                    db       $1E, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, -$5A, hi(SMVB_startDraw_newY_eq_oldX_single), lo(SMVB_startDraw_newY_eq_oldX_single) ; y was $00, now SHIFT 
                    db       $00, $01, $5A, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $00, $01, -$5A, hi(SMVB_continue_yStays_single), lo(SMVB_continue_yStays_single) ; y is $00 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
LetterOuter3d_5 
                    db       -$22, $01, -$5A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$23, $01, $5A, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $23, $01, $5A 
                    db       $22, $01, -$5A 
                    db       $1B, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$23, $01, -$5A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$22, $01, $5A, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $22, $01, $5A 
                    db       $23, $01, -$5A 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
LetterOuter3d_6 
                    db       -$3E, $01, -$5A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$3F, $01, $5A, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $3F, $01, $5A 
                    db       $3E, $01, -$5A 
                    db       $15, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$3F, $01, -$5A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$3E, $01, $5A, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $3E, $01, $5A 
                    db       $3F, $01, -$5A 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
LetterOuter3d_7 
                    db       -$54, $01, -$5A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$52, $01, $5A, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $52, $01, $5A 
                    db       $54, $01, -$5A 
                    db       $0A, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$52, $01, -$5A, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$54, $01, $5A, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $54, $01, $5A 
                    db       $52, $01, -$5A 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
LetterOuter3d_8 
                    db       -$5A, $01, -$5A, hi(SMVB_startDraw_yEqx_single), lo(SMVB_startDraw_yEqx_single) ; y is -$5A 
                    db       -$5A, $01, $5A, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $5A, $01, $5A 
                    db       $5A, $01, -$5A 
                    db       -$5A, $01, -$5A , hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       -$5A, $01, $5A , hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $5A, $01, $5A 
                    db       $5A, $01, -$5A 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
