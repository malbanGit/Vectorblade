;***************************************************************************
; DATA SECTION
;***************************************************************************
deathStarSceneData 
                    DW       ds_0                         ; list of all single vectorlists in this 
                    DW       ds_1 
                    DW       ds_2 
                    DW       0 
ds_0 
                    db       $05, $01, $75, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       -$10, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$01, $01, -$03, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$36, $01, -$11, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $03, $01, $08, hi(SMVB50_continue7_single), lo(SMVB50_continue7_single) 
                    db       $34, $01, $12 
                    db       -$05, $01, -$41 
                    db       -$02, $01, -$4F 
                    db       $01, $01, -$48 
                    db       $03, $01, -$1E 
                    db       -$30, $01, $11 
                    db       -$05, $01, $17, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $32, $01, -$0E 
                    db       $00, $01, $08, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$33, $01, $0D, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$01, $01, $71, hi(SMVB50_continue6_single), lo(SMVB50_continue6_single) 
                    db       $36, $01, $09 
                    db       -$01, $01, $0A 
                    db       -$35, $01, -$0A 
                    db       $04, $01, $28 
                    db       $36, $01, $11 
                    db       -$3E, $01, -$11, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $03, $01, $0B, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$21, $01, -$27, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$0A, $01, -$2F 
                    db       $04, $01, -$2B, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $1F, $01, -$17, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $06, $01, -$31, hi(SMVB50_continue5_single), lo(SMVB50_continue5_single) 
                    db       -$23, $01, $2B 
                    db       -$0D, $01, $24 
                    db       $00, $01, $28 
                    db       $09, $01, $19 
                    db       $00, $01, $11, hi(SMVB50_startMove_yStays_single), lo(SMVB50_startMove_yStays_single) ; y was $09, now 0 
                    db       $1D, $01, $18, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$06, $01, -$2E, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $00, $01, -$54 
                    db       $42, $01, -$46, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0F, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
ds_1 
                    db       $6C, $01, $3A, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $00, $01, -$75, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $0A, $01, $13, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $00, $01, $4A 
                    db       $04, $01, -$11, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $00, $01, -$26, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$13, $01, -$16, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $00, $01, $25, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$29, $01, -$04, hi(SMVB50_continue3_single), lo(SMVB50_continue3_single) 
                    db       $01, $01, -$37 
                    db       $28, $01, $16 
                    db       $00, $01, -$14, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, $0F, hi(SMVB50_startDraw_yStays_single), lo(SMVB50_startDraw_yStays_single) ; y was $00, now SHIFT Poke 
                    db       -$28, $01, -$18, hi(SMVB50_continue3_single), lo(SMVB50_continue3_single) 
                    db       $03, $01, -$1C 
                    db       $25, $01, $25 
                    db       -$2E, $01, -$2C, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$02, $01, $1A, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$0D, $01, -$05, hi(SMVB50_continue3_single), lo(SMVB50_continue3_single) 
                    db       $01, $01, -$1F 
                    db       $0E, $01, $0A 
                    db       -$02, $01, $20, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, $4D, hi(SMVB50_startDraw_yStays_single), lo(SMVB50_startDraw_yStays_single) ; y was -$02, now SHIFT Poke 
                    db       -$0C, $01, $00, hi(SMVB50_continue3_single), lo(SMVB50_continue3_single) 
                    db       $01, $01, -$52 
                    db       $0D, $01, $05 
                    db       $07, $01, $4A, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $29, $01, $01, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, $0C, hi(SMVB50_continue3_single), lo(SMVB50_continue3_single) 
                    db       -$29, $01, $08 
                    db       $00, $01, -$15 
                    db       -$09, $01, $23, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $00, $01, -$1A, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$0C, $01, $00, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $01, $01, $1C 
                    db       -$07, $01, $02, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$01, $01, -$5E, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$23, $01, -$03, hi(SMVB50_continue5_single), lo(SMVB50_continue5_single) 
                    db       $04, $01, -$40 
                    db       $22, $01, $04 
                    db       -$03, $01, $39 
                    db       -$23, $01, -$03 
                    db       $00, $01, $06, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $01, $01, $6A, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
ds_2 
                    db       $35, $01, $22, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       -$0B, $01, $02, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$07, $01, $02, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$22, $01, $09, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $02, $01, $2C, hi(SMVB50_continue5_single), lo(SMVB50_continue5_single) 
                    db       $03, $01, $1F 
                    db       $21, $01, -$08 
                    db       -$02, $01, -$09 
                    db       -$20, $01, $07 
                    db       $0D, $01, -$0C, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       -$08, $01, -$0D, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, -$0F, hi(SMVB50_continue7_single), lo(SMVB50_continue7_single) 
                    db       $0A, $01, -$15 
                    db       $14, $01, -$0A 
                    db       $15, $01, -$02 
                    db       $0C, $01, $08 
                    db       $03, $01, $15 
                    db       -$0C, $01, $16 
                    db       -$16, $01, $0A, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$16, $01, -$01 
                    db       $17, $01, $0B, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $16, $01, -$0B, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $14, $01, -$26, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $11, $01, -$0C, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, $0E, hi(SMVB50_continue3_single), lo(SMVB50_continue3_single) 
                    db       -$21, $01, $22 
                    db       $10, $01, -$24 
                    db       $16, $01, -$05, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0A, $01, -$18, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$0F, $01, -$11, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $00, $01, $1A, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$12, $01, $0C, hi(SMVB50_continue3_single), lo(SMVB50_continue3_single) 
                    db       -$15, $01, -$1B 
                    db       $27, $01, -$0B 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
deathStarWeaponAnim 
                    DW       dsWeapon_0                   ; list of all single vectorlists in this 
                    DW       dsWeapon_1 
                    DW       dsWeapon_2 
                    DW       dsWeapon_3 
                    DW       dsWeapon_4 
                    DW       dsWeapon_5 
                    DW       dsWeapon_6 
                    DW       dsWeapon_7 
                    DW       0 
dsWeapon_0 
                    db       $0E, $01, $10, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $09, $01, -$0C, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$11, $01, -$01, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $08, $01, $0D 
                    db       -$25, $01, -$14, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $09, $01, -$0C, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $08, $01, $0D, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$11, $01, -$01 
                    db       $00, $01, $19, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $09, $01, $05, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $08, $01, -$12, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$11, $01, $0D 
                    db       $25, $01, -$2F, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $09, $01, $05, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$11, $01, $0D, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $08, $01, -$12 
                    db       -$15, $01, $34, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0E, $01, -$06, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$07, $01, -$0C, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$07, $01, $12 
                    db       $00, $01, -$2E, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0E, $01, -$06, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$07, $01, $12, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$07, $01, -$0C 
                    db       -$13, $01, $18, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $00, $01, $0C, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $11, $01, -$0D, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$11, $01, $01 
                    db       $34, $01, -$14, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $00, $01, $0C, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$11, $01, $01, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $11, $01, -$0D 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
dsWeapon_1 
                    db       $10, $01, $0D, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $08, $01, -$0C, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$11, $01, $01, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $09, $01, $0B 
                    db       -$28, $01, -$0E, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $08, $01, -$0C, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $09, $01, $0B, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$11, $01, $01 
                    db       $02, $01, $18, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0B, $01, $03, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $06, $01, -$12, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$11, $01, $0F 
                    db       $21, $01, -$31, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0B, $01, $03, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$11, $01, $0F, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $06, $01, -$12 
                    db       -$0F, $01, $33, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0E, $01, -$06, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$09, $01, -$0C, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$05, $01, $12 
                    db       -$06, $01, -$2C, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0E, $01, -$06, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$05, $01, $12, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$09, $01, -$0C 
                    db       -$11, $01, $19, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $02, $01, $0C, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $10, $01, -$0E, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$12, $01, $02 
                    db       $34, $01, -$18, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $02, $01, $0C, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$12, $01, $02, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $10, $01, -$0E 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
dsWeapon_2 
                    db       $12, $01, $0B, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $08, $01, -$0C, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$13, $01, $03, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $0B, $01, $09 
                    db       -$2C, $01, -$0A, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $08, $01, -$0C, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $0B, $01, $09, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$13, $01, $03 
                    db       $06, $01, $16, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0A, $01, $04, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $05, $01, -$13, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$0F, $01, $0F 
                    db       $1E, $01, -$32, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0A, $01, $04, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$0F, $01, $0F, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $05, $01, -$13 
                    db       -$0C, $01, $33, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0E, $01, -$07, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$0A, $01, -$0A, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$04, $01, $11 
                    db       -$0A, $01, -$29, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0E, $01, -$07, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$04, $01, $11, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$0A, $01, -$0A 
                    db       -$0F, $01, $19, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $03, $01, $0C, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $0F, $01, -$0F, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$12, $01, $03 
                    db       $33, $01, -$1C, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $03, $01, $0C, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$12, $01, $03, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $0F, $01, -$0F 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
dsWeapon_3 
                    db       $14, $01, $09, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $06, $01, -$0D, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$12, $01, $05, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $0C, $01, $08 
                    db       -$2E, $01, -$05, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $06, $01, -$0D, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $0C, $01, $08, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$12, $01, $05 
                    db       $08, $01, $14, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0B, $01, $02, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $03, $01, -$11, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$0E, $01, $0F 
                    db       $19, $01, -$32, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0B, $01, $02, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$0E, $01, $0F, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $03, $01, -$11 
                    db       -$06, $01, $31, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0D, $01, -$08, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$0B, $01, -$08, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$02, $01, $10 
                    db       -$0F, $01, -$26, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0D, $01, -$08, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$02, $01, $10, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$0B, $01, -$08 
                    db       -$0D, $01, $1A, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $04, $01, $0A, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $0E, $01, -$0F, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$12, $01, $05 
                    db       $32, $01, -$20, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $04, $01, $0A, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$12, $01, $05, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $0E, $01, -$0F 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
dsWeapon_4 
                    db       $16, $01, $07, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $05, $01, -$0D, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$13, $01, $06, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $0E, $01, $07 
                    db       -$31, $01, -$01, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $05, $01, -$0D, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $0E, $01, $07, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$13, $01, $06 
                    db       $0B, $01, $13, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0C, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $01, $01, -$11, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$0D, $01, $11 
                    db       $14, $01, -$32, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0C, $01, $00, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$0D, $01, $11, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $01, $01, -$11 
                    db       -$01, $01, $2F, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0D, $01, -$09, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$0D, $01, -$07, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $00, $01, $10 
                    db       -$13, $01, -$23, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0D, $01, -$09, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $00, $01, $10, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$0D, $01, -$07 
                    db       -$0B, $01, $1A, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $05, $01, $0A, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $0E, $01, -$11, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$13, $01, $07 
                    db       $31, $01, -$24, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $05, $01, $0A, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$13, $01, $07, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $0E, $01, -$11 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
dsWeapon_5 
                    db       $17, $01, $04, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       SHITREG_POKE_VALUE, $01, -$0C, hi(SMVB50_startDraw_newY_eq_oldX_single), lo(SMVB50_startDraw_newY_eq_oldX_single) ; y was $04, now SHIFT 
                    db       -$13, $01, $07, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $0F, $01, $05 
                    db       -$32, $01, $04, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, -$0C, hi(SMVB50_startDraw_newY_eq_oldX_single), lo(SMVB50_startDraw_newY_eq_oldX_single) ; y was $04, now SHIFT 
                    db       $0F, $01, $05, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$13, $01, $07 
                    db       $0D, $01, $12, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0C, $01, -$02, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$01, $01, -$10, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$0B, $01, $12 
                    db       $10, $01, -$32, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0C, $01, -$02, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$0B, $01, $12, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$01, $01, -$10 
                    db       $04, $01, $2D, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0C, $01, -$0A, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$0E, $01, -$06, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $02, $01, $10 
                    db       -$18, $01, -$20, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0C, $01, -$0A, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $02, $01, $10, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$0E, $01, -$06 
                    db       -$08, $01, $1A, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $06, $01, $08, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $0C, $01, -$10, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$12, $01, $08 
                    db       $2E, $01, -$26, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $06, $01, $08, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$12, $01, $08, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $0C, $01, -$10 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
dsWeapon_6 
                    db       $18, $01, $02, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $03, $01, -$0D, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$12, $01, $09, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $0F, $01, $04 
                    db       -$33, $01, $09, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $03, $01, -$0D, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $0F, $01, $04, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$12, $01, $09 
                    db       $0F, $01, $0F, hi(SMVB50_startMove_yEqx_single), lo(SMVB50_startMove_yEqx_single) ; y is $0F 
                    db       $0D, $01, -$03, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$03, $01, -$0F, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$0A, $01, $12 
                    db       $0B, $01, -$31, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0D, $01, -$03, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$0A, $01, $12, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$03, $01, -$0F 
                    db       $0A, $01, $2A, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0B, $01, -$0A, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$10, $01, -$04, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $05, $01, $0E 
                    db       -$1D, $01, -$1C, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0B, $01, -$0A, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $05, $01, $0E, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$10, $01, -$04 
                    db       -$05, $01, $1A, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $07, $01, $07, hi(SMVB50_startDraw_yEqx_single), lo(SMVB50_startDraw_yEqx_single) ; y is $07 
                    db       $0B, $01, -$12, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$12, $01, $0B 
                    db       $2B, $01, -$29, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $07, $01, $07, hi(SMVB50_startDraw_yEqx_single), lo(SMVB50_startDraw_yEqx_single) ; y is $07 
                    db       -$12, $01, $0B, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $0B, $01, -$12 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
dsWeapon_7 
                    db       $19, $01, -$01, hi(SMVB50_continue_single), lo(SMVB50_continue_single) 
                    db       $02, $01, -$0C, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$12, $01, $0B, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $10, $01, $01 
                    db       -$34, $01, $0E, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $02, $01, -$0C, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $10, $01, $01, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$12, $01, $0B 
                    db       $11, $01, $0D, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, -$04, hi(SMVB50_startDraw_newY_eq_oldX_single), lo(SMVB50_startDraw_newY_eq_oldX_single) ; y was $0D, now SHIFT 
                    db       -$04, $01, -$0E, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$09, $01, $12 
                    db       $07, $01, -$30, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0D, $01, -$04, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$09, $01, $12, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$04, $01, -$0E 
                    db       $0E, $01, $27, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0B, $01, -$0B, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$11, $01, -$02, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $06, $01, $0D 
                    db       -$21, $01, -$17, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $0B, $01, -$0B, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $06, $01, $0D, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$11, $01, -$02 
                    db       $00, $01, $19, hi(SMVB50_startMove_newY_eq_oldX_single), lo(SMVB50_startMove_newY_eq_oldX_single) ; y was -$02, now 0 
                    db       $08, $01, $06, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       $09, $01, -$12, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       -$11, $01, $0C 
                    db       $28, $01, -$2C, hi(SMVB50_startMove_single), lo(SMVB50_startMove_single) 
                    db       $08, $01, $06, hi(SMVB50_startDraw_single), lo(SMVB50_startDraw_single) 
                    db       -$11, $01, $0C, hi(SMVB50_continue2_single), lo(SMVB50_continue2_single) 
                    db       $09, $01, -$12 
                    db       $40, $00, $00, hi(SMVB50_lastDraw_rts), lo(SMVB50_lastDraw_rts) 
