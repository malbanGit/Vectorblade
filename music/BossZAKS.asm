; This file was build using VIDE - Vectrex Integrated Development Environment
; Original bin file was: projects/Vectorblade/Music/BossZ.bin
; 
; offset for AKS file assumed: $0000 guessed by accessing byte data[13] * 256)
; not used by vectrex player and therefor omitted:
;  DB "AT10" ; Signature of Arkos Tracker files
;  DB $01 ; sample channel
;  DB $40, 42, 0f ; YM custom frequence - little endian
;  DB $02 ; Replay frequency (0=13hz,1=25hz,2=50hz,3=100hz,4=150hz,5=300hz)
SongAddressBossZ: 
                    db       $06                          ; $0009: default speed 
                    dw       $00AE                        ; $000A: size of instrument table (without this word pointer) 
                    dw       instrument0BossZ             ; $000C: [$0016] pointer to instrument 0 
                    dw       instrument1BossZ             ; $000E: [$001F] pointer to instrument 1 
                    dw       instrument2BossZ             ; $0010: [$007E] pointer to instrument 2 
                    dw       instrument3BossZ             ; $0012: [$0095] pointer to instrument 3 
                    dw       instrument4BossZ             ; $0014: [$00AA] pointer to instrument 4 
instrument0BossZ: 
                    db       $00                          ; $0016: speed 
                    db       $00                          ; $0017: retrig 
instrument0loopBossZ: 
                    db       $00                          ; $0018: dataColumn_0 (non hard), vol=$0 
                    db       $00                          ; $0019: dataColumn_0 (non hard), vol=$0 
                    db       $00                          ; $001A: dataColumn_0 (non hard), vol=$0 
                    db       $00                          ; $001B: dataColumn_0 (non hard), vol=$0 
                    db       $0D                          ; $001C: dataColumn_0 (hard) 
                    dw       instrument0loopBossZ         ; $001D: [$0018] loop 
instrument1BossZ: 
                    db       $02                          ; $001F: speed 
                    db       $00                          ; $0020: retrig 
                    db       $7C                          ; $0021: dataColumn_0 (non hard), vol=$F 
                    db       $01                          ; $0022: arpegio 
                    db       $3C                          ; $0023: dataColumn_0 (non hard), vol=$F 
                    db       $38                          ; $0024: dataColumn_0 (non hard), vol=$E 
                    db       $38                          ; $0025: dataColumn_0 (non hard), vol=$E 
                    db       $34                          ; $0026: dataColumn_0 (non hard), vol=$D 
                    db       $30                          ; $0027: dataColumn_0 (non hard), vol=$C 
                    db       $B4                          ; $0028: dataColumn_0 (non hard), vol=$D 
                    dw       $FFFF                        ; $0029: pitch 
                    db       $B0                          ; $002B: dataColumn_0 (non hard), vol=$C 
                    dw       $FFFE                        ; $002C: pitch 
                    db       $30                          ; $002E: dataColumn_0 (non hard), vol=$C 
                    db       $B4                          ; $002F: dataColumn_0 (non hard), vol=$D 
                    dw       $FFFE                        ; $0030: pitch 
                    db       $B4                          ; $0032: dataColumn_0 (non hard), vol=$D 
                    dw       $FFFF                        ; $0033: pitch 
                    db       $B4                          ; $0035: dataColumn_0 (non hard), vol=$D 
                    dw       $FFFE                        ; $0036: pitch 
                    db       $34                          ; $0038: dataColumn_0 (non hard), vol=$D 
                    db       $AC                          ; $0039: dataColumn_0 (non hard), vol=$B 
                    dw       $FFFE                        ; $003A: pitch 
                    db       $AC                          ; $003C: dataColumn_0 (non hard), vol=$B 
                    dw       $FFFF                        ; $003D: pitch 
                    db       $B0                          ; $003F: dataColumn_0 (non hard), vol=$C 
                    dw       $FFFE                        ; $0040: pitch 
                    db       $30                          ; $0042: dataColumn_0 (non hard), vol=$C 
                    db       $B0                          ; $0043: dataColumn_0 (non hard), vol=$C 
                    dw       $FFFE                        ; $0044: pitch 
                    db       $B4                          ; $0046: dataColumn_0 (non hard), vol=$D 
                    dw       $FFFF                        ; $0047: pitch 
                    db       $B0                          ; $0049: dataColumn_0 (non hard), vol=$C 
                    dw       $0001                        ; $004A: pitch 
                    db       $2C                          ; $004C: dataColumn_0 (non hard), vol=$B 
                    db       $AC                          ; $004D: dataColumn_0 (non hard), vol=$B 
                    dw       $FFFE                        ; $004E: pitch 
                    db       $AC                          ; $0050: dataColumn_0 (non hard), vol=$B 
                    dw       $FFFF                        ; $0051: pitch 
                    db       $28                          ; $0053: dataColumn_0 (non hard), vol=$A 
                    db       $A4                          ; $0054: dataColumn_0 (non hard), vol=$9 
                    dw       $FFFE                        ; $0055: pitch 
                    db       $A0                          ; $0057: dataColumn_0 (non hard), vol=$8 
                    dw       $0001                        ; $0058: pitch 
                    db       $20                          ; $005A: dataColumn_0 (non hard), vol=$8 
                    db       $A0                          ; $005B: dataColumn_0 (non hard), vol=$8 
                    dw       $FFFF                        ; $005C: pitch 
                    db       $A0                          ; $005E: dataColumn_0 (non hard), vol=$8 
                    dw       $FFFF                        ; $005F: pitch 
                    db       $1C                          ; $0061: dataColumn_0 (non hard), vol=$7 
                    db       $9C                          ; $0062: dataColumn_0 (non hard), vol=$7 
                    dw       $FFFE                        ; $0063: pitch 
                    db       $1C                          ; $0065: dataColumn_0 (non hard), vol=$7 
                    db       $9C                          ; $0066: dataColumn_0 (non hard), vol=$7 
                    dw       $FFFF                        ; $0067: pitch 
                    db       $9C                          ; $0069: dataColumn_0 (non hard), vol=$7 
                    dw       $FFFE                        ; $006A: pitch 
                    db       $18                          ; $006C: dataColumn_0 (non hard), vol=$6 
                    db       $94                          ; $006D: dataColumn_0 (non hard), vol=$5 
                    dw       $FFFF                        ; $006E: pitch 
                    db       $90                          ; $0070: dataColumn_0 (non hard), vol=$4 
                    dw       $FFFE                        ; $0071: pitch 
                    db       $90                          ; $0073: dataColumn_0 (non hard), vol=$4 
                    dw       $FFFE                        ; $0074: pitch 
                    db       $0C                          ; $0076: dataColumn_0 (non hard), vol=$3 
                    db       $88                          ; $0077: dataColumn_0 (non hard), vol=$2 
                    dw       $FFFF                        ; $0078: pitch 
                    db       $04                          ; $007A: dataColumn_0 (non hard), vol=$1 
                    db       $0D                          ; $007B: dataColumn_0 (hard) 
                    dw       instrument0loopBossZ         ; $007C: [$0018] loop 
instrument2BossZ: 
                    db       $07                          ; $007E: speed 
                    db       $00                          ; $007F: retrig 
instrument2loopBossZ: 
                    db       $34                          ; $0080: dataColumn_0 (non hard), vol=$D 
                    db       $34                          ; $0081: dataColumn_0 (non hard), vol=$D 
                    db       $B4                          ; $0082: dataColumn_0 (non hard), vol=$D 
                    dw       $FFFF                        ; $0083: pitch 
                    db       $38                          ; $0085: dataColumn_0 (non hard), vol=$E 
                    db       $38                          ; $0086: dataColumn_0 (non hard), vol=$E 
                    db       $34                          ; $0087: dataColumn_0 (non hard), vol=$D 
                    db       $B4                          ; $0088: dataColumn_0 (non hard), vol=$D 
                    dw       $FFFF                        ; $0089: pitch 
                    db       $B4                          ; $008B: dataColumn_0 (non hard), vol=$D 
                    dw       $FFFF                        ; $008C: pitch 
                    db       $B4                          ; $008E: dataColumn_0 (non hard), vol=$D 
                    dw       $FFFF                        ; $008F: pitch 
                    db       $34                          ; $0091: dataColumn_0 (non hard), vol=$D 
                    db       $0D                          ; $0092: dataColumn_0 (hard) 
                    dw       instrument2loopBossZ         ; $0093: [$0080] loop 
instrument3BossZ: 
                    db       $03                          ; $0095: speed 
                    db       $00                          ; $0096: retrig 
                    db       $7C                          ; $0097: dataColumn_0 (non hard), vol=$F 
                    db       $01                          ; $0098: arpegio 
                    db       $7C                          ; $0099: dataColumn_0 (non hard), vol=$F 
                    db       $02                          ; $009A: arpegio 
                    db       $7C                          ; $009B: dataColumn_0 (non hard), vol=$F 
                    db       $03                          ; $009C: arpegio 
                    db       $7C                          ; $009D: dataColumn_0 (non hard), vol=$F 
                    db       $04                          ; $009E: arpegio 
                    db       $7C                          ; $009F: dataColumn_0 (non hard), vol=$F 
                    db       $01                          ; $00A0: arpegio 
                    db       $7C                          ; $00A1: dataColumn_0 (non hard), vol=$F 
                    db       $02                          ; $00A2: arpegio 
                    db       $7C                          ; $00A3: dataColumn_0 (non hard), vol=$F 
                    db       $03                          ; $00A4: arpegio 
                    db       $7C                          ; $00A5: dataColumn_0 (non hard), vol=$F 
                    db       $04                          ; $00A6: arpegio 
                    db       $0D                          ; $00A7: dataColumn_0 (hard) 
                    dw       instrument0loopBossZ         ; $00A8: [$0018] loop 
instrument4BossZ: 
                    db       $10                          ; $00AA: speed 
                    db       $00                          ; $00AB: retrig 
instrument4loopBossZ: 
                    db       $38                          ; $00AC: dataColumn_0 (non hard), vol=$E 
                    db       $B4                          ; $00AD: dataColumn_0 (non hard), vol=$D 
                    dw       $FFFF                        ; $00AE: pitch 
                    db       $B4                          ; $00B0: dataColumn_0 (non hard), vol=$D 
                    dw       $FFFF                        ; $00B1: pitch 
                    db       $B4                          ; $00B3: dataColumn_0 (non hard), vol=$D 
                    dw       $FFFF                        ; $00B4: pitch 
                    db       $34                          ; $00B6: dataColumn_0 (non hard), vol=$D 
                    db       $0D                          ; $00B7: dataColumn_0 (hard) 
                    dw       instrument4loopBossZ         ; $00B8: [$00AC] loop 
; start of linker definition
linkerBossZ: 
                    db       $6B                          ; $00BA: first height 
                    db       $00                          ; $00BB: transposition1 
                    db       $00                          ; $00BC: transposition2 
                    db       $00                          ; $00BD: transposition3 
                    dw       specialtrackDef0BossZ        ; $00BE: [$00CA] specialTrack 
pattern0DefinitionBossZ: 
                    db       $00                          ; $00C0: pattern 0 state 
                    dw       trackDef0BossZ               ; $00C1: [$00CC] pattern 0, track 1 
                    dw       trackDef1BossZ               ; $00C3: [$015E] pattern 0, track 2 
                    dw       trackDef2BossZ               ; $00C5: [$01E9] pattern 0, track 3 
pattern1DefinitionBossZ: 
                    db       $01                          ; $00C7: pattern 1 state 
                    dw       pattern0DefinitionBossZ      ; $00C8: [$00C0] song restart address 
specialtrackDef0BossZ: 
                    db       $21                          ; $00CA: data, speed 8 
                    db       $00                          ; $00CB: wait 128 
trackDef0BossZ: 
                    db       $64                          ; $00CC: normal track data 
                    db       $E1                          ; $00CD: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0001                        ; $00CE: pitch 
                    db       $01                          ; $00D0: instrument 
                    db       $42                          ; $00D1: normal track data 
                    db       $80                          ; $00D2: vol off, pitch, no note, no instrument 
                    dw       $0008                        ; $00D3: pitch 
                    db       $42                          ; $00D5: normal track data 
                    db       $00                          ; $00D6: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $00D7: normal track data 
                    db       $00                          ; $00D8: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $00D9: normal track data 
                    db       $80                          ; $00DA: vol off, pitch, no note, no instrument 
                    dw       $0003                        ; $00DB: pitch 
                    db       $42                          ; $00DD: normal track data 
                    db       $80                          ; $00DE: vol off, pitch, no note, no instrument 
                    dw       $0008                        ; $00DF: pitch 
                    db       $42                          ; $00E1: normal track data 
                    db       $80                          ; $00E2: vol off, pitch, no note, no instrument 
                    dw       $0005                        ; $00E3: pitch 
                    db       $42                          ; $00E5: normal track data 
                    db       $80                          ; $00E6: vol off, pitch, no note, no instrument 
                    dw       $0004                        ; $00E7: pitch 
                    db       $42                          ; $00E9: normal track data 
                    db       $80                          ; $00EA: vol off, pitch, no note, no instrument 
                    dw       $0005                        ; $00EB: pitch 
                    db       $42                          ; $00ED: normal track data 
                    db       $80                          ; $00EE: vol off, pitch, no note, no instrument 
                    dw       $0004                        ; $00EF: pitch 
                    db       $42                          ; $00F1: normal track data 
                    db       $80                          ; $00F2: vol off, pitch, no note, no instrument 
                    dw       $0003                        ; $00F3: pitch 
                    db       $42                          ; $00F5: normal track data 
                    db       $80                          ; $00F6: vol off, pitch, no note, no instrument 
                    dw       $0002                        ; $00F7: pitch 
                    db       $42                          ; $00F9: normal track data 
                    db       $00                          ; $00FA: vol off, no pitch, no note, no instrument 
                    db       $7C                          ; $00FB: normal track data, note: F2 
                    db       $F5                          ; $00FC: vol = $5 (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $00FD: pitch 
                    db       $02                          ; $00FF: instrument 
                    db       $42                          ; $0100: normal track data 
                    db       $00                          ; $0101: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $0102: normal track data 
                    db       $00                          ; $0103: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $0104: normal track data 
                    db       $13                          ; $0105: vol = $6 (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $0106: normal track data, wait 1 
                    db       $42                          ; $0107: normal track data 
                    db       $11                          ; $0108: vol = $7 (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $0109: normal track data, wait 1 
                    db       $42                          ; $010A: normal track data, note: C0 
                    db       $0F                          ; $010B: vol = $8 (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $010C: normal track data, wait 1 
                    db       $42                          ; $010D: normal track data, note: C0 
                    db       $0D                          ; $010E: vol = $9 (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $010F: normal track data, wait 1 
                    db       $42                          ; $0110: normal track data 
                    db       $0B                          ; $0111: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $0112: normal track data, wait 2 
                    db       $42                          ; $0113: normal track data 
                    db       $09                          ; $0114: vol = $B (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $0115: normal track data, wait 2 
                    db       $42                          ; $0116: normal track data, note: C0 
                    db       $07                          ; $0117: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $0118: normal track data, wait 1 
                    db       $42                          ; $0119: normal track data, note: C0 
                    db       $05                          ; $011A: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $011B: normal track data, wait 2 
                    db       $42                          ; $011C: normal track data 
                    db       $03                          ; $011D: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $011E: normal track data, wait 1 
                    db       $42                          ; $011F: normal track data 
                    db       $01                          ; $0120: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $1E                          ; $0121: normal track data, wait 14 
                    db       $42                          ; $0122: normal track data 
                    db       $80                          ; $0123: vol off, pitch, no note, no instrument 
                    dw       $0003                        ; $0124: pitch 
                    db       $42                          ; $0126: normal track data 
                    db       $00                          ; $0127: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $0128: normal track data 
                    db       $00                          ; $0129: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $012A: normal track data 
                    db       $00                          ; $012B: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $012C: normal track data 
                    db       $00                          ; $012D: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $012E: normal track data 
                    db       $00                          ; $012F: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $0130: normal track data 
                    db       $80                          ; $0131: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $0132: pitch 
                    db       $42                          ; $0134: normal track data 
                    db       $00                          ; $0135: vol off, no pitch, no note, no instrument 
                    db       $10                          ; $0136: normal track data, wait 7 
                    db       $42                          ; $0137: normal track data 
                    db       $03                          ; $0138: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $0139: normal track data, wait 1 
                    db       $42                          ; $013A: normal track data, note: C0 
                    db       $05                          ; $013B: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $013C: normal track data, wait 1 
                    db       $42                          ; $013D: normal track data, note: C0 
                    db       $07                          ; $013E: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $013F: normal track data, wait 1 
                    db       $42                          ; $0140: normal track data 
                    db       $09                          ; $0141: vol = $B (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $0142: normal track data, wait 0 
                    db       $42                          ; $0143: normal track data 
                    db       $0B                          ; $0144: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $0145: normal track data, wait 0 
                    db       $42                          ; $0146: normal track data, note: C0 
                    db       $0D                          ; $0147: vol = $9 (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $0148: normal track data, wait 0 
                    db       $42                          ; $0149: normal track data, note: C0 
                    db       $0F                          ; $014A: vol = $8 (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $014B: normal track data, wait 0 
                    db       $42                          ; $014C: normal track data 
                    db       $11                          ; $014D: vol = $7 (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $014E: normal track data, wait 0 
                    db       $42                          ; $014F: normal track data 
                    db       $13                          ; $0150: vol = $6 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0151: normal track data, note: C0 
                    db       $15                          ; $0152: vol = $5 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0153: normal track data, note: C0 
                    db       $17                          ; $0154: vol = $4 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0155: normal track data 
                    db       $19                          ; $0156: vol = $3 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0157: normal track data 
                    db       $1B                          ; $0158: vol = $2 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0159: normal track data, note: C0 
                    db       $1D                          ; $015A: vol = $1 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $015B: normal track data, note: C0 
                    db       $1F                          ; $015C: vol = $0 (inverted), no pitch, no note, no instrument 
                    db       $00                          ; $015D: track end signature found 
trackDef1BossZ: 
                    db       $62                          ; $015E: normal track data 
                    db       $F9                          ; $015F: vol = $3 (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $0160: pitch 
                    db       $03                          ; $0162: instrument 
                    db       $64                          ; $0163: normal track data, note: F1 
                    db       $57                          ; $0164: vol = $4 (inverted), no pitch, no note, no instrument 
                    db       $27                          ; $0165: full optimization, no escape: F#1 
                    db       $29                          ; $0166: full optimization, no escape: G1 
                    db       $6A                          ; $0167: normal track data, note: G#1 
                    db       $55                          ; $0168: vol = $5 (inverted), no pitch, no note, no instrument 
                    db       $2D                          ; $0169: full optimization, no escape: A1 
                    db       $2F                          ; $016A: full optimization, no escape: A#1 
                    db       $70                          ; $016B: normal track data 
                    db       $53                          ; $016C: vol = $6 (inverted), no pitch, no note, no instrument 
                    db       $23                          ; $016D: full optimization, no escape: E1 
                    db       $25                          ; $016E: full optimization, no escape: F1 
                    db       $66                          ; $016F: normal track data 
                    db       $51                          ; $0170: vol = $7 (inverted), no pitch, no note, no instrument 
                    db       $29                          ; $0171: full optimization, no escape: G1 
                    db       $2B                          ; $0172: full optimization, no escape: G#1 
                    db       $6C                          ; $0173: normal track data, note: A1 
                    db       $4F                          ; $0174: vol = $8 (inverted), no pitch, no note, no instrument 
                    db       $2F                          ; $0175: full optimization, no escape: A#1 
                    db       $31                          ; $0176: full optimization, no escape: B1 
                    db       $62                          ; $0177: normal track data, note: E1 
                    db       $4D                          ; $0178: vol = $9 (inverted), no pitch, no note, no instrument 
                    db       $25                          ; $0179: full optimization, no escape: F1 
                    db       $27                          ; $017A: full optimization, no escape: F#1 
                    db       $68                          ; $017B: normal track data 
                    db       $4B                          ; $017C: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $2B                          ; $017D: full optimization, no escape: G#1 
                    db       $2D                          ; $017E: full optimization, no escape: A1 
                    db       $6E                          ; $017F: normal track data 
                    db       $49                          ; $0180: vol = $B (inverted), no pitch, no note, no instrument 
                    db       $31                          ; $0181: full optimization, no escape: B1 
                    db       $23                          ; $0182: full optimization, no escape: E1 
                    db       $64                          ; $0183: normal track data, note: F1 
                    db       $47                          ; $0184: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $27                          ; $0185: full optimization, no escape: F#1 
                    db       $29                          ; $0186: full optimization, no escape: G1 
                    db       $2B                          ; $0187: full optimization, no escape: G#1 
                    db       $6C                          ; $0188: normal track data, note: A1 
                    db       $45                          ; $0189: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $2F                          ; $018A: full optimization, no escape: A#1 
                    db       $31                          ; $018B: full optimization, no escape: B1 
                    db       $23                          ; $018C: full optimization, no escape: E1 
                    db       $64                          ; $018D: normal track data 
                    db       $43                          ; $018E: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $27                          ; $018F: full optimization, no escape: F#1 
                    db       $29                          ; $0190: full optimization, no escape: G1 
                    db       $2B                          ; $0191: full optimization, no escape: G#1 
                    db       $6C                          ; $0192: normal track data 
                    db       $41                          ; $0193: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $2F                          ; $0194: full optimization, no escape: A#1 
                    db       $31                          ; $0195: full optimization, no escape: B1 
                    db       $23                          ; $0196: full optimization, no escape: E1 
                    db       $25                          ; $0197: full optimization, no escape: F1 
                    db       $27                          ; $0198: full optimization, no escape: F#1 
                    db       $29                          ; $0199: full optimization, no escape: G1 
                    db       $2B                          ; $019A: full optimization, no escape: G#1 
                    db       $2D                          ; $019B: full optimization, no escape: A1 
                    db       $2F                          ; $019C: full optimization, no escape: A#1 
                    db       $31                          ; $019D: full optimization, no escape: B1 
                    db       $23                          ; $019E: full optimization, no escape: E1 
                    db       $25                          ; $019F: full optimization, no escape: F1 
                    db       $27                          ; $01A0: full optimization, no escape: F#1 
                    db       $29                          ; $01A1: full optimization, no escape: G1 
                    db       $2B                          ; $01A2: full optimization, no escape: G#1 
                    db       $2D                          ; $01A3: full optimization, no escape: A1 
                    db       $2F                          ; $01A4: full optimization, no escape: A#1 
                    db       $31                          ; $01A5: full optimization, no escape: B1 
                    db       $23                          ; $01A6: full optimization, no escape: E1 
                    db       $25                          ; $01A7: full optimization, no escape: F1 
                    db       $27                          ; $01A8: full optimization, no escape: F#1 
                    db       $29                          ; $01A9: full optimization, no escape: G1 
                    db       $2B                          ; $01AA: full optimization, no escape: G#1 
                    db       $2D                          ; $01AB: full optimization, no escape: A1 
                    db       $2F                          ; $01AC: full optimization, no escape: A#1 
                    db       $31                          ; $01AD: full optimization, no escape: B1 
                    db       $23                          ; $01AE: full optimization, no escape: E1 
                    db       $25                          ; $01AF: full optimization, no escape: F1 
                    db       $27                          ; $01B0: full optimization, no escape: F#1 
                    db       $29                          ; $01B1: full optimization, no escape: G1 
                    db       $2B                          ; $01B2: full optimization, no escape: G#1 
                    db       $2D                          ; $01B3: full optimization, no escape: A1 
                    db       $2F                          ; $01B4: full optimization, no escape: A#1 
                    db       $31                          ; $01B5: full optimization, no escape: B1 
                    db       $23                          ; $01B6: full optimization, no escape: E1 
                    db       $25                          ; $01B7: full optimization, no escape: F1 
                    db       $27                          ; $01B8: full optimization, no escape: F#1 
                    db       $29                          ; $01B9: full optimization, no escape: G1 
                    db       $6A                          ; $01BA: normal track data 
                    db       $43                          ; $01BB: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $2D                          ; $01BC: full optimization, no escape: A1 
                    db       $2F                          ; $01BD: full optimization, no escape: A#1 
                    db       $70                          ; $01BE: normal track data, note: B1 
                    db       $45                          ; $01BF: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $23                          ; $01C0: full optimization, no escape: E1 
                    db       $25                          ; $01C1: full optimization, no escape: F1 
                    db       $66                          ; $01C2: normal track data, note: F#1 
                    db       $47                          ; $01C3: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $29                          ; $01C4: full optimization, no escape: G1 
                    db       $2B                          ; $01C5: full optimization, no escape: G#1 
                    db       $6C                          ; $01C6: normal track data 
                    db       $49                          ; $01C7: vol = $B (inverted), no pitch, no note, no instrument 
                    db       $2F                          ; $01C8: full optimization, no escape: A#1 
                    db       $31                          ; $01C9: full optimization, no escape: B1 
                    db       $62                          ; $01CA: normal track data 
                    db       $4B                          ; $01CB: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $25                          ; $01CC: full optimization, no escape: F1 
                    db       $27                          ; $01CD: full optimization, no escape: F#1 
                    db       $68                          ; $01CE: normal track data, note: G1 
                    db       $4D                          ; $01CF: vol = $9 (inverted), no pitch, no note, no instrument 
                    db       $2B                          ; $01D0: full optimization, no escape: G#1 
                    db       $2D                          ; $01D1: full optimization, no escape: A1 
                    db       $6E                          ; $01D2: normal track data, note: A#1 
                    db       $4F                          ; $01D3: vol = $8 (inverted), no pitch, no note, no instrument 
                    db       $31                          ; $01D4: full optimization, no escape: B1 
                    db       $23                          ; $01D5: full optimization, no escape: E1 
                    db       $64                          ; $01D6: normal track data 
                    db       $51                          ; $01D7: vol = $7 (inverted), no pitch, no note, no instrument 
                    db       $27                          ; $01D8: full optimization, no escape: F#1 
                    db       $68                          ; $01D9: normal track data 
                    db       $53                          ; $01DA: vol = $6 (inverted), no pitch, no note, no instrument 
                    db       $6A                          ; $01DB: normal track data, note: G#1 
                    db       $55                          ; $01DC: vol = $5 (inverted), no pitch, no note, no instrument 
                    db       $6C                          ; $01DD: normal track data, note: A1 
                    db       $57                          ; $01DE: vol = $4 (inverted), no pitch, no note, no instrument 
                    db       $6E                          ; $01DF: normal track data 
                    db       $59                          ; $01E0: vol = $3 (inverted), no pitch, no note, no instrument 
                    db       $70                          ; $01E1: normal track data 
                    db       $5B                          ; $01E2: vol = $2 (inverted), no pitch, no note, no instrument 
                    db       $62                          ; $01E3: normal track data, note: E1 
                    db       $5D                          ; $01E4: vol = $1 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $01E5: normal track data 
                    db       $00                          ; $01E6: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $01E7: normal track data 
                    db       $00                          ; $01E8: vol off, no pitch, no note, no instrument 
trackDef2BossZ: 
                    db       $64                          ; $01E9: normal track data 
                    db       $E1                          ; $01EA: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $01EB: pitch 
                    db       $01                          ; $01ED: instrument 
                    db       $42                          ; $01EE: normal track data 
                    db       $80                          ; $01EF: vol off, pitch, no note, no instrument 
                    dw       $0008                        ; $01F0: pitch 
                    db       $42                          ; $01F2: normal track data 
                    db       $00                          ; $01F3: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $01F4: normal track data 
                    db       $00                          ; $01F5: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $01F6: normal track data 
                    db       $80                          ; $01F7: vol off, pitch, no note, no instrument 
                    dw       $0003                        ; $01F8: pitch 
                    db       $42                          ; $01FA: normal track data 
                    db       $80                          ; $01FB: vol off, pitch, no note, no instrument 
                    dw       $0008                        ; $01FC: pitch 
                    db       $42                          ; $01FE: normal track data 
                    db       $80                          ; $01FF: vol off, pitch, no note, no instrument 
                    dw       $0005                        ; $0200: pitch 
                    db       $42                          ; $0202: normal track data 
                    db       $80                          ; $0203: vol off, pitch, no note, no instrument 
                    dw       $0004                        ; $0204: pitch 
                    db       $42                          ; $0206: normal track data 
                    db       $80                          ; $0207: vol off, pitch, no note, no instrument 
                    dw       $0005                        ; $0208: pitch 
                    db       $42                          ; $020A: normal track data 
                    db       $80                          ; $020B: vol off, pitch, no note, no instrument 
                    dw       $0004                        ; $020C: pitch 
                    db       $42                          ; $020E: normal track data 
                    db       $80                          ; $020F: vol off, pitch, no note, no instrument 
                    dw       $0003                        ; $0210: pitch 
                    db       $42                          ; $0212: normal track data 
                    db       $80                          ; $0213: vol off, pitch, no note, no instrument 
                    dw       $0002                        ; $0214: pitch 
                    db       $42                          ; $0216: normal track data 
                    db       $00                          ; $0217: vol off, no pitch, no note, no instrument 
                    db       $7C                          ; $0218: normal track data, note: F2 
                    db       $F7                          ; $0219: vol = $4 (inverted), no pitch, no note, no instrument 
                    dw       $0001                        ; $021A: pitch 
                    db       $04                          ; $021C: instrument 
                    db       $42                          ; $021D: normal track data 
                    db       $80                          ; $021E: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $021F: pitch 
                    db       $42                          ; $0221: normal track data, note: C0 
                    db       $15                          ; $0222: vol = $5 (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $0223: normal track data, wait 1 
                    db       $42                          ; $0224: normal track data 
                    db       $13                          ; $0225: vol = $6 (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $0226: normal track data, wait 1 
                    db       $42                          ; $0227: normal track data 
                    db       $11                          ; $0228: vol = $7 (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $0229: normal track data, wait 1 
                    db       $42                          ; $022A: normal track data, note: C0 
                    db       $0F                          ; $022B: vol = $8 (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $022C: normal track data, wait 1 
                    db       $42                          ; $022D: normal track data, note: C0 
                    db       $0D                          ; $022E: vol = $9 (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $022F: normal track data, wait 1 
                    db       $42                          ; $0230: normal track data 
                    db       $0B                          ; $0231: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $0232: normal track data, wait 2 
                    db       $42                          ; $0233: normal track data 
                    db       $09                          ; $0234: vol = $B (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $0235: normal track data, wait 1 
                    db       $42                          ; $0236: normal track data, note: C0 
                    db       $07                          ; $0237: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $08                          ; $0238: normal track data, wait 3 
                    db       $42                          ; $0239: normal track data, note: C0 
                    db       $05                          ; $023A: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $023B: normal track data, wait 1 
                    db       $42                          ; $023C: normal track data 
                    db       $03                          ; $023D: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $023E: normal track data, wait 1 
                    db       $42                          ; $023F: normal track data 
                    db       $01                          ; $0240: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $1A                          ; $0241: normal track data, wait 12 
                    db       $42                          ; $0242: normal track data 
                    db       $80                          ; $0243: vol off, pitch, no note, no instrument 
                    dw       $0003                        ; $0244: pitch 
                    db       $42                          ; $0246: normal track data 
                    db       $00                          ; $0247: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $0248: normal track data 
                    db       $00                          ; $0249: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $024A: normal track data 
                    db       $00                          ; $024B: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $024C: normal track data 
                    db       $00                          ; $024D: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $024E: normal track data 
                    db       $00                          ; $024F: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $0250: normal track data 
                    db       $80                          ; $0251: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $0252: pitch 
                    db       $42                          ; $0254: normal track data 
                    db       $00                          ; $0255: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $0256: normal track data 
                    db       $00                          ; $0257: vol off, no pitch, no note, no instrument 
                    db       $0E                          ; $0258: normal track data, wait 6 
                    db       $42                          ; $0259: normal track data 
                    db       $03                          ; $025A: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $025B: normal track data, wait 1 
                    db       $42                          ; $025C: normal track data, note: C0 
                    db       $05                          ; $025D: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $025E: normal track data, wait 1 
                    db       $42                          ; $025F: normal track data, note: C0 
                    db       $07                          ; $0260: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $0261: normal track data, wait 1 
                    db       $42                          ; $0262: normal track data 
                    db       $09                          ; $0263: vol = $B (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $0264: normal track data, wait 0 
                    db       $42                          ; $0265: normal track data 
                    db       $0B                          ; $0266: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $0267: normal track data, wait 0 
                    db       $42                          ; $0268: normal track data, note: C0 
                    db       $0D                          ; $0269: vol = $9 (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $026A: normal track data, wait 0 
                    db       $42                          ; $026B: normal track data, note: C0 
                    db       $0F                          ; $026C: vol = $8 (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $026D: normal track data, wait 0 
                    db       $42                          ; $026E: normal track data 
                    db       $11                          ; $026F: vol = $7 (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $0270: normal track data, wait 0 
                    db       $42                          ; $0271: normal track data 
                    db       $13                          ; $0272: vol = $6 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0273: normal track data, note: C0 
                    db       $15                          ; $0274: vol = $5 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0275: normal track data, note: C0 
                    db       $17                          ; $0276: vol = $4 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0277: normal track data 
                    db       $19                          ; $0278: vol = $3 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0279: normal track data 
                    db       $1B                          ; $027A: vol = $2 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $027B: normal track data, note: C0 
                    db       $1D                          ; $027C: vol = $1 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $027D: normal track data, note: C0 
                    db       $1F                          ; $027E: vol = $0 (inverted), no pitch, no note, no instrument 
                    db       $00                          ; $027F: track end signature found 
