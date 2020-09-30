; This file was build using VIDE - Vectrex Integrated Development Environment
; Original bin file was: projects/Vectorblade/Music/BossM.bin
; 
; offset for AKS file assumed: $0000 guessed by accessing byte data[13] * 256)
; not used by vectrex player and therefor omitted:
;  DB "AT10" ; Signature of Arkos Tracker files
;  DB $01 ; sample channel
;  DB $40, 42, 0f ; YM custom frequence - little endian
;  DB $02 ; Replay frequency (0=13hz,1=25hz,2=50hz,3=100hz,4=150hz,5=300hz)
SongAddressBossM: 
                    db       $06                          ; $0009: default speed 
                    dw       $009B                        ; $000A: size of instrument table (without this word pointer) 
                    dw       instrument0BossM             ; $000C: [$0018] pointer to instrument 0 
                    dw       instrument1BossM             ; $000E: [$0021] pointer to instrument 1 
                    dw       instrument2BossM             ; $0010: [$0047] pointer to instrument 2 
                    dw       instrument3BossM             ; $0012: [$0066] pointer to instrument 3 
                    dw       instrument4BossM             ; $0014: [$006D] pointer to instrument 4 
                    dw       instrument5BossM             ; $0016: [$0094] pointer to instrument 5 
instrument0BossM: 
                    db       $00                          ; $0018: speed 
                    db       $00                          ; $0019: retrig 
instrument0loopBossM: 
                    db       $00                          ; $001A: dataColumn_0 (non hard), vol=$0 
                    db       $00                          ; $001B: dataColumn_0 (non hard), vol=$0 
                    db       $00                          ; $001C: dataColumn_0 (non hard), vol=$0 
                    db       $00                          ; $001D: dataColumn_0 (non hard), vol=$0 
                    db       $0D                          ; $001E: dataColumn_0 (hard) 
                    dw       instrument0loopBossM         ; $001F: [$001A] loop 
instrument1BossM: 
                    db       $02                          ; $0021: speed 
                    db       $00                          ; $0022: retrig 
                    db       $3C                          ; $0023: dataColumn_0 (non hard), vol=$F 
                    db       $7C                          ; $0024: dataColumn_0 (non hard), vol=$F 
                    db       $E8                          ; $0025: arpegio 
                    db       $FC                          ; $0026: dataColumn_0 (non hard), vol=$F 
                    dw       $FFFF                        ; $0027: pitch 
                    db       $E8                          ; $0029: arpegio 
                    db       $38                          ; $002A: dataColumn_0 (non hard), vol=$E 
                    db       $74                          ; $002B: dataColumn_0 (non hard), vol=$D 
                    db       $F4                          ; $002C: arpegio 
                    db       $70                          ; $002D: dataColumn_0 (non hard), vol=$C 
                    db       $E8                          ; $002E: arpegio 
                    db       $2C                          ; $002F: dataColumn_0 (non hard), vol=$B 
                    db       $68                          ; $0030: dataColumn_0 (non hard), vol=$A 
                    db       $E8                          ; $0031: arpegio 
                    db       $E4                          ; $0032: dataColumn_0 (non hard), vol=$9 
                    dw       $FFFF                        ; $0033: pitch 
                    db       $E8                          ; $0035: arpegio 
                    db       $60                          ; $0036: dataColumn_0 (non hard), vol=$8 
                    db       $E8                          ; $0037: arpegio 
                    db       $20                          ; $0038: dataColumn_0 (non hard), vol=$8 
                    db       $60                          ; $0039: dataColumn_0 (non hard), vol=$8 
                    db       $F4                          ; $003A: arpegio 
                    db       $1C                          ; $003B: dataColumn_0 (non hard), vol=$7 
                    db       $5C                          ; $003C: dataColumn_0 (non hard), vol=$7 
                    db       $F4                          ; $003D: arpegio 
                    db       $1C                          ; $003E: dataColumn_0 (non hard), vol=$7 
                    db       $18                          ; $003F: dataColumn_0 (non hard), vol=$6 
                    db       $10                          ; $0040: dataColumn_0 (non hard), vol=$4 
                    db       $08                          ; $0041: dataColumn_0 (non hard), vol=$2 
                    db       $02                          ; $0042: dataColumn_0 (non hard), vol=$0 
                    db       $20                          ; $0043: dataColumn_1 
                    db       $0D                          ; $0044: dataColumn_0 (hard) 
                    dw       instrument0loopBossM         ; $0045: [$001A] loop 
instrument2BossM: 
                    db       $01                          ; $0047: speed 
                    db       $00                          ; $0048: retrig 
                    db       $32                          ; $0049: dataColumn_0 (non hard), vol=$C 
                    db       $01                          ; $004A: dataColumn_1, noise=$01 
                    db       $36                          ; $004B: dataColumn_0 (non hard), vol=$D 
                    db       $16                          ; $004C: dataColumn_1, noise=$16 
                    db       $78                          ; $004D: dataColumn_0 (non hard), vol=$E 
                    db       $EC                          ; $004E: arpegio 
                    db       $74                          ; $004F: dataColumn_0 (non hard), vol=$D 
                    db       $EE                          ; $0050: arpegio 
                    db       $70                          ; $0051: dataColumn_0 (non hard), vol=$C 
                    db       $EE                          ; $0052: arpegio 
                    db       $6C                          ; $0053: dataColumn_0 (non hard), vol=$B 
                    db       $F0                          ; $0054: arpegio 
                    db       $68                          ; $0055: dataColumn_0 (non hard), vol=$A 
                    db       $F0                          ; $0056: arpegio 
                    db       $68                          ; $0057: dataColumn_0 (non hard), vol=$A 
                    db       $ED                          ; $0058: arpegio 
                    db       $64                          ; $0059: dataColumn_0 (non hard), vol=$9 
                    db       $EE                          ; $005A: arpegio 
                    db       $64                          ; $005B: dataColumn_0 (non hard), vol=$9 
                    db       $EE                          ; $005C: arpegio 
                    db       $5C                          ; $005D: dataColumn_0 (non hard), vol=$7 
                    db       $EE                          ; $005E: arpegio 
                    db       $54                          ; $005F: dataColumn_0 (non hard), vol=$5 
                    db       $EE                          ; $0060: arpegio 
                    db       $50                          ; $0061: dataColumn_0 (non hard), vol=$4 
                    db       $EE                          ; $0062: arpegio 
                    db       $0D                          ; $0063: dataColumn_0 (hard) 
                    dw       instrument0loopBossM         ; $0064: [$001A] loop 
instrument3BossM: 
                    db       $01                          ; $0066: speed 
                    db       $00                          ; $0067: retrig 
                    db       $32                          ; $0068: dataColumn_0 (non hard), vol=$C 
                    db       $01                          ; $0069: dataColumn_1, noise=$01 
                    db       $0D                          ; $006A: dataColumn_0 (hard) 
                    dw       instrument0loopBossM         ; $006B: [$001A] loop 
instrument4BossM: 
                    db       $01                          ; $006D: speed 
                    db       $00                          ; $006E: retrig 
                    db       $7E                          ; $006F: dataColumn_0 (non hard), vol=$F 
                    db       $3F                          ; $0070: dataColumn_1, noise=$1F 
                    db       $18                          ; $0071: arpegio 
                    db       $7C                          ; $0072: dataColumn_0 (non hard), vol=$F 
                    db       $1C                          ; $0073: arpegio 
                    db       $2E                          ; $0074: dataColumn_0 (non hard), vol=$B 
                    db       $05                          ; $0075: dataColumn_1, noise=$05 
                    db       $7C                          ; $0076: dataColumn_0 (non hard), vol=$F 
                    db       $1A                          ; $0077: arpegio 
                    db       $00                          ; $0078: dataColumn_0 (non hard), vol=$0 
                    db       $7C                          ; $0079: dataColumn_0 (non hard), vol=$F 
                    db       $1A                          ; $007A: arpegio 
                    db       $78                          ; $007B: dataColumn_0 (non hard), vol=$E 
                    db       $18                          ; $007C: arpegio 
                    db       $6C                          ; $007D: dataColumn_0 (non hard), vol=$B 
                    db       $18                          ; $007E: arpegio 
                    db       $68                          ; $007F: dataColumn_0 (non hard), vol=$A 
                    db       $1A                          ; $0080: arpegio 
                    db       $64                          ; $0081: dataColumn_0 (non hard), vol=$9 
                    db       $18                          ; $0082: arpegio 
                    db       $5C                          ; $0083: dataColumn_0 (non hard), vol=$7 
                    db       $1A                          ; $0084: arpegio 
                    db       $58                          ; $0085: dataColumn_0 (non hard), vol=$6 
                    db       $18                          ; $0086: arpegio 
                    db       $54                          ; $0087: dataColumn_0 (non hard), vol=$5 
                    db       $1A                          ; $0088: arpegio 
                    db       $50                          ; $0089: dataColumn_0 (non hard), vol=$4 
                    db       $18                          ; $008A: arpegio 
                    db       $4C                          ; $008B: dataColumn_0 (non hard), vol=$3 
                    db       $18                          ; $008C: arpegio 
                    db       $48                          ; $008D: dataColumn_0 (non hard), vol=$2 
                    db       $18                          ; $008E: arpegio 
                    db       $44                          ; $008F: dataColumn_0 (non hard), vol=$1 
                    db       $18                          ; $0090: arpegio 
                    db       $0D                          ; $0091: dataColumn_0 (hard) 
                    dw       instrument0loopBossM         ; $0092: [$001A] loop 
instrument5BossM: 
                    db       $02                          ; $0094: speed 
                    db       $00                          ; $0095: retrig 
                    db       $34                          ; $0096: dataColumn_0 (non hard), vol=$D 
                    db       $70                          ; $0097: dataColumn_0 (non hard), vol=$C 
                    db       $03                          ; $0098: arpegio 
                    db       $70                          ; $0099: dataColumn_0 (non hard), vol=$C 
                    db       $07                          ; $009A: arpegio 
                    db       $68                          ; $009B: dataColumn_0 (non hard), vol=$A 
                    db       $0C                          ; $009C: arpegio 
instrument5loopBossM: 
                    db       $24                          ; $009D: dataColumn_0 (non hard), vol=$9 
                    db       $68                          ; $009E: dataColumn_0 (non hard), vol=$A 
                    db       $03                          ; $009F: arpegio 
                    db       $68                          ; $00A0: dataColumn_0 (non hard), vol=$A 
                    db       $07                          ; $00A1: arpegio 
                    db       $64                          ; $00A2: dataColumn_0 (non hard), vol=$9 
                    db       $0C                          ; $00A3: arpegio 
                    db       $0D                          ; $00A4: dataColumn_0 (hard) 
                    dw       instrument5loopBossM         ; $00A5: [$009D] loop 
; start of linker definition
linkerBossM: 
                    db       $26                          ; $00A7: first height 
                    db       $00                          ; $00A8: transposition1 
                    db       $00                          ; $00A9: transposition2 
                    db       $00                          ; $00AA: transposition3 
                    dw       specialtrackDef0BossM        ; $00AB: [$00B7] specialTrack 
pattern0DefinitionBossM: 
                    db       $00                          ; $00AD: pattern 0 state 
                    dw       trackDef0BossM               ; $00AE: [$00B9] pattern 0, track 1 
                    dw       trackDef1BossM               ; $00B0: [$00E6] pattern 0, track 2 
                    dw       trackDef2BossM               ; $00B2: [$014A] pattern 0, track 3 
pattern1DefinitionBossM: 
                    db       $01                          ; $00B4: pattern 1 state 
                    dw       pattern0DefinitionBossM      ; $00B5: [$00AD] song restart address 
specialtrackDef0BossM: 
                    db       $45                          ; $00B7: data, speed 17 
                    db       $00                          ; $00B8: wait 128 
trackDef0BossM: 
                    db       $A2                          ; $00B9: normal track data 
                    db       $E1                          ; $00BA: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $00BB: pitch 
                    db       $01                          ; $00BD: instrument 
                    db       $67                          ; $00BE: full optimization, no escape: D4 
                    db       $69                          ; $00BF: full optimization, no escape: D#4 
                    db       $63                          ; $00C0: full optimization, no escape: C4 
                    db       $73                          ; $00C1: full optimization, no escape: G#4 
                    db       $02                          ; $00C2: normal track data, wait 0 
                    db       $71                          ; $00C3: full optimization, no escape: G4 
                    db       $02                          ; $00C4: normal track data, wait 0 
                    db       $6F                          ; $00C5: full optimization, no escape: F#4 
                    db       $02                          ; $00C6: normal track data, wait 0 
                    db       $71                          ; $00C7: full optimization, no escape: G4 
                    db       $02                          ; $00C8: normal track data, wait 0 
                    db       $69                          ; $00C9: full optimization, no escape: D#4 
                    db       $02                          ; $00CA: normal track data, wait 0 
                    db       $67                          ; $00CB: full optimization, no escape: D4 
                    db       $61                          ; $00CC: full optimization, no escape: B3 
                    db       $63                          ; $00CD: full optimization, no escape: C4 
                    db       $67                          ; $00CE: full optimization, no escape: D4 
                    db       $69                          ; $00CF: full optimization, no escape: D#4 
                    db       $63                          ; $00D0: full optimization, no escape: C4 
                    db       $73                          ; $00D1: full optimization, no escape: G#4 
                    db       $02                          ; $00D2: normal track data, wait 0 
                    db       $71                          ; $00D3: full optimization, no escape: G4 
                    db       $02                          ; $00D4: normal track data, wait 0 
                    db       $6F                          ; $00D5: full optimization, no escape: F#4 
                    db       $02                          ; $00D6: normal track data, wait 0 
                    db       $71                          ; $00D7: full optimization, no escape: G4 
                    db       $02                          ; $00D8: normal track data, wait 0 
                    db       $69                          ; $00D9: full optimization, no escape: D#4 
                    db       $02                          ; $00DA: normal track data, wait 0 
                    db       $67                          ; $00DB: full optimization, no escape: D4 
                    db       $61                          ; $00DC: full optimization, no escape: B3 
                    db       $63                          ; $00DD: full optimization, no escape: C4 
                    db       $02                          ; $00DE: normal track data, wait 0 
                    db       $A2                          ; $00DF: normal track data 
                    db       $51                          ; $00E0: vol = $7 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $00E1: normal track data, note: C0 
                    db       $17                          ; $00E2: vol = $4 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $00E3: normal track data, note: C0 
                    db       $1F                          ; $00E4: vol = $0 (inverted), no pitch, no note, no instrument 
                    db       $00                          ; $00E5: track end signature found 
trackDef1BossM: 
                    db       $78                          ; $00E6: normal track data 
                    db       $E1                          ; $00E7: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $00E8: pitch 
                    db       $02                          ; $00EA: instrument 
                    db       $84                          ; $00EB: normal track data 
                    db       $60                          ; $00EC: vol off, no pitch, note, instrument 
                    db       $03                          ; $00ED: instrument 
                    db       $56                          ; $00EE: normal track data 
                    db       $60                          ; $00EF: vol off, no pitch, note, instrument 
                    db       $04                          ; $00F0: instrument 
                    db       $84                          ; $00F1: normal track data 
                    db       $60                          ; $00F2: vol off, no pitch, note, instrument 
                    db       $03                          ; $00F3: instrument 
                    db       $78                          ; $00F4: normal track data 
                    db       $60                          ; $00F5: vol off, no pitch, note, instrument 
                    db       $02                          ; $00F6: instrument 
                    db       $39                          ; $00F7: full optimization, no escape: D#2 
                    db       $56                          ; $00F8: normal track data 
                    db       $60                          ; $00F9: vol off, no pitch, note, instrument 
                    db       $04                          ; $00FA: instrument 
                    db       $84                          ; $00FB: normal track data 
                    db       $60                          ; $00FC: vol off, no pitch, note, instrument 
                    db       $03                          ; $00FD: instrument 
                    db       $78                          ; $00FE: normal track data 
                    db       $60                          ; $00FF: vol off, no pitch, note, instrument 
                    db       $02                          ; $0100: instrument 
                    db       $84                          ; $0101: normal track data 
                    db       $60                          ; $0102: vol off, no pitch, note, instrument 
                    db       $03                          ; $0103: instrument 
                    db       $56                          ; $0104: normal track data 
                    db       $60                          ; $0105: vol off, no pitch, note, instrument 
                    db       $04                          ; $0106: instrument 
                    db       $84                          ; $0107: normal track data 
                    db       $60                          ; $0108: vol off, no pitch, note, instrument 
                    db       $03                          ; $0109: instrument 
                    db       $78                          ; $010A: normal track data 
                    db       $60                          ; $010B: vol off, no pitch, note, instrument 
                    db       $02                          ; $010C: instrument 
                    db       $39                          ; $010D: full optimization, no escape: D#2 
                    db       $56                          ; $010E: normal track data 
                    db       $60                          ; $010F: vol off, no pitch, note, instrument 
                    db       $04                          ; $0110: instrument 
                    db       $84                          ; $0111: normal track data 
                    db       $60                          ; $0112: vol off, no pitch, note, instrument 
                    db       $03                          ; $0113: instrument 
                    db       $78                          ; $0114: normal track data 
                    db       $60                          ; $0115: vol off, no pitch, note, instrument 
                    db       $02                          ; $0116: instrument 
                    db       $84                          ; $0117: normal track data 
                    db       $60                          ; $0118: vol off, no pitch, note, instrument 
                    db       $03                          ; $0119: instrument 
                    db       $56                          ; $011A: normal track data 
                    db       $60                          ; $011B: vol off, no pitch, note, instrument 
                    db       $04                          ; $011C: instrument 
                    db       $84                          ; $011D: normal track data 
                    db       $60                          ; $011E: vol off, no pitch, note, instrument 
                    db       $03                          ; $011F: instrument 
                    db       $78                          ; $0120: normal track data 
                    db       $60                          ; $0121: vol off, no pitch, note, instrument 
                    db       $02                          ; $0122: instrument 
                    db       $39                          ; $0123: full optimization, no escape: D#2 
                    db       $56                          ; $0124: normal track data 
                    db       $60                          ; $0125: vol off, no pitch, note, instrument 
                    db       $04                          ; $0126: instrument 
                    db       $84                          ; $0127: normal track data 
                    db       $60                          ; $0128: vol off, no pitch, note, instrument 
                    db       $03                          ; $0129: instrument 
                    db       $78                          ; $012A: normal track data 
                    db       $60                          ; $012B: vol off, no pitch, note, instrument 
                    db       $02                          ; $012C: instrument 
                    db       $84                          ; $012D: normal track data 
                    db       $60                          ; $012E: vol off, no pitch, note, instrument 
                    db       $03                          ; $012F: instrument 
                    db       $56                          ; $0130: normal track data 
                    db       $60                          ; $0131: vol off, no pitch, note, instrument 
                    db       $04                          ; $0132: instrument 
                    db       $84                          ; $0133: normal track data 
                    db       $60                          ; $0134: vol off, no pitch, note, instrument 
                    db       $03                          ; $0135: instrument 
                    db       $78                          ; $0136: normal track data 
                    db       $60                          ; $0137: vol off, no pitch, note, instrument 
                    db       $02                          ; $0138: instrument 
                    db       $39                          ; $0139: full optimization, no escape: D#2 
                    db       $56                          ; $013A: normal track data 
                    db       $60                          ; $013B: vol off, no pitch, note, instrument 
                    db       $04                          ; $013C: instrument 
                    db       $84                          ; $013D: normal track data 
                    db       $60                          ; $013E: vol off, no pitch, note, instrument 
                    db       $03                          ; $013F: instrument 
                    db       $56                          ; $0140: normal track data 
                    db       $60                          ; $0141: vol off, no pitch, note, instrument 
                    db       $04                          ; $0142: instrument 
                    db       $56                          ; $0143: normal track data 
                    db       $51                          ; $0144: vol = $7 (inverted), no pitch, no note, no instrument 
                    db       $56                          ; $0145: normal track data, note: A#0 
                    db       $55                          ; $0146: vol = $5 (inverted), no pitch, no note, no instrument 
                    db       $56                          ; $0147: normal track data 
                    db       $59                          ; $0148: vol = $3 (inverted), no pitch, no note, no instrument 
                    db       $00                          ; $0149: track end signature found 
trackDef2BossM: 
                    db       $A2                          ; $014A: normal track data 
                    db       $E1                          ; $014B: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $014C: pitch 
                    db       $05                          ; $014E: instrument 
                    db       $3E                          ; $014F: normal track data, wait 30 
                    db       $02                          ; $0150: normal track data, wait 0 
                    db       $42                          ; $0151: normal track data 
                    db       $09                          ; $0152: vol = $B (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0153: normal track data 
                    db       $11                          ; $0154: vol = $7 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0155: normal track data, note: C0 
                    db       $17                          ; $0156: vol = $4 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0157: normal track data, note: C0 
                    db       $1F                          ; $0158: vol = $0 (inverted), no pitch, no note, no instrument 
                    db       $00                          ; $0159: track end signature found 
