enemy3Definition 
                    dw       Enemy3Angle8Table 
                    db       17                           ; hp 
                    dw       Enemy3WaitAnim 
                    db       0,TYPE_DIRECT_WAIT+TYPE_DONT_SHOOT+TYPE_DONT_ATTACK+TYPE_SHIELD 
Enemy3WaitAnim 
Enemy3Angle8Table 
                    DW       Enemy3_0                     ; list of all single vectorlists in this 
                    DW       Enemy3_0                     ; list of all single vectorlists in this 
                    DW       Enemy3_0                     ; list of all single vectorlists in this 
                    DW       Enemy3_0                     ; list of all single vectorlists in this 
                    DW       Enemy3_0                     ; list of all single vectorlists in this 
                    DW       Enemy3_0                     ; list of all single vectorlists in this 
                    DW       Enemy3_0                     ; list of all single vectorlists in this 
                    DW       Enemy3_0                     ; list of all single vectorlists in this 
                    DW       0 
Enemy3_0 
                    db       $03, $01, $15, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0A, $01, $1D, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $3F, $01, $3B 
                    db       $19, $01, -$0D 
                    db       -$20, $01, -$47 
                    db       $67, $01, -$0C 
                    db       $09, $01, -$0D 
                    db       -$09, $01, -$0D 
                    db       -$67, $01, -$0C, hi(SMVB_continue6_single), lo(SMVB_continue6_single) 
                    db       $20, $01, -$47 
                    db       -$19, $01, -$0D 
                    db       -$3F, $01, $3B 
                    db       $0A, $01, $1D 
                    db       -$03, $01, $15 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
