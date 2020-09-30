                    include  "enemies/enemySW1.asm"
                    include  "enemies/enemySW2.asm"
                    include  "enemies/enemySW3.asm"       ; shield
                    include  "enemies/enemySW4.asm"
                    include  "enemies/enemyTR1.asm"
                    include  "enemies/enemyTR2.asm"
                    include  "enemies/enemyTR3.asm"
DebrisBombList 
                    DW       DebrisBomb_0                 ; list of all single vectorlists in this 
                    DW       DebrisBomb_1 
                    DW       DebrisBomb_2 
                    DW       DebrisBomb_1 
                    DW       0 
DebrisBomb_0 
                    db       $4C, $01, $10, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $45, $01, $13, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$35, $01, -$2D, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $3F, $01, -$59 
                    db       -$60, $01, $36 
                    db       -$1F, $01, -$47 
                    db       -$12, $01, $50 
                    db       -$37, $01, $04 
                    db       $45, $01, $2E 
                    db       -$24, $01, $44, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $3E, $01, -$19 
                    db       $30, $01, $25 
                    db       -$1A, $01, -$4B 
                    db       $f0, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
DebrisBomb_1 
                    db       $46, $01, $0C, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $48, $01, $17, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$32, $01, -$28, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $36, $01, -$45 
                    db       -$51, $01, $27 
                    db       -$1B, $01, -$3F 
                    db       -$0B, $01, $4A 
                    db       -$2D, $01, $02 
                    db       $35, $01, $23 
                    db       -$20, $01, $39, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $33, $01, -$14 
                    db       $26, $01, $1D 
                    db       -$17, $01, -$42 
                    db       $f0, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
DebrisBomb_2 
                    db       $7F, $01, $0C, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $47, $01, $1E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$31, $01, -$24, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $37, $01, -$36 
                    db       -$44, $01, $22 
                    db       -$18, $01, -$38 
                    db       -$06, $01, $3F 
                    db       -$25, $01, $01 
                    db       $2B, $01, $1A 
                    db       -$21, $01, $2E, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $2C, $01, -$0E 
                    db       $1F, $01, $13 
                    db       -$17, $01, -$39 
                    db       $f0, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
FallingDiamnond 
                    db       $7f, $01, -$2B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, $3B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$7E, $01, $1C , hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $7E, $01, $1C 
                    db       $00, $01, -$38 
                    db       $30, $01, $0A 
                    db       $00, $01, $24 
                    db       -$30, $01, $0A 
                    db       $00, $01, $3B 
                    db       -$7E, $01, -$57 , hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $7E, $01, -$57 
                    db       $30, $01, $27 
                    db       $00, $01, $60 
                    db       -$30, $01, $27 
                    db       $f0, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
