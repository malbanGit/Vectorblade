; bank 3
; **************************************************************************************************** 
; definition of one flight intro pattern
; go directly to fly home!
emptyPattern: 
;                    db       5                            ; enemies this pattern applies for 
                    db       25                           ; countdown before next enemy appears 
                    db       1                            ; start Delay 
; determined with excel sheet
                    db       0, 0 
                    dw       0, 0 
                    db       0, 0 
; ****************************************************************************************************
; definition of one flight intro pattern
entryPatternVShapeRightToLeft_slow: 
                    db       25                           ; countdown before next enemy appears 
                    db       40                           ; start Delay 
; determined with excel sheet
; adders are 16 bit
; + 1 filler to make the length 8
; speed = 900
                    db       64, 127                      ; starting coordinate, 
                    dw       -596/3, -676/3               ; y,x adder 
                    db       (((228+ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 ; angle times to because of 16bit 
; line end
                    db       -48, 0 
                    dw       476/3, -764 /3 
                    db       (((302+ANGLE_DIF/2)/ANGLE_DIF)*2)%16,5 ; coordinate to reach etc 
; line end
                    db       32, -128 
                    dw       0, 0 
                    db       0, 0 
; line end 
entryPatternVShapeRightToLeft_slow_start: 
                    db       25                           ; countdown before next enemy appears 
                    db       150                          ; start Delay 
; determined with excel sheet
; adders are 16 bit
; + 1 filler to make the length 8
; speed = 900
                    db       64, 127                      ; starting coordinate, 
                    dw       -596/3, -676/3               ; y,x adder 
                    db       (((228+ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 ; angle times to because of 16bit 
; line end
                    db       -48, 0 
                    dw       476/3, -764 /3 
                    db       (((302+ANGLE_DIF/2)/ANGLE_DIF)*2)%16,5 ; coordinate to reach etc 
; line end
                    db       32, -128 
                    dw       0, 0 
                    db       0, 0 
; line end 
; ****************************************************************************************************
kamikaze_middleToLeft 
                    db       8                            ; countdown before next enemy appears 
                    db       255                          ; start Delay 
                                                          ; line 1 
                    db       127 , 0 
                    dw       -843 , -318 
                    db       ((( 200 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 2 
                    db       -112 , -90 
                    dw       656 , 615 
                    db       ((( 44 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 3 
                    db       -16 , 0 
                    dw       -657 , 615 
                    db       ((( 137 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 4 
                    db       -112 , 90 
                    dw       842 , -318 
                    db       ((( 339 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 5 
                    db       127 , 0 
                    dw       0, 0 
                    db       0,0 
; ****************************************************************************************************
entryPatternLeftStraightDownZigLeftOut 
                    db       13                           ; countdown before next enemy appears 
                    db       20                           ; start Delay 
                                                          ; line 1 
                    db       127 , -60 
                    dw       -900 /2, 0/2 
                    db       ((( 180 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 2 
                    db       -40 , -60 
                    dw       865 /2, 247/2 
                    db       ((( 16 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16,5 
                                                          ; line 3 
                    db       100 , -20 
                    dw       -441 /2, -786/2 
                    db       ((( 240 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 4 
                    db       40 , -127 
                    dw       0, 0 
                    db       0, 0 
entryPatternLeftStraightDownZigLeftOut_noWait 
                    db       3                            ; countdown before next enemy appears 
                    db       1                            ; start Delay 
                                                          ; line 1 
                    db       127 , -60 
                    dw       -900 /2, 0/2 
                    db       ((( 180 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 2 
                    db       -40 , -60 
                    dw       865 /2, 247/2 
                    db       ((( 16 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16,5 
                                                          ; line 3 
                    db       100 , -20 
                    dw       -441 /2, -786/2 
                    db       ((( 240 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 4 
                    db       40 , -127 
                    dw       0, 0 
                    db       0, 0 
; ****************************************************************************************************
kamikazeEnterLeftMiddleZagDownMiddleOut 
                    db       3                            ; countdown before next enemy appears 
                    db       1                            ; start Delay 
; line 1                
                    db       0 , -120 
                    dw       0 , 800 
                    db       ((( 90 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 4 
; line 2                
                    db       0 , -80 
                    dw       -762 , 243 
                    db       ((( 163 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 4 
; line 3                
                    db       -125 , -40 
                    dw       673 , 431 
                    db       ((( 33 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 4 
; line 4                
                    db       0 , 40 
                    dw       0 , 800 
                    db       ((( 90 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 4 
; line 5                
                    db       0 , 125 
                    db       0 , 0 
                    dw       0, 0 
                    db       0, 0 
; ****************************************************************************************************
; Kamikaze Intro 
; swoop left/right
; swoop middle
; all seperately defined!
; ****************************************************************************************************
; START
; ****************************************************************************************************
kamikaze1_1 
                                                          ; db 1 ; enemies this pattern applies for 
                    db       1                            ; countdown before next enemy appears 
                    db       75                           ; start Delay 
; line 1                
                    db       127 , -72 
                    dw       -897 , -85 
                    db       ( ((185+ANGLE_DIF/2) /ANGLE_DIF)*2)%16, 5 
; line 2                
                    db       -127 , -96 
                    dw       0, 0 
                    db       0,0 
kamikaze1_2 
                                                          ; db 1 ; enemies this pattern applies for 
                    db       1                            ; countdown before next enemy appears 
                    db       1                            ; start Delay 
; line 1                
                    db       127 , -72 
                    dw       -900 , -29 
                    db       ( (( 181+ANGLE_DIF/2) /ANGLE_DIF)*2)%16, 5 
; line 2                
                    db       -127 , -80 
                    dw       0, 0 
                    db       0,0 
kamikaze1_3 
                                                          ; db 1 ; enemies this pattern applies for 
                    db       1                            ; countdown before next enemy appears 
                    db       1                            ; start Delay 
; line 1                
                    db       127 , -72 
                    dw       -900 , 28 
                    db       ( ((179+ANGLE_DIF/2) /ANGLE_DIF)*2)%16, 5 
; line 2                
                    db       -127 , -64 
                    dw       0, 0 
                    db       0,0 
kamikaze1_4 
                                                          ; db 1 ; enemies this pattern applies for 
                    db       1                            ; countdown before next enemy appears 
                    db       1                            ; start Delay 
; line 1                
                    db       127 , -72 
                    dw       -897 , 84 
                    db       (( (175+ANGLE_DIF/2) /ANGLE_DIF)*2)%16, 5 
; line 2                
                    db       -127 , -48 
                    dw       0, 0 
                    db       0,0 
kamikaze1_5 
                                                          ; db 1 ; enemies this pattern applies for 
                    db       1                            ; countdown before next enemy appears 
                    db       1                            ; start Delay 
; line 1                
                    db       127 , -72 
                    dw       -890 , 140 
                    db       (( (172+ANGLE_DIF/2) /ANGLE_DIF)*2)%16, 5 
; line 2                
                    db       -127 , -32 
                    dw       0, 0 
                    db       0,0 
; ****************************************************************************************************
kamikaze3_1 
                                                          ; db 1 ; enemies this pattern applies for 
                    db       1                            ; countdown before next enemy appears 
                    db       75                           ; start Delay 
                                                          ; line 1 
; line 1                    
                    db       127 , 0 
                    dw       -893 , -113 
                    db       ((( 187+ANGLE_DIF/2) /ANGLE_DIF)*2)%16, 5 
; line 2                    
                    db       -127 , -32 
                    dw       0, 0 
                    db       0,0 
kamikaze3_2 
                                                          ; db 1 ; enemies this pattern applies for 
                    db       1                            ; countdown before next enemy appears 
                    db       1                            ; start Delay 
                                                          ; line 1 
; line 1                
                    db       127 , 0 
                    dw       -899 , -57 
                    db       ((( 183+ANGLE_DIF/2) /ANGLE_DIF)*2)%16,5 
; line 2                
                    db       -127 , -16 
                    dw       0, 0 
                    db       0,0 
kamikaze3_3 
                                                          ; db 1 ; enemies this pattern applies for 
                    db       1                            ; countdown before next enemy appears 
                    db       1                            ; start Delay 
                                                          ; line 1 
; line 1                
                    db       127 , 0 
                    dw       -900 , 0 
                    db       ((( 180+ANGLE_DIF/2) /ANGLE_DIF)*2)%16, 5 
; line 2                
                    db       -127 , 0 
                    dw       0, 0 
                    db       0,0 
kamikaze3_4 
                                                          ; db 1 ; enemies this pattern applies for 
                    db       1                            ; countdown before next enemy appears 
                    db       1                            ; start Delay 
                                                          ; line 1 
                    db       127 , 0 
                    dw       -899 , 56 
                    db       ((( 177+ANGLE_DIF/2) /ANGLE_DIF)*2)%16,5 
                                                          ; line 2 
                    db       -127 , 16 
                    dw       0, 0 
                    db       0,0 
kamikaze3_5 
                                                          ; db 1 ; enemies this pattern applies for 
                    db       1                            ; countdown before next enemy appears 
                    db       1                            ; start Delay 
; line 1                
                                                          ; line 1 
                    db       127 , 0 
                    dw       -893 , 112 
                    db       ((( 173+ANGLE_DIF/2) /ANGLE_DIF)*2)%16, 5 
                                                          ; line 2 
                    db       -127 , 32 
                    dw       0, 0 
                    db       0,0 
; ****************************************************************************************************
; END
; ****************************************************************************************************
; ****************************************************************************************************
entryPatternEnterMiddleSquareWaveExitRight: 
                                                          ; db 10 ; enemies this pattern applies for 
                    db       10                           ;25 ; countdown before next enemy appears 
                    db       40                           ; start Delay 
; determined with excel sheet
; adders are 16 bit
; + 1 filler to make the length 8
; speed = 900
                                                          ; line 1 
                    db       96 , -127 
                    dw       0 , 900 
                    db       (( 90 /ANGLE_DIF)*2)%16, 5 
                                                          ; line 2 
                    db       96 , 32 
                    dw       -592 , 678 
                    db       (( (132+ANGLE_DIF/2) /ANGLE_DIF)*2)%16,5 
                                                          ; line 3 
                    db       69 , 63 
                    dw       -893 , 117 
                    db       (( (173+ANGLE_DIF/2) /ANGLE_DIF)*2)%16, 5 
                                                          ; line 4 
                    db       16 , 70 
                    dw       -786 , -440 
                    db       ( ((209+ANGLE_DIF/2) /ANGLE_DIF)*2)%16, 5 
                                                          ; line 5 
                    db       -34 , 42 
                    dw       -477 , -764 
                    db       ( ((237+ANGLE_DIF/2) /ANGLE_DIF)*2)%16, 5 
                                                          ; line 6 
                    db       -64 , -6 
                    dw       402 , -805 
                    db       (( (296+ANGLE_DIF/2) /ANGLE_DIF)*2)%16, 5 
                                                          ; line 7 
                    db       -39 , -56 
                    dw       739 , -514 
                    db       (((325+ANGLE_DIF/2) /ANGLE_DIF)*2)%16, 5 
                                                          ; line 9 
                    db       10 , -90 
                    dw       859 , 265 
                    db       (((18+ANGLE_DIF/2) /ANGLE_DIF)*2)%16, 5 
                                                          ; line 10 
                    db       65 , -73 
                    dw       488 , 756 
                    db       ( ((58+ANGLE_DIF/2) /ANGLE_DIF)*2)%16, 5 
                                                          ; line 11 
                    db       96 , -25 
                    dw       0 , 900 
                    db       (((90+ANGLE_DIF/2) /ANGLE_DIF)*2)%16, 5 
                                                          ; line 10 
                    db       96 , 60 
                    dw       0 , 900 
                    db       ( ((90+ANGLE_DIF/2) /ANGLE_DIF)*2)%16, 5 
                    db       96 ,127 
                    dw       0, 0 
                    db       0, 0 
; ****************************************************************************************************
kamikaze_middleStepLeft 
                    db       10                           ; countdown before next enemy appears 
                    db       50                           ; start Delay 
                                                          ; line 1 
                    db       127 , 0 
                    dw       -900 , 0 
                    db       ((( 180 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 2 
                    db       -40 , 0 
                    dw       -741 , 510 
                    db       ((( 146 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 3 
                    db       -127 , 60 
                    dw       0, 0 
                    db       0,0 
kamikaze_rightStepMiddle 
                    db       10                           ; countdown before next enemy appears 
                    db       50                           ; start Delay 
                                                          ; line 1 
                    db       127 , 60 
                    dw       -900 , 0 
                    db       ((( 180 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 2 
                    db       -40 , 60 
                    dw       -741 , -511 
                    db       ((( 214 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 3 
                    db       -127 , 0 
                    dw       0, 0 
                    db       0,0 
; ****************************************************************************************************
entryPatternEnterMiddleSquareWaveExitRight2: 
                                                          ; db 10 ; enemies this pattern applies for 
                    db       8                            ;25 ; countdown before next enemy appears 
                    db       100                          ; start Delay 
; determined with excel sheet
; adders are 16 bit
; + 1 filler to make the length 8
; speed = 900
                                                          ; line 1 
                    db       127 , 0 
                    dw       -900 , 0 
                    db       ((( 180 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 2 
                    db       80 , 0 
                    dw       0 , -900 
                    db       ((( 270 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 3 
                    db       80 , -110 
                    dw       -900 , 0 
                    db       ((( 180 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 4 
                    db       -80 , -110 
                    dw       0 , 900 
                    db       ((( 90 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 5 
                    db       -80 , -50 
                    dw       900 , 0 
                    db       ((( 0 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 6 
                    db       50 , -50 
                    dw       0 , 900 
                    db       ((( 90 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 7 
                    db       50 , 50 
                    dw       -900 , 0 
                    db       ((( 180 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 9 
                    db       -80 , 50 
                    dw       0 , 900 
                    db       ((( 90 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 10 
                    db       -80 , 110 
                    dw       900 , 0 
                    db       ((( 0 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 11 
                    db       127 , 110 
                    dw       0, 0 
                    db       0, 0 
; ****************************************************************************************************
entryPatternVShapeRightToLeft_fast: 
                                                          ; db 5 ; enemies this pattern applies for 
                    db       11                           ; countdown before next enemy appears 
                    db       20                           ; start Delay 
; determined with excel sheet
; adders are 16 bit
; + 1 filler to make the length 8
; speed = 900
                    db       64, 127                      ; starting coordinate, 
                    dw       -596, -676                   ; y,x adder 
                    db       (((228+ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 ; angle times to because of 16bit 
; line end
                    db       -48, 0 
                    dw       476, -764 
                    db       (((302+ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 ; coordinate to reach etc 
; line end
                    db       32, -128 
                    dw       0, 0 
                    db       0, 0 
; ****************************************************************************************************
entryPatternBottomRightTopLeftOut_fast: 
                                                          ; db 5 ; enemies this pattern applies for 
                    db       11                           ; countdown before next enemy appears 
                    db       20                           ; start Delay 
; line 1                    
                    db       -90 , 120 
                    dw       700 , 0 
                    db       ((( 0 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 4 
; line 2                
                    db       100 , 120 
                    dw       0 , -700 
                    db       ((( 270 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 4 
; line 3                
                    db       100 , -127 
                    dw       0, 0 
                    db       0, 0 
; ****************************************************************************************************
entryPatternBottomZigZag: 
                    db       10                           ; countdown before next enemy appears 
                    db       40                           ; start Delay 
; determined with excel sheet
; adders are 16 bit
; + 1 filler to make the length 8
; speed = 900
; line 1                    
                    db       -80 , -127 
                    dw       467/2 , 769 /2 
                    db       ((( 59 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 3 
; line 2                    
                    db       -32 , -48 
                    dw       -403/2 , 804 /2 
                    db       ((( 117 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 3 
; line 3                    
                    db       -80 , 48 
                    dw       467/2 , 769 /2 
                    db       ((( 59 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 3 
; line 4                    
                    db       -32 , 127 
                    dw       0, 0 
                    db       0, 0 
; ****************************************************************************************************
entryPatternTopSmallZigZag_higher 
                    db       20                           ; countdown before next enemy appears 
                    db       50                           ; start Delay 
; line 1                
                    db       70 , -127 
                    dw       -712/2 , 551 /2 
                    db       ((( 143 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 3 
; line 2                
                    db       30 , -96 
                    dw       702 /2, 562 /2 
                    db       ((( 39 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 3 
; line 3                
                    db       70 , -64 
                    dw       -703 /2, 562 /2 
                    db       ((( 142 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 3 
; line 4                
                    db       30 , -32 
                    dw       702 /2, 562 /2 
                    db       ((( 39 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 3 
; line 5                
                    db       70 , 0 
                    dw       -703 /2, 562 /2 
                    db       ((( 142 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 3 
; line 6                
                    db       30 , 32 
                    dw       476 /2, 763 /2 
                    db       ((( 58 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 3 
; line 7                
                    db       70 , 96 
                    dw       -712/2 , 551/2 
                    db       ((( 143 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 3 
; line 9                
                    db       30 , 127 
                    dw       0, 0 
                    db       0, 0 
; ****************************************************************************************************
entryPatternTopSmallZigZag_higher_fast 
                    db       10                           ; countdown before next enemy appears 
                    db       50                           ; start Delay 
; line 1                
                    db       70 , -127 
                    dw       -712 , 551 
                    db       ((( 143 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
; line 2                
                    db       30 , -96 
                    dw       702 , 562 
                    db       ((( 39 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
; line 3                
                    db       70 , -64 
                    dw       -703 , 562 
                    db       ((( 142 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
; line 4                
                    db       30 , -32 
                    dw       702 , 562 
                    db       ((( 39 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
; line 5                
                    db       70 , 0 
                    dw       -703 , 562 
                    db       ((( 142 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
; line 6                
                    db       30 , 32 
                    dw       476 , 763 
                    db       ((( 58 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
; line 7                
                    db       70 , 96 
                    dw       -712 , 551 
                    db       ((( 143 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
; line 9                
                    db       30 , 127 
                    dw       0, 0 
                    db       0, 0 
; ****************************************************************************************************
entryPatternTopSmallZigZag_lower 
                    db       20                           ; countdown before next enemy appears 
                    db       50                           ; start Delay 
; line 1                
                    db       20 , -127 
                    dw       -712 /2, 551 /2 
                    db       ((( 143 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 3 
; line 2                
                    db       -20 , -96 
                    dw       702 /2, 562/2 
                    db       ((( 39 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 3 
; line 3                
                    db       20 , -64 
                    dw       -703 /2, 562 /2 
                    db       ((( 142 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 3 
; line 4                
                    db       -20 , -32 
                    dw       702 /2, 562/2 
                    db       ((( 39 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 3 
; line 5                
                    db       20 , 0 
                    dw       -703 /2, 562 /2 
                    db       ((( 142 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 3 
; line 6                
                    db       -20 , 32 
                    dw       476 /2, 763/2 
                    db       ((( 58 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 3 
; line 7                
                    db       20 , 96 
                    dw       -712 /2, 551 /2 
                    db       ((( 143 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 3 
; line 9                
                    db       -20 , 127 
                    dw       0, 0 
                    db       0, 0 
; ****************************************************************************************************
entryPatternTopSmallZigZag_lower_fast 
                    db       10                           ; countdown before next enemy appears 
                    db       50                           ; start Delay 
; line 1                
                    db       20 , -127 
                    dw       -712 , 551 
                    db       ((( 143 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
; line 2                
                    db       -20 , -96 
                    dw       702 , 562 
                    db       ((( 39 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
; line 3                
                    db       20 , -64 
                    dw       -703 , 562 
                    db       ((( 142 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
; line 4                
                    db       -20 , -32 
                    dw       702 , 562 
                    db       ((( 39 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
; line 5                
                    db       20 , 0 
                    dw       -703 , 562 
                    db       ((( 142 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
; line 6                
                    db       -20 , 32 
                    dw       476 , 763 
                    db       ((( 58 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
; line 7                
                    db       20 , 96 
                    dw       -712 , 551 
                    db       ((( 143 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
; line 9                
                    db       -20 , 127 
                    dw       0, 0 
                    db       0, 0 
; ****************************************************************************************************
kamikaze_leftTop_RightBottom_zigZag 
                    db       10                           ; countdown before next enemy appears 
                    db       50                           ; start Delay 
; line 1                
                    db       127 , -120 
                    dw       -655 , 618 
                    db       ((( 137 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
; line 2                
                    db       -127 , 120 
                    dw       685 , -584 
                    db       ((( 319 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
; line 3                
                    db       -80 , 80 
                    dw       -686 , -584 
                    db       ((( 220 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
; line 4                
                    db       -127 , 40 
                    dw       685 , -584 
                    db       ((( 319 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
; line 5                
                    db       -80 , 0 
                    dw       -686 , -584 
                    db       ((( 220 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
; line 6                
                    db       -127 , -40 
                    dw       685 , -584 
                    db       ((( 319 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
; line 7                
                    db       -80 , -80 
                    dw       -686 , -584 
                    db       ((( 220 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
; line 9                
                    db       -127 , -120 
                    dw       0, 0 
                    db       0, 0 
; ****************************************************************************************************
entryPatternBonusTriangleTopMiddleLeftRight 
                    db       15                           ; countdown before next enemy appears 
                    db       100                          ; start Delay 
; line 1                
                    db       120 , 0 
                    dw       -651 , -465 
                    db       ((( 215 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 4 
; line 2                
                    db       -20 , -100 
                    dw       0 , 800 
                    db       ((( 90 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 4 
; line 3                
                    db       -20 , 100 
                    dw       650 , -465 
                    db       ((( 324 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 4 
; line 4                
                    db       120 , 0 
                    dw       0, 0 
                    db       0, 0 
entryPatternNineToCenterToThree 
                    db       1                            ; countdown before next enemy appears 
                    db       1                            ; start Delay 
; line 1                
                    db       0 , -127 
                    dw       0 , 900 
                    db       ((( 90 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
; line 2                
                    db       0 , 0 
                    dw       0 , 900 
                    db       ((( 90 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
; line 3                
                    db       0 , 127 
                    dw       0, 0 
                    db       0, 0 
; ****************************************************************************************************
entryPatternTenToCenterToTwo_start 
                    db       1                            ; countdown before next enemy appears 
                    db       100                          ; start Delay 
; line 1                    
                    db       64 , -127 
                    dw       -406 , 803 
                    db       ((( 117 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
; line 2                
                    db       0 , 0 
                    dw       405 , 803 
                    db       ((( 64 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
; line 3                
                    db       64 , 127 
                    dw       0, 0 
                    db       0, 0 
entryPatternTenToCenterToTwo 
                    db       1                            ; countdown before next enemy appears 
                    db       1                            ; start Delay 
; line 1                    
                    db       64 , -127 
                    dw       -406 , 803 
                    db       ((( 117 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
; line 2                
                    db       0 , 0 
                    dw       405 , 803 
                    db       ((( 64 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
; line 3                
                    db       64 , 127 
                    dw       0, 0 
                    db       0, 0 
; ****************************************************************************************************
entryPatternElevenToCenterToOne_start 
                    db       1                            ; countdown before next enemy appears 
                    db       127                          ; start Delay 
; line 1                
                    db       127 , -127 
                    dw       -637 , 636 
                    db       ((( 135 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
; line 2                
                    db       0 , 0 
                    dw       636 , 636 
                    db       ((( 45 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
; line 3                
                    db       127 , 127 
                    dw       0, 0 
                    db       0, 0 
entryPatternElevenToCenterToOne 
                    db       1                            ; countdown before next enemy appears 
                    db       1                            ; start Delay 
; line 1                
                    db       127 , -127 
                    dw       -637 , 636 
                    db       ((( 135 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
; line 2                
                    db       0 , 0 
                    dw       636 , 636 
                    db       ((( 45 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
; line 3                
                    db       127 , 127 
                    dw       0, 0 
                    db       0, 0 
entryPatternElevenPToCenterToOneP 
                    db       1                            ; countdown before next enemy appears 
                    db       1                            ; start Delay 
; line 1                
                    db       127 , -64 
                    dw       -804 , 405 
                    db       ((( 154 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
; line 2                
                    db       0 , 0 
                    dw       803 , 405 
                    db       ((( 27 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
; line 3                
                    db       127 , 64 
                    dw       0, 0 
                    db       0, 0 
; ****************************************************************************************************
blockStraightLeft 
                    db       1                            ; countdown before next enemy appears 
                    db       1                            ; start Delay 
                    db       -$30, -60 
                    dw       0 , 0 
                    db       1, 1 
                    db       -$30, -60 
                    dw       0, 0 
                    db       0, 0 
blockStraightRight 
                    db       1                            ; countdown before next enemy appears 
                    db       1                            ; start Delay 
                    db       -$30, 60 
                    dw       0 , 0 
                    db       1, 1 
                    db       -$30, 60 
                    dw       0, 0 
                    db       0, 0 
; ****************************************************************************************************
blockFive1 
bigBlock3 
                    db       1                            ; countdown before next enemy appears 
                    db       1                            ; start Delay 
                    db       -$18, $D0 +3+3 
                    dw       0 , 0 
                    db       1, 1 
                    db       -$18, $D0 +3+3 
                    dw       0, 0 
                    db       0, 0 
blockFive2 
bigBlock4 
                    db       1                            ; countdown before next enemy appears 
                    db       1                            ; start Delay 
                    db       -$18, $D0+20 +3 
                    dw       0 , 0 
                    db       1, 1 
                    db       -$18, $D0+20 +3 
                    dw       0, 0 
                    db       0, 0 
blockFive3 
bigBlock5 
                    db       1                            ; countdown before next enemy appears 
                    db       1                            ; start Delay 
                    db       -$18, $D0+20+20 
                    dw       0 , 0 
                    db       1, 1 
                    db       -$18, $D0+20+20 
                    dw       0, 0 
                    db       0, 0 
blockFive4 
bigBlock6 
                    db       1                            ; countdown before next enemy appears 
                    db       1                            ; start Delay 
                    db       -$18, $D0+20+20+20 -3 
                    dw       0 , 0 
                    db       1, 1 
                    db       -$18, $D0+20+20+20 -3 
                    dw       0, 0 
                    db       0, 0 
blockFive5 
bigBlock7 
                    db       1                            ; countdown before next enemy appears 
                    db       1                            ; start Delay 
                    db       -$18, $D0+20+20+20+20 -3-3 
                    dw       0 , 0 
                    db       1, 1 
                    db       -$18, $D0+20+20+20+20 -3-3 
                    dw       0, 0 
                    db       0, 0 
bigBlock1a 
                    db       1                            ; countdown before next enemy appears 
                    db       1                            ; start Delay 
                    db       -$18, -100 
                    dw       0 , 0 
                    db       1, 1 
                    db       -$18, -110 
                    dw       0, 0 
                    db       0, 0 
bigBlock1b 
                    db       1                            ; countdown before next enemy appears 
                    db       1                            ; start Delay 
                    db       -$18, -93 
                    dw       0 , 0 
                    db       1, 1 
                    db       -$18, -93 
                    dw       0, 0 
                    db       0, 0 
bigBlock1 
                    db       1                            ; countdown before next enemy appears 
                    db       1                            ; start Delay 
                    db       -$18, -76 
                    dw       0 , 0 
                    db       1, 1 
                    db       -$18, -76 
                    dw       0, 0 
                    db       0, 0 
bigBlock2 
                    db       1                            ; countdown before next enemy appears 
                    db       1                            ; start Delay 
                    db       -$18, -59 
                    dw       0 , 0 
                    db       1, 1 
                    db       -$18, -59 
                    dw       0, 0 
                    db       0, 0 
bigBlock8 
                    db       1                            ; countdown before next enemy appears 
                    db       1                            ; start Delay 
                    db       -$18, 43 
                    dw       0 , 0 
                    db       1, 1 
                    db       -$18, 43 
                    dw       0, 0 
                    db       0, 0 
bigBlock9 
                    db       1                            ; countdown before next enemy appears 
                    db       1                            ; start Delay 
                    db       -$18, 60 
                    dw       0 , 0 
                    db       1, 1 
                    db       -$18, 60 
                    dw       0, 0 
                    db       0, 0 
bigBlock10 
                    db       1                            ; countdown before next enemy appears 
                    db       1                            ; start Delay 
                    db       -$18, 77 
                    dw       0 , 0 
                    db       1, 1 
                    db       -$18, 77 
                    dw       0, 0 
                    db       0, 0 
bigBlock11 
                    db       1                            ; countdown before next enemy appears 
                    db       1                            ; start Delay 
                    db       -$18, 94 
                    dw       0 , 0 
                    db       1, 1 
                    db       -$18, 94 
                    dw       0, 0 
                    db       0, 0 
bigBlock12 
                    db       1                            ; countdown before next enemy appears 
                    db       1                            ; start Delay 
                    db       -$18, 111 
                    dw       0 , 0 
                    db       1, 1 
                    db       -$18, 111 
                    dw       0, 0 
                    db       0, 0 
; ****************************************************************************************************
bonus56Pattern 
                    db       8                            ; countdown before next enemy appears 
                    db       50                           ; start Delay 
; line 1                
                    db       100 , -120 
                    dw       0 , 900 
                    db       ((( 90 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
; line 2                
                    db       100 , -80 
                    dw       -749 , 499 
                    db       ((( 147 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
; line 3                
                    db       -20 , 0 
                    dw       748 , 499 
                    db       ((( 34 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
; line 4                
                    db       100 , 80 
                    dw       0 , 900 
                    db       ((( 90 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
; line 5                
                    db       100 , 120 
                    dw       0, 0 
                    db       0, 0 
; ****************************************************************************************************
bonus64Pattern_a 
                    db       8                            ; countdown before next enemy appears 
                    db       50                           ; start Delay 
                                                          ; line 1 
                    db       127 , 0 
                    dw       -700 , 0 
                    db       ((( 180 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 4 
                                                          ; line 2 
                    db       80 , 0 
                    dw       -495 , -495 
                    db       ((( 225 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 4 
                                                          ; line 3 
                    db       0 , -80 
                    dw       -495 , 494 
                    db       ((( 135 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 4 
                                                          ; line 4 
                    db       -80 , 0 
                    dw       494 , 494 
                    db       ((( 45 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 4 
                                                          ; line 5 
                    db       0 , 80 
                    dw       494 , -495 
                    db       ((( 315 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 4 
                                                          ; line 6 
                    db       80 , 0 
                    dw       700 , 0 
                    db       ((( 0 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 4 
                                                          ; line 7 
                    db       127 , 0 
                    dw       0, 0 
                    db       0, 0 
; ****************************************************************************************************
bonus64Pattern_b 
                    db       8                            ; countdown before next enemy appears 
                    db       50                           ; start Delay 
                                                          ; line 1 
                    db       0 , -127 
                    dw       0 , 700 
                    db       ((( 90 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 4 
                                                          ; line 2 
                    db       0 , -80 
                    dw       -495 , 494 
                    db       ((( 135 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 4 
                                                          ; line 3 
                    db       -80 , 0 
                    dw       494 , 494 
                    db       ((( 45 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 4 
                                                          ; line 4 
                    db       0 , 80 
                    dw       494 , -495 
                    db       ((( 315 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 4 
                                                          ; line 5 
                    db       80 , 0 
                    dw       -495 , -495 
                    db       ((( 225 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 4 
                                                          ; line 6 
                    db       0 , -80 
                    dw       0 , -700 
                    db       ((( 270 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 4 
                                                          ; line 7 
                    db       0 , -127 
                    dw       0, 0 
                    db       0, 0 
; ****************************************************************************************************
bonus72Pattern 
                    db       8                            ; countdown before next enemy appears 
                    db       50                           ; start Delay 
                                                          ; line 1 
                    db       -100 , -127 
                    dw       466 , 521 
                    db       ((( 49 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 4 
                                                          ; line 2 
                    db       127 , 127 
                    dw       0, 0 
                    db       0, 0 
; ****************************************************************************************************
kamikaze_60 
                    db       8                            ; countdown before next enemy appears 
                    db       50                           ; start Delay 
                                                          ; line 1 
                    db       -110 , -127 
                    dw       458 , 529 
                    db       ((( 50 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 4 
                                                          ; line 2 
                    db       0 , 0 
                    dw       -627 , -314 
                    db       ((( 206 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 4 
                                                          ; line 3 
                    db       -120 , -60 
                    dw       0, 0 
                    db       0, 0 
; ****************************************************************************************************
kamikaze_76 
                    db       8                            ; countdown before next enemy appears 
                    db       50                           ; start Delay 
                                                          ; line 1 
                    db       0 , -120 
                    dw       0 , 900 
                    db       ((( 90 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 2 
                    db       0 , 120 
                    dw       -148 , -888 
                    db       ((( 260 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 3 
                    db       -40 , -120 
                    dw       0 , 900 
                    db       ((( 90 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 4 
                    db       -40 , -40 
                    dw       -805 , 402 
                    db       ((( 154 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 5 
                    db       -120 , 0 
                    dw       804 , 402 
                    db       ((( 27 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 6 
                    db       -40 , 40 
                    dw       0 , 900 
                    db       ((( 90 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 7 
                    db       -40 , 120 
                    dw       0, 0 
                    db       0, 0 
; ****************************************************************************************************
kamikaze_84 
                    db       8                            ; countdown before next enemy appears 
                    db       50                           ; start Delay 
                    db       -125 , -60 
                    dw       778 , 185 
                    db       ((( 14 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 4 
                                                          ; line 2 
                    db       127 , 0 
                    dw       0, 0 
                    db       0, 0 
; ****************************************************************************************************
kamikaze_92 
                    db       8                            ; countdown before next enemy appears 
                    db       100                          ; start Delay 
                                                          ; line 1 
                    db       0 , 125 
                    dw       636 , -637 
                    db       ((( 315 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 2 
                    db       125 , 0 
                    dw       -637 , -637 
                    db       ((( 225 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 3 
                    db       0 , -125 
                    dw       -637 , 636 
                    db       ((( 135 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 4 
                    db       -125 , 0 
                    dw       636 , 636 
                    db       ((( 45 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 5 
                    db       0 , 125 
                    dw       0, 0 
                    db       0, 0 
; ****************************************************************************************************
kamikaze_68 
                    db       8                            ; countdown before next enemy appears 
                    db       50                           ; start Delay 
                                                          ; line 1 
                    db       127 , 127 
                    dw       -689 , -128 
                    db       ((( 190 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 4 
                                                          ; line 2 
                    db       -127 , 80 
                    dw       662 , -226 
                    db       ((( 341 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 4 
                                                          ; line 3 
                    db       -80 , 64 
                    dw       0 , -700 
                    db       ((( 270 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 4 
                                                          ; line 4 
                    db       -80 , -64 
                    dw       -663 , -226 
                    db       ((( 198 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 4 
                                                          ; line 5 
                    db       -127 , -80 
                    dw       688 , -128 
                    db       ((( 349 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 4 
                                                          ; line 6 
                    db       127 , -127 
                    dw       0, 0 
                    db       0, 0 
; ****************************************************************************************************
pattern75 
                    db       8                            ; countdown before next enemy appears 
                    db       50                           ; start Delay 
                                                          ; line 1 
;                    db       120 , -120 
;                    dw       0 , 900 
;                    db       ((( 90 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 2 
                    db       100 , -120 
                    dw       0 , 900 
                    db       ((( 90 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
;                    db       120 , 120 
;                    dw       -637 , -637 
;                    db       ((( 225 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
; line 2                
                    db       100 , 120 
                    dw       -577 , -692 
                    db       ((( 230 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 3 
                    db       0 , 0 
                    dw       -500 , -749 
                    db       ((( 236 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 4 
                    db       -80 , -120 
                    dw       0 , 900 
                    db       ((( 90 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 5 
                    db       -80 , 120 
                    dw       0, 0 
                    db       0, 0 
; ****************************************************************************************************
bonus80Pattern 
                    db       8                            ; countdown before next enemy appears 
                    db       50                           ; start Delay 
                                                          ; line 1 
                    db       120 , -60 
                    dw       -950 , 0 
                    db       ((( 180 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 2 
                    db       -90 , -60 
                    dw       908 , -277 
                    db       ((( 343 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 3 
                    db       127 , -126 
                    dw       0, 0 
                    db       0, 0 
; ****************************************************************************************************
bonus88Pattern1 
                    db       8                            ; countdown before next enemy appears 
                    db       50                           ; start Delay 
                                                          ; line 1 
                    db       100 , -125 
                    dw       0 , 700 
                    db       ((( 90 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 4 
                                                          ; line 2 
                    db       100 , 125 
                    dw       0, 0 
                    db       0, 0 
bonus88Pattern2 
                    db       8                            ; countdown before next enemy appears 
                    db       50                           ; start Delay 
                                                          ; line 1 
                    db       40 , -125 
                    dw       0 , 700 
                    db       ((( 90 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 4 
                                                          ; line 2 
                    db       40 , 125 
                    dw       0, 0 
                    db       0, 0 
; ****************************************************************************************************
bonus92Pattern1 
                    db       8                            ; countdown before next enemy appears 
                    db       50                           ; start Delay 
                                                          ; line 1 
                    db       0 , 125 
                    dw       636 , -637 
                    db       ((( 315 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 2 
                    db       125 , 0 
                    dw       0, 0 
                    db       0, 0 
bonus92Pattern2 
                    db       8                            ; countdown before next enemy appears 
                    db       50                           ; start Delay 
                                                          ; line 1 
                    db       -40 , 125 
                    dw       274 , -858 
                    db       ((( 287 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 2 
                    db       0 , 0 
                    dw       274 , 857 
                    db       ((( 73 +ANGLE_DIF/2)/ANGLE_DIF)*2)%16, 5 
                                                          ; line 3 
                    db       40 , 125 
                    dw       0, 0 
                    db       0, 0 
; ****************************************************************************************************
blockLoopPattern 
vaderLoopyPattern: 
                    db       10                           ;25 ; countdown before next enemy appears 
                    db       40                           ; start Delay 
; determined with excel sheet
; adders are 16 bit
; + 1 filler to make the length 8
; speed = 900
                                                          ; line 1 
                    db       96 , -127 
                    dw       0 , 900 
                    db       (( 90 /ANGLE_DIF)*2)%16, 5 
                                                          ; line 2 
                    db       96 , 32 
                    dw       -592 , 678 
                    db       ( ((132+ANGLE_DIF/2) /ANGLE_DIF)*2)%16, 5 
                                                          ; line 3 
                    db       69 , 63 
                    dw       -893 , 117 
                    db       (( (173+ANGLE_DIF/2) /ANGLE_DIF)*2)%16, 5 
                                                          ; line 4 
                    db       16 , 70 
                    dw       -786 , -440 
                    db       ( ((209+ANGLE_DIF/2) /ANGLE_DIF)*2)%16, 5 
                                                          ; line 5 
                    db       -34 , 42 
                    dw       -477 , -764 
                    db       ( ((237+ANGLE_DIF/2) /ANGLE_DIF)*2)%16, 5 
                                                          ; line 6 
                    db       -64 , -6 
                    dw       402 , -805 
                    db       ( ((296+ANGLE_DIF/2) /ANGLE_DIF)*2)%16, 5 
                                                          ; line 7 
                    db       -39 , -56 
                    dw       739 , -514 
                    db       (( (325+ANGLE_DIF/2) /ANGLE_DIF)*2)%16, 5 
                                                          ; line 9 
                    db       10 , -90 
                    dw       859 , 265 
                    db       ( ((18+ANGLE_DIF/2) /ANGLE_DIF)*2)%16,5 
                                                          ; line 10 
                    db       65 , -73 
                    dw       488 , 756 
                    db       ( ((58+ANGLE_DIF/2) /ANGLE_DIF)*2)%16, 5 
                                                          ; line 11 
                    db       96 , -25 
                    dw       0 , 900 
                    db       (( (90+ANGLE_DIF/2) /ANGLE_DIF)*2)%16, 5 
                                                          ; line 10 
                    db       96 , 32                      ; the loop y,x must be the same as the one where the loop goes to 
                    dw       0, 0 
                    db       2, 0 
; ****************************************************************************************************
; NOT USED YET
; ****************************************************************************************************
; ****************************************************************************************************
; ****************************************************************************************************
; ****************************************************************************************************
; ****************************************************************************************************
;
; null terminated list with entry patterns
; patterns should be thus not more than
; twenty enemies are spawned
; (but nothing bad happens either)
; struct IntroLine
;  ds LINE_PATTERN_DEF, 2
;  ds LINE_PATTERN_INVERS ,1
;  ds LINE_PATTERN_ENEMY_COUNT ,1
; end struct
;Level1Intro:                                              ;        empty 
;                    dw       entryPatternNineToCenterToThree , 1 *256+1   
;                    dw       entryPatternNineToCenterToThree , 0 *256+1   
;                    dw       entryPatternTenToCenterToTwo , 1 *256+1      
;                    dw       entryPatternTenToCenterToTwo , 0 *256+1      
;                    dw       entryPatternElevenToCenterToOne , 1 *256+1      
;                    dw       entryPatternElevenToCenterToOne , 0 *256+1      
;                    dw       entryPatternElevenPToCenterToOneP , 1 *256+1     
;                    dw       entryPatternElevenPToCenterToOneP , 0 *256+1     
;                    dw       entryPatternNineToCenterToThree , 1 *256+1   
;                    dw       entryPatternNineToCenterToThree , 0 *256+1   
;                    dw       entryPatternTenToCenterToTwo , 1 *256+1      
;                    dw       entryPatternTenToCenterToTwo , 0 *256+1      
;                    dw       entryPatternElevenToCenterToOne , 1 *256+1      
;                    dw       entryPatternElevenToCenterToOne , 0 *256+1      
;                    dw       entryPatternElevenPToCenterToOneP , 1 *256+1     
;                    dw       entryPatternElevenPToCenterToOneP , 0 *256+1     
;                    dw       entryPatternNineToCenterToThree , 1 *256+1   
;                    dw       entryPatternNineToCenterToThree , 0 *256+1   
;                    dw       entryPatternTenToCenterToTwo , 1 *256+1      
;                    dw       entryPatternTenToCenterToTwo , 0 *256+1      
;                    dw       entryPatternElevenToCenterToOne , 1 *256+1      
;                    dw       entryPatternElevenToCenterToOne , 0 *256+1      
;                    dw       entryPatternElevenPToCenterToOneP , 1 *256+1     
;                    dw       entryPatternElevenPToCenterToOneP , 0 *256+1     
;                    dw       entryPatternNineToCenterToThree , 1 *256+1   
;                    dw       entryPatternNineToCenterToThree , 0 *256+1   
;                    dw       entryPatternTenToCenterToTwo , 1 *256+1      
;                    dw       entryPatternTenToCenterToTwo , 0 *256+1      
;                    dw       entryPatternElevenToCenterToOne , 1 *256+1      
;                    dw       entryPatternElevenToCenterToOne , 0 *256+1      
;                    dw       entryPatternElevenPToCenterToOneP , 1 *256+1     
;                    dw       entryPatternElevenPToCenterToOneP , 0 *256+1     
;                    dw       0 
Level1Intro:                                              ;        empty 
                    dw       emptyPattern , 0 *256+5      ; not inverse 
                    dw       emptyPattern , 1 *256+5      ; inverse 
                    dw       emptyPattern , 0 *256+5      ; not inverse 
                    dw       emptyPattern , 1 *256+5      ; inverse 
                    dw       0 
Level2Intro 
                    dw       entryPatternVShapeRightToLeft_slow , 0 *256+5 ; not inverse 
                    dw       entryPatternVShapeRightToLeft_slow , 1 *256+5 ; inverse 
                    dw       entryPatternVShapeRightToLeft_slow , 0 *256+5 ; not inverse 
                    dw       entryPatternVShapeRightToLeft_slow , 1 *256+5 ; inverse 
                    dw       0 
Level3Intro         =        Level2Intro 
Level4Intro_Kamikaze: 
                    dw       kamikaze_middleToLeft, 0*256+10 
                    dw       kamikaze_middleToLeft, 1*256+10 
                    dw       kamikaze_middleToLeft, 0*256+10 
                    dw       kamikaze_middleToLeft, 1*256+10 
                    dw       0 
Level5Intro         =        Level2Intro 
Level6Intro 
                    dw       entryPatternVShapeRightToLeft_slow , 0 *256+10 ; not inverse 
                    dw       entryPatternVShapeRightToLeft_slow , 1 *256+10 ; inverse 
                    dw       entryPatternVShapeRightToLeft_slow , 0 *256+10 ; not inverse 
                    dw       entryPatternVShapeRightToLeft_slow , 1 *256+10 ; inverse 
                    dw       0 
Level7Intro: 
                    dw       entryPatternVShapeRightToLeft_slow , 0 *256+15 ; not inverse 
                    dw       entryPatternVShapeRightToLeft_slow , 1 *256+15 ; inverse 
                    dw       entryPatternVShapeRightToLeft_slow , 0 *256+15 ; not inverse 
                    dw       entryPatternVShapeRightToLeft_slow , 1 *256+15 ; inverse 
                    dw       0 
Level8Intro_Bonus: 
                    dw       entryPatternEnterMiddleSquareWaveExitRight, 0 *256+10 ; not inverse 
                    dw       entryPatternEnterMiddleSquareWaveExitRight, 0 *256+10 ; not inverse 
                    dw       entryPatternEnterMiddleSquareWaveExitRight, 1 *256+10 ; inverse 
                    dw       entryPatternEnterMiddleSquareWaveExitRight, 1 *256+10 ; inverse 
                    dw       0 
Level9Intro: 
                    dw       entryPatternLeftStraightDownZigLeftOut , 0 *256+5 ; not inverse 
                    dw       entryPatternLeftStraightDownZigLeftOut , 1 *256+5 ; inverse 
                    dw       entryPatternLeftStraightDownZigLeftOut , 0 *256+5 ; not inverse 
                    dw       entryPatternLeftStraightDownZigLeftOut , 1 *256+5 ; inverse 
                    dw       0 
Level10Intro 
                    dw       entryPatternBottomZigZag , 0 *256+5 ; not inverse 
                    dw       entryPatternBottomZigZag , 1 *256+5 ; inverse 
                    dw       entryPatternBottomZigZag , 0 *256+5 ; not inverse 
                    dw       entryPatternBottomZigZag , 1 *256+5 ; inverse 
                    dw       0 
Level11Intro        =        Level9Intro 
Level12Intro_Kamikaze: 
                    dw       kamikaze1_1 , 0 *256+1 
                    dw       kamikaze1_2 , 0 *256+1 
                    dw       kamikaze1_3 , 0 *256+1 
                    dw       kamikaze1_4 , 0 *256+1 
                    dw       kamikaze1_5 , 0 *256+1 
                    dw       kamikaze3_1 , 0 *256+1 
                    dw       kamikaze3_2 , 0 *256+1 
                    dw       kamikaze3_3 , 0 *256+1 
                    dw       kamikaze3_4 , 0 *256+1 
                    dw       kamikaze3_5 , 0 *256+1 
                    dw       kamikaze1_1 , 1 *256+1 
                    dw       kamikaze1_2 , 1 *256+1 
                    dw       kamikaze1_3 , 1 *256+1 
                    dw       kamikaze1_4 , 1 *256+1 
                    dw       kamikaze1_5 , 1 *256+1 
                    dw       kamikaze1_1 , 0 *256+1 
                    dw       kamikaze1_2 , 0 *256+1 
                    dw       kamikaze1_3 , 0 *256+1 
                    dw       kamikaze1_4 , 0 *256+1 
                    dw       kamikaze1_5 , 0 *256+1 
                    dw       kamikaze3_1 , 0 *256+1 
                    dw       kamikaze3_2 , 0 *256+1 
                    dw       kamikaze3_3 , 0 *256+1 
                    dw       kamikaze3_4 , 0 *256+1 
                    dw       kamikaze3_5 , 0 *256+1 
                    dw       kamikaze1_1 , 1 *256+1 
                    dw       kamikaze1_2 , 1 *256+1 
                    dw       kamikaze1_3 , 1 *256+1 
                    dw       kamikaze1_4 , 1 *256+1 
                    dw       kamikaze1_5 , 1 *256+1 
                    dw       0 
Level13Intro: 
Level14Intro: 
                    dw       entryPatternLeftStraightDownZigLeftOut , 0 *256+10 ; not inverse 
                    dw       entryPatternLeftStraightDownZigLeftOut , 1 *256+10 ; inverse 
                    dw       entryPatternLeftStraightDownZigLeftOut , 0 *256+10 ; not inverse 
                    dw       entryPatternLeftStraightDownZigLeftOut , 1 *256+10 ; inverse 
                    dw       0 
Level15Intro        =        Level9Intro 
Level16Intro_Bonus: 
                    dw       entryPatternEnterMiddleSquareWaveExitRight, 0 *256+10 ; not inverse 
                    dw       entryPatternEnterMiddleSquareWaveExitRight, 0 *256+10 ; not inverse 
                    dw       entryPatternEnterMiddleSquareWaveExitRight, 1 *256+10 ; inverse 
                    dw       entryPatternEnterMiddleSquareWaveExitRight, 1 *256+10 ; inverse 
                    dw       0 
Level17Intro        =        Level10Intro 
Level18Intro        =        Level9Intro 
Level19Intro        =        Level10Intro 
Level20Intro_Kamikaze: 
                    dw       kamikaze_middleToLeft, 0*256+10 
                    dw       kamikaze_middleToLeft, 1*256+10 
                    dw       kamikaze_rightStepMiddle, 0*256+10 
                    dw       kamikaze_rightStepMiddle, 1*256+10 
                    dw       0 
Level21Intro        =        Level9Intro 
Level22Intro        =        Level10Intro 
Level23Intro: 
                    dw       entryPatternEnterMiddleSquareWaveExitRight2, 0 *256+10 ; not inverse 
                    dw       entryPatternEnterMiddleSquareWaveExitRight2, 0 *256+10 ; not inverse 
                    dw       entryPatternEnterMiddleSquareWaveExitRight2, 1 *256+10 ; inverse 
                    dw       entryPatternEnterMiddleSquareWaveExitRight2, 1 *256+10 ; inverse 
                    dw       0 
Level24Intro_Bonus: 
                    dw       entryPatternEnterMiddleSquareWaveExitRight, 0 *256+10 ; not inverse 
                    dw       entryPatternEnterMiddleSquareWaveExitRight2, 0 *256+10 ; not inverse 
                    dw       entryPatternEnterMiddleSquareWaveExitRight, 1 *256+10 ; inverse 
                    dw       entryPatternEnterMiddleSquareWaveExitRight2, 1 *256+10 ; inverse 
                    dw       0 
Level25Intro 
                    dw       entryPatternTopSmallZigZag_lower, 0 *256+10 ; not inverse 
                    dw       entryPatternTopSmallZigZag_higher, 1 *256+10 ; inverse 
                    dw       0 
Level26Intro 
                    dw       entryPatternTopSmallZigZag_higher, 1 *256+10 ; inverse 
                    dw       entryPatternTopSmallZigZag_lower, 0 *256+10 ; not inverse 
                    dw       entryPatternTopSmallZigZag_higher, 1 *256+10 ; inverse 
                    dw       entryPatternTopSmallZigZag_lower, 0 *256+10 ; not inverse 
                    dw       0 
Level27Intro 
                    dw       entryPatternVShapeRightToLeft_fast , 0 *256+5 ; not inverse 
                    dw       entryPatternVShapeRightToLeft_fast , 1 *256+5 ; inverse 
                    dw       entryPatternVShapeRightToLeft_fast , 0 *256+5 ; not inverse 
                    dw       entryPatternVShapeRightToLeft_fast , 1 *256+5 ; inverse 
                    dw       0 
Level28Intro_Kamikaze: 
                    dw       kamikaze_leftTop_RightBottom_zigZag, 0*256+10 
                    dw       kamikaze_leftTop_RightBottom_zigZag, 1*256+10 
                    dw       kamikaze_leftTop_RightBottom_zigZag, 0*256+10 
                    dw       kamikaze_leftTop_RightBottom_zigZag, 1*256+10 
                    dw       0 
Level29Intro 
                    dw       entryPatternTopSmallZigZag_higher, 1 *256+10 ; inverse 
                    dw       entryPatternTopSmallZigZag_lower, 0 *256+10 ; not inverse 
                    dw       entryPatternTopSmallZigZag_higher, 1 *256+10 ; inverse 
                    dw       entryPatternTopSmallZigZag_lower, 0 *256+10 ; not inverse 
                    dw       entryPatternTopSmallZigZag_higher, 1 *256+10 ; inverse 
                    dw       entryPatternTopSmallZigZag_lower, 0 *256+10 ; not inverse 
                    dw       0 
Level30Intro: 
                    dw       entryPatternLeftStraightDownZigLeftOut , 0 *256+5 ; not inverse 
                    dw       entryPatternLeftStraightDownZigLeftOut , 1 *256+5 ; inverse 
                    dw       entryPatternLeftStraightDownZigLeftOut , 0 *256+5 ; not inverse 
                    dw       entryPatternLeftStraightDownZigLeftOut , 1 *256+5 ; inverse 
                    dw       0 
Level31Intro        =        Level25Intro 
Level32Intro_Bonus: 
                    dw       entryPatternBottomRightTopLeftOut_fast, 0 *256+10 ; not inverse 
                    dw       entryPatternBottomRightTopLeftOut_fast, 1 *256+10 ; inverse 
                    dw       entryPatternBottomRightTopLeftOut_fast, 0 *256+10 ; not inverse 
                    dw       entryPatternBottomRightTopLeftOut_fast, 1 *256+10 ; inverse 
                    dw       0 
Level33Intro: 
                    dw       entryPatternTopSmallZigZag_lower_fast, 0 *256+10 ; not inverse 
                    dw       entryPatternTopSmallZigZag_higher_fast, 1 *256+10 ; inverse 
                    dw       entryPatternTopSmallZigZag_lower_fast, 0 *256+10 ; not inverse 
                    dw       entryPatternTopSmallZigZag_higher_fast, 1 *256+10 ; inverse 
                    dw       entryPatternTopSmallZigZag_lower_fast, 0 *256+10 ; not inverse 
                    dw       entryPatternTopSmallZigZag_higher_fast, 1 *256+10 ; inverse 
                    dw       entryPatternTopSmallZigZag_lower_fast, 0 *256+10 ; not inverse 
                    dw       entryPatternTopSmallZigZag_higher_fast, 1 *256+10 ; inverse 
                    dw       0 
Level34Intro        =        Level33Intro 
Level35Intro: 
                    dw       entryPatternLeftStraightDownZigLeftOut , 0 *256+5 ; not inverse 
                    dw       entryPatternLeftStraightDownZigLeftOut , 1 *256+5 ; inverse 
                    dw       entryPatternLeftStraightDownZigLeftOut , 0 *256+5 ; not inverse 
                    dw       entryPatternLeftStraightDownZigLeftOut , 1 *256+5 ; inverse 
                    dw       0 
Level36Intro_Kamikaze 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 0 *256+1 ; not inverse 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 1 *256+1 ; inverse 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 0 *256+1 ; not inverse 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 1 *256+1 ; inverse 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 0 *256+1 ; not inverse 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 1 *256+1 ; inverse 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 0 *256+1 ; not inverse 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 1 *256+1 ; inverse 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 0 *256+1 ; not inverse 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 1 *256+1 ; inverse 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 0 *256+1 ; not inverse 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 1 *256+1 ; inverse 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 0 *256+1 ; not inverse 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 1 *256+1 ; inverse 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 0 *256+1 ; not inverse 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 1 *256+1 ; inverse 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 0 *256+1 ; not inverse 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 1 *256+1 ; inverse 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 0 *256+1 ; not inverse 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 1 *256+1 ; inverse 
                    dw       0 
Level37Intro: 
                    dw       entryPatternLeftStraightDownZigLeftOut , 1 *256+5 ; inverse 
                    dw       entryPatternLeftStraightDownZigLeftOut , 0 *256+5 ; not inverse 
                    dw       entryPatternLeftStraightDownZigLeftOut , 1 *256+5 ; inverse 
                    dw       entryPatternLeftStraightDownZigLeftOut , 0 *256+5 ; not inverse 
                    dw       0 
Level38Intro: 
                    dw       entryPatternLeftStraightDownZigLeftOut_noWait , 1 *256+1 ; inverse 
                    dw       entryPatternLeftStraightDownZigLeftOut_noWait , 0 *256+1 ; not inverse 
                    dw       entryPatternLeftStraightDownZigLeftOut_noWait , 1 *256+1 ; inverse 
                    dw       entryPatternLeftStraightDownZigLeftOut_noWait , 0 *256+1 ; not inverse 
                    dw       entryPatternLeftStraightDownZigLeftOut_noWait , 1 *256+1 ; inverse 
                    dw       entryPatternLeftStraightDownZigLeftOut_noWait , 0 *256+1 ; not inverse 
                    dw       entryPatternLeftStraightDownZigLeftOut_noWait , 1 *256+1 ; inverse 
                    dw       entryPatternLeftStraightDownZigLeftOut_noWait , 0 *256+1 ; not inverse 
                    dw       entryPatternLeftStraightDownZigLeftOut_noWait , 1 *256+1 ; inverse 
                    dw       entryPatternLeftStraightDownZigLeftOut_noWait , 0 *256+1 ; not inverse 
                    dw       entryPatternLeftStraightDownZigLeftOut_noWait , 1 *256+1 ; inverse 
                    dw       entryPatternLeftStraightDownZigLeftOut_noWait , 0 *256+1 ; not inverse 
                    dw       entryPatternLeftStraightDownZigLeftOut_noWait , 1 *256+1 ; inverse 
                    dw       entryPatternLeftStraightDownZigLeftOut_noWait , 0 *256+1 ; not inverse 
                    dw       entryPatternLeftStraightDownZigLeftOut_noWait , 1 *256+1 ; inverse 
                    dw       entryPatternLeftStraightDownZigLeftOut_noWait , 0 *256+1 ; not inverse 
                    dw       entryPatternLeftStraightDownZigLeftOut_noWait , 1 *256+1 ; inverse 
                    dw       entryPatternLeftStraightDownZigLeftOut_noWait , 0 *256+1 ; not inverse 
                    dw       entryPatternLeftStraightDownZigLeftOut_noWait , 1 *256+1 ; inverse 
                    dw       entryPatternLeftStraightDownZigLeftOut_noWait , 0 *256+1 ; not inverse 
                    dw       0 
Level39Intro        =        Level38Intro 
Level40Intro_Bonus 
                    dw       entryPatternTopSmallZigZag_higher_fast, 0 *256+10 ; not inverse 
                    dw       entryPatternTopSmallZigZag_lower_fast, 1 *256+10 ; inverse 
                    dw       entryPatternBottomZigZag, 0 *256+10 ; not inverse 
                    dw       entryPatternBottomZigZag, 1 *256+10 ; inverse 
                    dw       entryPatternTopSmallZigZag_higher_fast, 1 *256+10 ; not inverse 
                    dw       entryPatternTopSmallZigZag_lower_fast, 0 *256+10 ; inverse 
                    dw       0 
Level41Intro 
                    dw       entryPatternVShapeRightToLeft_fast , 1 *256+1 ; inverse 
                    dw       entryPatternVShapeRightToLeft_fast , 0 *256+1 ; inverse 
                    dw       entryPatternVShapeRightToLeft_fast , 1 *256+1 ; inverse 
                    dw       entryPatternVShapeRightToLeft_fast , 0 *256+1 ; inverse 
                    dw       entryPatternVShapeRightToLeft_fast , 1 *256+1 ; inverse 
                    dw       entryPatternVShapeRightToLeft_fast , 0 *256+1 ; inverse 
                    dw       entryPatternVShapeRightToLeft_fast , 1 *256+1 ; inverse 
                    dw       entryPatternVShapeRightToLeft_fast , 0 *256+1 ; inverse 
                    dw       entryPatternVShapeRightToLeft_fast , 1 *256+1 ; inverse 
                    dw       entryPatternVShapeRightToLeft_fast , 0 *256+1 ; inverse 
                    dw       entryPatternTopSmallZigZag_higher_fast, 0 *256+10 ; not inverse 
                    dw       entryPatternVShapeRightToLeft_fast , 1 *256+1 ; inverse 
                    dw       entryPatternVShapeRightToLeft_fast , 0 *256+1 ; inverse 
                    dw       entryPatternVShapeRightToLeft_fast , 1 *256+1 ; inverse 
                    dw       entryPatternVShapeRightToLeft_fast , 0 *256+1 ; inverse 
                    dw       entryPatternVShapeRightToLeft_fast , 1 *256+1 ; inverse 
                    dw       entryPatternVShapeRightToLeft_fast , 0 *256+1 ; inverse 
                    dw       entryPatternVShapeRightToLeft_fast , 1 *256+1 ; inverse 
                    dw       entryPatternVShapeRightToLeft_fast , 0 *256+1 ; inverse 
                    dw       entryPatternVShapeRightToLeft_fast , 1 *256+1 ; inverse 
                    dw       entryPatternVShapeRightToLeft_fast , 0 *256+1 ; inverse 
                    dw       entryPatternTopSmallZigZag_higher_fast, 1 *256+10 ; not inverse 
                    dw       0 
Level42Intro 
                    dw       emptyPattern , 1 *256+20     ; inverse 
                    dw       0 
Level43Intro        =        Level42Intro 
Level44Intro_Kamikaze 
                    dw       kamikaze_leftTop_RightBottom_zigZag, 0*256+10 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 0 *256+1 ; not inverse 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 1 *256+1 ; inverse 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 0 *256+1 ; not inverse 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 1 *256+1 ; inverse 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 0 *256+1 ; not inverse 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 1 *256+1 ; inverse 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 0 *256+1 ; not inverse 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 1 *256+1 ; inverse 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 0 *256+1 ; not inverse 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 1 *256+1 ; inverse 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 0 *256+1 ; not inverse 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 1 *256+1 ; inverse 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 0 *256+1 ; not inverse 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 1 *256+1 ; inverse 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 0 *256+1 ; not inverse 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 1 *256+1 ; inverse 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 0 *256+1 ; not inverse 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 1 *256+1 ; inverse 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 0 *256+1 ; not inverse 
                    dw       kamikazeEnterLeftMiddleZagDownMiddleOut , 1 *256+1 ; inverse 
                    dw       kamikaze_leftTop_RightBottom_zigZag, 1*256+10 
                    dw       0 
Level45Intro        =        Level42Intro 
Level46Intro        =        Level42Intro 
Level47Intro        =        Level25Intro 
Level48Intro_Bonus 
                    dw       entryPatternBonusTriangleTopMiddleLeftRight, 0 *256+20 ; not inverse 
                    dw       entryPatternBonusTriangleTopMiddleLeftRight, 1 *256+20 ; inverse 
                    dw       0 
Level49Intro 
                    dw       entryPatternVShapeRightToLeft_slow , 1 *256+1 ; inverse 
                    dw       entryPatternVShapeRightToLeft_slow , 0 *256+1 ; inverse 
                    dw       entryPatternVShapeRightToLeft_slow , 1 *256+1 ; inverse 
                    dw       entryPatternVShapeRightToLeft_slow , 0 *256+1 ; inverse 
                    dw       entryPatternVShapeRightToLeft_slow , 1 *256+1 ; inverse 
                    dw       entryPatternVShapeRightToLeft_slow , 0 *256+1 ; inverse 
                    dw       entryPatternVShapeRightToLeft_slow , 1 *256+1 ; inverse 
                    dw       entryPatternVShapeRightToLeft_slow , 0 *256+1 ; inverse 
                    dw       entryPatternVShapeRightToLeft_slow , 1 *256+1 ; inverse 
                    dw       entryPatternVShapeRightToLeft_slow , 0 *256+1 ; inverse 
                    dw       entryPatternTopSmallZigZag_higher, 0 *256+10 ; not inverse 
                    dw       entryPatternVShapeRightToLeft_slow , 1 *256+1 ; inverse 
                    dw       entryPatternVShapeRightToLeft_slow , 0 *256+1 ; inverse 
                    dw       entryPatternVShapeRightToLeft_slow , 1 *256+1 ; inverse 
                    dw       entryPatternVShapeRightToLeft_slow , 0 *256+1 ; inverse 
                    dw       entryPatternVShapeRightToLeft_slow , 1 *256+1 ; inverse 
                    dw       entryPatternVShapeRightToLeft_slow , 0 *256+1 ; inverse 
                    dw       entryPatternVShapeRightToLeft_slow , 1 *256+1 ; inverse 
                    dw       entryPatternVShapeRightToLeft_slow , 0 *256+1 ; inverse 
                    dw       entryPatternVShapeRightToLeft_slow , 1 *256+1 ; inverse 
                    dw       entryPatternVShapeRightToLeft_slow , 0 *256+1 ; inverse 
                    dw       entryPatternTopSmallZigZag_higher, 1 *256+10 ; not inverse 
                    dw       0 
Level50Intro 
                    dw       entryPatternNineToCenterToThree , 0 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 0 *256+1 ; inverse 
fourtyEntry 
                    dw       entryPatternElevenToCenterToOne , 0 *256+1 ; inverse 
                    dw       entryPatternNineToCenterToThree , 1 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 1 *256+1 ; inverse 
                    dw       entryPatternElevenToCenterToOne , 1 *256+1 ; inverse 
                    dw       entryPatternNineToCenterToThree , 0 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 0 *256+1 ; inverse 
                    dw       entryPatternElevenToCenterToOne , 0 *256+1 ; inverse 
                    dw       entryPatternNineToCenterToThree , 1 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 1 *256+1 ; inverse 
                    dw       entryPatternElevenToCenterToOne_start , 1 *256+1 ; inverse 
                    dw       entryPatternNineToCenterToThree , 0 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 0 *256+1 ; inverse 
                    dw       entryPatternElevenToCenterToOne , 0 *256+1 ; inverse 
                    dw       entryPatternNineToCenterToThree , 1 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 1 *256+1 ; inverse 
                    dw       entryPatternElevenToCenterToOne , 1 *256+1 ; inverse 
                    dw       entryPatternNineToCenterToThree , 0 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 0 *256+1 ; inverse 
twentyEntry 
                    dw       entryPatternElevenToCenterToOne_start , 0 *256+1 ; inverse 
                    dw       entryPatternNineToCenterToThree , 1 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 1 *256+1 ; inverse 
                    dw       entryPatternElevenToCenterToOne , 1 *256+1 ; inverse 
                    dw       entryPatternNineToCenterToThree , 0 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 0 *256+1 ; inverse 
                    dw       entryPatternElevenToCenterToOne , 0 *256+1 ; inverse 
                    dw       entryPatternNineToCenterToThree , 1 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 1 *256+1 ; inverse 
                    dw       entryPatternElevenToCenterToOne_start , 1 *256+1 ; inverse 
                    dw       entryPatternNineToCenterToThree , 0 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 0 *256+1 ; inverse 
                    dw       entryPatternElevenToCenterToOne , 0 *256+1 ; inverse 
                    dw       entryPatternNineToCenterToThree , 1 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 1 *256+1 ; inverse 
                    dw       entryPatternElevenToCenterToOne , 1 *256+1 ; inverse 
                    dw       entryPatternNineToCenterToThree , 0 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 0 *256+1 ; inverse 
                    dw       entryPatternElevenToCenterToOne , 0 *256+1 ; inverse 
                    dw       entryPatternNineToCenterToThree , 1 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 1 *256+1 ; inverse 
                    dw       0 
Level51Intro 
                    dw       entryPatternTenToCenterToTwo , 0 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 1 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 0 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 1 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 0 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 1 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 0 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 1 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 0 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo_start , 1 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 0 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 1 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 0 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 1 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 0 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 1 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 0 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 1 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 0 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 1 *256+1 ; inverse 
                    dw       0 
Level52Intro_Kamikaze 
                    dw       kamikaze1_2 , 0 *256+1       ; left 
                    dw       kamikaze3_2 , 0 *256+1       ; middle 
                    dw       kamikaze1_2 , 1 *256+1       ; right 
                    dw       kamikaze1_3 , 0 *256+1       ; left 
                    dw       kamikaze3_3 , 0 *256+1       ; middle 
                    dw       kamikaze1_3 , 1 *256+1       ; right 
                    dw       kamikaze1_4 , 0 *256+1       ; left 
                    dw       kamikaze3_4 , 0 *256+1       ; middle 
                    dw       kamikaze1_4 , 1 *256+1       ; right 
                    dw       kamikaze1_5 , 0 *256+1       ; left 
                    dw       kamikaze3_5 , 0 *256+1       ; middle 
                    dw       kamikaze1_5 , 1 *256+1       ; right 
                    dw       kamikaze1_2 , 0 *256+1       ; left 
                    dw       kamikaze3_2 , 0 *256+1       ; middle 
                    dw       kamikaze1_2 , 1 *256+1       ; right 
                    dw       kamikaze1_3 , 0 *256+1       ; left 
                    dw       kamikaze3_3 , 0 *256+1       ; middle 
                    dw       kamikaze1_3 , 1 *256+1       ; right 
                    dw       kamikaze1_4 , 0 *256+1       ; left 
                    dw       kamikaze3_4 , 0 *256+1       ; middle 
                    dw       kamikaze1_4 , 1 *256+1       ; right 
                    dw       kamikaze1_5 , 0 *256+1       ; left 
                    dw       kamikaze3_5 , 0 *256+1       ; middle 
                    dw       kamikaze1_5 , 1 *256+1       ; right 
                    dw       0 
Level53Intro: 
                    dw       blockStraightLeft , 0 *256+1 ; not inverse 
                    dw       blockStraightRight , 0 *256+1 ; not inverse 
                    dw       entryPatternLeftStraightDownZigLeftOut , 0 *256+1 ; not inverse 
                    dw       entryPatternLeftStraightDownZigLeftOut , 1 *256+1 ; inverse 
                    dw       entryPatternEnterMiddleSquareWaveExitRight , 0 *256+1 ; not inverse 
                    dw       0 
Level54Intro: 
                    dw       blockFive1 , 0 *256+1        ; not inverse 
                    dw       blockFive2 , 0 *256+1        ; not inverse 
                    dw       blockFive3 , 0 *256+1        ; not inverse 
                    dw       blockFive4 , 0 *256+1        ; not inverse 
                    dw       blockFive5 , 0 *256+1        ; not inverse 
                    dw       entryPatternTenToCenterToTwo , 0 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 1 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 0 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 1 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 0 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 1 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 0 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 1 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 0 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 1 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 0 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 1 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 0 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 1 *256+1 ; inverse 
                    dw       entryPatternTenToCenterToTwo , 0 *256+1 ; inverse 
                    dw       0 
Level55Intro        =        fourtyEntry 
Level56Intro_Bonus 
                    dw       bonus56Pattern, 0 *256+20    ; not inverse 
                    dw       bonus56Pattern, 1 *256+20    ; inverse 
                    dw       0 
Level57Intro        =        Level51Intro 
Level58Intro 
                    dw       blockLoopPattern, 0 *256+3   ; not inverse 
                    dw       entryPatternBonusTriangleTopMiddleLeftRight, 0 *256+10 ; not inverse 
                    dw       entryPatternBonusTriangleTopMiddleLeftRight, 1 *256+10 ; inverse 
                    dw       0 
Level59Intro        =        Level37Intro 
Level60Intro_Kamikaze 
                    dw       kamikaze_60 , 0 *256+15      ; 
                    dw       kamikaze_60 , 1 *256+15      ; 
                    dw       kamikaze_60 , 0 *256+15      ; 
                    dw       kamikaze_60 , 1 *256+15      ; 
                    dw       0 
Level61Intro 
                    dw       entryPatternVShapeRightToLeft_slow , 0 *256+10 ; not inverse 
                    dw       entryPatternVShapeRightToLeft_slow , 1 *256+10 ; inverse 
                    dw       entryPatternLeftStraightDownZigLeftOut , 0 *256+10 ; not inverse 
                    dw       entryPatternLeftStraightDownZigLeftOut , 1 *256+10 ; inverse 
                    dw       entryPatternBottomZigZag , 0 *256+10 ; not inverse 
                    dw       entryPatternBottomZigZag , 1 *256+10 ; inverse 
                    dw       0 
Level62Intro 
                    dw       entryPatternBottomZigZag , 0 *256+10 ; not inverse 
                    dw       entryPatternBottomZigZag , 1 *256+10 ; inverse 
                    dw       entryPatternBottomZigZag , 0 *256+10 ; not inverse 
                    dw       entryPatternBottomZigZag , 1 *256+10 ; inverse 
                    dw       0 
Level63Intro 
                    dw       entryPatternVShapeRightToLeft_fast , 0 *256+10 ; not inverse 
                    dw       entryPatternVShapeRightToLeft_fast , 1 *256+10 ; inverse 
                    dw       0 
Level64Intro_Bonus 
                    dw       bonus64Pattern_a, 0 *256+20  ; not inverse 
                    dw       bonus64Pattern_b, 0 *256+20  ; not inverse 
                    dw       bonus64Pattern_a, 1 *256+20  ; not inverse 
                    dw       bonus64Pattern_b, 1 *256+20  ; not inverse 
                    dw       0 
Level65Intro        =        Level51Intro 
Level66Intro        =        Level27Intro 
Level67Intro        =        fourtyEntry 
Level68Intro_Kamikaze 
                    dw       kamikaze_68 , 0 *256+15      ; 
                    dw       kamikaze_68 , 1 *256+15      ; 
                    dw       kamikaze_68 , 0 *256+15      ; 
                    dw       kamikaze_68 , 1 *256+15      ; 
                    dw       0 
Level69Intro        =        emptyPattern                 ; don't care is appear 
Level70Intro        =        Level50Intro 
Level71Intro        =        Level35Intro 
Level72Intro_Bonus 
                    dw       bonus72Pattern, 0 *256+20    ; not inverse 
                    dw       bonus72Pattern, 1 *256+20    ; not inverse 
                    dw       bonus72Pattern, 0 *256+20    ; not inverse 
                    dw       bonus72Pattern, 1 *256+20    ; not inverse 
                    dw       0 
Level73Intro        =        Level37Intro 
Level74Intro        =        Level41Intro 
Level75Intro 
                    dw       pattern75, 0 *256+5          ; not inverse 
                    dw       pattern75, 1 *256+5          ; not inverse 
                    dw       pattern75, 0 *256+5          ; not inverse 
                    dw       pattern75, 1 *256+5          ; not inverse 
                    dw       0 
Level76Intro_Kamikaze 
                    dw       kamikaze_76 , 0 *256+15      ; 
                    dw       kamikaze_76 , 1 *256+15      ; 
                    dw       kamikaze_76 , 0 *256+15      ; 
                    dw       kamikaze_76 , 1 *256+15      ; 
                    dw       0 
Level77Intro 
;                    dw       bigBlock1a , 0 *256+1        ; not inverse 
                    dw       bigBlock1b , 0 *256+1        ; not inverse 
                    dw       bigBlock1 , 0 *256+1         ; not inverse 
                    dw       bigBlock2 , 0 *256+1         ; not inverse 
                    dw       bigBlock3 , 0 *256+1         ; not inverse 
                    dw       bigBlock4 , 0 *256+1         ; not inverse 
                    dw       bigBlock5 , 0 *256+1         ; not inverse 
                    dw       bigBlock6 , 0 *256+1         ; not inverse 
                    dw       bigBlock7 , 0 *256+1         ; not inverse 
                    dw       bigBlock8 , 0 *256+1         ; not inverse 
                    dw       bigBlock9 , 0 *256+1         ; not inverse 
                    dw       bigBlock10 , 0 *256+1        ; not inverse 
                    dw       bigBlock11 , 0 *256+1        ; not inverse 
;                    dw       bigBlock12 , 0 *256+1        ; not inverse 
                    dw       entryPatternTopSmallZigZag_higher_fast, 0 *256+10 ; not inverse 
                    dw       entryPatternTopSmallZigZag_higher_fast, 1 *256+10 ; not inverse 
                    dw       0 
Level78Intro        =        Level77Intro 
Level79Intro        =        Level75Intro 
Level80Intro_Bonus 
                    dw       bonus80Pattern, 0 *256+20    ; not inverse 
                    dw       bonus80Pattern, 1 *256+20    ; not inverse 
                    dw       bonus80Pattern, 0 *256+20    ; not inverse 
                    dw       bonus80Pattern, 1 *256+20    ; not inverse 
                    dw       0 
Level81Intro_Tribble 
; dummy
                    dw       bonus72Pattern, 0 *256+1     ; not inverse 
                    dw       0 
Level82Intro 
                    dw       bigBlock11 , 0 *256+1        ; not inverse 
                    dw       bigBlock10 , 0 *256+1        ; not inverse 
                    dw       bigBlock9 , 0 *256+1         ; not inverse 
                    dw       bigBlock8 , 0 *256+1         ; not inverse 
                    dw       bigBlock7 , 0 *256+1         ; not inverse 
                    dw       bigBlock6 , 0 *256+1         ; not inverse 
                    dw       bigBlock5 , 0 *256+1         ; not inverse 
                    dw       bigBlock4 , 0 *256+1         ; not inverse 
                    dw       bigBlock3 , 0 *256+1         ; not inverse 
                    dw       bigBlock2 , 0 *256+1         ; not inverse 
                    dw       bigBlock1 , 0 *256+1         ; not inverse 
                    dw       bigBlock1b , 0 *256+1        ; not inverse 
                    dw       entryPatternTopSmallZigZag_higher_fast, 0 *256+4 ; not inverse 
                    dw       entryPatternTopSmallZigZag_higher_fast, 1 *256+4 ; not inverse 
                    dw       0 
Level83Intro        =        emptyPattern                 ; don't care is appear 
Level84Intro_Kamikaze 
                    dw       kamikaze_84 , 0 *256+15      ; 
                    dw       kamikaze_84 , 1 *256+15      ; 
                    dw       kamikaze_84 , 0 *256+15      ; 
                    dw       kamikaze_84 , 1 *256+15      ; 
                    dw       0 
Level85Intro        =        emptyPattern                 ; don't care is appear 
Level86Intro        =        emptyPattern                 ; don't care is appear 
Level87Intro        =        emptyPattern                 ; don't care is appear 
Level88Intro_Bonus 
                    dw       bonus88Pattern1, 0 *256+20   ; not inverse 
                    dw       bonus88Pattern2, 0 *256+20   ; not inverse 
                    dw       bonus88Pattern1, 1 *256+20   ; not inverse 
                    dw       bonus88Pattern2, 1 *256+20   ; not inverse 
                    dw       0 
Level89Intro        =        Level51Intro 
Level90Intro        =        Level51Intro 
Level91Intro        =        Level38Intro 
Level92Intro_Kamikaze 
                    dw       kamikaze_92 , 0 *256+15      ; 
                    dw       kamikaze_92 , 1 *256+15      ; 
                    dw       kamikaze_92 , 0 *256+15      ; 
                    dw       kamikaze_92 , 1 *256+15      ; 
                    dw       0 
Level93Intro 
                    dw       kamikaze_92 , 0 *256+5       ; 
                    dw       kamikaze_92 , 1 *256+5       ; 
                    dw       kamikaze_92 , 0 *256+5       ; 
                    dw       kamikaze_92 , 1 *256+5       ; 
                    dw       kamikaze_92 , 0 *256+5       ; 
                    dw       kamikaze_92 , 1 *256+5       ; 
                    dw       kamikaze_92 , 0 *256+5       ; 
                    dw       kamikaze_92 , 1 *256+5       ; 
                    dw       0 
Level94Intro        =        twentyEntry 
Level95Intro        =        emptyPattern                 ; don't care is appear 
Level96Intro_Bonus 
                    dw       bonus92Pattern1, 0 *256+20   ; not inverse 
                    dw       bonus92Pattern1, 1 *256+20   ; not inverse 
                    dw       bonus92Pattern2, 0 *256+20   ; not inverse 
                    dw       bonus92Pattern2, 1 *256+20   ; not inverse 
                    dw       0 
Level97Intro        =        twentyEntry 
Level98Intro        =        fourtyEntry 
