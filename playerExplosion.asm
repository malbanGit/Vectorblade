; bank 3
EX_COUNT            =        1 
ANGLE_ADD           =        5                            ; how many dots per "circle" (63/ x) 
ANGLE_ROT_ADD       =        2                            ; how fast inner rotating 
SPEED_ADD           =        1                            ; how fast expanding 
;
tmp8Count           =        tmp4_tmp 
tmp8                =        tmp3_tmp 
tmp16_pos           =        tmp1_tmp 
tmp16_neg           =        tmp_debug 
;***************************************************************************
;***************************************************************************
;***************************************************************************
AnimList: 
                    DW       Triangle1                    ; list of all single vectorlists in this 
                    DW       Triangle2                    ; list of all single vectorlists in this 
                    DW       Line1 
                    DW       Line2 
                    DW       Line3 
                    DW       Square1 
                    DW       Square2 
                    DW       Square3 
Triangle1: 
                    DB       $FF, +$24, +$40              ; pattern, y, x 
                    DB       $FF, -$46, +$18              ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Triangle2: 
                    DB       $FF, -$32, -$35              ; pattern, y, x 
                    DB       $FF, +$3E, -$28              ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Line1: 
                    DB       $FF, +$24, +$40              ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Line2: 
                    DB       $FF, +$3E, -$28              ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Line3: 
                    DB       $FF, +$0E, +$0F              ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Square1: 
                    DB       $FF, +$01, +$22              ; pattern, y, x 
                    DB       $FF, +$0E, +$0F              ; pattern, y, x 
                    DB       $FF, -$27, -$05              ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Square2: 
                    DB       $FF, +$0E, +$25              ; pattern, y, x 
                    DB       $FF, -$17, -$17              ; pattern, y, x 
                    DB       $FF, -$27, -$0E              ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Square3: 
                    DB       $FF, -$14, +$31              ; pattern, y, x 
                    DB       $FF, -$24, -$22              ; pattern, y, x 
                    DB       $FF, +$08, -$0F              ; pattern, y, x 
                    DB       $FF, +$30, +$00              ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
