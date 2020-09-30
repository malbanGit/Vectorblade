; This file was build using VIDE - Vectrex Integrated Development Environment
; Original bin file was: projects/Vectorblade/title.bin
; 
; offset for AKS file assumed: $0000 guessed by accessing byte data[13] * 256)
; not used by vectrex player and therefor omitted:
;  DB "AT10" ; Signature of Arkos Tracker files
;  DB $01 ; sample channel
;  DB $40, 42, 0f ; YM custom frequence - little endian
;  DB $02 ; Replay frequency (0=13hz,1=25hz,2=50hz,3=100hz,4=150hz,5=300hz)
SongAddressTitleMusic: 
                    db       $06                          ; $0009: default speed 
                    dw       $00C6                        ; $000A: size of instrument table (without this word pointer) 
                    dw       instrument0TitleMusic        ; $000C: [$001A] pointer to instrument 0 
                    dw       instrument1TitleMusic        ; $000E: [$0023] pointer to instrument 1 
                    dw       instrument2TitleMusic        ; $0010: [$004A] pointer to instrument 2 
                    dw       instrument3TitleMusic        ; $0012: [$006D] pointer to instrument 3 
                    dw       instrument4TitleMusic        ; $0014: [$007E] pointer to instrument 4 
                    dw       instrument5TitleMusic        ; $0016: [$00A4] pointer to instrument 5 
                    dw       instrument6TitleMusic        ; $0018: [$00BB] pointer to instrument 6 
instrument0TitleMusic: 
                    db       $00                          ; $001A: speed 
                    db       $00                          ; $001B: retrig 
instrument0loopTitleMusic: 
                    db       $00                          ; $001C: dataColumn_0 (non hard), vol=$0 
                    db       $00                          ; $001D: dataColumn_0 (non hard), vol=$0 
                    db       $00                          ; $001E: dataColumn_0 (non hard), vol=$0 
                    db       $00                          ; $001F: dataColumn_0 (non hard), vol=$0 
                    db       $0D                          ; $0020: dataColumn_0 (hard) 
                    dw       instrument0loopTitleMusic    ; $0021: [$001C] loop 
instrument1TitleMusic: 
                    db       $02                          ; $0023: speed 
                    db       $00                          ; $0024: retrig 
                    db       $BC                          ; $0025: dataColumn_0 (non hard), vol=$F 
                    dw       $FFFF                        ; $0026: pitch 
                    db       $3C                          ; $0028: dataColumn_0 (non hard), vol=$F 
                    db       $B8                          ; $0029: dataColumn_0 (non hard), vol=$E 
                    dw       $FFFF                        ; $002A: pitch 
                    db       $3C                          ; $002C: dataColumn_0 (non hard), vol=$F 
                    db       $B8                          ; $002D: dataColumn_0 (non hard), vol=$E 
                    dw       $0001                        ; $002E: pitch 
                    db       $38                          ; $0030: dataColumn_0 (non hard), vol=$E 
                    db       $3C                          ; $0031: dataColumn_0 (non hard), vol=$F 
                    db       $B8                          ; $0032: dataColumn_0 (non hard), vol=$E 
                    dw       $FFFF                        ; $0033: pitch 
instrument1loopTitleMusic: 
                    db       $38                          ; $0035: dataColumn_0 (non hard), vol=$E 
                    db       $B8                          ; $0036: dataColumn_0 (non hard), vol=$E 
                    dw       $0001                        ; $0037: pitch 
                    db       $38                          ; $0039: dataColumn_0 (non hard), vol=$E 
                    db       $B8                          ; $003A: dataColumn_0 (non hard), vol=$E 
                    dw       $FFFF                        ; $003B: pitch 
                    db       $38                          ; $003D: dataColumn_0 (non hard), vol=$E 
                    db       $B8                          ; $003E: dataColumn_0 (non hard), vol=$E 
                    dw       $0001                        ; $003F: pitch 
                    db       $38                          ; $0041: dataColumn_0 (non hard), vol=$E 
                    db       $38                          ; $0042: dataColumn_0 (non hard), vol=$E 
                    db       $B8                          ; $0043: dataColumn_0 (non hard), vol=$E 
                    dw       $FFFF                        ; $0044: pitch 
                    db       $38                          ; $0046: dataColumn_0 (non hard), vol=$E 
                    db       $0D                          ; $0047: dataColumn_0 (hard) 
                    dw       instrument1loopTitleMusic    ; $0048: [$0035] loop 
instrument2TitleMusic: 
                    db       $01                          ; $004A: speed 
                    db       $00                          ; $004B: retrig 
instrument2loopTitleMusic: 
                    db       $45                          ; $004C: dataColumn_0 (hard) 
                    db       $58                          ; $004D: software dependend 2. byte 
                    dw       $FFFF                        ; $004E: pitch 
                    db       $05                          ; $0050: dataColumn_0 (hard) 
                    db       $58                          ; $0051: software dependend 2. byte 
                    db       $45                          ; $0052: dataColumn_0 (hard) 
                    db       $58                          ; $0053: software dependend 2. byte 
                    dw       $FFFF                        ; $0054: pitch 
                    db       $45                          ; $0056: dataColumn_0 (hard) 
                    db       $58                          ; $0057: software dependend 2. byte 
                    dw       $0001                        ; $0058: pitch 
                    db       $05                          ; $005A: dataColumn_0 (hard) 
                    db       $58                          ; $005B: software dependend 2. byte 
                    db       $45                          ; $005C: dataColumn_0 (hard) 
                    db       $58                          ; $005D: software dependend 2. byte 
                    dw       $FFFF                        ; $005E: pitch 
                    db       $45                          ; $0060: dataColumn_0 (hard) 
                    db       $58                          ; $0061: software dependend 2. byte 
                    dw       $0001                        ; $0062: pitch 
                    db       $45                          ; $0064: dataColumn_0 (hard) 
                    db       $58                          ; $0065: software dependend 2. byte 
                    dw       $FFFF                        ; $0066: pitch 
                    db       $05                          ; $0068: dataColumn_0 (hard) 
                    db       $58                          ; $0069: software dependend 2. byte 
                    db       $0D                          ; $006A: dataColumn_0 (hard) 
                    dw       instrument2loopTitleMusic    ; $006B: [$004C] loop 
instrument3TitleMusic: 
                    db       $01                          ; $006D: speed 
                    db       $00                          ; $006E: retrig 
                    db       $3E                          ; $006F: dataColumn_0 (non hard), vol=$F 
                    db       $21                          ; $0070: dataColumn_1, noise=$01 
                    db       $3C                          ; $0071: dataColumn_0 (non hard), vol=$F 
                    db       $3C                          ; $0072: dataColumn_0 (non hard), vol=$F 
                    db       $3C                          ; $0073: dataColumn_0 (non hard), vol=$F 
                    db       $3C                          ; $0074: dataColumn_0 (non hard), vol=$F 
                    db       $3C                          ; $0075: dataColumn_0 (non hard), vol=$F 
                    db       $3C                          ; $0076: dataColumn_0 (non hard), vol=$F 
                    db       $34                          ; $0077: dataColumn_0 (non hard), vol=$D 
                    db       $30                          ; $0078: dataColumn_0 (non hard), vol=$C 
                    db       $24                          ; $0079: dataColumn_0 (non hard), vol=$9 
                    db       $20                          ; $007A: dataColumn_0 (non hard), vol=$8 
                    db       $0D                          ; $007B: dataColumn_0 (hard) 
                    dw       instrument0loopTitleMusic    ; $007C: [$001C] loop 
instrument4TitleMusic: 
                    db       $01                          ; $007E: speed 
                    db       $00                          ; $007F: retrig 
                    db       $7E                          ; $0080: dataColumn_0 (non hard), vol=$F 
                    db       $3F                          ; $0081: dataColumn_1, noise=$1F 
                    db       $18                          ; $0082: arpegio 
                    db       $7C                          ; $0083: dataColumn_0 (non hard), vol=$F 
                    db       $1C                          ; $0084: arpegio 
                    db       $00                          ; $0085: dataColumn_0 (non hard), vol=$0 
                    db       $7C                          ; $0086: dataColumn_0 (non hard), vol=$F 
                    db       $1A                          ; $0087: arpegio 
                    db       $00                          ; $0088: dataColumn_0 (non hard), vol=$0 
                    db       $78                          ; $0089: dataColumn_0 (non hard), vol=$E 
                    db       $1A                          ; $008A: arpegio 
                    db       $70                          ; $008B: dataColumn_0 (non hard), vol=$C 
                    db       $18                          ; $008C: arpegio 
                    db       $6C                          ; $008D: dataColumn_0 (non hard), vol=$B 
                    db       $18                          ; $008E: arpegio 
                    db       $68                          ; $008F: dataColumn_0 (non hard), vol=$A 
                    db       $1A                          ; $0090: arpegio 
                    db       $64                          ; $0091: dataColumn_0 (non hard), vol=$9 
                    db       $18                          ; $0092: arpegio 
                    db       $5C                          ; $0093: dataColumn_0 (non hard), vol=$7 
                    db       $1A                          ; $0094: arpegio 
                    db       $58                          ; $0095: dataColumn_0 (non hard), vol=$6 
                    db       $18                          ; $0096: arpegio 
                    db       $54                          ; $0097: dataColumn_0 (non hard), vol=$5 
                    db       $1A                          ; $0098: arpegio 
                    db       $50                          ; $0099: dataColumn_0 (non hard), vol=$4 
                    db       $18                          ; $009A: arpegio 
                    db       $4C                          ; $009B: dataColumn_0 (non hard), vol=$3 
                    db       $18                          ; $009C: arpegio 
                    db       $48                          ; $009D: dataColumn_0 (non hard), vol=$2 
                    db       $18                          ; $009E: arpegio 
                    db       $44                          ; $009F: dataColumn_0 (non hard), vol=$1 
                    db       $18                          ; $00A0: arpegio 
                    db       $0D                          ; $00A1: dataColumn_0 (hard) 
                    dw       instrument0loopTitleMusic    ; $00A2: [$001C] loop 
instrument5TitleMusic: 
                    db       $02                          ; $00A4: speed 
                    db       $00                          ; $00A5: retrig 
                    db       $2C                          ; $00A6: dataColumn_0 (non hard), vol=$B 
                    db       $68                          ; $00A7: dataColumn_0 (non hard), vol=$A 
                    db       $0C                          ; $00A8: arpegio 
                    db       $28                          ; $00A9: dataColumn_0 (non hard), vol=$A 
                    db       $6C                          ; $00AA: dataColumn_0 (non hard), vol=$B 
                    db       $F4                          ; $00AB: arpegio 
                    db       $28                          ; $00AC: dataColumn_0 (non hard), vol=$A 
                    db       $68                          ; $00AD: dataColumn_0 (non hard), vol=$A 
                    db       $0C                          ; $00AE: arpegio 
                    db       $28                          ; $00AF: dataColumn_0 (non hard), vol=$A 
                    db       $68                          ; $00B0: dataColumn_0 (non hard), vol=$A 
                    db       $F4                          ; $00B1: arpegio 
                    db       $24                          ; $00B2: dataColumn_0 (non hard), vol=$9 
                    db       $60                          ; $00B3: dataColumn_0 (non hard), vol=$8 
                    db       $0C                          ; $00B4: arpegio 
                    db       $1C                          ; $00B5: dataColumn_0 (non hard), vol=$7 
                    db       $14                          ; $00B6: dataColumn_0 (non hard), vol=$5 
                    db       $10                          ; $00B7: dataColumn_0 (non hard), vol=$4 
                    db       $0D                          ; $00B8: dataColumn_0 (hard) 
                    dw       instrument0loopTitleMusic    ; $00B9: [$001C] loop 
instrument6TitleMusic: 
                    db       $01                          ; $00BB: speed 
                    db       $00                          ; $00BC: retrig 
                    db       $2C                          ; $00BD: dataColumn_0 (non hard), vol=$B 
                    db       $68                          ; $00BE: dataColumn_0 (non hard), vol=$A 
                    db       $0C                          ; $00BF: arpegio 
                    db       $28                          ; $00C0: dataColumn_0 (non hard), vol=$A 
                    db       $6C                          ; $00C1: dataColumn_0 (non hard), vol=$B 
                    db       $F4                          ; $00C2: arpegio 
                    db       $28                          ; $00C3: dataColumn_0 (non hard), vol=$A 
                    db       $68                          ; $00C4: dataColumn_0 (non hard), vol=$A 
                    db       $0C                          ; $00C5: arpegio 
                    db       $28                          ; $00C6: dataColumn_0 (non hard), vol=$A 
                    db       $68                          ; $00C7: dataColumn_0 (non hard), vol=$A 
                    db       $F4                          ; $00C8: arpegio 
                    db       $24                          ; $00C9: dataColumn_0 (non hard), vol=$9 
                    db       $60                          ; $00CA: dataColumn_0 (non hard), vol=$8 
                    db       $0C                          ; $00CB: arpegio 
                    db       $1C                          ; $00CC: dataColumn_0 (non hard), vol=$7 
                    db       $14                          ; $00CD: dataColumn_0 (non hard), vol=$5 
                    db       $10                          ; $00CE: dataColumn_0 (non hard), vol=$4 
                    db       $0D                          ; $00CF: dataColumn_0 (hard) 
                    dw       instrument0loopTitleMusic    ; $00D0: [$001C] loop 
; start of linker definition
linkerTitleMusic: 
                    db       $50                          ; $00D2: first height 
                    db       $00                          ; $00D3: transposition1 
                    db       $00                          ; $00D4: transposition2 
                    db       $00                          ; $00D5: transposition3 
                    dw       specialtrackDef0TitleMusic   ; $00D6: [$016D] specialTrack 
pattern0DefinitionTitleMusic: 
                    db       $18                          ; $00D8: pattern 0 state 
                    db       $00                          ; $00D9: transposition 3 
                    dw       trackDef0TitleMusic          ; $00DA: [$01BC] pattern 0, track 1 
                    dw       trackDef1TitleMusic          ; $00DC: [$01CA] pattern 0, track 2 
                    dw       trackDef2TitleMusic          ; $00DE: [$01EC] pattern 0, track 3 
                    db       $50                          ; $00E0: new height 
pattern1DefinitionTitleMusic: 
                    db       $00                          ; $00E1: pattern 1 state 
                    dw       trackDef3TitleMusic          ; $00E2: [$01A9] pattern 1, track 1 
                    dw       trackDef4TitleMusic          ; $00E4: [$0211] pattern 1, track 2 
                    dw       trackDef5TitleMusic          ; $00E6: [$0233] pattern 1, track 3 
pattern2DefinitionTitleMusic: 
                    db       $00                          ; $00E8: pattern 2 state 
                    dw       trackDef6TitleMusic          ; $00E9: [$0259] pattern 2, track 1 
                    dw       trackDef1TitleMusic          ; $00EB: [$01CA] pattern 2, track 2 
                    dw       trackDef2TitleMusic          ; $00ED: [$01EC] pattern 2, track 3 
pattern3DefinitionTitleMusic: 
                    db       $00                          ; $00EF: pattern 3 state 
                    dw       trackDef6TitleMusic          ; $00F0: [$0259] pattern 3, track 1 
                    dw       trackDef4TitleMusic          ; $00F2: [$0211] pattern 3, track 2 
                    dw       trackDef5TitleMusic          ; $00F4: [$0233] pattern 3, track 3 
pattern4DefinitionTitleMusic: 
                    db       $10                          ; $00F6: pattern 4 state 
                    dw       trackDef6TitleMusic          ; $00F7: [$0259] pattern 4, track 1 
                    dw       trackDef9TitleMusic          ; $00F9: [$02AD] pattern 4, track 2 
                    dw       trackDef10TitleMusic         ; $00FB: [$03AB] pattern 4, track 3 
                    db       $40                          ; $00FD: new height 
pattern5DefinitionTitleMusic: 
                    db       $00                          ; $00FE: pattern 5 state 
                    dw       trackDef6TitleMusic          ; $00FF: [$0259] pattern 5, track 1 
                    dw       trackDef11TitleMusic         ; $0101: [$030E] pattern 5, track 2 
                    dw       trackDef10TitleMusic         ; $0103: [$03AB] pattern 5, track 3 
pattern6DefinitionTitleMusic: 
                    db       $00                          ; $0105: pattern 6 state 
                    dw       trackDef6TitleMusic          ; $0106: [$0259] pattern 6, track 1 
                    dw       trackDef9TitleMusic          ; $0108: [$02AD] pattern 6, track 2 
                    dw       trackDef10TitleMusic         ; $010A: [$03AB] pattern 6, track 3 
pattern7DefinitionTitleMusic: 
                    db       $00                          ; $010C: pattern 7 state 
                    dw       trackDef6TitleMusic          ; $010D: [$0259] pattern 7, track 1 
                    dw       trackDef13TitleMusic         ; $010F: [$03ED] pattern 7, track 2 
                    dw       trackDef10TitleMusic         ; $0111: [$03AB] pattern 7, track 3 
pattern8DefinitionTitleMusic: 
                    db       $00                          ; $0113: pattern 8 state 
                    dw       trackDef6TitleMusic          ; $0114: [$0259] pattern 8, track 1 
                    dw       trackDef14TitleMusic         ; $0116: [$043F] pattern 8, track 2 
                    dw       trackDef15TitleMusic         ; $0118: [$04A5] pattern 8, track 3 
pattern9DefinitionTitleMusic: 
                    db       $00                          ; $011A: pattern 9 state 
                    dw       trackDef6TitleMusic          ; $011B: [$0259] pattern 9, track 1 
                    dw       trackDef16TitleMusic         ; $011D: [$0470] pattern 9, track 2 
                    dw       trackDef17TitleMusic         ; $011F: [$04F8] pattern 9, track 3 
pattern10DefinitionTitleMusic: 
                    db       $00                          ; $0121: pattern 10 state 
                    dw       trackDef6TitleMusic          ; $0122: [$0259] pattern 10, track 1 
                    dw       trackDef14TitleMusic         ; $0124: [$043F] pattern 10, track 2 
                    dw       trackDef15TitleMusic         ; $0126: [$04A5] pattern 10, track 3 
pattern11DefinitionTitleMusic: 
                    db       $00                          ; $0128: pattern 11 state 
                    dw       trackDef6TitleMusic          ; $0129: [$0259] pattern 11, track 1 
                    dw       trackDef19TitleMusic         ; $012B: [$054E] pattern 11, track 2 
                    dw       trackDef17TitleMusic         ; $012D: [$04F8] pattern 11, track 3 
pattern12DefinitionTitleMusic: 
                    db       $00                          ; $012F: pattern 12 state 
                    dw       trackDef20TitleMusic         ; $0130: [$0585] pattern 12, track 1 
                    dw       trackDef21TitleMusic         ; $0132: [$05C9] pattern 12, track 2 
                    dw       trackDef22TitleMusic         ; $0134: [$05F0] pattern 12, track 3 
pattern13DefinitionTitleMusic: 
                    db       $00                          ; $0136: pattern 13 state 
                    dw       trackDef20TitleMusic         ; $0137: [$0585] pattern 13, track 1 
                    dw       trackDef23TitleMusic         ; $0139: [$0605] pattern 13, track 2 
                    dw       trackDef24TitleMusic         ; $013B: [$062D] pattern 13, track 3 
pattern14DefinitionTitleMusic: 
                    db       $00                          ; $013D: pattern 14 state 
                    dw       trackDef20TitleMusic         ; $013E: [$0585] pattern 14, track 1 
                    dw       trackDef21TitleMusic         ; $0140: [$05C9] pattern 14, track 2 
                    dw       trackDef22TitleMusic         ; $0142: [$05F0] pattern 14, track 3 
pattern15DefinitionTitleMusic: 
                    db       $00                          ; $0144: pattern 15 state 
                    dw       trackDef26TitleMusic         ; $0145: [$069C] pattern 15, track 1 
                    dw       trackDef27TitleMusic         ; $0147: [$065C] pattern 15, track 2 
                    dw       trackDef28TitleMusic         ; $0149: [$06E0] pattern 15, track 3 
pattern16DefinitionTitleMusic: 
                    db       $0C                          ; $014B: pattern 16 state 
                    db       $02                          ; $014C: transposition 2 
                    db       $02                          ; $014D: transposition 3 
                    dw       trackDef29TitleMusic         ; $014E: [$0714] pattern 16, track 1 
                    dw       trackDef14TitleMusic         ; $0150: [$043F] pattern 16, track 2 
                    dw       trackDef15TitleMusic         ; $0152: [$04A5] pattern 16, track 3 
pattern17DefinitionTitleMusic: 
                    db       $00                          ; $0154: pattern 17 state 
                    dw       trackDef29TitleMusic         ; $0155: [$0714] pattern 17, track 1 
                    dw       trackDef16TitleMusic         ; $0157: [$0470] pattern 17, track 2 
                    dw       trackDef17TitleMusic         ; $0159: [$04F8] pattern 17, track 3 
pattern18DefinitionTitleMusic: 
                    db       $00                          ; $015B: pattern 18 state 
                    dw       trackDef29TitleMusic         ; $015C: [$0714] pattern 18, track 1 
                    dw       trackDef14TitleMusic         ; $015E: [$043F] pattern 18, track 2 
                    dw       trackDef15TitleMusic         ; $0160: [$04A5] pattern 18, track 3 
pattern19DefinitionTitleMusic: 
                    db       $04                          ; $0162: pattern 19 state 
                    db       $00                          ; $0163: transposition 2 
                    dw       trackDef33TitleMusic         ; $0164: [$0367] pattern 19, track 1 
                    dw       trackDef34TitleMusic         ; $0166: [$016F] pattern 19, track 2 
                    dw       trackDef17TitleMusic         ; $0168: [$04F8] pattern 19, track 3 
pattern20DefinitionTitleMusic: 
                    db       $01                          ; $016A: pattern 20 state 
                    dw       pattern0DefinitionTitleMusic ; $016B: [$00D8] song restart address 
specialtrackDef0TitleMusic: 
                    db       $11                          ; $016D: data, speed 4 
                    db       $00                          ; $016E: wait 128 
trackDef34TitleMusic: 
                    db       $B2                          ; $016F: normal track data 
                    db       $E1                          ; $0170: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $0171: pitch 
                    db       $01                          ; $0173: instrument 
                    db       $10                          ; $0174: normal track data, wait 7 
                    db       $42                          ; $0175: normal track data 
                    db       $03                          ; $0176: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0177: normal track data, note: C0 
                    db       $07                          ; $0178: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0179: normal track data 
                    db       $0B                          ; $017A: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $B2                          ; $017B: normal track data 
                    db       $41                          ; $017C: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $017D: normal track data, wait 2 
                    db       $6F                          ; $017E: full optimization, no escape: F#4 
                    db       $06                          ; $017F: normal track data, wait 2 
                    db       $6D                          ; $0180: full optimization, no escape: F4 
                    db       $06                          ; $0181: normal track data, wait 2 
                    db       $69                          ; $0182: full optimization, no escape: D#4 
                    db       $06                          ; $0183: normal track data, wait 2 
                    db       $65                          ; $0184: full optimization, no escape: C#4 
                    db       $06                          ; $0185: normal track data, wait 2 
                    db       $79                          ; $0186: full optimization, no escape: B4 
                    db       $06                          ; $0187: normal track data, wait 2 
                    db       $42                          ; $0188: normal track data 
                    db       $03                          ; $0189: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $018A: normal track data, wait 0 
                    db       $42                          ; $018B: normal track data, note: C0 
                    db       $05                          ; $018C: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $018D: normal track data, wait 0 
                    db       $42                          ; $018E: normal track data, note: C0 
                    db       $07                          ; $018F: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $0190: normal track data, wait 2 
                    db       $BC                          ; $0191: normal track data 
                    db       $41                          ; $0192: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $0193: normal track data, wait 0 
                    db       $81                          ; $0194: full optimization, no escape: D#5 
                    db       $02                          ; $0195: normal track data, wait 0 
                    db       $7D                          ; $0196: full optimization, no escape: C#5 
                    db       $0A                          ; $0197: normal track data, wait 4 
                    db       $42                          ; $0198: normal track data 
                    db       $03                          ; $0199: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $019A: normal track data, wait 0 
                    db       $42                          ; $019B: normal track data, note: C0 
                    db       $05                          ; $019C: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $019D: normal track data, wait 0 
                    db       $42                          ; $019E: normal track data, note: C0 
                    db       $07                          ; $019F: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $01A0: normal track data 
                    db       $09                          ; $01A1: vol = $B (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $01A2: normal track data 
                    db       $0B                          ; $01A3: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $01A4: normal track data, wait 0 
                    db       $42                          ; $01A5: normal track data, note: C0 
                    db       $0D                          ; $01A6: vol = $9 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $01A7: normal track data, note: C0 
                    db       $0F                          ; $01A8: vol = $8 (inverted), no pitch, no note, no instrument 
trackDef3TitleMusic: 
                    db       $42                          ; $01A9: normal track data 
                    db       $80                          ; $01AA: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $01AB: pitch 
                    db       $42                          ; $01AD: normal track data 
                    db       $00                          ; $01AE: vol off, no pitch, no note, no instrument 
                    db       $3E                          ; $01AF: normal track data, wait 30 
                    db       $3E                          ; $01B0: normal track data, wait 30 
                    db       $B2                          ; $01B1: normal track data, note: G#4 
                    db       $7F                          ; $01B2: vol = $0 (inverted), no pitch, no note, no instrument 
                    db       $01                          ; $01B3: instrument 
                    db       $02                          ; $01B4: normal track data, wait 0 
                    db       $42                          ; $01B5: normal track data, note: C0 
                    db       $07                          ; $01B6: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $01B7: normal track data, wait 2 
                    db       $6B                          ; $01B8: full optimization, no escape: E4 
                    db       $06                          ; $01B9: normal track data, wait 2 
                    db       $6F                          ; $01BA: full optimization, no escape: F#4 
                    db       $00                          ; $01BB: track end signature found 
trackDef0TitleMusic: 
                    db       $A0                          ; $01BC: normal track data 
                    db       $E1                          ; $01BD: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $01BE: pitch 
                    db       $02                          ; $01C0: instrument 
                    db       $3E                          ; $01C1: normal track data, wait 30 
                    db       $3E                          ; $01C2: normal track data, wait 30 
                    db       $12                          ; $01C3: normal track data, wait 8 
                    db       $42                          ; $01C4: normal track data 
                    db       $00                          ; $01C5: vol off, no pitch, no note, no instrument 
                    db       $02                          ; $01C6: normal track data, wait 0 
                    db       $42                          ; $01C7: normal track data 
                    db       $00                          ; $01C8: vol off, no pitch, no note, no instrument 
                    db       $00                          ; $01C9: track end signature found 
trackDef1TitleMusic: 
                    db       $96                          ; $01CA: normal track data 
                    db       $E1                          ; $01CB: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $01CC: pitch 
                    db       $01                          ; $01CE: instrument 
                    db       $0E                          ; $01CF: normal track data, wait 6 
                    db       $61                          ; $01D0: full optimization, no escape: B3 
                    db       $0E                          ; $01D1: normal track data, wait 6 
                    db       $65                          ; $01D2: full optimization, no escape: C#4 
                    db       $0E                          ; $01D3: normal track data, wait 6 
                    db       $6F                          ; $01D4: full optimization, no escape: F#4 
                    db       $0E                          ; $01D5: normal track data, wait 6 
                    db       $79                          ; $01D6: full optimization, no escape: B4 
                    db       $0E                          ; $01D7: normal track data, wait 6 
                    db       $75                          ; $01D8: full optimization, no escape: A4 
                    db       $02                          ; $01D9: normal track data, wait 0 
                    db       $73                          ; $01DA: full optimization, no escape: G#4 
                    db       $02                          ; $01DB: normal track data, wait 0 
                    db       $6F                          ; $01DC: full optimization, no escape: F#4 
                    db       $06                          ; $01DD: normal track data, wait 2 
                    db       $75                          ; $01DE: full optimization, no escape: A4 
                    db       $0E                          ; $01DF: normal track data, wait 6 
                    db       $73                          ; $01E0: full optimization, no escape: G#4 
                    db       $02                          ; $01E1: normal track data, wait 0 
                    db       $6F                          ; $01E2: full optimization, no escape: F#4 
                    db       $02                          ; $01E3: normal track data, wait 0 
                    db       $6B                          ; $01E4: full optimization, no escape: E4 
                    db       $06                          ; $01E5: normal track data, wait 2 
                    db       $73                          ; $01E6: full optimization, no escape: G#4 
                    db       $06                          ; $01E7: normal track data, wait 2 
                    db       $6B                          ; $01E8: full optimization, no escape: E4 
                    db       $06                          ; $01E9: normal track data, wait 2 
                    db       $6F                          ; $01EA: full optimization, no escape: F#4 
                    db       $00                          ; $01EB: track end signature found 
trackDef2TitleMusic: 
                    db       $42                          ; $01EC: normal track data, note: C0 
                    db       $9F                          ; $01ED: vol = $0 (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $01EE: pitch 
                    db       $02                          ; $01F0: normal track data, wait 0 
                    db       $96                          ; $01F1: normal track data, note: F#3 
                    db       $67                          ; $01F2: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $01                          ; $01F3: instrument 
                    db       $0E                          ; $01F4: normal track data, wait 6 
                    db       $61                          ; $01F5: full optimization, no escape: B3 
                    db       $0E                          ; $01F6: normal track data, wait 6 
                    db       $65                          ; $01F7: full optimization, no escape: C#4 
                    db       $0E                          ; $01F8: normal track data, wait 6 
                    db       $6F                          ; $01F9: full optimization, no escape: F#4 
                    db       $0E                          ; $01FA: normal track data, wait 6 
                    db       $79                          ; $01FB: full optimization, no escape: B4 
                    db       $0E                          ; $01FC: normal track data, wait 6 
                    db       $75                          ; $01FD: full optimization, no escape: A4 
                    db       $02                          ; $01FE: normal track data, wait 0 
                    db       $73                          ; $01FF: full optimization, no escape: G#4 
                    db       $02                          ; $0200: normal track data, wait 0 
                    db       $6F                          ; $0201: full optimization, no escape: F#4 
                    db       $06                          ; $0202: normal track data, wait 2 
                    db       $75                          ; $0203: full optimization, no escape: A4 
                    db       $0E                          ; $0204: normal track data, wait 6 
                    db       $73                          ; $0205: full optimization, no escape: G#4 
                    db       $02                          ; $0206: normal track data, wait 0 
                    db       $6F                          ; $0207: full optimization, no escape: F#4 
                    db       $02                          ; $0208: normal track data, wait 0 
                    db       $6B                          ; $0209: full optimization, no escape: E4 
                    db       $06                          ; $020A: normal track data, wait 2 
                    db       $73                          ; $020B: full optimization, no escape: G#4 
                    db       $06                          ; $020C: normal track data, wait 2 
                    db       $6B                          ; $020D: full optimization, no escape: E4 
                    db       $06                          ; $020E: normal track data, wait 2 
                    db       $6F                          ; $020F: full optimization, no escape: F#4 
                    db       $00                          ; $0210: track end signature found 
trackDef4TitleMusic: 
                    db       $96                          ; $0211: normal track data 
                    db       $E0                          ; $0212: vol off, pitch, note, instrument 
                    dw       $0000                        ; $0213: pitch 
                    db       $01                          ; $0215: instrument 
                    db       $0E                          ; $0216: normal track data, wait 6 
                    db       $61                          ; $0217: full optimization, no escape: B3 
                    db       $0E                          ; $0218: normal track data, wait 6 
                    db       $65                          ; $0219: full optimization, no escape: C#4 
                    db       $0E                          ; $021A: normal track data, wait 6 
                    db       $6F                          ; $021B: full optimization, no escape: F#4 
                    db       $0E                          ; $021C: normal track data, wait 6 
                    db       $79                          ; $021D: full optimization, no escape: B4 
                    db       $0E                          ; $021E: normal track data, wait 6 
                    db       $75                          ; $021F: full optimization, no escape: A4 
                    db       $02                          ; $0220: normal track data, wait 0 
                    db       $73                          ; $0221: full optimization, no escape: G#4 
                    db       $02                          ; $0222: normal track data, wait 0 
                    db       $6F                          ; $0223: full optimization, no escape: F#4 
                    db       $06                          ; $0224: normal track data, wait 2 
                    db       $75                          ; $0225: full optimization, no escape: A4 
                    db       $0E                          ; $0226: normal track data, wait 6 
                    db       $73                          ; $0227: full optimization, no escape: G#4 
                    db       $02                          ; $0228: normal track data, wait 0 
                    db       $6F                          ; $0229: full optimization, no escape: F#4 
                    db       $02                          ; $022A: normal track data, wait 0 
                    db       $6B                          ; $022B: full optimization, no escape: E4 
                    db       $06                          ; $022C: normal track data, wait 2 
                    db       $73                          ; $022D: full optimization, no escape: G#4 
                    db       $06                          ; $022E: normal track data, wait 2 
                    db       $6B                          ; $022F: full optimization, no escape: E4 
                    db       $06                          ; $0230: normal track data, wait 2 
                    db       $6F                          ; $0231: full optimization, no escape: F#4 
                    db       $00                          ; $0232: track end signature found 
trackDef5TitleMusic: 
                    db       $42                          ; $0233: normal track data 
                    db       $80                          ; $0234: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $0235: pitch 
                    db       $02                          ; $0237: normal track data, wait 0 
                    db       $96                          ; $0238: normal track data 
                    db       $60                          ; $0239: vol off, no pitch, note, instrument 
                    db       $01                          ; $023A: instrument 
                    db       $0E                          ; $023B: normal track data, wait 6 
                    db       $61                          ; $023C: full optimization, no escape: B3 
                    db       $0E                          ; $023D: normal track data, wait 6 
                    db       $65                          ; $023E: full optimization, no escape: C#4 
                    db       $0E                          ; $023F: normal track data, wait 6 
                    db       $6F                          ; $0240: full optimization, no escape: F#4 
                    db       $0E                          ; $0241: normal track data, wait 6 
                    db       $79                          ; $0242: full optimization, no escape: B4 
                    db       $0E                          ; $0243: normal track data, wait 6 
                    db       $75                          ; $0244: full optimization, no escape: A4 
                    db       $02                          ; $0245: normal track data, wait 0 
                    db       $73                          ; $0246: full optimization, no escape: G#4 
                    db       $02                          ; $0247: normal track data, wait 0 
                    db       $6F                          ; $0248: full optimization, no escape: F#4 
                    db       $06                          ; $0249: normal track data, wait 2 
                    db       $75                          ; $024A: full optimization, no escape: A4 
                    db       $0E                          ; $024B: normal track data, wait 6 
                    db       $73                          ; $024C: full optimization, no escape: G#4 
                    db       $02                          ; $024D: normal track data, wait 0 
                    db       $6F                          ; $024E: full optimization, no escape: F#4 
                    db       $02                          ; $024F: normal track data, wait 0 
                    db       $6B                          ; $0250: full optimization, no escape: E4 
                    db       $02                          ; $0251: normal track data, wait 0 
                    db       $AA                          ; $0252: normal track data 
                    db       $41                          ; $0253: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $0254: normal track data, wait 2 
                    db       $65                          ; $0255: full optimization, no escape: C#4 
                    db       $06                          ; $0256: normal track data, wait 2 
                    db       $69                          ; $0257: full optimization, no escape: D#4 
                    db       $00                          ; $0258: track end signature found 
trackDef6TitleMusic: 
                    db       $88                          ; $0259: normal track data 
                    db       $E1                          ; $025A: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $025B: pitch 
                    db       $03                          ; $025D: instrument 
                    db       $06                          ; $025E: normal track data, wait 2 
                    db       $49                          ; $025F: full optimization, no escape: B2 
                    db       $02                          ; $0260: normal track data, wait 0 
                    db       $49                          ; $0261: full optimization, no escape: B2 
                    db       $02                          ; $0262: normal track data, wait 0 
                    db       $5C                          ; $0263: normal track data 
                    db       $60                          ; $0264: vol off, no pitch, note, instrument 
                    db       $04                          ; $0265: instrument 
                    db       $06                          ; $0266: normal track data, wait 2 
                    db       $88                          ; $0267: normal track data 
                    db       $60                          ; $0268: vol off, no pitch, note, instrument 
                    db       $03                          ; $0269: instrument 
                    db       $02                          ; $026A: normal track data, wait 0 
                    db       $49                          ; $026B: full optimization, no escape: B2 
                    db       $02                          ; $026C: normal track data, wait 0 
                    db       $49                          ; $026D: full optimization, no escape: B2 
                    db       $06                          ; $026E: normal track data, wait 2 
                    db       $49                          ; $026F: full optimization, no escape: B2 
                    db       $02                          ; $0270: normal track data, wait 0 
                    db       $49                          ; $0271: full optimization, no escape: B2 
                    db       $02                          ; $0272: normal track data, wait 0 
                    db       $5C                          ; $0273: normal track data 
                    db       $60                          ; $0274: vol off, no pitch, note, instrument 
                    db       $04                          ; $0275: instrument 
                    db       $06                          ; $0276: normal track data, wait 2 
                    db       $88                          ; $0277: normal track data 
                    db       $60                          ; $0278: vol off, no pitch, note, instrument 
                    db       $03                          ; $0279: instrument 
                    db       $02                          ; $027A: normal track data, wait 0 
                    db       $49                          ; $027B: full optimization, no escape: B2 
                    db       $02                          ; $027C: normal track data, wait 0 
                    db       $49                          ; $027D: full optimization, no escape: B2 
                    db       $06                          ; $027E: normal track data, wait 2 
                    db       $49                          ; $027F: full optimization, no escape: B2 
                    db       $02                          ; $0280: normal track data, wait 0 
                    db       $49                          ; $0281: full optimization, no escape: B2 
                    db       $02                          ; $0282: normal track data, wait 0 
                    db       $5C                          ; $0283: normal track data 
                    db       $60                          ; $0284: vol off, no pitch, note, instrument 
                    db       $04                          ; $0285: instrument 
                    db       $06                          ; $0286: normal track data, wait 2 
                    db       $88                          ; $0287: normal track data 
                    db       $60                          ; $0288: vol off, no pitch, note, instrument 
                    db       $03                          ; $0289: instrument 
                    db       $02                          ; $028A: normal track data, wait 0 
                    db       $49                          ; $028B: full optimization, no escape: B2 
                    db       $02                          ; $028C: normal track data, wait 0 
                    db       $49                          ; $028D: full optimization, no escape: B2 
                    db       $06                          ; $028E: normal track data, wait 2 
                    db       $49                          ; $028F: full optimization, no escape: B2 
                    db       $02                          ; $0290: normal track data, wait 0 
                    db       $49                          ; $0291: full optimization, no escape: B2 
                    db       $02                          ; $0292: normal track data, wait 0 
                    db       $5C                          ; $0293: normal track data 
                    db       $60                          ; $0294: vol off, no pitch, note, instrument 
                    db       $04                          ; $0295: instrument 
                    db       $06                          ; $0296: normal track data, wait 2 
                    db       $88                          ; $0297: normal track data 
                    db       $60                          ; $0298: vol off, no pitch, note, instrument 
                    db       $03                          ; $0299: instrument 
                    db       $02                          ; $029A: normal track data, wait 0 
                    db       $49                          ; $029B: full optimization, no escape: B2 
                    db       $02                          ; $029C: normal track data, wait 0 
                    db       $49                          ; $029D: full optimization, no escape: B2 
                    db       $06                          ; $029E: normal track data, wait 2 
                    db       $49                          ; $029F: full optimization, no escape: B2 
                    db       $02                          ; $02A0: normal track data, wait 0 
                    db       $49                          ; $02A1: full optimization, no escape: B2 
                    db       $02                          ; $02A2: normal track data, wait 0 
                    db       $5C                          ; $02A3: normal track data 
                    db       $60                          ; $02A4: vol off, no pitch, note, instrument 
                    db       $04                          ; $02A5: instrument 
                    db       $06                          ; $02A6: normal track data, wait 2 
                    db       $88                          ; $02A7: normal track data 
                    db       $60                          ; $02A8: vol off, no pitch, note, instrument 
                    db       $03                          ; $02A9: instrument 
                    db       $02                          ; $02AA: normal track data, wait 0 
                    db       $49                          ; $02AB: full optimization, no escape: B2 
                    db       $00                          ; $02AC: track end signature found 
trackDef9TitleMusic: 
                    db       $A0                          ; $02AD: normal track data 
                    db       $E1                          ; $02AE: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $02AF: pitch 
                    db       $01                          ; $02B1: instrument 
                    db       $04                          ; $02B2: normal track data, wait 1 
                    db       $42                          ; $02B3: normal track data, note: C0 
                    db       $07                          ; $02B4: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $A0                          ; $02B5: normal track data 
                    db       $41                          ; $02B6: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $02B7: normal track data, note: C0 
                    db       $07                          ; $02B8: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $A0                          ; $02B9: normal track data 
                    db       $41                          ; $02BA: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $02BB: normal track data, note: C0 
                    db       $07                          ; $02BC: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $AE                          ; $02BD: normal track data 
                    db       $41                          ; $02BE: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $02BF: normal track data, wait 1 
                    db       $42                          ; $02C0: normal track data, note: C0 
                    db       $07                          ; $02C1: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $AE                          ; $02C2: normal track data 
                    db       $41                          ; $02C3: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $02C4: normal track data, note: C0 
                    db       $07                          ; $02C5: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $AE                          ; $02C6: normal track data 
                    db       $41                          ; $02C7: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $02C8: normal track data, note: C0 
                    db       $07                          ; $02C9: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $B8                          ; $02CA: normal track data 
                    db       $41                          ; $02CB: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $02CC: normal track data, wait 1 
                    db       $42                          ; $02CD: normal track data, note: C0 
                    db       $07                          ; $02CE: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $B8                          ; $02CF: normal track data 
                    db       $41                          ; $02D0: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $02D1: normal track data, note: C0 
                    db       $07                          ; $02D2: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $B8                          ; $02D3: normal track data 
                    db       $41                          ; $02D4: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $02D5: normal track data, note: C0 
                    db       $07                          ; $02D6: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $B4                          ; $02D7: normal track data 
                    db       $41                          ; $02D8: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $02D9: normal track data, note: C0 
                    db       $05                          ; $02DA: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $B2                          ; $02DB: normal track data 
                    db       $41                          ; $02DC: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $02DD: normal track data, note: C0 
                    db       $05                          ; $02DE: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $AE                          ; $02DF: normal track data 
                    db       $41                          ; $02E0: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $02E1: normal track data, wait 1 
                    db       $42                          ; $02E2: normal track data 
                    db       $03                          ; $02E3: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $B4                          ; $02E4: normal track data 
                    db       $41                          ; $02E5: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $02E6: normal track data, wait 0 
                    db       $42                          ; $02E7: normal track data 
                    db       $03                          ; $02E8: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $02E9: normal track data, note: C0 
                    db       $05                          ; $02EA: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $B4                          ; $02EB: normal track data 
                    db       $41                          ; $02EC: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $02ED: normal track data, wait 0 
                    db       $42                          ; $02EE: normal track data 
                    db       $03                          ; $02EF: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $02F0: normal track data, note: C0 
                    db       $05                          ; $02F1: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $B2                          ; $02F2: normal track data 
                    db       $41                          ; $02F3: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $02F4: normal track data 
                    db       $03                          ; $02F5: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $AE                          ; $02F6: normal track data 
                    db       $41                          ; $02F7: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $02F8: normal track data 
                    db       $03                          ; $02F9: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $AA                          ; $02FA: normal track data 
                    db       $41                          ; $02FB: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $02FC: normal track data, wait 1 
                    db       $42                          ; $02FD: normal track data 
                    db       $03                          ; $02FE: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $B2                          ; $02FF: normal track data 
                    db       $41                          ; $0300: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $0301: normal track data, wait 2 
                    db       $6B                          ; $0302: full optimization, no escape: E4 
                    db       $06                          ; $0303: normal track data, wait 2 
                    db       $6F                          ; $0304: full optimization, no escape: F#4 
                    db       $04                          ; $0305: normal track data, wait 1 
                    db       $42                          ; $0306: normal track data 
                    db       $03                          ; $0307: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $0308: normal track data, wait 0 
                    db       $42                          ; $0309: normal track data, note: C0 
                    db       $05                          ; $030A: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $030B: normal track data, wait 0 
                    db       $42                          ; $030C: normal track data, note: C0 
                    db       $07                          ; $030D: vol = $C (inverted), no pitch, no note, no instrument 
trackDef11TitleMusic: 
                    db       $A0                          ; $030E: normal track data 
                    db       $E1                          ; $030F: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $0310: pitch 
                    db       $01                          ; $0312: instrument 
                    db       $04                          ; $0313: normal track data, wait 1 
                    db       $42                          ; $0314: normal track data, note: C0 
                    db       $07                          ; $0315: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $A0                          ; $0316: normal track data 
                    db       $41                          ; $0317: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0318: normal track data, note: C0 
                    db       $07                          ; $0319: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $A0                          ; $031A: normal track data 
                    db       $41                          ; $031B: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $031C: normal track data, note: C0 
                    db       $07                          ; $031D: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $AE                          ; $031E: normal track data 
                    db       $41                          ; $031F: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $0320: normal track data, wait 1 
                    db       $42                          ; $0321: normal track data, note: C0 
                    db       $07                          ; $0322: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $AE                          ; $0323: normal track data 
                    db       $41                          ; $0324: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0325: normal track data, note: C0 
                    db       $07                          ; $0326: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $AE                          ; $0327: normal track data 
                    db       $41                          ; $0328: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0329: normal track data, note: C0 
                    db       $07                          ; $032A: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $B8                          ; $032B: normal track data 
                    db       $41                          ; $032C: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $032D: normal track data, wait 1 
                    db       $42                          ; $032E: normal track data, note: C0 
                    db       $07                          ; $032F: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $B8                          ; $0330: normal track data 
                    db       $41                          ; $0331: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0332: normal track data, note: C0 
                    db       $07                          ; $0333: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $B8                          ; $0334: normal track data 
                    db       $41                          ; $0335: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0336: normal track data, note: C0 
                    db       $07                          ; $0337: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $B4                          ; $0338: normal track data 
                    db       $41                          ; $0339: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $033A: normal track data, note: C0 
                    db       $05                          ; $033B: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $B2                          ; $033C: normal track data 
                    db       $41                          ; $033D: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $033E: normal track data, note: C0 
                    db       $05                          ; $033F: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $AE                          ; $0340: normal track data 
                    db       $41                          ; $0341: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $0342: normal track data, wait 1 
                    db       $42                          ; $0343: normal track data 
                    db       $03                          ; $0344: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $B4                          ; $0345: normal track data 
                    db       $41                          ; $0346: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $0347: normal track data, wait 1 
                    db       $42                          ; $0348: normal track data 
                    db       $03                          ; $0349: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $B2                          ; $034A: normal track data 
                    db       $41                          ; $034B: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $034C: normal track data, wait 1 
                    db       $42                          ; $034D: normal track data 
                    db       $03                          ; $034E: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $AA                          ; $034F: normal track data 
                    db       $41                          ; $0350: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $0351: normal track data, wait 2 
                    db       $73                          ; $0352: full optimization, no escape: G#4 
                    db       $06                          ; $0353: normal track data, wait 2 
                    db       $6F                          ; $0354: full optimization, no escape: F#4 
                    db       $06                          ; $0355: normal track data, wait 2 
                    db       $61                          ; $0356: full optimization, no escape: B3 
                    db       $06                          ; $0357: normal track data, wait 2 
                    db       $42                          ; $0358: normal track data 
                    db       $03                          ; $0359: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $035A: normal track data, note: C0 
                    db       $05                          ; $035B: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $035C: normal track data, note: C0 
                    db       $07                          ; $035D: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $035E: normal track data 
                    db       $09                          ; $035F: vol = $B (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0360: normal track data 
                    db       $0B                          ; $0361: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $0362: normal track data, wait 0 
                    db       $42                          ; $0363: normal track data, note: C0 
                    db       $0D                          ; $0364: vol = $9 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0365: normal track data, note: C0 
                    db       $0F                          ; $0366: vol = $8 (inverted), no pitch, no note, no instrument 
trackDef33TitleMusic: 
                    db       $8C                          ; $0367: normal track data 
                    db       $E0                          ; $0368: vol off, pitch, note, instrument 
                    dw       $0000                        ; $0369: pitch 
                    db       $03                          ; $036B: instrument 
                    db       $06                          ; $036C: normal track data, wait 2 
                    db       $4D                          ; $036D: full optimization, no escape: C#3 
                    db       $02                          ; $036E: normal track data, wait 0 
                    db       $4D                          ; $036F: full optimization, no escape: C#3 
                    db       $02                          ; $0370: normal track data, wait 0 
                    db       $5C                          ; $0371: normal track data 
                    db       $60                          ; $0372: vol off, no pitch, note, instrument 
                    db       $04                          ; $0373: instrument 
                    db       $06                          ; $0374: normal track data, wait 2 
                    db       $8C                          ; $0375: normal track data 
                    db       $60                          ; $0376: vol off, no pitch, note, instrument 
                    db       $03                          ; $0377: instrument 
                    db       $02                          ; $0378: normal track data, wait 0 
                    db       $4D                          ; $0379: full optimization, no escape: C#3 
                    db       $02                          ; $037A: normal track data, wait 0 
                    db       $4D                          ; $037B: full optimization, no escape: C#3 
                    db       $06                          ; $037C: normal track data, wait 2 
                    db       $4D                          ; $037D: full optimization, no escape: C#3 
                    db       $02                          ; $037E: normal track data, wait 0 
                    db       $4D                          ; $037F: full optimization, no escape: C#3 
                    db       $02                          ; $0380: normal track data, wait 0 
                    db       $5C                          ; $0381: normal track data 
                    db       $60                          ; $0382: vol off, no pitch, note, instrument 
                    db       $04                          ; $0383: instrument 
                    db       $06                          ; $0384: normal track data, wait 2 
                    db       $8C                          ; $0385: normal track data 
                    db       $60                          ; $0386: vol off, no pitch, note, instrument 
                    db       $03                          ; $0387: instrument 
                    db       $02                          ; $0388: normal track data, wait 0 
                    db       $4D                          ; $0389: full optimization, no escape: C#3 
                    db       $02                          ; $038A: normal track data, wait 0 
                    db       $4D                          ; $038B: full optimization, no escape: C#3 
                    db       $06                          ; $038C: normal track data, wait 2 
                    db       $4D                          ; $038D: full optimization, no escape: C#3 
                    db       $02                          ; $038E: normal track data, wait 0 
                    db       $4D                          ; $038F: full optimization, no escape: C#3 
                    db       $02                          ; $0390: normal track data, wait 0 
                    db       $5C                          ; $0391: normal track data 
                    db       $60                          ; $0392: vol off, no pitch, note, instrument 
                    db       $04                          ; $0393: instrument 
                    db       $06                          ; $0394: normal track data, wait 2 
                    db       $8C                          ; $0395: normal track data 
                    db       $60                          ; $0396: vol off, no pitch, note, instrument 
                    db       $03                          ; $0397: instrument 
                    db       $02                          ; $0398: normal track data, wait 0 
                    db       $4D                          ; $0399: full optimization, no escape: C#3 
                    db       $02                          ; $039A: normal track data, wait 0 
                    db       $4D                          ; $039B: full optimization, no escape: C#3 
                    db       $06                          ; $039C: normal track data, wait 2 
                    db       $4D                          ; $039D: full optimization, no escape: C#3 
                    db       $02                          ; $039E: normal track data, wait 0 
                    db       $4D                          ; $039F: full optimization, no escape: C#3 
                    db       $02                          ; $03A0: normal track data, wait 0 
                    db       $5C                          ; $03A1: normal track data 
                    db       $60                          ; $03A2: vol off, no pitch, note, instrument 
                    db       $04                          ; $03A3: instrument 
                    db       $06                          ; $03A4: normal track data, wait 2 
                    db       $42                          ; $03A5: normal track data 
                    db       $00                          ; $03A6: vol off, no pitch, no note, no instrument 
                    db       $02                          ; $03A7: normal track data, wait 0 
                    db       $42                          ; $03A8: normal track data 
                    db       $00                          ; $03A9: vol off, no pitch, no note, no instrument 
                    db       $00                          ; $03AA: track end signature found 
trackDef10TitleMusic: 
                    db       $D0                          ; $03AB: normal track data 
                    db       $E0                          ; $03AC: vol off, pitch, note, instrument 
                    dw       $0000                        ; $03AD: pitch 
                    db       $05                          ; $03AF: instrument 
                    db       $02                          ; $03B0: normal track data, wait 0 
                    db       $D0                          ; $03B1: normal track data 
                    db       $60                          ; $03B2: vol off, no pitch, note, instrument 
                    db       $06                          ; $03B3: instrument 
                    db       $06                          ; $03B4: normal track data, wait 2 
                    db       $91                          ; $03B5: full optimization, no escape: B5 
                    db       $02                          ; $03B6: normal track data, wait 0 
                    db       $79                          ; $03B7: full optimization, no escape: B4 
                    db       $06                          ; $03B8: normal track data, wait 2 
                    db       $79                          ; $03B9: full optimization, no escape: B4 
                    db       $02                          ; $03BA: normal track data, wait 0 
                    db       $79                          ; $03BB: full optimization, no escape: B4 
                    db       $02                          ; $03BC: normal track data, wait 0 
                    db       $D0                          ; $03BD: normal track data 
                    db       $60                          ; $03BE: vol off, no pitch, note, instrument 
                    db       $05                          ; $03BF: instrument 
                    db       $02                          ; $03C0: normal track data, wait 0 
                    db       $D0                          ; $03C1: normal track data 
                    db       $60                          ; $03C2: vol off, no pitch, note, instrument 
                    db       $06                          ; $03C3: instrument 
                    db       $06                          ; $03C4: normal track data, wait 2 
                    db       $91                          ; $03C5: full optimization, no escape: B5 
                    db       $02                          ; $03C6: normal track data, wait 0 
                    db       $79                          ; $03C7: full optimization, no escape: B4 
                    db       $06                          ; $03C8: normal track data, wait 2 
                    db       $79                          ; $03C9: full optimization, no escape: B4 
                    db       $02                          ; $03CA: normal track data, wait 0 
                    db       $79                          ; $03CB: full optimization, no escape: B4 
                    db       $02                          ; $03CC: normal track data, wait 0 
                    db       $D0                          ; $03CD: normal track data 
                    db       $60                          ; $03CE: vol off, no pitch, note, instrument 
                    db       $05                          ; $03CF: instrument 
                    db       $02                          ; $03D0: normal track data, wait 0 
                    db       $D0                          ; $03D1: normal track data 
                    db       $60                          ; $03D2: vol off, no pitch, note, instrument 
                    db       $06                          ; $03D3: instrument 
                    db       $06                          ; $03D4: normal track data, wait 2 
                    db       $91                          ; $03D5: full optimization, no escape: B5 
                    db       $02                          ; $03D6: normal track data, wait 0 
                    db       $79                          ; $03D7: full optimization, no escape: B4 
                    db       $06                          ; $03D8: normal track data, wait 2 
                    db       $79                          ; $03D9: full optimization, no escape: B4 
                    db       $02                          ; $03DA: normal track data, wait 0 
                    db       $79                          ; $03DB: full optimization, no escape: B4 
                    db       $02                          ; $03DC: normal track data, wait 0 
                    db       $D0                          ; $03DD: normal track data 
                    db       $60                          ; $03DE: vol off, no pitch, note, instrument 
                    db       $05                          ; $03DF: instrument 
                    db       $02                          ; $03E0: normal track data, wait 0 
                    db       $D0                          ; $03E1: normal track data 
                    db       $60                          ; $03E2: vol off, no pitch, note, instrument 
                    db       $06                          ; $03E3: instrument 
                    db       $06                          ; $03E4: normal track data, wait 2 
                    db       $91                          ; $03E5: full optimization, no escape: B5 
                    db       $02                          ; $03E6: normal track data, wait 0 
                    db       $79                          ; $03E7: full optimization, no escape: B4 
                    db       $06                          ; $03E8: normal track data, wait 2 
                    db       $79                          ; $03E9: full optimization, no escape: B4 
                    db       $02                          ; $03EA: normal track data, wait 0 
                    db       $79                          ; $03EB: full optimization, no escape: B4 
                    db       $00                          ; $03EC: track end signature found 
trackDef13TitleMusic: 
                    db       $A0                          ; $03ED: normal track data 
                    db       $E1                          ; $03EE: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $03EF: pitch 
                    db       $01                          ; $03F1: instrument 
                    db       $04                          ; $03F2: normal track data, wait 1 
                    db       $42                          ; $03F3: normal track data, note: C0 
                    db       $05                          ; $03F4: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $A0                          ; $03F5: normal track data 
                    db       $41                          ; $03F6: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $03F7: normal track data, note: C0 
                    db       $05                          ; $03F8: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $A0                          ; $03F9: normal track data 
                    db       $41                          ; $03FA: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $03FB: normal track data, note: C0 
                    db       $05                          ; $03FC: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $AE                          ; $03FD: normal track data 
                    db       $41                          ; $03FE: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $03FF: normal track data, wait 1 
                    db       $42                          ; $0400: normal track data, note: C0 
                    db       $05                          ; $0401: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $AE                          ; $0402: normal track data 
                    db       $41                          ; $0403: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0404: normal track data, note: C0 
                    db       $05                          ; $0405: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $AE                          ; $0406: normal track data 
                    db       $41                          ; $0407: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0408: normal track data, note: C0 
                    db       $05                          ; $0409: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $B8                          ; $040A: normal track data 
                    db       $41                          ; $040B: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $040C: normal track data, wait 1 
                    db       $42                          ; $040D: normal track data, note: C0 
                    db       $05                          ; $040E: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $B8                          ; $040F: normal track data 
                    db       $41                          ; $0410: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0411: normal track data, note: C0 
                    db       $05                          ; $0412: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $B8                          ; $0413: normal track data 
                    db       $41                          ; $0414: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0415: normal track data, note: C0 
                    db       $05                          ; $0416: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $B4                          ; $0417: normal track data 
                    db       $41                          ; $0418: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0419: normal track data 
                    db       $03                          ; $041A: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $B2                          ; $041B: normal track data 
                    db       $41                          ; $041C: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $041D: normal track data 
                    db       $03                          ; $041E: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $AE                          ; $041F: normal track data 
                    db       $41                          ; $0420: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $0421: normal track data, wait 1 
                    db       $42                          ; $0422: normal track data 
                    db       $03                          ; $0423: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $B4                          ; $0424: normal track data 
                    db       $41                          ; $0425: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $0426: normal track data, wait 1 
                    db       $42                          ; $0427: normal track data 
                    db       $03                          ; $0428: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $B2                          ; $0429: normal track data 
                    db       $41                          ; $042A: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $042B: normal track data, wait 2 
                    db       $6B                          ; $042C: full optimization, no escape: E4 
                    db       $06                          ; $042D: normal track data, wait 2 
                    db       $73                          ; $042E: full optimization, no escape: G#4 
                    db       $06                          ; $042F: normal track data, wait 2 
                    db       $6F                          ; $0430: full optimization, no escape: F#4 
                    db       $06                          ; $0431: normal track data, wait 2 
                    db       $61                          ; $0432: full optimization, no escape: B3 
                    db       $06                          ; $0433: normal track data, wait 2 
                    db       $42                          ; $0434: normal track data 
                    db       $03                          ; $0435: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0436: normal track data, note: C0 
                    db       $05                          ; $0437: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0438: normal track data 
                    db       $0B                          ; $0439: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $043A: normal track data, note: C0 
                    db       $0D                          ; $043B: vol = $9 (inverted), no pitch, no note, no instrument 
                    db       $A0                          ; $043C: normal track data 
                    db       $41                          ; $043D: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $00                          ; $043E: track end signature found 
trackDef14TitleMusic: 
                    db       $AE                          ; $043F: normal track data 
                    db       $E1                          ; $0440: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $0441: pitch 
                    db       $01                          ; $0443: instrument 
                    db       $10                          ; $0444: normal track data, wait 7 
                    db       $42                          ; $0445: normal track data 
                    db       $03                          ; $0446: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0447: normal track data, note: C0 
                    db       $07                          ; $0448: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0449: normal track data 
                    db       $0B                          ; $044A: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $AE                          ; $044B: normal track data 
                    db       $41                          ; $044C: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $044D: normal track data, wait 2 
                    db       $6B                          ; $044E: full optimization, no escape: E4 
                    db       $06                          ; $044F: normal track data, wait 2 
                    db       $69                          ; $0450: full optimization, no escape: D#4 
                    db       $06                          ; $0451: normal track data, wait 2 
                    db       $65                          ; $0452: full optimization, no escape: C#4 
                    db       $06                          ; $0453: normal track data, wait 2 
                    db       $61                          ; $0454: full optimization, no escape: B3 
                    db       $06                          ; $0455: normal track data, wait 2 
                    db       $6B                          ; $0456: full optimization, no escape: E4 
                    db       $08                          ; $0457: normal track data, wait 3 
                    db       $42                          ; $0458: normal track data 
                    db       $03                          ; $0459: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $045A: normal track data, wait 1 
                    db       $42                          ; $045B: normal track data, note: C0 
                    db       $05                          ; $045C: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $045D: normal track data, wait 1 
                    db       $42                          ; $045E: normal track data, note: C0 
                    db       $07                          ; $045F: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $AE                          ; $0460: normal track data 
                    db       $41                          ; $0461: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $0462: normal track data, wait 0 
                    db       $73                          ; $0463: full optimization, no escape: G#4 
                    db       $02                          ; $0464: normal track data, wait 0 
                    db       $6F                          ; $0465: full optimization, no escape: F#4 
                    db       $10                          ; $0466: normal track data, wait 7 
                    db       $42                          ; $0467: normal track data 
                    db       $03                          ; $0468: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0469: normal track data, note: C0 
                    db       $05                          ; $046A: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $046B: normal track data, note: C0 
                    db       $07                          ; $046C: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $A0                          ; $046D: normal track data 
                    db       $41                          ; $046E: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $00                          ; $046F: track end signature found 
trackDef16TitleMusic: 
                    db       $AE                          ; $0470: normal track data 
                    db       $E0                          ; $0471: vol off, pitch, note, instrument 
                    dw       $0000                        ; $0472: pitch 
                    db       $01                          ; $0474: instrument 
                    db       $10                          ; $0475: normal track data, wait 7 
                    db       $42                          ; $0476: normal track data 
                    db       $03                          ; $0477: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0478: normal track data, note: C0 
                    db       $07                          ; $0479: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $047A: normal track data 
                    db       $0B                          ; $047B: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $AE                          ; $047C: normal track data 
                    db       $41                          ; $047D: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $047E: normal track data, wait 2 
                    db       $6B                          ; $047F: full optimization, no escape: E4 
                    db       $06                          ; $0480: normal track data, wait 2 
                    db       $69                          ; $0481: full optimization, no escape: D#4 
                    db       $06                          ; $0482: normal track data, wait 2 
                    db       $65                          ; $0483: full optimization, no escape: C#4 
                    db       $06                          ; $0484: normal track data, wait 2 
                    db       $61                          ; $0485: full optimization, no escape: B3 
                    db       $06                          ; $0486: normal track data, wait 2 
                    db       $75                          ; $0487: full optimization, no escape: A4 
                    db       $06                          ; $0488: normal track data, wait 2 
                    db       $42                          ; $0489: normal track data 
                    db       $03                          ; $048A: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $048B: normal track data, wait 0 
                    db       $42                          ; $048C: normal track data, note: C0 
                    db       $05                          ; $048D: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $048E: normal track data, wait 0 
                    db       $42                          ; $048F: normal track data, note: C0 
                    db       $07                          ; $0490: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $0491: normal track data, wait 2 
                    db       $B8                          ; $0492: normal track data 
                    db       $41                          ; $0493: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $0494: normal track data, wait 0 
                    db       $7D                          ; $0495: full optimization, no escape: C#5 
                    db       $02                          ; $0496: normal track data, wait 0 
                    db       $79                          ; $0497: full optimization, no escape: B4 
                    db       $0A                          ; $0498: normal track data, wait 4 
                    db       $42                          ; $0499: normal track data 
                    db       $03                          ; $049A: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $049B: normal track data, wait 0 
                    db       $42                          ; $049C: normal track data, note: C0 
                    db       $05                          ; $049D: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $049E: normal track data, wait 0 
                    db       $42                          ; $049F: normal track data, note: C0 
                    db       $07                          ; $04A0: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $04A1: normal track data, wait 0 
                    db       $A0                          ; $04A2: normal track data 
                    db       $41                          ; $04A3: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $00                          ; $04A4: track end signature found 
trackDef15TitleMusic: 
                    db       $88                          ; $04A5: normal track data 
                    db       $E1                          ; $04A6: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $04A7: pitch 
                    db       $01                          ; $04A9: instrument 
                    db       $04                          ; $04AA: normal track data, wait 1 
                    db       $42                          ; $04AB: normal track data, note: C0 
                    db       $05                          ; $04AC: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $88                          ; $04AD: normal track data 
                    db       $41                          ; $04AE: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $04AF: normal track data, note: C0 
                    db       $05                          ; $04B0: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $88                          ; $04B1: normal track data 
                    db       $41                          ; $04B2: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $04B3: normal track data, note: C0 
                    db       $05                          ; $04B4: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $96                          ; $04B5: normal track data 
                    db       $41                          ; $04B6: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $04B7: normal track data, wait 1 
                    db       $42                          ; $04B8: normal track data, note: C0 
                    db       $05                          ; $04B9: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $96                          ; $04BA: normal track data 
                    db       $41                          ; $04BB: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $04BC: normal track data, note: C0 
                    db       $05                          ; $04BD: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $96                          ; $04BE: normal track data 
                    db       $41                          ; $04BF: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $04C0: normal track data, note: C0 
                    db       $05                          ; $04C1: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $A0                          ; $04C2: normal track data 
                    db       $41                          ; $04C3: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $04C4: normal track data, wait 1 
                    db       $42                          ; $04C5: normal track data, note: C0 
                    db       $05                          ; $04C6: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $A0                          ; $04C7: normal track data 
                    db       $41                          ; $04C8: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $04C9: normal track data, note: C0 
                    db       $05                          ; $04CA: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $A0                          ; $04CB: normal track data 
                    db       $41                          ; $04CC: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $04CD: normal track data, note: C0 
                    db       $05                          ; $04CE: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $9C                          ; $04CF: normal track data 
                    db       $41                          ; $04D0: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $04D1: normal track data 
                    db       $03                          ; $04D2: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $9A                          ; $04D3: normal track data 
                    db       $41                          ; $04D4: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $04D5: normal track data 
                    db       $03                          ; $04D6: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $96                          ; $04D7: normal track data 
                    db       $41                          ; $04D8: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $04D9: normal track data, wait 1 
                    db       $42                          ; $04DA: normal track data 
                    db       $03                          ; $04DB: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $9C                          ; $04DC: normal track data 
                    db       $41                          ; $04DD: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $04DE: normal track data, wait 1 
                    db       $42                          ; $04DF: normal track data 
                    db       $03                          ; $04E0: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $9C                          ; $04E1: normal track data 
                    db       $41                          ; $04E2: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $04E3: normal track data, wait 2 
                    db       $5B                          ; $04E4: full optimization, no escape: G#3 
                    db       $02                          ; $04E5: normal track data, wait 0 
                    db       $57                          ; $04E6: full optimization, no escape: F#3 
                    db       $02                          ; $04E7: normal track data, wait 0 
                    db       $53                          ; $04E8: full optimization, no escape: E3 
                    db       $06                          ; $04E9: normal track data, wait 2 
                    db       $5B                          ; $04EA: full optimization, no escape: G#3 
                    db       $06                          ; $04EB: normal track data, wait 2 
                    db       $53                          ; $04EC: full optimization, no escape: E3 
                    db       $06                          ; $04ED: normal track data, wait 2 
                    db       $57                          ; $04EE: full optimization, no escape: F#3 
                    db       $04                          ; $04EF: normal track data, wait 1 
                    db       $42                          ; $04F0: normal track data 
                    db       $03                          ; $04F1: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $04F2: normal track data, note: C0 
                    db       $05                          ; $04F3: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $04F4: normal track data, wait 0 
                    db       $42                          ; $04F5: normal track data, note: C0 
                    db       $07                          ; $04F6: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $00                          ; $04F7: track end signature found 
trackDef17TitleMusic: 
                    db       $88                          ; $04F8: normal track data 
                    db       $E1                          ; $04F9: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $04FA: pitch 
                    db       $01                          ; $04FC: instrument 
                    db       $04                          ; $04FD: normal track data, wait 1 
                    db       $42                          ; $04FE: normal track data, note: C0 
                    db       $05                          ; $04FF: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $88                          ; $0500: normal track data 
                    db       $41                          ; $0501: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0502: normal track data, note: C0 
                    db       $05                          ; $0503: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $88                          ; $0504: normal track data 
                    db       $41                          ; $0505: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0506: normal track data, note: C0 
                    db       $05                          ; $0507: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $96                          ; $0508: normal track data 
                    db       $41                          ; $0509: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $050A: normal track data, wait 1 
                    db       $42                          ; $050B: normal track data, note: C0 
                    db       $05                          ; $050C: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $96                          ; $050D: normal track data 
                    db       $41                          ; $050E: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $050F: normal track data, note: C0 
                    db       $05                          ; $0510: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $96                          ; $0511: normal track data 
                    db       $41                          ; $0512: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0513: normal track data, note: C0 
                    db       $05                          ; $0514: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $A0                          ; $0515: normal track data 
                    db       $41                          ; $0516: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $0517: normal track data, wait 1 
                    db       $42                          ; $0518: normal track data, note: C0 
                    db       $05                          ; $0519: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $A0                          ; $051A: normal track data 
                    db       $41                          ; $051B: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $051C: normal track data, note: C0 
                    db       $05                          ; $051D: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $A0                          ; $051E: normal track data 
                    db       $41                          ; $051F: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0520: normal track data, note: C0 
                    db       $05                          ; $0521: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $9C                          ; $0522: normal track data 
                    db       $41                          ; $0523: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0524: normal track data 
                    db       $03                          ; $0525: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $9A                          ; $0526: normal track data 
                    db       $41                          ; $0527: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0528: normal track data 
                    db       $03                          ; $0529: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $96                          ; $052A: normal track data 
                    db       $41                          ; $052B: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $052C: normal track data, wait 1 
                    db       $42                          ; $052D: normal track data 
                    db       $03                          ; $052E: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $9C                          ; $052F: normal track data 
                    db       $41                          ; $0530: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $0531: normal track data, wait 1 
                    db       $42                          ; $0532: normal track data 
                    db       $03                          ; $0533: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $9A                          ; $0534: normal track data 
                    db       $41                          ; $0535: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $0536: normal track data, wait 2 
                    db       $53                          ; $0537: full optimization, no escape: E3 
                    db       $06                          ; $0538: normal track data, wait 2 
                    db       $5B                          ; $0539: full optimization, no escape: G#3 
                    db       $06                          ; $053A: normal track data, wait 2 
                    db       $57                          ; $053B: full optimization, no escape: F#3 
                    db       $06                          ; $053C: normal track data, wait 2 
                    db       $49                          ; $053D: full optimization, no escape: B2 
                    db       $06                          ; $053E: normal track data, wait 2 
                    db       $42                          ; $053F: normal track data 
                    db       $03                          ; $0540: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0541: normal track data, note: C0 
                    db       $05                          ; $0542: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0543: normal track data, note: C0 
                    db       $07                          ; $0544: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0545: normal track data 
                    db       $09                          ; $0546: vol = $B (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0547: normal track data 
                    db       $0B                          ; $0548: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $0549: normal track data, wait 0 
                    db       $42                          ; $054A: normal track data, note: C0 
                    db       $0D                          ; $054B: vol = $9 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $054C: normal track data, note: C0 
                    db       $0F                          ; $054D: vol = $8 (inverted), no pitch, no note, no instrument 
trackDef19TitleMusic: 
                    db       $AE                          ; $054E: normal track data 
                    db       $E0                          ; $054F: vol off, pitch, note, instrument 
                    dw       $0000                        ; $0550: pitch 
                    db       $01                          ; $0552: instrument 
                    db       $10                          ; $0553: normal track data, wait 7 
                    db       $42                          ; $0554: normal track data 
                    db       $03                          ; $0555: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0556: normal track data, note: C0 
                    db       $07                          ; $0557: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0558: normal track data 
                    db       $0B                          ; $0559: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $AE                          ; $055A: normal track data 
                    db       $41                          ; $055B: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $055C: normal track data, wait 2 
                    db       $6B                          ; $055D: full optimization, no escape: E4 
                    db       $06                          ; $055E: normal track data, wait 2 
                    db       $69                          ; $055F: full optimization, no escape: D#4 
                    db       $06                          ; $0560: normal track data, wait 2 
                    db       $65                          ; $0561: full optimization, no escape: C#4 
                    db       $06                          ; $0562: normal track data, wait 2 
                    db       $61                          ; $0563: full optimization, no escape: B3 
                    db       $06                          ; $0564: normal track data, wait 2 
                    db       $75                          ; $0565: full optimization, no escape: A4 
                    db       $06                          ; $0566: normal track data, wait 2 
                    db       $42                          ; $0567: normal track data 
                    db       $03                          ; $0568: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $0569: normal track data, wait 0 
                    db       $42                          ; $056A: normal track data, note: C0 
                    db       $05                          ; $056B: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $056C: normal track data, wait 2 
                    db       $42                          ; $056D: normal track data 
                    db       $0B                          ; $056E: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $056F: normal track data, note: C0 
                    db       $0D                          ; $0570: vol = $9 (inverted), no pitch, no note, no instrument 
                    db       $B8                          ; $0571: normal track data 
                    db       $41                          ; $0572: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $0573: normal track data, wait 0 
                    db       $7D                          ; $0574: full optimization, no escape: C#5 
                    db       $02                          ; $0575: normal track data, wait 0 
                    db       $79                          ; $0576: full optimization, no escape: B4 
                    db       $0A                          ; $0577: normal track data, wait 4 
                    db       $42                          ; $0578: normal track data 
                    db       $03                          ; $0579: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $057A: normal track data, wait 0 
                    db       $42                          ; $057B: normal track data, note: C0 
                    db       $05                          ; $057C: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $057D: normal track data, wait 0 
                    db       $42                          ; $057E: normal track data, note: C0 
                    db       $07                          ; $057F: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0580: normal track data 
                    db       $09                          ; $0581: vol = $B (inverted), no pitch, no note, no instrument 
                    db       $92                          ; $0582: normal track data 
                    db       $41                          ; $0583: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $00                          ; $0584: track end signature found 
trackDef20TitleMusic: 
                    db       $84                          ; $0585: normal track data 
                    db       $E0                          ; $0586: vol off, pitch, note, instrument 
                    dw       $0000                        ; $0587: pitch 
                    db       $03                          ; $0589: instrument 
                    db       $06                          ; $058A: normal track data, wait 2 
                    db       $45                          ; $058B: full optimization, no escape: A2 
                    db       $02                          ; $058C: normal track data, wait 0 
                    db       $45                          ; $058D: full optimization, no escape: A2 
                    db       $02                          ; $058E: normal track data, wait 0 
                    db       $5C                          ; $058F: normal track data 
                    db       $60                          ; $0590: vol off, no pitch, note, instrument 
                    db       $04                          ; $0591: instrument 
                    db       $06                          ; $0592: normal track data, wait 2 
                    db       $84                          ; $0593: normal track data 
                    db       $60                          ; $0594: vol off, no pitch, note, instrument 
                    db       $03                          ; $0595: instrument 
                    db       $02                          ; $0596: normal track data, wait 0 
                    db       $45                          ; $0597: full optimization, no escape: A2 
                    db       $02                          ; $0598: normal track data, wait 0 
                    db       $45                          ; $0599: full optimization, no escape: A2 
                    db       $06                          ; $059A: normal track data, wait 2 
                    db       $45                          ; $059B: full optimization, no escape: A2 
                    db       $02                          ; $059C: normal track data, wait 0 
                    db       $45                          ; $059D: full optimization, no escape: A2 
                    db       $02                          ; $059E: normal track data, wait 0 
                    db       $5C                          ; $059F: normal track data 
                    db       $60                          ; $05A0: vol off, no pitch, note, instrument 
                    db       $04                          ; $05A1: instrument 
                    db       $06                          ; $05A2: normal track data, wait 2 
                    db       $84                          ; $05A3: normal track data 
                    db       $60                          ; $05A4: vol off, no pitch, note, instrument 
                    db       $03                          ; $05A5: instrument 
                    db       $02                          ; $05A6: normal track data, wait 0 
                    db       $45                          ; $05A7: full optimization, no escape: A2 
                    db       $02                          ; $05A8: normal track data, wait 0 
                    db       $4D                          ; $05A9: full optimization, no escape: C#3 
                    db       $06                          ; $05AA: normal track data, wait 2 
                    db       $4D                          ; $05AB: full optimization, no escape: C#3 
                    db       $02                          ; $05AC: normal track data, wait 0 
                    db       $4D                          ; $05AD: full optimization, no escape: C#3 
                    db       $02                          ; $05AE: normal track data, wait 0 
                    db       $5C                          ; $05AF: normal track data 
                    db       $60                          ; $05B0: vol off, no pitch, note, instrument 
                    db       $04                          ; $05B1: instrument 
                    db       $06                          ; $05B2: normal track data, wait 2 
                    db       $8C                          ; $05B3: normal track data 
                    db       $60                          ; $05B4: vol off, no pitch, note, instrument 
                    db       $03                          ; $05B5: instrument 
                    db       $02                          ; $05B6: normal track data, wait 0 
                    db       $4D                          ; $05B7: full optimization, no escape: C#3 
                    db       $02                          ; $05B8: normal track data, wait 0 
                    db       $4D                          ; $05B9: full optimization, no escape: C#3 
                    db       $06                          ; $05BA: normal track data, wait 2 
                    db       $4D                          ; $05BB: full optimization, no escape: C#3 
                    db       $02                          ; $05BC: normal track data, wait 0 
                    db       $4D                          ; $05BD: full optimization, no escape: C#3 
                    db       $02                          ; $05BE: normal track data, wait 0 
                    db       $5C                          ; $05BF: normal track data 
                    db       $60                          ; $05C0: vol off, no pitch, note, instrument 
                    db       $04                          ; $05C1: instrument 
                    db       $06                          ; $05C2: normal track data, wait 2 
                    db       $8C                          ; $05C3: normal track data 
                    db       $60                          ; $05C4: vol off, no pitch, note, instrument 
                    db       $03                          ; $05C5: instrument 
                    db       $02                          ; $05C6: normal track data, wait 0 
                    db       $4D                          ; $05C7: full optimization, no escape: C#3 
                    db       $00                          ; $05C8: track end signature found 
trackDef21TitleMusic: 
                    db       $A8                          ; $05C9: normal track data 
                    db       $E0                          ; $05CA: vol off, pitch, note, instrument 
                    dw       $0000                        ; $05CB: pitch 
                    db       $01                          ; $05CD: instrument 
                    db       $0E                          ; $05CE: normal track data, wait 6 
                    db       $42                          ; $05CF: normal track data 
                    db       $03                          ; $05D0: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $05D1: normal track data, wait 0 
                    db       $42                          ; $05D2: normal track data, note: C0 
                    db       $05                          ; $05D3: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $05D4: normal track data, wait 0 
                    db       $A4                          ; $05D5: normal track data 
                    db       $41                          ; $05D6: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $05D7: normal track data, wait 2 
                    db       $6B                          ; $05D8: full optimization, no escape: E4 
                    db       $06                          ; $05D9: normal track data, wait 2 
                    db       $69                          ; $05DA: full optimization, no escape: D#4 
                    db       $06                          ; $05DB: normal track data, wait 2 
                    db       $65                          ; $05DC: full optimization, no escape: C#4 
                    db       $06                          ; $05DD: normal track data, wait 2 
                    db       $61                          ; $05DE: full optimization, no escape: B3 
                    db       $06                          ; $05DF: normal track data, wait 2 
                    db       $65                          ; $05E0: full optimization, no escape: C#4 
                    db       $0E                          ; $05E1: normal track data, wait 6 
                    db       $5B                          ; $05E2: full optimization, no escape: G#3 
                    db       $1E                          ; $05E3: normal track data, wait 14 
                    db       $42                          ; $05E4: normal track data 
                    db       $03                          ; $05E5: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $05E6: normal track data, wait 0 
                    db       $42                          ; $05E7: normal track data, note: C0 
                    db       $05                          ; $05E8: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $05E9: normal track data, wait 0 
                    db       $42                          ; $05EA: normal track data, note: C0 
                    db       $07                          ; $05EB: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $05EC: normal track data, wait 0 
                    db       $42                          ; $05ED: normal track data 
                    db       $09                          ; $05EE: vol = $B (inverted), no pitch, no note, no instrument 
                    db       $00                          ; $05EF: track end signature found 
trackDef22TitleMusic: 
                    db       $84                          ; $05F0: normal track data 
                    db       $E1                          ; $05F1: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $05F2: pitch 
                    db       $01                          ; $05F4: instrument 
                    db       $0E                          ; $05F5: normal track data, wait 6 
                    db       $53                          ; $05F6: full optimization, no escape: E3 
                    db       $0E                          ; $05F7: normal track data, wait 6 
                    db       $A4                          ; $05F8: normal track data 
                    db       $43                          ; $05F9: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $36                          ; $05FA: normal track data, wait 26 
                    db       $5B                          ; $05FB: full optimization, no escape: G#3 
                    db       $06                          ; $05FC: normal track data, wait 2 
                    db       $65                          ; $05FD: full optimization, no escape: C#4 
                    db       $06                          ; $05FE: normal track data, wait 2 
                    db       $69                          ; $05FF: full optimization, no escape: D#4 
                    db       $06                          ; $0600: normal track data, wait 2 
                    db       $65                          ; $0601: full optimization, no escape: C#4 
                    db       $06                          ; $0602: normal track data, wait 2 
                    db       $5B                          ; $0603: full optimization, no escape: G#3 
                    db       $00                          ; $0604: track end signature found 
trackDef23TitleMusic: 
                    db       $A8                          ; $0605: normal track data 
                    db       $E1                          ; $0606: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $0607: pitch 
                    db       $01                          ; $0609: instrument 
                    db       $0E                          ; $060A: normal track data, wait 6 
                    db       $42                          ; $060B: normal track data 
                    db       $03                          ; $060C: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $060D: normal track data, wait 0 
                    db       $42                          ; $060E: normal track data, note: C0 
                    db       $05                          ; $060F: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $0610: normal track data, wait 0 
                    db       $A4                          ; $0611: normal track data 
                    db       $41                          ; $0612: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $0613: normal track data, wait 2 
                    db       $6B                          ; $0614: full optimization, no escape: E4 
                    db       $06                          ; $0615: normal track data, wait 2 
                    db       $69                          ; $0616: full optimization, no escape: D#4 
                    db       $06                          ; $0617: normal track data, wait 2 
                    db       $65                          ; $0618: full optimization, no escape: C#4 
                    db       $06                          ; $0619: normal track data, wait 2 
                    db       $61                          ; $061A: full optimization, no escape: B3 
                    db       $06                          ; $061B: normal track data, wait 2 
                    db       $65                          ; $061C: full optimization, no escape: C#4 
                    db       $20                          ; $061D: normal track data, wait 15 
                    db       $42                          ; $061E: normal track data 
                    db       $03                          ; $061F: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $0620: normal track data, wait 1 
                    db       $42                          ; $0621: normal track data, note: C0 
                    db       $05                          ; $0622: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $0623: normal track data, wait 1 
                    db       $42                          ; $0624: normal track data, note: C0 
                    db       $07                          ; $0625: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $0626: normal track data, wait 1 
                    db       $42                          ; $0627: normal track data 
                    db       $09                          ; $0628: vol = $B (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $0629: normal track data, wait 0 
                    db       $9A                          ; $062A: normal track data 
                    db       $41                          ; $062B: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $00                          ; $062C: track end signature found 
trackDef24TitleMusic: 
                    db       $84                          ; $062D: normal track data 
                    db       $E1                          ; $062E: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $062F: pitch 
                    db       $01                          ; $0631: instrument 
                    db       $0E                          ; $0632: normal track data, wait 6 
                    db       $53                          ; $0633: full optimization, no escape: E3 
                    db       $0E                          ; $0634: normal track data, wait 6 
                    db       $A4                          ; $0635: normal track data 
                    db       $43                          ; $0636: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $1E                          ; $0637: normal track data, wait 14 
                    db       $42                          ; $0638: normal track data 
                    db       $80                          ; $0639: vol off, pitch, no note, no instrument 
                    dw       $FFFF                        ; $063A: pitch 
                    db       $42                          ; $063C: normal track data 
                    db       $80                          ; $063D: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $063E: pitch 
                    db       $0C                          ; $0640: normal track data, wait 5 
                    db       $42                          ; $0641: normal track data 
                    db       $80                          ; $0642: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $0643: pitch 
                    db       $42                          ; $0645: normal track data 
                    db       $80                          ; $0646: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $0647: pitch 
                    db       $0C                          ; $0649: normal track data, wait 5 
                    db       $42                          ; $064A: normal track data 
                    db       $80                          ; $064B: vol off, pitch, no note, no instrument 
                    dw       $FFFF                        ; $064C: pitch 
                    db       $42                          ; $064E: normal track data 
                    db       $80                          ; $064F: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $0650: pitch 
                    db       $0C                          ; $0652: normal track data, wait 5 
                    db       $42                          ; $0653: normal track data 
                    db       $80                          ; $0654: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $0655: pitch 
                    db       $42                          ; $0657: normal track data 
                    db       $80                          ; $0658: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $0659: pitch 
                    db       $00                          ; $065B: track end signature found 
trackDef27TitleMusic: 
                    db       $A8                          ; $065C: normal track data 
                    db       $E1                          ; $065D: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $065E: pitch 
                    db       $01                          ; $0660: instrument 
                    db       $0E                          ; $0661: normal track data, wait 6 
                    db       $42                          ; $0662: normal track data 
                    db       $03                          ; $0663: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $0664: normal track data, wait 0 
                    db       $42                          ; $0665: normal track data, note: C0 
                    db       $05                          ; $0666: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $0667: normal track data, wait 0 
                    db       $A4                          ; $0668: normal track data 
                    db       $41                          ; $0669: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $066A: normal track data, wait 2 
                    db       $6F                          ; $066B: full optimization, no escape: F#4 
                    db       $06                          ; $066C: normal track data, wait 2 
                    db       $6B                          ; $066D: full optimization, no escape: E4 
                    db       $06                          ; $066E: normal track data, wait 2 
                    db       $69                          ; $066F: full optimization, no escape: D#4 
                    db       $06                          ; $0670: normal track data, wait 2 
                    db       $65                          ; $0671: full optimization, no escape: C#4 
                    db       $06                          ; $0672: normal track data, wait 2 
                    db       $73                          ; $0673: full optimization, no escape: G#4 
                    db       $10                          ; $0674: normal track data, wait 7 
                    db       $42                          ; $0675: normal track data 
                    db       $03                          ; $0676: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0677: normal track data, note: C0 
                    db       $05                          ; $0678: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0679: normal track data, note: C0 
                    db       $07                          ; $067A: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $B2                          ; $067B: normal track data 
                    db       $41                          ; $067C: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $067D: normal track data, note: C0 
                    db       $05                          ; $067E: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $B2                          ; $067F: normal track data 
                    db       $41                          ; $0680: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0681: normal track data, note: C0 
                    db       $05                          ; $0682: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $B2                          ; $0683: normal track data 
                    db       $41                          ; $0684: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0685: normal track data 
                    db       $03                          ; $0686: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0687: normal track data, note: C0 
                    db       $05                          ; $0688: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $0689: normal track data, wait 0 
                    db       $B2                          ; $068A: normal track data 
                    db       $41                          ; $068B: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $068C: normal track data, note: C0 
                    db       $05                          ; $068D: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $B2                          ; $068E: normal track data 
                    db       $41                          ; $068F: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0690: normal track data, note: C0 
                    db       $05                          ; $0691: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $B2                          ; $0692: normal track data 
                    db       $41                          ; $0693: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0694: normal track data 
                    db       $03                          ; $0695: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0696: normal track data, note: C0 
                    db       $05                          ; $0697: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $0698: normal track data, wait 0 
                    db       $A4                          ; $0699: normal track data 
                    db       $43                          ; $069A: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $00                          ; $069B: track end signature found 
trackDef26TitleMusic: 
                    db       $84                          ; $069C: normal track data 
                    db       $E0                          ; $069D: vol off, pitch, note, instrument 
                    dw       $0000                        ; $069E: pitch 
                    db       $03                          ; $06A0: instrument 
                    db       $06                          ; $06A1: normal track data, wait 2 
                    db       $45                          ; $06A2: full optimization, no escape: A2 
                    db       $02                          ; $06A3: normal track data, wait 0 
                    db       $45                          ; $06A4: full optimization, no escape: A2 
                    db       $02                          ; $06A5: normal track data, wait 0 
                    db       $5C                          ; $06A6: normal track data 
                    db       $60                          ; $06A7: vol off, no pitch, note, instrument 
                    db       $04                          ; $06A8: instrument 
                    db       $06                          ; $06A9: normal track data, wait 2 
                    db       $84                          ; $06AA: normal track data 
                    db       $60                          ; $06AB: vol off, no pitch, note, instrument 
                    db       $03                          ; $06AC: instrument 
                    db       $02                          ; $06AD: normal track data, wait 0 
                    db       $45                          ; $06AE: full optimization, no escape: A2 
                    db       $02                          ; $06AF: normal track data, wait 0 
                    db       $45                          ; $06B0: full optimization, no escape: A2 
                    db       $06                          ; $06B1: normal track data, wait 2 
                    db       $45                          ; $06B2: full optimization, no escape: A2 
                    db       $02                          ; $06B3: normal track data, wait 0 
                    db       $45                          ; $06B4: full optimization, no escape: A2 
                    db       $02                          ; $06B5: normal track data, wait 0 
                    db       $5C                          ; $06B6: normal track data 
                    db       $60                          ; $06B7: vol off, no pitch, note, instrument 
                    db       $04                          ; $06B8: instrument 
                    db       $06                          ; $06B9: normal track data, wait 2 
                    db       $84                          ; $06BA: normal track data 
                    db       $60                          ; $06BB: vol off, no pitch, note, instrument 
                    db       $03                          ; $06BC: instrument 
                    db       $02                          ; $06BD: normal track data, wait 0 
                    db       $45                          ; $06BE: full optimization, no escape: A2 
                    db       $02                          ; $06BF: normal track data, wait 0 
                    db       $43                          ; $06C0: full optimization, no escape: G#2 
                    db       $06                          ; $06C1: normal track data, wait 2 
                    db       $43                          ; $06C2: full optimization, no escape: G#2 
                    db       $02                          ; $06C3: normal track data, wait 0 
                    db       $43                          ; $06C4: full optimization, no escape: G#2 
                    db       $02                          ; $06C5: normal track data, wait 0 
                    db       $5C                          ; $06C6: normal track data 
                    db       $60                          ; $06C7: vol off, no pitch, note, instrument 
                    db       $04                          ; $06C8: instrument 
                    db       $06                          ; $06C9: normal track data, wait 2 
                    db       $82                          ; $06CA: normal track data 
                    db       $60                          ; $06CB: vol off, no pitch, note, instrument 
                    db       $03                          ; $06CC: instrument 
                    db       $02                          ; $06CD: normal track data, wait 0 
                    db       $43                          ; $06CE: full optimization, no escape: G#2 
                    db       $02                          ; $06CF: normal track data, wait 0 
                    db       $43                          ; $06D0: full optimization, no escape: G#2 
                    db       $06                          ; $06D1: normal track data, wait 2 
                    db       $43                          ; $06D2: full optimization, no escape: G#2 
                    db       $02                          ; $06D3: normal track data, wait 0 
                    db       $43                          ; $06D4: full optimization, no escape: G#2 
                    db       $02                          ; $06D5: normal track data, wait 0 
                    db       $5C                          ; $06D6: normal track data 
                    db       $60                          ; $06D7: vol off, no pitch, note, instrument 
                    db       $04                          ; $06D8: instrument 
                    db       $06                          ; $06D9: normal track data, wait 2 
                    db       $82                          ; $06DA: normal track data 
                    db       $60                          ; $06DB: vol off, no pitch, note, instrument 
                    db       $03                          ; $06DC: instrument 
                    db       $02                          ; $06DD: normal track data, wait 0 
                    db       $43                          ; $06DE: full optimization, no escape: G#2 
                    db       $00                          ; $06DF: track end signature found 
trackDef28TitleMusic: 
                    db       $84                          ; $06E0: normal track data 
                    db       $E1                          ; $06E1: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $06E2: pitch 
                    db       $01                          ; $06E4: instrument 
                    db       $0E                          ; $06E5: normal track data, wait 6 
                    db       $53                          ; $06E6: full optimization, no escape: E3 
                    db       $0E                          ; $06E7: normal track data, wait 6 
                    db       $A4                          ; $06E8: normal track data 
                    db       $43                          ; $06E9: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $1E                          ; $06EA: normal track data, wait 14 
                    db       $5B                          ; $06EB: full optimization, no escape: G#3 
                    db       $10                          ; $06EC: normal track data, wait 7 
                    db       $42                          ; $06ED: normal track data 
                    db       $00                          ; $06EE: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $06EF: normal track data, note: C0 
                    db       $05                          ; $06F0: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $06F1: normal track data, note: C0 
                    db       $07                          ; $06F2: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $9A                          ; $06F3: normal track data 
                    db       $41                          ; $06F4: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $06F5: normal track data, note: C0 
                    db       $05                          ; $06F6: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $9A                          ; $06F7: normal track data 
                    db       $41                          ; $06F8: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $06F9: normal track data, note: C0 
                    db       $05                          ; $06FA: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $9A                          ; $06FB: normal track data 
                    db       $41                          ; $06FC: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $06FD: normal track data 
                    db       $03                          ; $06FE: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $06FF: normal track data, note: C0 
                    db       $05                          ; $0700: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $0701: normal track data, wait 0 
                    db       $9A                          ; $0702: normal track data 
                    db       $41                          ; $0703: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0704: normal track data, note: C0 
                    db       $05                          ; $0705: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $9A                          ; $0706: normal track data 
                    db       $41                          ; $0707: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0708: normal track data, note: C0 
                    db       $05                          ; $0709: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $9A                          ; $070A: normal track data 
                    db       $41                          ; $070B: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $070C: normal track data 
                    db       $03                          ; $070D: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $070E: normal track data, note: C0 
                    db       $05                          ; $070F: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $0710: normal track data, wait 0 
                    db       $82                          ; $0711: normal track data 
                    db       $41                          ; $0712: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $00                          ; $0713: track end signature found 
trackDef29TitleMusic: 
                    db       $8C                          ; $0714: normal track data 
                    db       $E0                          ; $0715: vol off, pitch, note, instrument 
                    dw       $0000                        ; $0716: pitch 
                    db       $03                          ; $0718: instrument 
                    db       $06                          ; $0719: normal track data, wait 2 
                    db       $4D                          ; $071A: full optimization, no escape: C#3 
                    db       $02                          ; $071B: normal track data, wait 0 
                    db       $4D                          ; $071C: full optimization, no escape: C#3 
                    db       $02                          ; $071D: normal track data, wait 0 
                    db       $5C                          ; $071E: normal track data 
                    db       $60                          ; $071F: vol off, no pitch, note, instrument 
                    db       $04                          ; $0720: instrument 
                    db       $06                          ; $0721: normal track data, wait 2 
                    db       $8C                          ; $0722: normal track data 
                    db       $60                          ; $0723: vol off, no pitch, note, instrument 
                    db       $03                          ; $0724: instrument 
                    db       $02                          ; $0725: normal track data, wait 0 
                    db       $4D                          ; $0726: full optimization, no escape: C#3 
                    db       $02                          ; $0727: normal track data, wait 0 
                    db       $4D                          ; $0728: full optimization, no escape: C#3 
                    db       $06                          ; $0729: normal track data, wait 2 
                    db       $4D                          ; $072A: full optimization, no escape: C#3 
                    db       $02                          ; $072B: normal track data, wait 0 
                    db       $4D                          ; $072C: full optimization, no escape: C#3 
                    db       $02                          ; $072D: normal track data, wait 0 
                    db       $5C                          ; $072E: normal track data 
                    db       $60                          ; $072F: vol off, no pitch, note, instrument 
                    db       $04                          ; $0730: instrument 
                    db       $06                          ; $0731: normal track data, wait 2 
                    db       $8C                          ; $0732: normal track data 
                    db       $60                          ; $0733: vol off, no pitch, note, instrument 
                    db       $03                          ; $0734: instrument 
                    db       $02                          ; $0735: normal track data, wait 0 
                    db       $4D                          ; $0736: full optimization, no escape: C#3 
                    db       $02                          ; $0737: normal track data, wait 0 
                    db       $4D                          ; $0738: full optimization, no escape: C#3 
                    db       $06                          ; $0739: normal track data, wait 2 
                    db       $4D                          ; $073A: full optimization, no escape: C#3 
                    db       $02                          ; $073B: normal track data, wait 0 
                    db       $4D                          ; $073C: full optimization, no escape: C#3 
                    db       $02                          ; $073D: normal track data, wait 0 
                    db       $5C                          ; $073E: normal track data 
                    db       $60                          ; $073F: vol off, no pitch, note, instrument 
                    db       $04                          ; $0740: instrument 
                    db       $06                          ; $0741: normal track data, wait 2 
                    db       $8C                          ; $0742: normal track data 
                    db       $60                          ; $0743: vol off, no pitch, note, instrument 
                    db       $03                          ; $0744: instrument 
                    db       $02                          ; $0745: normal track data, wait 0 
                    db       $4D                          ; $0746: full optimization, no escape: C#3 
                    db       $02                          ; $0747: normal track data, wait 0 
                    db       $4D                          ; $0748: full optimization, no escape: C#3 
                    db       $06                          ; $0749: normal track data, wait 2 
                    db       $4D                          ; $074A: full optimization, no escape: C#3 
                    db       $02                          ; $074B: normal track data, wait 0 
                    db       $4D                          ; $074C: full optimization, no escape: C#3 
                    db       $02                          ; $074D: normal track data, wait 0 
                    db       $5C                          ; $074E: normal track data 
                    db       $60                          ; $074F: vol off, no pitch, note, instrument 
                    db       $04                          ; $0750: instrument 
                    db       $06                          ; $0751: normal track data, wait 2 
                    db       $8C                          ; $0752: normal track data 
                    db       $60                          ; $0753: vol off, no pitch, note, instrument 
                    db       $03                          ; $0754: instrument 
                    db       $02                          ; $0755: normal track data, wait 0 
                    db       $4D                          ; $0756: full optimization, no escape: C#3 
                    db       $00                          ; $0757: track end signature found 
