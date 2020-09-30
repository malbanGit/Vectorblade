; This file was build using VIDE - Vectrex Integrated Development Environment
; Original bin file was: /Users/chrissalo/NetBeansProjects/Vide/_projects/Vectorblade/Music/echoes.bin
; 
; offset for AKS file assumed: $0000 guessed by accessing byte data[13] * 256)
; not used by vectrex player and therefor omitted:
;  DB "AT10" ; Signature of Arkos Tracker files
;  DB $01 ; sample channel
;  DB $40, 42, 0f ; YM custom frequence - little endian
;  DB $02 ; Replay frequency (0=13hz,1=25hz,2=50hz,3=100hz,4=150hz,5=300hz)
SongAddressechoes: 
                    db       $06                          ; $0009: default speed 
                    dw       $0138                        ; $000A: size of instrument table (without this word pointer) 
                    dw       instrument0echoes            ; $000C: [$0020] pointer to instrument 0 
                    dw       instrument1echoes            ; $000E: [$0029] pointer to instrument 1 
                    dw       instrument2echoes            ; $0010: [$0059] pointer to instrument 2 
                    dw       instrument3echoes            ; $0012: [$006F] pointer to instrument 3 
                    dw       instrument4echoes            ; $0014: [$0080] pointer to instrument 4 
                    dw       instrument5echoes            ; $0016: [$0097] pointer to instrument 5 
                    dw       instrument6echoes            ; $0018: [$00B4] pointer to instrument 6 
                    dw       instrument7echoes            ; $001A: [$00CB] pointer to instrument 7 
                    dw       instrument8echoes            ; $001C: [$00DA] pointer to instrument 8 
                    dw       instrument9echoes            ; $001E: [$012D] pointer to instrument 9 
instrument0echoes: 
                    db       $00                          ; $0020: speed 
                    db       $00                          ; $0021: retrig 
instrument0loopechoes: 
                    db       $00                          ; $0022: dataColumn_0 (non hard), vol=$0 
                    db       $00                          ; $0023: dataColumn_0 (non hard), vol=$0 
                    db       $00                          ; $0024: dataColumn_0 (non hard), vol=$0 
                    db       $00                          ; $0025: dataColumn_0 (non hard), vol=$0 
                    db       $0D                          ; $0026: dataColumn_0 (hard) 
                    dw       instrument0loopechoes        ; $0027: [$0022] loop 
instrument1echoes: 
                    db       $01                          ; $0029: speed 
                    db       $00                          ; $002A: retrig 
                    db       $BC                          ; $002B: dataColumn_0 (non hard), vol=$F 
                    dw       $FFFF                        ; $002C: pitch 
                    db       $38                          ; $002E: dataColumn_0 (non hard), vol=$E 
                    db       $A4                          ; $002F: dataColumn_0 (non hard), vol=$9 
                    dw       $FFFF                        ; $0030: pitch 
                    db       $2C                          ; $0032: dataColumn_0 (non hard), vol=$B 
                    db       $B0                          ; $0033: dataColumn_0 (non hard), vol=$C 
                    dw       $0001                        ; $0034: pitch 
                    db       $30                          ; $0036: dataColumn_0 (non hard), vol=$C 
                    db       $B0                          ; $0037: dataColumn_0 (non hard), vol=$C 
                    dw       $FFFF                        ; $0038: pitch 
                    db       $30                          ; $003A: dataColumn_0 (non hard), vol=$C 
                    db       $B0                          ; $003B: dataColumn_0 (non hard), vol=$C 
                    dw       $FFFF                        ; $003C: pitch 
                    db       $B0                          ; $003E: dataColumn_0 (non hard), vol=$C 
                    dw       $FFFF                        ; $003F: pitch 
instrument1loopechoes: 
                    db       $2C                          ; $0041: dataColumn_0 (non hard), vol=$B 
                    db       $30                          ; $0042: dataColumn_0 (non hard), vol=$C 
                    db       $AC                          ; $0043: dataColumn_0 (non hard), vol=$B 
                    dw       $FFFF                        ; $0044: pitch 
                    db       $2C                          ; $0046: dataColumn_0 (non hard), vol=$B 
                    db       $30                          ; $0047: dataColumn_0 (non hard), vol=$C 
                    db       $B0                          ; $0048: dataColumn_0 (non hard), vol=$C 
                    dw       $0001                        ; $0049: pitch 
                    db       $2C                          ; $004B: dataColumn_0 (non hard), vol=$B 
                    db       $2C                          ; $004C: dataColumn_0 (non hard), vol=$B 
                    db       $2C                          ; $004D: dataColumn_0 (non hard), vol=$B 
                    db       $AC                          ; $004E: dataColumn_0 (non hard), vol=$B 
                    dw       $FFFF                        ; $004F: pitch 
                    db       $2C                          ; $0051: dataColumn_0 (non hard), vol=$B 
                    db       $2C                          ; $0052: dataColumn_0 (non hard), vol=$B 
                    db       $AC                          ; $0053: dataColumn_0 (non hard), vol=$B 
                    dw       $0001                        ; $0054: pitch 
                    db       $0D                          ; $0056: dataColumn_0 (hard) 
                    dw       instrument1loopechoes        ; $0057: [$0041] loop 
instrument2echoes: 
                    db       $01                          ; $0059: speed 
                    db       $00                          ; $005A: retrig 
                    db       $30                          ; $005B: dataColumn_0 (non hard), vol=$C 
                    db       $3C                          ; $005C: dataColumn_0 (non hard), vol=$F 
                    db       $38                          ; $005D: dataColumn_0 (non hard), vol=$E 
                    db       $30                          ; $005E: dataColumn_0 (non hard), vol=$C 
                    db       $30                          ; $005F: dataColumn_0 (non hard), vol=$C 
                    db       $30                          ; $0060: dataColumn_0 (non hard), vol=$C 
                    db       $30                          ; $0061: dataColumn_0 (non hard), vol=$C 
                    db       $2C                          ; $0062: dataColumn_0 (non hard), vol=$B 
                    db       $30                          ; $0063: dataColumn_0 (non hard), vol=$C 
                    db       $2C                          ; $0064: dataColumn_0 (non hard), vol=$B 
                    db       $2C                          ; $0065: dataColumn_0 (non hard), vol=$B 
                    db       $28                          ; $0066: dataColumn_0 (non hard), vol=$A 
                    db       $28                          ; $0067: dataColumn_0 (non hard), vol=$A 
                    db       $20                          ; $0068: dataColumn_0 (non hard), vol=$8 
                    db       $20                          ; $0069: dataColumn_0 (non hard), vol=$8 
                    db       $18                          ; $006A: dataColumn_0 (non hard), vol=$6 
                    db       $14                          ; $006B: dataColumn_0 (non hard), vol=$5 
                    db       $0D                          ; $006C: dataColumn_0 (hard) 
                    dw       instrument0loopechoes        ; $006D: [$0022] loop 
instrument3echoes: 
                    db       $02                          ; $006F: speed 
                    db       $00                          ; $0070: retrig 
                    db       $78                          ; $0071: dataColumn_0 (non hard), vol=$E 
                    db       $0C                          ; $0072: arpegio 
                    db       $70                          ; $0073: dataColumn_0 (non hard), vol=$C 
                    db       $04                          ; $0074: arpegio 
                    db       $6C                          ; $0075: dataColumn_0 (non hard), vol=$B 
                    db       $07                          ; $0076: arpegio 
                    db       $68                          ; $0077: dataColumn_0 (non hard), vol=$A 
                    db       $0C                          ; $0078: arpegio 
                    db       $64                          ; $0079: dataColumn_0 (non hard), vol=$9 
                    db       $04                          ; $007A: arpegio 
                    db       $64                          ; $007B: dataColumn_0 (non hard), vol=$9 
                    db       $07                          ; $007C: arpegio 
                    db       $0D                          ; $007D: dataColumn_0 (hard) 
                    dw       instrument0loopechoes        ; $007E: [$0022] loop 
instrument4echoes: 
                    db       $01                          ; $0080: speed 
                    db       $00                          ; $0081: retrig 
                    db       $36                          ; $0082: dataColumn_0 (non hard), vol=$D 
                    db       $37                          ; $0083: dataColumn_1, noise=$17 
                    db       $3C                          ; $0084: dataColumn_0 (non hard), vol=$F 
                    db       $38                          ; $0085: dataColumn_0 (non hard), vol=$E 
                    db       $30                          ; $0086: dataColumn_0 (non hard), vol=$C 
                    db       $30                          ; $0087: dataColumn_0 (non hard), vol=$C 
                    db       $30                          ; $0088: dataColumn_0 (non hard), vol=$C 
                    db       $30                          ; $0089: dataColumn_0 (non hard), vol=$C 
                    db       $2C                          ; $008A: dataColumn_0 (non hard), vol=$B 
                    db       $30                          ; $008B: dataColumn_0 (non hard), vol=$C 
                    db       $2C                          ; $008C: dataColumn_0 (non hard), vol=$B 
                    db       $2C                          ; $008D: dataColumn_0 (non hard), vol=$B 
                    db       $28                          ; $008E: dataColumn_0 (non hard), vol=$A 
                    db       $28                          ; $008F: dataColumn_0 (non hard), vol=$A 
                    db       $20                          ; $0090: dataColumn_0 (non hard), vol=$8 
                    db       $20                          ; $0091: dataColumn_0 (non hard), vol=$8 
                    db       $18                          ; $0092: dataColumn_0 (non hard), vol=$6 
                    db       $14                          ; $0093: dataColumn_0 (non hard), vol=$5 
                    db       $0D                          ; $0094: dataColumn_0 (hard) 
                    dw       instrument0loopechoes        ; $0095: [$0022] loop 
instrument5echoes: 
                    db       $01                          ; $0097: speed 
                    db       $00                          ; $0098: retrig 
                    db       $7E                          ; $0099: dataColumn_0 (non hard), vol=$F 
                    db       $3F                          ; $009A: dataColumn_1, noise=$1F 
                    db       $18                          ; $009B: arpegio 
                    db       $7C                          ; $009C: dataColumn_0 (non hard), vol=$F 
                    db       $1C                          ; $009D: arpegio 
                    db       $00                          ; $009E: dataColumn_0 (non hard), vol=$0 
                    db       $6E                          ; $009F: dataColumn_0 (non hard), vol=$B 
                    db       $3F                          ; $00A0: dataColumn_1, noise=$1F 
                    db       $1A                          ; $00A1: arpegio 
                    db       $00                          ; $00A2: dataColumn_0 (non hard), vol=$0 
                    db       $68                          ; $00A3: dataColumn_0 (non hard), vol=$A 
                    db       $1A                          ; $00A4: arpegio 
                    db       $50                          ; $00A5: dataColumn_0 (non hard), vol=$4 
                    db       $18                          ; $00A6: arpegio 
                    db       $6C                          ; $00A7: dataColumn_0 (non hard), vol=$B 
                    db       $18                          ; $00A8: arpegio 
                    db       $60                          ; $00A9: dataColumn_0 (non hard), vol=$8 
                    db       $1A                          ; $00AA: arpegio 
                    db       $58                          ; $00AB: dataColumn_0 (non hard), vol=$6 
                    db       $18                          ; $00AC: arpegio 
                    db       $54                          ; $00AD: dataColumn_0 (non hard), vol=$5 
                    db       $1A                          ; $00AE: arpegio 
                    db       $50                          ; $00AF: dataColumn_0 (non hard), vol=$4 
                    db       $18                          ; $00B0: arpegio 
                    db       $0D                          ; $00B1: dataColumn_0 (hard) 
                    dw       instrument0loopechoes        ; $00B2: [$0022] loop 
instrument6echoes: 
                    db       $01                          ; $00B4: speed 
                    db       $00                          ; $00B5: retrig 
                    db       $2A                          ; $00B6: dataColumn_0 (non hard), vol=$A 
                    db       $01                          ; $00B7: dataColumn_1, noise=$01 
                    db       $3C                          ; $00B8: dataColumn_0 (non hard), vol=$F 
                    db       $38                          ; $00B9: dataColumn_0 (non hard), vol=$E 
                    db       $30                          ; $00BA: dataColumn_0 (non hard), vol=$C 
                    db       $30                          ; $00BB: dataColumn_0 (non hard), vol=$C 
                    db       $30                          ; $00BC: dataColumn_0 (non hard), vol=$C 
                    db       $30                          ; $00BD: dataColumn_0 (non hard), vol=$C 
                    db       $2C                          ; $00BE: dataColumn_0 (non hard), vol=$B 
                    db       $30                          ; $00BF: dataColumn_0 (non hard), vol=$C 
                    db       $2C                          ; $00C0: dataColumn_0 (non hard), vol=$B 
                    db       $2C                          ; $00C1: dataColumn_0 (non hard), vol=$B 
                    db       $28                          ; $00C2: dataColumn_0 (non hard), vol=$A 
                    db       $28                          ; $00C3: dataColumn_0 (non hard), vol=$A 
                    db       $20                          ; $00C4: dataColumn_0 (non hard), vol=$8 
                    db       $20                          ; $00C5: dataColumn_0 (non hard), vol=$8 
                    db       $18                          ; $00C6: dataColumn_0 (non hard), vol=$6 
                    db       $14                          ; $00C7: dataColumn_0 (non hard), vol=$5 
                    db       $0D                          ; $00C8: dataColumn_0 (hard) 
                    dw       instrument0loopechoes        ; $00C9: [$0022] loop 
instrument7echoes: 
                    db       $02                          ; $00CB: speed 
                    db       $00                          ; $00CC: retrig 
                    db       $78                          ; $00CD: dataColumn_0 (non hard), vol=$E 
                    db       $08                          ; $00CE: arpegio 
                    db       $70                          ; $00CF: dataColumn_0 (non hard), vol=$C 
                    db       $03                          ; $00D0: arpegio 
                    db       $2C                          ; $00D1: dataColumn_0 (non hard), vol=$B 
                    db       $68                          ; $00D2: dataColumn_0 (non hard), vol=$A 
                    db       $08                          ; $00D3: arpegio 
                    db       $64                          ; $00D4: dataColumn_0 (non hard), vol=$9 
                    db       $03                          ; $00D5: arpegio 
                    db       $24                          ; $00D6: dataColumn_0 (non hard), vol=$9 
                    db       $0D                          ; $00D7: dataColumn_0 (hard) 
                    dw       instrument0loopechoes        ; $00D8: [$0022] loop 
instrument8echoes: 
                    db       $02                          ; $00DA: speed 
                    db       $00                          ; $00DB: retrig 
                    db       $BC                          ; $00DC: dataColumn_0 (non hard), vol=$F 
                    dw       $FFFE                        ; $00DD: pitch 
                    db       $30                          ; $00DF: dataColumn_0 (non hard), vol=$C 
                    db       $A8                          ; $00E0: dataColumn_0 (non hard), vol=$A 
                    dw       $0002                        ; $00E1: pitch 
                    db       $24                          ; $00E3: dataColumn_0 (non hard), vol=$9 
                    db       $9C                          ; $00E4: dataColumn_0 (non hard), vol=$7 
                    dw       $FFFF                        ; $00E5: pitch 
                    db       $24                          ; $00E7: dataColumn_0 (non hard), vol=$9 
                    db       $9C                          ; $00E8: dataColumn_0 (non hard), vol=$7 
                    dw       $0001                        ; $00E9: pitch 
                    db       $20                          ; $00EB: dataColumn_0 (non hard), vol=$8 
                    db       $B4                          ; $00EC: dataColumn_0 (non hard), vol=$D 
                    dw       $FFFF                        ; $00ED: pitch 
                    db       $28                          ; $00EF: dataColumn_0 (non hard), vol=$A 
                    db       $A0                          ; $00F0: dataColumn_0 (non hard), vol=$8 
                    dw       $FFFF                        ; $00F1: pitch 
                    db       $1C                          ; $00F3: dataColumn_0 (non hard), vol=$7 
                    db       $A0                          ; $00F4: dataColumn_0 (non hard), vol=$8 
                    dw       $0001                        ; $00F5: pitch 
                    db       $24                          ; $00F7: dataColumn_0 (non hard), vol=$9 
                    db       $A0                          ; $00F8: dataColumn_0 (non hard), vol=$8 
                    dw       $FFFF                        ; $00F9: pitch 
                    db       $20                          ; $00FB: dataColumn_0 (non hard), vol=$8 
                    db       $B0                          ; $00FC: dataColumn_0 (non hard), vol=$C 
                    dw       $0001                        ; $00FD: pitch 
                    db       $24                          ; $00FF: dataColumn_0 (non hard), vol=$9 
                    db       $A0                          ; $0100: dataColumn_0 (non hard), vol=$8 
                    dw       $FFFF                        ; $0101: pitch 
                    db       $1C                          ; $0103: dataColumn_0 (non hard), vol=$7 
                    db       $18                          ; $0104: dataColumn_0 (non hard), vol=$6 
                    db       $98                          ; $0105: dataColumn_0 (non hard), vol=$6 
                    dw       $FFFF                        ; $0106: pitch 
                    db       $9C                          ; $0108: dataColumn_0 (non hard), vol=$7 
                    dw       $0001                        ; $0109: pitch 
                    db       $1C                          ; $010B: dataColumn_0 (non hard), vol=$7 
instrument8loopechoes: 
                    db       $B0                          ; $010C: dataColumn_0 (non hard), vol=$C 
                    dw       $FFFF                        ; $010D: pitch 
                    db       $24                          ; $010F: dataColumn_0 (non hard), vol=$9 
                    db       $A0                          ; $0110: dataColumn_0 (non hard), vol=$8 
                    dw       $FFFF                        ; $0111: pitch 
                    db       $1C                          ; $0113: dataColumn_0 (non hard), vol=$7 
                    db       $9C                          ; $0114: dataColumn_0 (non hard), vol=$7 
                    dw       $0001                        ; $0115: pitch 
                    db       $A0                          ; $0117: dataColumn_0 (non hard), vol=$8 
                    dw       $FFFF                        ; $0118: pitch 
                    db       $1C                          ; $011A: dataColumn_0 (non hard), vol=$7 
                    db       $1C                          ; $011B: dataColumn_0 (non hard), vol=$7 
                    db       $B4                          ; $011C: dataColumn_0 (non hard), vol=$D 
                    dw       $FFFF                        ; $011D: pitch 
                    db       $24                          ; $011F: dataColumn_0 (non hard), vol=$9 
                    db       $A0                          ; $0120: dataColumn_0 (non hard), vol=$8 
                    dw       $0001                        ; $0121: pitch 
                    db       $1C                          ; $0123: dataColumn_0 (non hard), vol=$7 
                    db       $24                          ; $0124: dataColumn_0 (non hard), vol=$9 
                    db       $9C                          ; $0125: dataColumn_0 (non hard), vol=$7 
                    dw       $FFFF                        ; $0126: pitch 
                    db       $20                          ; $0128: dataColumn_0 (non hard), vol=$8 
                    db       $1C                          ; $0129: dataColumn_0 (non hard), vol=$7 
                    db       $0D                          ; $012A: dataColumn_0 (hard) 
                    dw       instrument8loopechoes        ; $012B: [$010C] loop 
instrument9echoes: 
                    db       $01                          ; $012D: speed 
                    db       $00                          ; $012E: retrig 
                    db       $2A                          ; $012F: dataColumn_0 (non hard), vol=$A 
                    db       $01                          ; $0130: dataColumn_1, noise=$01 
                    db       $3C                          ; $0131: dataColumn_0 (non hard), vol=$F 
                    db       $38                          ; $0132: dataColumn_0 (non hard), vol=$E 
                    db       $30                          ; $0133: dataColumn_0 (non hard), vol=$C 
                    db       $30                          ; $0134: dataColumn_0 (non hard), vol=$C 
                    db       $30                          ; $0135: dataColumn_0 (non hard), vol=$C 
                    db       $30                          ; $0136: dataColumn_0 (non hard), vol=$C 
                    db       $2C                          ; $0137: dataColumn_0 (non hard), vol=$B 
                    db       $30                          ; $0138: dataColumn_0 (non hard), vol=$C 
                    db       $2C                          ; $0139: dataColumn_0 (non hard), vol=$B 
                    db       $2C                          ; $013A: dataColumn_0 (non hard), vol=$B 
                    db       $28                          ; $013B: dataColumn_0 (non hard), vol=$A 
                    db       $28                          ; $013C: dataColumn_0 (non hard), vol=$A 
                    db       $20                          ; $013D: dataColumn_0 (non hard), vol=$8 
                    db       $20                          ; $013E: dataColumn_0 (non hard), vol=$8 
                    db       $18                          ; $013F: dataColumn_0 (non hard), vol=$6 
                    db       $14                          ; $0140: dataColumn_0 (non hard), vol=$5 
                    db       $0D                          ; $0141: dataColumn_0 (hard) 
                    dw       instrument0loopechoes        ; $0142: [$0022] loop 
; start of linker definition
linkerechoes: 
                    db       $40                          ; $0144: first height 
                    db       $00                          ; $0145: transposition1 
                    db       $00                          ; $0146: transposition2 
                    db       $00                          ; $0147: transposition3 
                    dw       specialtrackDef0echoes       ; $0148: [$0185] specialTrack 
pattern0Definitionechoes: 
                    db       $00                          ; $014A: pattern 0 state 
                    dw       trackDef0echoes              ; $014B: [$0187] pattern 0, track 1 
                    dw       trackDef1echoes              ; $014D: [$01B2] pattern 0, track 2 
                    dw       trackDef2echoes              ; $014F: [$0240] pattern 0, track 3 
pattern1Definitionechoes: 
                    db       $00                          ; $0151: pattern 1 state 
                    dw       trackDef3echoes              ; $0152: [$02C9] pattern 1, track 1 
                    dw       trackDef4echoes              ; $0154: [$02F0] pattern 1, track 2 
                    dw       trackDef5echoes              ; $0156: [$04A1] pattern 1, track 3 
pattern2Definitionechoes: 
                    db       $00                          ; $0158: pattern 2 state 
                    dw       trackDef0echoes              ; $0159: [$0187] pattern 2, track 1 
                    dw       trackDef1echoes              ; $015B: [$01B2] pattern 2, track 2 
                    dw       trackDef2echoes              ; $015D: [$0240] pattern 2, track 3 
pattern3Definitionechoes: 
                    db       $00                          ; $015F: pattern 3 state 
                    dw       trackDef3echoes              ; $0160: [$02C9] pattern 3, track 1 
                    dw       trackDef4echoes              ; $0162: [$02F0] pattern 3, track 2 
                    dw       trackDef5echoes              ; $0164: [$04A1] pattern 3, track 3 
pattern4Definitionechoes: 
                    db       $00                          ; $0166: pattern 4 state 
                    dw       trackDef8echoes              ; $0167: [$0371] pattern 4, track 1 
                    dw       trackDef9echoes              ; $0169: [$038C] pattern 4, track 2 
                    dw       trackDef10echoes             ; $016B: [$03DF] pattern 4, track 3 
pattern5Definitionechoes: 
                    db       $00                          ; $016D: pattern 5 state 
                    dw       trackDef11echoes             ; $016E: [$03A9] pattern 5, track 1 
                    dw       trackDef12echoes             ; $0170: [$048C] pattern 5, track 2 
                    dw       trackDef13echoes             ; $0172: [$052A] pattern 5, track 3 
pattern6Definitionechoes: 
                    db       $00                          ; $0174: pattern 6 state 
                    dw       trackDef8echoes              ; $0175: [$0371] pattern 6, track 1 
                    dw       trackDef9echoes              ; $0177: [$038C] pattern 6, track 2 
                    dw       trackDef10echoes             ; $0179: [$03DF] pattern 6, track 3 
pattern7Definitionechoes: 
                    db       $00                          ; $017B: pattern 7 state 
                    dw       trackDef15echoes             ; $017C: [$0470] pattern 7, track 1 
                    dw       trackDef16echoes             ; $017E: [$03CA] pattern 7, track 2 
                    dw       trackDef13echoes             ; $0180: [$052A] pattern 7, track 3 
pattern8Definitionechoes: 
                    db       $01                          ; $0182: pattern 8 state 
                    dw       pattern0Definitionechoes     ; $0183: [$014A] song restart address 
specialtrackDef0echoes: 
                    db       $19                          ; $0185: data, speed 6 
                    db       $00                          ; $0186: wait 128 
trackDef0echoes: 
                    db       $AC                          ; $0187: normal track data 
                    db       $E1                          ; $0188: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $0189: pitch 
                    db       $01                          ; $018B: instrument 
                    db       $42                          ; $018C: normal track data, note: C0 
                    db       $05                          ; $018D: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $AC                          ; $018E: normal track data 
                    db       $41                          ; $018F: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $0190: normal track data, wait 0 
                    db       $77                          ; $0191: full optimization, no escape: A#4 
                    db       $02                          ; $0192: normal track data, wait 0 
                    db       $7B                          ; $0193: full optimization, no escape: C5 
                    db       $18                          ; $0194: normal track data, wait 11 
                    db       $42                          ; $0195: normal track data 
                    db       $03                          ; $0196: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $0197: normal track data, wait 0 
                    db       $42                          ; $0198: normal track data, note: C0 
                    db       $05                          ; $0199: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $BA                          ; $019A: normal track data 
                    db       $41                          ; $019B: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $7F                          ; $019C: full optimization, no escape: D5 
                    db       $81                          ; $019D: full optimization, no escape: D#5 
                    db       $04                          ; $019E: normal track data, wait 1 
                    db       $7F                          ; $019F: full optimization, no escape: D5 
                    db       $04                          ; $01A0: normal track data, wait 1 
                    db       $7B                          ; $01A1: full optimization, no escape: C5 
                    db       $02                          ; $01A2: normal track data, wait 0 
                    db       $7F                          ; $01A3: full optimization, no escape: D5 
                    db       $06                          ; $01A4: normal track data, wait 2 
                    db       $77                          ; $01A5: full optimization, no escape: A#4 
                    db       $02                          ; $01A6: normal track data, wait 0 
                    db       $6D                          ; $01A7: full optimization, no escape: F4 
                    db       $22                          ; $01A8: normal track data, wait 16 
                    db       $42                          ; $01A9: normal track data 
                    db       $03                          ; $01AA: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $01AB: normal track data, wait 1 
                    db       $42                          ; $01AC: normal track data, note: C0 
                    db       $05                          ; $01AD: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $01AE: normal track data, wait 1 
                    db       $42                          ; $01AF: normal track data, note: C0 
                    db       $07                          ; $01B0: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $00                          ; $01B1: track end signature found 
trackDef1echoes: 
                    db       $42                          ; $01B2: normal track data 
                    db       $80                          ; $01B3: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $01B4: pitch 
                    db       $02                          ; $01B6: normal track data, wait 0 
                    db       $AC                          ; $01B7: normal track data, note: F4 
                    db       $65                          ; $01B8: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $01                          ; $01B9: instrument 
                    db       $02                          ; $01BA: normal track data, wait 0 
                    db       $6D                          ; $01BB: full optimization, no escape: F4 
                    db       $02                          ; $01BC: normal track data, wait 0 
                    db       $77                          ; $01BD: full optimization, no escape: A#4 
                    db       $02                          ; $01BE: normal track data, wait 0 
                    db       $7B                          ; $01BF: full optimization, no escape: C5 
                    db       $02                          ; $01C0: normal track data, wait 0 
                    db       $42                          ; $01C1: normal track data 
                    db       $80                          ; $01C2: vol off, pitch, no note, no instrument 
                    dw       $FFFF                        ; $01C3: pitch 
                    db       $42                          ; $01C5: normal track data 
                    db       $80                          ; $01C6: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $01C7: pitch 
                    db       $42                          ; $01C9: normal track data 
                    db       $80                          ; $01CA: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $01CB: pitch 
                    db       $02                          ; $01CD: normal track data, wait 0 
                    db       $42                          ; $01CE: normal track data 
                    db       $80                          ; $01CF: vol off, pitch, no note, no instrument 
                    dw       $FFFF                        ; $01D0: pitch 
                    db       $42                          ; $01D2: normal track data 
                    db       $80                          ; $01D3: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $01D4: pitch 
                    db       $42                          ; $01D6: normal track data 
                    db       $80                          ; $01D7: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $01D8: pitch 
                    db       $02                          ; $01DA: normal track data, wait 0 
                    db       $42                          ; $01DB: normal track data 
                    db       $80                          ; $01DC: vol off, pitch, no note, no instrument 
                    dw       $FFFF                        ; $01DD: pitch 
                    db       $42                          ; $01DF: normal track data 
                    db       $80                          ; $01E0: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $01E1: pitch 
                    db       $42                          ; $01E3: normal track data 
                    db       $80                          ; $01E4: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $01E5: pitch 
                    db       $42                          ; $01E7: normal track data, note: C0 
                    db       $07                          ; $01E8: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $01E9: normal track data 
                    db       $09                          ; $01EA: vol = $B (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $01EB: normal track data, wait 0 
                    db       $BA                          ; $01EC: normal track data, note: C5 
                    db       $45                          ; $01ED: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $7F                          ; $01EE: full optimization, no escape: D5 
                    db       $81                          ; $01EF: full optimization, no escape: D#5 
                    db       $04                          ; $01F0: normal track data, wait 1 
                    db       $7F                          ; $01F1: full optimization, no escape: D5 
                    db       $04                          ; $01F2: normal track data, wait 1 
                    db       $7B                          ; $01F3: full optimization, no escape: C5 
                    db       $02                          ; $01F4: normal track data, wait 0 
                    db       $7F                          ; $01F5: full optimization, no escape: D5 
                    db       $06                          ; $01F6: normal track data, wait 2 
                    db       $77                          ; $01F7: full optimization, no escape: A#4 
                    db       $02                          ; $01F8: normal track data, wait 0 
                    db       $6D                          ; $01F9: full optimization, no escape: F4 
                    db       $02                          ; $01FA: normal track data, wait 0 
                    db       $42                          ; $01FB: normal track data 
                    db       $80                          ; $01FC: vol off, pitch, no note, no instrument 
                    dw       $FFFF                        ; $01FD: pitch 
                    db       $42                          ; $01FF: normal track data 
                    db       $80                          ; $0200: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $0201: pitch 
                    db       $42                          ; $0203: normal track data 
                    db       $80                          ; $0204: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $0205: pitch 
                    db       $42                          ; $0207: normal track data 
                    db       $80                          ; $0208: vol off, pitch, no note, no instrument 
                    dw       $FFFF                        ; $0209: pitch 
                    db       $42                          ; $020B: normal track data 
                    db       $80                          ; $020C: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $020D: pitch 
                    db       $42                          ; $020F: normal track data 
                    db       $80                          ; $0210: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $0211: pitch 
                    db       $42                          ; $0213: normal track data 
                    db       $80                          ; $0214: vol off, pitch, no note, no instrument 
                    dw       $FFFF                        ; $0215: pitch 
                    db       $42                          ; $0217: normal track data 
                    db       $80                          ; $0218: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $0219: pitch 
                    db       $42                          ; $021B: normal track data 
                    db       $80                          ; $021C: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $021D: pitch 
                    db       $02                          ; $021F: normal track data, wait 0 
                    db       $42                          ; $0220: normal track data 
                    db       $80                          ; $0221: vol off, pitch, no note, no instrument 
                    dw       $FFFF                        ; $0222: pitch 
                    db       $42                          ; $0224: normal track data 
                    db       $80                          ; $0225: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $0226: pitch 
                    db       $42                          ; $0228: normal track data 
                    db       $80                          ; $0229: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $022A: pitch 
                    db       $42                          ; $022C: normal track data 
                    db       $80                          ; $022D: vol off, pitch, no note, no instrument 
                    dw       $FFFF                        ; $022E: pitch 
                    db       $42                          ; $0230: normal track data 
                    db       $80                          ; $0231: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $0232: pitch 
                    db       $42                          ; $0234: normal track data 
                    db       $80                          ; $0235: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $0236: pitch 
                    db       $42                          ; $0238: normal track data, note: C0 
                    db       $07                          ; $0239: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $023A: normal track data, wait 1 
                    db       $42                          ; $023B: normal track data 
                    db       $09                          ; $023C: vol = $B (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $023D: normal track data, wait 0 
                    db       $42                          ; $023E: normal track data 
                    db       $0B                          ; $023F: vol = $A (inverted), no pitch, no note, no instrument 
trackDef2echoes: 
                    db       $6A                          ; $0240: normal track data 
                    db       $E1                          ; $0241: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $0242: pitch 
                    db       $02                          ; $0244: instrument 
                    db       $42                          ; $0245: normal track data 
                    db       $00                          ; $0246: vol off, no pitch, no note, no instrument 
                    db       $43                          ; $0247: full optimization, no escape: G#2 
                    db       $02                          ; $0248: normal track data, wait 0 
                    db       $9A                          ; $0249: normal track data 
                    db       $60                          ; $024A: vol off, no pitch, note, instrument 
                    db       $03                          ; $024B: instrument 
                    db       $42                          ; $024C: normal track data 
                    db       $00                          ; $024D: vol off, no pitch, no note, no instrument 
                    db       $6A                          ; $024E: normal track data 
                    db       $60                          ; $024F: vol off, no pitch, note, instrument 
                    db       $04                          ; $0250: instrument 
                    db       $42                          ; $0251: normal track data 
                    db       $00                          ; $0252: vol off, no pitch, no note, no instrument 
                    db       $54                          ; $0253: normal track data 
                    db       $60                          ; $0254: vol off, no pitch, note, instrument 
                    db       $05                          ; $0255: instrument 
                    db       $42                          ; $0256: normal track data 
                    db       $00                          ; $0257: vol off, no pitch, no note, no instrument 
                    db       $9A                          ; $0258: normal track data 
                    db       $60                          ; $0259: vol off, no pitch, note, instrument 
                    db       $03                          ; $025A: instrument 
                    db       $42                          ; $025B: normal track data 
                    db       $00                          ; $025C: vol off, no pitch, no note, no instrument 
                    db       $66                          ; $025D: normal track data 
                    db       $60                          ; $025E: vol off, no pitch, note, instrument 
                    db       $06                          ; $025F: instrument 
                    db       $42                          ; $0260: normal track data 
                    db       $00                          ; $0261: vol off, no pitch, no note, no instrument 
                    db       $43                          ; $0262: full optimization, no escape: G#2 
                    db       $42                          ; $0263: normal track data 
                    db       $00                          ; $0264: vol off, no pitch, no note, no instrument 
                    db       $6A                          ; $0265: normal track data 
                    db       $60                          ; $0266: vol off, no pitch, note, instrument 
                    db       $02                          ; $0267: instrument 
                    db       $42                          ; $0268: normal track data 
                    db       $00                          ; $0269: vol off, no pitch, no note, no instrument 
                    db       $43                          ; $026A: full optimization, no escape: G#2 
                    db       $42                          ; $026B: normal track data 
                    db       $00                          ; $026C: vol off, no pitch, no note, no instrument 
                    db       $9A                          ; $026D: normal track data 
                    db       $60                          ; $026E: vol off, no pitch, note, instrument 
                    db       $03                          ; $026F: instrument 
                    db       $42                          ; $0270: normal track data 
                    db       $00                          ; $0271: vol off, no pitch, no note, no instrument 
                    db       $6A                          ; $0272: normal track data 
                    db       $60                          ; $0273: vol off, no pitch, note, instrument 
                    db       $04                          ; $0274: instrument 
                    db       $42                          ; $0275: normal track data 
                    db       $00                          ; $0276: vol off, no pitch, no note, no instrument 
                    db       $54                          ; $0277: normal track data 
                    db       $60                          ; $0278: vol off, no pitch, note, instrument 
                    db       $05                          ; $0279: instrument 
                    db       $02                          ; $027A: normal track data, wait 0 
                    db       $9A                          ; $027B: normal track data 
                    db       $60                          ; $027C: vol off, no pitch, note, instrument 
                    db       $03                          ; $027D: instrument 
                    db       $42                          ; $027E: normal track data 
                    db       $00                          ; $027F: vol off, no pitch, no note, no instrument 
                    db       $6A                          ; $0280: normal track data 
                    db       $60                          ; $0281: vol off, no pitch, note, instrument 
                    db       $06                          ; $0282: instrument 
                    db       $42                          ; $0283: normal track data 
                    db       $00                          ; $0284: vol off, no pitch, no note, no instrument 
                    db       $43                          ; $0285: full optimization, no escape: G#2 
                    db       $02                          ; $0286: normal track data, wait 0 
                    db       $6E                          ; $0287: normal track data 
                    db       $60                          ; $0288: vol off, no pitch, note, instrument 
                    db       $02                          ; $0289: instrument 
                    db       $42                          ; $028A: normal track data 
                    db       $00                          ; $028B: vol off, no pitch, no note, no instrument 
                    db       $47                          ; $028C: full optimization, no escape: A#2 
                    db       $02                          ; $028D: normal track data, wait 0 
                    db       $A6                          ; $028E: normal track data 
                    db       $60                          ; $028F: vol off, no pitch, note, instrument 
                    db       $07                          ; $0290: instrument 
                    db       $42                          ; $0291: normal track data 
                    db       $00                          ; $0292: vol off, no pitch, no note, no instrument 
                    db       $6E                          ; $0293: normal track data 
                    db       $60                          ; $0294: vol off, no pitch, note, instrument 
                    db       $04                          ; $0295: instrument 
                    db       $42                          ; $0296: normal track data 
                    db       $00                          ; $0297: vol off, no pitch, no note, no instrument 
                    db       $54                          ; $0298: normal track data 
                    db       $60                          ; $0299: vol off, no pitch, note, instrument 
                    db       $05                          ; $029A: instrument 
                    db       $02                          ; $029B: normal track data, wait 0 
                    db       $A6                          ; $029C: normal track data 
                    db       $60                          ; $029D: vol off, no pitch, note, instrument 
                    db       $07                          ; $029E: instrument 
                    db       $42                          ; $029F: normal track data 
                    db       $00                          ; $02A0: vol off, no pitch, no note, no instrument 
                    db       $6A                          ; $02A1: normal track data 
                    db       $60                          ; $02A2: vol off, no pitch, note, instrument 
                    db       $06                          ; $02A3: instrument 
                    db       $42                          ; $02A4: normal track data 
                    db       $00                          ; $02A5: vol off, no pitch, no note, no instrument 
                    db       $47                          ; $02A6: full optimization, no escape: A#2 
                    db       $02                          ; $02A7: normal track data, wait 0 
                    db       $6E                          ; $02A8: normal track data 
                    db       $60                          ; $02A9: vol off, no pitch, note, instrument 
                    db       $02                          ; $02AA: instrument 
                    db       $02                          ; $02AB: normal track data, wait 0 
                    db       $47                          ; $02AC: full optimization, no escape: A#2 
                    db       $02                          ; $02AD: normal track data, wait 0 
                    db       $A6                          ; $02AE: normal track data 
                    db       $60                          ; $02AF: vol off, no pitch, note, instrument 
                    db       $07                          ; $02B0: instrument 
                    db       $42                          ; $02B1: normal track data 
                    db       $00                          ; $02B2: vol off, no pitch, no note, no instrument 
                    db       $6E                          ; $02B3: normal track data 
                    db       $60                          ; $02B4: vol off, no pitch, note, instrument 
                    db       $04                          ; $02B5: instrument 
                    db       $42                          ; $02B6: normal track data 
                    db       $00                          ; $02B7: vol off, no pitch, no note, no instrument 
                    db       $54                          ; $02B8: normal track data 
                    db       $60                          ; $02B9: vol off, no pitch, note, instrument 
                    db       $05                          ; $02BA: instrument 
                    db       $42                          ; $02BB: normal track data 
                    db       $00                          ; $02BC: vol off, no pitch, no note, no instrument 
                    db       $A6                          ; $02BD: normal track data 
                    db       $60                          ; $02BE: vol off, no pitch, note, instrument 
                    db       $07                          ; $02BF: instrument 
                    db       $42                          ; $02C0: normal track data 
                    db       $00                          ; $02C1: vol off, no pitch, no note, no instrument 
                    db       $6E                          ; $02C2: normal track data 
                    db       $60                          ; $02C3: vol off, no pitch, note, instrument 
                    db       $06                          ; $02C4: instrument 
                    db       $42                          ; $02C5: normal track data 
                    db       $00                          ; $02C6: vol off, no pitch, no note, no instrument 
                    db       $47                          ; $02C7: full optimization, no escape: A#2 
                    db       $00                          ; $02C8: track end signature found 
trackDef3echoes: 
                    db       $AC                          ; $02C9: normal track data 
                    db       $E1                          ; $02CA: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $02CB: pitch 
                    db       $01                          ; $02CD: instrument 
                    db       $42                          ; $02CE: normal track data, note: C0 
                    db       $05                          ; $02CF: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $AC                          ; $02D0: normal track data 
                    db       $41                          ; $02D1: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $02D2: normal track data, wait 0 
                    db       $77                          ; $02D3: full optimization, no escape: A#4 
                    db       $02                          ; $02D4: normal track data, wait 0 
                    db       $7B                          ; $02D5: full optimization, no escape: C5 
                    db       $18                          ; $02D6: normal track data, wait 11 
                    db       $42                          ; $02D7: normal track data 
                    db       $03                          ; $02D8: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $02D9: normal track data, wait 0 
                    db       $42                          ; $02DA: normal track data, note: C0 
                    db       $05                          ; $02DB: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $BA                          ; $02DC: normal track data 
                    db       $41                          ; $02DD: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $7F                          ; $02DE: full optimization, no escape: D5 
                    db       $81                          ; $02DF: full optimization, no escape: D#5 
                    db       $04                          ; $02E0: normal track data, wait 1 
                    db       $7F                          ; $02E1: full optimization, no escape: D5 
                    db       $04                          ; $02E2: normal track data, wait 1 
                    db       $7B                          ; $02E3: full optimization, no escape: C5 
                    db       $02                          ; $02E4: normal track data, wait 0 
                    db       $7F                          ; $02E5: full optimization, no escape: D5 
                    db       $2E                          ; $02E6: normal track data, wait 22 
                    db       $42                          ; $02E7: normal track data 
                    db       $03                          ; $02E8: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $02E9: normal track data, wait 1 
                    db       $42                          ; $02EA: normal track data, note: C0 
                    db       $05                          ; $02EB: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $02EC: normal track data, wait 1 
                    db       $42                          ; $02ED: normal track data, note: C0 
                    db       $07                          ; $02EE: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $00                          ; $02EF: track end signature found 
trackDef4echoes: 
                    db       $42                          ; $02F0: normal track data 
                    db       $80                          ; $02F1: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $02F2: pitch 
                    db       $02                          ; $02F4: normal track data, wait 0 
                    db       $AC                          ; $02F5: normal track data, note: F4 
                    db       $65                          ; $02F6: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $01                          ; $02F7: instrument 
                    db       $02                          ; $02F8: normal track data, wait 0 
                    db       $6D                          ; $02F9: full optimization, no escape: F4 
                    db       $02                          ; $02FA: normal track data, wait 0 
                    db       $77                          ; $02FB: full optimization, no escape: A#4 
                    db       $02                          ; $02FC: normal track data, wait 0 
                    db       $7B                          ; $02FD: full optimization, no escape: C5 
                    db       $02                          ; $02FE: normal track data, wait 0 
                    db       $42                          ; $02FF: normal track data 
                    db       $80                          ; $0300: vol off, pitch, no note, no instrument 
                    dw       $FFFF                        ; $0301: pitch 
                    db       $42                          ; $0303: normal track data 
                    db       $80                          ; $0304: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $0305: pitch 
                    db       $42                          ; $0307: normal track data 
                    db       $80                          ; $0308: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $0309: pitch 
                    db       $02                          ; $030B: normal track data, wait 0 
                    db       $42                          ; $030C: normal track data 
                    db       $80                          ; $030D: vol off, pitch, no note, no instrument 
                    dw       $FFFF                        ; $030E: pitch 
                    db       $42                          ; $0310: normal track data 
                    db       $80                          ; $0311: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $0312: pitch 
                    db       $42                          ; $0314: normal track data 
                    db       $80                          ; $0315: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $0316: pitch 
                    db       $02                          ; $0318: normal track data, wait 0 
                    db       $42                          ; $0319: normal track data 
                    db       $80                          ; $031A: vol off, pitch, no note, no instrument 
                    dw       $FFFF                        ; $031B: pitch 
                    db       $42                          ; $031D: normal track data 
                    db       $80                          ; $031E: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $031F: pitch 
                    db       $42                          ; $0321: normal track data 
                    db       $80                          ; $0322: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $0323: pitch 
                    db       $42                          ; $0325: normal track data, note: C0 
                    db       $07                          ; $0326: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0327: normal track data 
                    db       $09                          ; $0328: vol = $B (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $0329: normal track data, wait 0 
                    db       $BA                          ; $032A: normal track data, note: C5 
                    db       $45                          ; $032B: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $7F                          ; $032C: full optimization, no escape: D5 
                    db       $81                          ; $032D: full optimization, no escape: D#5 
                    db       $04                          ; $032E: normal track data, wait 1 
                    db       $7F                          ; $032F: full optimization, no escape: D5 
                    db       $04                          ; $0330: normal track data, wait 1 
                    db       $7B                          ; $0331: full optimization, no escape: C5 
                    db       $02                          ; $0332: normal track data, wait 0 
                    db       $7F                          ; $0333: full optimization, no escape: D5 
                    db       $02                          ; $0334: normal track data, wait 0 
                    db       $42                          ; $0335: normal track data 
                    db       $80                          ; $0336: vol off, pitch, no note, no instrument 
                    dw       $FFFF                        ; $0337: pitch 
                    db       $42                          ; $0339: normal track data 
                    db       $80                          ; $033A: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $033B: pitch 
                    db       $42                          ; $033D: normal track data 
                    db       $80                          ; $033E: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $033F: pitch 
                    db       $04                          ; $0341: normal track data, wait 1 
                    db       $42                          ; $0342: normal track data 
                    db       $80                          ; $0343: vol off, pitch, no note, no instrument 
                    dw       $FFFF                        ; $0344: pitch 
                    db       $42                          ; $0346: normal track data 
                    db       $80                          ; $0347: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $0348: pitch 
                    db       $42                          ; $034A: normal track data 
                    db       $80                          ; $034B: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $034C: pitch 
                    db       $06                          ; $034E: normal track data, wait 2 
                    db       $42                          ; $034F: normal track data 
                    db       $80                          ; $0350: vol off, pitch, no note, no instrument 
                    dw       $FFFF                        ; $0351: pitch 
                    db       $42                          ; $0353: normal track data 
                    db       $80                          ; $0354: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $0355: pitch 
                    db       $42                          ; $0357: normal track data 
                    db       $80                          ; $0358: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $0359: pitch 
                    db       $06                          ; $035B: normal track data, wait 2 
                    db       $42                          ; $035C: normal track data 
                    db       $80                          ; $035D: vol off, pitch, no note, no instrument 
                    dw       $FFFF                        ; $035E: pitch 
                    db       $42                          ; $0360: normal track data 
                    db       $80                          ; $0361: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $0362: pitch 
                    db       $42                          ; $0364: normal track data 
                    db       $80                          ; $0365: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $0366: pitch 
                    db       $04                          ; $0368: normal track data, wait 1 
                    db       $42                          ; $0369: normal track data, note: C0 
                    db       $07                          ; $036A: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $036B: normal track data, wait 1 
                    db       $42                          ; $036C: normal track data 
                    db       $09                          ; $036D: vol = $B (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $036E: normal track data, wait 0 
                    db       $42                          ; $036F: normal track data 
                    db       $0B                          ; $0370: vol = $A (inverted), no pitch, no note, no instrument 
trackDef8echoes: 
                    db       $C0                          ; $0371: normal track data 
                    db       $E1                          ; $0372: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $0373: pitch 
                    db       $08                          ; $0375: instrument 
                    db       $0E                          ; $0376: normal track data, wait 6 
                    db       $42                          ; $0377: normal track data 
                    db       $03                          ; $0378: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $0E                          ; $0379: normal track data, wait 6 
                    db       $BA                          ; $037A: normal track data 
                    db       $41                          ; $037B: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $0E                          ; $037C: normal track data, wait 6 
                    db       $42                          ; $037D: normal track data 
                    db       $03                          ; $037E: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $0E                          ; $037F: normal track data, wait 6 
                    db       $BE                          ; $0380: normal track data 
                    db       $41                          ; $0381: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $0E                          ; $0382: normal track data, wait 6 
                    db       $42                          ; $0383: normal track data 
                    db       $03                          ; $0384: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $0E                          ; $0385: normal track data, wait 6 
                    db       $AC                          ; $0386: normal track data 
                    db       $41                          ; $0387: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $10                          ; $0388: normal track data, wait 7 
                    db       $42                          ; $0389: normal track data 
                    db       $03                          ; $038A: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $00                          ; $038B: track end signature found 
trackDef9echoes: 
                    db       $BE                          ; $038C: normal track data 
                    db       $E9                          ; $038D: vol = $B (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $038E: pitch 
                    db       $08                          ; $0390: instrument 
                    db       $0E                          ; $0391: normal track data, wait 6 
                    db       $BE                          ; $0392: normal track data 
                    db       $41                          ; $0393: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $0E                          ; $0394: normal track data, wait 6 
                    db       $42                          ; $0395: normal track data 
                    db       $03                          ; $0396: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $0397: normal track data, wait 0 
                    db       $42                          ; $0398: normal track data 
                    db       $00                          ; $0399: vol off, no pitch, no note, no instrument 
                    db       $08                          ; $039A: normal track data, wait 3 
                    db       $42                          ; $039B: normal track data 
                    db       $00                          ; $039C: vol off, no pitch, no note, no instrument 
                    db       $B6                          ; $039D: normal track data 
                    db       $41                          ; $039E: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $0E                          ; $039F: normal track data, wait 6 
                    db       $42                          ; $03A0: normal track data 
                    db       $03                          ; $03A1: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $0E                          ; $03A2: normal track data, wait 6 
                    db       $B6                          ; $03A3: normal track data 
                    db       $41                          ; $03A4: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $0E                          ; $03A5: normal track data, wait 6 
                    db       $42                          ; $03A6: normal track data 
                    db       $03                          ; $03A7: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $00                          ; $03A8: track end signature found 
trackDef11echoes: 
                    db       $42                          ; $03A9: normal track data 
                    db       $80                          ; $03AA: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $03AB: pitch 
                    db       $0E                          ; $03AD: normal track data, wait 6 
                    db       $B2                          ; $03AE: normal track data, note: G#4 
                    db       $65                          ; $03AF: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $08                          ; $03B0: instrument 
                    db       $42                          ; $03B1: normal track data 
                    db       $00                          ; $03B2: vol off, no pitch, no note, no instrument 
                    db       $0C                          ; $03B3: normal track data, wait 5 
                    db       $B6                          ; $03B4: normal track data 
                    db       $41                          ; $03B5: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $0E                          ; $03B6: normal track data, wait 6 
                    db       $C0                          ; $03B7: normal track data, note: D#5 
                    db       $45                          ; $03B8: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $03B9: normal track data 
                    db       $00                          ; $03BA: vol off, no pitch, no note, no instrument 
                    db       $0C                          ; $03BB: normal track data, wait 5 
                    db       $BE                          ; $03BC: normal track data 
                    db       $41                          ; $03BD: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $0A                          ; $03BE: normal track data, wait 4 
                    db       $42                          ; $03BF: normal track data 
                    db       $00                          ; $03C0: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $03C1: normal track data 
                    db       $00                          ; $03C2: vol off, no pitch, no note, no instrument 
                    db       $0C                          ; $03C3: normal track data, wait 5 
                    db       $42                          ; $03C4: normal track data 
                    db       $03                          ; $03C5: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $1A                          ; $03C6: normal track data, wait 12 
                    db       $42                          ; $03C7: normal track data, note: C0 
                    db       $05                          ; $03C8: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $00                          ; $03C9: track end signature found 
trackDef16echoes: 
                    db       $B2                          ; $03CA: normal track data 
                    db       $E1                          ; $03CB: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $03CC: pitch 
                    db       $08                          ; $03CE: instrument 
                    db       $1E                          ; $03CF: normal track data, wait 14 
                    db       $C8                          ; $03D0: normal track data, note: G5 
                    db       $45                          ; $03D1: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $0E                          ; $03D2: normal track data, wait 6 
                    db       $BA                          ; $03D3: normal track data 
                    db       $41                          ; $03D4: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $0E                          ; $03D5: normal track data, wait 6 
                    db       $CE                          ; $03D6: normal track data, note: A#5 
                    db       $45                          ; $03D7: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $12                          ; $03D8: normal track data, wait 8 
                    db       $42                          ; $03D9: normal track data, note: C0 
                    db       $07                          ; $03DA: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $16                          ; $03DB: normal track data, wait 10 
                    db       $42                          ; $03DC: normal track data 
                    db       $09                          ; $03DD: vol = $B (inverted), no pitch, no note, no instrument 
                    db       $00                          ; $03DE: track end signature found 
trackDef10echoes: 
                    db       $6A                          ; $03DF: normal track data 
                    db       $E0                          ; $03E0: vol off, pitch, note, instrument 
                    dw       $0000                        ; $03E1: pitch 
                    db       $04                          ; $03E3: instrument 
                    db       $42                          ; $03E4: normal track data 
                    db       $00                          ; $03E5: vol off, no pitch, no note, no instrument 
                    db       $82                          ; $03E6: normal track data 
                    db       $60                          ; $03E7: vol off, no pitch, note, instrument 
                    db       $02                          ; $03E8: instrument 
                    db       $02                          ; $03E9: normal track data, wait 0 
                    db       $9A                          ; $03EA: normal track data 
                    db       $60                          ; $03EB: vol off, no pitch, note, instrument 
                    db       $03                          ; $03EC: instrument 
                    db       $42                          ; $03ED: normal track data 
                    db       $00                          ; $03EE: vol off, no pitch, no note, no instrument 
                    db       $6A                          ; $03EF: normal track data 
                    db       $60                          ; $03F0: vol off, no pitch, note, instrument 
                    db       $09                          ; $03F1: instrument 
                    db       $42                          ; $03F2: normal track data 
                    db       $00                          ; $03F3: vol off, no pitch, no note, no instrument 
                    db       $54                          ; $03F4: normal track data 
                    db       $60                          ; $03F5: vol off, no pitch, note, instrument 
                    db       $05                          ; $03F6: instrument 
                    db       $42                          ; $03F7: normal track data 
                    db       $00                          ; $03F8: vol off, no pitch, no note, no instrument 
                    db       $9A                          ; $03F9: normal track data 
                    db       $60                          ; $03FA: vol off, no pitch, note, instrument 
                    db       $03                          ; $03FB: instrument 
                    db       $42                          ; $03FC: normal track data 
                    db       $00                          ; $03FD: vol off, no pitch, no note, no instrument 
                    db       $66                          ; $03FE: normal track data 
                    db       $60                          ; $03FF: vol off, no pitch, note, instrument 
                    db       $02                          ; $0400: instrument 
                    db       $42                          ; $0401: normal track data 
                    db       $00                          ; $0402: vol off, no pitch, no note, no instrument 
                    db       $43                          ; $0403: full optimization, no escape: G#2 
                    db       $42                          ; $0404: normal track data 
                    db       $00                          ; $0405: vol off, no pitch, no note, no instrument 
                    db       $6A                          ; $0406: normal track data 
                    db       $60                          ; $0407: vol off, no pitch, note, instrument 
                    db       $04                          ; $0408: instrument 
                    db       $42                          ; $0409: normal track data 
                    db       $00                          ; $040A: vol off, no pitch, no note, no instrument 
                    db       $82                          ; $040B: normal track data 
                    db       $60                          ; $040C: vol off, no pitch, note, instrument 
                    db       $02                          ; $040D: instrument 
                    db       $42                          ; $040E: normal track data 
                    db       $00                          ; $040F: vol off, no pitch, no note, no instrument 
                    db       $9A                          ; $0410: normal track data 
                    db       $60                          ; $0411: vol off, no pitch, note, instrument 
                    db       $03                          ; $0412: instrument 
                    db       $42                          ; $0413: normal track data 
                    db       $00                          ; $0414: vol off, no pitch, no note, no instrument 
                    db       $6A                          ; $0415: normal track data 
                    db       $60                          ; $0416: vol off, no pitch, note, instrument 
                    db       $09                          ; $0417: instrument 
                    db       $42                          ; $0418: normal track data 
                    db       $00                          ; $0419: vol off, no pitch, no note, no instrument 
                    db       $54                          ; $041A: normal track data 
                    db       $60                          ; $041B: vol off, no pitch, note, instrument 
                    db       $05                          ; $041C: instrument 
                    db       $02                          ; $041D: normal track data, wait 0 
                    db       $9A                          ; $041E: normal track data 
                    db       $60                          ; $041F: vol off, no pitch, note, instrument 
                    db       $03                          ; $0420: instrument 
                    db       $42                          ; $0421: normal track data 
                    db       $00                          ; $0422: vol off, no pitch, no note, no instrument 
                    db       $6A                          ; $0423: normal track data 
                    db       $60                          ; $0424: vol off, no pitch, note, instrument 
                    db       $02                          ; $0425: instrument 
                    db       $42                          ; $0426: normal track data 
                    db       $00                          ; $0427: vol off, no pitch, no note, no instrument 
                    db       $43                          ; $0428: full optimization, no escape: G#2 
                    db       $02                          ; $0429: normal track data, wait 0 
                    db       $6E                          ; $042A: normal track data 
                    db       $60                          ; $042B: vol off, no pitch, note, instrument 
                    db       $04                          ; $042C: instrument 
                    db       $42                          ; $042D: normal track data 
                    db       $00                          ; $042E: vol off, no pitch, no note, no instrument 
                    db       $86                          ; $042F: normal track data 
                    db       $60                          ; $0430: vol off, no pitch, note, instrument 
                    db       $02                          ; $0431: instrument 
                    db       $02                          ; $0432: normal track data, wait 0 
                    db       $A6                          ; $0433: normal track data 
                    db       $60                          ; $0434: vol off, no pitch, note, instrument 
                    db       $07                          ; $0435: instrument 
                    db       $42                          ; $0436: normal track data 
                    db       $00                          ; $0437: vol off, no pitch, no note, no instrument 
                    db       $6E                          ; $0438: normal track data 
                    db       $60                          ; $0439: vol off, no pitch, note, instrument 
                    db       $09                          ; $043A: instrument 
                    db       $42                          ; $043B: normal track data 
                    db       $00                          ; $043C: vol off, no pitch, no note, no instrument 
                    db       $54                          ; $043D: normal track data 
                    db       $60                          ; $043E: vol off, no pitch, note, instrument 
                    db       $05                          ; $043F: instrument 
                    db       $02                          ; $0440: normal track data, wait 0 
                    db       $A6                          ; $0441: normal track data 
                    db       $60                          ; $0442: vol off, no pitch, note, instrument 
                    db       $07                          ; $0443: instrument 
                    db       $42                          ; $0444: normal track data 
                    db       $00                          ; $0445: vol off, no pitch, no note, no instrument 
                    db       $6A                          ; $0446: normal track data 
                    db       $60                          ; $0447: vol off, no pitch, note, instrument 
                    db       $02                          ; $0448: instrument 
                    db       $42                          ; $0449: normal track data 
                    db       $00                          ; $044A: vol off, no pitch, no note, no instrument 
                    db       $47                          ; $044B: full optimization, no escape: A#2 
                    db       $02                          ; $044C: normal track data, wait 0 
                    db       $6E                          ; $044D: normal track data 
                    db       $60                          ; $044E: vol off, no pitch, note, instrument 
                    db       $04                          ; $044F: instrument 
                    db       $02                          ; $0450: normal track data, wait 0 
                    db       $86                          ; $0451: normal track data 
                    db       $60                          ; $0452: vol off, no pitch, note, instrument 
                    db       $02                          ; $0453: instrument 
                    db       $02                          ; $0454: normal track data, wait 0 
                    db       $A6                          ; $0455: normal track data 
                    db       $60                          ; $0456: vol off, no pitch, note, instrument 
                    db       $07                          ; $0457: instrument 
                    db       $42                          ; $0458: normal track data 
                    db       $00                          ; $0459: vol off, no pitch, no note, no instrument 
                    db       $6E                          ; $045A: normal track data 
                    db       $60                          ; $045B: vol off, no pitch, note, instrument 
                    db       $09                          ; $045C: instrument 
                    db       $42                          ; $045D: normal track data 
                    db       $00                          ; $045E: vol off, no pitch, no note, no instrument 
                    db       $54                          ; $045F: normal track data 
                    db       $60                          ; $0460: vol off, no pitch, note, instrument 
                    db       $05                          ; $0461: instrument 
                    db       $42                          ; $0462: normal track data 
                    db       $00                          ; $0463: vol off, no pitch, no note, no instrument 
                    db       $A6                          ; $0464: normal track data 
                    db       $60                          ; $0465: vol off, no pitch, note, instrument 
                    db       $07                          ; $0466: instrument 
                    db       $42                          ; $0467: normal track data 
                    db       $00                          ; $0468: vol off, no pitch, no note, no instrument 
                    db       $6E                          ; $0469: normal track data 
                    db       $60                          ; $046A: vol off, no pitch, note, instrument 
                    db       $02                          ; $046B: instrument 
                    db       $42                          ; $046C: normal track data 
                    db       $00                          ; $046D: vol off, no pitch, no note, no instrument 
                    db       $47                          ; $046E: full optimization, no escape: A#2 
                    db       $00                          ; $046F: track end signature found 
trackDef15echoes: 
                    db       $42                          ; $0470: normal track data 
                    db       $80                          ; $0471: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $0472: pitch 
                    db       $0E                          ; $0474: normal track data, wait 6 
                    db       $CA                          ; $0475: normal track data, note: G#5 
                    db       $65                          ; $0476: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $08                          ; $0477: instrument 
                    db       $42                          ; $0478: normal track data 
                    db       $00                          ; $0479: vol off, no pitch, no note, no instrument 
                    db       $0C                          ; $047A: normal track data, wait 5 
                    db       $B6                          ; $047B: normal track data 
                    db       $41                          ; $047C: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $0E                          ; $047D: normal track data, wait 6 
                    db       $CA                          ; $047E: normal track data, note: G#5 
                    db       $45                          ; $047F: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0480: normal track data 
                    db       $00                          ; $0481: vol off, no pitch, no note, no instrument 
                    db       $0C                          ; $0482: normal track data, wait 5 
                    db       $BE                          ; $0483: normal track data 
                    db       $41                          ; $0484: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $1E                          ; $0485: normal track data, wait 14 
                    db       $42                          ; $0486: normal track data 
                    db       $03                          ; $0487: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $16                          ; $0488: normal track data, wait 10 
                    db       $42                          ; $0489: normal track data, note: C0 
                    db       $05                          ; $048A: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $00                          ; $048B: track end signature found 
trackDef12echoes: 
                    db       $B2                          ; $048C: normal track data 
                    db       $E1                          ; $048D: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $048E: pitch 
                    db       $08                          ; $0490: instrument 
                    db       $1E                          ; $0491: normal track data, wait 14 
                    db       $C8                          ; $0492: normal track data, note: G5 
                    db       $45                          ; $0493: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $0E                          ; $0494: normal track data, wait 6 
                    db       $BA                          ; $0495: normal track data 
                    db       $41                          ; $0496: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $0E                          ; $0497: normal track data, wait 6 
                    db       $B6                          ; $0498: normal track data, note: A#4 
                    db       $45                          ; $0499: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $0E                          ; $049A: normal track data, wait 6 
                    db       $42                          ; $049B: normal track data, note: C0 
                    db       $07                          ; $049C: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $18                          ; $049D: normal track data, wait 11 
                    db       $42                          ; $049E: normal track data 
                    db       $09                          ; $049F: vol = $B (inverted), no pitch, no note, no instrument 
                    db       $00                          ; $04A0: track end signature found 
trackDef5echoes: 
                    db       $6A                          ; $04A1: normal track data 
                    db       $E0                          ; $04A2: vol off, pitch, note, instrument 
                    dw       $0000                        ; $04A3: pitch 
                    db       $02                          ; $04A5: instrument 
                    db       $42                          ; $04A6: normal track data 
                    db       $00                          ; $04A7: vol off, no pitch, no note, no instrument 
                    db       $43                          ; $04A8: full optimization, no escape: G#2 
                    db       $02                          ; $04A9: normal track data, wait 0 
                    db       $9A                          ; $04AA: normal track data 
                    db       $60                          ; $04AB: vol off, no pitch, note, instrument 
                    db       $03                          ; $04AC: instrument 
                    db       $42                          ; $04AD: normal track data 
                    db       $00                          ; $04AE: vol off, no pitch, no note, no instrument 
                    db       $6A                          ; $04AF: normal track data 
                    db       $60                          ; $04B0: vol off, no pitch, note, instrument 
                    db       $04                          ; $04B1: instrument 
                    db       $42                          ; $04B2: normal track data 
                    db       $00                          ; $04B3: vol off, no pitch, no note, no instrument 
                    db       $54                          ; $04B4: normal track data 
                    db       $60                          ; $04B5: vol off, no pitch, note, instrument 
                    db       $05                          ; $04B6: instrument 
                    db       $42                          ; $04B7: normal track data 
                    db       $00                          ; $04B8: vol off, no pitch, no note, no instrument 
                    db       $9A                          ; $04B9: normal track data 
                    db       $60                          ; $04BA: vol off, no pitch, note, instrument 
                    db       $03                          ; $04BB: instrument 
                    db       $42                          ; $04BC: normal track data 
                    db       $00                          ; $04BD: vol off, no pitch, no note, no instrument 
                    db       $66                          ; $04BE: normal track data 
                    db       $60                          ; $04BF: vol off, no pitch, note, instrument 
                    db       $06                          ; $04C0: instrument 
                    db       $42                          ; $04C1: normal track data 
                    db       $00                          ; $04C2: vol off, no pitch, no note, no instrument 
                    db       $43                          ; $04C3: full optimization, no escape: G#2 
                    db       $42                          ; $04C4: normal track data 
                    db       $00                          ; $04C5: vol off, no pitch, no note, no instrument 
                    db       $6A                          ; $04C6: normal track data 
                    db       $60                          ; $04C7: vol off, no pitch, note, instrument 
                    db       $02                          ; $04C8: instrument 
                    db       $42                          ; $04C9: normal track data 
                    db       $00                          ; $04CA: vol off, no pitch, no note, no instrument 
                    db       $43                          ; $04CB: full optimization, no escape: G#2 
                    db       $42                          ; $04CC: normal track data 
                    db       $00                          ; $04CD: vol off, no pitch, no note, no instrument 
                    db       $9A                          ; $04CE: normal track data 
                    db       $60                          ; $04CF: vol off, no pitch, note, instrument 
                    db       $03                          ; $04D0: instrument 
                    db       $42                          ; $04D1: normal track data 
                    db       $00                          ; $04D2: vol off, no pitch, no note, no instrument 
                    db       $6A                          ; $04D3: normal track data 
                    db       $60                          ; $04D4: vol off, no pitch, note, instrument 
                    db       $04                          ; $04D5: instrument 
                    db       $42                          ; $04D6: normal track data 
                    db       $00                          ; $04D7: vol off, no pitch, no note, no instrument 
                    db       $54                          ; $04D8: normal track data 
                    db       $60                          ; $04D9: vol off, no pitch, note, instrument 
                    db       $05                          ; $04DA: instrument 
                    db       $02                          ; $04DB: normal track data, wait 0 
                    db       $9A                          ; $04DC: normal track data 
                    db       $60                          ; $04DD: vol off, no pitch, note, instrument 
                    db       $03                          ; $04DE: instrument 
                    db       $42                          ; $04DF: normal track data 
                    db       $00                          ; $04E0: vol off, no pitch, no note, no instrument 
                    db       $6A                          ; $04E1: normal track data 
                    db       $60                          ; $04E2: vol off, no pitch, note, instrument 
                    db       $06                          ; $04E3: instrument 
                    db       $42                          ; $04E4: normal track data 
                    db       $00                          ; $04E5: vol off, no pitch, no note, no instrument 
                    db       $43                          ; $04E6: full optimization, no escape: G#2 
                    db       $02                          ; $04E7: normal track data, wait 0 
                    db       $6E                          ; $04E8: normal track data 
                    db       $60                          ; $04E9: vol off, no pitch, note, instrument 
                    db       $02                          ; $04EA: instrument 
                    db       $42                          ; $04EB: normal track data 
                    db       $00                          ; $04EC: vol off, no pitch, no note, no instrument 
                    db       $47                          ; $04ED: full optimization, no escape: A#2 
                    db       $02                          ; $04EE: normal track data, wait 0 
                    db       $A6                          ; $04EF: normal track data 
                    db       $60                          ; $04F0: vol off, no pitch, note, instrument 
                    db       $07                          ; $04F1: instrument 
                    db       $42                          ; $04F2: normal track data 
                    db       $00                          ; $04F3: vol off, no pitch, no note, no instrument 
                    db       $6E                          ; $04F4: normal track data 
                    db       $60                          ; $04F5: vol off, no pitch, note, instrument 
                    db       $04                          ; $04F6: instrument 
                    db       $42                          ; $04F7: normal track data 
                    db       $00                          ; $04F8: vol off, no pitch, no note, no instrument 
                    db       $54                          ; $04F9: normal track data 
                    db       $60                          ; $04FA: vol off, no pitch, note, instrument 
                    db       $05                          ; $04FB: instrument 
                    db       $02                          ; $04FC: normal track data, wait 0 
                    db       $A6                          ; $04FD: normal track data 
                    db       $60                          ; $04FE: vol off, no pitch, note, instrument 
                    db       $07                          ; $04FF: instrument 
                    db       $42                          ; $0500: normal track data 
                    db       $00                          ; $0501: vol off, no pitch, no note, no instrument 
                    db       $6A                          ; $0502: normal track data 
                    db       $60                          ; $0503: vol off, no pitch, note, instrument 
                    db       $06                          ; $0504: instrument 
                    db       $42                          ; $0505: normal track data 
                    db       $00                          ; $0506: vol off, no pitch, no note, no instrument 
                    db       $2D                          ; $0507: full optimization, no escape: A1 
                    db       $02                          ; $0508: normal track data, wait 0 
                    db       $6E                          ; $0509: normal track data 
                    db       $60                          ; $050A: vol off, no pitch, note, instrument 
                    db       $02                          ; $050B: instrument 
                    db       $02                          ; $050C: normal track data, wait 0 
                    db       $47                          ; $050D: full optimization, no escape: A#2 
                    db       $02                          ; $050E: normal track data, wait 0 
                    db       $A6                          ; $050F: normal track data 
                    db       $60                          ; $0510: vol off, no pitch, note, instrument 
                    db       $07                          ; $0511: instrument 
                    db       $42                          ; $0512: normal track data 
                    db       $00                          ; $0513: vol off, no pitch, no note, no instrument 
                    db       $6E                          ; $0514: normal track data 
                    db       $60                          ; $0515: vol off, no pitch, note, instrument 
                    db       $04                          ; $0516: instrument 
                    db       $42                          ; $0517: normal track data 
                    db       $00                          ; $0518: vol off, no pitch, no note, no instrument 
                    db       $54                          ; $0519: normal track data 
                    db       $60                          ; $051A: vol off, no pitch, note, instrument 
                    db       $05                          ; $051B: instrument 
                    db       $42                          ; $051C: normal track data 
                    db       $00                          ; $051D: vol off, no pitch, no note, no instrument 
                    db       $A6                          ; $051E: normal track data 
                    db       $60                          ; $051F: vol off, no pitch, note, instrument 
                    db       $07                          ; $0520: instrument 
                    db       $42                          ; $0521: normal track data 
                    db       $00                          ; $0522: vol off, no pitch, no note, no instrument 
                    db       $6E                          ; $0523: normal track data 
                    db       $60                          ; $0524: vol off, no pitch, note, instrument 
                    db       $06                          ; $0525: instrument 
                    db       $42                          ; $0526: normal track data 
                    db       $00                          ; $0527: vol off, no pitch, no note, no instrument 
                    db       $47                          ; $0528: full optimization, no escape: A#2 
                    db       $00                          ; $0529: track end signature found 
trackDef13echoes: 
                    db       $6A                          ; $052A: normal track data 
                    db       $E0                          ; $052B: vol off, pitch, note, instrument 
                    dw       $0000                        ; $052C: pitch 
                    db       $04                          ; $052E: instrument 
                    db       $42                          ; $052F: normal track data 
                    db       $00                          ; $0530: vol off, no pitch, no note, no instrument 
                    db       $82                          ; $0531: normal track data 
                    db       $60                          ; $0532: vol off, no pitch, note, instrument 
                    db       $02                          ; $0533: instrument 
                    db       $02                          ; $0534: normal track data, wait 0 
                    db       $9A                          ; $0535: normal track data 
                    db       $60                          ; $0536: vol off, no pitch, note, instrument 
                    db       $03                          ; $0537: instrument 
                    db       $42                          ; $0538: normal track data 
                    db       $00                          ; $0539: vol off, no pitch, no note, no instrument 
                    db       $6A                          ; $053A: normal track data 
                    db       $60                          ; $053B: vol off, no pitch, note, instrument 
                    db       $09                          ; $053C: instrument 
                    db       $42                          ; $053D: normal track data 
                    db       $00                          ; $053E: vol off, no pitch, no note, no instrument 
                    db       $54                          ; $053F: normal track data 
                    db       $60                          ; $0540: vol off, no pitch, note, instrument 
                    db       $05                          ; $0541: instrument 
                    db       $42                          ; $0542: normal track data 
                    db       $00                          ; $0543: vol off, no pitch, no note, no instrument 
                    db       $9A                          ; $0544: normal track data 
                    db       $60                          ; $0545: vol off, no pitch, note, instrument 
                    db       $03                          ; $0546: instrument 
                    db       $42                          ; $0547: normal track data 
                    db       $00                          ; $0548: vol off, no pitch, no note, no instrument 
                    db       $66                          ; $0549: normal track data 
                    db       $60                          ; $054A: vol off, no pitch, note, instrument 
                    db       $02                          ; $054B: instrument 
                    db       $42                          ; $054C: normal track data 
                    db       $00                          ; $054D: vol off, no pitch, no note, no instrument 
                    db       $43                          ; $054E: full optimization, no escape: G#2 
                    db       $42                          ; $054F: normal track data 
                    db       $00                          ; $0550: vol off, no pitch, no note, no instrument 
                    db       $6A                          ; $0551: normal track data 
                    db       $60                          ; $0552: vol off, no pitch, note, instrument 
                    db       $04                          ; $0553: instrument 
                    db       $42                          ; $0554: normal track data 
                    db       $00                          ; $0555: vol off, no pitch, no note, no instrument 
                    db       $82                          ; $0556: normal track data 
                    db       $60                          ; $0557: vol off, no pitch, note, instrument 
                    db       $02                          ; $0558: instrument 
                    db       $42                          ; $0559: normal track data 
                    db       $00                          ; $055A: vol off, no pitch, no note, no instrument 
                    db       $9A                          ; $055B: normal track data 
                    db       $60                          ; $055C: vol off, no pitch, note, instrument 
                    db       $03                          ; $055D: instrument 
                    db       $42                          ; $055E: normal track data 
                    db       $00                          ; $055F: vol off, no pitch, no note, no instrument 
                    db       $6A                          ; $0560: normal track data 
                    db       $60                          ; $0561: vol off, no pitch, note, instrument 
                    db       $09                          ; $0562: instrument 
                    db       $42                          ; $0563: normal track data 
                    db       $00                          ; $0564: vol off, no pitch, no note, no instrument 
                    db       $54                          ; $0565: normal track data 
                    db       $60                          ; $0566: vol off, no pitch, note, instrument 
                    db       $05                          ; $0567: instrument 
                    db       $02                          ; $0568: normal track data, wait 0 
                    db       $9A                          ; $0569: normal track data 
                    db       $60                          ; $056A: vol off, no pitch, note, instrument 
                    db       $03                          ; $056B: instrument 
                    db       $42                          ; $056C: normal track data 
                    db       $00                          ; $056D: vol off, no pitch, no note, no instrument 
                    db       $6A                          ; $056E: normal track data 
                    db       $60                          ; $056F: vol off, no pitch, note, instrument 
                    db       $02                          ; $0570: instrument 
                    db       $42                          ; $0571: normal track data 
                    db       $00                          ; $0572: vol off, no pitch, no note, no instrument 
                    db       $43                          ; $0573: full optimization, no escape: G#2 
                    db       $02                          ; $0574: normal track data, wait 0 
                    db       $6E                          ; $0575: normal track data 
                    db       $60                          ; $0576: vol off, no pitch, note, instrument 
                    db       $04                          ; $0577: instrument 
                    db       $42                          ; $0578: normal track data 
                    db       $00                          ; $0579: vol off, no pitch, no note, no instrument 
                    db       $86                          ; $057A: normal track data 
                    db       $60                          ; $057B: vol off, no pitch, note, instrument 
                    db       $02                          ; $057C: instrument 
                    db       $02                          ; $057D: normal track data, wait 0 
                    db       $A6                          ; $057E: normal track data 
                    db       $60                          ; $057F: vol off, no pitch, note, instrument 
                    db       $07                          ; $0580: instrument 
                    db       $42                          ; $0581: normal track data 
                    db       $00                          ; $0582: vol off, no pitch, no note, no instrument 
                    db       $6E                          ; $0583: normal track data 
                    db       $60                          ; $0584: vol off, no pitch, note, instrument 
                    db       $09                          ; $0585: instrument 
                    db       $42                          ; $0586: normal track data 
                    db       $00                          ; $0587: vol off, no pitch, no note, no instrument 
                    db       $54                          ; $0588: normal track data 
                    db       $60                          ; $0589: vol off, no pitch, note, instrument 
                    db       $05                          ; $058A: instrument 
                    db       $02                          ; $058B: normal track data, wait 0 
                    db       $A6                          ; $058C: normal track data 
                    db       $60                          ; $058D: vol off, no pitch, note, instrument 
                    db       $07                          ; $058E: instrument 
                    db       $42                          ; $058F: normal track data 
                    db       $00                          ; $0590: vol off, no pitch, no note, no instrument 
                    db       $6A                          ; $0591: normal track data 
                    db       $60                          ; $0592: vol off, no pitch, note, instrument 
                    db       $02                          ; $0593: instrument 
                    db       $42                          ; $0594: normal track data 
                    db       $00                          ; $0595: vol off, no pitch, no note, no instrument 
                    db       $2D                          ; $0596: full optimization, no escape: A1 
                    db       $02                          ; $0597: normal track data, wait 0 
                    db       $6E                          ; $0598: normal track data 
                    db       $60                          ; $0599: vol off, no pitch, note, instrument 
                    db       $04                          ; $059A: instrument 
                    db       $02                          ; $059B: normal track data, wait 0 
                    db       $86                          ; $059C: normal track data 
                    db       $60                          ; $059D: vol off, no pitch, note, instrument 
                    db       $02                          ; $059E: instrument 
                    db       $02                          ; $059F: normal track data, wait 0 
                    db       $A6                          ; $05A0: normal track data 
                    db       $60                          ; $05A1: vol off, no pitch, note, instrument 
                    db       $07                          ; $05A2: instrument 
                    db       $42                          ; $05A3: normal track data 
                    db       $00                          ; $05A4: vol off, no pitch, no note, no instrument 
                    db       $6E                          ; $05A5: normal track data 
                    db       $60                          ; $05A6: vol off, no pitch, note, instrument 
                    db       $09                          ; $05A7: instrument 
                    db       $42                          ; $05A8: normal track data 
                    db       $00                          ; $05A9: vol off, no pitch, no note, no instrument 
                    db       $54                          ; $05AA: normal track data 
                    db       $60                          ; $05AB: vol off, no pitch, note, instrument 
                    db       $05                          ; $05AC: instrument 
                    db       $42                          ; $05AD: normal track data 
                    db       $00                          ; $05AE: vol off, no pitch, no note, no instrument 
                    db       $A6                          ; $05AF: normal track data 
                    db       $60                          ; $05B0: vol off, no pitch, note, instrument 
                    db       $07                          ; $05B1: instrument 
                    db       $42                          ; $05B2: normal track data 
                    db       $00                          ; $05B3: vol off, no pitch, no note, no instrument 
                    db       $6E                          ; $05B4: normal track data 
                    db       $60                          ; $05B5: vol off, no pitch, note, instrument 
                    db       $02                          ; $05B6: instrument 
                    db       $42                          ; $05B7: normal track data 
                    db       $00                          ; $05B8: vol off, no pitch, no note, no instrument 
                    db       $47                          ; $05B9: full optimization, no escape: A#2 
                    db       $00                          ; $05BA: track end signature found 
