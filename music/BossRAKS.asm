; This file was build using VIDE - Vectrex Integrated Development Environment
; Original bin file was: projects/Vectorblade/Music/BossR.bin
; 
; offset for AKS file assumed: $0000 guessed by accessing byte data[13] * 256)
; not used by vectrex player and therefor omitted:
;  DB "AT10" ; Signature of Arkos Tracker files
;  DB $01 ; sample channel
;  DB $40, 42, 0f ; YM custom frequence - little endian
;  DB $02 ; Replay frequency (0=13hz,1=25hz,2=50hz,3=100hz,4=150hz,5=300hz)
SongAddressBossR: 
                    db       $06                          ; $0009: default speed 
                    dw       $0064                        ; $000A: size of instrument table (without this word pointer) 
                    dw       instrument0BossR             ; $000C: [$0014] pointer to instrument 0 
                    dw       instrument1BossR             ; $000E: [$001D] pointer to instrument 1 
                    dw       instrument2BossR             ; $0010: [$0054] pointer to instrument 2 
                    dw       instrument3BossR             ; $0012: [$0062] pointer to instrument 3 
instrument0BossR: 
                    db       $00                          ; $0014: speed 
                    db       $00                          ; $0015: retrig 
instrument0loopBossR: 
                    db       $00                          ; $0016: dataColumn_0 (non hard), vol=$0 
                    db       $00                          ; $0017: dataColumn_0 (non hard), vol=$0 
                    db       $00                          ; $0018: dataColumn_0 (non hard), vol=$0 
                    db       $00                          ; $0019: dataColumn_0 (non hard), vol=$0 
                    db       $0D                          ; $001A: dataColumn_0 (hard) 
                    dw       instrument0loopBossR         ; $001B: [$0016] loop 
instrument1BossR: 
                    db       $02                          ; $001D: speed 
                    db       $00                          ; $001E: retrig 
                    db       $7C                          ; $001F: dataColumn_0 (non hard), vol=$F 
                    db       $F4                          ; $0020: arpegio 
                    db       $38                          ; $0021: dataColumn_0 (non hard), vol=$E 
                    db       $78                          ; $0022: dataColumn_0 (non hard), vol=$E 
                    db       $F4                          ; $0023: arpegio 
                    db       $B8                          ; $0024: dataColumn_0 (non hard), vol=$E 
                    dw       $FFFF                        ; $0025: pitch 
                    db       $34                          ; $0027: dataColumn_0 (non hard), vol=$D 
                    db       $74                          ; $0028: dataColumn_0 (non hard), vol=$D 
                    db       $F4                          ; $0029: arpegio 
                    db       $B0                          ; $002A: dataColumn_0 (non hard), vol=$C 
                    dw       $FFFF                        ; $002B: pitch 
                    db       $70                          ; $002D: dataColumn_0 (non hard), vol=$C 
                    db       $F4                          ; $002E: arpegio 
                    db       $2C                          ; $002F: dataColumn_0 (non hard), vol=$B 
                    db       $6C                          ; $0030: dataColumn_0 (non hard), vol=$B 
                    db       $F4                          ; $0031: arpegio 
                    db       $AC                          ; $0032: dataColumn_0 (non hard), vol=$B 
                    dw       $FFFF                        ; $0033: pitch 
                    db       $2C                          ; $0035: dataColumn_0 (non hard), vol=$B 
                    db       $6C                          ; $0036: dataColumn_0 (non hard), vol=$B 
                    db       $F4                          ; $0037: arpegio 
                    db       $AC                          ; $0038: dataColumn_0 (non hard), vol=$B 
                    dw       $FFFF                        ; $0039: pitch 
                    db       $6C                          ; $003B: dataColumn_0 (non hard), vol=$B 
                    db       $F4                          ; $003C: arpegio 
                    db       $AC                          ; $003D: dataColumn_0 (non hard), vol=$B 
                    dw       $FFFF                        ; $003E: pitch 
                    db       $6C                          ; $0040: dataColumn_0 (non hard), vol=$B 
                    db       $F4                          ; $0041: arpegio 
                    db       $A8                          ; $0042: dataColumn_0 (non hard), vol=$A 
                    dw       $FFFF                        ; $0043: pitch 
                    db       $E0                          ; $0045: dataColumn_0 (non hard), vol=$8 
                    dw       $FFFF                        ; $0046: pitch 
                    db       $F4                          ; $0048: arpegio 
                    db       $A0                          ; $0049: dataColumn_0 (non hard), vol=$8 
                    dw       $0001                        ; $004A: pitch 
                    db       $1C                          ; $004C: dataColumn_0 (non hard), vol=$7 
                    db       $10                          ; $004D: dataColumn_0 (non hard), vol=$4 
                    db       $0C                          ; $004E: dataColumn_0 (non hard), vol=$3 
                    db       $08                          ; $004F: dataColumn_0 (non hard), vol=$2 
                    db       $04                          ; $0050: dataColumn_0 (non hard), vol=$1 
                    db       $0D                          ; $0051: dataColumn_0 (hard) 
                    dw       instrument0loopBossR         ; $0052: [$0016] loop 
instrument2BossR: 
                    db       $02                          ; $0054: speed 
                    db       $00                          ; $0055: retrig 
instrument2loopBossR: 
                    db       $72                          ; $0056: dataColumn_0 (non hard), vol=$C 
                    db       $29                          ; $0057: dataColumn_1, noise=$09 
                    db       $0C                          ; $0058: arpegio 
                    db       $7C                          ; $0059: dataColumn_0 (non hard), vol=$F 
                    db       $0C                          ; $005A: arpegio 
                    db       $7C                          ; $005B: dataColumn_0 (non hard), vol=$F 
                    db       $0C                          ; $005C: arpegio 
                    db       $3C                          ; $005D: dataColumn_0 (non hard), vol=$F 
                    db       $3C                          ; $005E: dataColumn_0 (non hard), vol=$F 
                    db       $0D                          ; $005F: dataColumn_0 (hard) 
                    dw       instrument2loopBossR         ; $0060: [$0056] loop 
instrument3BossR: 
                    db       $02                          ; $0062: speed 
                    db       $00                          ; $0063: retrig 
instrument3loopBossR: 
                    db       $76                          ; $0064: dataColumn_0 (non hard), vol=$D 
                    db       $34                          ; $0065: dataColumn_1, noise=$14 
                    db       $0C                          ; $0066: arpegio 
                    db       $7C                          ; $0067: dataColumn_0 (non hard), vol=$F 
                    db       $0C                          ; $0068: arpegio 
                    db       $7C                          ; $0069: dataColumn_0 (non hard), vol=$F 
                    db       $0C                          ; $006A: arpegio 
                    db       $3C                          ; $006B: dataColumn_0 (non hard), vol=$F 
                    db       $3C                          ; $006C: dataColumn_0 (non hard), vol=$F 
                    db       $0D                          ; $006D: dataColumn_0 (hard) 
                    dw       instrument3loopBossR         ; $006E: [$0064] loop 
; start of linker definition
linkerBossR: 
                    db       $40                          ; $0070: first height 
                    db       $00                          ; $0071: transposition1 
                    db       $00                          ; $0072: transposition2 
                    db       $00                          ; $0073: transposition3 
                    dw       specialtrackDef0BossR        ; $0074: [$0090] specialTrack 
pattern0DefinitionBossR: 
                    db       $10                          ; $0076: pattern 0 state 
                    dw       trackDef0BossR               ; $0077: [$0092] pattern 0, track 1 
                    dw       trackDef1BossR               ; $0079: [$00A6] pattern 0, track 2 
                    dw       trackDef2BossR               ; $007B: [$00BD] pattern 0, track 3 
                    db       $40                          ; $007D: new height 
pattern1DefinitionBossR: 
                    db       $00                          ; $007E: pattern 1 state 
                    dw       trackDef0BossR               ; $007F: [$0092] pattern 1, track 1 
                    dw       trackDef1BossR               ; $0081: [$00A6] pattern 1, track 2 
                    dw       trackDef2BossR               ; $0083: [$00BD] pattern 1, track 3 
pattern2DefinitionBossR: 
                    db       $10                          ; $0085: pattern 2 state 
                    dw       trackDef4BossR               ; $0086: [$011E] pattern 2, track 1 
                    dw       trackDef5BossR               ; $0088: [$00FF] pattern 2, track 2 
                    dw       trackDef6BossR               ; $008A: [$0109] pattern 2, track 3 
                    db       $0B                          ; $008C: new height 
pattern3DefinitionBossR: 
                    db       $01                          ; $008D: pattern 3 state 
                    dw       pattern0DefinitionBossR      ; $008E: [$0076] song restart address 
specialtrackDef0BossR: 
                    db       $15                          ; $0090: data, speed 5 
                    db       $00                          ; $0091: wait 128 
trackDef0BossR: 
                    db       $BA                          ; $0092: normal track data 
                    db       $E1                          ; $0093: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $0094: pitch 
                    db       $01                          ; $0096: instrument 
                    db       $0E                          ; $0097: normal track data, wait 6 
                    db       $77                          ; $0098: full optimization, no escape: A#4 
                    db       $0E                          ; $0099: normal track data, wait 6 
                    db       $7B                          ; $009A: full optimization, no escape: C5 
                    db       $0E                          ; $009B: normal track data, wait 6 
                    db       $77                          ; $009C: full optimization, no escape: A#4 
                    db       $0E                          ; $009D: normal track data, wait 6 
                    db       $7F                          ; $009E: full optimization, no escape: D5 
                    db       $0E                          ; $009F: normal track data, wait 6 
                    db       $7B                          ; $00A0: full optimization, no escape: C5 
                    db       $0E                          ; $00A1: normal track data, wait 6 
                    db       $7F                          ; $00A2: full optimization, no escape: D5 
                    db       $0E                          ; $00A3: normal track data, wait 6 
                    db       $7B                          ; $00A4: full optimization, no escape: C5 
                    db       $00                          ; $00A5: track end signature found 
trackDef1BossR: 
                    db       $42                          ; $00A6: normal track data 
                    db       $81                          ; $00A7: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $00A8: pitch 
                    db       $06                          ; $00AA: normal track data, wait 2 
                    db       $B8                          ; $00AB: normal track data 
                    db       $60                          ; $00AC: vol off, no pitch, note, instrument 
                    db       $01                          ; $00AD: instrument 
                    db       $0E                          ; $00AE: normal track data, wait 6 
                    db       $75                          ; $00AF: full optimization, no escape: A4 
                    db       $0E                          ; $00B0: normal track data, wait 6 
                    db       $79                          ; $00B1: full optimization, no escape: B4 
                    db       $0E                          ; $00B2: normal track data, wait 6 
                    db       $75                          ; $00B3: full optimization, no escape: A4 
                    db       $0E                          ; $00B4: normal track data, wait 6 
                    db       $7D                          ; $00B5: full optimization, no escape: C#5 
                    db       $0E                          ; $00B6: normal track data, wait 6 
                    db       $79                          ; $00B7: full optimization, no escape: B4 
                    db       $0E                          ; $00B8: normal track data, wait 6 
                    db       $7D                          ; $00B9: full optimization, no escape: C#5 
                    db       $0E                          ; $00BA: normal track data, wait 6 
                    db       $79                          ; $00BB: full optimization, no escape: B4 
                    db       $00                          ; $00BC: track end signature found 
trackDef2BossR: 
                    db       $76                          ; $00BD: normal track data 
                    db       $E1                          ; $00BE: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $00BF: pitch 
                    db       $02                          ; $00C1: instrument 
                    db       $02                          ; $00C2: normal track data, wait 0 
                    db       $76                          ; $00C3: normal track data 
                    db       $60                          ; $00C4: vol off, no pitch, note, instrument 
                    db       $03                          ; $00C5: instrument 
                    db       $0A                          ; $00C6: normal track data, wait 4 
                    db       $76                          ; $00C7: normal track data 
                    db       $60                          ; $00C8: vol off, no pitch, note, instrument 
                    db       $02                          ; $00C9: instrument 
                    db       $02                          ; $00CA: normal track data, wait 0 
                    db       $76                          ; $00CB: normal track data 
                    db       $60                          ; $00CC: vol off, no pitch, note, instrument 
                    db       $03                          ; $00CD: instrument 
                    db       $0A                          ; $00CE: normal track data, wait 4 
                    db       $76                          ; $00CF: normal track data 
                    db       $60                          ; $00D0: vol off, no pitch, note, instrument 
                    db       $02                          ; $00D1: instrument 
                    db       $02                          ; $00D2: normal track data, wait 0 
                    db       $76                          ; $00D3: normal track data 
                    db       $60                          ; $00D4: vol off, no pitch, note, instrument 
                    db       $03                          ; $00D5: instrument 
                    db       $0A                          ; $00D6: normal track data, wait 4 
                    db       $76                          ; $00D7: normal track data 
                    db       $60                          ; $00D8: vol off, no pitch, note, instrument 
                    db       $02                          ; $00D9: instrument 
                    db       $02                          ; $00DA: normal track data, wait 0 
                    db       $76                          ; $00DB: normal track data 
                    db       $60                          ; $00DC: vol off, no pitch, note, instrument 
                    db       $03                          ; $00DD: instrument 
                    db       $0A                          ; $00DE: normal track data, wait 4 
                    db       $78                          ; $00DF: normal track data 
                    db       $60                          ; $00E0: vol off, no pitch, note, instrument 
                    db       $02                          ; $00E1: instrument 
                    db       $02                          ; $00E2: normal track data, wait 0 
                    db       $78                          ; $00E3: normal track data 
                    db       $60                          ; $00E4: vol off, no pitch, note, instrument 
                    db       $03                          ; $00E5: instrument 
                    db       $0A                          ; $00E6: normal track data, wait 4 
                    db       $78                          ; $00E7: normal track data 
                    db       $60                          ; $00E8: vol off, no pitch, note, instrument 
                    db       $02                          ; $00E9: instrument 
                    db       $02                          ; $00EA: normal track data, wait 0 
                    db       $78                          ; $00EB: normal track data 
                    db       $60                          ; $00EC: vol off, no pitch, note, instrument 
                    db       $03                          ; $00ED: instrument 
                    db       $0A                          ; $00EE: normal track data, wait 4 
                    db       $78                          ; $00EF: normal track data 
                    db       $60                          ; $00F0: vol off, no pitch, note, instrument 
                    db       $02                          ; $00F1: instrument 
                    db       $02                          ; $00F2: normal track data, wait 0 
                    db       $78                          ; $00F3: normal track data 
                    db       $60                          ; $00F4: vol off, no pitch, note, instrument 
                    db       $03                          ; $00F5: instrument 
                    db       $0A                          ; $00F6: normal track data, wait 4 
                    db       $78                          ; $00F7: normal track data 
                    db       $60                          ; $00F8: vol off, no pitch, note, instrument 
                    db       $02                          ; $00F9: instrument 
                    db       $02                          ; $00FA: normal track data, wait 0 
                    db       $78                          ; $00FB: normal track data 
                    db       $60                          ; $00FC: vol off, no pitch, note, instrument 
                    db       $03                          ; $00FD: instrument 
                    db       $00                          ; $00FE: track end signature found 
trackDef5BossR: 
                    db       $42                          ; $00FF: normal track data 
                    db       $80                          ; $0100: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $0101: pitch 
                    db       $42                          ; $0103: normal track data, note: C0 
                    db       $07                          ; $0104: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $0105: normal track data, wait 0 
                    db       $42                          ; $0106: normal track data, note: C0 
                    db       $0F                          ; $0107: vol = $8 (inverted), no pitch, no note, no instrument 
                    db       $00                          ; $0108: track end signature found 
trackDef6BossR: 
                    db       $76                          ; $0109: normal track data 
                    db       $E1                          ; $010A: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $010B: pitch 
                    db       $02                          ; $010D: instrument 
                    db       $02                          ; $010E: normal track data, wait 0 
                    db       $76                          ; $010F: normal track data 
                    db       $49                          ; $0110: vol = $B (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $0111: normal track data, wait 0 
                    db       $76                          ; $0112: normal track data, note: D2 
                    db       $4D                          ; $0113: vol = $9 (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $0114: normal track data, wait 0 
                    db       $76                          ; $0115: normal track data 
                    db       $51                          ; $0116: vol = $7 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0117: normal track data, note: C0 
                    db       $15                          ; $0118: vol = $5 (inverted), no pitch, no note, no instrument 
                    db       $76                          ; $0119: normal track data 
                    db       $59                          ; $011A: vol = $3 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $011B: normal track data, note: C0 
                    db       $1F                          ; $011C: vol = $0 (inverted), no pitch, no note, no instrument 
                    db       $00                          ; $011D: track end signature found 
trackDef4BossR: 
                    db       $8E                          ; $011E: normal track data 
                    db       $E1                          ; $011F: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $0120: pitch 
                    db       $01                          ; $0122: instrument 
                    db       $42                          ; $0123: normal track data 
                    db       $03                          ; $0124: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0125: normal track data 
                    db       $09                          ; $0126: vol = $B (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $0127: normal track data, wait 0 
                    db       $42                          ; $0128: normal track data, note: C0 
                    db       $0D                          ; $0129: vol = $9 (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $012A: normal track data, wait 0 
                    db       $42                          ; $012B: normal track data 
                    db       $11                          ; $012C: vol = $7 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $012D: normal track data, note: C0 
                    db       $15                          ; $012E: vol = $5 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $012F: normal track data 
                    db       $19                          ; $0130: vol = $3 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0131: normal track data, note: C0 
                    db       $1F                          ; $0132: vol = $0 (inverted), no pitch, no note, no instrument 
                    db       $00                          ; $0133: track end signature found 
