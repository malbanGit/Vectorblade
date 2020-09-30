; one swarm element for explosion with "normal" explode!
Swarmer 
                    DW       Swarmer_0                    ; list of all single vectorlists in this 
 if  DRAW_SMART=1 
                    DW       Swarmer_1 
                    DW       Swarmer_2 
                    DW       Swarmer_1 
                    DW       0 
 endif  
Swarmer_0 
                    db       -$15, $01, $44, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $44, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$1F, $01, -$39, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $2E, $01, $07 
                    db       $00, $01, -$24 
                    db       -$2E, $01, $07 
                    db       $1F, $01, -$39 
                    db       -$44, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $15, $01, $44, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $f0, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
 if  DRAW_SMART=1 
Swarmer_1 
                    db       -$16, $01, $38, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $7E, $01, $00, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$1A, $01, -$2D 
                    db       $2D, $01, $07 
                    db       $00, $01, -$24 
                    db       -$2D, $01, $07 
                    db       $1A, $01, -$2D 
                    db       -$7E, $01, $00 
                    db       $16, $01, $38, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $f0, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Swarmer_2 
                    db       -$17, $01, $2D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $78, $01, $00, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$17, $01, -$22 
                    db       $2A, $01, $07 
                    db       $00, $01, -$24 
                    db       -$2A, $01, $07 
                    db       $17, $01, -$22 
                    db       -$78, $01, $00 
                    db       $17, $01, $2D, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $f0, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
 endif  
