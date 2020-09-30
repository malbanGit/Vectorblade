; queen as BigBug
queenDefinition 
                    dw       0                            ;not used MUST be zero to identify a bug enemy 
                    db       250                          ; hp 
                    dw       QueenAnim 
                    db       1+128                        ;1+128 ; bullet speed and is missile 
QueenAnim 
                    fdb      QueenTentacle_0              ; list of all single vectorlists in this 
                    fdb      QueenTentacle_1 
                    fdb      QueenTentacle_2 
                    fdb      QueenTentacle_3 
                    fdb      QueenTentacle_2 
                    fdb      QueenTentacle_1 
                    DW       0 
QueenTentacle_0 
                    db       $35, $01, $1E, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $36, $01, $53, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $21, $01, $5F 
                    db       -$46, $01, -$68, hi(SMVB50_startMove_double), lo(SMVB50_startMove_double) 
                    db       $35, $01, -$1E, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $36, $01, -$53, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $21, $01, -$5F 
                    db       -$46, $01, $68, hi(SMVB50_startMove_double), lo(SMVB50_startMove_double) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
QueenTentacle_1 
                    db       $35, $01, $1E, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $36, $01, $53, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$05, $01, $53 
                    db       -$33, $01, -$62, hi(SMVB50_startMove_double), lo(SMVB50_startMove_double) 
                    db       $35, $01, -$1E, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $36, $01, -$53, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$0B, $01, -$4B 
                    db       -$30, $01, $5E, hi(SMVB50_startMove_double), lo(SMVB50_startMove_double) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
QueenTentacle_2 
                    db       $35, $01, $1E, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $36, $01, $53, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$1F, $01, $4D 
                    db       -$26, $01, -$5F, hi(SMVB50_startMove_double), lo(SMVB50_startMove_double) 
                    db       $35, $01, -$1E, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $36, $01, -$53, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$1F, $01, -$45 
                    db       -$26, $01, $5B, hi(SMVB50_startMove_double), lo(SMVB50_startMove_double) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
QueenTentacle_3 
                    db       $35, $01, $1E, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $2A, $01, $53, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$23, $01, $49 
                    db       -$1E, $01, -$5D, hi(SMVB50_startMove_double), lo(SMVB50_startMove_double) 
                    db       $35, $01, -$1E, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $25, $01, -$54, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$20, $01, -$44 
                    db       -$1D, $01, $5B, hi(SMVB50_startMove_double), lo(SMVB50_startMove_double) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
QueenHead 
                    db       $0D, $01, -$28, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$3B, $01, $0E, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $00, $01, $34, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $3B, $01, $0E, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, -$50, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0B, $01, -$1F, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$13, $01, -$13, hi(SMVB50_continue7_single), lo(SMVB50_continue7_single) 
                    db       -$1F, $01, -$0B 
                    db       -$57, $01, $2A 
                    db       -$27, $01, -$0D 
                    db       -$19, $01, $0B 
                    db       -$16, $01, $18 
                    db       $17, $01, -$09 
                    db       $11, $01, $04, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $12, $01, $0C 
                    db       $00, $01, $3C, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $07, $01, -$1E, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$07, $01, -$1E, hi(SMVB50_continue3_single), lo(SMVB50_continue3_single) 
                    db       $1C, $01, -$1D 
                    db       $43, $01, $21 
                    db       $00, $01, $1A, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       -$43, $01, $21, hi(SMVB50_continue7_single), lo(SMVB50_continue7_single) 
                    db       -$1C, $01, -$1D 
                    db       -$12, $01, $0C 
                    db       -$11, $01, $04 
                    db       -$17, $01, -$09 
                    db       $16, $01, $18 
                    db       $19, $01, $0B 
                    db       $27, $01, -$0D, hi(SMVB50_continue6_single), lo(SMVB50_continue6_single) 
                    db       $57, $01, $2A 
                    db       $1F, $01, -$0B 
                    db       $13, $01, -$13 
                    db       -$0B, $01, -$1F 
                    db       -$0D, $01, -$28 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
QueenHead2 
                    db       $0D, $01, -$28, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$3B, $01, $0E, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $00, $01, $34, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $3B, $01, $0E, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, -$50, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0B, $01, -$1F, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$13, $01, -$13, hi(SMVB50_continue7_single), lo(SMVB50_continue7_single) 
                    db       -$1F, $01, -$0B 
                    db       -$57, $01, $2A 
                    db       -$27, $01, -$07 
                    db       -$1B, $01, $13 
                    db       -$14, $01, $18 
                    db       $15, $01, -$09 
                    db       $13, $01, -$04, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $12, $01, $06 
                    db       $00, $01, $3C, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $07, $01, -$1E, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$07, $01, -$1E, hi(SMVB50_continue3_single), lo(SMVB50_continue3_single) 
                    db       $1C, $01, -$1D 
                    db       $43, $01, $21 
                    db       $00, $01, $1A, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       -$43, $01, $21, hi(SMVB50_continue7_single), lo(SMVB50_continue7_single) 
                    db       -$1C, $01, -$1D 
                    db       -$12, $01, $06 
                    db       -$13, $01, -$04 
                    db       -$15, $01, -$09 
                    db       $14, $01, $18 
                    db       $1B, $01, $13 
                    db       $27, $01, -$07, hi(SMVB50_continue6_single), lo(SMVB50_continue6_single) 
                    db       $57, $01, $2A 
                    db       $1F, $01, -$0B 
                    db       $13, $01, -$13 
                    db       -$0B, $01, -$1F 
                    db       -$0D, $01, -$28 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
QueenHead3 
                    db       $0D, $01, -$28, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$3B, $01, $0E, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $00, $01, $34, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $3B, $01, $0E, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, -$50, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0B, $01, -$1F, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$13, $01, -$13, hi(SMVB50_continue7_single), lo(SMVB50_continue7_single) 
                    db       -$1F, $01, -$0B 
                    db       -$57, $01, $2A 
                    db       -$29, $01, $03 
                    db       -$19, $01, $0F 
                    db       -$14, $01, $20 
                    db       $14, $01, -$09 
                    db       $12, $01, -$07, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $14, $01, -$05 
                    db       $00, $01, $3C, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $07, $01, -$1E, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$07, $01, -$1E, hi(SMVB50_continue3_single), lo(SMVB50_continue3_single) 
                    db       $1C, $01, -$1D 
                    db       $43, $01, $21 
                    db       $00, $01, $1A, hi(SMVB50_continue_double), lo(SMVB50_continue_double) 
                    db       -$43, $01, $21, hi(SMVB50_continue7_single), lo(SMVB50_continue7_single) 
                    db       -$1C, $01, -$1D 
                    db       -$14, $01, -$05 
                    db       -$12, $01, -$07 
                    db       -$14, $01, -$09 
                    db       $14, $01, $20 
                    db       $19, $01, $0F 
                    db       $29, $01, $03, hi(SMVB50_continue6_single), lo(SMVB50_continue6_single) 
                    db       $57, $01, $2A 
                    db       $1F, $01, -$0B 
                    db       $13, $01, -$13 
                    db       -$0B, $01, -$1F 
                    db       -$0D, $01, -$28 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
