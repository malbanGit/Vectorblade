; This file was build using VIDE - Vectrex Integrated Development Environment
; Original bin file was: /Users/chrissalo/NetBeansProjects/Vide/_projects/Vectorblade/Music/galaga.bin
; 
; offset for AKS file assumed: $0000 guessed by accessing byte data[13] * 256)
; not used by vectrex player and therefor omitted:
;  DB "AT10" ; Signature of Arkos Tracker files
;  DB $01 ; sample channel
;  DB $40, 42, 0f ; YM custom frequence - little endian
;  DB $02 ; Replay frequency (0=13hz,1=25hz,2=50hz,3=100hz,4=150hz,5=300hz)
SongAddressIntroMusik: 
                    db       $06                          ; $0009: default speed 
                    dw       $0030                        ; $000A: size of instrument table (without this word pointer) 
                    dw       instrument0IntroMusik        ; $000C: [$0010] pointer to instrument 0 
                    dw       instrument1IntroMusik        ; $000E: [$0019] pointer to instrument 1 
instrument0IntroMusik: 
                    db       $00                          ; $0010: speed 
                    db       $00                          ; $0011: retrig 
instrument0loopIntroMusik: 
                    db       $00                          ; $0012: dataColumn_0 (non hard), vol=$0 
                    db       $00                          ; $0013: dataColumn_0 (non hard), vol=$0 
                    db       $00                          ; $0014: dataColumn_0 (non hard), vol=$0 
                    db       $00                          ; $0015: dataColumn_0 (non hard), vol=$0 
                    db       $0D                          ; $0016: dataColumn_0 (hard) 
                    dw       instrument0loopIntroMusik    ; $0017: [$0012] loop 
instrument1IntroMusik: 
                    db       $02                          ; $0019: speed 
                    db       $00                          ; $001A: retrig 
                    db       $34                          ; $001B: dataColumn_0 (non hard), vol=$D 
                    db       $38                          ; $001C: dataColumn_0 (non hard), vol=$E 
                    db       $B4                          ; $001D: dataColumn_0 (non hard), vol=$D 
                    dw       $FFFF                        ; $001E: pitch 
                    db       $30                          ; $0020: dataColumn_0 (non hard), vol=$C 
                    db       $B0                          ; $0021: dataColumn_0 (non hard), vol=$C 
                    dw       $0001                        ; $0022: pitch 
                    db       $2C                          ; $0024: dataColumn_0 (non hard), vol=$B 
                    db       $28                          ; $0025: dataColumn_0 (non hard), vol=$A 
                    db       $AC                          ; $0026: dataColumn_0 (non hard), vol=$B 
                    dw       $FFFF                        ; $0027: pitch 
                    db       $28                          ; $0029: dataColumn_0 (non hard), vol=$A 
                    db       $A4                          ; $002A: dataColumn_0 (non hard), vol=$9 
                    dw       $0001                        ; $002B: pitch 
                    db       $20                          ; $002D: dataColumn_0 (non hard), vol=$8 
                    db       $9C                          ; $002E: dataColumn_0 (non hard), vol=$7 
                    dw       $FFFF                        ; $002F: pitch 
                    db       $18                          ; $0031: dataColumn_0 (non hard), vol=$6 
                    db       $94                          ; $0032: dataColumn_0 (non hard), vol=$5 
                    dw       $FFFF                        ; $0033: pitch 
                    db       $10                          ; $0035: dataColumn_0 (non hard), vol=$4 
                    db       $0C                          ; $0036: dataColumn_0 (non hard), vol=$3 
                    db       $08                          ; $0037: dataColumn_0 (non hard), vol=$2 
                    db       $04                          ; $0038: dataColumn_0 (non hard), vol=$1 
                    db       $0D                          ; $0039: dataColumn_0 (hard) 
                    dw       instrument0loopIntroMusik    ; $003A: [$0012] loop 
; start of linker definition
linkerIntroMusik: 
                    db       $70                          ; $003C: first height 
                    db       $00                          ; $003D: transposition1 
                    db       $00                          ; $003E: transposition2 
                    db       $00                          ; $003F: transposition3 
                    dw       specialtrackDef0IntroMusik   ; $0040: [$004C] specialTrack 
pattern0DefinitionIntroMusik: 
                    db       $00                          ; $0042: pattern 0 state 
                    dw       trackDef0IntroMusik          ; $0043: [$004E] pattern 0, track 1 
                    dw       trackDef1IntroMusik          ; $0045: [$009A] pattern 0, track 2 
                    dw       trackDef2IntroMusik          ; $0047: [$00E2] pattern 0, track 3 
pattern1DefinitionIntroMusik: 
                    db       $01                          ; $0049: pattern 1 state 
                    dw       pattern0DefinitionIntroMusik ; $004A: [$0042] song restart address 
specialtrackDef0IntroMusik: 
                    db       $11                          ; $004C: data, speed 4 
                    db       $00                          ; $004D: wait 128 
trackDef0IntroMusik: 
                    db       $42                          ; $004E: normal track data 
                    db       $80                          ; $004F: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $0050: pitch 
                    db       $02                          ; $0052: normal track data, wait 0 
                    db       $9C                          ; $0053: normal track data, note: A3 
                    db       $65                          ; $0054: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $01                          ; $0055: instrument 
                    db       $06                          ; $0056: normal track data, wait 2 
                    db       $67                          ; $0057: full optimization, no escape: D4 
                    db       $02                          ; $0058: normal track data, wait 0 
                    db       $6B                          ; $0059: full optimization, no escape: E4 
                    db       $06                          ; $005A: normal track data, wait 2 
                    db       $71                          ; $005B: full optimization, no escape: G4 
                    db       $02                          ; $005C: normal track data, wait 0 
                    db       $6F                          ; $005D: full optimization, no escape: F#4 
                    db       $06                          ; $005E: normal track data, wait 2 
                    db       $67                          ; $005F: full optimization, no escape: D4 
                    db       $02                          ; $0060: normal track data, wait 0 
                    db       $6B                          ; $0061: full optimization, no escape: E4 
                    db       $06                          ; $0062: normal track data, wait 2 
                    db       $79                          ; $0063: full optimization, no escape: B4 
                    db       $02                          ; $0064: normal track data, wait 0 
                    db       $75                          ; $0065: full optimization, no escape: A4 
                    db       $06                          ; $0066: normal track data, wait 2 
                    db       $67                          ; $0067: full optimization, no escape: D4 
                    db       $02                          ; $0068: normal track data, wait 0 
                    db       $6B                          ; $0069: full optimization, no escape: E4 
                    db       $06                          ; $006A: normal track data, wait 2 
                    db       $71                          ; $006B: full optimization, no escape: G4 
                    db       $02                          ; $006C: normal track data, wait 0 
                    db       $6F                          ; $006D: full optimization, no escape: F#4 
                    db       $06                          ; $006E: normal track data, wait 2 
                    db       $67                          ; $006F: full optimization, no escape: D4 
                    db       $02                          ; $0070: normal track data, wait 0 
                    db       $75                          ; $0071: full optimization, no escape: A4 
                    db       $06                          ; $0072: normal track data, wait 2 
                    db       $7D                          ; $0073: full optimization, no escape: C#5 
                    db       $02                          ; $0074: normal track data, wait 0 
                    db       $7F                          ; $0075: full optimization, no escape: D5 
                    db       $06                          ; $0076: normal track data, wait 2 
                    db       $7B                          ; $0077: full optimization, no escape: C5 
                    db       $02                          ; $0078: normal track data, wait 0 
                    db       $77                          ; $0079: full optimization, no escape: A#4 
                    db       $06                          ; $007A: normal track data, wait 2 
                    db       $75                          ; $007B: full optimization, no escape: A4 
                    db       $02                          ; $007C: normal track data, wait 0 
                    db       $71                          ; $007D: full optimization, no escape: G4 
                    db       $06                          ; $007E: normal track data, wait 2 
                    db       $6D                          ; $007F: full optimization, no escape: F4 
                    db       $02                          ; $0080: normal track data, wait 0 
                    db       $6B                          ; $0081: full optimization, no escape: E4 
                    db       $06                          ; $0082: normal track data, wait 2 
                    db       $63                          ; $0083: full optimization, no escape: C4 
                    db       $02                          ; $0084: normal track data, wait 0 
                    db       $7B                          ; $0085: full optimization, no escape: C5 
                    db       $06                          ; $0086: normal track data, wait 2 
                    db       $7F                          ; $0087: full optimization, no escape: D5 
                    db       $02                          ; $0088: normal track data, wait 0 
                    db       $7B                          ; $0089: full optimization, no escape: C5 
                    db       $06                          ; $008A: normal track data, wait 2 
                    db       $75                          ; $008B: full optimization, no escape: A4 
                    db       $02                          ; $008C: normal track data, wait 0 
                    db       $79                          ; $008D: full optimization, no escape: B4 
                    db       $02                          ; $008E: normal track data, wait 0 
                    db       $71                          ; $008F: full optimization, no escape: G4 
                    db       $02                          ; $0090: normal track data, wait 0 
                    db       $6B                          ; $0091: full optimization, no escape: E4 
                    db       $02                          ; $0092: normal track data, wait 0 
                    db       $75                          ; $0093: full optimization, no escape: A4 
                    db       $02                          ; $0094: normal track data, wait 0 
                    db       $6F                          ; $0095: full optimization, no escape: F#4 
                    db       $02                          ; $0096: normal track data, wait 0 
                    db       $AA                          ; $0097: normal track data 
                    db       $49                          ; $0098: vol = $B (inverted), no pitch, no note, no instrument 
                    db       $00                          ; $0099: track end signature found 
trackDef1IntroMusik: 
                    db       $9C                          ; $009A: normal track data 
                    db       $E1                          ; $009B: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $009C: pitch 
                    db       $01                          ; $009E: instrument 
                    db       $06                          ; $009F: normal track data, wait 2 
                    db       $67                          ; $00A0: full optimization, no escape: D4 
                    db       $02                          ; $00A1: normal track data, wait 0 
                    db       $6B                          ; $00A2: full optimization, no escape: E4 
                    db       $06                          ; $00A3: normal track data, wait 2 
                    db       $71                          ; $00A4: full optimization, no escape: G4 
                    db       $02                          ; $00A5: normal track data, wait 0 
                    db       $6F                          ; $00A6: full optimization, no escape: F#4 
                    db       $06                          ; $00A7: normal track data, wait 2 
                    db       $67                          ; $00A8: full optimization, no escape: D4 
                    db       $02                          ; $00A9: normal track data, wait 0 
                    db       $6B                          ; $00AA: full optimization, no escape: E4 
                    db       $06                          ; $00AB: normal track data, wait 2 
                    db       $79                          ; $00AC: full optimization, no escape: B4 
                    db       $02                          ; $00AD: normal track data, wait 0 
                    db       $75                          ; $00AE: full optimization, no escape: A4 
                    db       $06                          ; $00AF: normal track data, wait 2 
                    db       $67                          ; $00B0: full optimization, no escape: D4 
                    db       $02                          ; $00B1: normal track data, wait 0 
                    db       $6B                          ; $00B2: full optimization, no escape: E4 
                    db       $06                          ; $00B3: normal track data, wait 2 
                    db       $71                          ; $00B4: full optimization, no escape: G4 
                    db       $02                          ; $00B5: normal track data, wait 0 
                    db       $6F                          ; $00B6: full optimization, no escape: F#4 
                    db       $06                          ; $00B7: normal track data, wait 2 
                    db       $67                          ; $00B8: full optimization, no escape: D4 
                    db       $02                          ; $00B9: normal track data, wait 0 
                    db       $75                          ; $00BA: full optimization, no escape: A4 
                    db       $06                          ; $00BB: normal track data, wait 2 
                    db       $7D                          ; $00BC: full optimization, no escape: C#5 
                    db       $02                          ; $00BD: normal track data, wait 0 
                    db       $7F                          ; $00BE: full optimization, no escape: D5 
                    db       $06                          ; $00BF: normal track data, wait 2 
                    db       $7B                          ; $00C0: full optimization, no escape: C5 
                    db       $02                          ; $00C1: normal track data, wait 0 
                    db       $77                          ; $00C2: full optimization, no escape: A#4 
                    db       $06                          ; $00C3: normal track data, wait 2 
                    db       $75                          ; $00C4: full optimization, no escape: A4 
                    db       $02                          ; $00C5: normal track data, wait 0 
                    db       $71                          ; $00C6: full optimization, no escape: G4 
                    db       $06                          ; $00C7: normal track data, wait 2 
                    db       $6D                          ; $00C8: full optimization, no escape: F4 
                    db       $02                          ; $00C9: normal track data, wait 0 
                    db       $6B                          ; $00CA: full optimization, no escape: E4 
                    db       $06                          ; $00CB: normal track data, wait 2 
                    db       $63                          ; $00CC: full optimization, no escape: C4 
                    db       $02                          ; $00CD: normal track data, wait 0 
                    db       $7B                          ; $00CE: full optimization, no escape: C5 
                    db       $06                          ; $00CF: normal track data, wait 2 
                    db       $7F                          ; $00D0: full optimization, no escape: D5 
                    db       $02                          ; $00D1: normal track data, wait 0 
                    db       $7B                          ; $00D2: full optimization, no escape: C5 
                    db       $06                          ; $00D3: normal track data, wait 2 
                    db       $75                          ; $00D4: full optimization, no escape: A4 
                    db       $02                          ; $00D5: normal track data, wait 0 
                    db       $79                          ; $00D6: full optimization, no escape: B4 
                    db       $02                          ; $00D7: normal track data, wait 0 
                    db       $71                          ; $00D8: full optimization, no escape: G4 
                    db       $02                          ; $00D9: normal track data, wait 0 
                    db       $6B                          ; $00DA: full optimization, no escape: E4 
                    db       $02                          ; $00DB: normal track data, wait 0 
                    db       $75                          ; $00DC: full optimization, no escape: A4 
                    db       $02                          ; $00DD: normal track data, wait 0 
                    db       $6F                          ; $00DE: full optimization, no escape: F#4 
                    db       $02                          ; $00DF: normal track data, wait 0 
                    db       $6B                          ; $00E0: full optimization, no escape: E4 
                    db       $00                          ; $00E1: track end signature found 
trackDef2IntroMusik: 
                    db       $42                          ; $00E2: normal track data 
                    db       $80                          ; $00E3: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $00E4: pitch 
                    db       $06                          ; $00E6: normal track data, wait 2 
                    db       $9C                          ; $00E7: normal track data, note: A3 
                    db       $67                          ; $00E8: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $01                          ; $00E9: instrument 
                    db       $06                          ; $00EA: normal track data, wait 2 
                    db       $67                          ; $00EB: full optimization, no escape: D4 
                    db       $02                          ; $00EC: normal track data, wait 0 
                    db       $6B                          ; $00ED: full optimization, no escape: E4 
                    db       $06                          ; $00EE: normal track data, wait 2 
                    db       $71                          ; $00EF: full optimization, no escape: G4 
                    db       $02                          ; $00F0: normal track data, wait 0 
                    db       $6F                          ; $00F1: full optimization, no escape: F#4 
                    db       $06                          ; $00F2: normal track data, wait 2 
                    db       $67                          ; $00F3: full optimization, no escape: D4 
                    db       $02                          ; $00F4: normal track data, wait 0 
                    db       $6B                          ; $00F5: full optimization, no escape: E4 
                    db       $06                          ; $00F6: normal track data, wait 2 
                    db       $79                          ; $00F7: full optimization, no escape: B4 
                    db       $02                          ; $00F8: normal track data, wait 0 
                    db       $75                          ; $00F9: full optimization, no escape: A4 
                    db       $06                          ; $00FA: normal track data, wait 2 
                    db       $67                          ; $00FB: full optimization, no escape: D4 
                    db       $02                          ; $00FC: normal track data, wait 0 
                    db       $6B                          ; $00FD: full optimization, no escape: E4 
                    db       $06                          ; $00FE: normal track data, wait 2 
                    db       $71                          ; $00FF: full optimization, no escape: G4 
                    db       $02                          ; $0100: normal track data, wait 0 
                    db       $6F                          ; $0101: full optimization, no escape: F#4 
                    db       $06                          ; $0102: normal track data, wait 2 
                    db       $67                          ; $0103: full optimization, no escape: D4 
                    db       $02                          ; $0104: normal track data, wait 0 
                    db       $75                          ; $0105: full optimization, no escape: A4 
                    db       $06                          ; $0106: normal track data, wait 2 
                    db       $7D                          ; $0107: full optimization, no escape: C#5 
                    db       $02                          ; $0108: normal track data, wait 0 
                    db       $7F                          ; $0109: full optimization, no escape: D5 
                    db       $06                          ; $010A: normal track data, wait 2 
                    db       $7B                          ; $010B: full optimization, no escape: C5 
                    db       $02                          ; $010C: normal track data, wait 0 
                    db       $77                          ; $010D: full optimization, no escape: A#4 
                    db       $06                          ; $010E: normal track data, wait 2 
                    db       $75                          ; $010F: full optimization, no escape: A4 
                    db       $02                          ; $0110: normal track data, wait 0 
                    db       $71                          ; $0111: full optimization, no escape: G4 
                    db       $06                          ; $0112: normal track data, wait 2 
                    db       $6D                          ; $0113: full optimization, no escape: F4 
                    db       $02                          ; $0114: normal track data, wait 0 
                    db       $6B                          ; $0115: full optimization, no escape: E4 
                    db       $06                          ; $0116: normal track data, wait 2 
                    db       $63                          ; $0117: full optimization, no escape: C4 
                    db       $02                          ; $0118: normal track data, wait 0 
                    db       $7B                          ; $0119: full optimization, no escape: C5 
                    db       $06                          ; $011A: normal track data, wait 2 
                    db       $7F                          ; $011B: full optimization, no escape: D5 
                    db       $02                          ; $011C: normal track data, wait 0 
                    db       $7B                          ; $011D: full optimization, no escape: C5 
                    db       $06                          ; $011E: normal track data, wait 2 
                    db       $75                          ; $011F: full optimization, no escape: A4 
                    db       $02                          ; $0120: normal track data, wait 0 
                    db       $79                          ; $0121: full optimization, no escape: B4 
                    db       $02                          ; $0122: normal track data, wait 0 
                    db       $71                          ; $0123: full optimization, no escape: G4 
                    db       $02                          ; $0124: normal track data, wait 0 
                    db       $6B                          ; $0125: full optimization, no escape: E4 
                    db       $02                          ; $0126: normal track data, wait 0 
                    db       $75                          ; $0127: full optimization, no escape: A4 
                    db       $02                          ; $0128: normal track data, wait 0 
                    db       $6F                          ; $0129: full optimization, no escape: F#4 
                    db       $02                          ; $012A: normal track data, wait 0 
                    db       $AA                          ; $012B: normal track data 
                    db       $4B                          ; $012C: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $00                          ; $012D: track end signature found 
