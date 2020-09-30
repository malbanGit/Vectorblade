BonusBlasterAnim 
BonusBlaster_Anim 
                    DW       BlasterBonus                 ; list of all single vectorlists in this 
                    DW       0 
BlasterBonus 
                    db       -$19, $01, $1E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $46, $01, -$1E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$46, $01, -$1E, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $00, $01, $3C 
                    db       $49, $01, $12, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_0), lo(BonusCircle_0) 
BonusLaserAnim 
BonusLaser_Anim 
                    DW       LaserBonus                   ; list of all single vectorlists in this 
                    DW       0 
LaserBonus 
                    db       -$3C, $01, $06, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $7B, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$0C, hi(SMVB_continue_newY_eq_oldX_single), lo(SMVB_continue_newY_eq_oldX_single) ; y is $00 
                    db       -$7B, $01, $00, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       $00, $01, $0C, hi(SMVB_continue_newY_eq_oldX_single), lo(SMVB_continue_newY_eq_oldX_single) ; y is $00 
                    db       $6C, $01, $2A, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_0), lo(BonusCircle_0) 
BonusAutofireAnim 
BonusAutofire_Anim 
                    DW       AutofireBonus                ; list of all single vectorlists in this 
                    DW       0 
AutofireBonus 
                    db       -$37, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $16, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $17, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $16, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $ce , hi(SMVB_startMove_xyStays_single), lo(SMVB_startMove_xyStays_single) ; y was $16; x was $00 
                    db       $17, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$09, $01, $30, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_0), lo(BonusCircle_0) 
BonusLife 
                    dw       BonusLifeAnim 
                    db       BONUS_EXTRA_LIFE             ; type 
BonusLifeAnim 
BonusLife_Anim 
                    DW       LifeBonus0                   ; list of all single vectorlists in this 
                    DW       LifeBonus1 
                    DW       LifeBonus2 
                    DW       LifeBonus3 
                    DW       LifeBonus4 
                    DW       LifeBonus5 
                    DW       LifeBonus6 
                    DW       LifeBonus7 
                    DW       LifeBonus8 
                    DW       LifeBonus7 
                    DW       LifeBonus6 
                    DW       LifeBonus5 
                    DW       LifeBonus4 
                    DW       LifeBonus3 
                    DW       LifeBonus2 
                    DW       LifeBonus1 
                    DW       0 
LifeBonus 
LifeBonus0 
                    db       $1B, $01, $09, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0A, $01, $0F, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$0D, $01, $10 
                    db       -$18, $01, $03 
                    db       -$30, $01, -$2B 
                    db       $30, $01, -$2B 
                    db       $18, $01, $03 
                    db       $0D, $01, $10 
                    db       -$0A, $01, $0F, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$1B, $01, $09 
                    db       $30, $01, $30, hi(SMVB_startMove_yEqx_single_sj), lo(SMVB_startMove_yEqx_single_sj), hi(BonusCircle_0), lo(BonusCircle_0) ; y is $30 
LifeBonus1 
                    db       $19, $01, $09, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0A, $01, $0F, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$0D, $01, $10 
                    db       -$16, $01, $03 
                    db       -$2D, $01, -$2B 
                    db       $2D, $01, -$2B 
                    db       $16, $01, $03 
                    db       $0D, $01, $10 
                    db       -$0A, $01, $0F, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$19, $01, $09 
                    db       $2D, $01, $30, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_1), lo(BonusCircle_1) 
LifeBonus2 
                    db       $14, $01, $09, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $07, $01, $0F, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$09, $01, $10 
                    db       -$12, $01, $03 
                    db       -$23, $01, -$2B 
                    db       $23, $01, -$2B 
                    db       $12, $01, $03 
                    db       $09, $01, $10 
                    db       -$07, $01, $0F, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$14, $01, $09 
                    db       $23, $01, $30, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_2), lo(BonusCircle_2) 
LifeBonus3 
                    db       $0C, $01, $09, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $04, $01, $0F, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$05, $01, $10 
                    db       -$0B, $01, $03 
                    db       -$15, $01, -$2B 
                    db       $15, $01, -$2B 
                    db       $0B, $01, $03 
                    db       $05, $01, $10 
                    db       -$04, $01, $0F, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$0C, $01, $09 
                    db       $15, $01, $30, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_3), lo(BonusCircle_3) 
LifeBonus4 
                    db       $02, $01, $09, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $01, $01, $0F, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$01, $01, $10 
                    db       -$02, $01, $03 
                    db       -$04, $01, -$2B 
                    db       $04, $01, -$2B 
                    db       $02, $01, $03 
                    db       $01, $01, $10 
                    db       -$01, $01, $0F, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$02, $01, $09 
                    db       $04, $01, $30, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_4), lo(BonusCircle_4) 
LifeBonus5 
                    db       -$07, $01, $09, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$03, $01, $0F, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $03, $01, $10 
                    db       $07, $01, $03 
                    db       $0D, $01, -$2B 
                    db       -$0D, $01, -$2B 
                    db       -$07, $01, $03 
                    db       -$03, $01, $10 
                    db       $03, $01, $0F, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $07, $01, $09 
                    db       -$0D, $01, $30, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_5), lo(BonusCircle_5) 
LifeBonus6 
                    db       -$10, $01, $09, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$06, $01, $0F, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $08, $01, $10 
                    db       $0E, $01, $03 
                    db       $1D, $01, -$2B 
                    db       -$1D, $01, -$2B 
                    db       -$0E, $01, $03 
                    db       -$08, $01, $10 
                    db       $06, $01, $0F, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $10, $01, $09 
                    db       -$1D, $01, $30, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_6), lo(BonusCircle_6) 
LifeBonus7 
                    db       -$17, $01, $09, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$08, $01, $0F, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $0B, $01, $10 
                    db       $14, $01, $03 
                    db       $29, $01, -$2B 
                    db       -$29, $01, -$2B 
                    db       -$14, $01, $03 
                    db       -$0B, $01, $10 
                    db       $08, $01, $0F, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $17, $01, $09 
                    db       -$29, $01, $30, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_7), lo(BonusCircle_7) 
LifeBonus8 
                    db       -$1B, $01, $09, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$09, $01, $0F, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $0C, $01, $10 
                    db       $18, $01, $03 
                    db       $2F, $01, -$2B 
                    db       -$2F, $01, -$2B 
                    db       -$18, $01, $03 
                    db       -$0C, $01, $10 
                    db       $09, $01, $0F, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $1B, $01, $09 
                    db       -$2F, $01, $30, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_8), lo(BonusCircle_8) 
BonusSecretAnim 
                    DW       BonusSecret                  ; list of all single vectorlists in this 
                    DW       0 
BonusSecret 
                    db       $21, $01, -$19, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $16, $01, $19, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$16, $01, $19, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$1F, $01, -$19 
                    db       -$23, $01, $00 
                    db       -$16, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, $02, hi(SMVB_startDraw_newY_eq_oldX_single), lo(SMVB_startDraw_newY_eq_oldX_single) ; y was $00, now SHIFT 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
BonusLockAnim 
BonusLock_Anim 
                    DW       BonusLock                    ; list of all single vectorlists in this 
                    DW       0 
BonusLock 
                    db       $2E, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$03, $01, $10, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$0F, $01, $0B, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$18, $01, $03 
                    db       -$2C, $01, $00 
                    db       $00, $01, -$11 
                    db       $0C, $01, -$0D, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $15, $01, $04, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$08, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$15, $01, $04 
                    db       -$0C, $01, $0D, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, -$1D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$11, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $2C, $01, $00 
                    db       $00, $01, $3F 
                    db       $00, $01, -$3F 
                    db       $18, $01, $03 
                    db       $0F, $01, $0E 
                    db       $03, $01, $10 
                    db       $02, $01, $30, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_0), lo(BonusCircle_0) 
SuperBombAnim 
                    DW       SuperBomb_0                  ; list of all single vectorlists in this 
                    DW       0 
SuperBomb_0 
                    db       $19, $01, $11, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       SHITREG_POKE_VALUE, $01, $0C, hi(SMVB_startDraw_yStays_single), lo(SMVB_startDraw_yStays_single) ; y was $19, now SHIFT Poke 
                    db       $00, $01, -$3C, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$19, $01, $0C 
                    db       -$1A, $01, -$0E 
                    db       -$1D, $01, $0B 
                    db       -$0A, $01, $14 
                    db       $0A, $01, $16 
                    db       $1D, $01, $0B 
                    db       $19, $01, -$0F, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $17, $01, $1E, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BonusCircle_0), lo(BonusCircle_0) 
RankMarkerShopAnim 
                    DW       RankMarkerShop               ; list of all single vectorlists in this 
                    DW       0 
RankMarkerShop 
                    db       -$08, $01, -$40, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $24, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $20, $01, $07, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $1F, $01, $16 
                    db       $1F, $01, $23 
                    db       $0E, $01, $2B 
                    db       $00, $01, $2A 
                    db       -$0E, $01, $2B 
                    db       -$1F, $01, $23 
                    db       -$1F, $01, $16, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$20, $01, $07 
                    db       -$26, $01, $00 
                    db       -$20, $01, -$07 
                    db       -$1F, $01, -$16 
                    db       -$1F, $01, -$23 
                    db       -$0E, $01, -$2B 
                    db       $00, $01, -$2A, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $0E, $01, -$2B 
                    db       $1F, $01, -$23 
                    db       $1F, $01, -$16 
                    db       $22, $01, -$07 
                    db       $69, $01, $64, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $00, $01, $38, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$40, $01, -$09, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$16, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$14, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$14, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $14, $01, $00 
                    db       $00, $01, $14 
                    db       $16, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, -$14, hi(SMVB_startDraw_newY_eq_oldX_single), lo(SMVB_startDraw_newY_eq_oldX_single) ; y was $00, now SHIFT 
                    db       $40, $01, -$09, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $40, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Shot1ImmuneAnim 
                    DW       Shot1Immune                  ; list of all single vectorlists in this 
                    DW       0 
Shot1Immune 
                    db       -$1F, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $3E, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $11, $01, $30, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $18, $01, -$30, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$18, $01, -$30, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$30, $01, -$18 
                    db       -$30, $01, $18 
                    db       -$18, $01, $30 
                    db       $18, $01, $30 
                    db       $30, $01, $18 
                    db       $30, $01, -$18 
                    db       $05, $01, $08, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$18, $01, $0D, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$29, $01, -$3F, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       -$29, $01, -$3E 
                    db       $1A, $01, -$0D 
                    db       $27, $01, $3F 
                    db       $29, $01, $3F 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
; no space left, to lazy to optimize
; good place tooptimize is everything related to string printing
SHOT_REDUCTION      =        0 
 if  SHOT_REDUCTION = 1 
ShotReduction 
                    DW       ShotReduction_0              ; list of all single vectorlists in this 
                    DW       ShotReduction_1 
                    DW       ShotReduction_2 
                    DW       ShotReduction_3 
                    DW       ShotReduction_4 
                    DW       ShotReduction_5 
                    DW       ShotReduction_6 
                    DW       ShotReduction_7 
                    DW       ShotReduction_8 
                    DW       0 
ShotReduction_0 
                    db       $33, $01, -$0B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$15, $01, $14, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $04, $01, -$11, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$1B, $01, $0E 
                    db       $07, $01, -$0C 
                    db       -$16, $01, $06 
                    db       $5A, $01, $52, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(TriangleOuter_0), lo(TriangleOuter_0) 
ShotReduction_1 
                    db       $33, $01, -$0B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$15, $01, $14, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $04, $01, -$11, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$1B, $01, $0E 
                    db       $07, $01, -$0C 
                    db       -$16, $01, $06 
                    db       $5A, $01, $52, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(TriangleOuter_1), lo(TriangleOuter_1) 
ShotReduction_2 
                    db       $33, $01, -$0B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$15, $01, $14, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $04, $01, -$11, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$1B, $01, $0E 
                    db       $07, $01, -$0C 
                    db       -$16, $01, $06 
                    db       $5A, $01, $52, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(TriangleOuter_2), lo(TriangleOuter_2) 
ShotReduction_3 
                    db       $33, $01, -$0B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$15, $01, $14, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $04, $01, -$11, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$1B, $01, $0E 
                    db       $07, $01, -$0C 
                    db       -$16, $01, $06 
                    db       $5A, $01, $52, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(TriangleOuter_3), lo(TriangleOuter_3) 
ShotReduction_4 
                    db       $33, $01, -$0B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$15, $01, $14, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $04, $01, -$11, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$1B, $01, $0E 
                    db       $07, $01, -$0C 
                    db       -$16, $01, $06 
                    db       $5A, $01, $52, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(TriangleOuter_4), lo(TriangleOuter_4) 
ShotReduction_5 
                    db       $33, $01, -$0B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$15, $01, $14, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $04, $01, -$11, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$1B, $01, $0E 
                    db       $07, $01, -$0C 
                    db       -$16, $01, $06 
                    db       $5A, $01, $52, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(TriangleOuter_5), lo(TriangleOuter_5) 
ShotReduction_6 
                    db       $33, $01, -$0B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$15, $01, $14, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $04, $01, -$11, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$1B, $01, $0E 
                    db       $07, $01, -$0C 
                    db       -$16, $01, $06 
                    db       $5A, $01, $52, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(TriangleOuter_6), lo(TriangleOuter_6) 
ShotReduction_7 
                    db       $33, $01, -$0B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$15, $01, $14, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $04, $01, -$11, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$1B, $01, $0E 
                    db       $07, $01, -$0C 
                    db       -$16, $01, $06 
                    db       $5A, $01, $52, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(TriangleOuter_7), lo(TriangleOuter_7) 
ShotReduction_8 
                    db       $33, $01, -$0B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$15, $01, $14, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $04, $01, -$11, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$1B, $01, $0E 
                    db       $07, $01, -$0C 
                    db       -$16, $01, $06 
                    db       $5A, $01, $52, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(TriangleOuter_8), lo(TriangleOuter_8) 
 endif  
