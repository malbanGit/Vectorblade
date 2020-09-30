; bank 2
; all letters start at the bottom left 
; height of font is 8
; width is 4 
; if commented out lines are used, the draw "returns" to its starting point
;
; the definition is conform to the clipping used - meaning
; each letter is divideable by a power of two
; in this case even all letters are dividable by "8" (see BLOWUPABCABC)
BLOWUPABC           EQU      $08 
; list of all single vectorlists in this
Alphabet: 
                    DW       Alphabet27                   ; SPACE 
                    DW       Alphabet28                   ; ! 
                    DW       Alphabet27                   ; SPACE 
                    DW       Alphabet27                   ; SPACE 
                    DW       Alphabet27                   ; SPACE 
                    DW       Alphabet27                   ; SPACE 
                    DW       Alphabet27                   ; SPACE 
                    DW       Alphabet27                   ; SPACE 
                    DW       Alphabet27                   ; SPACE 
                    DW       Alphabet27                   ; SPACE 
                    DW       Alphabet27                   ; SPACE 
                    DW       Alphabet27                   ; SPACE 
                    DW       Alphabet27                   ; SPACE 
                    DW       Alphabet27                   ; SPACE 
                    DW       Alphabet26                   ; . 
                    DW       Alphabet27                   ; SPACE 
NumberList 
                    DW       Alphabet38                   ; 0 
                    DW       Alphabet29                   ; 1 
                    DW       Alphabet30                   ; 2 
                    DW       Alphabet31                   ; 3 
                    DW       Alphabet32                   ; 4 
                    DW       Alphabet33                   ; 5 
                    DW       Alphabet34                   ; 6 
                    DW       Alphabet35                   ; 7 
                    DW       Alphabet36                   ; 8 
                    DW       Alphabet37                   ; 9 
                    DW       Alphabet27                   ; SPACE 
                    DW       Alphabet27                   ; SPACE 
                    DW       Alphabet27                   ; SPACE 
                    DW       Alphabet27                   ; SPACE 
                    DW       Alphabet27                   ; SPACE 
                    DW       Alphabet27                   ; SPACE 
                    DW       Alphabet27                   ; SPACE 
abc 
                    DW       Alphabet0                    ; A 
                    DW       Alphabet1                    ; B 
                    DW       Alphabet2                    ; C 
                    DW       Alphabet3                    ; D 
                    DW       Alphabet4                    ; E 
                    DW       Alphabet5                    ; F 
                    DW       Alphabet6                    ; G 
                    DW       Alphabet7                    ; H 
                    DW       Alphabet8                    ; I 
                    DW       Alphabet9                    ; J 
                    DW       Alphabet10                   ; K 
                    DW       Alphabet11                   ; L 
                    DW       Alphabet12                   ; M 
                    DW       Alphabet13                   ; N 
                    DW       Alphabet14                   ; O 
                    DW       Alphabet15                   ; P 
                    DW       Alphabet16                   ; Q 
                    DW       Alphabet17                   ; R 
                    DW       Alphabet18                   ; S 
                    DW       Alphabet19                   ; T 
                    DW       Alphabet20                   ; U 
                    DW       Alphabet21                   ; V 
                    DW       Alphabet22                   ; W 
                    DW       Alphabet23                   ; X 
                    DW       Alphabet24                   ; Y 
                    DW       Alphabet25                   ; Z 
                    DW       Alphabet26                   ; . 
                    DW       Alphabet27                   ; SPACE 
                    DW       Alphabet28                   ; ! 
                    DW       0 
Alphabet0: 
                    DB       $FF, +$04*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$04*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, +$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$04*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, -$04*BLOWUPABC ; pattern, y, x 
                    DB       $00, +$00*BLOWUPABC, +$04*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$04*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $00, +$00*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Alphabet1: 
                    DB       $FF, +$08*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, +$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$02*BLOWUPABC, +$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$02*BLOWUPABC, -$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$02*BLOWUPABC, +$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$02*BLOWUPABC, -$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, -$02*BLOWUPABC ; pattern, y, x 
                    DB       $00, +$00*BLOWUPABC, +$05*BLOWUPABC ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Alphabet2: 
                    DB       $00, +$06*BLOWUPABC, +$04*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$02*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, -$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$02*BLOWUPABC, -$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$04*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$02*BLOWUPABC, +$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, +$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$02*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $00, -$02*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Alphabet3: 
                    DB       $FF, +$08*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, +$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$02*BLOWUPABC, +$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$04*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$02*BLOWUPABC, -$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, -$02*BLOWUPABC ; pattern, y, x 
                    DB       $00, +$00*BLOWUPABC, +$05*BLOWUPABC ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Alphabet4: 
                    DB       $00, +$08*BLOWUPABC, +$04*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, -$04*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$04*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $00, +$00*BLOWUPABC, +$03*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, -$03*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$04*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, +$04*BLOWUPABC ; pattern, y, x 
                    DB       $00, +$00*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Alphabet5: 
                    DB       $FF, +$04*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, +$03*BLOWUPABC ; pattern, y, x 
                    DB       $00, +$00*BLOWUPABC, -$03*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$04*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, +$04*BLOWUPABC ; pattern, y, x 
                    DB       $00, -$08*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Alphabet6: 
                    DB       $00, +$06*BLOWUPABC, +$04*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$02*BLOWUPABC, -$01*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, -$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$02*BLOWUPABC, -$01*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$04*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$02*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, +$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$02*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$02*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, -$02*BLOWUPABC ; pattern, y, x 
                    DB       $00, -$04*BLOWUPABC, +$03*BLOWUPABC ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Alphabet7: 
                    DB       $FF, +$08*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $00, -$04*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, +$04*BLOWUPABC ; pattern, y, x 
                    DB       $00, +$04*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$08*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $00, +$00*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Alphabet8: 
                    DB       $FF, +$00*BLOWUPABC, +$04*BLOWUPABC ; pattern, y, x 
                    DB       $00, +$00*BLOWUPABC, -$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$08*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $00, +$00*BLOWUPABC, -$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, +$04*BLOWUPABC ; pattern, y, x 
                    DB       $00, -$08*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Alphabet9: 
                    DB       $00, +$02*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$02*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, +$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$02*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$06*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, -$04*BLOWUPABC ; pattern, y, x 
                    DB       $00, -$08*BLOWUPABC, +$05*BLOWUPABC ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Alphabet10: 
                    DB       $FF, +$08*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $00, -$04*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$04*BLOWUPABC, +$04*BLOWUPABC ; pattern, y, x 
                    DB       $00, -$04*BLOWUPABC, -$04*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$04*BLOWUPABC, +$04*BLOWUPABC ; pattern, y, x 
                    DB       $00, +$00*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Alphabet11: 
                    DB       $00, +$08*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$08*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, +$04*BLOWUPABC ; pattern, y, x 
                    DB       $00, +$00*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Alphabet12: 
                    DB       $FF, +$08*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$04*BLOWUPABC, +$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$04*BLOWUPABC, +$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$08*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $00, +$00*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Alphabet13: 
                    DB       $FF, +$08*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$08*BLOWUPABC, +$04*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$08*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $00, -$08*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Alphabet14: 
                    DB       $00, +$00*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$02*BLOWUPABC, -$01*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$04*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$02*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, +$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$02*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$04*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$02*BLOWUPABC, -$01*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, -$02*BLOWUPABC ; pattern, y, x 
                    DB       $00, +$00*BLOWUPABC, +$04*BLOWUPABC ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Alphabet15: 
                    DB       $FF, +$08*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, +$03*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$01*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$02*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$01*BLOWUPABC, -$01*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, -$03*BLOWUPABC ; pattern, y, x 
                    DB       $00, -$04*BLOWUPABC, +$05*BLOWUPABC ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Alphabet16: 
                    DB       $00, +$00*BLOWUPABC, +$03*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, -$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$02*BLOWUPABC, -$01*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$04*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$02*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, +$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$02*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$04*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$02*BLOWUPABC, -$01*BLOWUPABC ; pattern, y, x 
                    DB       $00, +$02*BLOWUPABC, -$01*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$02*BLOWUPABC, +$02*BLOWUPABC ; pattern, y, x 
                    DB       $00, +$00*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Alphabet17: 
                    DB       $FF, +$08*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, +$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$02*BLOWUPABC, +$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$02*BLOWUPABC, -$02*BLOWUPABC ; pattern, y, x 
                    DB       $00, +$00*BLOWUPABC, -$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, +$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$04*BLOWUPABC, +$02*BLOWUPABC ; pattern, y, x 
                    DB       $00, +$00*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Alphabet18: 
                    DB       $00, +$06*BLOWUPABC, +$04*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$02*BLOWUPABC, -$01*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, -$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$02*BLOWUPABC, -$01*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$02*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, +$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$02*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$02*BLOWUPABC, -$01*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, -$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$02*BLOWUPABC, -$01*BLOWUPABC ; pattern, y, x 
                    DB       $00, -$02*BLOWUPABC, +$05*BLOWUPABC ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Alphabet19: 
                    DB       $00, +$00*BLOWUPABC, +$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$08*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $00, +$00*BLOWUPABC, -$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, +$04*BLOWUPABC ; pattern, y, x 
                    DB       $00, -$08*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Alphabet20: 
                    DB       $00, +$08*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$07*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$01*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, +$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$01*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$07*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $00, -$08*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Alphabet21: 
                    DB       $00, +$08*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$08*BLOWUPABC, +$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$08*BLOWUPABC, +$02*BLOWUPABC ; pattern, y, x 
                    DB       $00, -$08*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Alphabet22: 
                    DB       $00, +$08*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$08*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$04*BLOWUPABC, +$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$04*BLOWUPABC, +$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$08*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $00, -$08*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Alphabet23: 
                    DB       $FF, +$08*BLOWUPABC, +$04*BLOWUPABC ; pattern, y, x 
                    DB       $00, +$00*BLOWUPABC, -$04*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$08*BLOWUPABC, +$04*BLOWUPABC ; pattern, y, x 
                    DB       $00, +$00*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Alphabet24: 
                    DB       $00, +$08*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$04*BLOWUPABC, +$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$04*BLOWUPABC, +$02*BLOWUPABC ; pattern, y, x 
                    DB       $00, -$04*BLOWUPABC, -$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$04*BLOWUPABC, -$01*BLOWUPABC ; pattern, y, x 
                    DB       $00, +$00*BLOWUPABC, +$04*BLOWUPABC ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Alphabet25: 
                    DB       $00, +$08*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, +$04*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$08*BLOWUPABC, -$04*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, +$04*BLOWUPABC ; pattern, y, x 
                    DB       $00, +$00*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Alphabet26: 
                    DB       $FF, +$00*BLOWUPABC, +$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$02*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, -$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$02*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $00, +$00*BLOWUPABC, +$05*BLOWUPABC ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Alphabet27: 
                    DB       $00, +$00*BLOWUPABC, +$05*BLOWUPABC ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Alphabet28: 
                    DB       $FF, +$00*BLOWUPABC, +$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$02*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$02*BLOWUPABC, -$02*BLOWUPABC ; pattern, y, x 
                    DB       $00, +$02*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$06*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, +$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$06*BLOWUPABC, -$03*BLOWUPABC ; pattern, y, x 
                    DB       $00, -$02*BLOWUPABC, +$05*BLOWUPABC ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Alphabet29: 
                    DB       $00, +$06*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$02*BLOWUPABC, +$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$08*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $00, +$00*BLOWUPABC, +$02*BLOWUPABC ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Alphabet30: 
                    DB       $00, +$06*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$02*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, +$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$02*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$06*BLOWUPABC, -$04*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, +$04*BLOWUPABC ; pattern, y, x 
                    DB       $00, +$00*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Alphabet31: 
                    DB       $00, +$07*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$01*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, +$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$01*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$03*BLOWUPABC, -$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$03*BLOWUPABC, +$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$01*BLOWUPABC, -$01*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, -$02*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$01*BLOWUPABC, -$01*BLOWUPABC ; pattern, y, x 
                    DB       $00, -$01*BLOWUPABC, +$05*BLOWUPABC ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Alphabet32: 
                    DB       $00, +$00*BLOWUPABC, +$03*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$03*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $00, +$05*BLOWUPABC, -$03*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$07*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, +$04*BLOWUPABC ; pattern, y, x 
                    DB       $00, -$01*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Alphabet33: 
                    DB       $FF, +$00*BLOWUPABC, +$04*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$04*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, -$04*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$04*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, +$04*BLOWUPABC ; pattern, y, x 
                    DB       $00, -$08*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Alphabet34: 
                    DB       $FF, +$08*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, +$04*BLOWUPABC ; pattern, y, x 
                    DB       $00, -$04*BLOWUPABC, -$04*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, +$04*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$04*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, -$04*BLOWUPABC ; pattern, y, x 
                    DB       $00, +$00*BLOWUPABC, +$05*BLOWUPABC ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Alphabet35: 
                    DB       $FF, +$08*BLOWUPABC, +$04*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, -$04*BLOWUPABC ; pattern, y, x 
                    DB       $00, -$08*BLOWUPABC, +$05*BLOWUPABC ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Alphabet36: 
                    DB       $FF, +$08*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, +$04*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$08*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, -$04*BLOWUPABC ; pattern, y, x 
                    DB       $00, +$04*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, +$04*BLOWUPABC ; pattern, y, x 
                    DB       $00, -$04*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Alphabet37: 
                    DB       $00, +$04*BLOWUPABC, +$04*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, -$04*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$04*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, +$04*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$08*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $00, +$00*BLOWUPABC, +$01*BLOWUPABC ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
Alphabet38: 
                    DB       $FF, +$08*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, +$04*BLOWUPABC ; pattern, y, x 
                    DB       $FF, -$08*BLOWUPABC, +$00*BLOWUPABC ; pattern, y, x 
                    DB       $FF, +$00*BLOWUPABC, -$04*BLOWUPABC ; pattern, y, x 
                    DB       $00, +$00*BLOWUPABC, +$05*BLOWUPABC ; pattern, y, x 
                    DB       $01                          ; endmarker (high bit in pattern not set) 
