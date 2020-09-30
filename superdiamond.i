; bank1
SuperDiamondAnim: 
                    DW       SuperDiamond_0               ; list of all single vectorlists in this 
                    DW       SuperDiamond_1 
                    DW       SuperDiamond_2 
                    DW       SuperDiamond_3 
                    DW       SuperDiamond_4 
                    DW       SuperDiamond_5 
                    DW       SuperDiamond_6 
                    DW       SuperDiamond_7 
                    DW       SuperDiamond_8 
                    DW       SuperDiamond_9 
                    DW       SuperDiamond_10 
                    DW       SuperDiamond_11 
                    DW       SuperDiamond_12 
                    DW       SuperDiamond_13 
                    DW       SuperDiamond_14 
                    DW       SuperDiamond_15 
                    DW       SuperDiamond_16 
                    DW       SuperDiamond_17 
                    DW       SuperDiamond_18 
                    DW       SuperDiamond_19 
                    DW       SuperDiamond_20 
                    DW       0 
SuperDiamond_0: 
                    DB       $01, +$55, +$3B              ; sync and move to y, x 
                    DB       $FF, -$14, +$21              ; draw, y, x 
                    DB       $FF, -$1A, +$1D              ; draw, y, x 
                    DB       $FF, -$41, -$3E              ; draw, y, x 
                    DB       $FF, -$35, -$3B              ; draw, y, x 
                    DB       $FF, +$35, +$2C              ; draw, y, x 
                    DB       $FF, +$41, +$4D              ; draw, y, x 
                    DB       $FF, +$00, -$48              ; draw, y, x 
                    DB       $FF, +$1A, +$10              ; draw, y, x 
                    DB       $FF, +$14, -$27              ; draw, y, x 
                    DB       $01, +$55, +$1A              ; sync and move to y, x 
                    DB       $FF, +$00, -$30              ; draw, y, x 
                    DB       $FF, +$00, -$25              ; draw, y, x 
                    DB       $FF, -$14, -$21              ; draw, y, x 
                    DB       $FF, -$1A, -$1B              ; draw, y, x 
                    DB       $FF, +$1A, +$3A              ; draw, y, x 
                    DB       $01, +$41, -$3D              ; sync and move to y, x 
                    DB       $FF, +$14, +$28              ; draw, y, x 
                    DB       $FF, -$14, +$15              ; draw, y, x 
                    DB       $FF, -$1A, -$33              ; draw, y, x 
                    DB       $FF, +$00, -$44              ; draw, y, x 
                    DB       $FF, -$41, +$3C              ; draw, y, x 
                    DB       $01, -$1A, -$3B              ; sync and move to y, x 
                    DB       $FF, -$35, +$3B              ; draw, y, x 
                    DB       $00, +$35, -$25              ; mode, y, x 
                    DB       $FF, +$41, -$52              ; draw, y, x 
                    DB       $00, +$2E, +$3C              ; mode, y, x 
                    DB       $FF, -$14, -$02              ; draw, y, x 
                    DB       $01, +$41, -$3D              ; sync and move to y, x 
                    DB       $FF, -$1A, +$0A              ; draw, y, x 
                    DB       $FF, -$41, +$34              ; draw, y, x 
                    DB       $FF, -$35, -$01              ; draw, y, x 
                    DB       $FF, +$35, -$25              ; draw, y, x 
                    DB       $FF, +$41, -$0E              ; draw, y, x 
                    DB       $01, +$27, -$33              ; sync and move to y, x 
                    DB       $FF, +$00, +$64              ; draw, y, x 
                    DB       $FF, +$1A, -$31              ; draw, y, x 
                    DB       $FF, +$14, +$1A              ; draw, y, x 
                    DB       $FF, +$00, +$21              ; draw, y, x 
                    DB       $FF, -$14, +$06              ; draw, y, x 
                    DB       $01, +$41, +$41              ; sync and move to y, x 
                    DB       $FF, -$1A, +$38              ; draw, y, x 
                    DB       $00, -$41, -$4D              ; mode, y, x 
                    DB       $FF, +$40, +$05              ; draw, y, x 
                    DB       $00, +$01, +$00              ; mode, y, x 
                    DB       $FF, -$41, -$30              ; draw, y, x 
                    DB       $02                          ; endmarker 
SuperDiamond_1: 
                    DB       $01, -$4F, +$00              ; sync and move to y, x 
                    DB       $FF, +$35, -$3B              ; draw, y, x 
                    DB       $00, +$00, +$17              ; mode, y, x 
                    DB       $FF, -$35, +$24              ; draw, y, x 
                    DB       $FF, +$35, +$05              ; draw, y, x 
                    DB       $FF, +$41, +$2E              ; draw, y, x 
                    DB       $01, +$27, +$33              ; sync and move to y, x 
                    DB       $FF, -$41, -$06              ; draw, y, x 
                    DB       $FF, +$41, +$4C              ; draw, y, x 
                    DB       $FF, +$1A, -$35              ; draw, y, x 
                    DB       $FF, +$14, -$0A              ; draw, y, x 
                    DB       $FF, +$00, -$1E              ; draw, y, x 
                    DB       $01, +$55, +$1C              ; sync and move to y, x 
                    DB       $FF, +$00, -$2D              ; draw, y, x 
                    DB       $FF, +$00, -$29              ; draw, y, x 
                    DB       $FF, -$14, -$01              ; draw, y, x 
                    DB       $FF, -$1A, -$3A              ; draw, y, x 
                    DB       $FF, -$41, +$3A              ; draw, y, x 
                    DB       $01, -$1A, -$3B              ; sync and move to y, x 
                    DB       $FF, +$41, -$3E              ; draw, y, x 
                    DB       $FF, +$00, +$04              ; draw, y, x 
                    DB       $FF, -$41, +$51              ; draw, y, x 
                    DB       $FF, +$41, -$05              ; draw, y, x 
                    DB       $FF, +$00, +$5B              ; draw, y, x 
                    DB       $FF, +$1A, -$2F              ; draw, y, x 
                    DB       $01, +$41, +$03              ; sync and move to y, x 
                    DB       $FF, +$14, +$19              ; draw, y, x 
                    DB       $FF, -$14, +$28              ; draw, y, x 
                    DB       $FF, -$1A, -$12              ; draw, y, x 
                    DB       $FF, +$00, +$47              ; draw, y, x 
                    DB       $00, +$2E, -$3F              ; mode, y, x 
                    DB       $01, +$55, +$3A              ; sync and move to y, x 
                    DB       $FF, -$14, +$22              ; draw, y, x 
                    DB       $FF, -$1A, +$1D              ; draw, y, x 
                    DB       $FF, -$41, -$3E              ; draw, y, x 
                    DB       $FF, -$35, -$3B              ; draw, y, x 
                    DB       $FF, +$35, +$2D              ; draw, y, x 
                    DB       $01, -$1A, +$2D              ; sync and move to y, x 
                    DB       $00, +$00, -$28              ; mode, y, x 
                    DB       $FF, +$41, -$2E              ; draw, y, x 
                    DB       $FF, +$1A, -$12              ; draw, y, x 
                    DB       $FF, +$14, +$2A              ; draw, y, x 
                    DB       $FF, -$14, +$14              ; draw, y, x 
                    DB       $01, +$41, +$03              ; sync and move to y, x 
                    DB       $FF, -$1A, -$2C              ; draw, y, x 
                    DB       $FF, +$00, -$4C              ; draw, y, x 
                    DB       $FF, +$1A, +$19              ; draw, y, x 
                    DB       $FF, +$14, +$22              ; draw, y, x 
                    DB       $00, -$14, -$22              ; mode, y, x 
                    DB       $FF, -$1A, -$1D              ; draw, y, x 
                    DB       $02                          ; endmarker 
SuperDiamond_2: 
                    DB       $01, -$4F, +$00              ; sync and move to y, x 
                    DB       $FF, +$35, +$08              ; draw, y, x 
                    DB       $00, +$00, +$26              ; mode, y, x 
                    DB       $FF, +$41, +$09              ; draw, y, x 
                    DB       $FF, +$00, +$44              ; draw, y, x 
                    DB       $00, +$2E, -$42              ; mode, y, x 
                    DB       $01, +$55, +$39              ; sync and move to y, x 
                    DB       $FF, -$14, +$23              ; draw, y, x 
                    DB       $FF, -$1A, +$1F              ; draw, y, x 
                    DB       $FF, -$41, -$40              ; draw, y, x 
                    DB       $FF, -$35, -$3B              ; draw, y, x 
                    DB       $FF, +$35, +$2E              ; draw, y, x 
                    DB       $01, -$1A, +$2E              ; sync and move to y, x 
                    DB       $FF, +$41, +$4D              ; draw, y, x 
                    DB       $FF, +$1A, -$35              ; draw, y, x 
                    DB       $FF, +$14, -$0D              ; draw, y, x 
                    DB       $FF, +$00, -$1A              ; draw, y, x 
                    DB       $FF, -$14, -$18              ; draw, y, x 
                    DB       $01, +$41, +$07              ; sync and move to y, x 
                    DB       $FF, -$1A, +$30              ; draw, y, x 
                    DB       $FF, +$00, -$5B              ; draw, y, x 
                    DB       $FF, -$41, +$2C              ; draw, y, x 
                    DB       $FF, +$41, +$2F              ; draw, y, x 
                    DB       $FF, +$1A, +$0F              ; draw, y, x 
                    DB       $FF, +$14, -$27              ; draw, y, x 
                    DB       $01, +$55, +$1F              ; sync and move to y, x 
                    DB       $FF, +$00, -$2E              ; draw, y, x 
                    DB       $FF, -$14, +$16              ; draw, y, x 
                    DB       $FF, -$1A, -$2B              ; draw, y, x 
                    DB       $FF, -$41, +$01              ; draw, y, x 
                    DB       $00, +$00, -$17              ; mode, y, x 
                    DB       $01, -$1A, -$3A              ; sync and move to y, x 
                    DB       $FF, -$35, +$3A              ; draw, y, x 
                    DB       $FF, +$35, -$23              ; draw, y, x 
                    DB       $FF, +$41, -$50              ; draw, y, x 
                    DB       $FF, +$00, +$4F              ; draw, y, x 
                    DB       $FF, +$1A, -$15              ; draw, y, x 
                    DB       $01, +$41, -$39              ; sync and move to y, x 
                    DB       $FF, -$1A, -$3A              ; draw, y, x 
                    DB       $FF, -$41, +$39              ; draw, y, x 
                    DB       $FF, +$41, -$40              ; draw, y, x 
                    DB       $FF, +$00, +$07              ; draw, y, x 
                    DB       $FF, +$1A, +$18              ; draw, y, x 
                    DB       $01, +$41, -$5B              ; sync and move to y, x 
                    DB       $FF, +$14, +$22              ; draw, y, x 
                    DB       $FF, -$14, +$00              ; draw, y, x 
                    DB       $FF, +$14, +$2A              ; draw, y, x 
                    DB       $FF, +$00, -$2A              ; draw, y, x 
                    DB       $00, -$14, -$22              ; mode, y, x 
                    DB       $FF, -$1A, -$1F              ; draw, y, x 
                    DB       $02                          ; endmarker 
SuperDiamond_3: 
                    DB       $01, +$55, -$37              ; sync and move to y, x 
                    DB       $FF, -$14, -$24              ; draw, y, x 
                    DB       $00, -$1A, -$21              ; mode, y, x 
                    DB       $FF, +$1A, +$21              ; draw, y, x 
                    DB       $FF, -$1A, -$16              ; draw, y, x 
                    DB       $FF, +$00, -$0B              ; draw, y, x 
                    DB       $01, +$27, -$5A              ; sync and move to y, x 
                    DB       $00, +$00, -$22              ; additional sync move to y, x 
                    DB       $FF, -$41, +$42              ; draw, y, x 
                    DB       $FF, -$35, +$3A              ; draw, y, x 
                    DB       $FF, +$35, +$3B              ; draw, y, x 
                    DB       $FF, +$41, +$42              ; draw, y, x 
                    DB       $FF, +$1A, -$22              ; draw, y, x 
                    DB       $01, +$41, +$5A              ; sync and move to y, x 
                    DB       $00, +$00, +$01              ; additional sync move to y, x 
                    DB       $FF, +$14, -$24              ; draw, y, x 
                    DB       $FF, -$14, +$12              ; draw, y, x 
                    DB       $FF, -$1A, +$34              ; draw, y, x 
                    DB       $FF, +$00, -$42              ; draw, y, x 
                    DB       $FF, +$00, -$5A              ; draw, y, x 
                    DB       $01, +$27, -$1F              ; sync and move to y, x 
                    DB       $FF, +$00, -$52              ; draw, y, x 
                    DB       $FF, +$1A, +$39              ; draw, y, x 
                    DB       $FF, -$1A, +$19              ; draw, y, x 
                    DB       $FF, +$1A, +$29              ; draw, y, x 
                    DB       $FF, +$14, -$17              ; draw, y, x 
                    DB       $FF, -$14, -$2B              ; draw, y, x 
                    DB       $01, +$41, -$38              ; sync and move to y, x 
                    DB       $FF, +$14, +$01              ; draw, y, x 
                    DB       $FF, +$00, +$2A              ; draw, y, x 
                    DB       $FF, +$00, +$2D              ; draw, y, x 
                    DB       $FF, -$14, +$29              ; draw, y, x 
                    DB       $FF, -$1A, -$0E              ; draw, y, x 
                    DB       $01, +$27, +$3B              ; sync and move to y, x 
                    DB       $FF, -$41, -$31              ; draw, y, x 
                    DB       $FF, +$41, -$29              ; draw, y, x 
                    DB       $FF, -$41, -$03              ; draw, y, x 
                    DB       $FF, -$35, +$22              ; draw, y, x 
                    DB       $FF, +$35, +$2F              ; draw, y, x 
                    DB       $01, -$1A, +$2F              ; sync and move to y, x 
                    DB       $FF, +$41, +$0C              ; draw, y, x 
                    DB       $FF, +$1A, -$31              ; draw, y, x 
                    DB       $FF, +$14, +$16              ; draw, y, x 
                    DB       $FF, +$00, +$18              ; draw, y, x 
                    DB       $00, -$2E, +$45              ; mode, y, x 
                    DB       $01, +$27, +$5A              ; sync and move to y, x 
                    DB       $00, +$00, +$23              ; additional sync move to y, x 
                    DB       $FF, -$41, -$4E              ; draw, y, x 
                    DB       $00, -$35, -$2F              ; mode, y, x 
                    DB       $FF, +$35, +$0A              ; draw, y, x 
                    DB       $00, +$00, -$2C              ; mode, y, x 
                    DB       $FF, +$41, -$4F              ; draw, y, x 
                    DB       $FF, -$41, +$37              ; draw, y, x 
                    DB       $02                          ; endmarker 
SuperDiamond_4: 
                    DB       $01, +$27, -$5A              ; sync and move to y, x 
                    DB       $00, +$00, -$23              ; additional sync move to y, x 
                    DB       $FF, +$00, +$0E              ; draw, y, x 
                    DB       $FF, +$1A, +$39              ; draw, y, x 
                    DB       $FF, +$14, +$00              ; draw, y, x 
                    DB       $FF, -$14, -$24              ; draw, y, x 
                    DB       $FF, +$14, +$23              ; draw, y, x 
                    DB       $01, +$55, -$37              ; sync and move to y, x 
                    DB       $00, +$00, +$00              ; mode, y, x 
                    DB       $FF, +$00, +$2C              ; draw, y, x 
                    DB       $FF, +$00, +$2D              ; draw, y, x 
                    DB       $FF, -$14, +$29              ; draw, y, x 
                    DB       $FF, -$1A, +$33              ; draw, y, x 
                    DB       $01, +$27, +$5A              ; sync and move to y, x 
                    DB       $00, +$00, +$24              ; additional sync move to y, x 
                    DB       $FF, -$41, -$4E              ; draw, y, x 
                    DB       $FF, +$41, +$0F              ; draw, y, x 
                    DB       $FF, +$1A, -$31              ; draw, y, x 
                    DB       $FF, +$14, +$14              ; draw, y, x 
                    DB       $FF, +$00, +$15              ; draw, y, x 
                    DB       $01, +$55, +$37              ; sync and move to y, x 
                    DB       $00, -$2E, +$47              ; mode, y, x 
                    DB       $FF, +$1A, -$23              ; draw, y, x 
                    DB       $FF, +$14, -$24              ; draw, y, x 
                    DB       $FF, -$14, +$14              ; draw, y, x 
                    DB       $FF, -$1A, -$0C              ; draw, y, x 
                    DB       $FF, -$41, -$32              ; draw, y, x 
                    DB       $01, -$1A, +$0D              ; sync and move to y, x 
                    DB       $FF, +$41, -$28              ; draw, y, x 
                    DB       $FF, +$1A, +$29              ; draw, y, x 
                    DB       $FF, +$14, -$19              ; draw, y, x 
                    DB       $FF, -$14, -$2B              ; draw, y, x 
                    DB       $FF, -$1A, +$1B              ; draw, y, x 
                    DB       $01, +$27, -$1B              ; sync and move to y, x 
                    DB       $FF, +$00, -$54              ; draw, y, x 
                    DB       $FF, -$41, +$36              ; draw, y, x 
                    DB       $FF, -$35, +$39              ; draw, y, x 
                    DB       $FF, +$35, +$3A              ; draw, y, x 
                    DB       $FF, +$41, +$44              ; draw, y, x 
                    DB       $FF, +$00, -$3F              ; draw, y, x 
                    DB       $01, +$27, +$3F              ; sync and move to y, x 
                    DB       $FF, +$00, -$5A              ; draw, y, x 
                    DB       $FF, -$41, -$06              ; draw, y, x 
                    DB       $FF, +$41, -$4E              ; draw, y, x 
                    DB       $FF, +$1A, +$15              ; draw, y, x 
                    DB       $FF, -$1A, -$23              ; draw, y, x 
                    DB       $01, +$27, -$5A              ; sync and move to y, x 
                    DB       $00, +$00, -$23              ; additional sync move to y, x 
                    DB       $FF, -$41, +$44              ; draw, y, x 
                    DB       $00, +$00, +$18              ; mode, y, x 
                    DB       $FF, -$35, +$21              ; draw, y, x 
                    DB       $FF, +$35, +$0D              ; draw, y, x 
                    DB       $00, +$00, +$23              ; mode, y, x 
                    DB       $FF, -$35, -$30              ; draw, y, x 
                    DB       $02                          ; endmarker 
SuperDiamond_5: 
                    DB       $01, +$27, -$59              ; sync and move to y, x 
                    DB       $00, +$00, -$25              ; additional sync move to y, x 
                    DB       $FF, +$00, +$12              ; draw, y, x 
                    DB       $FF, +$1A, +$39              ; draw, y, x 
                    DB       $FF, -$1A, +$1D              ; draw, y, x 
                    DB       $FF, +$1A, +$27              ; draw, y, x 
                    DB       $FF, -$1A, +$32              ; draw, y, x 
                    DB       $01, +$27, +$43              ; sync and move to y, x 
                    DB       $FF, +$1A, +$0A              ; draw, y, x 
                    DB       $FF, +$14, -$29              ; draw, y, x 
                    DB       $FF, -$14, -$13              ; draw, y, x 
                    DB       $FF, +$14, -$1A              ; draw, y, x 
                    DB       $FF, -$14, -$2A              ; draw, y, x 
                    DB       $01, +$41, -$33              ; sync and move to y, x 
                    DB       $FF, +$14, -$02              ; draw, y, x 
                    DB       $FF, -$14, -$24              ; draw, y, x 
                    DB       $FF, +$14, +$22              ; draw, y, x 
                    DB       $00, +$00, +$00              ; mode, y, x 
                    DB       $FF, +$00, +$2E              ; draw, y, x 
                    DB       $01, +$55, -$09              ; sync and move to y, x 
                    DB       $FF, +$00, +$2D              ; draw, y, x 
                    DB       $FF, +$00, +$13              ; draw, y, x 
                    DB       $00, -$2E, +$48              ; mode, y, x 
                    DB       $FF, -$41, -$4E              ; draw, y, x 
                    DB       $00, -$35, -$31              ; mode, y, x 
                    DB       $FF, +$35, +$11              ; draw, y, x 
                    DB       $01, -$1A, +$11              ; sync and move to y, x 
                    DB       $00, +$00, -$31              ; mode, y, x 
                    DB       $FF, -$35, +$20              ; draw, y, x 
                    DB       $FF, +$35, +$3A              ; draw, y, x 
                    DB       $FF, +$41, +$45              ; draw, y, x 
                    DB       $FF, +$1A, -$32              ; draw, y, x 
                    DB       $01, +$41, +$4D              ; sync and move to y, x 
                    DB       $FF, +$14, -$16              ; draw, y, x 
                    DB       $FF, -$14, +$23              ; draw, y, x 
                    DB       $FF, -$1A, +$25              ; draw, y, x 
                    DB       $FF, +$00, -$3C              ; draw, y, x 
                    DB       $FF, +$00, -$59              ; draw, y, x 
                    DB       $FF, +$00, -$56              ; draw, y, x 
                    DB       $01, +$27, -$59              ; sync and move to y, x 
                    DB       $00, +$00, -$13              ; additional sync move to y, x 
                    DB       $FF, -$41, +$33              ; draw, y, x 
                    DB       $FF, -$35, +$39              ; draw, y, x 
                    DB       $FF, +$35, +$31              ; draw, y, x 
                    DB       $FF, +$41, +$12              ; draw, y, x 
                    DB       $FF, -$41, -$32              ; draw, y, x 
                    DB       $01, -$1A, +$11              ; sync and move to y, x 
                    DB       $FF, +$41, -$27              ; draw, y, x 
                    DB       $FF, -$41, -$0A              ; draw, y, x 
                    DB       $FF, +$41, -$4C              ; draw, y, x 
                    DB       $FF, +$1A, +$13              ; draw, y, x 
                    DB       $FF, -$1A, -$25              ; draw, y, x 
                    DB       $FF, -$41, +$45              ; draw, y, x 
                    DB       $02                          ; endmarker 
SuperDiamond_6: 
                    DB       $01, +$27, -$59              ; sync and move to y, x 
                    DB       $00, +$00, -$26              ; additional sync move to y, x 
                    DB       $FF, +$00, +$16              ; draw, y, x 
                    DB       $FF, +$1A, +$39              ; draw, y, x 
                    DB       $FF, -$1A, +$1F              ; draw, y, x 
                    DB       $FF, +$1A, +$25              ; draw, y, x 
                    DB       $FF, -$1A, +$34              ; draw, y, x 
                    DB       $01, +$27, +$48              ; sync and move to y, x 
                    DB       $FF, +$1A, +$07              ; draw, y, x 
                    DB       $FF, +$14, -$28              ; draw, y, x 
                    DB       $FF, -$14, -$13              ; draw, y, x 
                    DB       $FF, +$14, -$1B              ; draw, y, x 
                    DB       $FF, -$14, -$29              ; draw, y, x 
                    DB       $01, +$41, -$30              ; sync and move to y, x 
                    DB       $FF, +$14, -$04              ; draw, y, x 
                    DB       $FF, -$14, -$24              ; draw, y, x 
                    DB       $FF, +$14, +$21              ; draw, y, x 
                    DB       $00, +$00, +$00              ; mode, y, x 
                    DB       $FF, +$00, +$30              ; draw, y, x 
                    DB       $01, +$55, -$07              ; sync and move to y, x 
                    DB       $FF, +$00, +$2E              ; draw, y, x 
                    DB       $FF, +$00, +$10              ; draw, y, x 
                    DB       $00, -$2E, +$48              ; mode, y, x 
                    DB       $FF, -$41, -$4D              ; draw, y, x 
                    DB       $00, -$35, -$32              ; mode, y, x 
                    DB       $FF, +$35, +$13              ; draw, y, x 
                    DB       $01, -$1A, +$13              ; sync and move to y, x 
                    DB       $00, +$00, -$32              ; mode, y, x 
                    DB       $FF, -$35, +$1F              ; draw, y, x 
                    DB       $FF, +$35, +$39              ; draw, y, x 
                    DB       $FF, +$41, +$46              ; draw, y, x 
                    DB       $FF, +$1A, -$30              ; draw, y, x 
                    DB       $01, +$41, +$4F              ; sync and move to y, x 
                    DB       $FF, +$14, -$18              ; draw, y, x 
                    DB       $FF, -$14, +$22              ; draw, y, x 
                    DB       $FF, -$1A, +$26              ; draw, y, x 
                    DB       $FF, +$00, -$37              ; draw, y, x 
                    DB       $FF, +$00, -$59              ; draw, y, x 
                    DB       $FF, +$00, -$58              ; draw, y, x 
                    DB       $01, +$27, -$59              ; sync and move to y, x 
                    DB       $00, +$00, -$10              ; additional sync move to y, x 
                    DB       $FF, -$41, +$31              ; draw, y, x 
                    DB       $FF, -$35, +$38              ; draw, y, x 
                    DB       $FF, +$35, +$32              ; draw, y, x 
                    DB       $FF, +$41, +$16              ; draw, y, x 
                    DB       $FF, -$41, -$35              ; draw, y, x 
                    DB       $01, -$1A, +$13              ; sync and move to y, x 
                    DB       $FF, +$41, -$24              ; draw, y, x 
                    DB       $FF, -$41, -$0E              ; draw, y, x 
                    DB       $FF, +$41, -$4A              ; draw, y, x 
                    DB       $FF, +$1A, +$11              ; draw, y, x 
                    DB       $FF, -$1A, -$27              ; draw, y, x 
                    DB       $FF, -$41, +$47              ; draw, y, x 
                    DB       $02                          ; endmarker 
SuperDiamond_7: 
                    DB       $01, +$55, +$38              ; sync and move to y, x 
                    DB       $FF, +$00, -$0F              ; draw, y, x 
                    DB       $FF, +$00, -$2D              ; draw, y, x 
                    DB       $FF, +$00, -$34              ; draw, y, x 
                    DB       $00, +$00, +$00              ; mode, y, x 
                    DB       $FF, -$14, -$1F              ; draw, y, x 
                    DB       $01, +$41, -$57              ; sync and move to y, x 
                    DB       $FF, +$14, +$26              ; draw, y, x 
                    DB       $FF, -$14, +$03              ; draw, y, x 
                    DB       $FF, +$14, +$2A              ; draw, y, x 
                    DB       $FF, -$14, +$1C              ; draw, y, x 
                    DB       $FF, +$14, +$11              ; draw, y, x 
                    DB       $01, +$55, +$29              ; sync and move to y, x 
                    DB       $FF, -$14, +$27              ; draw, y, x 
                    DB       $FF, -$1A, -$04              ; draw, y, x 
                    DB       $FF, +$1A, -$34              ; draw, y, x 
                    DB       $FF, -$1A, -$25              ; draw, y, x 
                    DB       $FF, +$1A, -$21              ; draw, y, x 
                    DB       $01, +$41, -$2E              ; sync and move to y, x 
                    DB       $FF, -$1A, -$38              ; draw, y, x 
                    DB       $FF, +$00, +$59              ; draw, y, x 
                    DB       $FF, +$00, +$59              ; draw, y, x 
                    DB       $FF, +$00, +$34              ; draw, y, x 
                    DB       $FF, +$1A, -$30              ; draw, y, x 
                    DB       $FF, +$14, -$18              ; draw, y, x 
                    DB       $01, +$55, +$38              ; sync and move to y, x 
                    DB       $FF, -$14, +$20              ; draw, y, x 
                    DB       $FF, -$1A, +$28              ; draw, y, x 
                    DB       $FF, -$41, -$47              ; draw, y, x 
                    DB       $FF, -$35, -$39              ; draw, y, x 
                    DB       $FF, +$35, -$37              ; draw, y, x 
                    DB       $01, -$1A, -$37              ; sync and move to y, x 
                    DB       $FF, +$41, -$2F              ; draw, y, x 
                    DB       $FF, +$00, -$19              ; draw, y, x 
                    DB       $FF, +$1A, +$28              ; draw, y, x 
                    DB       $FF, -$1A, -$0F              ; draw, y, x 
                    DB       $FF, -$41, +$48              ; draw, y, x 
                    DB       $FF, +$41, +$11              ; draw, y, x 
                    DB       $01, +$27, -$0D              ; sync and move to y, x 
                    DB       $FF, -$41, +$22              ; draw, y, x 
                    DB       $FF, -$35, -$15              ; draw, y, x 
                    DB       $FF, +$35, +$33              ; draw, y, x 
                    DB       $FF, +$41, +$4D              ; draw, y, x 
                    DB       $00, -$41, -$4D              ; mode, y, x 
                    DB       $01, -$1A, +$33              ; sync and move to y, x 
                    DB       $FF, +$41, +$19              ; draw, y, x 
                    DB       $FF, -$41, -$37              ; draw, y, x 
                    DB       $00, -$35, -$15              ; mode, y, x 
                    DB       $FF, +$35, -$1E              ; draw, y, x 
                    DB       $00, +$00, -$19              ; mode, y, x 
                    DB       $FF, +$41, -$48              ; draw, y, x 
                    DB       $02                          ; endmarker 
SuperDiamond_8: 
                    DB       $01, +$27, -$5C              ; sync and move to y, x 
                    DB       $00, +$00, -$23              ; additional sync move to y, x 
                    DB       $FF, +$00, +$1C              ; draw, y, x 
                    DB       $FF, +$1A, +$38              ; draw, y, x 
                    DB       $FF, -$1A, +$24              ; draw, y, x 
                    DB       $FF, +$1A, +$23              ; draw, y, x 
                    DB       $FF, -$1A, +$33              ; draw, y, x 
                    DB       $01, +$27, +$4F              ; sync and move to y, x 
                    DB       $FF, +$1A, +$03              ; draw, y, x 
                    DB       $FF, +$14, -$27              ; draw, y, x 
                    DB       $FF, -$14, -$0F              ; draw, y, x 
                    DB       $FF, +$14, -$1E              ; draw, y, x 
                    DB       $FF, -$14, -$29              ; draw, y, x 
                    DB       $01, +$41, -$2B              ; sync and move to y, x 
                    DB       $FF, +$14, -$05              ; draw, y, x 
                    DB       $FF, -$14, -$25              ; draw, y, x 
                    DB       $FF, +$14, +$1D              ; draw, y, x 
                    DB       $00, +$00, +$00              ; mode, y, x 
                    DB       $FF, +$00, +$36              ; draw, y, x 
                    DB       $01, +$55, -$02              ; sync and move to y, x 
                    DB       $FF, +$00, +$2D              ; draw, y, x 
                    DB       $FF, +$00, +$0D              ; draw, y, x 
                    DB       $00, -$2E, +$49              ; mode, y, x 
                    DB       $FF, -$41, -$4E              ; draw, y, x 
                    DB       $00, -$35, -$33              ; mode, y, x 
                    DB       $FF, +$35, +$18              ; draw, y, x 
                    DB       $01, -$1A, +$18              ; sync and move to y, x 
                    DB       $00, +$00, -$35              ; mode, y, x 
                    DB       $FF, -$35, +$1D              ; draw, y, x 
                    DB       $FF, +$35, +$38              ; draw, y, x 
                    DB       $FF, +$41, +$49              ; draw, y, x 
                    DB       $FF, +$1A, -$2F              ; draw, y, x 
                    DB       $01, +$41, +$52              ; sync and move to y, x 
                    DB       $FF, +$14, -$1A              ; draw, y, x 
                    DB       $FF, -$14, +$1F              ; draw, y, x 
                    DB       $FF, -$1A, +$2A              ; draw, y, x 
                    DB       $FF, +$00, -$32              ; draw, y, x 
                    DB       $FF, +$00, -$56              ; draw, y, x 
                    DB       $FF, +$00, -$5C              ; draw, y, x 
                    DB       $01, +$27, -$5C              ; sync and move to y, x 
                    DB       $00, +$00, -$07              ; additional sync move to y, x 
                    DB       $FF, -$41, +$2D              ; draw, y, x 
                    DB       $FF, -$35, +$36              ; draw, y, x 
                    DB       $FF, +$35, +$33              ; draw, y, x 
                    DB       $FF, +$41, +$1C              ; draw, y, x 
                    DB       $FF, -$41, -$37              ; draw, y, x 
                    DB       $01, -$1A, +$18              ; sync and move to y, x 
                    DB       $FF, +$41, -$1F              ; draw, y, x 
                    DB       $FF, -$41, -$16              ; draw, y, x 
                    DB       $FF, +$41, -$46              ; draw, y, x 
                    DB       $FF, +$1A, +$0E              ; draw, y, x 
                    DB       $FF, -$1A, -$2A              ; draw, y, x 
                    DB       $FF, -$41, +$49              ; draw, y, x 
                    DB       $02                          ; endmarker 
SuperDiamond_9: 
                    DB       $01, +$27, -$5E              ; sync and move to y, x 
                    DB       $00, +$00, -$21              ; additional sync move to y, x 
                    DB       $FF, +$00, +$1F              ; draw, y, x 
                    DB       $FF, +$1A, +$39              ; draw, y, x 
                    DB       $FF, -$1A, +$25              ; draw, y, x 
                    DB       $FF, +$1A, +$21              ; draw, y, x 
                    DB       $FF, -$1A, +$34              ; draw, y, x 
                    DB       $01, +$27, +$53              ; sync and move to y, x 
                    DB       $FF, +$1A, +$01              ; draw, y, x 
                    DB       $FF, +$14, -$27              ; draw, y, x 
                    DB       $FF, -$14, -$0E              ; draw, y, x 
                    DB       $FF, +$14, -$1F              ; draw, y, x 
                    DB       $FF, -$14, -$27              ; draw, y, x 
                    DB       $01, +$41, -$27              ; sync and move to y, x 
                    DB       $FF, +$14, -$08              ; draw, y, x 
                    DB       $FF, -$14, -$25              ; draw, y, x 
                    DB       $FF, +$14, +$1C              ; draw, y, x 
                    DB       $00, +$00, +$00              ; mode, y, x 
                    DB       $FF, +$00, +$38              ; draw, y, x 
                    DB       $01, +$55, +$00              ; sync and move to y, x 
                    DB       $FF, +$00, +$2D              ; draw, y, x 
                    DB       $FF, +$00, +$0B              ; draw, y, x 
                    DB       $00, -$2E, +$49              ; mode, y, x 
                    DB       $FF, -$41, -$4D              ; draw, y, x 
                    DB       $00, -$35, -$34              ; mode, y, x 
                    DB       $FF, +$35, +$1A              ; draw, y, x 
                    DB       $01, -$1A, +$1A              ; sync and move to y, x 
                    DB       $00, +$00, -$36              ; mode, y, x 
                    DB       $FF, -$35, +$1C              ; draw, y, x 
                    DB       $FF, +$35, +$38              ; draw, y, x 
                    DB       $FF, +$41, +$49              ; draw, y, x 
                    DB       $FF, +$1A, -$2D              ; draw, y, x 
                    DB       $01, +$41, +$54              ; sync and move to y, x 
                    DB       $FF, +$14, -$1C              ; draw, y, x 
                    DB       $FF, -$14, +$1E              ; draw, y, x 
                    DB       $FF, -$1A, +$2B              ; draw, y, x 
                    DB       $FF, +$00, -$2E              ; draw, y, x 
                    DB       $FF, +$00, -$55              ; draw, y, x 
                    DB       $FF, +$00, -$5E              ; draw, y, x 
                    DB       $01, +$27, -$5E              ; sync and move to y, x 
                    DB       $00, +$00, -$02              ; additional sync move to y, x 
                    DB       $FF, -$41, +$2B              ; draw, y, x 
                    DB       $FF, -$35, +$35              ; draw, y, x 
                    DB       $FF, +$35, +$34              ; draw, y, x 
                    DB       $FF, +$41, +$1F              ; draw, y, x 
                    DB       $FF, -$41, -$39              ; draw, y, x 
                    DB       $01, -$1A, +$1A              ; sync and move to y, x 
                    DB       $FF, +$41, -$1C              ; draw, y, x 
                    DB       $FF, -$41, -$1A              ; draw, y, x 
                    DB       $FF, +$41, -$44              ; draw, y, x 
                    DB       $FF, +$1A, +$0C              ; draw, y, x 
                    DB       $FF, -$1A, -$2B              ; draw, y, x 
                    DB       $FF, -$41, +$4A              ; draw, y, x 
                    DB       $02                          ; endmarker 
SuperDiamond_10: 
                    DB       $01, -$1A, +$35              ; sync and move to y, x 
                    DB       $FF, +$41, +$22              ; draw, y, x 
                    DB       $FF, -$41, -$3B              ; draw, y, x 
                    DB       $00, +$00, -$37              ; mode, y, x 
                    DB       $FF, +$41, +$1C              ; draw, y, x 
                    DB       $FF, -$41, +$1B              ; draw, y, x 
                    DB       $01, -$1A, +$1C              ; sync and move to y, x 
                    DB       $FF, -$35, -$1C              ; draw, y, x 
                    DB       $FF, +$35, +$35              ; draw, y, x 
                    DB       $FF, +$41, +$4D              ; draw, y, x 
                    DB       $FF, +$1A, -$2D              ; draw, y, x 
                    DB       $FF, +$14, -$1D              ; draw, y, x 
                    DB       $01, +$55, +$38              ; sync and move to y, x 
                    DB       $FF, +$00, -$09              ; draw, y, x 
                    DB       $FF, -$14, -$0D              ; draw, y, x 
                    DB       $FF, -$1A, +$35              ; draw, y, x 
                    DB       $FF, +$1A, -$02              ; draw, y, x 
                    DB       $FF, +$14, -$26              ; draw, y, x 
                    DB       $01, +$55, +$2F              ; sync and move to y, x 
                    DB       $FF, +$00, -$2F              ; draw, y, x 
                    DB       $FF, +$00, -$38              ; draw, y, x 
                    DB       $00, +$00, +$00              ; mode, y, x 
                    DB       $FF, -$14, -$1A              ; draw, y, x 
                    DB       $FF, -$1A, -$0B              ; draw, y, x 
                    DB       $01, +$27, -$5D              ; sync and move to y, x 
                    DB       $FF, +$00, +$5E              ; draw, y, x 
                    DB       $FF, +$1A, -$25              ; draw, y, x 
                    DB       $FF, -$1A, -$39              ; draw, y, x 
                    DB       $FF, -$41, +$42              ; draw, y, x 
                    DB       $FF, -$35, +$1B              ; draw, y, x 
                    DB       $01, -$4F, +$00              ; sync and move to y, x 
                    DB       $FF, +$35, -$34              ; draw, y, x 
                    DB       $FF, +$41, -$29              ; draw, y, x 
                    DB       $FF, +$00, -$22              ; draw, y, x 
                    DB       $FF, -$41, +$4A              ; draw, y, x 
                    DB       $FF, -$35, +$35              ; draw, y, x 
                    DB       $01, -$4F, +$00              ; sync and move to y, x 
                    DB       $FF, +$35, +$36              ; draw, y, x 
                    DB       $FF, +$41, +$4C              ; draw, y, x 
                    DB       $FF, +$00, -$2B              ; draw, y, x 
                    DB       $FF, +$00, -$56              ; draw, y, x 
                    DB       $FF, +$1A, +$21              ; draw, y, x 
                    DB       $01, +$41, +$22              ; sync and move to y, x 
                    DB       $FF, +$14, -$22              ; draw, y, x 
                    DB       $FF, -$14, -$24              ; draw, y, x 
                    DB       $FF, +$14, -$09              ; draw, y, x 
                    DB       $FF, -$14, -$25              ; draw, y, x 
                    DB       $FF, -$1A, -$2D              ; draw, y, x 
                    DB       $FF, -$41, +$4B              ; draw, y, x 
                    DB       $02                          ; endmarker 
SuperDiamond_11: 
                    DB       $01, -$4F, +$00              ; sync and move to y, x 
                    DB       $FF, +$35, -$1A              ; draw, y, x 
                    DB       $00, +$00, -$19              ; mode, y, x 
                    DB       $FF, -$35, +$33              ; draw, y, x 
                    DB       $FF, +$35, +$1E              ; draw, y, x 
                    DB       $00, +$00, +$18              ; mode, y, x 
                    DB       $FF, +$41, +$4C              ; draw, y, x 
                    DB       $01, +$27, +$60              ; sync and move to y, x 
                    DB       $00, +$00, +$22              ; additional sync move to y, x 
                    DB       $FF, +$00, -$27              ; draw, y, x 
                    DB       $FF, +$1A, -$36              ; draw, y, x 
                    DB       $FF, -$1A, -$1F              ; draw, y, x 
                    DB       $FF, +$1A, -$26              ; draw, y, x 
                    DB       $FF, +$14, +$23              ; draw, y, x 
                    DB       $01, +$55, +$03              ; sync and move to y, x 
                    DB       $FF, -$14, +$22              ; draw, y, x 
                    DB       $FF, +$14, +$0A              ; draw, y, x 
                    DB       $FF, +$00, +$09              ; draw, y, x 
                    DB       $FF, -$14, +$1F              ; draw, y, x 
                    DB       $FF, -$1A, +$2B              ; draw, y, x 
                    DB       $01, +$55, -$39              ; sync and move to y, x 
                    DB       $FF, +$00, +$3C              ; draw, y, x 
                    DB       $FF, +$00, +$2C              ; draw, y, x 
                    DB       $FF, -$14, +$28              ; draw, y, x 
                    DB       $FF, -$1A, +$04              ; draw, y, x 
                    DB       $FF, +$00, -$55              ; draw, y, x 
                    DB       $FF, +$00, -$60              ; draw, y, x 
                    DB       $01, +$27, -$5A              ; sync and move to y, x 
                    DB       $FF, -$41, +$27              ; draw, y, x 
                    DB       $FF, +$41, -$4C              ; draw, y, x 
                    DB       $FF, +$00, +$25              ; draw, y, x 
                    DB       $FF, +$1A, +$3A              ; draw, y, x 
                    DB       $FF, +$14, -$0B              ; draw, y, x 
                    DB       $FF, -$14, -$26              ; draw, y, x 
                    DB       $01, +$41, -$51              ; sync and move to y, x 
                    DB       $FF, -$1A, -$2E              ; draw, y, x 
                    DB       $FF, -$41, +$49              ; draw, y, x 
                    DB       $FF, -$35, +$36              ; draw, y, x 
                    DB       $FF, +$35, +$36              ; draw, y, x 
                    DB       $FF, +$41, +$25              ; draw, y, x 
                    DB       $FF, -$41, -$3D              ; draw, y, x 
                    DB       $01, -$1A, +$1E              ; sync and move to y, x 
                    DB       $FF, +$41, -$18              ; draw, y, x 
                    DB       $FF, -$41, -$20              ; draw, y, x 
                    DB       $FF, +$41, -$40              ; draw, y, x 
                    DB       $FF, +$1A, +$09              ; draw, y, x 
                    DB       $FF, +$14, +$19              ; draw, y, x 
                    DB       $FF, -$14, -$1C              ; draw, y, x 
                    DB       $FF, -$1A, -$2B              ; draw, y, x 
                    DB       $02                          ; endmarker 
SuperDiamond_12: 
                    DB       $01, +$55, -$38              ; sync and move to y, x 
                    DB       $FF, +$00, +$39              ; draw, y, x 
                    DB       $FF, +$00, +$30              ; draw, y, x 
                    DB       $FF, -$14, +$27              ; draw, y, x 
                    DB       $FF, -$1A, +$06              ; draw, y, x 
                    DB       $FF, +$1A, -$36              ; draw, y, x 
                    DB       $FF, +$14, +$09              ; draw, y, x 
                    DB       $FF, +$00, +$07              ; draw, y, x 
                    DB       $01, +$55, +$38              ; sync and move to y, x 
                    DB       $FF, -$14, +$20              ; draw, y, x 
                    DB       $FF, -$1A, +$2A              ; draw, y, x 
                    DB       $FF, +$00, -$24              ; draw, y, x 
                    DB       $FF, +$00, -$53              ; draw, y, x 
                    DB       $FF, +$1A, +$1D              ; draw, y, x 
                    DB       $FF, +$14, -$23              ; draw, y, x 
                    DB       $FF, -$14, -$23              ; draw, y, x 
                    DB       $FF, -$1A, -$38              ; draw, y, x 
                    DB       $01, +$27, -$56              ; sync and move to y, x 
                    DB       $FF, +$1A, +$07              ; draw, y, x 
                    DB       $FF, -$1A, -$30              ; draw, y, x 
                    DB       $FF, +$00, +$29              ; draw, y, x 
                    DB       $FF, +$00, +$61              ; draw, y, x 
                    DB       $FF, +$1A, -$29              ; draw, y, x 
                    DB       $FF, +$14, -$0B              ; draw, y, x 
                    DB       $FF, -$14, -$26              ; draw, y, x 
                    DB       $01, +$41, -$4F              ; sync and move to y, x 
                    DB       $FF, +$14, +$17              ; draw, y, x 
                    DB       $FF, -$14, -$1D              ; draw, y, x 
                    DB       $00, -$1A, -$2A              ; mode, y, x 
                    DB       $FF, -$41, +$4E              ; draw, y, x 
                    DB       $00, -$35, +$31              ; mode, y, x 
                    DB       $FF, +$35, +$1F              ; draw, y, x 
                    DB       $00, +$00, +$18              ; mode, y, x 
                    DB       $FF, +$41, +$4B              ; draw, y, x 
                    DB       $01, +$41, -$55              ; sync and move to y, x 
                    DB       $FF, -$1A, -$2A              ; draw, y, x 
                    DB       $FF, -$41, +$48              ; draw, y, x 
                    DB       $FF, -$35, +$37              ; draw, y, x 
                    DB       $FF, +$35, -$31              ; draw, y, x 
                    DB       $FF, +$41, -$25              ; draw, y, x 
                    DB       $FF, -$41, +$3F              ; draw, y, x 
                    DB       $01, -$1A, -$17              ; sync and move to y, x 
                    DB       $FF, -$35, +$17              ; draw, y, x 
                    DB       $FF, +$35, +$37              ; draw, y, x 
                    DB       $FF, +$41, +$27              ; draw, y, x 
                    DB       $FF, -$41, -$3F              ; draw, y, x 
                    DB       $FF, +$41, -$14              ; draw, y, x 
                    DB       $FF, -$41, -$22              ; draw, y, x 
                    DB       $02                          ; endmarker 
SuperDiamond_13: 
                    DB       $01, +$55, -$37              ; sync and move to y, x 
                    DB       $FF, +$00, +$39              ; draw, y, x 
                    DB       $FF, +$00, +$31              ; draw, y, x 
                    DB       $FF, -$14, +$26              ; draw, y, x 
                    DB       $FF, -$1A, +$08              ; draw, y, x 
                    DB       $FF, +$1A, -$35              ; draw, y, x 
                    DB       $FF, +$14, +$07              ; draw, y, x 
                    DB       $FF, +$00, +$04              ; draw, y, x 
                    DB       $01, +$55, +$37              ; sync and move to y, x 
                    DB       $FF, -$14, +$22              ; draw, y, x 
                    DB       $FF, -$1A, +$28              ; draw, y, x 
                    DB       $FF, +$00, -$20              ; draw, y, x 
                    DB       $FF, +$00, -$51              ; draw, y, x 
                    DB       $FF, +$1A, +$1C              ; draw, y, x 
                    DB       $FF, +$14, -$25              ; draw, y, x 
                    DB       $FF, -$14, -$21              ; draw, y, x 
                    DB       $FF, -$1A, -$38              ; draw, y, x 
                    DB       $01, +$27, -$52              ; sync and move to y, x 
                    DB       $FF, +$1A, +$04              ; draw, y, x 
                    DB       $FF, -$1A, -$31              ; draw, y, x 
                    DB       $FF, +$00, +$2D              ; draw, y, x 
                    DB       $FF, +$00, +$62              ; draw, y, x 
                    DB       $FF, +$1A, -$2A              ; draw, y, x 
                    DB       $FF, +$14, -$0D              ; draw, y, x 
                    DB       $FF, -$14, -$27              ; draw, y, x 
                    DB       $01, +$41, -$4E              ; sync and move to y, x 
                    DB       $FF, +$14, +$17              ; draw, y, x 
                    DB       $FF, -$14, -$1F              ; draw, y, x 
                    DB       $00, -$1A, -$29              ; mode, y, x 
                    DB       $FF, -$41, +$4F              ; draw, y, x 
                    DB       $00, -$35, +$30              ; mode, y, x 
                    DB       $FF, +$35, +$21              ; draw, y, x 
                    DB       $00, +$00, +$17              ; mode, y, x 
                    DB       $FF, +$41, +$49              ; draw, y, x 
                    DB       $01, +$41, -$56              ; sync and move to y, x 
                    DB       $FF, -$1A, -$29              ; draw, y, x 
                    DB       $FF, -$41, +$47              ; draw, y, x 
                    DB       $FF, -$35, +$38              ; draw, y, x 
                    DB       $FF, +$35, -$30              ; draw, y, x 
                    DB       $FF, +$41, -$22              ; draw, y, x 
                    DB       $FF, -$41, +$3D              ; draw, y, x 
                    DB       $01, -$1A, -$15              ; sync and move to y, x 
                    DB       $FF, -$35, +$15              ; draw, y, x 
                    DB       $FF, +$35, +$38              ; draw, y, x 
                    DB       $FF, +$41, +$29              ; draw, y, x 
                    DB       $FF, -$41, -$40              ; draw, y, x 
                    DB       $FF, +$41, -$11              ; draw, y, x 
                    DB       $FF, -$41, -$25              ; draw, y, x 
                    DB       $02                          ; endmarker 
SuperDiamond_14: 
                    DB       $01, +$55, -$37              ; sync and move to y, x 
                    DB       $FF, -$14, -$15              ; draw, y, x 
                    DB       $FF, +$14, +$27              ; draw, y, x 
                    DB       $FF, +$00, -$12              ; draw, y, x 
                    DB       $FF, -$14, -$1F              ; draw, y, x 
                    DB       $FF, -$1A, -$28              ; draw, y, x 
                    DB       $FF, +$00, +$2F              ; draw, y, x 
                    DB       $FF, +$00, +$64              ; draw, y, x 
                    DB       $FF, +$1A, -$2B              ; draw, y, x 
                    DB       $FF, +$14, +$20              ; draw, y, x 
                    DB       $01, +$55, +$0A              ; sync and move to y, x 
                    DB       $FF, -$14, +$25              ; draw, y, x 
                    DB       $FF, -$1A, -$1A              ; draw, y, x 
                    DB       $FF, +$00, +$4F              ; draw, y, x 
                    DB       $FF, +$00, +$1D              ; draw, y, x 
                    DB       $FF, +$1A, -$27              ; draw, y, x 
                    DB       $01, +$41, +$5A              ; sync and move to y, x 
                    DB       $FF, +$14, -$23              ; draw, y, x 
                    DB       $FF, +$00, -$03              ; draw, y, x 
                    DB       $FF, -$14, -$05              ; draw, y, x 
                    DB       $FF, -$1A, +$35              ; draw, y, x 
                    DB       $FF, +$1A, -$0A              ; draw, y, x 
                    DB       $01, +$41, +$5A              ; sync and move to y, x 
                    DB       $FF, +$14, -$26              ; draw, y, x 
                    DB       $FF, +$00, -$2A              ; draw, y, x 
                    DB       $FF, +$00, -$2F              ; draw, y, x 
                    DB       $FF, -$14, +$0F              ; draw, y, x 
                    DB       $FF, -$1A, -$39              ; draw, y, x 
                    DB       $01, +$27, -$4F              ; sync and move to y, x 
                    DB       $FF, +$1A, +$03              ; draw, y, x 
                    DB       $FF, -$1A, -$32              ; draw, y, x 
                    DB       $FF, -$41, +$45              ; draw, y, x 
                    DB       $FF, -$35, +$39              ; draw, y, x 
                    DB       $FF, +$35, -$2F              ; draw, y, x 
                    DB       $01, -$1A, -$2F              ; sync and move to y, x 
                    DB       $FF, +$41, -$20              ; draw, y, x 
                    DB       $FF, -$41, +$3C              ; draw, y, x 
                    DB       $FF, -$35, +$13              ; draw, y, x 
                    DB       $FF, +$35, +$39              ; draw, y, x 
                    DB       $FF, +$41, +$2B              ; draw, y, x 
                    DB       $01, +$27, +$64              ; sync and move to y, x 
                    DB       $FF, -$41, -$41              ; draw, y, x 
                    DB       $FF, +$41, -$0E              ; draw, y, x 
                    DB       $FF, -$41, -$28              ; draw, y, x 
                    DB       $00, +$00, -$1C              ; mode, y, x 
                    DB       $FF, +$41, -$4F              ; draw, y, x 
                    DB       $01, -$4F, +$00              ; sync and move to y, x 
                    DB       $FF, +$35, +$23              ; draw, y, x 
                    DB       $00, +$00, +$16              ; mode, y, x 
                    DB       $FF, +$41, +$48              ; draw, y, x 
                    DB       $02                          ; endmarker 
SuperDiamond_15: 
                    DB       $01, +$27, -$6C              ; sync and move to y, x 
                    DB       $00, +$00, -$11              ; additional sync move to y, x 
                    DB       $FF, -$41, +$4F              ; draw, y, x 
                    DB       $00, +$00, +$1E              ; mode, y, x 
                    DB       $FF, +$41, +$2A              ; draw, y, x 
                    DB       $FF, -$41, +$0B              ; draw, y, x 
                    DB       $FF, +$41, +$43              ; draw, y, x 
                    DB       $01, +$27, +$68              ; sync and move to y, x 
                    DB       $FF, -$41, -$2E              ; draw, y, x 
                    DB       $FF, -$35, -$3A              ; draw, y, x 
                    DB       $FF, +$35, -$10              ; draw, y, x 
                    DB       $FF, +$41, -$3B              ; draw, y, x 
                    DB       $FF, -$41, +$1D              ; draw, y, x 
                    DB       $01, -$1A, -$2E              ; sync and move to y, x 
                    DB       $FF, -$35, +$2E              ; draw, y, x 
                    DB       $FF, +$35, -$3A              ; draw, y, x 
                    DB       $FF, +$41, -$43              ; draw, y, x 
                    DB       $FF, +$1A, +$34              ; draw, y, x 
                    DB       $FF, -$1A, -$02              ; draw, y, x 
                    DB       $01, +$27, -$4B              ; sync and move to y, x 
                    DB       $FF, +$1A, +$38              ; draw, y, x 
                    DB       $FF, +$14, -$10              ; draw, y, x 
                    DB       $FF, +$00, +$2F              ; draw, y, x 
                    DB       $FF, +$00, +$2A              ; draw, y, x 
                    DB       $FF, -$14, +$25              ; draw, y, x 
                    DB       $FF, -$1A, +$25              ; draw, y, x 
                    DB       $01, +$27, +$6C              ; sync and move to y, x 
                    DB       $00, +$00, +$14              ; additional sync move to y, x 
                    DB       $FF, +$00, -$18              ; draw, y, x 
                    DB       $FF, +$00, -$4E              ; draw, y, x 
                    DB       $FF, +$1A, +$17              ; draw, y, x 
                    DB       $FF, +$14, -$25              ; draw, y, x 
                    DB       $FF, -$14, -$1F              ; draw, y, x 
                    DB       $01, +$41, -$13              ; sync and move to y, x 
                    DB       $FF, -$1A, +$2D              ; draw, y, x 
                    DB       $FF, +$00, -$65              ; draw, y, x 
                    DB       $FF, +$00, -$32              ; draw, y, x 
                    DB       $FF, +$1A, +$26              ; draw, y, x 
                    DB       $FF, +$14, +$21              ; draw, y, x 
                    DB       $01, +$55, -$36              ; sync and move to y, x 
                    DB       $FF, +$00, +$13              ; draw, y, x 
                    DB       $FF, -$14, -$26              ; draw, y, x 
                    DB       $FF, +$14, +$13              ; draw, y, x 
                    DB       $00, +$00, +$6C              ; mode, y, x 
                    DB       $FF, -$14, -$05              ; draw, y, x 
                    DB       $01, +$41, +$31              ; sync and move to y, x 
                    DB       $FF, -$1A, +$37              ; draw, y, x 
                    DB       $FF, +$1A, -$0D              ; draw, y, x 
                    DB       $00, -$1A, +$25              ; mode, y, x 
                    DB       $FF, -$41, -$46              ; draw, y, x 
                    DB       $00, +$00, -$15              ; mode, y, x 
                    DB       $FF, -$35, -$25              ; draw, y, x 
                    DB       $02                          ; endmarker 
SuperDiamond_16: 
                    DB       $01, +$27, -$6D              ; sync and move to y, x 
                    DB       $00, +$00, -$0F              ; additional sync move to y, x 
                    DB       $FF, -$41, +$4F              ; draw, y, x 
                    DB       $00, +$00, +$1E              ; mode, y, x 
                    DB       $FF, +$41, +$2E              ; draw, y, x 
                    DB       $FF, -$41, +$08              ; draw, y, x 
                    DB       $FF, +$41, +$45              ; draw, y, x 
                    DB       $01, +$27, +$6C              ; sync and move to y, x 
                    DB       $FF, -$41, -$31              ; draw, y, x 
                    DB       $FF, -$35, -$3B              ; draw, y, x 
                    DB       $FF, +$35, -$0F              ; draw, y, x 
                    DB       $FF, +$41, -$38              ; draw, y, x 
                    DB       $FF, -$41, +$1A              ; draw, y, x 
                    DB       $01, -$1A, -$2D              ; sync and move to y, x 
                    DB       $FF, -$35, +$2D              ; draw, y, x 
                    DB       $FF, +$35, -$3B              ; draw, y, x 
                    DB       $FF, +$41, -$41              ; draw, y, x 
                    DB       $FF, +$1A, +$35              ; draw, y, x 
                    DB       $FF, -$1A, +$00              ; draw, y, x 
                    DB       $01, +$27, -$47              ; sync and move to y, x 
                    DB       $FF, +$1A, +$38              ; draw, y, x 
                    DB       $FF, +$14, -$11              ; draw, y, x 
                    DB       $FF, +$00, +$2E              ; draw, y, x 
                    DB       $FF, +$00, +$29              ; draw, y, x 
                    DB       $FF, -$14, +$25              ; draw, y, x 
                    DB       $FF, -$1A, +$23              ; draw, y, x 
                    DB       $01, +$27, +$6D              ; sync and move to y, x 
                    DB       $00, +$00, +$12              ; additional sync move to y, x 
                    DB       $FF, +$00, -$12              ; draw, y, x 
                    DB       $FF, +$00, -$4E              ; draw, y, x 
                    DB       $FF, +$1A, +$15              ; draw, y, x 
                    DB       $FF, +$14, -$26              ; draw, y, x 
                    DB       $FF, -$14, -$1D              ; draw, y, x 
                    DB       $01, +$41, -$0F              ; sync and move to y, x 
                    DB       $FF, -$1A, +$2E              ; draw, y, x 
                    DB       $FF, +$00, -$66              ; draw, y, x 
                    DB       $FF, +$00, -$35              ; draw, y, x 
                    DB       $FF, +$1A, +$24              ; draw, y, x 
                    DB       $FF, +$14, +$22              ; draw, y, x 
                    DB       $01, +$55, -$36              ; sync and move to y, x 
                    DB       $FF, +$00, +$16              ; draw, y, x 
                    DB       $FF, -$14, -$27              ; draw, y, x 
                    DB       $FF, +$14, +$11              ; draw, y, x 
                    DB       $00, +$00, +$6D              ; mode, y, x 
                    DB       $FF, -$14, -$03              ; draw, y, x 
                    DB       $01, +$41, +$34              ; sync and move to y, x 
                    DB       $FF, -$1A, +$39              ; draw, y, x 
                    DB       $FF, +$1A, -$11              ; draw, y, x 
                    DB       $00, -$1A, +$23              ; mode, y, x 
                    DB       $FF, -$41, -$44              ; draw, y, x 
                    DB       $00, +$00, -$14              ; mode, y, x 
                    DB       $FF, -$35, -$27              ; draw, y, x 
                    DB       $02                          ; endmarker 
SuperDiamond_17: 
                    DB       $01, -$4F, +$00              ; sync and move to y, x 
                    DB       $FF, +$35, -$0D              ; draw, y, x 
                    DB       $00, +$6F, -$28              ; mode, y, x 
                    DB       $FF, -$14, -$10              ; draw, y, x 
                    DB       $FF, +$15, +$26              ; draw, y, x 
                    DB       $FF, +$00, -$16              ; draw, y, x 
                    DB       $01, +$56, -$35              ; sync and move to y, x 
                    DB       $FF, -$15, -$23              ; draw, y, x 
                    DB       $FF, -$1A, -$23              ; draw, y, x 
                    DB       $FF, +$00, +$39              ; draw, y, x 
                    DB       $FF, +$00, +$65              ; draw, y, x 
                    DB       $FF, +$1A, -$2F              ; draw, y, x 
                    DB       $01, +$41, -$0C              ; sync and move to y, x 
                    DB       $FF, +$14, +$1B              ; draw, y, x 
                    DB       $FF, -$14, +$28              ; draw, y, x 
                    DB       $FF, -$1A, -$14              ; draw, y, x 
                    DB       $FF, +$00, +$4C              ; draw, y, x 
                    DB       $FF, +$00, +$10              ; draw, y, x 
                    DB       $01, +$27, +$6F              ; sync and move to y, x 
                    DB       $00, +$00, +$10              ; additional sync move to y, x 
                    DB       $FF, +$1A, -$23              ; draw, y, x 
                    DB       $FF, +$14, -$24              ; draw, y, x 
                    DB       $FF, +$00, -$29              ; draw, y, x 
                    DB       $FF, +$00, -$2E              ; draw, y, x 
                    DB       $FF, -$14, +$13              ; draw, y, x 
                    DB       $FF, -$1A, -$36              ; draw, y, x 
                    DB       $01, +$27, -$42              ; sync and move to y, x 
                    DB       $FF, +$1A, -$03              ; draw, y, x 
                    DB       $FF, -$1A, -$36              ; draw, y, x 
                    DB       $FF, -$41, +$40              ; draw, y, x 
                    DB       $FF, -$35, +$3B              ; draw, y, x 
                    DB       $FF, +$35, +$3B              ; draw, y, x 
                    DB       $01, -$1A, +$3B              ; sync and move to y, x 
                    DB       $FF, +$41, +$34              ; draw, y, x 
                    DB       $FF, -$41, -$46              ; draw, y, x 
                    DB       $FF, +$41, -$06              ; draw, y, x 
                    DB       $FF, -$41, -$30              ; draw, y, x 
                    DB       $FF, +$41, -$35              ; draw, y, x 
                    DB       $01, +$27, -$42              ; sync and move to y, x 
                    DB       $FF, -$41, +$17              ; draw, y, x 
                    DB       $FF, +$41, -$50              ; draw, y, x 
                    DB       $00, -$41, +$50              ; mode, y, x 
                    DB       $FF, -$35, +$2B              ; draw, y, x 
                    DB       $FF, +$35, +$29              ; draw, y, x 
                    DB       $01, -$1A, +$29              ; sync and move to y, x 
                    DB       $00, +$00, +$12              ; mode, y, x 
                    DB       $FF, +$41, +$44              ; draw, y, x 
                    DB       $00, +$1A, -$23              ; mode, y, x 
                    DB       $FF, -$1A, +$13              ; draw, y, x 
                    DB       $FF, +$1A, -$38              ; draw, y, x 
                    DB       $FF, +$14, +$01              ; draw, y, x 
                    DB       $02                          ; endmarker 
SuperDiamond_18: 
                    DB       $01, +$27, -$67              ; sync and move to y, x 
                    DB       $00, +$00, -$12              ; additional sync move to y, x 
                    DB       $FF, -$41, +$50              ; draw, y, x 
                    DB       $FF, +$41, -$15              ; draw, y, x 
                    DB       $FF, -$41, +$36              ; draw, y, x 
                    DB       $FF, +$41, +$2F              ; draw, y, x 
                    DB       $FF, -$41, +$04              ; draw, y, x 
                    DB       $FF, +$41, +$48              ; draw, y, x 
                    DB       $FF, -$41, -$37              ; draw, y, x 
                    DB       $FF, -$35, -$3C              ; draw, y, x 
                    DB       $01, -$4F, +$00              ; sync and move to y, x 
                    DB       $FF, +$35, -$3C              ; draw, y, x 
                    DB       $FF, +$41, -$3D              ; draw, y, x 
                    DB       $FF, +$1A, +$37              ; draw, y, x 
                    DB       $FF, -$1A, +$04              ; draw, y, x 
                    DB       $FF, +$1A, +$36              ; draw, y, x 
                    DB       $FF, +$14, -$15              ; draw, y, x 
                    DB       $FF, +$00, +$2E              ; draw, y, x 
                    DB       $FF, +$00, +$29              ; draw, y, x 
                    DB       $FF, -$14, +$23              ; draw, y, x 
                    DB       $01, +$41, +$5D              ; sync and move to y, x 
                    DB       $FF, -$1A, +$21              ; draw, y, x 
                    DB       $FF, +$00, -$0B              ; draw, y, x 
                    DB       $FF, +$00, -$4C              ; draw, y, x 
                    DB       $FF, +$1A, +$13              ; draw, y, x 
                    DB       $FF, +$14, +$00              ; draw, y, x 
                    DB       $00, -$14, +$23              ; mode, y, x 
                    DB       $FF, -$1A, +$16              ; draw, y, x 
                    DB       $FF, +$1A, -$39              ; draw, y, x 
                    DB       $FF, +$14, -$29              ; draw, y, x 
                    DB       $01, +$55, +$11              ; sync and move to y, x 
                    DB       $FF, -$14, -$19              ; draw, y, x 
                    DB       $FF, -$1A, +$30              ; draw, y, x 
                    DB       $FF, +$00, -$67              ; draw, y, x 
                    DB       $FF, +$00, -$3A              ; draw, y, x 
                    DB       $FF, +$1A, +$21              ; draw, y, x 
                    DB       $FF, +$14, +$21              ; draw, y, x 
                    DB       $FF, -$14, -$0B              ; draw, y, x 
                    DB       $FF, +$14, +$25              ; draw, y, x 
                    DB       $FF, +$00, -$1A              ; draw, y, x 
                    DB       $01, -$4F, +$00              ; sync and move to y, x 
                    DB       $FF, +$35, -$08              ; draw, y, x 
                    DB       $00, +$00, -$21              ; mode, y, x 
                    DB       $FF, -$35, +$29              ; draw, y, x 
                    DB       $FF, +$35, +$2B              ; draw, y, x 
                    DB       $00, +$00, +$11              ; mode, y, x 
                    DB       $FF, +$41, +$42              ; draw, y, x 
                    DB       $02                          ; endmarker 
SuperDiamond_19: 
                    DB       $01, +$55, -$38              ; sync and move to y, x 
                    DB       $FF, -$14, -$20              ; draw, y, x 
                    DB       $FF, -$1B, -$1F              ; draw, y, x 
                    DB       $01, -$4F, +$00              ; sync and move to y, x 
                    DB       $FF, +$35, +$2B              ; draw, y, x 
                    DB       $00, +$00, +$11              ; mode, y, x 
                    DB       $FF, +$41, +$39              ; draw, y, x 
                    DB       $FF, -$41, -$4A              ; draw, y, x 
                    DB       $FF, +$41, +$02              ; draw, y, x 
                    DB       $FF, -$41, -$32              ; draw, y, x 
                    DB       $00, +$00, -$22              ; mode, y, x 
                    DB       $FF, +$41, -$13              ; draw, y, x 
                    DB       $FF, +$1A, -$06              ; draw, y, x 
                    DB       $01, +$41, -$40              ; sync and move to y, x 
                    DB       $FF, -$1A, -$37              ; draw, y, x 
                    DB       $FF, +$00, +$3D              ; draw, y, x 
                    DB       $FF, -$41, +$35              ; draw, y, x 
                    DB       $FF, -$35, +$05              ; draw, y, x 
                    DB       $FF, +$35, -$3C              ; draw, y, x 
                    DB       $01, -$1A, -$3C              ; sync and move to y, x 
                    DB       $FF, +$41, -$3B              ; draw, y, x 
                    DB       $FF, -$41, +$50              ; draw, y, x 
                    DB       $FF, -$35, +$27              ; draw, y, x 
                    DB       $FF, +$35, +$3C              ; draw, y, x 
                    DB       $FF, +$41, +$40              ; draw, y, x 
                    DB       $01, +$27, +$67              ; sync and move to y, x 
                    DB       $00, +$00, +$15              ; additional sync move to y, x 
                    DB       $FF, +$00, -$07              ; draw, y, x 
                    DB       $FF, +$00, -$48              ; draw, y, x 
                    DB       $FF, +$00, -$67              ; draw, y, x 
                    DB       $FF, +$1A, +$35              ; draw, y, x 
                    DB       $FF, -$1A, +$32              ; draw, y, x 
                    DB       $01, +$27, +$2D              ; sync and move to y, x 
                    DB       $FF, +$1A, +$10              ; draw, y, x 
                    DB       $FF, +$14, -$29              ; draw, y, x 
                    DB       $FF, -$14, -$19              ; draw, y, x 
                    DB       $FF, +$14, -$15              ; draw, y, x 
                    DB       $FF, -$14, -$26              ; draw, y, x 
                    DB       $01, +$41, -$40              ; sync and move to y, x 
                    DB       $FF, +$14, +$08              ; draw, y, x 
                    DB       $FF, +$00, +$1E              ; draw, y, x 
                    DB       $FF, +$00, +$2E              ; draw, y, x 
                    DB       $FF, +$00, +$27              ; draw, y, x 
                    DB       $FF, -$14, +$02              ; draw, y, x 
                    DB       $01, +$41, +$3D              ; sync and move to y, x 
                    DB       $FF, -$1A, +$38              ; draw, y, x 
                    DB       $FF, +$1A, -$18              ; draw, y, x 
                    DB       $FF, -$1A, +$1F              ; draw, y, x 
                    DB       $00, +$1A, -$1F              ; mode, y, x 
                    DB       $FF, +$14, -$22              ; draw, y, x 
                    DB       $02                          ; endmarker 
SuperDiamond_20: 
                    DB       $01, +$27, +$65              ; sync and move to y, x 
                    DB       $00, +$00, +$15              ; additional sync move to y, x 
                    DB       $FF, +$00, -$04              ; draw, y, x 
                    DB       $FF, +$1A, -$37              ; draw, y, x 
                    DB       $FF, +$14, -$03              ; draw, y, x 
                    DB       $00, -$14, +$21              ; mode, y, x 
                    DB       $FF, +$14, -$21              ; draw, y, x 
                    DB       $01, +$55, +$3C              ; sync and move to y, x 
                    DB       $FF, +$00, -$26              ; draw, y, x 
                    DB       $FF, +$00, -$2E              ; draw, y, x 
                    DB       $FF, +$00, -$21              ; draw, y, x 
                    DB       $FF, -$14, -$05              ; draw, y, x 
                    DB       $FF, +$14, +$26              ; draw, y, x 
                    DB       $01, +$55, -$18              ; sync and move to y, x 
                    DB       $FF, -$14, +$17              ; draw, y, x 
                    DB       $FF, +$14, +$17              ; draw, y, x 
                    DB       $FF, -$14, +$29              ; draw, y, x 
                    DB       $FF, -$1A, -$0F              ; draw, y, x 
                    DB       $FF, +$1A, -$31              ; draw, y, x 
                    DB       $01, +$41, -$01              ; sync and move to y, x 
                    DB       $FF, -$1A, -$34              ; draw, y, x 
                    DB       $FF, -$41, +$32              ; draw, y, x 
                    DB       $FF, -$35, +$03              ; draw, y, x 
                    DB       $FF, +$35, -$26              ; draw, y, x 
                    DB       $FF, +$41, -$4F              ; draw, y, x 
                    DB       $FF, +$00, +$40              ; draw, y, x 
                    DB       $01, +$27, -$35              ; sync and move to y, x 
                    DB       $FF, +$00, +$65              ; draw, y, x 
                    DB       $FF, -$41, -$04              ; draw, y, x 
                    DB       $FF, +$41, +$4B              ; draw, y, x 
                    DB       $00, +$00, -$01              ; mode, y, x 
                    DB       $FF, -$41, -$3A              ; draw, y, x 
                    DB       $01, -$1A, +$3C              ; sync and move to y, x 
                    DB       $00, -$35, -$3C              ; mode, y, x 
                    DB       $FF, +$35, +$2C              ; draw, y, x 
                    DB       $00, +$00, -$2F              ; mode, y, x 
                    DB       $FF, +$41, +$34              ; draw, y, x 
                    DB       $FF, +$00, +$45              ; draw, y, x 
                    DB       $FF, +$1A, -$19              ; draw, y, x 
                    DB       $01, +$41, +$5D              ; sync and move to y, x 
                    DB       $FF, -$1A, +$1D              ; draw, y, x 
                    DB       $FF, -$41, -$3E              ; draw, y, x 
                    DB       $FF, -$35, -$3C              ; draw, y, x 
                    DB       $FF, +$35, -$3C              ; draw, y, x 
                    DB       $FF, +$41, -$39              ; draw, y, x 
                    DB       $01, +$27, -$65              ; sync and move to y, x 
                    DB       $00, +$00, -$10              ; additional sync move to y, x 
                    DB       $FF, +$1A, +$37              ; draw, y, x 
                    DB       $FF, -$1A, +$09              ; draw, y, x 
                    DB       $FF, -$41, +$0F              ; draw, y, x 
                    DB       $00, +$41, -$4F              ; mode, y, x 
                    DB       $FF, +$1A, +$1D              ; draw, y, x 
                    DB       $FF, +$14, +$1F              ; draw, y, x 
                    DB       $02                          ; endmarker 
SimpleDiamond: 
                    DB       $01, +$27, -$57              ; pattern, y, x 
                    DB       $FF, +$00, +$3B              ; pattern, y, x 
                    DB       $FF, -$7E, +$1C              ; pattern, y, x 
                    DB       $FF, +$7E, +$1C              ; pattern, y, x 
                    DB       $FF, +$00, -$38              ; pattern, y, x 
                    DB       $FF, +$30, +$0A              ; pattern, y, x 
                    DB       $00, +$00, +$24              ; pattern, y, x 
                    DB       $FF, -$30, +$0A              ; pattern, y, x 
                    DB       $FF, +$00, +$3B              ; pattern, y, x 
                    DB       $FF, -$7E, -$57              ; pattern, y, x 
                    DB       $FF, +$7E, -$57              ; pattern, y, x 
                    DB       $FF, +$30, +$27              ; pattern, y, x 
                    DB       $FF, +$00, +$60              ; pattern, y, x 
                    DB       $FF, -$30, +$27              ; pattern, y, x 
                    DB       $02                          ; endmarker (high bit in pattern not set) 
