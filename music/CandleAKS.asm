; This file was build using VIDE - Vectrex Integrated Development Environment
; Original bin file was: /Users/chrissalo/NetBeansProjects/Vide/projects/Vectorblade/music/Candle3.bin
; 
; offset for AKS file assumed: $0000 guessed by accessing byte data[13] * 256)
; not used by vectrex player and therefor omitted:
;  DB "AT10" ; Signature of Arkos Tracker files
;  DB $01 ; sample channel
;  DB $40, 42, 0f ; YM custom frequence - little endian
;  DB $02 ; Replay frequency (0=13hz,1=25hz,2=50hz,3=100hz,4=150hz,5=300hz)
SongAddressCandle: 
                    db       $06                          ; $0009: default speed 
                    dw       $0024                        ; $000A: size of instrument table (without this word pointer) 
                    dw       instrument0Candle            ; $000C: [$0010] pointer to instrument 0 
                    dw       instrument1Candle            ; $000E: [$0019] pointer to instrument 1 
instrument0Candle: 
                    db       $00                          ; $0010: speed 
                    db       $00                          ; $0011: retrig 
instrument0loopCandle: 
                    db       $00                          ; $0012: dataColumn_0 (non hard), vol=$0 
                    db       $00                          ; $0013: dataColumn_0 (non hard), vol=$0 
                    db       $00                          ; $0014: dataColumn_0 (non hard), vol=$0 
                    db       $00                          ; $0015: dataColumn_0 (non hard), vol=$0 
                    db       $0D                          ; $0016: dataColumn_0 (hard) 
                    dw       instrument0loopCandle        ; $0017: [$0012] loop 
instrument1Candle: 
                    db       $02                          ; $0019: speed 
                    db       $00                          ; $001A: retrig 
                    db       $38                          ; $001B: dataColumn_0 (non hard), vol=$E 
                    db       $38                          ; $001C: dataColumn_0 (non hard), vol=$E 
                    db       $34                          ; $001D: dataColumn_0 (non hard), vol=$D 
                    db       $B0                          ; $001E: dataColumn_0 (non hard), vol=$C 
                    dw       $FFFF                        ; $001F: pitch 
                    db       $30                          ; $0021: dataColumn_0 (non hard), vol=$C 
                    db       $30                          ; $0022: dataColumn_0 (non hard), vol=$C 
                    db       $30                          ; $0023: dataColumn_0 (non hard), vol=$C 
                    db       $B0                          ; $0024: dataColumn_0 (non hard), vol=$C 
                    dw       $FFFF                        ; $0025: pitch 
instrument1loopCandle: 
                    db       $2C                          ; $0027: dataColumn_0 (non hard), vol=$B 
                    db       $2C                          ; $0028: dataColumn_0 (non hard), vol=$B 
                    db       $2C                          ; $0029: dataColumn_0 (non hard), vol=$B 
                    db       $AC                          ; $002A: dataColumn_0 (non hard), vol=$B 
                    dw       $0001                        ; $002B: pitch 
                    db       $0D                          ; $002D: dataColumn_0 (hard) 
                    dw       instrument1loopCandle        ; $002E: [$0027] loop 
; start of linker definition
linkerCandle: 
                    db       $16                          ; $0030: first height 
                    db       $00                          ; $0031: transposition1 
                    db       $00                          ; $0032: transposition2 
                    db       $00                          ; $0033: transposition3 
                    dw       specialtrackDef0Candle       ; $0034: [$0040] specialTrack 
pattern0DefinitionCandle: 
                    db       $00                          ; $0036: pattern 0 state 
                    dw       trackDef0Candle              ; $0037: [$0042] pattern 0, track 1 
                    dw       trackDef1Candle              ; $0039: [$0068] pattern 0, track 2 
                    dw       trackDef2Candle              ; $003B: [$008E] pattern 0, track 3 
pattern1DefinitionCandle: 
                    db       $01                          ; $003D: pattern 1 state 
                    dw       pattern0DefinitionCandle     ; $003E: [$0036] song restart address 
specialtrackDef0Candle: 
                    db       $35                          ; $0040: data, speed 13 
                    db       $00                          ; $0041: wait 128 
trackDef0Candle: 
                    db       $98                          ; $0042: normal track data 
                    db       $E1                          ; $0043: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $0044: pitch 
                    db       $01                          ; $0046: instrument 
                    db       $42                          ; $0047: normal track data 
                    db       $03                          ; $0048: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $0049: normal track data, wait 1 
                    db       $42                          ; $004A: normal track data, note: C0 
                    db       $07                          ; $004B: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $98                          ; $004C: normal track data 
                    db       $41                          ; $004D: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $004E: normal track data 
                    db       $03                          ; $004F: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $0050: normal track data, wait 1 
                    db       $42                          ; $0051: normal track data, note: C0 
                    db       $07                          ; $0052: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $8E                          ; $0053: normal track data 
                    db       $41                          ; $0054: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0055: normal track data 
                    db       $03                          ; $0056: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $0057: normal track data, wait 1 
                    db       $42                          ; $0058: normal track data, note: C0 
                    db       $05                          ; $0059: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $005A: normal track data, note: C0 
                    db       $07                          ; $005B: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $005C: normal track data 
                    db       $09                          ; $005D: vol = $B (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $005E: normal track data 
                    db       $0B                          ; $005F: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0060: normal track data, note: C0 
                    db       $0F                          ; $0061: vol = $8 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0062: normal track data 
                    db       $13                          ; $0063: vol = $6 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0064: normal track data 
                    db       $19                          ; $0065: vol = $3 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0066: normal track data, note: C0 
                    db       $1F                          ; $0067: vol = $0 (inverted), no pitch, no note, no instrument 
trackDef1Candle: 
                    db       $A0                          ; $0068: normal track data 
                    db       $E1                          ; $0069: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $006A: pitch 
                    db       $01                          ; $006C: instrument 
                    db       $42                          ; $006D: normal track data 
                    db       $03                          ; $006E: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $006F: normal track data, wait 1 
                    db       $42                          ; $0070: normal track data, note: C0 
                    db       $07                          ; $0071: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $9E                          ; $0072: normal track data 
                    db       $41                          ; $0073: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0074: normal track data 
                    db       $03                          ; $0075: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $0076: normal track data, wait 1 
                    db       $42                          ; $0077: normal track data, note: C0 
                    db       $07                          ; $0078: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $96                          ; $0079: normal track data 
                    db       $41                          ; $007A: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $007B: normal track data 
                    db       $03                          ; $007C: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $007D: normal track data, wait 1 
                    db       $42                          ; $007E: normal track data, note: C0 
                    db       $05                          ; $007F: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0080: normal track data, note: C0 
                    db       $07                          ; $0081: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0082: normal track data 
                    db       $09                          ; $0083: vol = $B (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0084: normal track data 
                    db       $0B                          ; $0085: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0086: normal track data, note: C0 
                    db       $0F                          ; $0087: vol = $8 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0088: normal track data 
                    db       $13                          ; $0089: vol = $6 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $008A: normal track data 
                    db       $19                          ; $008B: vol = $3 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $008C: normal track data, note: C0 
                    db       $1F                          ; $008D: vol = $0 (inverted), no pitch, no note, no instrument 
trackDef2Candle: 
                    db       $A6                          ; $008E: normal track data 
                    db       $E1                          ; $008F: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $0090: pitch 
                    db       $01                          ; $0092: instrument 
                    db       $42                          ; $0093: normal track data 
                    db       $03                          ; $0094: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $0095: normal track data, wait 1 
                    db       $42                          ; $0096: normal track data, note: C0 
                    db       $07                          ; $0097: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $A6                          ; $0098: normal track data 
                    db       $41                          ; $0099: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $009A: normal track data 
                    db       $03                          ; $009B: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $009C: normal track data, wait 1 
                    db       $42                          ; $009D: normal track data, note: C0 
                    db       $07                          ; $009E: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $9C                          ; $009F: normal track data 
                    db       $41                          ; $00A0: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $00A1: normal track data 
                    db       $03                          ; $00A2: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $00A3: normal track data, wait 1 
                    db       $42                          ; $00A4: normal track data, note: C0 
                    db       $05                          ; $00A5: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $00A6: normal track data, note: C0 
                    db       $07                          ; $00A7: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $00A8: normal track data 
                    db       $09                          ; $00A9: vol = $B (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $00AA: normal track data 
                    db       $0B                          ; $00AB: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $00AC: normal track data, note: C0 
                    db       $0F                          ; $00AD: vol = $8 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $00AE: normal track data 
                    db       $13                          ; $00AF: vol = $6 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $00B0: normal track data 
                    db       $19                          ; $00B1: vol = $3 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $00B2: normal track data, note: C0 
                    db       $1F                          ; $00B3: vol = $0 (inverted), no pitch, no note, no instrument 
