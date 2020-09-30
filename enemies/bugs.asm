BirdOfPreyDefinition1 
                    dw       0                            ;not used MUST be zero to identify a bug enemy 
                    db       100                          ; hp 
                    dw       BirdOfPrey_anim 
                    db       1+128,TYPE_NONE              ;1+128 ,TYPE_NONE ; bullet speed and is missile 
BirdOfPreyDefinition2 
                    dw       0                            ;not used MUST be zero to identify a bug enemy 
                    db       120                          ; hp 
                    dw       BirdOfPrey_anim 
                    db       4+128,TYPE_NONE              ;1+128 ,TYPE_NONE ; bullet speed and is missile 
BirdOfPreyDefinition3 
                    dw       0                            ;not used MUST be zero to identify a bug enemy 
                    db       120                          ; hp 
                    dw       BirdOfPrey_anim 
                    db       3+32,TYPE_NONE               ;1+128 ,TYPE_NONE ; bullet speed and is missile 
BirdOfPreyDefinition4 
                    dw       0                            ;not used MUST be zero to identify a bug enemy 
                    db       120                          ; hp 
                    dw       BirdOfPrey_anim 
                    db       3,TYPE_NONE                  ;1+128 ,TYPE_NONE ; bullet speed and is missile 
BirdOfPreyDefinition5 
                    dw       0                            ;not used MUST be zero to identify a bug enemy 
                    db       100                          ; hp 
                    dw       BirdOfPrey_anim 
                    db       4,TYPE_NONE                  ;1+128 ,TYPE_NONE ; bullet speed and is missile 
BirdOfPreyDefinition6                                     ;     random shots! 
                    dw       0                            ;not used MUST be zero to identify a bug enemy 
                    db       100                          ; hp 
                    dw       BirdOfPrey_anim 
                    db       128+64+32+ 4,TYPE_NONE       ;1+128 ,TYPE_NONE ; bullet speed and is missile 
bigBugDestroyerDefinition1 
                    dw       0                            ;not used MUST be zero to identify a bug enemy 
                    db       70                           ; hp 
                    dw       Bug_Destroyer_anim 
                    db       1+128,TYPE_NONE              ;1+128 ,TYPE_NONE ; bullet speed and is missile 
bigBugDestroyerDefinition1_b 
                    dw       0                            ;not used MUST be zero to identify a bug enemy 
                    db       100                          ; hp 
                    dw       Bug_Destroyer_anim 
                    db       3+128,TYPE_NONE              ;1+128 ,TYPE_NONE ; bullet speed and is missile 
bigBugDestroyerDefinition2 
                    dw       0                            ;not used MUST be zero to identify a bug enemy 
                    db       100                          ; hp 
                    dw       Bug_Destroyer_anim 
                    db       3+32,TYPE_NONE               ;1+128 ,TYPE_NONE ; bullet speed and is missile 
bigBugDestroyerDefinition3 
                    dw       0                            ;not used MUST be zero to identify a bug enemy 
                    db       100                          ; hp 
                    dw       Bug_Destroyer_anim 
                    db       4,TYPE_NONE                  ;1+128 ,TYPE_NONE ; bullet speed and is missile 
Bug_Destroyer_anim 
                    dw       Bug_Destroyer 
                    dw       0 
bigBug1Definition 
                    dw       0                            ; not used MUST be zero to identify a bug enemy 
                    db       70                           ; hp 
                    dw       BigBug 
                    db       2 +32,TYPE_NONE              ; bullet speed +32 and is tripple shot 
bigBug2Definition 
                    dw       0                            ;not used MUST be zero to identify a bug enemy 
                    db       70                           ; hp 
                    dw       BigBug 
                    db       2,TYPE_NONE                  ;1+128,TYPE_NONE ; bullet speed and is target shot 
bigBug3Definition 
                    dw       0                            ;not used MUST be zero to identify a bug enemy 
                    db       70                           ; hp 
                    dw       BigBug 
                    db       1+128,TYPE_NONE              ;1+128 ,TYPE_NONE ; bullet speed and is missile 
BigBug 
                    DW       BigBug_0                     ; list of all single vectorlists in this 
                    DW       BigBug_1 
                    DW       BigBug_2 
                    DW       BigBug_1 
                    DW       0 
bigBugSin1Definition 
                    dw       0                            ; not used MUST be zero to identify a bug enemy 
                    db       86                           ; hp 
                    dw       BigBugSin 
                    db       2 +32 ,TYPE_NONE             ; bullet speed +32 and is tripple shot 
bigBugSin2Definition 
                    dw       0                            ;not used MUST be zero to identify a bug enemy 
                    db       86                           ; hp 
                    dw       BigBugSin 
                    db       2,TYPE_NONE                  ;1+128 ,TYPE_NONE ; bullet speed and is target shot 
bigBugSin3Definition 
                    dw       0                            ;not used MUST be zero to identify a bug enemy 
                    db       86                           ; hp 
                    dw       BigBugSin 
                    db       1+128,TYPE_NONE              ;1+128 ,TYPE_NONE ; bullet speed and is missile 
bigBugSin3Definition100 
                    dw       0                            ;not used MUST be zero to identify a bug enemy 
                    db       100                          ; hp 
                    dw       BigBugSin 
                    db       3+128,TYPE_NONE              ;1+128 ,TYPE_NONE ; bullet speed and is missile 
bigBugSin2Definition100 
                    dw       0                            ;not used MUST be zero to identify a bug enemy 
                    db       100                          ; hp 
                    dw       BigBugSin 
                    db       2,TYPE_NONE                  ;1+128 ,TYPE_NONE ; bullet speed and is target shot 
bigBugSin1Definition100 
                    dw       0                            ; not used MUST be zero to identify a bug enemy 
                    db       100                          ; hp 
                    dw       BigBugSin 
                    db       3 +32 ,TYPE_NONE             ; bullet speed +32 and is tripple shot 
BigBugSin 
                    DW       BugSin_0                     ; list of all single vectorlists in this 
                    DW       BugSin_1 
 if  NMI_HANDLER = 1 
 else  
                    DW       BugSin_2 
                    DW       BugSin_1 
 endif  
                    DW       0 
BigBug_0 
                    db       $59, $01, -$24, hi(SMVB_continue_tripple), lo(SMVB_continue_tripple) 
                    db       -$33, $01, $32, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$56, $01, $26, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$6F, $01, -$04, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$0E, $01, -$13, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$01, $01, -$33 
                    db       $30, $01, -$3E 
                    db       -$17, $01, -$19 
                    db       -$1D, $01, -$06 
                    db       $2D, $01, -$04 
                    db       $14, $01, $20 
                    db       $6A, $01, -$18, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$21, $01, -$18 
                    db       -$3A, $01, -$0C 
                    db       $48, $01, -$03 
                    db       $26, $01, $26 
                    db       $54, $01, $11 
                    db       $57, $01, -$2C 
                    db       $43, $01, $1B, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$4A, $01, $03 
                    db       -$31, $01, $18 
                    db       $41, $01, $33 
                    db       -$0D, $01, $41 
                    db       $29, $01, -$09 
                    db       $0E, $01, $36 
                    db       -$0E, $01, $2F, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$29, $01, -$08 
                    db       $0C, $01, $41 
                    db       -$41, $01, $33 
                    db       $32, $01, $18 
                    db       $49, $01, $02 
                    db       -$42, $01, $1A 
                    db       -$57, $01, -$2B, hi(SMVB_continue6_single), lo(SMVB_continue6_single) 
                    db       -$54, $01, $12 
                    db       -$26, $01, $25 
                    db       -$48, $01, -$02 
                    db       $3A, $01, -$0D 
                    db       $21, $01, -$18 
                    db       -$6A, $01, -$17, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$14, $01, $20, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$2D, $01, -$06 
                    db       $1D, $01, -$05 
                    db       $15, $01, -$19 
                    db       -$2F, $01, -$3E 
                    db       $02, $01, -$33 
                    db       $0E, $01, -$14 
                    db       $6F, $01, -$02, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $56, $01, $25 
                    db       $33, $01, $34 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
BigBug_1 
                    db       $59, $01, -$24, hi(SMVB_continue_tripple), lo(SMVB_continue_tripple) 
                    db       -$33, $01, $32, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$4F, $01, $24, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$6D, $01, -$05, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       -$0E, $01, -$13, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$0A, $01, -$30 
                    db       $30, $01, -$3E 
                    db       -$1B, $01, -$11 
                    db       -$1D, $01, -$06 
                    db       $29, $01, $02 
                    db       $1C, $01, $12 
                    db       $6A, $01, -$18, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$23, $01, -$12 
                    db       -$40, $01, -$0B 
                    db       $4E, $01, $01 
                    db       $28, $01, $1B 
                    db       $54, $01, $11 
                    db       $5A, $01, -$1E 
                    db       $3F, $01, $1D, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$45, $01, -$06 
                    db       -$35, $01, $11 
                    db       $41, $01, $33 
                    db       -$0D, $01, $41 
                    db       $29, $01, -$09 
                    db       $0E, $01, $36 
                    db       -$0E, $01, $2F, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$29, $01, -$08 
                    db       $0C, $01, $41 
                    db       -$41, $01, $33 
                    db       $39, $01, $0C 
                    db       $48, $01, $00 
                    db       -$40, $01, $18 
                    db       -$5F, $01, -$1B, hi(SMVB_continue6_single), lo(SMVB_continue6_single) 
                    db       -$54, $01, $12 
                    db       -$31, $01, $1D 
                    db       -$45, $01, -$06 
                    db       $38, $01, -$08 
                    db       $2B, $01, -$11 
                    db       -$6A, $01, -$17, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       -$24, $01, $1F, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$24, $01, -$0A 
                    db       $1C, $01, -$04 
                    db       $1D, $01, -$15 
                    db       -$2F, $01, -$3E 
                    db       $0A, $01, -$31 
                    db       $0F, $01, -$14 
                    db       $6C, $01, -$02, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $50, $01, $23 
                    db       $33, $01, $34 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
BigBug_2 
                    db       $59, $01, -$24, hi(SMVB_continue_tripple), lo(SMVB_continue_tripple) 
                    db       -$36, $01, $30, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$4C, $01, $26, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$66, $01, $02, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       -$15, $01, -$1A, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$0B, $01, -$30 
                    db       $2E, $01, -$39 
                    db       -$23, $01, -$10 
                    db       -$23, $01, -$08 
                    db       $30, $01, $00 
                    db       $26, $01, $0B 
                    db       $63, $01, -$11, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$27, $01, -$0D 
                    db       -$3C, $01, -$0F 
                    db       $4A, $01, $02 
                    db       $32, $01, $17 
                    db       $59, $01, $14 
                    db       $5B, $01, -$15 
                    db       $42, $01, $13, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$45, $01, $00 
                    db       -$34, $01, $0D 
                    db       $37, $01, $30 
                    db       -$0C, $01, $41 
                    db       $29, $01, -$0A 
                    db       $17, $01, $33 
                    db       -$17, $01, $32, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$29, $01, -$08 
                    db       $0B, $01, $41 
                    db       -$39, $01, $32 
                    db       $32, $01, $0A 
                    db       $4E, $01, $01 
                    db       -$44, $01, $13 
                    db       -$5F, $01, -$15, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$57, $01, $14 
                    db       -$3A, $01, $14 
                    db       -$40, $01, -$04 
                    db       $32, $01, -$0C 
                    db       $2E, $01, -$07 
                    db       -$63, $01, -$13 
                    db       -$2D, $01, $12, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$29, $01, -$0B 
                    db       $20, $01, -$04 
                    db       $25, $01, -$10 
                    db       -$2D, $01, -$39 
                    db       $0A, $01, -$31 
                    db       $17, $01, -$1A 
                    db       $65, $01, $05, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       $4D, $01, $25 
                    db       $36, $01, $31 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
BugSin_0 
                    db       $4C, $01, -$3C, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$2D, $01, $18, hi(SMVB_startDraw_yd4_single), lo(SMVB_startDraw_yd4_single) 
                    db       -$44, $01, $00, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$48, $01, $46 
                    db       $0D, $01, $0D 
                    db       $00, $01, $1A 
                    db       -$0D, $01, $0D 
                    db       $48, $01, $46 
                    db       $44, $01, $00 
                    db       $2D, $01, $19, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$24, $01, -$25, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$36, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$24, $01, -$2C, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $19, $01, -$07 
                    db       -$1B, $01, -$06 
                    db       $00, $01, -$35 
                    db       $1B, $01, -$07 
                    db       -$19, $01, -$07 
                    db       $24, $01, -$2C 
                    db       $36, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $43, $01, $32, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BugSin_3), lo(BugSin_3) 
BugSin_1 
                    db       $4C, $01, -$3C, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$2D, $01, $18, hi(SMVB_startDraw_yd4_single), lo(SMVB_startDraw_yd4_single) 
                    db       -$41, $01, $00, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$48, $01, $46 
                    db       $0E, $01, $0D 
                    db       $00, $01, $1A 
                    db       -$0E, $01, $0D 
                    db       $48, $01, $46 
                    db       $41, $01, $00 
                    db       $2D, $01, $19, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$24, $01, -$25, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$27, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$24, $01, -$2C, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $19, $01, -$07 
                    db       -$1A, $01, -$06 
                    db       $00, $01, -$35 
                    db       $1A, $01, -$07 
                    db       -$19, $01, -$07 
                    db       $24, $01, -$2C 
                    db       $27, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $43, $01, $32, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BugSin_3), lo(BugSin_3) 
 if  NMI_HANDLER = 1 
 else  
BugSin_2 
                    db       $4C, $01, -$3C, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$2D, $01, $18, hi(SMVB_startDraw_yd4_single), lo(SMVB_startDraw_yd4_single) 
                    db       -$3B, $01, $00, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$48, $01, $46 
                    db       $0E, $01, $0D 
                    db       $00, $01, $1A 
                    db       -$0E, $01, $0D 
                    db       $48, $01, $46 
                    db       $3B, $01, $00 
                    db       $2D, $01, $19, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$24, $01, -$25, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$14, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$24, $01, -$2C, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $1A, $01, -$07 
                    db       -$1B, $01, -$06 
                    db       $00, $01, -$35 
                    db       $1B, $01, -$07 
                    db       -$1A, $01, -$07 
                    db       $24, $01, -$2C 
                    db       $14, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $43, $01, $32, hi(SMVB_startMove_single_sj), lo(SMVB_startMove_single_sj), hi(BugSin_3), lo(BugSin_3) 
 endif  
BugSin_3 
                    db       $2E, $01, -$2E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$23, $01, -$10, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$0B, $01, $3E 
                    db       -$36, $01, $22, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$0B, $01, $10, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $30, $01, -$10, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$30, $01, -$10 
                    db       $0B, $01, $10 
                    db       $36, $01, $22, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $2E, $01, $2E, hi(SMVB_startDraw_yEqx_single), lo(SMVB_startDraw_yEqx_single) ; y is $2E 
                    db       -$23, $01, $10, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$0B, $01, -$3E 
                    db       $54, $01, -$40, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       -$6D, $01, $5E, hi(SMVB_startDraw_yd4_single), lo(SMVB_startDraw_yd4_single) 
                    db       $6D, $01, $5E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$0F, $01, -$0D, hi(SMVB_startMove_yd4_single), lo(SMVB_startMove_yd4_single) 
                    db       $17, $01, -$24, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$5A, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$17, $01, -$24 
                    db       -$61, $01, -$5A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, $66, hi(SMVB_startDraw_yStays_single), lo(SMVB_startDraw_yStays_single) ; y was -$61, now SHIFT Poke 
                    db       $2E, $01, -$6A, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $33, $01, -$69 
                    db       $00, $01, $6D 
                    db       $30, $01, $09 
                    db       $78, $01, -$34 
                    db       -$38, $01, $78, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       -$40, $01, -$44, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$24, $01, $52 
                    db       -$24, $01, $50 
                    db       $24, $01, $50 
                    db       $24, $01, $52 
                    db       $40, $01, -$44 
                    db       $38, $01, $78 
                    db       -$78, $01, -$34, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       -$30, $01, $09, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $00, $01, $6D 
                    db       -$33, $01, -$69 
                    db       -$30, $01, -$6A 
                    db       $63, $01, $66 
                    db       -$40, $01, -$18, hi(SMVB_startMove_yd4_single), lo(SMVB_startMove_yd4_single) 
                    db       -$60, $01, -$66, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1A, $01, -$05, hi(SMVB_continue6_single), lo(SMVB_continue6_single) 
                    db       $15, $01, -$06 
                    db       $00, $01, -$47 
                    db       -$15, $01, -$03 
                    db       $1A, $01, -$05 
                    db       $60, $01, -$65 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
                    db       $26, $01, -$26, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1D, $01, -$0D, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$09, $01, $33 
                    db       -$2E, $01, $1D, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$09, $01, $0E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $28, $01, -$0E, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$28, $01, -$0E 
                    db       $09, $01, $0E 
                    db       $2E, $01, $1D, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $26, $01, $26, hi(SMVB_startDraw_yEqx_single), lo(SMVB_startDraw_yEqx_single) ; y is $26 
                    db       -$1D, $01, $0D, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$09, $01, -$33 
                    db       $46, $01, -$36, hi(SMVB_startMove_double), lo(SMVB_startMove_double) 
                    db       -$5B, $01, $4F, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $5B, $01, $4F, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$0D, $01, -$0B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $13, $01, -$1E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$4C, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$13, $01, -$1E 
                    db       -$51, $01, -$4B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       SHITREG_POKE_VALUE, $01, $55, hi(SMVB_startDraw_yStays_single), lo(SMVB_startDraw_yStays_single) ; y was -$51, now SHIFT Poke 
                    db       $27, $01, -$58, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $2A, $01, -$58 
                    db       $00, $01, $5B 
                    db       $28, $01, $08 
                    db       $64, $01, -$2C 
                    db       -$2E, $01, $64 
                    db       -$36, $01, -$38 
                    db       -$1E, $01, $44, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$1E, $01, $43 
                    db       $1E, $01, $43 
                    db       $1E, $01, $44 
                    db       $36, $01, -$38 
                    db       $2E, $01, $64 
                    db       -$64, $01, -$2C 
                    db       -$28, $01, $08, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       $00, $01, $5B 
                    db       -$2A, $01, -$58 
                    db       -$29, $01, -$58 
                    db       $53, $01, $55 
                    db       -$35, $01, -$14, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$51, $01, -$55, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$15, $01, -$04, hi(SMVB_continue6_single), lo(SMVB_continue6_single) 
                    db       $11, $01, -$05 
                    db       $00, $01, -$3C 
                    db       -$11, $01, -$03 
                    db       $15, $01, -$04 
                    db       $51, $01, -$54 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
Bug_Destroyer 
                    db       -$57, $01, $00, hi(SMVB_continue_tripple), lo(SMVB_continue_tripple) 
                    db       $51, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $33, $01, $0C, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$1C, $01, -$0C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $1C, $01, -$0C, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $6B, $01, -$14, hi(SMVB_startMove_quadro), lo(SMVB_startMove_quadro) 
                    db       $19, $01, $13, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$61, hi(SMVB_continue3_single), lo(SMVB_continue3_single) 
                    db       -$2D, $01, $23 
                    db       -$1E, $01, -$38 
                    db       -$62, $01, $20, hi(SMVB_continue_hex), lo(SMVB_continue_hex) 
                    db       $62, $01, $20, hi(SMVB_continue_hex), lo(SMVB_continue_hex) 
                    db       $1B, $01, -$3B, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       $2B, $01, $28 
                    db       $00, $01, -$61 
                    db       -$15, $01, $15 
                    db       $01, $01, -$07, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $28, $01, -$5B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$23, $01, -$48, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$10, $01, $29, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$1F, $01, $10, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, $21, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $1F, $01, $0F 
                    db       $17, $01, -$21 
                    db       -$17, $01, -$1F 
                    db       -$1B, $01, $00 
                    db       -$1D, $01, $10 
                    db       $00, $01, $21 
                    db       $17, $01, $0F, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $21, $01, $00 
                    db       $29, $01, -$0A, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $26, $01, $1C, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $00, $01, -$62, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$26, $01, $1A 
                    db       -$58, $01, -$12, hi(SMVB_startMove_tripple), lo(SMVB_startMove_tripple) 
                    db       -$46, $01, $1A, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $00, $01, $2E, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $46, $01, $1A, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $3E, $01, $15, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $1A, $01, -$60, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$1A, $01, -$60, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       -$1B, $01, $27 
                    db       $13, $01, $39 
                    db       -$13, $01, $3D 
                    db       $1B, $01, $23 
                    db       $3A, $01, $00 
                    db       $0E, $01, $21 
                    db       $2A, $01, $00, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $0A, $01, $05, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $29, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0E, $01, -$43, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$0E, $01, -$44, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$29, $01, $00, hi(SMVB_continue5_single), lo(SMVB_continue5_single) 
                    db       -$16, $01, $13 
                    db       -$1E, $01, $76 
                    db       $1E, $01, $76 
                    db       $16, $01, $10 
                    db       -$12, $01, -$43, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $12, $01, -$44, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$0C, $01, $08, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$28, $01, $00, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       -$11, $01, $21, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$37, $01, $00 
                    db       $37, $01, $00 
                    db       $16, $01, $4F 
                    db       $01, $01, $28, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$14, $01, $49, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
BirdOfPrey_anim 
                    DW       BirdOfPrey                   ; list of all single vectorlists in this 
                    DW       0 
BirdOfPrey 
                    db       $6E, $01, -$58, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$12, $01, $5B, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $47, $01, $14, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $29, $01, $00, hi(SMVB_continue7_single), lo(SMVB_continue7_single) 
                    db       $00, $01, $22 
                    db       $43, $01, $0C 
                    db       -$43, $01, $0C 
                    db       $00, $01, $22 
                    db       -$29, $01, $00 
                    db       -$0F, $01, -$22 
                    db       -$75, $01, $08, hi(SMVB_continue_yd4_single), lo(SMVB_continue_yd4_single) 
                    db       -$0F, $01, $0F, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       -$20, $01, $0B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$0B, $01, -$2E, hi(SMVB_startDraw_single), lo(SMVB_startDraw_single) 
                    db       $0B, $01, -$2E, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $20, $01, $0B, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       $0F, $01, $0F, hi(SMVB_startDraw_yEqx_single), lo(SMVB_startDraw_yEqx_single) ; y is $0F 
                    db       $75, $01, $08, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $0F, $01, -$22 
                    db       $13, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$2B, $01, -$41, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $56, $01, -$13, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       $1F, $01, -$20 
                    db       -$78, $01, $04, hi(SMVB_continue_yd4_double), lo(SMVB_continue_yd4_double) 
                    db       $00, $01, $17, hi(SMVB_continue6_single), lo(SMVB_continue6_single) 
                    db       $2B, $01, $0B 
                    db       -$1E, $01, $78 
                    db       -$04, $01, $00 
                    db       -$19, $01, $13 
                    db       -$06, $01, $22 
                    db       -$51, $01, -$04, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$24, $01, -$0F, hi(SMVB_continue4_single), lo(SMVB_continue4_single) 
                    db       -$3E, $01, $23 
                    db       $3E, $01, $23 
                    db       $24, $01, -$0F 
                    db       $51, $01, -$04, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       $06, $01, $22, hi(SMVB_continue6_single), lo(SMVB_continue6_single) 
                    db       $19, $01, $13 
                    db       $04, $01, $00 
                    db       $1E, $01, $78 
                    db       -$2B, $01, $0B 
                    db       $00, $01, $17 
                    db       $78, $01, $04, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$1F, $01, -$20, hi(SMVB_continue2_single), lo(SMVB_continue2_single) 
                    db       -$56, $01, -$13 
                    db       $2B, $01, -$41, hi(SMVB_continue_double), lo(SMVB_continue_double) 
                    db       -$13, $01, $00, hi(SMVB_startMove_single), lo(SMVB_startMove_single) 
                    db       -$47, $01, $14, hi(SMVB_startDraw_double), lo(SMVB_startDraw_double) 
                    db       $12, $01, $5B, hi(SMVB_continue_single), lo(SMVB_continue_single) 
                    db       $fe, $00, $00, hi(SMVB_lastDraw_rts2), lo(SMVB_lastDraw_rts2) 
