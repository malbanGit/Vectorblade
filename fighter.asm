; bank 3 + 0
 if  CURRENT_BANK = 3 
 if  DRAW_FIGHTER_IN_BANK0 = 1 
 else  
SM_Armor_Anim 
                    DW       SM_Armor_0                   ; list of all single vectorlists in this 
                    DW       SM_Armor_1 
                    DW       SM_Armor_0                   ; list of all single vectorlists in this 
                    DW       SM_Armor_1 
                    DW       SM_Armor_0                   ; list of all single vectorlists in this 
                    DW       SM_Armor_1 
                    DW       0 
SM_Armor_0 
                    db       -$10, $01, -$44, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $6B, $01, $66, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0B, $01, $23, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$0B, $01, $21 
                    db       -$6B, $01, $66 
                    db       $10, $01, -$44, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       $f0, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
SM_Armor_1 
                    db       -$0F, $01, -$44, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $69, $01, $66, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0B, $01, $23, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$0B, $01, $23 
                    db       -$69, $01, $66 
                    db       $0F, $01, -$44, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       $f0, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
SM_Shield_Anim 
                    DW       SM_Shield_0                  ; list of all single vectorlists in this 
                    DW       SM_Shield_1 
                    DW       SM_Shield_2 
                    DW       SM_Shield_3 
                    DW       SM_Shield_2 
                    DW       SM_Shield_1 
                    DW       0 
SM_Shield_0 
                    db       -$10, $01, -$44, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $4C, $01, $2E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1F, $01, $38, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $0B, $01, $23 
                    db       -$0B, $01, $21 
                    db       -$1F, $01, $38 
                    db       -$4C, $01, $2E 
                    db       $10, $01, -$44, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
SM_Shield_1 
                    db       -$17, $01, -$7D, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $4F, $01, $29, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1D, $01, $32, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $0B, $01, $23 
                    db       -$0B, $01, $21 
                    db       -$1F, $01, $32 
                    db       -$4B, $01, $29 
                    db       $15, $01, -$7D, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
SM_Shield_2 
                    db       -$07, $01, -$71, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $47, $01, $23, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $20, $01, $2C, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $0C, $01, $23 
                    db       -$0C, $01, $21 
                    db       -$1E, $01, $2C 
                    db       -$4C, $01, $23 
                    db       $0A, $01, -$71, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
SM_Shield_3 
                    db       $01, $01, -$66, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $4C, $01, $1F, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1F, $01, $25, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $0B, $01, $23 
                    db       -$0B, $01, $21 
                    db       -$1F, $01, $26 
                    db       -$4C, $01, $1E 
                    db       -$01, $01, -$66, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
 endif                                                    ; DRAW_FIGHTER_IN_BANK0 = 1 
USE_FIGHTER_ANIM    =        1 
 endif                                                    ; CURRENT_BANK = 3 
 if  DRAW_FIGHTER_IN_BANK0 = 1 
 else  
USE_FIGHTER_ANIM    =        1 
 endif  
 if  USE_FIGHTER_ANIM = 1 
SM_Fighter_Anim 
                    DW       SM_Fighter_0                 ; list of all single vectorlists in this 
                    DW       SM_Fighter_1 
                    DW       SM_Fighter_0                 ; list of all single vectorlists in this 
                    DW       SM_Fighter_1 
                    DW       SM_Fighter_0                 ; list of all single vectorlists in this 
                    DW       SM_Fighter_1 
                    DW       0 
SM_Fighter_0 
                    db       -$09, $01, -$1F, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $3E, $01, -$19, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$38, $01, -$56, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $45, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$58, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $3E, $01, $3B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $57, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$57, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $3A, $01, $37, hi(SMVB_continue6_single), lo(SMVB_continue6_single) 
                    db       $57, $01, $09 
                    db       $39, $01, $13 
                    db       -$39, $01, $13 
                    db       -$57, $01, $09 
                    db       -$3A, $01, $37 
                    db       $57, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$57, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$3E, $01, $3B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $58, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$45, $01, $00, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $38, $01, -$56, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$3E, $01, -$1D 
                    db       -$28, $01, -$1B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $32, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $67, $01, $00, hi(SMVB_startMove_tripple), lo(SMVB_startMove_tripple) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts_stay), lo(SMVB_lastDraw_rts_stay) 
SM_Fighter_1 
                    db       -$14, $01, -$1A, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $49, $01, -$1E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$38, $01, -$56, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $45, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$58, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $3E, $01, $3B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $57, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$57, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $3A, $01, $37, hi(SMVB_continue6_single), lo(SMVB_continue6_single) 
                    db       $57, $01, $09 
                    db       $39, $01, $13 
                    db       -$39, $01, $13 
                    db       -$57, $01, $09 
                    db       -$3A, $01, $37 
                    db       $57, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$57, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$3E, $01, $3B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $58, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$45, $01, $00, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $38, $01, -$56, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$4B, $01, -$25 
                    db       -$27, $01, -$13, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $33, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $6B, $01, $00, hi(SMVB_startMove_tripple), lo(SMVB_startMove_tripple) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts_stay), lo(SMVB_lastDraw_rts_stay) 
 endif                                                    ; USE_FIGHTER_ANIM = 1 
 if  CURRENT_BANK = 0 
 if  DRAW_FIGHTER_IN_BANK0 = 1 
SM_Armor_Anim 
; this must be at least as many anims as the longest ship anim!!!
; this uses the same counter!
                    DW       SM_Armor_0                   ; list of all single vectorlists in this 
                    DW       SM_Armor_0                   ; list of all single vectorlists in this 
                    DW       SM_Armor_0                   ; list of all single vectorlists in this 
                    DW       SM_Armor_0                   ; list of all single vectorlists in this 
                    DW       SM_Armor_0                   ; list of all single vectorlists in this 
                    DW       SM_Armor_0                   ; list of all single vectorlists in this 
                    DW       SM_Armor_0                   ; list of all single vectorlists in this 
                    DW       SM_Armor_0                   ; list of all single vectorlists in this 
                    DW       SM_Armor_0                   ; list of all single vectorlists in this 
                    DW       SM_Armor_0                   ; list of all single vectorlists in this 
                    DW       SM_Armor_0                   ; list of all single vectorlists in this 
                    DW       SM_Armor_0                   ; list of all single vectorlists in this 
                    DW       0 
SM_Armor_0 
                    db       -$10, $01, -$44, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $6F, $01, $22, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $07, $01, $67, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$07, $01, $65 
                    db       -$6F, $01, $22 
                    db       $10, $01, -$44, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
; this must be at least as many anims as the longest ship anim!!!
; this uses the same counter!
SM_Shield_Anim 
                    DW       SM_Shield_0                  ; list of all single vectorlists in this 
                    DW       SM_Shield_1 
                    DW       SM_Shield_2 
                    DW       SM_Shield_3 
                    DW       SM_Shield_2 
                    DW       SM_Shield_1 
                    DW       SM_Shield_0                  ; list of all single vectorlists in this 
                    DW       SM_Shield_1 
                    DW       SM_Shield_2 
                    DW       SM_Shield_3 
                    DW       SM_Shield_2 
                    DW       SM_Shield_1 
                    DW       0 
SM_Shield_0 
                    db       -$10, $01, -$44, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $4C, $01, $2E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1F, $01, $38, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $0B, $01, $23 
                    db       -$0B, $01, $21 
                    db       -$1F, $01, $38 
                    db       -$4C, $01, $2E 
                    db       $10, $01, -$44, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
SM_Shield_1 
                    db       -$17, $01, -$7D, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $4F, $01, $29, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1D, $01, $32, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $0B, $01, $23 
                    db       -$0B, $01, $21 
                    db       -$1F, $01, $32 
                    db       -$4B, $01, $29 
                    db       $15, $01, -$7D, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
SM_Shield_2 
                    db       -$07, $01, -$71, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $47, $01, $23, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $20, $01, $2C, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $0C, $01, $23 
                    db       -$0C, $01, $21 
                    db       -$1E, $01, $2C 
                    db       -$4C, $01, $23 
                    db       $0A, $01, -$71, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
SM_Shield_3 
                    db       $01, $01, -$66, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $4C, $01, $1F, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1F, $01, $25, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $0B, $01, $23 
                    db       -$0B, $01, $21 
                    db       -$1F, $01, $26 
                    db       -$4C, $01, $1E 
                    db       -$01, $01, -$66, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts), lo(SMVB_lastDraw_rts) 
SM_Fighter_AnimList 
                    dw       SM_FighterShot1_Anim 
                    dw       SM_FighterShot2_Anim 
                    dw       SM_FighterShot3_Anim 
                    dw       SM_FighterShot4_Anim 
                    dw       SM_FighterShot5_Anim 
                    dw       SM_FighterShot6_Anim 
SM_FighterShot1_Anim 
                    DW       SM_FighterShot1_0            ; list of all single vectorlists in this 
                    DW       SM_FighterShot1_1 
                    DW       0 
SM_FighterShot1_0 
                    db       -$09, $01, -$1F, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $3E, $01, -$19, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$38, $01, -$56, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $32, $01, $00 
                    db       $78, $01, $72 
                    db       $57, $01, $09 
                    db       $39, $01, $13 
                    db       -$39, $01, $13 
                    db       -$57, $01, $09 
                    db       -$78, $01, $72, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$32, $01, $00 
                    db       $38, $01, -$56 
                    db       -$3E, $01, -$1D 
                    db       -$29, $01, -$1B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $32, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $67, $01, $00, hi(SMVB_startMove_tripple), lo(SMVB_startMove_tripple) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts_stay), lo(SMVB_lastDraw_rts_stay) 
SM_FighterShot1_1 
                    db       -$14, $01, -$1A, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $49, $01, -$1E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$38, $01, -$56, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $32, $01, $00 
                    db       $78, $01, $72 
                    db       $57, $01, $09 
                    db       $39, $01, $13 
                    db       -$39, $01, $13 
                    db       -$57, $01, $09 
                    db       -$78, $01, $72, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$32, $01, $00 
                    db       $38, $01, -$56 
                    db       -$4B, $01, -$25 
                    db       -$27, $01, -$13, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $33, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $6B, $01, $00, hi(SMVB_startMove_tripple), lo(SMVB_startMove_tripple) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts_stay), lo(SMVB_lastDraw_rts_stay) 
SM_FighterShot2_Anim 
                    DW       SM_FighterShot2_0            ; list of all single vectorlists in this 
                    DW       SM_FighterShot2_1 
                    DW       0 
SM_FighterShot2_0 
                    db       -$09, $01, -$1F, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $3E, $01, -$19, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$38, $01, -$56, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $32, $01, $00 
                    db       $3E, $01, $3B 
                    db       $57, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$57, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $3A, $01, $37, hi(SMVB_continue6_single), lo(SMVB_continue6_single) 
                    db       $57, $01, $09 
                    db       $13, $01, $13 
                    db       -$13, $01, $13 
                    db       -$57, $01, $09 
                    db       -$3A, $01, $37 
                    db       $57, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$57, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$3E, $01, $3B, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$32, $01, $00 
                    db       $38, $01, -$56 
                    db       -$3E, $01, -$1D 
                    db       -$29, $01, -$1B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $32, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $67, $01, $00, hi(SMVB_startMove_tripple), lo(SMVB_startMove_tripple) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts_stay), lo(SMVB_lastDraw_rts_stay) 
SM_FighterShot2_1 
                    db       -$14, $01, -$1A, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $49, $01, -$1E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$38, $01, -$56, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $32, $01, $00 
                    db       $3E, $01, $3B 
                    db       $57, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$57, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $3A, $01, $37, hi(SMVB_continue6_single), lo(SMVB_continue6_single) 
                    db       $57, $01, $09 
                    db       $13, $01, $13 
                    db       -$13, $01, $13 
                    db       -$57, $01, $09 
                    db       -$3A, $01, $37 
                    db       $57, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$57, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$3E, $01, $3B, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$32, $01, $00 
                    db       $38, $01, -$56 
                    db       -$4B, $01, -$25 
                    db       -$27, $01, -$13, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $33, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $6B, $01, $00, hi(SMVB_startMove_tripple), lo(SMVB_startMove_tripple) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts_stay), lo(SMVB_lastDraw_rts_stay) 
SM_FighterShot3_Anim 
                    DW       SM_FighterShot3_0            ; list of all single vectorlists in this 
                    DW       SM_FighterShot3_1 
                    DW       0 
SM_FighterShot3_0 
                    db       -$09, $01, -$1F, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $3E, $01, -$19, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$38, $01, -$56, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $32, $01, $00 
                    db       $3E, $01, $3B 
                    db       $57, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$57, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $3A, $01, $37, hi(SMVB_continue6_single), lo(SMVB_continue6_single) 
                    db       $57, $01, $09 
                    db       $39, $01, $13 
                    db       -$39, $01, $13 
                    db       -$57, $01, $09 
                    db       -$3A, $01, $37 
                    db       $57, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$57, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$3E, $01, $3B, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$32, $01, $00 
                    db       $38, $01, -$56 
                    db       -$3E, $01, -$1D 
                    db       -$29, $01, -$1B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $32, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $67, $01, $00, hi(SMVB_startMove_tripple), lo(SMVB_startMove_tripple) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts_stay), lo(SMVB_lastDraw_rts_stay) 
SM_FighterShot3_1 
                    db       -$14, $01, -$1A, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $49, $01, -$1E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$38, $01, -$56, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $32, $01, $00 
                    db       $3E, $01, $3B 
                    db       $57, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$57, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $3A, $01, $37, hi(SMVB_continue6_single), lo(SMVB_continue6_single) 
                    db       $57, $01, $09 
                    db       $39, $01, $13 
                    db       -$39, $01, $13 
                    db       -$57, $01, $09 
                    db       -$3A, $01, $37 
                    db       $57, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$57, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$3E, $01, $3B, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$32, $01, $00 
                    db       $38, $01, -$56 
                    db       -$4B, $01, -$25 
                    db       -$27, $01, -$13, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $33, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $6B, $01, $00, hi(SMVB_startMove_tripple), lo(SMVB_startMove_tripple) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts_stay), lo(SMVB_lastDraw_rts_stay) 
SM_Fighter_Anim 
SM_FighterShot4_Anim 
                    DW       SM_FighterShot4_0            ; list of all single vectorlists in this 
                    DW       SM_FighterShot4_1 
                    DW       0 
SM_FighterShot4_0 
                    db       -$09, $01, -$1F, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $3E, $01, -$19, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$38, $01, -$56, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $45, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$58, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $3E, $01, $3B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $57, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$57, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $3A, $01, $37, hi(SMVB_continue6_single), lo(SMVB_continue6_single) 
                    db       $57, $01, $09 
                    db       $13, $01, $13 
                    db       -$13, $01, $13 
                    db       -$57, $01, $09 
                    db       -$3A, $01, $37 
                    db       $57, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$57, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$3E, $01, $3B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $58, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$45, $01, $00, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $38, $01, -$56, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$3E, $01, -$1D 
                    db       -$28, $01, -$1B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $32, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $67, $01, $00, hi(SMVB_startMove_tripple), lo(SMVB_startMove_tripple) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts_stay), lo(SMVB_lastDraw_rts_stay) 
SM_FighterShot4_1 
                    db       -$14, $01, -$1A, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $49, $01, -$1E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$38, $01, -$56, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $45, $01, $00, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$58, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $3E, $01, $3B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $57, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$57, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $3A, $01, $37, hi(SMVB_continue6_single), lo(SMVB_continue6_single) 
                    db       $57, $01, $09 
                    db       $13, $01, $13 
                    db       -$13, $01, $13 
                    db       -$57, $01, $09 
                    db       -$3A, $01, $37 
                    db       $57, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$57, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$3E, $01, $3B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $58, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$45, $01, $00, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $38, $01, -$56, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$4B, $01, -$25 
                    db       -$27, $01, -$13, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $33, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $6B, $01, $00, hi(SMVB_startMove_tripple), lo(SMVB_startMove_tripple) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts_stay), lo(SMVB_lastDraw_rts_stay) 
SM_FighterShot5_Anim 
                    DW       SM_FighterShot5_0            ; list of all single vectorlists in this 
                    DW       SM_FighterShot5_1 
                    DW       0 
SM_FighterShot5_0 
                    db       -$09, $01, -$1F, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $3E, $01, -$19, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$38, $01, -$56, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $32, $01, $00 
                    db       $78, $01, $72 
                    db       $2F, $01, -$21 
                    db       $28, $01, $2A 
                    db       $39, $01, $13 
                    db       -$39, $01, $13 
                    db       -$28, $01, $2A, hi(SMVB_continue6_single), lo(SMVB_continue6_single) 
                    db       -$2F, $01, -$21 
                    db       -$78, $01, $72 
                    db       -$32, $01, $00 
                    db       $38, $01, -$56 
                    db       -$3E, $01, -$1D 
                    db       -$29, $01, -$1B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $32, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $67, $01, $00, hi(SMVB_startMove_tripple), lo(SMVB_startMove_tripple) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts_stay), lo(SMVB_lastDraw_rts_stay) 
SM_FighterShot5_1 
                    db       -$14, $01, -$1A, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $49, $01, -$1E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$38, $01, -$56, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $32, $01, $00 
                    db       $78, $01, $72 
                    db       $2F, $01, -$21 
                    db       $28, $01, $2A 
                    db       $39, $01, $13 
                    db       -$39, $01, $13 
                    db       -$28, $01, $2A, hi(SMVB_continue6_single), lo(SMVB_continue6_single) 
                    db       -$2F, $01, -$21 
                    db       -$78, $01, $72 
                    db       -$32, $01, $00 
                    db       $38, $01, -$56 
                    db       -$4B, $01, -$25 
                    db       -$29, $01, -$13, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $33, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $6B, $01, $00, hi(SMVB_startMove_tripple), lo(SMVB_startMove_tripple) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts_stay), lo(SMVB_lastDraw_rts_stay) 
SM_FighterShot6_Anim 
                    DW       SM_FighterShot6_0            ; list of all single vectorlists in this 
                    DW       SM_FighterShot6_1 
                    DW       SM_FighterShot6_2            ; list of all single vectorlists in this 
                    DW       SM_FighterShot6_3 
                    DW       SM_FighterShot6_4            ; list of all single vectorlists in this 
                    DW       SM_FighterShot6_5 
                    DW       SM_FighterShot6_6            ; list of all single vectorlists in this 
                    DW       SM_FighterShot6_5 
                    DW       SM_FighterShot6_4            ; list of all single vectorlists in this 
                    DW       SM_FighterShot6_3 
                    DW       SM_FighterShot6_2            ; list of all single vectorlists in this 
                    DW       SM_FighterShot6_1 
                    DW       0 
SM_FighterShot6_0 
                    db       $45, $01, -$10, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, $20, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $20, $01, $00, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $00, $01, -$20 
                    db       -$20, $01, $00 
                    db       -$59, $01, -$0A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $49, $01, -$1E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$38, $01, -$56, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $32, $01, $00 
                    db       $78, $01, $72 
                    db       $2E, $01, $09 
                    db       $3E, $01, -$0F 
                    db       -$15, $01, $0F 
                    db       $39, $01, $13 
                    db       -$39, $01, $13, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $13, $01, $0C 
                    db       -$3F, $01, -$0E 
                    db       -$2B, $01, $0B 
                    db       -$78, $01, $72 
                    db       -$32, $01, $00 
                    db       $38, $01, -$56 
                    db       -$4B, $01, -$25, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$29, $01, -$13, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $33, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $6B, $01, $00, hi(SMVB_startMove_tripple), lo(SMVB_startMove_tripple) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts_stay), lo(SMVB_lastDraw_rts_stay) 
SM_FighterShot6_1 
                    db       $45, $01, -$10, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, $20, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $20, $01, $00, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $00, $01, -$20 
                    db       -$20, $01, $00 
                    db       -$4F, $01, -$0A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $3F, $01, -$1D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$38, $01, -$56, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $32, $01, $00 
                    db       $78, $01, $72 
                    db       $2E, $01, $09 
                    db       $3E, $01, -$0F 
                    db       -$15, $01, $0F 
                    db       $39, $01, $13 
                    db       -$39, $01, $13, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $13, $01, $0C 
                    db       -$3F, $01, -$0E 
                    db       -$2B, $01, $0B 
                    db       -$78, $01, $72 
                    db       -$32, $01, $00 
                    db       $38, $01, -$56 
                    db       -$41, $01, -$25, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$29, $01, -$13, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $33, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $68, $01, $00, hi(SMVB_startMove_tripple), lo(SMVB_startMove_tripple) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts_stay), lo(SMVB_lastDraw_rts_stay) 
SM_FighterShot6_2 
                    db       $47, $01, -$0E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1C, $01, $00, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $00, $01, -$1C 
                    db       -$1C, $01, $00 
                    db       -$5B, $01, -$0C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $49, $01, -$1E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$38, $01, -$56, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $32, $01, $00 
                    db       $78, $01, $72 
                    db       $2E, $01, $09 
                    db       $3E, $01, -$0F 
                    db       -$15, $01, $0F 
                    db       $39, $01, $13 
                    db       -$39, $01, $13, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $13, $01, $0C 
                    db       -$3F, $01, -$0E 
                    db       -$2B, $01, $0B 
                    db       -$78, $01, $72 
                    db       -$32, $01, $00 
                    db       $38, $01, -$56 
                    db       -$4B, $01, -$25, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$29, $01, -$13, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $33, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $6B, $01, $00, hi(SMVB_startMove_tripple), lo(SMVB_startMove_tripple) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts_stay), lo(SMVB_lastDraw_rts_stay) 
SM_FighterShot6_3 
                    db       $49, $01, -$0C, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, $18, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $18, $01, $00, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $00, $01, -$18 
                    db       -$18, $01, $00 
                    db       -$53, $01, -$0E, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $3F, $01, -$1E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$38, $01, -$56, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $32, $01, $00 
                    db       $78, $01, $72 
                    db       $2E, $01, $09 
                    db       $3E, $01, -$0F 
                    db       -$15, $01, $0F 
                    db       $39, $01, $13 
                    db       -$39, $01, $13, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $13, $01, $0C 
                    db       -$3F, $01, -$0E 
                    db       -$2B, $01, $0B 
                    db       -$78, $01, $72 
                    db       -$32, $01, $00 
                    db       $38, $01, -$56 
                    db       -$41, $01, -$25, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$29, $01, -$13, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $33, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $68, $01, $00, hi(SMVB_startMove_tripple), lo(SMVB_startMove_tripple) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts_stay), lo(SMVB_lastDraw_rts_stay) 
SM_FighterShot6_4 
                    db       $4B, $01, -$0A, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, $14, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $14, $01, $00, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $00, $01, -$14 
                    db       -$14, $01, $00 
                    db       -$5F, $01, -$10, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $49, $01, -$1E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$38, $01, -$56, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $32, $01, $00 
                    db       $78, $01, $72 
                    db       $2E, $01, $09 
                    db       $3E, $01, -$0F 
                    db       -$15, $01, $0F 
                    db       $39, $01, $13 
                    db       -$39, $01, $13, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $13, $01, $0C 
                    db       -$3F, $01, -$0E 
                    db       -$2B, $01, $0B 
                    db       -$78, $01, $72 
                    db       -$32, $01, $00 
                    db       $38, $01, -$56 
                    db       -$4B, $01, -$25, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$29, $01, -$13, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $33, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $6B, $01, $00, hi(SMVB_startMove_tripple), lo(SMVB_startMove_tripple) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts_stay), lo(SMVB_lastDraw_rts_stay) 
SM_FighterShot6_5 
                    db       $4D, $01, -$08, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, $10, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $10, $01, $00, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $00, $01, -$10 
                    db       -$10, $01, $00 
                    db       -$57, $01, -$12, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $3F, $01, -$1D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$38, $01, -$56, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $32, $01, $00 
                    db       $78, $01, $72 
                    db       $2E, $01, $09 
                    db       $3E, $01, -$0F 
                    db       -$15, $01, $0F 
                    db       $39, $01, $13 
                    db       -$39, $01, $13, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $13, $01, $0C 
                    db       -$3F, $01, -$0E 
                    db       -$2B, $01, $0B 
                    db       -$78, $01, $72 
                    db       -$32, $01, $00 
                    db       $38, $01, -$56 
                    db       -$41, $01, -$25, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$29, $01, -$13, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $33, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $68, $01, $00, hi(SMVB_startMove_tripple), lo(SMVB_startMove_tripple) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts_stay), lo(SMVB_lastDraw_rts_stay) 
SM_FighterShot6_6 
                    db       $4F, $01, -$06, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $00, $01, $0C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0C, $01, $00, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $00, $01, -$0C 
                    db       -$0C, $01, $00 
                    db       -$5E, $01, -$14, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $44, $01, -$1D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$38, $01, -$56, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $32, $01, $00 
                    db       $78, $01, $72 
                    db       $2E, $01, $09 
                    db       $3E, $01, -$0F 
                    db       -$15, $01, $0F 
                    db       $39, $01, $13 
                    db       -$39, $01, $13, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $13, $01, $0C 
                    db       -$3F, $01, -$0E 
                    db       -$2B, $01, $0B 
                    db       -$78, $01, $72 
                    db       -$32, $01, $00 
                    db       $38, $01, -$56 
                    db       -$46, $01, -$25, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$29, $01, -$13, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $33, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $6A, $01, $00, hi(SMVB_startMove_tripple), lo(SMVB_startMove_tripple) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts_stay), lo(SMVB_lastDraw_rts_stay) 
 endif                                                    ; DRAW_FIGHTER_IN_BANK0 = 1 
 endif                                                    ; CURRENT_BANK = 0 
