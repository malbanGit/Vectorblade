; This file was build using VIDE - Vectrex Integrated Development Environment
; Original bin file was: projects/Vectorblade/Music/BossX.bin
; 
; offset for AKS file assumed: $0000 guessed by accessing byte data[13] * 256)
; not used by vectrex player and therefor omitted:
;  DB "AT10" ; Signature of Arkos Tracker files
;  DB $01 ; sample channel
;  DB $40, 42, 0f ; YM custom frequence - little endian
;  DB $02 ; Replay frequency (0=13hz,1=25hz,2=50hz,3=100hz,4=150hz,5=300hz)
SongAddressBossX: 
                    db       $06                          ; $0009: default speed 
                    dw       $0074                        ; $000A: size of instrument table (without this word pointer) 
                    dw       instrument0BossX             ; $000C: [$0016] pointer to instrument 0 
                    dw       instrument1BossX             ; $000E: [$001F] pointer to instrument 1 
                    dw       instrument2BossX             ; $0010: [$0037] pointer to instrument 2 
                    dw       instrument3BossX             ; $0012: [$0052] pointer to instrument 3 
                    dw       instrument4BossX             ; $0014: [$0059] pointer to instrument 4 
instrument0BossX: 
                    db       $00                          ; $0016: speed 
                    db       $00                          ; $0017: retrig 
instrument0loopBossX: 
                    db       $00                          ; $0018: dataColumn_0 (non hard), vol=$0 
                    db       $00                          ; $0019: dataColumn_0 (non hard), vol=$0 
                    db       $00                          ; $001A: dataColumn_0 (non hard), vol=$0 
                    db       $00                          ; $001B: dataColumn_0 (non hard), vol=$0 
                    db       $0D                          ; $001C: dataColumn_0 (hard) 
                    dw       instrument0loopBossX         ; $001D: [$0018] loop 
instrument1BossX: 
                    db       $05                          ; $001F: speed 
                    db       $00                          ; $0020: retrig 
                    db       $3C                          ; $0021: dataColumn_0 (non hard), vol=$F 
                    db       $BC                          ; $0022: dataColumn_0 (non hard), vol=$F 
                    dw       $FFFF                        ; $0023: pitch 
                    db       $BC                          ; $0025: dataColumn_0 (non hard), vol=$F 
                    dw       $0002                        ; $0026: pitch 
instrument1loopBossX: 
                    db       $BC                          ; $0028: dataColumn_0 (non hard), vol=$F 
                    dw       $FFFF                        ; $0029: pitch 
                    db       $BC                          ; $002B: dataColumn_0 (non hard), vol=$F 
                    dw       $FFFE                        ; $002C: pitch 
                    db       $BC                          ; $002E: dataColumn_0 (non hard), vol=$F 
                    dw       $0001                        ; $002F: pitch 
                    db       $BC                          ; $0031: dataColumn_0 (non hard), vol=$F 
                    dw       $FFFE                        ; $0032: pitch 
                    db       $0D                          ; $0034: dataColumn_0 (hard) 
                    dw       instrument1loopBossX         ; $0035: [$0028] loop 
instrument2BossX: 
                    db       $01                          ; $0037: speed 
                    db       $00                          ; $0038: retrig 
                    db       $36                          ; $0039: dataColumn_0 (non hard), vol=$D 
                    db       $1F                          ; $003A: dataColumn_1, noise=$1F 
                    db       $7C                          ; $003B: dataColumn_0 (non hard), vol=$F 
                    db       $EC                          ; $003C: arpegio 
                    db       $78                          ; $003D: dataColumn_0 (non hard), vol=$E 
                    db       $ED                          ; $003E: arpegio 
                    db       $74                          ; $003F: dataColumn_0 (non hard), vol=$D 
                    db       $EE                          ; $0040: arpegio 
                    db       $70                          ; $0041: dataColumn_0 (non hard), vol=$C 
                    db       $F0                          ; $0042: arpegio 
                    db       $70                          ; $0043: dataColumn_0 (non hard), vol=$C 
                    db       $F0                          ; $0044: arpegio 
                    db       $6C                          ; $0045: dataColumn_0 (non hard), vol=$B 
                    db       $ED                          ; $0046: arpegio 
                    db       $68                          ; $0047: dataColumn_0 (non hard), vol=$A 
                    db       $EE                          ; $0048: arpegio 
                    db       $68                          ; $0049: dataColumn_0 (non hard), vol=$A 
                    db       $EE                          ; $004A: arpegio 
                    db       $68                          ; $004B: dataColumn_0 (non hard), vol=$A 
                    db       $EE                          ; $004C: arpegio 
                    db       $64                          ; $004D: dataColumn_0 (non hard), vol=$9 
                    db       $EE                          ; $004E: arpegio 
                    db       $0D                          ; $004F: dataColumn_0 (hard) 
                    dw       instrument0loopBossX         ; $0050: [$0018] loop 
instrument3BossX: 
                    db       $01                          ; $0052: speed 
                    db       $00                          ; $0053: retrig 
                    db       $2E                          ; $0054: dataColumn_0 (non hard), vol=$B 
                    db       $01                          ; $0055: dataColumn_1, noise=$01 
                    db       $0D                          ; $0056: dataColumn_0 (hard) 
                    dw       instrument0loopBossX         ; $0057: [$0018] loop 
instrument4BossX: 
                    db       $01                          ; $0059: speed 
                    db       $00                          ; $005A: retrig 
                    db       $7E                          ; $005B: dataColumn_0 (non hard), vol=$F 
                    db       $3F                          ; $005C: dataColumn_1, noise=$1F 
                    db       $18                          ; $005D: arpegio 
                    db       $7C                          ; $005E: dataColumn_0 (non hard), vol=$F 
                    db       $1C                          ; $005F: arpegio 
                    db       $32                          ; $0060: dataColumn_0 (non hard), vol=$C 
                    db       $03                          ; $0061: dataColumn_1, noise=$03 
                    db       $7C                          ; $0062: dataColumn_0 (non hard), vol=$F 
                    db       $1A                          ; $0063: arpegio 
                    db       $00                          ; $0064: dataColumn_0 (non hard), vol=$0 
                    db       $7C                          ; $0065: dataColumn_0 (non hard), vol=$F 
                    db       $1A                          ; $0066: arpegio 
                    db       $78                          ; $0067: dataColumn_0 (non hard), vol=$E 
                    db       $18                          ; $0068: arpegio 
                    db       $6C                          ; $0069: dataColumn_0 (non hard), vol=$B 
                    db       $18                          ; $006A: arpegio 
                    db       $68                          ; $006B: dataColumn_0 (non hard), vol=$A 
                    db       $1A                          ; $006C: arpegio 
                    db       $64                          ; $006D: dataColumn_0 (non hard), vol=$9 
                    db       $18                          ; $006E: arpegio 
                    db       $5C                          ; $006F: dataColumn_0 (non hard), vol=$7 
                    db       $1A                          ; $0070: arpegio 
                    db       $58                          ; $0071: dataColumn_0 (non hard), vol=$6 
                    db       $18                          ; $0072: arpegio 
                    db       $54                          ; $0073: dataColumn_0 (non hard), vol=$5 
                    db       $1A                          ; $0074: arpegio 
                    db       $50                          ; $0075: dataColumn_0 (non hard), vol=$4 
                    db       $18                          ; $0076: arpegio 
                    db       $4C                          ; $0077: dataColumn_0 (non hard), vol=$3 
                    db       $18                          ; $0078: arpegio 
                    db       $48                          ; $0079: dataColumn_0 (non hard), vol=$2 
                    db       $18                          ; $007A: arpegio 
                    db       $44                          ; $007B: dataColumn_0 (non hard), vol=$1 
                    db       $18                          ; $007C: arpegio 
                    db       $0D                          ; $007D: dataColumn_0 (hard) 
                    dw       instrument0loopBossX         ; $007E: [$0018] loop 
; start of linker definition
linkerBossX: 
                    db       $2B                          ; $0080: first height 
                    db       $00                          ; $0081: transposition1 
                    db       $00                          ; $0082: transposition2 
                    db       $00                          ; $0083: transposition3 
                    dw       specialtrackDef0BossX        ; $0084: [$0090] specialTrack 
pattern0DefinitionBossX: 
                    db       $00                          ; $0086: pattern 0 state 
                    dw       trackDef0BossX               ; $0087: [$0092] pattern 0, track 1 
                    dw       trackDef1BossX               ; $0089: [$0125] pattern 0, track 2 
                    dw       trackDef2BossX               ; $008B: [$0193] pattern 0, track 3 
pattern1DefinitionBossX: 
                    db       $01                          ; $008D: pattern 1 state 
                    dw       pattern0DefinitionBossX      ; $008E: [$0086] song restart address 
specialtrackDef0BossX: 
                    db       $51                          ; $0090: data, speed 20 
                    db       $00                          ; $0091: wait 128 
trackDef0BossX: 
                    db       $7A                          ; $0092: normal track data 
                    db       $E1                          ; $0093: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $FFFE                        ; $0094: pitch 
                    db       $01                          ; $0096: instrument 
                    db       $42                          ; $0097: normal track data 
                    db       $80                          ; $0098: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $0099: pitch 
                    db       $42                          ; $009B: normal track data 
                    db       $80                          ; $009C: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $009D: pitch 
                    db       $42                          ; $009F: normal track data 
                    db       $80                          ; $00A0: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $00A1: pitch 
                    db       $42                          ; $00A3: normal track data 
                    db       $80                          ; $00A4: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $00A5: pitch 
                    db       $42                          ; $00A7: normal track data 
                    db       $00                          ; $00A8: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $00A9: normal track data 
                    db       $80                          ; $00AA: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $00AB: pitch 
                    db       $42                          ; $00AD: normal track data 
                    db       $80                          ; $00AE: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $00AF: pitch 
                    db       $78                          ; $00B1: normal track data 
                    db       $C0                          ; $00B2: vol off, pitch, note, no instrument 
                    dw       $FFFE                        ; $00B3: pitch 
                    db       $42                          ; $00B5: normal track data 
                    db       $80                          ; $00B6: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $00B7: pitch 
                    db       $42                          ; $00B9: normal track data 
                    db       $80                          ; $00BA: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $00BB: pitch 
                    db       $42                          ; $00BD: normal track data 
                    db       $80                          ; $00BE: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $00BF: pitch 
                    db       $42                          ; $00C1: normal track data 
                    db       $80                          ; $00C2: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $00C3: pitch 
                    db       $42                          ; $00C5: normal track data 
                    db       $00                          ; $00C6: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $00C7: normal track data 
                    db       $80                          ; $00C8: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $00C9: pitch 
                    db       $42                          ; $00CB: normal track data 
                    db       $80                          ; $00CC: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $00CD: pitch 
                    db       $72                          ; $00CF: normal track data 
                    db       $C0                          ; $00D0: vol off, pitch, note, no instrument 
                    dw       $FFFE                        ; $00D1: pitch 
                    db       $42                          ; $00D3: normal track data 
                    db       $80                          ; $00D4: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $00D5: pitch 
                    db       $42                          ; $00D7: normal track data 
                    db       $80                          ; $00D8: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $00D9: pitch 
                    db       $42                          ; $00DB: normal track data 
                    db       $80                          ; $00DC: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $00DD: pitch 
                    db       $42                          ; $00DF: normal track data 
                    db       $80                          ; $00E0: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $00E1: pitch 
                    db       $42                          ; $00E3: normal track data 
                    db       $00                          ; $00E4: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $00E5: normal track data 
                    db       $80                          ; $00E6: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $00E7: pitch 
                    db       $42                          ; $00E9: normal track data 
                    db       $80                          ; $00EA: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $00EB: pitch 
                    db       $70                          ; $00ED: normal track data 
                    db       $C0                          ; $00EE: vol off, pitch, note, no instrument 
                    dw       $FFFE                        ; $00EF: pitch 
                    db       $42                          ; $00F1: normal track data 
                    db       $80                          ; $00F2: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $00F3: pitch 
                    db       $42                          ; $00F5: normal track data 
                    db       $80                          ; $00F6: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $00F7: pitch 
                    db       $42                          ; $00F9: normal track data 
                    db       $80                          ; $00FA: vol off, pitch, no note, no instrument 
                    dw       $FFFF                        ; $00FB: pitch 
                    db       $42                          ; $00FD: normal track data 
                    db       $80                          ; $00FE: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $00FF: pitch 
                    db       $42                          ; $0101: normal track data 
                    db       $80                          ; $0102: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $0103: pitch 
                    db       $42                          ; $0105: normal track data 
                    db       $80                          ; $0106: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $0107: pitch 
                    db       $42                          ; $0109: normal track data 
                    db       $83                          ; $010A: vol = $E (inverted), no pitch, no note, no instrument 
                    dw       $0002                        ; $010B: pitch 
                    db       $42                          ; $010D: normal track data, note: C0 
                    db       $07                          ; $010E: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $010F: normal track data 
                    db       $09                          ; $0110: vol = $B (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0111: normal track data 
                    db       $0B                          ; $0112: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0113: normal track data, note: C0 
                    db       $0D                          ; $0114: vol = $9 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0115: normal track data, note: C0 
                    db       $0F                          ; $0116: vol = $8 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0117: normal track data 
                    db       $11                          ; $0118: vol = $7 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0119: normal track data 
                    db       $13                          ; $011A: vol = $6 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $011B: normal track data, note: C0 
                    db       $17                          ; $011C: vol = $4 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $011D: normal track data 
                    db       $19                          ; $011E: vol = $3 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $011F: normal track data, note: C0 
                    db       $1F                          ; $0120: vol = $0 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0121: normal track data 
                    db       $80                          ; $0122: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $0123: pitch 
trackDef1BossX: 
                    db       $7E                          ; $0125: normal track data 
                    db       $E1                          ; $0126: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $0127: pitch 
                    db       $02                          ; $0129: instrument 
                    db       $84                          ; $012A: normal track data 
                    db       $60                          ; $012B: vol off, no pitch, note, instrument 
                    db       $03                          ; $012C: instrument 
                    db       $58                          ; $012D: normal track data 
                    db       $60                          ; $012E: vol off, no pitch, note, instrument 
                    db       $04                          ; $012F: instrument 
                    db       $84                          ; $0130: normal track data 
                    db       $60                          ; $0131: vol off, no pitch, note, instrument 
                    db       $03                          ; $0132: instrument 
                    db       $7E                          ; $0133: normal track data 
                    db       $60                          ; $0134: vol off, no pitch, note, instrument 
                    db       $02                          ; $0135: instrument 
                    db       $3F                          ; $0136: full optimization, no escape: F#2 
                    db       $58                          ; $0137: normal track data 
                    db       $60                          ; $0138: vol off, no pitch, note, instrument 
                    db       $04                          ; $0139: instrument 
                    db       $84                          ; $013A: normal track data 
                    db       $60                          ; $013B: vol off, no pitch, note, instrument 
                    db       $03                          ; $013C: instrument 
                    db       $7E                          ; $013D: normal track data 
                    db       $60                          ; $013E: vol off, no pitch, note, instrument 
                    db       $02                          ; $013F: instrument 
                    db       $84                          ; $0140: normal track data 
                    db       $60                          ; $0141: vol off, no pitch, note, instrument 
                    db       $03                          ; $0142: instrument 
                    db       $58                          ; $0143: normal track data 
                    db       $60                          ; $0144: vol off, no pitch, note, instrument 
                    db       $04                          ; $0145: instrument 
                    db       $84                          ; $0146: normal track data 
                    db       $60                          ; $0147: vol off, no pitch, note, instrument 
                    db       $03                          ; $0148: instrument 
                    db       $7E                          ; $0149: normal track data 
                    db       $60                          ; $014A: vol off, no pitch, note, instrument 
                    db       $02                          ; $014B: instrument 
                    db       $3F                          ; $014C: full optimization, no escape: F#2 
                    db       $58                          ; $014D: normal track data 
                    db       $60                          ; $014E: vol off, no pitch, note, instrument 
                    db       $04                          ; $014F: instrument 
                    db       $84                          ; $0150: normal track data 
                    db       $60                          ; $0151: vol off, no pitch, note, instrument 
                    db       $03                          ; $0152: instrument 
                    db       $7E                          ; $0153: normal track data 
                    db       $60                          ; $0154: vol off, no pitch, note, instrument 
                    db       $02                          ; $0155: instrument 
                    db       $84                          ; $0156: normal track data 
                    db       $60                          ; $0157: vol off, no pitch, note, instrument 
                    db       $03                          ; $0158: instrument 
                    db       $58                          ; $0159: normal track data 
                    db       $60                          ; $015A: vol off, no pitch, note, instrument 
                    db       $04                          ; $015B: instrument 
                    db       $84                          ; $015C: normal track data 
                    db       $60                          ; $015D: vol off, no pitch, note, instrument 
                    db       $03                          ; $015E: instrument 
                    db       $7E                          ; $015F: normal track data 
                    db       $60                          ; $0160: vol off, no pitch, note, instrument 
                    db       $02                          ; $0161: instrument 
                    db       $3F                          ; $0162: full optimization, no escape: F#2 
                    db       $58                          ; $0163: normal track data 
                    db       $60                          ; $0164: vol off, no pitch, note, instrument 
                    db       $04                          ; $0165: instrument 
                    db       $84                          ; $0166: normal track data 
                    db       $60                          ; $0167: vol off, no pitch, note, instrument 
                    db       $03                          ; $0168: instrument 
                    db       $7E                          ; $0169: normal track data 
                    db       $60                          ; $016A: vol off, no pitch, note, instrument 
                    db       $02                          ; $016B: instrument 
                    db       $84                          ; $016C: normal track data 
                    db       $60                          ; $016D: vol off, no pitch, note, instrument 
                    db       $03                          ; $016E: instrument 
                    db       $58                          ; $016F: normal track data 
                    db       $60                          ; $0170: vol off, no pitch, note, instrument 
                    db       $04                          ; $0171: instrument 
                    db       $84                          ; $0172: normal track data 
                    db       $60                          ; $0173: vol off, no pitch, note, instrument 
                    db       $03                          ; $0174: instrument 
                    db       $7E                          ; $0175: normal track data 
                    db       $60                          ; $0176: vol off, no pitch, note, instrument 
                    db       $02                          ; $0177: instrument 
                    db       $3F                          ; $0178: full optimization, no escape: F#2 
                    db       $58                          ; $0179: normal track data 
                    db       $60                          ; $017A: vol off, no pitch, note, instrument 
                    db       $04                          ; $017B: instrument 
                    db       $58                          ; $017C: normal track data, note: B0 
                    db       $45                          ; $017D: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $58                          ; $017E: normal track data, note: B0 
                    db       $47                          ; $017F: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $58                          ; $0180: normal track data 
                    db       $49                          ; $0181: vol = $B (inverted), no pitch, no note, no instrument 
                    db       $58                          ; $0182: normal track data 
                    db       $4B                          ; $0183: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $58                          ; $0184: normal track data, note: B0 
                    db       $4D                          ; $0185: vol = $9 (inverted), no pitch, no note, no instrument 
                    db       $58                          ; $0186: normal track data, note: B0 
                    db       $4F                          ; $0187: vol = $8 (inverted), no pitch, no note, no instrument 
                    db       $58                          ; $0188: normal track data 
                    db       $51                          ; $0189: vol = $7 (inverted), no pitch, no note, no instrument 
                    db       $58                          ; $018A: normal track data 
                    db       $53                          ; $018B: vol = $6 (inverted), no pitch, no note, no instrument 
                    db       $58                          ; $018C: normal track data, note: B0 
                    db       $57                          ; $018D: vol = $4 (inverted), no pitch, no note, no instrument 
                    db       $58                          ; $018E: normal track data 
                    db       $59                          ; $018F: vol = $3 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0190: normal track data, note: C0 
                    db       $1F                          ; $0191: vol = $0 (inverted), no pitch, no note, no instrument 
                    db       $00                          ; $0192: track end signature found 
trackDef2BossX: 
                    db       $7A                          ; $0193: normal track data 
                    db       $E1                          ; $0194: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $0195: pitch 
                    db       $01                          ; $0197: instrument 
                    db       $0E                          ; $0198: normal track data, wait 6 
                    db       $39                          ; $0199: full optimization, no escape: D#2 
                    db       $0E                          ; $019A: normal track data, wait 6 
                    db       $33                          ; $019B: full optimization, no escape: C2 
                    db       $0E                          ; $019C: normal track data, wait 6 
                    db       $31                          ; $019D: full optimization, no escape: B1 
                    db       $0C                          ; $019E: normal track data, wait 5 
                    db       $42                          ; $019F: normal track data 
                    db       $83                          ; $01A0: vol = $E (inverted), no pitch, no note, no instrument 
                    dw       $0002                        ; $01A1: pitch 
                    db       $42                          ; $01A3: normal track data, note: C0 
                    db       $07                          ; $01A4: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $01A5: normal track data 
                    db       $09                          ; $01A6: vol = $B (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $01A7: normal track data 
                    db       $0B                          ; $01A8: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $01A9: normal track data, note: C0 
                    db       $0D                          ; $01AA: vol = $9 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $01AB: normal track data, note: C0 
                    db       $0F                          ; $01AC: vol = $8 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $01AD: normal track data 
                    db       $11                          ; $01AE: vol = $7 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $01AF: normal track data 
                    db       $13                          ; $01B0: vol = $6 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $01B1: normal track data, note: C0 
                    db       $17                          ; $01B2: vol = $4 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $01B3: normal track data 
                    db       $19                          ; $01B4: vol = $3 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $01B5: normal track data, note: C0 
                    db       $1F                          ; $01B6: vol = $0 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $01B7: normal track data 
                    db       $80                          ; $01B8: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $01B9: pitch 
