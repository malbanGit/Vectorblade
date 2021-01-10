BonusAutofire 
                    dw       BonusAutofireAnim2 
                    db       BONUS_AUTOFIRE               ; type 
BonusAutofireAnim2 
                    DW       Autofire0                    ; list of all single vectorlists in this 
                    DW       Autofire1 
                    DW       Autofire2 
                    DW       Autofire3 
                    DW       Autofire4 
                    DW       Autofire5 
                    DW       Autofire6 
                    DW       Autofire7 
                    DW       Autofire8 
                    DW       Autofire7 
                    DW       Autofire6 
                    DW       Autofire5 
                    DW       Autofire4 
                    DW       Autofire3 
                    DW       Autofire2 
                    DW       Autofire1 
                    DW       0 

; changed slightly for V1.07

Autofire0
	db -$32, $01,  $00, hi(SMVB_continue_single), lo(SMVB_continue_single)
	db  $0D, $01,  $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single)
	db  $1E, $01,  $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single)
	db  $0E, $01,  $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single)
	db  $1D, $01,  $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single)
	db  $0E, $01,  $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single)
	db -$02, $01,  $30, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_0), lo(BonusCircle_0)
Autofire1
	db -$32, $01,  $00, hi(SMVB_continue_single), lo(SMVB_continue_single)
	db  $0D, $01,  $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single)
	db  $1E, $01,  $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single)
	db  $0E, $01,  $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single)
	db  $1D, $01,  $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single)
	db  $0E, $01,  $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single)
	db -$02, $01,  $30, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_1), lo(BonusCircle_1)
Autofire2
	db -$2F, $01,  $00, hi(SMVB_continue_single), lo(SMVB_continue_single)
	db  $0C, $01,  $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single)
	db  $1C, $01,  $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single)
	db  $0E, $01,  $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single)
	db  $1B, $01,  $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single)
	db  $0D, $01,  $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single)
	db -$02, $01,  $30, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_2), lo(BonusCircle_2)
Autofire3
	db -$25, $01,  $00, hi(SMVB_continue_single), lo(SMVB_continue_single)
	db  $0A, $01,  $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single)
	db  $16, $01,  $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single)
	db  $0A, $01,  $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single)
	db  $16, $01,  $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single)
	db  $0A, $01,  $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single)
	db -$02, $01,  $30, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_3), lo(BonusCircle_3)
Autofire4
	db -$16, $01,  $00, hi(SMVB_continue_single), lo(SMVB_continue_single)
	db  $06, $01,  $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single)
	db  $0D, $01,  $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single)
	db  $06, $01,  $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single)
	db  $0D, $01,  $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single)
	db  $06, $01,  $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single)
	db -$01, $01,  $30, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_4), lo(BonusCircle_4)
Autofire5
	db -$05, $01,  $00, hi(SMVB_continue_single), lo(SMVB_continue_single)
	db  $02, $01,  $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single)
	db  $00, $01, $ce , hi(SMVB_startMove_xyStays_single), lo(SMVB_startMove_xyStays_single); y was  $02; x was  $00
	db  SHITREG_POKE_VALUE, $01, $ee , hi(SMVB_startDraw_xyStays_single), lo(SMVB_startDraw_xyStays_single); y was  $02; x was  $00, y now SHIFTREG
	db  $00, $01, $ce , hi(SMVB_startMove_xyStays_single), lo(SMVB_startMove_xyStays_single); y was  $02; x was  $00
	db  SHITREG_POKE_VALUE, $01, $ee , hi(SMVB_startDraw_xyStays_single), lo(SMVB_startDraw_xyStays_single); y was  $02; x was  $00, y now SHIFTREG
	db -$01, $01,  $30, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_5), lo(BonusCircle_5)
Autofire6
	db  $0E, $01,  $00, hi(SMVB_continue_single), lo(SMVB_continue_single)
	db -$04, $01,  $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single)
	db -$08, $01,  $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single)
	db -$04, $01,  $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single)
	db -$08, $01,  $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single)
	db -$04, $01,  $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single)
	db  $01, $01,  $30, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_6), lo(BonusCircle_6)
Autofire7
	db  $1E, $01,  $00, hi(SMVB_continue_single), lo(SMVB_continue_single)
	db -$08, $01,  $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single)
	db -$12, $01,  $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single)
	db -$08, $01,  $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single)
	db -$12, $01,  $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single)
	db -$08, $01,  $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single)
	db  $01, $01,  $30, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_7), lo(BonusCircle_7)
Autofire8
	db  $2B, $01,  $00, hi(SMVB_continue_single), lo(SMVB_continue_single)
	db -$0C, $01,  $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single)
	db -$19, $01,  $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single)
	db -$0C, $01,  $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single)
	db -$19, $01,  $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single)
	db -$0C, $01,  $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single)
	db  $02, $01,  $30, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_8), lo(BonusCircle_8)





