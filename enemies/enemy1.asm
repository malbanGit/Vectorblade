enemy1Definition 
                    dw       Enemy1Angle8Table 
                    db       1                            ; HP 
                    dw       Enemy1AnimTable 
                    db       2,0                          ;0+TYPE_CAN_CLONE, 64+60; ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
; 2 clone + 60 delay
enemy1Definition2 
                    dw       Enemy1Angle8Table 
                    db       2 
                    dw       Enemy1AnimTable 
                    db       2,0                          ;0+TYPE_CAN_CLONE, 64+60; ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
; 2 clone + 60 delay
enemy1Definition3 
                    dw       Enemy1Angle8Table 
                    db       5 
                    dw       Enemy1AnimTable 
                    db       3,0                          ;0+TYPE_CAN_CLONE, 64+60; ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
; 2 clone + 60 delay
enemy1Definition_dw 
                    dw       Enemy1Angle8Table 
                    db       2                            ; hp 
                    dw       Enemy1AnimTable 
                    db       2,TYPE_DONT_WAIT 
Enemy1AnimTable 
                    dw       Enemy1_8 
                    dw       Enemy1_0 
                    dw       Enemy1_9 
                    dw       Enemy1_0 
                    dw       0 
Enemy1Angle8Table 
                    DW       Enemy1_0                     ; list of all single vectorlists in this 
                    DW       Enemy1_1 
                    DW       Enemy1_2 
                    DW       Enemy1_3 
                    DW       Enemy1_4 
                    DW       Enemy1_5 
                    DW       Enemy1_6 
                    DW       Enemy1_7 
                    DW       0 
Enemy1Right                                               ;        used for super bomb explosion 
Enemy1_0 
                    db       $68, $01, $16, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $24, $01, -$0D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $25, $01, $1B, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $00, $01, -$48 
                    db       -$25, $01, $1B 
                    db       -$24, $01, -$0D 
                    db       $56, $01, -$57 
                    db       -$5F, $01, -$09 , hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       -$5F, $01, $09 , hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $24, $01, $40, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$24, $01, $24 
                    db       $00, $01, $12 
                    db       $24, $01, $24 
                    db       -$24, $01, $40 
                    db       $5F, $01, $09 
                    db       $5F, $01, -$09 
                    db       -$56, $01, -$57, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Enemy1_1 
                    db       $56, $01, $16, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $23, $01, $10, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $05, $01, $2E, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $35, $01, -$35 
                    db       -$2E, $01, -$05 
                    db       -$10, $01, -$23 
                    db       $7A, $01, $00 
                    db       -$3C, $01, -$4B 
                    db       -$4B, $01, -$3C 
                    db       -$12, $01, $46, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$34, $01, $00 
                    db       -$0D, $01, $0D 
                    db       $00, $01, $34 
                    db       -$46, $01, $12 
                    db       $3C, $01, $4B 
                    db       $4B, $01, $3C 
                    db       $00, $01, -$7A, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Enemy1_2 
                    db       $49, $01, $09, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $0D, $01, $24, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1B, $01, $25, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $48, $01, $00 
                    db       -$1B, $01, -$25 
                    db       $0D, $01, -$24 
                    db       $57, $01, $56 
                    db       $09, $01, -$5F 
                    db       -$09, $01, -$5F 
                    db       -$40, $01, $24, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$24, $01, -$24 
                    db       -$12, $01, $00 
                    db       -$24, $01, $24 
                    db       -$40, $01, -$24 
                    db       -$09, $01, $5F 
                    db       $09, $01, $5F 
                    db       $57, $01, -$56, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Enemy1_3 
                    db       $49, $01, -$09, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$10, $01, $23, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$2E, $01, $05, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $35, $01, $35 
                    db       $05, $01, -$2E 
                    db       $23, $01, -$10 
                    db       $00, $01, $7A 
                    db       $4B, $01, -$3C 
                    db       $3C, $01, -$4B 
                    db       -$46, $01, -$12, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $00, $01, -$34 
                    db       -$0D, $01, -$0D 
                    db       -$34, $01, $00 
                    db       -$12, $01, -$46 
                    db       -$4B, $01, $3C 
                    db       -$3C, $01, $4B 
                    db       $7A, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Enemy1_4 
                    db       $56, $01, -$16, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$24, $01, $0D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$25, $01, -$1B, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $00, $01, $48 
                    db       $25, $01, -$1B 
                    db       $24, $01, $0D 
                    db       -$56, $01, $57 
                    db       $5F, $01, $09 
                    db       $5F, $01, -$09 
                    db       -$24, $01, -$40, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $24, $01, -$24 
                    db       $00, $01, -$12 
                    db       -$24, $01, -$24 
                    db       $24, $01, -$40 
                    db       -$5F, $01, -$09 
                    db       -$5F, $01, $09 
                    db       $56, $01, $57, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Enemy1_5 
                    db       $68, $01, -$16, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$23, $01, -$10, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$05, $01, -$2E, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$35, $01, $35 
                    db       $2E, $01, $05 
                    db       $10, $01, $23 
                    db       -$7A, $01, $00, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       $3C, $01, $4B, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $4B, $01, $3C 
                    db       $12, $01, -$46 
                    db       $34, $01, $00 
                    db       $0D, $01, -$0D 
                    db       $00, $01, -$34 
                    db       $46, $01, -$12 
                    db       -$3C, $01, -$4B, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$4B, $01, -$3C 
                    db       $00, $01, $7A 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Enemy1_6 
                    db       $75, $01, -$09, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$0D, $01, -$24, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1B, $01, -$25, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$48, $01, $00 
                    db       $1B, $01, $25 
                    db       -$0D, $01, $24 
                    db       -$57, $01, -$56 
                    db       -$09, $01, $5F 
                    db       $09, $01, $5F 
                    db       $40, $01, -$24, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $24, $01, $24 
                    db       $12, $01, $00 
                    db       $24, $01, -$24 
                    db       $40, $01, $24 
                    db       $09, $01, -$5F 
                    db       -$09, $01, -$5F 
                    db       -$57, $01, $56, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Enemy1_7 
                    db       $75, $01, $09, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $10, $01, -$23, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $2E, $01, -$05, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$35, $01, -$35 
                    db       -$05, $01, $2E 
                    db       -$23, $01, $10 
                    db       $00, $01, -$7A 
                    db       -$4B, $01, $3C 
                    db       -$3C, $01, $4B 
                    db       $46, $01, $12, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $00, $01, $34 
                    db       $0D, $01, $0D 
                    db       $34, $01, $00 
                    db       $12, $01, $46 
                    db       $4B, $01, -$3C 
                    db       $3C, $01, -$4B 
                    db       -$7A, $01, $00, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Enemy1_8 
                    db       $68, $01, $16, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $24, $01, -$0D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $25, $01, $1B, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $00, $01, -$48 
                    db       -$25, $01, $1B 
                    db       -$24, $01, -$0D 
                    db       $56, $01, -$57 
                    db       -$5F, $01, -$09 , hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       -$5F, $01, $09 , hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $24, $01, $40, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$24, $01, $24 
                    db       $00, $01, $12 
                    db       $24, $01, $24 
                    db       -$2F, $01, $44 
                    db       $6A, $01, $10 
                    db       $6E, $01, -$0C 
                    db       -$65, $01, -$5F, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Enemy1_9 
                    db       $68, $01, $16, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $24, $01, -$0D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $25, $01, $1B, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $00, $01, -$48 
                    db       -$25, $01, $1B 
                    db       -$24, $01, -$0D 
                    db       $65, $01, -$60 
                    db       -$6E, $01, -$06, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       -$6A, $01, $0B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $2F, $01, $44, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$24, $01, $24 
                    db       $00, $01, $12 
                    db       $24, $01, $24 
                    db       -$24, $01, $40 
                    db       $5F, $01, $09 
                    db       $5F, $01, -$09 
                    db       -$56, $01, -$57, hi(SMVB_continue_yd6_single), lo(SMVB_continue_yd6_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
