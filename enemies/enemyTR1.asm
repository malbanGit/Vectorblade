enemyTR1Definition1 
enemyTR1Definition_1 
                    dw       EnemyTR1Angle8Table 
                    db       3 
                    dw       EnemyTR1WaitAnim 
                    db       1,0                          ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
enemyTR1Definition_1_fast 
                    dw       EnemyTR1Angle8Table 
                    db       10 
                    dw       EnemyTR1WaitAnim 
                    db       3,0                          ;ccnnnnnn , cc = number of clones+1 1-4, nnnnn wait bewteen clones 0-63 
EnemyTR1WaitAnim 
                    DW       Ferengi_0                    ; list of all single vectorlists in this 
                    DW       Ferengi_8 
                    DW       Ferengi_9 
                    DW       Ferengi_8 
                    DW       0 
EnemyTR1Angle8Table 
                    DW       Ferengi_0                    ; list of all single vectorlists in this 
                    DW       Ferengi_1 
                    DW       Ferengi_2 
                    DW       Ferengi_3 
                    DW       Ferengi_4 
                    DW       Ferengi_5 
                    DW       Ferengi_6 
                    DW       Ferengi_7 
                    DW       0 
Ferengi_0 
                    db       $02, $01, $2B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $29, $01, $34, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $2F, $01, $21 
                    db       $32, $01, $0F 
                    db       $2E, $01, -$17 
                    db       -$2E, $01, -$14 
                    db       $00, $01, -$42 
                    db       $4A, $01, -$0F 
                    db       $35, $01, $18, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $25, $01, -$18 
                    db       -$09, $01, -$13 
                    db       $09, $01, -$13 
                    db       -$25, $01, -$18 
                    db       -$35, $01, $18 
                    db       -$4A, $01, -$0F 
                    db       $00, $01, -$42, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $2E, $01, -$14 
                    db       -$2E, $01, -$17 
                    db       -$32, $01, $0F 
                    db       -$2F, $01, $21 
                    db       -$29, $01, $34 
                    db       -$02, $01, $2B 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Ferengi_1 
                    db       $2D, $01, -$6B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$1E, $01, $20, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$06, $01, $41, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $09, $01, $38 
                    db       $18, $01, $2E 
                    db       $32, $01, $12 
                    db       -$13, $01, -$31 
                    db       $2E, $01, -$2E 
                    db       $3F, $01, $2A 
                    db       $15, $01, $38, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $2C, $01, $09 
                    db       $06, $01, -$15 
                    db       $15, $01, -$06 
                    db       -$09, $01, -$2C 
                    db       -$38, $01, -$15 
                    db       -$2A, $01, -$3F 
                    db       $2E, $01, -$2E, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $31, $01, $13 
                    db       -$12, $01, -$32 
                    db       -$2E, $01, -$18 
                    db       -$38, $01, -$09 
                    db       -$41, $01, $06 
                    db       -$20, $01, $1E 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Ferengi_2 
                    db       $4C, $01, -$4C, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$2B, $01, $02, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$34, $01, $29, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$21, $01, $2F 
                    db       -$0F, $01, $32 
                    db       $17, $01, $2E 
                    db       $14, $01, -$2E 
                    db       $42, $01, $00 
                    db       $0F, $01, $4A 
                    db       -$18, $01, $35, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $18, $01, $25 
                    db       $13, $01, -$09 
                    db       $13, $01, $09 
                    db       $18, $01, -$25 
                    db       -$18, $01, -$35 
                    db       $0F, $01, -$4A 
                    db       $42, $01, $00, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $14, $01, $2E 
                    db       $17, $01, -$2E 
                    db       -$0F, $01, -$32 
                    db       -$21, $01, -$2F 
                    db       -$34, $01, -$29 
                    db       -$2B, $01, -$02 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Ferengi_3 
                    db       $56, $01, -$23, hi(SMVB_continue_tripple), lo(SMVB_continue_tripple) 
                    db       -$20, $01, -$1E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$41, $01, -$06, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$38, $01, $09 
                    db       -$2E, $01, $18 
                    db       -$12, $01, $32 
                    db       $31, $01, -$13 
                    db       $2E, $01, $2E 
                    db       -$2A, $01, $3F 
                    db       -$38, $01, $15, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$09, $01, $2C 
                    db       $15, $01, $06 
                    db       $06, $01, $15 
                    db       $2C, $01, -$09 
                    db       $15, $01, -$38 
                    db       $3F, $01, -$2A 
                    db       $2E, $01, $2E, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$13, $01, $31 
                    db       $32, $01, -$12 
                    db       $18, $01, -$2E 
                    db       $09, $01, -$38 
                    db       -$06, $01, -$41 
                    db       -$1E, $01, -$20 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Ferengi_4 
                    db       $65, $01, $00, hi(SMVB_continue_tripple), lo(SMVB_continue_tripple) 
                    db       -$02, $01, -$2B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$29, $01, -$34, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$2F, $01, -$21 
                    db       -$32, $01, -$0F 
                    db       -$2E, $01, $17 
                    db       $2E, $01, $14 
                    db       $00, $01, $42 
                    db       -$4A, $01, $0F 
                    db       -$35, $01, -$18, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$25, $01, $18 
                    db       $09, $01, $13 
                    db       -$09, $01, $13 
                    db       $25, $01, $18 
                    db       $35, $01, -$18 
                    db       $4A, $01, $0F 
                    db       $00, $01, $42, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$2E, $01, $14 
                    db       $2E, $01, $17 
                    db       $32, $01, -$0F 
                    db       $2F, $01, -$21 
                    db       $29, $01, -$34 
                    db       $02, $01, -$2B 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Ferengi_5 
                    db       $56, $01, $23, hi(SMVB_continue_tripple), lo(SMVB_continue_tripple) 
                    db       $1E, $01, -$20, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $06, $01, -$41, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$09, $01, -$38 
                    db       -$18, $01, -$2E 
                    db       -$32, $01, -$12 
                    db       $13, $01, $31 
                    db       -$2E, $01, $2E 
                    db       -$3F, $01, -$2A 
                    db       -$15, $01, -$38, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$2C, $01, -$09 
                    db       -$06, $01, $15 
                    db       -$15, $01, $06 
                    db       $09, $01, $2C 
                    db       $38, $01, $15 
                    db       $2A, $01, $3F 
                    db       -$2E, $01, $2E, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$31, $01, -$13 
                    db       $12, $01, $32 
                    db       $2E, $01, $18 
                    db       $38, $01, $09 
                    db       $41, $01, -$06 
                    db       $20, $01, -$1E 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Ferengi_6 
                    db       $4C, $01, $4C, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $2B, $01, -$02, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $34, $01, -$29, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $21, $01, -$2F 
                    db       $0F, $01, -$32 
                    db       -$17, $01, -$2E 
                    db       -$14, $01, $2E 
                    db       -$42, $01, $00 
                    db       -$0F, $01, -$4A 
                    db       $18, $01, -$35, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$18, $01, -$25 
                    db       -$13, $01, $09 
                    db       -$13, $01, -$09 
                    db       -$18, $01, $25 
                    db       $18, $01, $35 
                    db       -$0F, $01, $4A 
                    db       -$42, $01, $00, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$14, $01, -$2E 
                    db       -$17, $01, $2E 
                    db       $0F, $01, $32 
                    db       $21, $01, $2F 
                    db       $34, $01, $29 
                    db       $2B, $01, $02 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Ferengi_7 
                    db       $2D, $01, $6B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $20, $01, $1E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $41, $01, $06, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $38, $01, -$09 
                    db       $2E, $01, -$18 
                    db       $12, $01, -$32 
                    db       -$31, $01, $13 
                    db       -$2E, $01, -$2E 
                    db       $2A, $01, -$3F 
                    db       $38, $01, -$15, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $09, $01, -$2C 
                    db       -$15, $01, -$06 
                    db       -$06, $01, -$15 
                    db       -$2C, $01, $09 
                    db       -$15, $01, $38 
                    db       -$3F, $01, $2A 
                    db       -$2E, $01, -$2E, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $13, $01, -$31 
                    db       -$32, $01, $12 
                    db       -$18, $01, $2E 
                    db       -$09, $01, $38 
                    db       $06, $01, $41 
                    db       $1E, $01, $20 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Ferengi_8 
                    db       $02, $01, $2B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $29, $01, $34, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $2F, $01, $21 
                    db       $32, $01, $0F 
                    db       $29, $01, -$17 
                    db       -$29, $01, -$14 
                    db       $00, $01, -$42 
                    db       $4A, $01, -$0F 
                    db       $35, $01, $18, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $25, $01, -$18 
                    db       -$09, $01, -$13 
                    db       $09, $01, -$13 
                    db       -$25, $01, -$18 
                    db       -$35, $01, $18 
                    db       -$4A, $01, -$0F 
                    db       $00, $01, -$42, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $29, $01, -$14 
                    db       -$29, $01, -$17 
                    db       -$32, $01, $0F 
                    db       -$2F, $01, $21 
                    db       -$29, $01, $34 
                    db       -$02, $01, $2B 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Ferengi_9 
                    db       $02, $01, $2B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $29, $01, $34, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $2F, $01, $21 
                    db       $32, $01, $0F 
                    db       $24, $01, -$17 
                    db       -$24, $01, -$14 
                    db       $00, $01, -$42 
                    db       $4A, $01, -$0F 
                    db       $35, $01, $18, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $25, $01, -$18 
                    db       -$09, $01, -$13 
                    db       $09, $01, -$13 
                    db       -$25, $01, -$18 
                    db       -$35, $01, $18 
                    db       -$4A, $01, -$0F 
                    db       $00, $01, -$42, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $24, $01, -$14 
                    db       -$24, $01, -$17 
                    db       -$32, $01, $0F 
                    db       -$2F, $01, $21 
                    db       -$29, $01, $34 
                    db       -$02, $01, $2B 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
