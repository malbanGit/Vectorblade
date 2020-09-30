; This file was build using VIDE - Vectrex Integrated Development Environment
; Original bin file was: /Users/chrissalo/NetBeansProjects/Vide/_projects/Vectorblade/Music/hiscore.bin
; 
; offset for AKS file assumed: $0000 guessed by accessing byte data[13] * 256)
; not used by vectrex player and therefor omitted:
;  DB "AT10" ; Signature of Arkos Tracker files
;  DB $01 ; sample channel
;  DB $40, 42, 0f ; YM custom frequence - little endian
;  DB $02 ; Replay frequency (0=13hz,1=25hz,2=50hz,3=100hz,4=150hz,5=300hz)
SongAddresshiScore: 
                    db       $06                          ; $0009: default speed 
                    dw       $019E                        ; $000A: size of instrument table (without this word pointer) 
                    dw       instrument0hiScore           ; $000C: [$001E] pointer to instrument 0 
                    dw       instrument1hiScore           ; $000E: [$0027] pointer to instrument 1 
                    dw       instrument2hiScore           ; $0010: [$0060] pointer to instrument 2 
                    dw       instrument3hiScore           ; $0012: [$0077] pointer to instrument 3 
                    dw       instrument4hiScore           ; $0014: [$007E] pointer to instrument 4 
                    dw       instrument5hiScore           ; $0016: [$00A4] pointer to instrument 5 
                    dw       instrument6hiScore           ; $0018: [$00DB] pointer to instrument 6 
                    dw       instrument7hiScore           ; $001A: [$0112] pointer to instrument 7 
                    dw       instrument8hiScore           ; $001C: [$0149] pointer to instrument 8 
instrument0hiScore: 
                    db       $00                          ; $001E: speed 
                    db       $00                          ; $001F: retrig 
instrument0loophiScore: 
                    db       $00                          ; $0020: dataColumn_0 (non hard), vol=$0 
                    db       $00                          ; $0021: dataColumn_0 (non hard), vol=$0 
                    db       $00                          ; $0022: dataColumn_0 (non hard), vol=$0 
                    db       $00                          ; $0023: dataColumn_0 (non hard), vol=$0 
                    db       $0D                          ; $0024: dataColumn_0 (hard) 
                    dw       instrument0loophiScore       ; $0025: [$0020] loop 
instrument1hiScore: 
                    db       $01                          ; $0027: speed 
                    db       $00                          ; $0028: retrig 
                    db       $BC                          ; $0029: dataColumn_0 (non hard), vol=$F 
                    dw       $FFFF                        ; $002A: pitch 
                    db       $3C                          ; $002C: dataColumn_0 (non hard), vol=$F 
                    db       $BC                          ; $002D: dataColumn_0 (non hard), vol=$F 
                    dw       $FFFF                        ; $002E: pitch 
                    db       $34                          ; $0030: dataColumn_0 (non hard), vol=$D 
                    db       $B8                          ; $0031: dataColumn_0 (non hard), vol=$E 
                    dw       $0001                        ; $0032: pitch 
                    db       $BC                          ; $0034: dataColumn_0 (non hard), vol=$F 
                    dw       $FFFE                        ; $0035: pitch 
                    db       $B8                          ; $0037: dataColumn_0 (non hard), vol=$E 
                    dw       $FFFF                        ; $0038: pitch 
                    db       $38                          ; $003A: dataColumn_0 (non hard), vol=$E 
                    db       $B4                          ; $003B: dataColumn_0 (non hard), vol=$D 
                    dw       $FFFE                        ; $003C: pitch 
                    db       $B4                          ; $003E: dataColumn_0 (non hard), vol=$D 
                    dw       $FFFF                        ; $003F: pitch 
                    db       $30                          ; $0041: dataColumn_0 (non hard), vol=$C 
                    db       $34                          ; $0042: dataColumn_0 (non hard), vol=$D 
                    db       $B4                          ; $0043: dataColumn_0 (non hard), vol=$D 
                    dw       $FFFF                        ; $0044: pitch 
                    db       $34                          ; $0046: dataColumn_0 (non hard), vol=$D 
                    db       $30                          ; $0047: dataColumn_0 (non hard), vol=$C 
                    db       $AC                          ; $0048: dataColumn_0 (non hard), vol=$B 
                    dw       $0002                        ; $0049: pitch 
                    db       $2C                          ; $004B: dataColumn_0 (non hard), vol=$B 
                    db       $AC                          ; $004C: dataColumn_0 (non hard), vol=$B 
                    dw       $FFFE                        ; $004D: pitch 
                    db       $2C                          ; $004F: dataColumn_0 (non hard), vol=$B 
                    db       $A8                          ; $0050: dataColumn_0 (non hard), vol=$A 
                    dw       $FFFF                        ; $0051: pitch 
                    db       $28                          ; $0053: dataColumn_0 (non hard), vol=$A 
                    db       $28                          ; $0054: dataColumn_0 (non hard), vol=$A 
                    db       $A8                          ; $0055: dataColumn_0 (non hard), vol=$A 
                    dw       $FFFF                        ; $0056: pitch 
                    db       $24                          ; $0058: dataColumn_0 (non hard), vol=$9 
                    db       $20                          ; $0059: dataColumn_0 (non hard), vol=$8 
                    db       $1C                          ; $005A: dataColumn_0 (non hard), vol=$7 
                    db       $18                          ; $005B: dataColumn_0 (non hard), vol=$6 
                    db       $14                          ; $005C: dataColumn_0 (non hard), vol=$5 
                    db       $0D                          ; $005D: dataColumn_0 (hard) 
                    dw       instrument0loophiScore       ; $005E: [$0020] loop 
instrument2hiScore: 
                    db       $01                          ; $0060: speed 
                    db       $00                          ; $0061: retrig 
                    db       $32                          ; $0062: dataColumn_0 (non hard), vol=$C 
                    db       $01                          ; $0063: dataColumn_1, noise=$01 
                    db       $3C                          ; $0064: dataColumn_0 (non hard), vol=$F 
                    db       $38                          ; $0065: dataColumn_0 (non hard), vol=$E 
                    db       $30                          ; $0066: dataColumn_0 (non hard), vol=$C 
                    db       $30                          ; $0067: dataColumn_0 (non hard), vol=$C 
                    db       $30                          ; $0068: dataColumn_0 (non hard), vol=$C 
                    db       $30                          ; $0069: dataColumn_0 (non hard), vol=$C 
                    db       $2C                          ; $006A: dataColumn_0 (non hard), vol=$B 
                    db       $30                          ; $006B: dataColumn_0 (non hard), vol=$C 
                    db       $2C                          ; $006C: dataColumn_0 (non hard), vol=$B 
                    db       $2C                          ; $006D: dataColumn_0 (non hard), vol=$B 
                    db       $28                          ; $006E: dataColumn_0 (non hard), vol=$A 
                    db       $28                          ; $006F: dataColumn_0 (non hard), vol=$A 
                    db       $20                          ; $0070: dataColumn_0 (non hard), vol=$8 
                    db       $20                          ; $0071: dataColumn_0 (non hard), vol=$8 
                    db       $18                          ; $0072: dataColumn_0 (non hard), vol=$6 
                    db       $14                          ; $0073: dataColumn_0 (non hard), vol=$5 
                    db       $0D                          ; $0074: dataColumn_0 (hard) 
                    dw       instrument0loophiScore       ; $0075: [$0020] loop 
instrument3hiScore: 
                    db       $01                          ; $0077: speed 
                    db       $00                          ; $0078: retrig 
                    db       $32                          ; $0079: dataColumn_0 (non hard), vol=$C 
                    db       $01                          ; $007A: dataColumn_1, noise=$01 
                    db       $0D                          ; $007B: dataColumn_0 (hard) 
                    dw       instrument0loophiScore       ; $007C: [$0020] loop 
instrument4hiScore: 
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
                    dw       instrument0loophiScore       ; $00A2: [$0020] loop 
instrument5hiScore: 
                    db       $02                          ; $00A4: speed 
                    db       $00                          ; $00A5: retrig 
                    db       $7C                          ; $00A6: dataColumn_0 (non hard), vol=$F 
                    db       $07                          ; $00A7: arpegio 
                    db       $78                          ; $00A8: dataColumn_0 (non hard), vol=$E 
                    db       $03                          ; $00A9: arpegio 
                    db       $30                          ; $00AA: dataColumn_0 (non hard), vol=$C 
                    db       $70                          ; $00AB: dataColumn_0 (non hard), vol=$C 
                    db       $07                          ; $00AC: arpegio 
                    db       $74                          ; $00AD: dataColumn_0 (non hard), vol=$D 
                    db       $03                          ; $00AE: arpegio 
                    db       $30                          ; $00AF: dataColumn_0 (non hard), vol=$C 
                    db       $70                          ; $00B0: dataColumn_0 (non hard), vol=$C 
                    db       $07                          ; $00B1: arpegio 
                    db       $74                          ; $00B2: dataColumn_0 (non hard), vol=$D 
                    db       $03                          ; $00B3: arpegio 
                    db       $30                          ; $00B4: dataColumn_0 (non hard), vol=$C 
                    db       $6C                          ; $00B5: dataColumn_0 (non hard), vol=$B 
                    db       $07                          ; $00B6: arpegio 
                    db       $70                          ; $00B7: dataColumn_0 (non hard), vol=$C 
                    db       $03                          ; $00B8: arpegio 
                    db       $2C                          ; $00B9: dataColumn_0 (non hard), vol=$B 
                    db       $6C                          ; $00BA: dataColumn_0 (non hard), vol=$B 
                    db       $07                          ; $00BB: arpegio 
                    db       $6C                          ; $00BC: dataColumn_0 (non hard), vol=$B 
                    db       $03                          ; $00BD: arpegio 
                    db       $2C                          ; $00BE: dataColumn_0 (non hard), vol=$B 
                    db       $6C                          ; $00BF: dataColumn_0 (non hard), vol=$B 
                    db       $07                          ; $00C0: arpegio 
                    db       $68                          ; $00C1: dataColumn_0 (non hard), vol=$A 
                    db       $03                          ; $00C2: arpegio 
                    db       $28                          ; $00C3: dataColumn_0 (non hard), vol=$A 
                    db       $68                          ; $00C4: dataColumn_0 (non hard), vol=$A 
                    db       $07                          ; $00C5: arpegio 
                    db       $64                          ; $00C6: dataColumn_0 (non hard), vol=$9 
                    db       $03                          ; $00C7: arpegio 
                    db       $28                          ; $00C8: dataColumn_0 (non hard), vol=$A 
instrument5loophiScore: 
                    db       $68                          ; $00C9: dataColumn_0 (non hard), vol=$A 
                    db       $07                          ; $00CA: arpegio 
                    db       $68                          ; $00CB: dataColumn_0 (non hard), vol=$A 
                    db       $03                          ; $00CC: arpegio 
                    db       $24                          ; $00CD: dataColumn_0 (non hard), vol=$9 
                    db       $64                          ; $00CE: dataColumn_0 (non hard), vol=$9 
                    db       $07                          ; $00CF: arpegio 
                    db       $68                          ; $00D0: dataColumn_0 (non hard), vol=$A 
                    db       $03                          ; $00D1: arpegio 
                    db       $24                          ; $00D2: dataColumn_0 (non hard), vol=$9 
                    db       $68                          ; $00D3: dataColumn_0 (non hard), vol=$A 
                    db       $07                          ; $00D4: arpegio 
                    db       $64                          ; $00D5: dataColumn_0 (non hard), vol=$9 
                    db       $03                          ; $00D6: arpegio 
                    db       $24                          ; $00D7: dataColumn_0 (non hard), vol=$9 
                    db       $0D                          ; $00D8: dataColumn_0 (hard) 
                    dw       instrument5loophiScore       ; $00D9: [$00C9] loop 
instrument6hiScore: 
                    db       $02                          ; $00DB: speed 
                    db       $00                          ; $00DC: retrig 
                    db       $7C                          ; $00DD: dataColumn_0 (non hard), vol=$F 
                    db       $09                          ; $00DE: arpegio 
                    db       $78                          ; $00DF: dataColumn_0 (non hard), vol=$E 
                    db       $05                          ; $00E0: arpegio 
                    db       $30                          ; $00E1: dataColumn_0 (non hard), vol=$C 
                    db       $70                          ; $00E2: dataColumn_0 (non hard), vol=$C 
                    db       $09                          ; $00E3: arpegio 
                    db       $74                          ; $00E4: dataColumn_0 (non hard), vol=$D 
                    db       $05                          ; $00E5: arpegio 
                    db       $30                          ; $00E6: dataColumn_0 (non hard), vol=$C 
                    db       $70                          ; $00E7: dataColumn_0 (non hard), vol=$C 
                    db       $09                          ; $00E8: arpegio 
                    db       $74                          ; $00E9: dataColumn_0 (non hard), vol=$D 
                    db       $05                          ; $00EA: arpegio 
                    db       $30                          ; $00EB: dataColumn_0 (non hard), vol=$C 
                    db       $6C                          ; $00EC: dataColumn_0 (non hard), vol=$B 
                    db       $09                          ; $00ED: arpegio 
                    db       $70                          ; $00EE: dataColumn_0 (non hard), vol=$C 
                    db       $05                          ; $00EF: arpegio 
                    db       $2C                          ; $00F0: dataColumn_0 (non hard), vol=$B 
                    db       $6C                          ; $00F1: dataColumn_0 (non hard), vol=$B 
                    db       $09                          ; $00F2: arpegio 
                    db       $6C                          ; $00F3: dataColumn_0 (non hard), vol=$B 
                    db       $05                          ; $00F4: arpegio 
                    db       $2C                          ; $00F5: dataColumn_0 (non hard), vol=$B 
                    db       $6C                          ; $00F6: dataColumn_0 (non hard), vol=$B 
                    db       $09                          ; $00F7: arpegio 
                    db       $68                          ; $00F8: dataColumn_0 (non hard), vol=$A 
                    db       $05                          ; $00F9: arpegio 
                    db       $28                          ; $00FA: dataColumn_0 (non hard), vol=$A 
                    db       $68                          ; $00FB: dataColumn_0 (non hard), vol=$A 
                    db       $09                          ; $00FC: arpegio 
                    db       $64                          ; $00FD: dataColumn_0 (non hard), vol=$9 
                    db       $05                          ; $00FE: arpegio 
                    db       $28                          ; $00FF: dataColumn_0 (non hard), vol=$A 
instrument6loophiScore: 
                    db       $68                          ; $0100: dataColumn_0 (non hard), vol=$A 
                    db       $09                          ; $0101: arpegio 
                    db       $68                          ; $0102: dataColumn_0 (non hard), vol=$A 
                    db       $05                          ; $0103: arpegio 
                    db       $24                          ; $0104: dataColumn_0 (non hard), vol=$9 
                    db       $64                          ; $0105: dataColumn_0 (non hard), vol=$9 
                    db       $09                          ; $0106: arpegio 
                    db       $68                          ; $0107: dataColumn_0 (non hard), vol=$A 
                    db       $05                          ; $0108: arpegio 
                    db       $24                          ; $0109: dataColumn_0 (non hard), vol=$9 
                    db       $68                          ; $010A: dataColumn_0 (non hard), vol=$A 
                    db       $09                          ; $010B: arpegio 
                    db       $64                          ; $010C: dataColumn_0 (non hard), vol=$9 
                    db       $05                          ; $010D: arpegio 
                    db       $24                          ; $010E: dataColumn_0 (non hard), vol=$9 
                    db       $0D                          ; $010F: dataColumn_0 (hard) 
                    dw       instrument6loophiScore       ; $0110: [$0100] loop 
instrument7hiScore: 
                    db       $02                          ; $0112: speed 
                    db       $00                          ; $0113: retrig 
                    db       $7C                          ; $0114: dataColumn_0 (non hard), vol=$F 
                    db       $07                          ; $0115: arpegio 
                    db       $78                          ; $0116: dataColumn_0 (non hard), vol=$E 
                    db       $04                          ; $0117: arpegio 
                    db       $30                          ; $0118: dataColumn_0 (non hard), vol=$C 
                    db       $70                          ; $0119: dataColumn_0 (non hard), vol=$C 
                    db       $07                          ; $011A: arpegio 
                    db       $74                          ; $011B: dataColumn_0 (non hard), vol=$D 
                    db       $04                          ; $011C: arpegio 
                    db       $30                          ; $011D: dataColumn_0 (non hard), vol=$C 
                    db       $70                          ; $011E: dataColumn_0 (non hard), vol=$C 
                    db       $07                          ; $011F: arpegio 
                    db       $74                          ; $0120: dataColumn_0 (non hard), vol=$D 
                    db       $04                          ; $0121: arpegio 
                    db       $30                          ; $0122: dataColumn_0 (non hard), vol=$C 
                    db       $6C                          ; $0123: dataColumn_0 (non hard), vol=$B 
                    db       $07                          ; $0124: arpegio 
                    db       $70                          ; $0125: dataColumn_0 (non hard), vol=$C 
                    db       $04                          ; $0126: arpegio 
                    db       $2C                          ; $0127: dataColumn_0 (non hard), vol=$B 
                    db       $6C                          ; $0128: dataColumn_0 (non hard), vol=$B 
                    db       $07                          ; $0129: arpegio 
                    db       $6C                          ; $012A: dataColumn_0 (non hard), vol=$B 
                    db       $04                          ; $012B: arpegio 
                    db       $2C                          ; $012C: dataColumn_0 (non hard), vol=$B 
                    db       $6C                          ; $012D: dataColumn_0 (non hard), vol=$B 
                    db       $07                          ; $012E: arpegio 
                    db       $68                          ; $012F: dataColumn_0 (non hard), vol=$A 
                    db       $04                          ; $0130: arpegio 
                    db       $28                          ; $0131: dataColumn_0 (non hard), vol=$A 
                    db       $68                          ; $0132: dataColumn_0 (non hard), vol=$A 
                    db       $07                          ; $0133: arpegio 
                    db       $64                          ; $0134: dataColumn_0 (non hard), vol=$9 
                    db       $04                          ; $0135: arpegio 
                    db       $28                          ; $0136: dataColumn_0 (non hard), vol=$A 
instrument7loophiScore: 
                    db       $68                          ; $0137: dataColumn_0 (non hard), vol=$A 
                    db       $07                          ; $0138: arpegio 
                    db       $68                          ; $0139: dataColumn_0 (non hard), vol=$A 
                    db       $04                          ; $013A: arpegio 
                    db       $24                          ; $013B: dataColumn_0 (non hard), vol=$9 
                    db       $64                          ; $013C: dataColumn_0 (non hard), vol=$9 
                    db       $07                          ; $013D: arpegio 
                    db       $68                          ; $013E: dataColumn_0 (non hard), vol=$A 
                    db       $04                          ; $013F: arpegio 
                    db       $24                          ; $0140: dataColumn_0 (non hard), vol=$9 
                    db       $68                          ; $0141: dataColumn_0 (non hard), vol=$A 
                    db       $07                          ; $0142: arpegio 
                    db       $64                          ; $0143: dataColumn_0 (non hard), vol=$9 
                    db       $04                          ; $0144: arpegio 
                    db       $24                          ; $0145: dataColumn_0 (non hard), vol=$9 
                    db       $0D                          ; $0146: dataColumn_0 (hard) 
                    dw       instrument7loophiScore       ; $0147: [$0137] loop 
instrument8hiScore: 
                    db       $02                          ; $0149: speed 
                    db       $00                          ; $014A: retrig 
                    db       $7C                          ; $014B: dataColumn_0 (non hard), vol=$F 
                    db       $07                          ; $014C: arpegio 
                    db       $78                          ; $014D: dataColumn_0 (non hard), vol=$E 
                    db       $0C                          ; $014E: arpegio 
                    db       $30                          ; $014F: dataColumn_0 (non hard), vol=$C 
                    db       $70                          ; $0150: dataColumn_0 (non hard), vol=$C 
                    db       $07                          ; $0151: arpegio 
                    db       $74                          ; $0152: dataColumn_0 (non hard), vol=$D 
                    db       $0C                          ; $0153: arpegio 
                    db       $30                          ; $0154: dataColumn_0 (non hard), vol=$C 
                    db       $70                          ; $0155: dataColumn_0 (non hard), vol=$C 
                    db       $07                          ; $0156: arpegio 
                    db       $74                          ; $0157: dataColumn_0 (non hard), vol=$D 
                    db       $0C                          ; $0158: arpegio 
                    db       $30                          ; $0159: dataColumn_0 (non hard), vol=$C 
                    db       $6C                          ; $015A: dataColumn_0 (non hard), vol=$B 
                    db       $07                          ; $015B: arpegio 
                    db       $70                          ; $015C: dataColumn_0 (non hard), vol=$C 
                    db       $0C                          ; $015D: arpegio 
                    db       $2C                          ; $015E: dataColumn_0 (non hard), vol=$B 
                    db       $6C                          ; $015F: dataColumn_0 (non hard), vol=$B 
                    db       $07                          ; $0160: arpegio 
                    db       $6C                          ; $0161: dataColumn_0 (non hard), vol=$B 
                    db       $0C                          ; $0162: arpegio 
                    db       $2C                          ; $0163: dataColumn_0 (non hard), vol=$B 
                    db       $6C                          ; $0164: dataColumn_0 (non hard), vol=$B 
                    db       $07                          ; $0165: arpegio 
                    db       $68                          ; $0166: dataColumn_0 (non hard), vol=$A 
                    db       $0C                          ; $0167: arpegio 
                    db       $28                          ; $0168: dataColumn_0 (non hard), vol=$A 
                    db       $68                          ; $0169: dataColumn_0 (non hard), vol=$A 
                    db       $07                          ; $016A: arpegio 
                    db       $64                          ; $016B: dataColumn_0 (non hard), vol=$9 
                    db       $0C                          ; $016C: arpegio 
                    db       $28                          ; $016D: dataColumn_0 (non hard), vol=$A 
                    db       $6C                          ; $016E: dataColumn_0 (non hard), vol=$B 
                    db       $07                          ; $016F: arpegio 
                    db       $68                          ; $0170: dataColumn_0 (non hard), vol=$A 
                    db       $0C                          ; $0171: arpegio 
                    db       $28                          ; $0172: dataColumn_0 (non hard), vol=$A 
                    db       $68                          ; $0173: dataColumn_0 (non hard), vol=$A 
                    db       $07                          ; $0174: arpegio 
                    db       $6C                          ; $0175: dataColumn_0 (non hard), vol=$B 
                    db       $0C                          ; $0176: arpegio 
                    db       $28                          ; $0177: dataColumn_0 (non hard), vol=$A 
                    db       $6C                          ; $0178: dataColumn_0 (non hard), vol=$B 
                    db       $07                          ; $0179: arpegio 
                    db       $68                          ; $017A: dataColumn_0 (non hard), vol=$A 
                    db       $0C                          ; $017B: arpegio 
                    db       $28                          ; $017C: dataColumn_0 (non hard), vol=$A 
                    db       $68                          ; $017D: dataColumn_0 (non hard), vol=$A 
                    db       $07                          ; $017E: arpegio 
                    db       $6C                          ; $017F: dataColumn_0 (non hard), vol=$B 
                    db       $0C                          ; $0180: arpegio 
                    db       $28                          ; $0181: dataColumn_0 (non hard), vol=$A 
                    db       $68                          ; $0182: dataColumn_0 (non hard), vol=$A 
                    db       $07                          ; $0183: arpegio 
                    db       $68                          ; $0184: dataColumn_0 (non hard), vol=$A 
                    db       $0C                          ; $0185: arpegio 
                    db       $28                          ; $0186: dataColumn_0 (non hard), vol=$A 
                    db       $68                          ; $0187: dataColumn_0 (non hard), vol=$A 
                    db       $07                          ; $0188: arpegio 
                    db       $68                          ; $0189: dataColumn_0 (non hard), vol=$A 
                    db       $0C                          ; $018A: arpegio 
                    db       $24                          ; $018B: dataColumn_0 (non hard), vol=$9 
                    db       $68                          ; $018C: dataColumn_0 (non hard), vol=$A 
                    db       $07                          ; $018D: arpegio 
                    db       $68                          ; $018E: dataColumn_0 (non hard), vol=$A 
                    db       $0C                          ; $018F: arpegio 
                    db       $24                          ; $0190: dataColumn_0 (non hard), vol=$9 
                    db       $68                          ; $0191: dataColumn_0 (non hard), vol=$A 
                    db       $07                          ; $0192: arpegio 
                    db       $64                          ; $0193: dataColumn_0 (non hard), vol=$9 
                    db       $0C                          ; $0194: arpegio 
                    db       $24                          ; $0195: dataColumn_0 (non hard), vol=$9 
                    db       $68                          ; $0196: dataColumn_0 (non hard), vol=$A 
                    db       $07                          ; $0197: arpegio 
                    db       $68                          ; $0198: dataColumn_0 (non hard), vol=$A 
                    db       $0C                          ; $0199: arpegio 
                    db       $28                          ; $019A: dataColumn_0 (non hard), vol=$A 
                    db       $68                          ; $019B: dataColumn_0 (non hard), vol=$A 
                    db       $07                          ; $019C: arpegio 
                    db       $64                          ; $019D: dataColumn_0 (non hard), vol=$9 
                    db       $0C                          ; $019E: arpegio 
                    db       $28                          ; $019F: dataColumn_0 (non hard), vol=$A 
                    db       $68                          ; $01A0: dataColumn_0 (non hard), vol=$A 
                    db       $07                          ; $01A1: arpegio 
                    db       $64                          ; $01A2: dataColumn_0 (non hard), vol=$9 
                    db       $0C                          ; $01A3: arpegio 
                    db       $20                          ; $01A4: dataColumn_0 (non hard), vol=$8 
                    db       $5C                          ; $01A5: dataColumn_0 (non hard), vol=$7 
                    db       $07                          ; $01A6: arpegio 
                    db       $0D                          ; $01A7: dataColumn_0 (hard) 
                    dw       instrument0loophiScore       ; $01A8: [$0020] loop 
; start of linker definition
linkerhiScore: 
                    db       $40                          ; $01AA: first height 
                    db       $00                          ; $01AB: transposition1 
                    db       $00                          ; $01AC: transposition2 
                    db       $00                          ; $01AD: transposition3 
                    dw       specialtrackDef0hiScore      ; $01AE: [$01EF] specialTrack 
pattern0DefinitionhiScore: 
                    db       $10                          ; $01B0: pattern 0 state 
                    dw       trackDef0hiScore             ; $01B1: [$01F1] pattern 0, track 1 
                    dw       trackDef1hiScore             ; $01B3: [$0220] pattern 0, track 2 
                    dw       trackDef2hiScore             ; $01B5: [$025E] pattern 0, track 3 
                    db       $40                          ; $01B7: new height 
pattern1DefinitionhiScore: 
                    db       $00                          ; $01B8: pattern 1 state 
                    dw       trackDef0hiScore             ; $01B9: [$01F1] pattern 1, track 1 
                    dw       trackDef1hiScore             ; $01BB: [$0220] pattern 1, track 2 
                    dw       trackDef2hiScore             ; $01BD: [$025E] pattern 1, track 3 
pattern2DefinitionhiScore: 
                    db       $00                          ; $01BF: pattern 2 state 
                    dw       trackDef4hiScore             ; $01C0: [$02DB] pattern 2, track 1 
                    dw       trackDef5hiScore             ; $01C2: [$030A] pattern 2, track 2 
                    dw       trackDef6hiScore             ; $01C4: [$0348] pattern 2, track 3 
pattern3DefinitionhiScore: 
                    db       $10                          ; $01C6: pattern 3 state 
                    dw       trackDef7hiScore             ; $01C7: [$03C5] pattern 3, track 1 
                    dw       trackDef8hiScore             ; $01C9: [$03DE] pattern 3, track 2 
                    dw       trackDef9hiScore             ; $01CB: [$0400] pattern 3, track 3 
                    db       $20                          ; $01CD: new height 
pattern4DefinitionhiScore: 
                    db       $10                          ; $01CE: pattern 4 state 
                    dw       trackDef10hiScore            ; $01CF: [$0440] pattern 4, track 1 
                    dw       trackDef11hiScore            ; $01D1: [$04C3] pattern 4, track 2 
                    dw       trackDef2hiScore             ; $01D3: [$025E] pattern 4, track 3 
                    db       $40                          ; $01D5: new height 
pattern5DefinitionhiScore: 
                    db       $00                          ; $01D6: pattern 5 state 
                    dw       trackDef10hiScore            ; $01D7: [$0440] pattern 5, track 1 
                    dw       trackDef11hiScore            ; $01D9: [$04C3] pattern 5, track 2 
                    dw       trackDef2hiScore             ; $01DB: [$025E] pattern 5, track 3 
pattern6DefinitionhiScore: 
                    db       $00                          ; $01DD: pattern 6 state 
                    dw       trackDef13hiScore            ; $01DE: [$04E8] pattern 6, track 1 
                    dw       trackDef14hiScore            ; $01E0: [$056B] pattern 6, track 2 
                    dw       trackDef6hiScore             ; $01E2: [$0348] pattern 6, track 3 
pattern7DefinitionhiScore: 
                    db       $10                          ; $01E4: pattern 7 state 
                    dw       trackDef15hiScore            ; $01E5: [$0589] pattern 7, track 1 
                    dw       trackDef16hiScore            ; $01E7: [$05CC] pattern 7, track 2 
                    dw       trackDef9hiScore             ; $01E9: [$0400] pattern 7, track 3 
                    db       $20                          ; $01EB: new height 
pattern8DefinitionhiScore: 
                    db       $01                          ; $01EC: pattern 8 state 
                    dw       pattern0DefinitionhiScore    ; $01ED: [$01B0] song restart address 
specialtrackDef0hiScore: 
                    db       $1D                          ; $01EF: data, speed 7 
                    db       $00                          ; $01F0: wait 128 
trackDef0hiScore: 
                    db       $B0                          ; $01F1: normal track data 
                    db       $E1                          ; $01F2: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $01F3: pitch 
                    db       $01                          ; $01F5: instrument 
                    db       $06                          ; $01F6: normal track data, wait 2 
                    db       $77                          ; $01F7: full optimization, no escape: A#4 
                    db       $06                          ; $01F8: normal track data, wait 2 
                    db       $B0                          ; $01F9: normal track data 
                    db       $4B                          ; $01FA: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $01FB: normal track data, wait 2 
                    db       $B6                          ; $01FC: normal track data, note: A#4 
                    db       $4D                          ; $01FD: vol = $9 (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $01FE: normal track data, wait 2 
                    db       $B0                          ; $01FF: normal track data 
                    db       $41                          ; $0200: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $0201: normal track data, wait 2 
                    db       $77                          ; $0202: full optimization, no escape: A#4 
                    db       $06                          ; $0203: normal track data, wait 2 
                    db       $B0                          ; $0204: normal track data 
                    db       $4B                          ; $0205: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $0206: normal track data, wait 2 
                    db       $B6                          ; $0207: normal track data, note: A#4 
                    db       $4D                          ; $0208: vol = $9 (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $0209: normal track data, wait 2 
                    db       $B6                          ; $020A: normal track data 
                    db       $41                          ; $020B: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $020C: normal track data, wait 2 
                    db       $7F                          ; $020D: full optimization, no escape: D5 
                    db       $06                          ; $020E: normal track data, wait 2 
                    db       $B6                          ; $020F: normal track data 
                    db       $4B                          ; $0210: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $0211: normal track data, wait 2 
                    db       $BE                          ; $0212: normal track data, note: D5 
                    db       $4D                          ; $0213: vol = $9 (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $0214: normal track data, wait 2 
                    db       $B6                          ; $0215: normal track data 
                    db       $41                          ; $0216: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $0217: normal track data, wait 2 
                    db       $7F                          ; $0218: full optimization, no escape: D5 
                    db       $06                          ; $0219: normal track data, wait 2 
                    db       $B6                          ; $021A: normal track data 
                    db       $4B                          ; $021B: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $021C: normal track data, wait 2 
                    db       $BE                          ; $021D: normal track data, note: D5 
                    db       $4D                          ; $021E: vol = $9 (inverted), no pitch, no note, no instrument 
                    db       $00                          ; $021F: track end signature found 
trackDef1hiScore: 
                    db       $42                          ; $0220: normal track data 
                    db       $80                          ; $0221: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $0222: pitch 
                    db       $02                          ; $0224: normal track data, wait 0 
                    db       $B4                          ; $0225: normal track data 
                    db       $61                          ; $0226: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $01                          ; $0227: instrument 
                    db       $06                          ; $0228: normal track data, wait 2 
                    db       $7F                          ; $0229: full optimization, no escape: D5 
                    db       $02                          ; $022A: normal track data, wait 0 
                    db       $42                          ; $022B: normal track data, note: C0 
                    db       $05                          ; $022C: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $022D: normal track data, wait 0 
                    db       $B4                          ; $022E: normal track data 
                    db       $4B                          ; $022F: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $0230: normal track data, wait 2 
                    db       $BE                          ; $0231: normal track data, note: D5 
                    db       $4D                          ; $0232: vol = $9 (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $0233: normal track data, wait 2 
                    db       $B4                          ; $0234: normal track data 
                    db       $41                          ; $0235: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $0236: normal track data, wait 2 
                    db       $7F                          ; $0237: full optimization, no escape: D5 
                    db       $02                          ; $0238: normal track data, wait 0 
                    db       $42                          ; $0239: normal track data, note: C0 
                    db       $05                          ; $023A: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $023B: normal track data, wait 0 
                    db       $B4                          ; $023C: normal track data 
                    db       $4B                          ; $023D: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $023E: normal track data, wait 2 
                    db       $BE                          ; $023F: normal track data, note: D5 
                    db       $4D                          ; $0240: vol = $9 (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $0241: normal track data, wait 2 
                    db       $BA                          ; $0242: normal track data 
                    db       $41                          ; $0243: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $0244: normal track data, wait 2 
                    db       $85                          ; $0245: full optimization, no escape: F5 
                    db       $02                          ; $0246: normal track data, wait 0 
                    db       $42                          ; $0247: normal track data, note: C0 
                    db       $05                          ; $0248: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $0249: normal track data, wait 0 
                    db       $BA                          ; $024A: normal track data 
                    db       $4B                          ; $024B: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $024C: normal track data, wait 2 
                    db       $C4                          ; $024D: normal track data, note: F5 
                    db       $4D                          ; $024E: vol = $9 (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $024F: normal track data, wait 2 
                    db       $BA                          ; $0250: normal track data 
                    db       $41                          ; $0251: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $0252: normal track data, wait 2 
                    db       $85                          ; $0253: full optimization, no escape: F5 
                    db       $02                          ; $0254: normal track data, wait 0 
                    db       $42                          ; $0255: normal track data, note: C0 
                    db       $05                          ; $0256: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $0257: normal track data, wait 0 
                    db       $BA                          ; $0258: normal track data 
                    db       $4B                          ; $0259: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $025A: normal track data, wait 2 
                    db       $C4                          ; $025B: normal track data, note: F5 
                    db       $4D                          ; $025C: vol = $9 (inverted), no pitch, no note, no instrument 
                    db       $00                          ; $025D: track end signature found 
trackDef2hiScore: 
                    db       $80                          ; $025E: normal track data 
                    db       $E1                          ; $025F: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $0260: pitch 
                    db       $02                          ; $0262: instrument 
                    db       $42                          ; $0263: normal track data 
                    db       $00                          ; $0264: vol off, no pitch, no note, no instrument 
                    db       $94                          ; $0265: normal track data 
                    db       $60                          ; $0266: vol off, no pitch, note, instrument 
                    db       $03                          ; $0267: instrument 
                    db       $02                          ; $0268: normal track data, wait 0 
                    db       $5C                          ; $0269: normal track data 
                    db       $60                          ; $026A: vol off, no pitch, note, instrument 
                    db       $04                          ; $026B: instrument 
                    db       $42                          ; $026C: normal track data 
                    db       $00                          ; $026D: vol off, no pitch, no note, no instrument 
                    db       $80                          ; $026E: normal track data 
                    db       $60                          ; $026F: vol off, no pitch, note, instrument 
                    db       $02                          ; $0270: instrument 
                    db       $02                          ; $0271: normal track data, wait 0 
                    db       $41                          ; $0272: full optimization, no escape: G2 
                    db       $02                          ; $0273: normal track data, wait 0 
                    db       $94                          ; $0274: normal track data 
                    db       $60                          ; $0275: vol off, no pitch, note, instrument 
                    db       $03                          ; $0276: instrument 
                    db       $02                          ; $0277: normal track data, wait 0 
                    db       $5C                          ; $0278: normal track data 
                    db       $60                          ; $0279: vol off, no pitch, note, instrument 
                    db       $04                          ; $027A: instrument 
                    db       $02                          ; $027B: normal track data, wait 0 
                    db       $94                          ; $027C: normal track data 
                    db       $60                          ; $027D: vol off, no pitch, note, instrument 
                    db       $03                          ; $027E: instrument 
                    db       $02                          ; $027F: normal track data, wait 0 
                    db       $80                          ; $0280: normal track data 
                    db       $60                          ; $0281: vol off, no pitch, note, instrument 
                    db       $02                          ; $0282: instrument 
                    db       $02                          ; $0283: normal track data, wait 0 
                    db       $94                          ; $0284: normal track data 
                    db       $60                          ; $0285: vol off, no pitch, note, instrument 
                    db       $03                          ; $0286: instrument 
                    db       $02                          ; $0287: normal track data, wait 0 
                    db       $5C                          ; $0288: normal track data 
                    db       $60                          ; $0289: vol off, no pitch, note, instrument 
                    db       $04                          ; $028A: instrument 
                    db       $02                          ; $028B: normal track data, wait 0 
                    db       $80                          ; $028C: normal track data 
                    db       $60                          ; $028D: vol off, no pitch, note, instrument 
                    db       $02                          ; $028E: instrument 
                    db       $02                          ; $028F: normal track data, wait 0 
                    db       $41                          ; $0290: full optimization, no escape: G2 
                    db       $02                          ; $0291: normal track data, wait 0 
                    db       $94                          ; $0292: normal track data 
                    db       $60                          ; $0293: vol off, no pitch, note, instrument 
                    db       $03                          ; $0294: instrument 
                    db       $02                          ; $0295: normal track data, wait 0 
                    db       $5C                          ; $0296: normal track data 
                    db       $60                          ; $0297: vol off, no pitch, note, instrument 
                    db       $04                          ; $0298: instrument 
                    db       $02                          ; $0299: normal track data, wait 0 
                    db       $94                          ; $029A: normal track data 
                    db       $60                          ; $029B: vol off, no pitch, note, instrument 
                    db       $03                          ; $029C: instrument 
                    db       $02                          ; $029D: normal track data, wait 0 
                    db       $86                          ; $029E: normal track data 
                    db       $60                          ; $029F: vol off, no pitch, note, instrument 
                    db       $02                          ; $02A0: instrument 
                    db       $02                          ; $02A1: normal track data, wait 0 
                    db       $94                          ; $02A2: normal track data 
                    db       $60                          ; $02A3: vol off, no pitch, note, instrument 
                    db       $03                          ; $02A4: instrument 
                    db       $42                          ; $02A5: normal track data 
                    db       $00                          ; $02A6: vol off, no pitch, no note, no instrument 
                    db       $5C                          ; $02A7: normal track data 
                    db       $60                          ; $02A8: vol off, no pitch, note, instrument 
                    db       $04                          ; $02A9: instrument 
                    db       $02                          ; $02AA: normal track data, wait 0 
                    db       $86                          ; $02AB: normal track data 
                    db       $60                          ; $02AC: vol off, no pitch, note, instrument 
                    db       $02                          ; $02AD: instrument 
                    db       $02                          ; $02AE: normal track data, wait 0 
                    db       $47                          ; $02AF: full optimization, no escape: A#2 
                    db       $02                          ; $02B0: normal track data, wait 0 
                    db       $94                          ; $02B1: normal track data 
                    db       $60                          ; $02B2: vol off, no pitch, note, instrument 
                    db       $03                          ; $02B3: instrument 
                    db       $02                          ; $02B4: normal track data, wait 0 
                    db       $5C                          ; $02B5: normal track data 
                    db       $60                          ; $02B6: vol off, no pitch, note, instrument 
                    db       $04                          ; $02B7: instrument 
                    db       $02                          ; $02B8: normal track data, wait 0 
                    db       $94                          ; $02B9: normal track data 
                    db       $60                          ; $02BA: vol off, no pitch, note, instrument 
                    db       $03                          ; $02BB: instrument 
                    db       $02                          ; $02BC: normal track data, wait 0 
                    db       $86                          ; $02BD: normal track data 
                    db       $60                          ; $02BE: vol off, no pitch, note, instrument 
                    db       $02                          ; $02BF: instrument 
                    db       $02                          ; $02C0: normal track data, wait 0 
                    db       $94                          ; $02C1: normal track data 
                    db       $60                          ; $02C2: vol off, no pitch, note, instrument 
                    db       $03                          ; $02C3: instrument 
                    db       $02                          ; $02C4: normal track data, wait 0 
                    db       $5C                          ; $02C5: normal track data 
                    db       $60                          ; $02C6: vol off, no pitch, note, instrument 
                    db       $04                          ; $02C7: instrument 
                    db       $02                          ; $02C8: normal track data, wait 0 
                    db       $86                          ; $02C9: normal track data 
                    db       $60                          ; $02CA: vol off, no pitch, note, instrument 
                    db       $02                          ; $02CB: instrument 
                    db       $02                          ; $02CC: normal track data, wait 0 
                    db       $47                          ; $02CD: full optimization, no escape: A#2 
                    db       $02                          ; $02CE: normal track data, wait 0 
                    db       $94                          ; $02CF: normal track data 
                    db       $60                          ; $02D0: vol off, no pitch, note, instrument 
                    db       $03                          ; $02D1: instrument 
                    db       $02                          ; $02D2: normal track data, wait 0 
                    db       $5C                          ; $02D3: normal track data 
                    db       $60                          ; $02D4: vol off, no pitch, note, instrument 
                    db       $04                          ; $02D5: instrument 
                    db       $02                          ; $02D6: normal track data, wait 0 
                    db       $94                          ; $02D7: normal track data 
                    db       $60                          ; $02D8: vol off, no pitch, note, instrument 
                    db       $03                          ; $02D9: instrument 
                    db       $00                          ; $02DA: track end signature found 
trackDef4hiScore: 
                    db       $BA                          ; $02DB: normal track data 
                    db       $E1                          ; $02DC: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $02DD: pitch 
                    db       $01                          ; $02DF: instrument 
                    db       $06                          ; $02E0: normal track data, wait 2 
                    db       $83                          ; $02E1: full optimization, no escape: E5 
                    db       $06                          ; $02E2: normal track data, wait 2 
                    db       $BA                          ; $02E3: normal track data 
                    db       $4B                          ; $02E4: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $02E5: normal track data, wait 2 
                    db       $C2                          ; $02E6: normal track data, note: E5 
                    db       $4D                          ; $02E7: vol = $9 (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $02E8: normal track data, wait 2 
                    db       $BE                          ; $02E9: normal track data 
                    db       $41                          ; $02EA: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $02EB: normal track data, wait 2 
                    db       $87                          ; $02EC: full optimization, no escape: F#5 
                    db       $06                          ; $02ED: normal track data, wait 2 
                    db       $BE                          ; $02EE: normal track data 
                    db       $4B                          ; $02EF: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $02F0: normal track data, wait 2 
                    db       $C6                          ; $02F1: normal track data, note: F#5 
                    db       $4D                          ; $02F2: vol = $9 (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $02F3: normal track data, wait 2 
                    db       $B0                          ; $02F4: normal track data 
                    db       $41                          ; $02F5: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $02F6: normal track data, wait 2 
                    db       $77                          ; $02F7: full optimization, no escape: A#4 
                    db       $06                          ; $02F8: normal track data, wait 2 
                    db       $B0                          ; $02F9: normal track data 
                    db       $4B                          ; $02FA: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $02FB: normal track data, wait 2 
                    db       $B6                          ; $02FC: normal track data, note: A#4 
                    db       $4D                          ; $02FD: vol = $9 (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $02FE: normal track data, wait 2 
                    db       $B0                          ; $02FF: normal track data 
                    db       $41                          ; $0300: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $0301: normal track data, wait 2 
                    db       $77                          ; $0302: full optimization, no escape: A#4 
                    db       $06                          ; $0303: normal track data, wait 2 
                    db       $B0                          ; $0304: normal track data 
                    db       $4B                          ; $0305: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $0306: normal track data, wait 2 
                    db       $B6                          ; $0307: normal track data, note: A#4 
                    db       $4D                          ; $0308: vol = $9 (inverted), no pitch, no note, no instrument 
                    db       $00                          ; $0309: track end signature found 
trackDef5hiScore: 
                    db       $42                          ; $030A: normal track data 
                    db       $80                          ; $030B: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $030C: pitch 
                    db       $02                          ; $030E: normal track data, wait 0 
                    db       $BE                          ; $030F: normal track data 
                    db       $61                          ; $0310: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $01                          ; $0311: instrument 
                    db       $06                          ; $0312: normal track data, wait 2 
                    db       $89                          ; $0313: full optimization, no escape: G5 
                    db       $02                          ; $0314: normal track data, wait 0 
                    db       $42                          ; $0315: normal track data, note: C0 
                    db       $05                          ; $0316: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $0317: normal track data, wait 0 
                    db       $BE                          ; $0318: normal track data 
                    db       $4B                          ; $0319: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $031A: normal track data, wait 2 
                    db       $C8                          ; $031B: normal track data, note: G5 
                    db       $4D                          ; $031C: vol = $9 (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $031D: normal track data, wait 2 
                    db       $C2                          ; $031E: normal track data 
                    db       $41                          ; $031F: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $0320: normal track data, wait 2 
                    db       $8D                          ; $0321: full optimization, no escape: A5 
                    db       $02                          ; $0322: normal track data, wait 0 
                    db       $42                          ; $0323: normal track data, note: C0 
                    db       $05                          ; $0324: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $0325: normal track data, wait 0 
                    db       $C2                          ; $0326: normal track data 
                    db       $4B                          ; $0327: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $0328: normal track data, wait 2 
                    db       $CC                          ; $0329: normal track data, note: A5 
                    db       $4D                          ; $032A: vol = $9 (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $032B: normal track data, wait 2 
                    db       $B4                          ; $032C: normal track data 
                    db       $41                          ; $032D: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $032E: normal track data, wait 2 
                    db       $7F                          ; $032F: full optimization, no escape: D5 
                    db       $02                          ; $0330: normal track data, wait 0 
                    db       $42                          ; $0331: normal track data, note: C0 
                    db       $05                          ; $0332: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $0333: normal track data, wait 0 
                    db       $B4                          ; $0334: normal track data 
                    db       $4B                          ; $0335: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $0336: normal track data, wait 2 
                    db       $BE                          ; $0337: normal track data, note: D5 
                    db       $4D                          ; $0338: vol = $9 (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $0339: normal track data, wait 2 
                    db       $B4                          ; $033A: normal track data 
                    db       $41                          ; $033B: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $033C: normal track data, wait 2 
                    db       $7F                          ; $033D: full optimization, no escape: D5 
                    db       $02                          ; $033E: normal track data, wait 0 
                    db       $42                          ; $033F: normal track data, note: C0 
                    db       $05                          ; $0340: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $0341: normal track data, wait 0 
                    db       $B4                          ; $0342: normal track data 
                    db       $4B                          ; $0343: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $0344: normal track data, wait 2 
                    db       $BE                          ; $0345: normal track data, note: D5 
                    db       $4D                          ; $0346: vol = $9 (inverted), no pitch, no note, no instrument 
                    db       $00                          ; $0347: track end signature found 
trackDef6hiScore: 
                    db       $8A                          ; $0348: normal track data 
                    db       $E0                          ; $0349: vol off, pitch, note, instrument 
                    dw       $0000                        ; $034A: pitch 
                    db       $02                          ; $034C: instrument 
                    db       $42                          ; $034D: normal track data 
                    db       $00                          ; $034E: vol off, no pitch, no note, no instrument 
                    db       $94                          ; $034F: normal track data 
                    db       $60                          ; $0350: vol off, no pitch, note, instrument 
                    db       $03                          ; $0351: instrument 
                    db       $02                          ; $0352: normal track data, wait 0 
                    db       $5C                          ; $0353: normal track data 
                    db       $60                          ; $0354: vol off, no pitch, note, instrument 
                    db       $04                          ; $0355: instrument 
                    db       $42                          ; $0356: normal track data 
                    db       $00                          ; $0357: vol off, no pitch, no note, no instrument 
                    db       $8A                          ; $0358: normal track data 
                    db       $60                          ; $0359: vol off, no pitch, note, instrument 
                    db       $02                          ; $035A: instrument 
                    db       $02                          ; $035B: normal track data, wait 0 
                    db       $4B                          ; $035C: full optimization, no escape: C3 
                    db       $02                          ; $035D: normal track data, wait 0 
                    db       $94                          ; $035E: normal track data 
                    db       $60                          ; $035F: vol off, no pitch, note, instrument 
                    db       $03                          ; $0360: instrument 
                    db       $02                          ; $0361: normal track data, wait 0 
                    db       $5C                          ; $0362: normal track data 
                    db       $60                          ; $0363: vol off, no pitch, note, instrument 
                    db       $04                          ; $0364: instrument 
                    db       $02                          ; $0365: normal track data, wait 0 
                    db       $94                          ; $0366: normal track data 
                    db       $60                          ; $0367: vol off, no pitch, note, instrument 
                    db       $03                          ; $0368: instrument 
                    db       $02                          ; $0369: normal track data, wait 0 
                    db       $8E                          ; $036A: normal track data 
                    db       $60                          ; $036B: vol off, no pitch, note, instrument 
                    db       $02                          ; $036C: instrument 
                    db       $02                          ; $036D: normal track data, wait 0 
                    db       $94                          ; $036E: normal track data 
                    db       $60                          ; $036F: vol off, no pitch, note, instrument 
                    db       $03                          ; $0370: instrument 
                    db       $02                          ; $0371: normal track data, wait 0 
                    db       $5C                          ; $0372: normal track data 
                    db       $60                          ; $0373: vol off, no pitch, note, instrument 
                    db       $04                          ; $0374: instrument 
                    db       $02                          ; $0375: normal track data, wait 0 
                    db       $8E                          ; $0376: normal track data 
                    db       $60                          ; $0377: vol off, no pitch, note, instrument 
                    db       $02                          ; $0378: instrument 
                    db       $02                          ; $0379: normal track data, wait 0 
                    db       $4F                          ; $037A: full optimization, no escape: D3 
                    db       $02                          ; $037B: normal track data, wait 0 
                    db       $94                          ; $037C: normal track data 
                    db       $60                          ; $037D: vol off, no pitch, note, instrument 
                    db       $03                          ; $037E: instrument 
                    db       $02                          ; $037F: normal track data, wait 0 
                    db       $5C                          ; $0380: normal track data 
                    db       $60                          ; $0381: vol off, no pitch, note, instrument 
                    db       $04                          ; $0382: instrument 
                    db       $02                          ; $0383: normal track data, wait 0 
                    db       $94                          ; $0384: normal track data 
                    db       $60                          ; $0385: vol off, no pitch, note, instrument 
                    db       $03                          ; $0386: instrument 
                    db       $02                          ; $0387: normal track data, wait 0 
                    db       $80                          ; $0388: normal track data 
                    db       $60                          ; $0389: vol off, no pitch, note, instrument 
                    db       $02                          ; $038A: instrument 
                    db       $02                          ; $038B: normal track data, wait 0 
                    db       $94                          ; $038C: normal track data 
                    db       $60                          ; $038D: vol off, no pitch, note, instrument 
                    db       $03                          ; $038E: instrument 
                    db       $42                          ; $038F: normal track data 
                    db       $00                          ; $0390: vol off, no pitch, no note, no instrument 
                    db       $5C                          ; $0391: normal track data 
                    db       $60                          ; $0392: vol off, no pitch, note, instrument 
                    db       $04                          ; $0393: instrument 
                    db       $02                          ; $0394: normal track data, wait 0 
                    db       $80                          ; $0395: normal track data 
                    db       $60                          ; $0396: vol off, no pitch, note, instrument 
                    db       $02                          ; $0397: instrument 
                    db       $02                          ; $0398: normal track data, wait 0 
                    db       $41                          ; $0399: full optimization, no escape: G2 
                    db       $02                          ; $039A: normal track data, wait 0 
                    db       $94                          ; $039B: normal track data 
                    db       $60                          ; $039C: vol off, no pitch, note, instrument 
                    db       $03                          ; $039D: instrument 
                    db       $02                          ; $039E: normal track data, wait 0 
                    db       $5C                          ; $039F: normal track data 
                    db       $60                          ; $03A0: vol off, no pitch, note, instrument 
                    db       $04                          ; $03A1: instrument 
                    db       $02                          ; $03A2: normal track data, wait 0 
                    db       $94                          ; $03A3: normal track data 
                    db       $60                          ; $03A4: vol off, no pitch, note, instrument 
                    db       $03                          ; $03A5: instrument 
                    db       $02                          ; $03A6: normal track data, wait 0 
                    db       $7C                          ; $03A7: normal track data 
                    db       $60                          ; $03A8: vol off, no pitch, note, instrument 
                    db       $02                          ; $03A9: instrument 
                    db       $02                          ; $03AA: normal track data, wait 0 
                    db       $94                          ; $03AB: normal track data 
                    db       $60                          ; $03AC: vol off, no pitch, note, instrument 
                    db       $03                          ; $03AD: instrument 
                    db       $02                          ; $03AE: normal track data, wait 0 
                    db       $5C                          ; $03AF: normal track data 
                    db       $60                          ; $03B0: vol off, no pitch, note, instrument 
                    db       $04                          ; $03B1: instrument 
                    db       $02                          ; $03B2: normal track data, wait 0 
                    db       $7C                          ; $03B3: normal track data 
                    db       $60                          ; $03B4: vol off, no pitch, note, instrument 
                    db       $02                          ; $03B5: instrument 
                    db       $02                          ; $03B6: normal track data, wait 0 
                    db       $3D                          ; $03B7: full optimization, no escape: F2 
                    db       $02                          ; $03B8: normal track data, wait 0 
                    db       $94                          ; $03B9: normal track data 
                    db       $60                          ; $03BA: vol off, no pitch, note, instrument 
                    db       $03                          ; $03BB: instrument 
                    db       $02                          ; $03BC: normal track data, wait 0 
                    db       $5C                          ; $03BD: normal track data 
                    db       $60                          ; $03BE: vol off, no pitch, note, instrument 
                    db       $04                          ; $03BF: instrument 
                    db       $02                          ; $03C0: normal track data, wait 0 
                    db       $94                          ; $03C1: normal track data 
                    db       $60                          ; $03C2: vol off, no pitch, note, instrument 
                    db       $03                          ; $03C3: instrument 
                    db       $00                          ; $03C4: track end signature found 
trackDef7hiScore: 
                    db       $A8                          ; $03C5: normal track data 
                    db       $E1                          ; $03C6: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $03C7: pitch 
                    db       $01                          ; $03C9: instrument 
                    db       $06                          ; $03CA: normal track data, wait 2 
                    db       $71                          ; $03CB: full optimization, no escape: G4 
                    db       $06                          ; $03CC: normal track data, wait 2 
                    db       $A8                          ; $03CD: normal track data 
                    db       $4B                          ; $03CE: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $03CF: normal track data, wait 2 
                    db       $B0                          ; $03D0: normal track data, note: G4 
                    db       $4D                          ; $03D1: vol = $9 (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $03D2: normal track data, wait 2 
                    db       $A6                          ; $03D3: normal track data 
                    db       $41                          ; $03D4: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $03D5: normal track data, wait 2 
                    db       $6F                          ; $03D6: full optimization, no escape: F#4 
                    db       $06                          ; $03D7: normal track data, wait 2 
                    db       $A6                          ; $03D8: normal track data 
                    db       $4B                          ; $03D9: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $03DA: normal track data, wait 2 
                    db       $AE                          ; $03DB: normal track data, note: F#4 
                    db       $4D                          ; $03DC: vol = $9 (inverted), no pitch, no note, no instrument 
                    db       $00                          ; $03DD: track end signature found 
trackDef8hiScore: 
                    db       $42                          ; $03DE: normal track data 
                    db       $80                          ; $03DF: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $03E0: pitch 
                    db       $02                          ; $03E2: normal track data, wait 0 
                    db       $AC                          ; $03E3: normal track data 
                    db       $61                          ; $03E4: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $01                          ; $03E5: instrument 
                    db       $06                          ; $03E6: normal track data, wait 2 
                    db       $77                          ; $03E7: full optimization, no escape: A#4 
                    db       $02                          ; $03E8: normal track data, wait 0 
                    db       $42                          ; $03E9: normal track data, note: C0 
                    db       $05                          ; $03EA: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $03EB: normal track data, wait 0 
                    db       $AC                          ; $03EC: normal track data 
                    db       $4B                          ; $03ED: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $03EE: normal track data, wait 2 
                    db       $B6                          ; $03EF: normal track data, note: A#4 
                    db       $4D                          ; $03F0: vol = $9 (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $03F1: normal track data, wait 2 
                    db       $AA                          ; $03F2: normal track data 
                    db       $41                          ; $03F3: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $03F4: normal track data, wait 2 
                    db       $75                          ; $03F5: full optimization, no escape: A4 
                    db       $02                          ; $03F6: normal track data, wait 0 
                    db       $42                          ; $03F7: normal track data, note: C0 
                    db       $05                          ; $03F8: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $03F9: normal track data, wait 0 
                    db       $AA                          ; $03FA: normal track data 
                    db       $4B                          ; $03FB: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $03FC: normal track data, wait 2 
                    db       $B4                          ; $03FD: normal track data, note: A4 
                    db       $4D                          ; $03FE: vol = $9 (inverted), no pitch, no note, no instrument 
                    db       $00                          ; $03FF: track end signature found 
trackDef9hiScore: 
                    db       $90                          ; $0400: normal track data 
                    db       $E0                          ; $0401: vol off, pitch, note, instrument 
                    dw       $0000                        ; $0402: pitch 
                    db       $02                          ; $0404: instrument 
                    db       $42                          ; $0405: normal track data 
                    db       $00                          ; $0406: vol off, no pitch, no note, no instrument 
                    db       $94                          ; $0407: normal track data 
                    db       $60                          ; $0408: vol off, no pitch, note, instrument 
                    db       $03                          ; $0409: instrument 
                    db       $02                          ; $040A: normal track data, wait 0 
                    db       $5C                          ; $040B: normal track data 
                    db       $60                          ; $040C: vol off, no pitch, note, instrument 
                    db       $04                          ; $040D: instrument 
                    db       $42                          ; $040E: normal track data 
                    db       $00                          ; $040F: vol off, no pitch, no note, no instrument 
                    db       $90                          ; $0410: normal track data 
                    db       $60                          ; $0411: vol off, no pitch, note, instrument 
                    db       $02                          ; $0412: instrument 
                    db       $02                          ; $0413: normal track data, wait 0 
                    db       $51                          ; $0414: full optimization, no escape: D#3 
                    db       $02                          ; $0415: normal track data, wait 0 
                    db       $94                          ; $0416: normal track data 
                    db       $60                          ; $0417: vol off, no pitch, note, instrument 
                    db       $03                          ; $0418: instrument 
                    db       $02                          ; $0419: normal track data, wait 0 
                    db       $5C                          ; $041A: normal track data 
                    db       $60                          ; $041B: vol off, no pitch, note, instrument 
                    db       $04                          ; $041C: instrument 
                    db       $02                          ; $041D: normal track data, wait 0 
                    db       $94                          ; $041E: normal track data 
                    db       $60                          ; $041F: vol off, no pitch, note, instrument 
                    db       $03                          ; $0420: instrument 
                    db       $02                          ; $0421: normal track data, wait 0 
                    db       $8E                          ; $0422: normal track data 
                    db       $60                          ; $0423: vol off, no pitch, note, instrument 
                    db       $02                          ; $0424: instrument 
                    db       $02                          ; $0425: normal track data, wait 0 
                    db       $94                          ; $0426: normal track data 
                    db       $60                          ; $0427: vol off, no pitch, note, instrument 
                    db       $03                          ; $0428: instrument 
                    db       $02                          ; $0429: normal track data, wait 0 
                    db       $5C                          ; $042A: normal track data 
                    db       $60                          ; $042B: vol off, no pitch, note, instrument 
                    db       $04                          ; $042C: instrument 
                    db       $02                          ; $042D: normal track data, wait 0 
                    db       $8E                          ; $042E: normal track data 
                    db       $60                          ; $042F: vol off, no pitch, note, instrument 
                    db       $02                          ; $0430: instrument 
                    db       $02                          ; $0431: normal track data, wait 0 
                    db       $4F                          ; $0432: full optimization, no escape: D3 
                    db       $02                          ; $0433: normal track data, wait 0 
                    db       $94                          ; $0434: normal track data 
                    db       $60                          ; $0435: vol off, no pitch, note, instrument 
                    db       $03                          ; $0436: instrument 
                    db       $02                          ; $0437: normal track data, wait 0 
                    db       $5C                          ; $0438: normal track data 
                    db       $60                          ; $0439: vol off, no pitch, note, instrument 
                    db       $04                          ; $043A: instrument 
                    db       $02                          ; $043B: normal track data, wait 0 
                    db       $94                          ; $043C: normal track data 
                    db       $60                          ; $043D: vol off, no pitch, note, instrument 
                    db       $03                          ; $043E: instrument 
                    db       $00                          ; $043F: track end signature found 
trackDef10hiScore: 
                    db       $B0                          ; $0440: normal track data 
                    db       $E1                          ; $0441: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $0442: pitch 
                    db       $01                          ; $0444: instrument 
                    db       $B0                          ; $0445: normal track data 
                    db       $4B                          ; $0446: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $B4                          ; $0447: normal track data 
                    db       $41                          ; $0448: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $B0                          ; $0449: normal track data 
                    db       $4B                          ; $044A: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $B6                          ; $044B: normal track data 
                    db       $41                          ; $044C: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $B4                          ; $044D: normal track data 
                    db       $4B                          ; $044E: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $B0                          ; $044F: normal track data 
                    db       $41                          ; $0450: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $B6                          ; $0451: normal track data 
                    db       $4B                          ; $0452: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $C8                          ; $0453: normal track data 
                    db       $41                          ; $0454: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $B0                          ; $0455: normal track data 
                    db       $4B                          ; $0456: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $C4                          ; $0457: normal track data 
                    db       $41                          ; $0458: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $C8                          ; $0459: normal track data 
                    db       $4B                          ; $045A: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $BE                          ; $045B: normal track data 
                    db       $41                          ; $045C: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $C4                          ; $045D: normal track data 
                    db       $4B                          ; $045E: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $C4                          ; $045F: normal track data 
                    db       $41                          ; $0460: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $BE                          ; $0461: normal track data 
                    db       $4B                          ; $0462: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $B0                          ; $0463: normal track data 
                    db       $41                          ; $0464: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $C4                          ; $0465: normal track data 
                    db       $4B                          ; $0466: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $B4                          ; $0467: normal track data 
                    db       $41                          ; $0468: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $B0                          ; $0469: normal track data 
                    db       $4B                          ; $046A: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $B6                          ; $046B: normal track data 
                    db       $41                          ; $046C: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $B4                          ; $046D: normal track data 
                    db       $4B                          ; $046E: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $B0                          ; $046F: normal track data 
                    db       $41                          ; $0470: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $B6                          ; $0471: normal track data 
                    db       $4B                          ; $0472: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $C8                          ; $0473: normal track data 
                    db       $41                          ; $0474: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $B0                          ; $0475: normal track data 
                    db       $4B                          ; $0476: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $C4                          ; $0477: normal track data 
                    db       $41                          ; $0478: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $C8                          ; $0479: normal track data 
                    db       $4B                          ; $047A: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $BE                          ; $047B: normal track data 
                    db       $41                          ; $047C: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $C4                          ; $047D: normal track data 
                    db       $4B                          ; $047E: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $C4                          ; $047F: normal track data 
                    db       $41                          ; $0480: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $BE                          ; $0481: normal track data 
                    db       $4B                          ; $0482: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $B6                          ; $0483: normal track data 
                    db       $41                          ; $0484: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $C4                          ; $0485: normal track data 
                    db       $4B                          ; $0486: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $B4                          ; $0487: normal track data 
                    db       $41                          ; $0488: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $B6                          ; $0489: normal track data 
                    db       $4B                          ; $048A: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $B6                          ; $048B: normal track data 
                    db       $41                          ; $048C: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $B4                          ; $048D: normal track data 
                    db       $4B                          ; $048E: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $BA                          ; $048F: normal track data 
                    db       $41                          ; $0490: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $B6                          ; $0491: normal track data 
                    db       $4B                          ; $0492: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $BE                          ; $0493: normal track data 
                    db       $41                          ; $0494: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $BA                          ; $0495: normal track data 
                    db       $4B                          ; $0496: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $BA                          ; $0497: normal track data 
                    db       $41                          ; $0498: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $BE                          ; $0499: normal track data 
                    db       $4B                          ; $049A: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $B6                          ; $049B: normal track data 
                    db       $41                          ; $049C: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $BA                          ; $049D: normal track data 
                    db       $4B                          ; $049E: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $B4                          ; $049F: normal track data 
                    db       $41                          ; $04A0: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $B6                          ; $04A1: normal track data 
                    db       $4B                          ; $04A2: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $B6                          ; $04A3: normal track data 
                    db       $41                          ; $04A4: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $B0                          ; $04A5: normal track data 
                    db       $4B                          ; $04A6: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $B4                          ; $04A7: normal track data 
                    db       $41                          ; $04A8: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $B6                          ; $04A9: normal track data 
                    db       $4B                          ; $04AA: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $B6                          ; $04AB: normal track data 
                    db       $41                          ; $04AC: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $B4                          ; $04AD: normal track data 
                    db       $4B                          ; $04AE: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $BA                          ; $04AF: normal track data 
                    db       $41                          ; $04B0: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $B6                          ; $04B1: normal track data 
                    db       $4B                          ; $04B2: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $BE                          ; $04B3: normal track data 
                    db       $41                          ; $04B4: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $BA                          ; $04B5: normal track data 
                    db       $4B                          ; $04B6: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $BA                          ; $04B7: normal track data 
                    db       $41                          ; $04B8: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $BE                          ; $04B9: normal track data 
                    db       $4B                          ; $04BA: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $B6                          ; $04BB: normal track data 
                    db       $41                          ; $04BC: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $BA                          ; $04BD: normal track data 
                    db       $4B                          ; $04BE: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $B4                          ; $04BF: normal track data 
                    db       $41                          ; $04C0: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $B6                          ; $04C1: normal track data 
                    db       $4B                          ; $04C2: vol = $A (inverted), no pitch, no note, no instrument 
trackDef11hiScore: 
                    db       $B0                          ; $04C3: normal track data 
                    db       $E3                          ; $04C4: vol = $E (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $04C5: pitch 
                    db       $05                          ; $04C7: instrument 
                    db       $12                          ; $04C8: normal track data, wait 8 
                    db       $71                          ; $04C9: full optimization, no escape: G4 
                    db       $02                          ; $04CA: normal track data, wait 0 
                    db       $42                          ; $04CB: normal track data 
                    db       $00                          ; $04CC: vol off, no pitch, no note, no instrument 
                    db       $02                          ; $04CD: normal track data, wait 0 
                    db       $42                          ; $04CE: normal track data 
                    db       $00                          ; $04CF: vol off, no pitch, no note, no instrument 
                    db       $02                          ; $04D0: normal track data, wait 0 
                    db       $71                          ; $04D1: full optimization, no escape: G4 
                    db       $12                          ; $04D2: normal track data, wait 8 
                    db       $71                          ; $04D3: full optimization, no escape: G4 
                    db       $02                          ; $04D4: normal track data, wait 0 
                    db       $42                          ; $04D5: normal track data 
                    db       $00                          ; $04D6: vol off, no pitch, no note, no instrument 
                    db       $06                          ; $04D7: normal track data, wait 2 
                    db       $AC                          ; $04D8: normal track data 
                    db       $60                          ; $04D9: vol off, no pitch, note, instrument 
                    db       $06                          ; $04DA: instrument 
                    db       $12                          ; $04DB: normal track data, wait 8 
                    db       $6D                          ; $04DC: full optimization, no escape: F4 
                    db       $02                          ; $04DD: normal track data, wait 0 
                    db       $42                          ; $04DE: normal track data 
                    db       $00                          ; $04DF: vol off, no pitch, no note, no instrument 
                    db       $02                          ; $04E0: normal track data, wait 0 
                    db       $42                          ; $04E1: normal track data 
                    db       $00                          ; $04E2: vol off, no pitch, no note, no instrument 
                    db       $02                          ; $04E3: normal track data, wait 0 
                    db       $6D                          ; $04E4: full optimization, no escape: F4 
                    db       $12                          ; $04E5: normal track data, wait 8 
                    db       $6D                          ; $04E6: full optimization, no escape: F4 
                    db       $00                          ; $04E7: track end signature found 
trackDef13hiScore: 
                    db       $BA                          ; $04E8: normal track data 
                    db       $E1                          ; $04E9: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $04EA: pitch 
                    db       $01                          ; $04EC: instrument 
                    db       $BA                          ; $04ED: normal track data 
                    db       $4B                          ; $04EE: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $B8                          ; $04EF: normal track data 
                    db       $41                          ; $04F0: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $BA                          ; $04F1: normal track data 
                    db       $4B                          ; $04F2: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $BA                          ; $04F3: normal track data 
                    db       $41                          ; $04F4: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $B8                          ; $04F5: normal track data 
                    db       $4B                          ; $04F6: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $BE                          ; $04F7: normal track data 
                    db       $41                          ; $04F8: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $BA                          ; $04F9: normal track data 
                    db       $4B                          ; $04FA: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $C2                          ; $04FB: normal track data 
                    db       $41                          ; $04FC: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $BE                          ; $04FD: normal track data 
                    db       $4B                          ; $04FE: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $BE                          ; $04FF: normal track data 
                    db       $41                          ; $0500: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $C2                          ; $0501: normal track data 
                    db       $4B                          ; $0502: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $C2                          ; $0503: normal track data 
                    db       $41                          ; $0504: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $BE                          ; $0505: normal track data 
                    db       $4B                          ; $0506: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $C8                          ; $0507: normal track data 
                    db       $41                          ; $0508: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $C2                          ; $0509: normal track data 
                    db       $4B                          ; $050A: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $BE                          ; $050B: normal track data 
                    db       $41                          ; $050C: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $C8                          ; $050D: normal track data 
                    db       $4B                          ; $050E: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $BC                          ; $050F: normal track data 
                    db       $41                          ; $0510: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $BE                          ; $0511: normal track data 
                    db       $4B                          ; $0512: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $BE                          ; $0513: normal track data 
                    db       $41                          ; $0514: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $BC                          ; $0515: normal track data 
                    db       $4B                          ; $0516: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $C2                          ; $0517: normal track data 
                    db       $41                          ; $0518: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $BE                          ; $0519: normal track data 
                    db       $4B                          ; $051A: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $C6                          ; $051B: normal track data 
                    db       $41                          ; $051C: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $C2                          ; $051D: normal track data 
                    db       $4B                          ; $051E: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $C2                          ; $051F: normal track data 
                    db       $41                          ; $0520: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $C6                          ; $0521: normal track data 
                    db       $4B                          ; $0522: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $C6                          ; $0523: normal track data 
                    db       $41                          ; $0524: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $C2                          ; $0525: normal track data 
                    db       $4B                          ; $0526: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $CC                          ; $0527: normal track data 
                    db       $41                          ; $0528: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $C6                          ; $0529: normal track data 
                    db       $4B                          ; $052A: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $B0                          ; $052B: normal track data 
                    db       $41                          ; $052C: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $CC                          ; $052D: normal track data, note: A5 
                    db       $4F                          ; $052E: vol = $8 (inverted), no pitch, no note, no instrument 
                    db       $B4                          ; $052F: normal track data 
                    db       $41                          ; $0530: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $B0                          ; $0531: normal track data 
                    db       $4B                          ; $0532: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $B6                          ; $0533: normal track data 
                    db       $41                          ; $0534: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $B4                          ; $0535: normal track data 
                    db       $4B                          ; $0536: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $B0                          ; $0537: normal track data 
                    db       $41                          ; $0538: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $B6                          ; $0539: normal track data 
                    db       $4B                          ; $053A: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $C8                          ; $053B: normal track data 
                    db       $41                          ; $053C: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $B0                          ; $053D: normal track data 
                    db       $4B                          ; $053E: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $C4                          ; $053F: normal track data 
                    db       $41                          ; $0540: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $C8                          ; $0541: normal track data 
                    db       $4B                          ; $0542: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $BE                          ; $0543: normal track data 
                    db       $41                          ; $0544: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $C4                          ; $0545: normal track data 
                    db       $4B                          ; $0546: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $C4                          ; $0547: normal track data 
                    db       $41                          ; $0548: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $BE                          ; $0549: normal track data 
                    db       $4B                          ; $054A: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $B0                          ; $054B: normal track data 
                    db       $41                          ; $054C: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $C4                          ; $054D: normal track data 
                    db       $4B                          ; $054E: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $B4                          ; $054F: normal track data 
                    db       $41                          ; $0550: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $B0                          ; $0551: normal track data 
                    db       $4B                          ; $0552: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $B6                          ; $0553: normal track data 
                    db       $41                          ; $0554: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $B4                          ; $0555: normal track data 
                    db       $4B                          ; $0556: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $B0                          ; $0557: normal track data 
                    db       $41                          ; $0558: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $B6                          ; $0559: normal track data 
                    db       $4B                          ; $055A: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $C8                          ; $055B: normal track data 
                    db       $41                          ; $055C: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $B0                          ; $055D: normal track data 
                    db       $4B                          ; $055E: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $C4                          ; $055F: normal track data 
                    db       $41                          ; $0560: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $C8                          ; $0561: normal track data 
                    db       $4B                          ; $0562: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $BE                          ; $0563: normal track data 
                    db       $41                          ; $0564: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $C4                          ; $0565: normal track data 
                    db       $4B                          ; $0566: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $C4                          ; $0567: normal track data 
                    db       $41                          ; $0568: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $BE                          ; $0569: normal track data 
                    db       $4B                          ; $056A: vol = $A (inverted), no pitch, no note, no instrument 
trackDef14hiScore: 
                    db       $B0                          ; $056B: normal track data 
                    db       $E0                          ; $056C: vol off, pitch, note, instrument 
                    dw       $0000                        ; $056D: pitch 
                    db       $06                          ; $056F: instrument 
                    db       $12                          ; $0570: normal track data, wait 8 
                    db       $71                          ; $0571: full optimization, no escape: G4 
                    db       $0A                          ; $0572: normal track data, wait 4 
                    db       $75                          ; $0573: full optimization, no escape: A4 
                    db       $42                          ; $0574: normal track data 
                    db       $00                          ; $0575: vol off, no pitch, no note, no instrument 
                    db       $10                          ; $0576: normal track data, wait 7 
                    db       $75                          ; $0577: full optimization, no escape: A4 
                    db       $0A                          ; $0578: normal track data, wait 4 
                    db       $B0                          ; $0579: normal track data 
                    db       $60                          ; $057A: vol off, no pitch, note, instrument 
                    db       $05                          ; $057B: instrument 
                    db       $12                          ; $057C: normal track data, wait 8 
                    db       $71                          ; $057D: full optimization, no escape: G4 
                    db       $42                          ; $057E: normal track data 
                    db       $00                          ; $057F: vol off, no pitch, no note, no instrument 
                    db       $06                          ; $0580: normal track data, wait 2 
                    db       $42                          ; $0581: normal track data 
                    db       $00                          ; $0582: vol off, no pitch, no note, no instrument 
                    db       $AC                          ; $0583: normal track data 
                    db       $60                          ; $0584: vol off, no pitch, note, instrument 
                    db       $06                          ; $0585: instrument 
                    db       $12                          ; $0586: normal track data, wait 8 
                    db       $6D                          ; $0587: full optimization, no escape: F4 
                    db       $00                          ; $0588: track end signature found 
trackDef15hiScore: 
                    db       $B0                          ; $0589: normal track data 
                    db       $E1                          ; $058A: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $058B: pitch 
                    db       $01                          ; $058D: instrument 
                    db       $B4                          ; $058E: normal track data 
                    db       $4B                          ; $058F: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $B4                          ; $0590: normal track data 
                    db       $41                          ; $0591: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $B0                          ; $0592: normal track data 
                    db       $4B                          ; $0593: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $B6                          ; $0594: normal track data 
                    db       $41                          ; $0595: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $B4                          ; $0596: normal track data 
                    db       $4B                          ; $0597: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $B0                          ; $0598: normal track data 
                    db       $41                          ; $0599: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $B6                          ; $059A: normal track data 
                    db       $4B                          ; $059B: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $C8                          ; $059C: normal track data 
                    db       $41                          ; $059D: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $B0                          ; $059E: normal track data 
                    db       $4B                          ; $059F: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $C4                          ; $05A0: normal track data 
                    db       $41                          ; $05A1: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $C8                          ; $05A2: normal track data 
                    db       $4B                          ; $05A3: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $BE                          ; $05A4: normal track data 
                    db       $41                          ; $05A5: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $C4                          ; $05A6: normal track data 
                    db       $4B                          ; $05A7: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $C4                          ; $05A8: normal track data 
                    db       $41                          ; $05A9: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $BE                          ; $05AA: normal track data 
                    db       $4B                          ; $05AB: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $B0                          ; $05AC: normal track data 
                    db       $41                          ; $05AD: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $C4                          ; $05AE: normal track data 
                    db       $4B                          ; $05AF: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $B4                          ; $05B0: normal track data 
                    db       $41                          ; $05B1: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $B0                          ; $05B2: normal track data 
                    db       $4B                          ; $05B3: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $B6                          ; $05B4: normal track data 
                    db       $41                          ; $05B5: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $B4                          ; $05B6: normal track data 
                    db       $4B                          ; $05B7: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $BA                          ; $05B8: normal track data 
                    db       $41                          ; $05B9: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $B6                          ; $05BA: normal track data 
                    db       $4B                          ; $05BB: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $BE                          ; $05BC: normal track data 
                    db       $41                          ; $05BD: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $BA                          ; $05BE: normal track data 
                    db       $4B                          ; $05BF: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $C4                          ; $05C0: normal track data 
                    db       $41                          ; $05C1: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $BE                          ; $05C2: normal track data 
                    db       $4B                          ; $05C3: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $C8                          ; $05C4: normal track data 
                    db       $41                          ; $05C5: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $C4                          ; $05C6: normal track data 
                    db       $4B                          ; $05C7: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $CE                          ; $05C8: normal track data 
                    db       $41                          ; $05C9: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $C8                          ; $05CA: normal track data 
                    db       $4B                          ; $05CB: vol = $A (inverted), no pitch, no note, no instrument 
trackDef16hiScore: 
                    db       $A8                          ; $05CC: normal track data 
                    db       $E0                          ; $05CD: vol off, pitch, note, instrument 
                    dw       $0000                        ; $05CE: pitch 
                    db       $07                          ; $05D0: instrument 
                    db       $0A                          ; $05D1: normal track data, wait 4 
                    db       $42                          ; $05D2: normal track data 
                    db       $00                          ; $05D3: vol off, no pitch, no note, no instrument 
                    db       $06                          ; $05D4: normal track data, wait 2 
                    db       $69                          ; $05D5: full optimization, no escape: D#4 
                    db       $0A                          ; $05D6: normal track data, wait 4 
                    db       $A6                          ; $05D7: normal track data 
                    db       $60                          ; $05D8: vol off, no pitch, note, instrument 
                    db       $08                          ; $05D9: instrument 
                    db       $0E                          ; $05DA: normal track data, wait 6 
                    db       $42                          ; $05DB: normal track data 
                    db       $00                          ; $05DC: vol off, no pitch, no note, no instrument 
                    db       $02                          ; $05DD: normal track data, wait 0 
                    db       $42                          ; $05DE: normal track data 
                    db       $00                          ; $05DF: vol off, no pitch, no note, no instrument 
                    db       $00                          ; $05E0: track end signature found 
