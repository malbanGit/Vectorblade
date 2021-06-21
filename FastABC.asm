; bank 1
ABC_8x5 
                    DW       ABC_8x5_27                   ; SPACE 
                    DW       ABC_8x5_28                   ; ! 
                    DW       ABC_8x5_27                   ; SPACE 
                    DW       ABC_8x5_27                   ; SPACE 
                    DW       ABC_8x5_27                   ; SPACE 
                    DW       ABC_8x5_27                   ; SPACE 
                    DW       ABC_8x5_27                   ; SPACE 
                    DW       ABC_8x5_27                   ; SPACE 
                    DW       ABC_8x5_27                   ; SPACE 
                    DW       ABC_8x5_27                   ; SPACE 
                    DW       ABC_8x5_27                   ; SPACE 
                    DW       ABC_8x5_27                   ; SPACE 
                    DW       ABC_8x5_27                   ; SPACE 
                    DW       ABC_8x5_27                   ; SPACE 
                    DW       ABC_8x5_26                   ; . 
                    DW       ABC_8x5_27                   ; SPACE 
NumberList_8x5 
                    DW       ABC_8x5_38                   ; 0 
                    DW       ABC_8x5_29                   ; 1 
                    DW       ABC_8x5_30                   ; 2 
                    DW       ABC_8x5_31                   ; 3 
                    DW       ABC_8x5_32                   ; 4 
                    DW       ABC_8x5_33                   ; 5 
                    DW       ABC_8x5_34                   ; 6 
                    DW       ABC_8x5_35                   ; 7 
                    DW       ABC_8x5_36                   ; 8 
                    DW       ABC_8x5_37                   ; 9 
                    DW       ABC_8x5_27                   ; SPACE 
                    DW       ABC_8x5_27                   ; SPACE 
                    DW       ABC_8x5_27                   ; SPACE 
                    DW       ABC_8x5_27                   ; SPACE 
                    DW       ABC_8x5_27                   ; SPACE 
                    DW       ABC_8x5_27                   ; SPACE 
                    DW       ABC_8x5_27                   ; SPACE 
_abc_8x5 
                    DW       ABC_8x5_0                    ; A 
                    DW       ABC_8x5_1                    ; B 
                    DW       ABC_8x5_2                    ; C 
                    DW       ABC_8x5_3                    ; D 
                    DW       ABC_8x5_4                    ; E 
                    DW       ABC_8x5_5                    ; F 
                    DW       ABC_8x5_6                    ; G 
                    DW       ABC_8x5_7                    ; H 
                    DW       ABC_8x5_8                    ; I 
                    DW       ABC_8x5_9                    ; J 
                    DW       ABC_8x5_10                   ; K 
                    DW       ABC_8x5_11                   ; L 
                    DW       ABC_8x5_12                   ; M 
                    DW       ABC_8x5_13                   ; N 
                    DW       ABC_8x5_14                   ; O 
                    DW       ABC_8x5_15                   ; P 
                    DW       ABC_8x5_16                   ; Q 
                    DW       ABC_8x5_17                   ; R 
                    DW       ABC_8x5_18                   ; S 
                    DW       ABC_8x5_19                   ; T 
                    DW       ABC_8x5_20                   ; U 
                    DW       ABC_8x5_21                   ; V 
                    DW       ABC_8x5_22                   ; W 
                    DW       ABC_8x5_23                   ; X 
                    DW       ABC_8x5_24                   ; Y 
                    DW       ABC_8x5_25                   ; Z 
                    DW       ABC_8x5_26                   ; . 
                    DW       ABC_8x5_27                   ; SPACE 
                    DW       ABC_8x5_28                   ; ! 
                    DW       ABC_8x5_39                   ; <- 
                    DW       ABC_8x5_UNDERSCORE           ; _ 
                    DW       ABC_8x5_40                   ; -> 
                    DW       0 
ABC_8x5_0 
                    db       $27, $01, $00, hi(SMVB16_startDraw_double), lo(SMVB16_startDraw_double) 
                    db       $1A, $01, $1A, hi(SMVB16_continue4_single), lo(SMVB16_continue4_single) 
                    db       -$1A, $01, $1A 
                    db       -$1A, $01, $00 
                    db       -$0D, $01, -$34 
                    db       $0D, $01, $34, hi(SMVB16_startMove_single), lo(SMVB16_startMove_single) 
                    db       -$34, $01, $00, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       $ce, $01, $1A, hi(SMVB16_startMove_newY_eq_oldX_single), lo(SMVB16_startMove_newY_eq_oldX_single) ; y was $00, now $ce 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_1 
                    db       $5B, $01, $00, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       $0D, $01, $1A, hi(SMVB16_continue4_single), lo(SMVB16_continue4_single) 
                    db       -$0D, $01, $1A 
                    db       -$0D, $01, $00 
                    db       -$0D, $01, -$0D 
                    db       $ce, $01, -$27, hi(SMVB16_startMove_newY_eq_oldX_single), lo(SMVB16_startMove_newY_eq_oldX_single) ; y was -$0D, now $ce 
                    db       $0D, $01, $27, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       -$0D, $01, $0D, hi(SMVB16_continue3_single), lo(SMVB16_continue3_single) 
                    db       -$1A, $01, $00 
                    db       -$1A, $01, -$34 
                    db       $00, $01, $4E, hi(SMVB16_startMove_single), lo(SMVB16_startMove_single) 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_2 
                    db       $68, $01, $34, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       -$0D, $01, -$34, hi(SMVB16_startDraw_yd4_single), lo(SMVB16_startDraw_yd4_single) 
                    db       -$5B, $01, $00, hi(SMVB16_continue2_single), lo(SMVB16_continue2_single) 
                    db       $0D, $01, $34 
                    db       -$0D, $01, $1A, hi(SMVB16_startMove_single), lo(SMVB16_startMove_single) 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_3 
                    db       $5B, $01, $00, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       $0D, $01, $27, hi(SMVB16_continue4_single), lo(SMVB16_continue4_single) 
                    db       -$34, $01, $0D 
                    db       -$27, $01, -$0D 
                    db       -$0D, $01, -$27 
                    db       $00, $01, $4E, hi(SMVB16_startMove_single), lo(SMVB16_startMove_single) 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_4 
                    db       $68, $01, $34, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       -$0D, $01, -$34, hi(SMVB16_startDraw_yd4_single), lo(SMVB16_startDraw_yd4_single) 
                    db       -$27, $01, $00, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       $0D, $01, $27, hi(SMVB16_startMove_single), lo(SMVB16_startMove_single) 
                    db       -$0D, $01, -$27, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       -$34, $01, $00, hi(SMVB16_continue2_single), lo(SMVB16_continue2_single) 
                    db       $0D, $01, $34 
                    db       -$0D, $01, $1A, hi(SMVB16_startMove_single), lo(SMVB16_startMove_single) 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_5 
                    db       $34, $01, $00, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       $0D, $01, $27, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       -$0D, $01, -$27, hi(SMVB16_startMove_single), lo(SMVB16_startMove_single) 
                    db       $27, $01, $00, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       $0D, $01, $34, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       -$68, $01, $1A, hi(SMVB16_startMove_yd4_single), lo(SMVB16_startMove_yd4_single) 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_6 
                    db       $5B, $01, $34, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       $0D, $01, $00, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       -$0D, $01, -$34, hi(SMVB16_continue5_single), lo(SMVB16_continue5_single) 
                    db       -$5B, $01, $00 
                    db       $0D, $01, $34 
                    db       $34, $01, $00 
                    db       -$0D, $01, -$1A 
                    db       -$34, $01, $34, hi(SMVB16_startMove_single), lo(SMVB16_startMove_single) 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_7 ;J
                    db       $68, $01, $00, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       -$34, $01, $00, hi(SMVB16_startMove_yd4_single), lo(SMVB16_startMove_yd4_single) 
                    db       $0D, $01, $34, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       $27, $01, $00, hi(SMVB16_startMove_single), lo(SMVB16_startMove_single) 
                    db       -$68, $01, $00, hi(SMVB16_startDraw_yd4_single), lo(SMVB16_startDraw_yd4_single) 
                    db       $ce, $01, $1A, hi(SMVB16_startMove_newY_eq_oldX_single), lo(SMVB16_startMove_newY_eq_oldX_single) ; y was $00, now $ce 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_8 ;I
                    db       $0D, $01, $34, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       -$0D, $01, -$1A, hi(SMVB16_startMove_single), lo(SMVB16_startMove_single) 
                    db       $5B, $01, $00, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       $ce, $01, -$1A, hi(SMVB16_startMove_newY_eq_oldX_single), lo(SMVB16_startMove_newY_eq_oldX_single) ; y was $00, now $ce 
                    db       $0D, $01, $34, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       -$68, $01, $1A, hi(SMVB16_startMove_yd4_single), lo(SMVB16_startMove_yd4_single) 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_9 
                    db       $1A, $01, $00, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       -$1A, $01, $0D, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       $0D, $01, $27, hi(SMVB16_continue2_single), lo(SMVB16_continue2_single) 
                    db       $5B, $01, $00 
                    db       -$0D, $01, -$1A, hi(SMVB16_continue_yd4_single), lo(SMVB16_continue_yd4_single) 
                    db       -$5B, $01, $34, hi(SMVB16_startMove_single), lo(SMVB16_startMove_single) 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_10 
                    db       $68, $01, $00, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       -$34, $01, $00, hi(SMVB16_startMove_yd4_single), lo(SMVB16_startMove_yd4_single) 
                    db       $34, $01, $34, hi(SMVB16_startDraw_yEqx_single), lo(SMVB16_startDraw_yEqx_single) ; y is $34 
                    db       -$34, $01, -$34, hi(SMVB16_startMove_yd4_yEqx_single), lo(SMVB16_startMove_yd4_yEqx_single) ; y is -$34 
                    db       $ee, $01, $34, hi(SMVB16_startDraw_newY_eq_oldX_single), lo(SMVB16_startDraw_newY_eq_oldX_single) ; y was -$34, now $ee 
                    db       $00, $01, $1A, hi(SMVB16_startMove_single), lo(SMVB16_startMove_single) 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_11 
                    db       $68, $01, $00, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       -$68, $01, $00, hi(SMVB16_startDraw_yd4_single), lo(SMVB16_startDraw_yd4_single) 
                    db       $0D, $01, $34, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       -$0D, $01, $1A, hi(SMVB16_startMove_single), lo(SMVB16_startMove_single) 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_12 
                    db       $5B, $01, $00, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       -$1A, $01, $1A, hi(SMVB16_continue_yd4_single), lo(SMVB16_continue_yd4_single) 
                    db       $27, $01, $1A, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       -$68, $01, $00, hi(SMVB16_continue_yd4_single), lo(SMVB16_continue_yd4_single) 
                    db       $ce, $01, $1A, hi(SMVB16_startMove_newY_eq_oldX_single), lo(SMVB16_startMove_newY_eq_oldX_single) ; y was $00, now $ce 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_13 
                    db       $5B, $01, $00, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       -$5B, $01, $34, hi(SMVB16_continue_yd4_single), lo(SMVB16_continue_yd4_single) 
                    db       $68, $01, $00, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       -$68, $01, $1A, hi(SMVB16_startMove_yd4_single), lo(SMVB16_startMove_yd4_single) 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_14 
                    db       $5B, $01, $00, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       $0D, $01, $34, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       -$5B, $01, $00, hi(SMVB16_continue_yd4_single), lo(SMVB16_continue_yd4_single) 
                    db       -$0D, $01, -$34, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       $00, $01, $4E, hi(SMVB16_startMove_single), lo(SMVB16_startMove_single) 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_15 
                    db       $5B, $01, $00, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       $0D, $01, $34, hi(SMVB16_continue3_single), lo(SMVB16_continue3_single) 
                    db       -$27, $01, $00 
                    db       -$0D, $01, -$34 
                    db       $ce, $01, $4E, hi(SMVB16_startMove_newY_eq_oldX_single), lo(SMVB16_startMove_newY_eq_oldX_single) ; y was -$34, now $ce 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_16 
                    db       $5B, $01, $00, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       $0D, $01, $34, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       -$5B, $01, $00, hi(SMVB16_continue_yd4_single), lo(SMVB16_continue_yd4_single) 
                    db       -$0D, $01, -$34, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       $1A, $01, $1A, hi(SMVB16_startMove_yEqx_single), lo(SMVB16_startMove_yEqx_single) ; y is $1A 
                    db       -$1A, $01, $1A, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       $00, $01, $1A, hi(SMVB16_startMove_single), lo(SMVB16_startMove_single) 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_17 
                    db       $5B, $01, $00, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       $0D, $01, $34, hi(SMVB16_continue4_single), lo(SMVB16_continue4_single) 
                    db       -$27, $01, $00 
                    db       -$0D, $01, -$34 
                    db       -$34, $01, $34 
                    db       $00, $01, $1A, hi(SMVB16_startMove_single), lo(SMVB16_startMove_single) 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_18 ; S
                    db       $68, $01, $34, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       -$0D, $01, -$34, hi(SMVB16_startDraw_yd4_single), lo(SMVB16_startDraw_yd4_single) 
                    db       -$27, $01, $00, hi(SMVB16_continue4_single), lo(SMVB16_continue4_single) 
                    db       $0D, $01, $34 
                    db       -$34, $01, $00 
                    db       -$0D, $01, -$34 
                    db       $00, $01, $4E, hi(SMVB16_startMove_single), lo(SMVB16_startMove_single) 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_19 ; T
                    db       $00, $01, $1A, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       $5B, $01, $00, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       $ce, $01, -$1A, hi(SMVB16_startMove_newY_eq_oldX_single), lo(SMVB16_startMove_newY_eq_oldX_single) ; y was $00, now $ce 
                    db       $0D, $01, $34, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       -$68, $01, $1A, hi(SMVB16_startMove_yd4_single), lo(SMVB16_startMove_yd4_single) 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_20 
                    db       $68, $01, $00, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       -$68, $01, $00, hi(SMVB16_startDraw_yd4_single), lo(SMVB16_startDraw_yd4_single) 
                    db       $0D, $01, $34, hi(SMVB16_continue2_single), lo(SMVB16_continue2_single) 
                    db       $5B, $01, $00 
                    db       -$68, $01, $1A, hi(SMVB16_startMove_yd4_single), lo(SMVB16_startMove_yd4_single) 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_21 
                    db       $68, $01, $00, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       -$68, $01, $1A, hi(SMVB16_startDraw_yd4_single), lo(SMVB16_startDraw_yd4_single) 
                    db       $68, $01, $1A, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       -$68, $01, $1A, hi(SMVB16_startMove_yd4_single), lo(SMVB16_startMove_yd4_single) 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_22 
                    db       $68, $01, $00, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       -$68, $01, $00, hi(SMVB16_startDraw_yd4_single), lo(SMVB16_startDraw_yd4_single) 
                    db       $27, $01, $1A, hi(SMVB16_continue3_single), lo(SMVB16_continue3_single) 
                    db       -$27, $01, $1A 
                    db       $68, $01, $00 
                    db       -$68, $01, $1A, hi(SMVB16_startMove_yd4_single), lo(SMVB16_startMove_yd4_single) 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_23 
                    db       $68, $01, $34, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       $00, $01, -$34, hi(SMVB16_startMove_yd4_single), lo(SMVB16_startMove_yd4_single) 
                    db       -$68, $01, $34, hi(SMVB16_startDraw_yd4_single), lo(SMVB16_startDraw_yd4_single) 
                    db       $00, $01, $1A, hi(SMVB16_startMove_single), lo(SMVB16_startMove_single) 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_24 
                    db       $68, $01, $00, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       -$27, $01, $1A, hi(SMVB16_startDraw_yd4_single), lo(SMVB16_startDraw_yd4_single) 
                    db       $27, $01, $1A, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       -$27, $01, -$1A, hi(SMVB16_startMove_single), lo(SMVB16_startMove_single) 
                    db       -$41, $01, $00, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       $ce, $01, $34, hi(SMVB16_startMove_newY_eq_oldX_single), lo(SMVB16_startMove_newY_eq_oldX_single) ; y was $00, now $ce 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_25 
                    db       $5B, $01, $00, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       $0D, $01, $34, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       -$68, $01, -$34, hi(SMVB16_continue_yd4_single), lo(SMVB16_continue_yd4_single) 
                    db       $0D, $01, $34, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       -$0D, $01, $1A, hi(SMVB16_startMove_single), lo(SMVB16_startMove_single) 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_26 
                    db       $0D, $01, $1A, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       $1A, $01, $00, hi(SMVB16_continue3_single), lo(SMVB16_continue3_single) 
                    db       -$0D, $01, -$1A 
                    db       -$1A, $01, $00 
                    db       $ce, $01, $4E, hi(SMVB16_startMove_newY_eq_oldX_single), lo(SMVB16_startMove_newY_eq_oldX_single) ; y was $00, now $ce 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_27 
                    db       $00, $01, $4E, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_28 
                    db       $0D, $01, $1A, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       $1A, $01, $00, hi(SMVB16_continue3_single), lo(SMVB16_continue3_single) 
                    db       -$0D, $01, -$1A 
                    db       -$1A, $01, $00 
                    db       $34, $01, $0D, hi(SMVB16_startMove_single), lo(SMVB16_startMove_single) 
                    db       $ee, $01, $00, hi(SMVB16_startDraw_yStays_single), lo(SMVB16_startDraw_yStays_single) ; y was $34, now $ee 
                    db       -$68, $01, $34, hi(SMVB16_startMove_yd4_single), lo(SMVB16_startMove_yd4_single) 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_29 
                    db       $68, $01, $27, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       -$68, $01, $00, hi(SMVB16_startDraw_yd4_single), lo(SMVB16_startDraw_yd4_single) 
                    db       $ce, $01, $27, hi(SMVB16_startMove_newY_eq_oldX_single), lo(SMVB16_startMove_newY_eq_oldX_single) ; y was $00, now $ce 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_30 
                    db       $5B, $01, $00, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       $0D, $01, $34, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       -$27, $01, $00, hi(SMVB16_continue4_single), lo(SMVB16_continue4_single) 
                    db       -$0D, $01, -$34 
                    db       -$34, $01, $00 
                    db       $0D, $01, $34 
                    db       -$0D, $01, $1A, hi(SMVB16_startMove_single), lo(SMVB16_startMove_single) 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_31 
                    db       $5B, $01, $00, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       $0D, $01, $34, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       -$27, $01, $00, hi(SMVB16_continue2_single), lo(SMVB16_continue2_single) 
                    db       -$0D, $01, -$34 
                    db       $0D, $01, $34, hi(SMVB16_startMove_single), lo(SMVB16_startMove_single) 
                    db       -$34, $01, $00, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       -$0D, $01, -$34, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       $00, $01, $4E, hi(SMVB16_startMove_single), lo(SMVB16_startMove_single) 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_32 
                    db       $00, $01, $34, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       $68, $01, $00, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       $ce, $01, -$34, hi(SMVB16_startMove_yd4_newY_eq_oldX_single), lo(SMVB16_startMove_yd4_newY_eq_oldX_single) ; y was $00, now $ce 
                    db       $ee, $01, $00, hi(SMVB16_startDraw_newY_eq_oldX_single), lo(SMVB16_startDraw_newY_eq_oldX_single) ; y was -$34, now $ee 
                    db       $0D, $01, $34, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       -$41, $01, $1A, hi(SMVB16_startMove_single), lo(SMVB16_startMove_single) 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_33 
                    db       $0D, $01, $34, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       $34, $01, $00, hi(SMVB16_continue4_single), lo(SMVB16_continue4_single) 
                    db       -$0D, $01, -$34 
                    db       $27, $01, $00 
                    db       $0D, $01, $34 
                    db       -$68, $01, $1A, hi(SMVB16_startMove_yd4_single), lo(SMVB16_startMove_yd4_single) 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_34 
                    db       $5B, $01, $00, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       $0D, $01, $34, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       -$34, $01, -$34, hi(SMVB16_startMove_yEqx_single), lo(SMVB16_startMove_yEqx_single) ; y is -$34 
                    db       $0D, $01, $34, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       -$34, $01, $00, hi(SMVB16_continue2_single), lo(SMVB16_continue2_single) 
                    db       -$0D, $01, -$34 
                    db       $00, $01, $4E, hi(SMVB16_startMove_single), lo(SMVB16_startMove_single) 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_35 
                    db       $00, $01, $34, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       $68, $01, $00, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       -$0D, $01, -$34, hi(SMVB16_continue_yd4_single), lo(SMVB16_continue_yd4_single) 
                    db       -$5B, $01, $4E, hi(SMVB16_startMove_single), lo(SMVB16_startMove_single) 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_36 
                    db       $5B, $01, $00, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       $0D, $01, $34, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       -$5B, $01, $00, hi(SMVB16_continue_yd4_single), lo(SMVB16_continue_yd4_single) 
                    db       -$0D, $01, -$34, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       $34, $01, $00, hi(SMVB16_startMove_single), lo(SMVB16_startMove_single) 
                    db       $0D, $01, $34, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       -$41, $01, $1A, hi(SMVB16_startMove_single), lo(SMVB16_startMove_single) 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_37 
                    db       $41, $01, $34, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       -$0D, $01, -$34, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       $27, $01, $00, hi(SMVB16_continue2_single), lo(SMVB16_continue2_single) 
                    db       $0D, $01, $34 
                    db       -$68, $01, $00, hi(SMVB16_continue_yd4_single), lo(SMVB16_continue_yd4_single) 
                    db       $ce, $01, $1A, hi(SMVB16_startMove_newY_eq_oldX_single), lo(SMVB16_startMove_newY_eq_oldX_single) ; y was $00, now $ce 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_38 
                    db       $5B, $01, $00, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       $0D, $01, $34, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       -$5B, $01, $00, hi(SMVB16_continue_yd4_single), lo(SMVB16_continue_yd4_single) 
                    db       -$0D, $01, -$34, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       $00, $01, $4E, hi(SMVB16_startMove_single), lo(SMVB16_startMove_single) 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_39 
                    db       $1A, $01, $0D, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       $ee, $01, -$0D, hi(SMVB16_startDraw_yStays_single), lo(SMVB16_startDraw_yStays_single) ; y was $1A, now $ee 
                    db       $1A, $01, $0D, hi(SMVB16_continue_yStays_single), lo(SMVB16_continue_yStays_single) ; y is $1A 
                    db       -$0D, $01, $27, hi(SMVB16_startMove_single), lo(SMVB16_startMove_single) 
                    db       $ee, $01, -$34, hi(SMVB16_startDraw_yStays_single), lo(SMVB16_startDraw_yStays_single) ; y was -$0D, now $ee 
                    db       $ce, $01, $4E, hi(SMVB16_startMove_newY_eq_oldX_single), lo(SMVB16_startMove_newY_eq_oldX_single) ; y was -$34, now $ce 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
ABC_8x5_40 
                    db       $41, $01, $00, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       -$0D, $01, $34, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       $1A, $01, -$0D, hi(SMVB16_continue_single), lo(SMVB16_continue_single) 
                    db       -$34, $01, $00, hi(SMVB16_startMove_single), lo(SMVB16_startMove_single) 
                    db       $1A, $01, $0D, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       -$34, $01, $1A, hi(SMVB16_startMove_single), lo(SMVB16_startMove_single) 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
BLOW_UP_ABC         EQU      13 
ABC_8x5_UNDERSCORE 
                    db       BLOW_UP_ABC* $00, $01, BLOW_UP_ABC* $04, hi(SMVB16_startDraw_single), lo(SMVB16_startDraw_single) 
                    db       $ce, $01, BLOW_UP_ABC* $02, hi(SMVB16_startMove_yStays_single), lo(SMVB16_startMove_yStays_single) ; y was $00, now $ce 
                    db       $40, $00, $00, hi(SMVB16_lastDraw_rts_stay), lo(SMVB16_lastDraw_rts_stay) 
;720*2 = 1440 data bytes!
circle360x2 
; circle generated 0°-360° in 360 steps (cos, -sin), radius: 127
                    db       $7F, $00                     ; degrees: 0° 
                    db       $7E, $FE                     ; degrees: 1° 
                    db       $7E, $FC                     ; degrees: 2° 
                    db       $7E, $FA                     ; degrees: 3° 
                    db       $7E, $F8                     ; degrees: 4° 
                    db       $7E, $F5                     ; degrees: 5° 
                    db       $7E, $F3                     ; degrees: 6° 
                    db       $7E, $F1                     ; degrees: 7° 
                    db       $7D, $EF                     ; degrees: 8° 
                    db       $7D, $ED                     ; degrees: 9° 
                    db       $7D, $EA                     ; degrees: 10° 
                    db       $7C, $E8                     ; degrees: 11° 
                    db       $7C, $E6                     ; degrees: 12° 
                    db       $7B, $E4                     ; degrees: 13° 
                    db       $7B, $E2                     ; degrees: 14° 
                    db       $7A, $E0                     ; degrees: 15° 
                    db       $7A, $DD                     ; degrees: 16° 
                    db       $79, $DB                     ; degrees: 17° 
                    db       $78, $D9                     ; degrees: 18° 
                    db       $78, $D7                     ; degrees: 19° 
                    db       $77, $D5                     ; degrees: 20° 
                    db       $76, $D3                     ; degrees: 21° 
                    db       $75, $D1                     ; degrees: 22° 
                    db       $74, $CF                     ; degrees: 23° 
                    db       $74, $CD                     ; degrees: 24° 
                    db       $73, $CB                     ; degrees: 25° 
                    db       $72, $C9                     ; degrees: 26° 
                    db       $71, $C7                     ; degrees: 27° 
                    db       $70, $C5                     ; degrees: 28° 
                    db       $6F, $C3                     ; degrees: 29° 
                    db       $6D, $C1                     ; degrees: 30° 
                    db       $6C, $BF                     ; degrees: 31° 
                    db       $6B, $BD                     ; degrees: 32° 
                    db       $6A, $BB                     ; degrees: 33° 
                    db       $69, $B9                     ; degrees: 34° 
                    db       $68, $B8                     ; degrees: 35° 
                    db       $66, $B6                     ; degrees: 36° 
                    db       $65, $B4                     ; degrees: 37° 
                    db       $64, $B2                     ; degrees: 38° 
                    db       $62, $B1                     ; degrees: 39° 
                    db       $61, $AF                     ; degrees: 40° 
                    db       $5F, $AD                     ; degrees: 41° 
                    db       $5E, $AC                     ; degrees: 42° 
                    db       $5C, $AA                     ; degrees: 43° 
                    db       $5B, $A8                     ; degrees: 44° 
                    db       $59, $A7                     ; degrees: 45° 
                    db       $58, $A5                     ; degrees: 46° 
                    db       $56, $A4                     ; degrees: 47° 
                    db       $54, $A2                     ; degrees: 48° 
                    db       $53, $A1                     ; degrees: 49° 
                    db       $51, $9F                     ; degrees: 50° 
                    db       $4F, $9E                     ; degrees: 51° 
                    db       $4E, $9C                     ; degrees: 52° 
                    db       $4C, $9B                     ; degrees: 53° 
                    db       $4A, $9A                     ; degrees: 54° 
                    db       $48, $98                     ; degrees: 55° 
                    db       $47, $97                     ; degrees: 56° 
                    db       $45, $96                     ; degrees: 57° 
                    db       $43, $95                     ; degrees: 58° 
                    db       $41, $94                     ; degrees: 59° 
                    db       $3F, $93                     ; degrees: 60° 
                    db       $3D, $91                     ; degrees: 61° 
                    db       $3B, $90                     ; degrees: 62° 
                    db       $39, $8F                     ; degrees: 63° 
                    db       $37, $8E                     ; degrees: 64° 
                    db       $35, $8D                     ; degrees: 65° 
                    db       $33, $8C                     ; degrees: 66° 
                    db       $31, $8C                     ; degrees: 67° 
                    db       $2F, $8B                     ; degrees: 68° 
                    db       $2D, $8A                     ; degrees: 69° 
                    db       $2B, $89                     ; degrees: 70° 
                    db       $29, $88                     ; degrees: 71° 
                    db       $27, $88                     ; degrees: 72° 
                    db       $25, $87                     ; degrees: 73° 
                    db       $23, $86                     ; degrees: 74° 
                    db       $20, $86                     ; degrees: 75° 
                    db       $1E, $85                     ; degrees: 76° 
                    db       $1C, $85                     ; degrees: 77° 
                    db       $1A, $84                     ; degrees: 78° 
                    db       $18, $84                     ; degrees: 79° 
                    db       $16, $83                     ; degrees: 80° 
                    db       $13, $83                     ; degrees: 81° 
                    db       $11, $83                     ; degrees: 82° 
                    db       $0F, $82                     ; degrees: 83° 
                    db       $0D, $82                     ; degrees: 84° 
                    db       $0B, $82                     ; degrees: 85° 
                    db       $08, $82                     ; degrees: 86° 
                    db       $06, $82                     ; degrees: 87° 
                    db       $04, $82                     ; degrees: 88° 
                    db       $02, $82                     ; degrees: 89° 
                    db       $00, $81                     ; degrees: 90° 
                    db       $FE, $82                     ; degrees: 91° 
                    db       $FC, $82                     ; degrees: 92° 
                    db       $FA, $82                     ; degrees: 93° 
                    db       $F8, $82                     ; degrees: 94° 
                    db       $F5, $82                     ; degrees: 95° 
                    db       $F3, $82                     ; degrees: 96° 
                    db       $F1, $82                     ; degrees: 97° 
                    db       $EF, $83                     ; degrees: 98° 
                    db       $ED, $83                     ; degrees: 99° 
                    db       $EA, $83                     ; degrees: 100° 
                    db       $E8, $84                     ; degrees: 101° 
                    db       $E6, $84                     ; degrees: 102° 
                    db       $E4, $85                     ; degrees: 103° 
                    db       $E2, $85                     ; degrees: 104° 
                    db       $E0, $86                     ; degrees: 105° 
                    db       $DD, $86                     ; degrees: 106° 
                    db       $DB, $87                     ; degrees: 107° 
                    db       $D9, $88                     ; degrees: 108° 
                    db       $D7, $88                     ; degrees: 109° 
                    db       $D5, $89                     ; degrees: 110° 
                    db       $D3, $8A                     ; degrees: 111° 
                    db       $D1, $8B                     ; degrees: 112° 
                    db       $CF, $8C                     ; degrees: 113° 
                    db       $CD, $8C                     ; degrees: 114° 
                    db       $CB, $8D                     ; degrees: 115° 
                    db       $C9, $8E                     ; degrees: 116° 
                    db       $C7, $8F                     ; degrees: 117° 
                    db       $C5, $90                     ; degrees: 118° 
                    db       $C3, $91                     ; degrees: 119° 
                    db       $C1, $93                     ; degrees: 120° 
                    db       $BF, $94                     ; degrees: 121° 
                    db       $BD, $95                     ; degrees: 122° 
                    db       $BB, $96                     ; degrees: 123° 
                    db       $B9, $97                     ; degrees: 124° 
                    db       $B8, $98                     ; degrees: 125° 
                    db       $B6, $9A                     ; degrees: 126° 
                    db       $B4, $9B                     ; degrees: 127° 
                    db       $B2, $9C                     ; degrees: 128° 
                    db       $B1, $9E                     ; degrees: 129° 
                    db       $AF, $9F                     ; degrees: 130° 
                    db       $AD, $A1                     ; degrees: 131° 
                    db       $AC, $A2                     ; degrees: 132° 
                    db       $AA, $A4                     ; degrees: 133° 
                    db       $A8, $A5                     ; degrees: 134° 
                    db       $A7, $A7                     ; degrees: 135° 
                    db       $A5, $A8                     ; degrees: 136° 
                    db       $A4, $AA                     ; degrees: 137° 
                    db       $A2, $AC                     ; degrees: 138° 
                    db       $A1, $AD                     ; degrees: 139° 
                    db       $9F, $AF                     ; degrees: 140° 
                    db       $9E, $B1                     ; degrees: 141° 
                    db       $9C, $B2                     ; degrees: 142° 
                    db       $9B, $B4                     ; degrees: 143° 
                    db       $9A, $B6                     ; degrees: 144° 
                    db       $98, $B8                     ; degrees: 145° 
                    db       $97, $B9                     ; degrees: 146° 
                    db       $96, $BB                     ; degrees: 147° 
                    db       $95, $BD                     ; degrees: 148° 
                    db       $94, $BF                     ; degrees: 149° 
                    db       $93, $C1                     ; degrees: 150° 
                    db       $91, $C3                     ; degrees: 151° 
                    db       $90, $C5                     ; degrees: 152° 
                    db       $8F, $C7                     ; degrees: 153° 
                    db       $8E, $C9                     ; degrees: 154° 
                    db       $8D, $CB                     ; degrees: 155° 
                    db       $8C, $CD                     ; degrees: 156° 
                    db       $8C, $CF                     ; degrees: 157° 
                    db       $8B, $D1                     ; degrees: 158° 
                    db       $8A, $D3                     ; degrees: 159° 
                    db       $89, $D5                     ; degrees: 160° 
                    db       $88, $D7                     ; degrees: 161° 
                    db       $88, $D9                     ; degrees: 162° 
                    db       $87, $DB                     ; degrees: 163° 
                    db       $86, $DD                     ; degrees: 164° 
                    db       $86, $E0                     ; degrees: 165° 
                    db       $85, $E2                     ; degrees: 166° 
                    db       $85, $E4                     ; degrees: 167° 
                    db       $84, $E6                     ; degrees: 168° 
                    db       $84, $E8                     ; degrees: 169° 
                    db       $83, $EA                     ; degrees: 170° 
                    db       $83, $ED                     ; degrees: 171° 
                    db       $83, $EF                     ; degrees: 172° 
                    db       $82, $F1                     ; degrees: 173° 
                    db       $82, $F3                     ; degrees: 174° 
                    db       $82, $F5                     ; degrees: 175° 
                    db       $82, $F8                     ; degrees: 176° 
                    db       $82, $FA                     ; degrees: 177° 
                    db       $82, $FC                     ; degrees: 178° 
                    db       $82, $FE                     ; degrees: 179° 
                    db       $81, $00                     ; degrees: 180° 
                    db       $82, $02                     ; degrees: 181° 
                    db       $82, $04                     ; degrees: 182° 
                    db       $82, $06                     ; degrees: 183° 
                    db       $82, $08                     ; degrees: 184° 
                    db       $82, $0B                     ; degrees: 185° 
                    db       $82, $0D                     ; degrees: 186° 
                    db       $82, $0F                     ; degrees: 187° 
                    db       $83, $11                     ; degrees: 188° 
                    db       $83, $13                     ; degrees: 189° 
                    db       $83, $16                     ; degrees: 190° 
                    db       $84, $18                     ; degrees: 191° 
                    db       $84, $1A                     ; degrees: 192° 
                    db       $85, $1C                     ; degrees: 193° 
                    db       $85, $1E                     ; degrees: 194° 
                    db       $86, $20                     ; degrees: 195° 
                    db       $86, $23                     ; degrees: 196° 
                    db       $87, $25                     ; degrees: 197° 
                    db       $88, $27                     ; degrees: 198° 
                    db       $88, $29                     ; degrees: 199° 
                    db       $89, $2B                     ; degrees: 200° 
                    db       $8A, $2D                     ; degrees: 201° 
                    db       $8B, $2F                     ; degrees: 202° 
                    db       $8C, $31                     ; degrees: 203° 
                    db       $8C, $33                     ; degrees: 204° 
                    db       $8D, $35                     ; degrees: 205° 
                    db       $8E, $37                     ; degrees: 206° 
                    db       $8F, $39                     ; degrees: 207° 
                    db       $90, $3B                     ; degrees: 208° 
                    db       $91, $3D                     ; degrees: 209° 
                    db       $93, $3F                     ; degrees: 210° 
                    db       $94, $41                     ; degrees: 211° 
                    db       $95, $43                     ; degrees: 212° 
                    db       $96, $45                     ; degrees: 213° 
                    db       $97, $47                     ; degrees: 214° 
                    db       $98, $48                     ; degrees: 215° 
                    db       $9A, $4A                     ; degrees: 216° 
                    db       $9B, $4C                     ; degrees: 217° 
                    db       $9C, $4E                     ; degrees: 218° 
                    db       $9E, $4F                     ; degrees: 219° 
                    db       $9F, $51                     ; degrees: 220° 
                    db       $A1, $53                     ; degrees: 221° 
                    db       $A2, $54                     ; degrees: 222° 
                    db       $A4, $56                     ; degrees: 223° 
                    db       $A5, $58                     ; degrees: 224° 
                    db       $A7, $59                     ; degrees: 225° 
                    db       $A8, $5B                     ; degrees: 226° 
                    db       $AA, $5C                     ; degrees: 227° 
                    db       $AC, $5E                     ; degrees: 228° 
                    db       $AD, $5F                     ; degrees: 229° 
                    db       $AF, $61                     ; degrees: 230° 
                    db       $B1, $62                     ; degrees: 231° 
                    db       $B2, $64                     ; degrees: 232° 
                    db       $B4, $65                     ; degrees: 233° 
                    db       $B6, $66                     ; degrees: 234° 
                    db       $B8, $68                     ; degrees: 235° 
                    db       $B9, $69                     ; degrees: 236° 
                    db       $BB, $6A                     ; degrees: 237° 
                    db       $BD, $6B                     ; degrees: 238° 
                    db       $BF, $6C                     ; degrees: 239° 
                    db       $C1, $6D                     ; degrees: 240° 
                    db       $C3, $6F                     ; degrees: 241° 
                    db       $C5, $70                     ; degrees: 242° 
                    db       $C7, $71                     ; degrees: 243° 
                    db       $C9, $72                     ; degrees: 244° 
                    db       $CB, $73                     ; degrees: 245° 
                    db       $CD, $74                     ; degrees: 246° 
                    db       $CF, $74                     ; degrees: 247° 
                    db       $D1, $75                     ; degrees: 248° 
                    db       $D3, $76                     ; degrees: 249° 
                    db       $D5, $77                     ; degrees: 250° 
                    db       $D7, $78                     ; degrees: 251° 
                    db       $D9, $78                     ; degrees: 252° 
                    db       $DB, $79                     ; degrees: 253° 
                    db       $DD, $7A                     ; degrees: 254° 
                    db       $E0, $7A                     ; degrees: 255° 
                    db       $E2, $7B                     ; degrees: 256° 
                    db       $E4, $7B                     ; degrees: 257° 
                    db       $E6, $7C                     ; degrees: 258° 
                    db       $E8, $7C                     ; degrees: 259° 
                    db       $EA, $7D                     ; degrees: 260° 
                    db       $ED, $7D                     ; degrees: 261° 
                    db       $EF, $7D                     ; degrees: 262° 
                    db       $F1, $7E                     ; degrees: 263° 
                    db       $F3, $7E                     ; degrees: 264° 
                    db       $F5, $7E                     ; degrees: 265° 
                    db       $F8, $7E                     ; degrees: 266° 
                    db       $FA, $7E                     ; degrees: 267° 
                    db       $FC, $7E                     ; degrees: 268° 
                    db       $FE, $7E                     ; degrees: 269° 
                    db       $00, $7F                     ; degrees: 270° 
                    db       $02, $7E                     ; degrees: 271° 
                    db       $04, $7E                     ; degrees: 272° 
                    db       $06, $7E                     ; degrees: 273° 
                    db       $08, $7E                     ; degrees: 274° 
                    db       $0B, $7E                     ; degrees: 275° 
                    db       $0D, $7E                     ; degrees: 276° 
                    db       $0F, $7E                     ; degrees: 277° 
                    db       $11, $7D                     ; degrees: 278° 
                    db       $13, $7D                     ; degrees: 279° 
                    db       $16, $7D                     ; degrees: 280° 
                    db       $18, $7C                     ; degrees: 281° 
                    db       $1A, $7C                     ; degrees: 282° 
                    db       $1C, $7B                     ; degrees: 283° 
                    db       $1E, $7B                     ; degrees: 284° 
                    db       $20, $7A                     ; degrees: 285° 
                    db       $23, $7A                     ; degrees: 286° 
                    db       $25, $79                     ; degrees: 287° 
                    db       $27, $78                     ; degrees: 288° 
                    db       $29, $78                     ; degrees: 289° 
                    db       $2B, $77                     ; degrees: 290° 
                    db       $2D, $76                     ; degrees: 291° 
                    db       $2F, $75                     ; degrees: 292° 
                    db       $31, $74                     ; degrees: 293° 
                    db       $33, $74                     ; degrees: 294° 
                    db       $35, $73                     ; degrees: 295° 
                    db       $37, $72                     ; degrees: 296° 
                    db       $39, $71                     ; degrees: 297° 
                    db       $3B, $70                     ; degrees: 298° 
                    db       $3D, $6F                     ; degrees: 299° 
                    db       $3F, $6D                     ; degrees: 300° 
                    db       $41, $6C                     ; degrees: 301° 
                    db       $43, $6B                     ; degrees: 302° 
                    db       $45, $6A                     ; degrees: 303° 
                    db       $47, $69                     ; degrees: 304° 
                    db       $48, $68                     ; degrees: 305° 
                    db       $4A, $66                     ; degrees: 306° 
                    db       $4C, $65                     ; degrees: 307° 
                    db       $4E, $64                     ; degrees: 308° 
                    db       $4F, $62                     ; degrees: 309° 
                    db       $51, $61                     ; degrees: 310° 
                    db       $53, $5F                     ; degrees: 311° 
                    db       $54, $5E                     ; degrees: 312° 
                    db       $56, $5C                     ; degrees: 313° 
                    db       $58, $5B                     ; degrees: 314° 
                    db       $59, $59                     ; degrees: 315° 
                    db       $5B, $58                     ; degrees: 316° 
                    db       $5C, $56                     ; degrees: 317° 
                    db       $5E, $54                     ; degrees: 318° 
                    db       $5F, $53                     ; degrees: 319° 
                    db       $61, $51                     ; degrees: 320° 
                    db       $62, $4F                     ; degrees: 321° 
                    db       $64, $4E                     ; degrees: 322° 
                    db       $65, $4C                     ; degrees: 323° 
                    db       $66, $4A                     ; degrees: 324° 
                    db       $68, $48                     ; degrees: 325° 
                    db       $69, $47                     ; degrees: 326° 
                    db       $6A, $45                     ; degrees: 327° 
                    db       $6B, $43                     ; degrees: 328° 
                    db       $6C, $41                     ; degrees: 329° 
                    db       $6D, $3F                     ; degrees: 330° 
                    db       $6F, $3D                     ; degrees: 331° 
                    db       $70, $3B                     ; degrees: 332° 
                    db       $71, $39                     ; degrees: 333° 
                    db       $72, $37                     ; degrees: 334° 
                    db       $73, $35                     ; degrees: 335° 
                    db       $74, $33                     ; degrees: 336° 
                    db       $74, $31                     ; degrees: 337° 
                    db       $75, $2F                     ; degrees: 338° 
                    db       $76, $2D                     ; degrees: 339° 
                    db       $77, $2B                     ; degrees: 340° 
                    db       $78, $29                     ; degrees: 341° 
                    db       $78, $27                     ; degrees: 342° 
                    db       $79, $25                     ; degrees: 343° 
                    db       $7A, $23                     ; degrees: 344° 
                    db       $7A, $20                     ; degrees: 345° 
                    db       $7B, $1E                     ; degrees: 346° 
                    db       $7B, $1C                     ; degrees: 347° 
                    db       $7C, $1A                     ; degrees: 348° 
                    db       $7C, $18                     ; degrees: 349° 
                    db       $7D, $16                     ; degrees: 350° 
                    db       $7D, $13                     ; degrees: 351° 
                    db       $7D, $11                     ; degrees: 352° 
                    db       $7E, $0F                     ; degrees: 353° 
                    db       $7E, $0D                     ; degrees: 354° 
                    db       $7E, $0B                     ; degrees: 355° 
                    db       $7E, $08                     ; degrees: 356° 
                    db       $7E, $06                     ; degrees: 357° 
                    db       $7E, $04                     ; degrees: 358° 
                    db       $7E, $02                     ; degrees: 359° 
; circle generated 0°-360° in 360 steps (cos, -sin), radius: 127
                    db       $7F, $00                     ; degrees: 0° 
                    db       $7E, $FE                     ; degrees: 1° 
                    db       $7E, $FC                     ; degrees: 2° 
                    db       $7E, $FA                     ; degrees: 3° 
                    db       $7E, $F8                     ; degrees: 4° 
                    db       $7E, $F5                     ; degrees: 5° 
                    db       $7E, $F3                     ; degrees: 6° 
                    db       $7E, $F1                     ; degrees: 7° 
                    db       $7D, $EF                     ; degrees: 8° 
                    db       $7D, $ED                     ; degrees: 9° 
                    db       $7D, $EA                     ; degrees: 10° 
                    db       $7C, $E8                     ; degrees: 11° 
                    db       $7C, $E6                     ; degrees: 12° 
                    db       $7B, $E4                     ; degrees: 13° 
                    db       $7B, $E2                     ; degrees: 14° 
                    db       $7A, $E0                     ; degrees: 15° 
                    db       $7A, $DD                     ; degrees: 16° 
                    db       $79, $DB                     ; degrees: 17° 
                    db       $78, $D9                     ; degrees: 18° 
                    db       $78, $D7                     ; degrees: 19° 
                    db       $77, $D5                     ; degrees: 20° 
                    db       $76, $D3                     ; degrees: 21° 
                    db       $75, $D1                     ; degrees: 22° 
                    db       $74, $CF                     ; degrees: 23° 
                    db       $74, $CD                     ; degrees: 24° 
                    db       $73, $CB                     ; degrees: 25° 
                    db       $72, $C9                     ; degrees: 26° 
                    db       $71, $C7                     ; degrees: 27° 
                    db       $70, $C5                     ; degrees: 28° 
                    db       $6F, $C3                     ; degrees: 29° 
                    db       $6D, $C1                     ; degrees: 30° 
                    db       $6C, $BF                     ; degrees: 31° 
                    db       $6B, $BD                     ; degrees: 32° 
                    db       $6A, $BB                     ; degrees: 33° 
                    db       $69, $B9                     ; degrees: 34° 
                    db       $68, $B8                     ; degrees: 35° 
                    db       $66, $B6                     ; degrees: 36° 
                    db       $65, $B4                     ; degrees: 37° 
                    db       $64, $B2                     ; degrees: 38° 
                    db       $62, $B1                     ; degrees: 39° 
                    db       $61, $AF                     ; degrees: 40° 
                    db       $5F, $AD                     ; degrees: 41° 
                    db       $5E, $AC                     ; degrees: 42° 
                    db       $5C, $AA                     ; degrees: 43° 
                    db       $5B, $A8                     ; degrees: 44° 
                    db       $59, $A7                     ; degrees: 45° 
                    db       $58, $A5                     ; degrees: 46° 
                    db       $56, $A4                     ; degrees: 47° 
                    db       $54, $A2                     ; degrees: 48° 
                    db       $53, $A1                     ; degrees: 49° 
                    db       $51, $9F                     ; degrees: 50° 
                    db       $4F, $9E                     ; degrees: 51° 
                    db       $4E, $9C                     ; degrees: 52° 
                    db       $4C, $9B                     ; degrees: 53° 
                    db       $4A, $9A                     ; degrees: 54° 
                    db       $48, $98                     ; degrees: 55° 
                    db       $47, $97                     ; degrees: 56° 
                    db       $45, $96                     ; degrees: 57° 
                    db       $43, $95                     ; degrees: 58° 
                    db       $41, $94                     ; degrees: 59° 
                    db       $3F, $93                     ; degrees: 60° 
                    db       $3D, $91                     ; degrees: 61° 
                    db       $3B, $90                     ; degrees: 62° 
                    db       $39, $8F                     ; degrees: 63° 
                    db       $37, $8E                     ; degrees: 64° 
                    db       $35, $8D                     ; degrees: 65° 
                    db       $33, $8C                     ; degrees: 66° 
                    db       $31, $8C                     ; degrees: 67° 
                    db       $2F, $8B                     ; degrees: 68° 
                    db       $2D, $8A                     ; degrees: 69° 
                    db       $2B, $89                     ; degrees: 70° 
                    db       $29, $88                     ; degrees: 71° 
                    db       $27, $88                     ; degrees: 72° 
                    db       $25, $87                     ; degrees: 73° 
                    db       $23, $86                     ; degrees: 74° 
                    db       $20, $86                     ; degrees: 75° 
                    db       $1E, $85                     ; degrees: 76° 
                    db       $1C, $85                     ; degrees: 77° 
                    db       $1A, $84                     ; degrees: 78° 
                    db       $18, $84                     ; degrees: 79° 
                    db       $16, $83                     ; degrees: 80° 
                    db       $13, $83                     ; degrees: 81° 
                    db       $11, $83                     ; degrees: 82° 
                    db       $0F, $82                     ; degrees: 83° 
                    db       $0D, $82                     ; degrees: 84° 
                    db       $0B, $82                     ; degrees: 85° 
                    db       $08, $82                     ; degrees: 86° 
                    db       $06, $82                     ; degrees: 87° 
                    db       $04, $82                     ; degrees: 88° 
                    db       $02, $82                     ; degrees: 89° 
                    db       $00, $81                     ; degrees: 90° 
                    db       $FE, $82                     ; degrees: 91° 
                    db       $FC, $82                     ; degrees: 92° 
                    db       $FA, $82                     ; degrees: 93° 
                    db       $F8, $82                     ; degrees: 94° 
                    db       $F5, $82                     ; degrees: 95° 
                    db       $F3, $82                     ; degrees: 96° 
                    db       $F1, $82                     ; degrees: 97° 
                    db       $EF, $83                     ; degrees: 98° 
                    db       $ED, $83                     ; degrees: 99° 
                    db       $EA, $83                     ; degrees: 100° 
                    db       $E8, $84                     ; degrees: 101° 
                    db       $E6, $84                     ; degrees: 102° 
                    db       $E4, $85                     ; degrees: 103° 
                    db       $E2, $85                     ; degrees: 104° 
                    db       $E0, $86                     ; degrees: 105° 
                    db       $DD, $86                     ; degrees: 106° 
                    db       $DB, $87                     ; degrees: 107° 
                    db       $D9, $88                     ; degrees: 108° 
                    db       $D7, $88                     ; degrees: 109° 
                    db       $D5, $89                     ; degrees: 110° 
                    db       $D3, $8A                     ; degrees: 111° 
                    db       $D1, $8B                     ; degrees: 112° 
                    db       $CF, $8C                     ; degrees: 113° 
                    db       $CD, $8C                     ; degrees: 114° 
                    db       $CB, $8D                     ; degrees: 115° 
                    db       $C9, $8E                     ; degrees: 116° 
                    db       $C7, $8F                     ; degrees: 117° 
                    db       $C5, $90                     ; degrees: 118° 
                    db       $C3, $91                     ; degrees: 119° 
                    db       $C1, $93                     ; degrees: 120° 
                    db       $BF, $94                     ; degrees: 121° 
                    db       $BD, $95                     ; degrees: 122° 
                    db       $BB, $96                     ; degrees: 123° 
                    db       $B9, $97                     ; degrees: 124° 
                    db       $B8, $98                     ; degrees: 125° 
                    db       $B6, $9A                     ; degrees: 126° 
                    db       $B4, $9B                     ; degrees: 127° 
                    db       $B2, $9C                     ; degrees: 128° 
                    db       $B1, $9E                     ; degrees: 129° 
                    db       $AF, $9F                     ; degrees: 130° 
                    db       $AD, $A1                     ; degrees: 131° 
                    db       $AC, $A2                     ; degrees: 132° 
                    db       $AA, $A4                     ; degrees: 133° 
                    db       $A8, $A5                     ; degrees: 134° 
                    db       $A7, $A7                     ; degrees: 135° 
                    db       $A5, $A8                     ; degrees: 136° 
                    db       $A4, $AA                     ; degrees: 137° 
                    db       $A2, $AC                     ; degrees: 138° 
                    db       $A1, $AD                     ; degrees: 139° 
                    db       $9F, $AF                     ; degrees: 140° 
                    db       $9E, $B1                     ; degrees: 141° 
                    db       $9C, $B2                     ; degrees: 142° 
                    db       $9B, $B4                     ; degrees: 143° 
                    db       $9A, $B6                     ; degrees: 144° 
                    db       $98, $B8                     ; degrees: 145° 
                    db       $97, $B9                     ; degrees: 146° 
                    db       $96, $BB                     ; degrees: 147° 
                    db       $95, $BD                     ; degrees: 148° 
                    db       $94, $BF                     ; degrees: 149° 
                    db       $93, $C1                     ; degrees: 150° 
                    db       $91, $C3                     ; degrees: 151° 
                    db       $90, $C5                     ; degrees: 152° 
                    db       $8F, $C7                     ; degrees: 153° 
                    db       $8E, $C9                     ; degrees: 154° 
                    db       $8D, $CB                     ; degrees: 155° 
                    db       $8C, $CD                     ; degrees: 156° 
                    db       $8C, $CF                     ; degrees: 157° 
                    db       $8B, $D1                     ; degrees: 158° 
                    db       $8A, $D3                     ; degrees: 159° 
                    db       $89, $D5                     ; degrees: 160° 
                    db       $88, $D7                     ; degrees: 161° 
                    db       $88, $D9                     ; degrees: 162° 
                    db       $87, $DB                     ; degrees: 163° 
                    db       $86, $DD                     ; degrees: 164° 
                    db       $86, $E0                     ; degrees: 165° 
                    db       $85, $E2                     ; degrees: 166° 
                    db       $85, $E4                     ; degrees: 167° 
                    db       $84, $E6                     ; degrees: 168° 
                    db       $84, $E8                     ; degrees: 169° 
                    db       $83, $EA                     ; degrees: 170° 
                    db       $83, $ED                     ; degrees: 171° 
                    db       $83, $EF                     ; degrees: 172° 
                    db       $82, $F1                     ; degrees: 173° 
                    db       $82, $F3                     ; degrees: 174° 
                    db       $82, $F5                     ; degrees: 175° 
                    db       $82, $F8                     ; degrees: 176° 
                    db       $82, $FA                     ; degrees: 177° 
                    db       $82, $FC                     ; degrees: 178° 
                    db       $82, $FE                     ; degrees: 179° 
                    db       $81, $00                     ; degrees: 180° 
                    db       $82, $02                     ; degrees: 181° 
                    db       $82, $04                     ; degrees: 182° 
                    db       $82, $06                     ; degrees: 183° 
                    db       $82, $08                     ; degrees: 184° 
                    db       $82, $0B                     ; degrees: 185° 
                    db       $82, $0D                     ; degrees: 186° 
                    db       $82, $0F                     ; degrees: 187° 
                    db       $83, $11                     ; degrees: 188° 
                    db       $83, $13                     ; degrees: 189° 
                    db       $83, $16                     ; degrees: 190° 
                    db       $84, $18                     ; degrees: 191° 
                    db       $84, $1A                     ; degrees: 192° 
                    db       $85, $1C                     ; degrees: 193° 
                    db       $85, $1E                     ; degrees: 194° 
                    db       $86, $20                     ; degrees: 195° 
                    db       $86, $23                     ; degrees: 196° 
                    db       $87, $25                     ; degrees: 197° 
                    db       $88, $27                     ; degrees: 198° 
                    db       $88, $29                     ; degrees: 199° 
                    db       $89, $2B                     ; degrees: 200° 
                    db       $8A, $2D                     ; degrees: 201° 
                    db       $8B, $2F                     ; degrees: 202° 
                    db       $8C, $31                     ; degrees: 203° 
                    db       $8C, $33                     ; degrees: 204° 
                    db       $8D, $35                     ; degrees: 205° 
                    db       $8E, $37                     ; degrees: 206° 
                    db       $8F, $39                     ; degrees: 207° 
                    db       $90, $3B                     ; degrees: 208° 
                    db       $91, $3D                     ; degrees: 209° 
                    db       $93, $3F                     ; degrees: 210° 
                    db       $94, $41                     ; degrees: 211° 
                    db       $95, $43                     ; degrees: 212° 
                    db       $96, $45                     ; degrees: 213° 
                    db       $97, $47                     ; degrees: 214° 
                    db       $98, $48                     ; degrees: 215° 
                    db       $9A, $4A                     ; degrees: 216° 
                    db       $9B, $4C                     ; degrees: 217° 
                    db       $9C, $4E                     ; degrees: 218° 
                    db       $9E, $4F                     ; degrees: 219° 
                    db       $9F, $51                     ; degrees: 220° 
                    db       $A1, $53                     ; degrees: 221° 
                    db       $A2, $54                     ; degrees: 222° 
                    db       $A4, $56                     ; degrees: 223° 
                    db       $A5, $58                     ; degrees: 224° 
                    db       $A7, $59                     ; degrees: 225° 
                    db       $A8, $5B                     ; degrees: 226° 
                    db       $AA, $5C                     ; degrees: 227° 
                    db       $AC, $5E                     ; degrees: 228° 
                    db       $AD, $5F                     ; degrees: 229° 
                    db       $AF, $61                     ; degrees: 230° 
                    db       $B1, $62                     ; degrees: 231° 
                    db       $B2, $64                     ; degrees: 232° 
                    db       $B4, $65                     ; degrees: 233° 
                    db       $B6, $66                     ; degrees: 234° 
                    db       $B8, $68                     ; degrees: 235° 
                    db       $B9, $69                     ; degrees: 236° 
                    db       $BB, $6A                     ; degrees: 237° 
                    db       $BD, $6B                     ; degrees: 238° 
                    db       $BF, $6C                     ; degrees: 239° 
                    db       $C1, $6D                     ; degrees: 240° 
                    db       $C3, $6F                     ; degrees: 241° 
                    db       $C5, $70                     ; degrees: 242° 
                    db       $C7, $71                     ; degrees: 243° 
                    db       $C9, $72                     ; degrees: 244° 
                    db       $CB, $73                     ; degrees: 245° 
                    db       $CD, $74                     ; degrees: 246° 
                    db       $CF, $74                     ; degrees: 247° 
                    db       $D1, $75                     ; degrees: 248° 
                    db       $D3, $76                     ; degrees: 249° 
                    db       $D5, $77                     ; degrees: 250° 
                    db       $D7, $78                     ; degrees: 251° 
                    db       $D9, $78                     ; degrees: 252° 
                    db       $DB, $79                     ; degrees: 253° 
                    db       $DD, $7A                     ; degrees: 254° 
                    db       $E0, $7A                     ; degrees: 255° 
                    db       $E2, $7B                     ; degrees: 256° 
                    db       $E4, $7B                     ; degrees: 257° 
                    db       $E6, $7C                     ; degrees: 258° 
                    db       $E8, $7C                     ; degrees: 259° 
                    db       $EA, $7D                     ; degrees: 260° 
                    db       $ED, $7D                     ; degrees: 261° 
                    db       $EF, $7D                     ; degrees: 262° 
                    db       $F1, $7E                     ; degrees: 263° 
                    db       $F3, $7E                     ; degrees: 264° 
                    db       $F5, $7E                     ; degrees: 265° 
                    db       $F8, $7E                     ; degrees: 266° 
                    db       $FA, $7E                     ; degrees: 267° 
                    db       $FC, $7E                     ; degrees: 268° 
                    db       $FE, $7E                     ; degrees: 269° 
                    db       $00, $7F                     ; degrees: 270° 
                    db       $02, $7E                     ; degrees: 271° 
                    db       $04, $7E                     ; degrees: 272° 
                    db       $06, $7E                     ; degrees: 273° 
                    db       $08, $7E                     ; degrees: 274° 
                    db       $0B, $7E                     ; degrees: 275° 
                    db       $0D, $7E                     ; degrees: 276° 
                    db       $0F, $7E                     ; degrees: 277° 
                    db       $11, $7D                     ; degrees: 278° 
                    db       $13, $7D                     ; degrees: 279° 
                    db       $16, $7D                     ; degrees: 280° 
                    db       $18, $7C                     ; degrees: 281° 
                    db       $1A, $7C                     ; degrees: 282° 
                    db       $1C, $7B                     ; degrees: 283° 
                    db       $1E, $7B                     ; degrees: 284° 
                    db       $20, $7A                     ; degrees: 285° 
                    db       $23, $7A                     ; degrees: 286° 
                    db       $25, $79                     ; degrees: 287° 
                    db       $27, $78                     ; degrees: 288° 
                    db       $29, $78                     ; degrees: 289° 
                    db       $2B, $77                     ; degrees: 290° 
                    db       $2D, $76                     ; degrees: 291° 
                    db       $2F, $75                     ; degrees: 292° 
                    db       $31, $74                     ; degrees: 293° 
                    db       $33, $74                     ; degrees: 294° 
                    db       $35, $73                     ; degrees: 295° 
                    db       $37, $72                     ; degrees: 296° 
                    db       $39, $71                     ; degrees: 297° 
                    db       $3B, $70                     ; degrees: 298° 
                    db       $3D, $6F                     ; degrees: 299° 
                    db       $3F, $6D                     ; degrees: 300° 
                    db       $41, $6C                     ; degrees: 301° 
                    db       $43, $6B                     ; degrees: 302° 
                    db       $45, $6A                     ; degrees: 303° 
                    db       $47, $69                     ; degrees: 304° 
                    db       $48, $68                     ; degrees: 305° 
                    db       $4A, $66                     ; degrees: 306° 
                    db       $4C, $65                     ; degrees: 307° 
                    db       $4E, $64                     ; degrees: 308° 
                    db       $4F, $62                     ; degrees: 309° 
                    db       $51, $61                     ; degrees: 310° 
                    db       $53, $5F                     ; degrees: 311° 
                    db       $54, $5E                     ; degrees: 312° 
                    db       $56, $5C                     ; degrees: 313° 
                    db       $58, $5B                     ; degrees: 314° 
                    db       $59, $59                     ; degrees: 315° 
                    db       $5B, $58                     ; degrees: 316° 
                    db       $5C, $56                     ; degrees: 317° 
                    db       $5E, $54                     ; degrees: 318° 
                    db       $5F, $53                     ; degrees: 319° 
                    db       $61, $51                     ; degrees: 320° 
                    db       $62, $4F                     ; degrees: 321° 
                    db       $64, $4E                     ; degrees: 322° 
                    db       $65, $4C                     ; degrees: 323° 
                    db       $66, $4A                     ; degrees: 324° 
                    db       $68, $48                     ; degrees: 325° 
                    db       $69, $47                     ; degrees: 326° 
                    db       $6A, $45                     ; degrees: 327° 
                    db       $6B, $43                     ; degrees: 328° 
                    db       $6C, $41                     ; degrees: 329° 
                    db       $6D, $3F                     ; degrees: 330° 
                    db       $6F, $3D                     ; degrees: 331° 
                    db       $70, $3B                     ; degrees: 332° 
                    db       $71, $39                     ; degrees: 333° 
                    db       $72, $37                     ; degrees: 334° 
                    db       $73, $35                     ; degrees: 335° 
                    db       $74, $33                     ; degrees: 336° 
                    db       $74, $31                     ; degrees: 337° 
                    db       $75, $2F                     ; degrees: 338° 
                    db       $76, $2D                     ; degrees: 339° 
                    db       $77, $2B                     ; degrees: 340° 
                    db       $78, $29                     ; degrees: 341° 
                    db       $78, $27                     ; degrees: 342° 
                    db       $79, $25                     ; degrees: 343° 
                    db       $7A, $23                     ; degrees: 344° 
                    db       $7A, $20                     ; degrees: 345° 
                    db       $7B, $1E                     ; degrees: 346° 
                    db       $7B, $1C                     ; degrees: 347° 
                    db       $7C, $1A                     ; degrees: 348° 
                    db       $7C, $18                     ; degrees: 349° 
                    db       $7D, $16                     ; degrees: 350° 
                    db       $7D, $13                     ; degrees: 351° 
                    db       $7D, $11                     ; degrees: 352° 
                    db       $7E, $0F                     ; degrees: 353° 
                    db       $7E, $0D                     ; degrees: 354° 
                    db       $7E, $0B                     ; degrees: 355° 
                    db       $7E, $08                     ; degrees: 356° 
                    db       $7E, $06                     ; degrees: 357° 
                    db       $7E, $04                     ; degrees: 358° 
                    db       $7E, $02                     ; degrees: 359° 
