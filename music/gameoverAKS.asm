; This file was build using VIDE - Vectrex Integrated Development Environment
; Original bin file was: projects/Vectorblade/Music/gameover.bin
; 
; offset for AKS file assumed: $0000 guessed by accessing byte data[13] * 256)
; not used by vectrex player and therefor omitted:
;  DB "AT10" ; Signature of Arkos Tracker files
;  DB $01 ; sample channel
;  DB $40, 42, 0f ; YM custom frequence - little endian
;  DB $02 ; Replay frequency (0=13hz,1=25hz,2=50hz,3=100hz,4=150hz,5=300hz)
SongAddressGameOverMusic: 
                    db       $06                          ; $0009: default speed 
                    dw       $0017                        ; $000A: size of instrument table (without this word pointer) 
                    dw       instrument0GameOverMusic     ; $000C: [$0010] pointer to instrument 0 
                    dw       instrument1GameOverMusic     ; $000E: [$0019] pointer to instrument 1 
instrument0GameOverMusic: 
                    db       $00                          ; $0010: speed 
                    db       $00                          ; $0011: retrig 
instrument0loopGameOverMusic: 
                    db       $00                          ; $0012: dataColumn_0 (non hard), vol=$0 
                    db       $00                          ; $0013: dataColumn_0 (non hard), vol=$0 
                    db       $00                          ; $0014: dataColumn_0 (non hard), vol=$0 
                    db       $00                          ; $0015: dataColumn_0 (non hard), vol=$0 
                    db       $0D                          ; $0016: dataColumn_0 (hard) 
                    dw       instrument0loopGameOverMusic ; $0017: [$0012] loop 
instrument1GameOverMusic: 
                    db       $04                          ; $0019: speed 
                    db       $00                          ; $001A: retrig 
instrument1loopGameOverMusic: 
                    db       $70                          ; $001B: dataColumn_0 (non hard), vol=$C 
                    db       $0C                          ; $001C: arpegio 
                    db       $B8                          ; $001D: dataColumn_0 (non hard), vol=$E 
                    dw       $FFF4                        ; $001E: pitch 
                    db       $0D                          ; $0020: dataColumn_0 (hard) 
                    dw       instrument1loopGameOverMusic ; $0021: [$001B] loop 
; start of linker definition
linkerGameOverMusic: 
                    db       $28                          ; $0023: first height 
                    db       $00                          ; $0024: transposition1 
                    db       $00                          ; $0025: transposition2 
                    db       $00                          ; $0026: transposition3 
                    dw       specialtrackDef0GameOverMusic ; $0027: [$0033] specialTrack 
pattern0DefinitionGameOverMusic: 
                    db       $00                          ; $0029: pattern 0 state 
                    dw       trackDef0GameOverMusic       ; $002A: [$0035] pattern 0, track 1 
                    dw       trackDef1GameOverMusic       ; $002C: [$00B7] pattern 0, track 2 
                    dw       trackDef2GameOverMusic       ; $002E: [$013D] pattern 0, track 3 
pattern1DefinitionGameOverMusic: 
                    db       $01                          ; $0030: pattern 1 state 
                    dw       pattern0DefinitionGameOverMusic ; $0031: [$0029] song restart address 
specialtrackDef0GameOverMusic: 
                    db       $35                          ; $0033: data, speed 13 
                    db       $00                          ; $0034: wait 128 
trackDef0GameOverMusic: 
                    db       $C4                          ; $0035: normal track data, note: F5 
                    db       $E5                          ; $0036: vol = $D (inverted), no pitch, no note, no instrument 
                    dw       $0001                        ; $0037: pitch 
                    db       $01                          ; $0039: instrument 
                    db       $42                          ; $003A: normal track data 
                    db       $03                          ; $003B: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $003C: normal track data 
                    db       $81                          ; $003D: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $FFFF                        ; $003E: pitch 
                    db       $42                          ; $0040: normal track data 
                    db       $80                          ; $0041: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $0042: pitch 
                    db       $42                          ; $0044: normal track data 
                    db       $00                          ; $0045: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $0046: normal track data 
                    db       $80                          ; $0047: vol off, pitch, no note, no instrument 
                    dw       $FFFF                        ; $0048: pitch 
                    db       $42                          ; $004A: normal track data 
                    db       $80                          ; $004B: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $004C: pitch 
                    db       $42                          ; $004E: normal track data 
                    db       $00                          ; $004F: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $0050: normal track data 
                    db       $83                          ; $0051: vol = $E (inverted), no pitch, no note, no instrument 
                    dw       $FFFF                        ; $0052: pitch 
                    db       $42                          ; $0054: normal track data 
                    db       $80                          ; $0055: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $0056: pitch 
                    db       $42                          ; $0058: normal track data 
                    db       $00                          ; $0059: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $005A: normal track data 
                    db       $80                          ; $005B: vol off, pitch, no note, no instrument 
                    dw       $FFFF                        ; $005C: pitch 
                    db       $42                          ; $005E: normal track data 
                    db       $80                          ; $005F: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $0060: pitch 
                    db       $42                          ; $0062: normal track data, note: C0 
                    db       $05                          ; $0063: vol = $D (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0064: normal track data 
                    db       $80                          ; $0065: vol off, pitch, no note, no instrument 
                    dw       $FFFF                        ; $0066: pitch 
                    db       $42                          ; $0068: normal track data 
                    db       $80                          ; $0069: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $006A: pitch 
                    db       $42                          ; $006C: normal track data 
                    db       $00                          ; $006D: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $006E: normal track data 
                    db       $80                          ; $006F: vol off, pitch, no note, no instrument 
                    dw       $FFFF                        ; $0070: pitch 
                    db       $42                          ; $0072: normal track data, note: C0 
                    db       $87                          ; $0073: vol = $C (inverted), no pitch, no note, no instrument 
                    dw       $0001                        ; $0074: pitch 
                    db       $42                          ; $0076: normal track data 
                    db       $00                          ; $0077: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $0078: normal track data 
                    db       $80                          ; $0079: vol off, pitch, no note, no instrument 
                    dw       $FFFF                        ; $007A: pitch 
                    db       $42                          ; $007C: normal track data 
                    db       $80                          ; $007D: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $007E: pitch 
                    db       $42                          ; $0080: normal track data 
                    db       $00                          ; $0081: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $0082: normal track data 
                    db       $89                          ; $0083: vol = $B (inverted), no pitch, no note, no instrument 
                    dw       $FFFF                        ; $0084: pitch 
                    db       $42                          ; $0086: normal track data 
                    db       $80                          ; $0087: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $0088: pitch 
                    db       $42                          ; $008A: normal track data 
                    db       $00                          ; $008B: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $008C: normal track data 
                    db       $8B                          ; $008D: vol = $A (inverted), no pitch, no note, no instrument 
                    dw       $FFFF                        ; $008E: pitch 
                    db       $42                          ; $0090: normal track data, note: C0 
                    db       $8D                          ; $0091: vol = $9 (inverted), no pitch, no note, no instrument 
                    dw       $0001                        ; $0092: pitch 
                    db       $42                          ; $0094: normal track data, note: C0 
                    db       $0F                          ; $0095: vol = $8 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0096: normal track data 
                    db       $91                          ; $0097: vol = $7 (inverted), no pitch, no note, no instrument 
                    dw       $FFFF                        ; $0098: pitch 
                    db       $42                          ; $009A: normal track data 
                    db       $93                          ; $009B: vol = $6 (inverted), no pitch, no note, no instrument 
                    dw       $0001                        ; $009C: pitch 
                    db       $42                          ; $009E: normal track data, note: C0 
                    db       $15                          ; $009F: vol = $5 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $00A0: normal track data, note: C0 
                    db       $97                          ; $00A1: vol = $4 (inverted), no pitch, no note, no instrument 
                    dw       $FFFF                        ; $00A2: pitch 
                    db       $42                          ; $00A4: normal track data 
                    db       $99                          ; $00A5: vol = $3 (inverted), no pitch, no note, no instrument 
                    dw       $0001                        ; $00A6: pitch 
                    db       $42                          ; $00A8: normal track data 
                    db       $1B                          ; $00A9: vol = $2 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $00AA: normal track data, note: C0 
                    db       $9D                          ; $00AB: vol = $1 (inverted), no pitch, no note, no instrument 
                    dw       $FFFF                        ; $00AC: pitch 
                    db       $42                          ; $00AE: normal track data, note: C0 
                    db       $9F                          ; $00AF: vol = $0 (inverted), no pitch, no note, no instrument 
                    dw       $0001                        ; $00B0: pitch 
                    db       $42                          ; $00B2: normal track data 
                    db       $80                          ; $00B3: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $00B4: pitch 
                    db       $00                          ; $00B6: track end signature found 
trackDef1GameOverMusic: 
                    db       $C6                          ; $00B7: normal track data, note: F#5 
                    db       $E5                          ; $00B8: vol = $D (inverted), no pitch, no note, no instrument 
                    dw       $0001                        ; $00B9: pitch 
                    db       $01                          ; $00BB: instrument 
                    db       $42                          ; $00BC: normal track data 
                    db       $80                          ; $00BD: vol off, pitch, no note, no instrument 
                    dw       $FFFF                        ; $00BE: pitch 
                    db       $42                          ; $00C0: normal track data 
                    db       $83                          ; $00C1: vol = $E (inverted), no pitch, no note, no instrument 
                    dw       $0001                        ; $00C2: pitch 
                    db       $42                          ; $00C4: normal track data 
                    db       $01                          ; $00C5: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $00C6: normal track data 
                    db       $80                          ; $00C7: vol off, pitch, no note, no instrument 
                    dw       $FFFF                        ; $00C8: pitch 
                    db       $42                          ; $00CA: normal track data 
                    db       $80                          ; $00CB: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $00CC: pitch 
                    db       $42                          ; $00CE: normal track data 
                    db       $00                          ; $00CF: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $00D0: normal track data 
                    db       $80                          ; $00D1: vol off, pitch, no note, no instrument 
                    dw       $FFFF                        ; $00D2: pitch 
                    db       $42                          ; $00D4: normal track data 
                    db       $80                          ; $00D5: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $00D6: pitch 
                    db       $42                          ; $00D8: normal track data 
                    db       $03                          ; $00D9: vol = $E (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $00DA: normal track data 
                    db       $80                          ; $00DB: vol off, pitch, no note, no instrument 
                    dw       $FFFF                        ; $00DC: pitch 
                    db       $42                          ; $00DE: normal track data 
                    db       $80                          ; $00DF: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $00E0: pitch 
                    db       $42                          ; $00E2: normal track data 
                    db       $00                          ; $00E3: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $00E4: normal track data 
                    db       $80                          ; $00E5: vol off, pitch, no note, no instrument 
                    dw       $FFFF                        ; $00E6: pitch 
                    db       $42                          ; $00E8: normal track data, note: C0 
                    db       $85                          ; $00E9: vol = $D (inverted), no pitch, no note, no instrument 
                    dw       $0001                        ; $00EA: pitch 
                    db       $42                          ; $00EC: normal track data 
                    db       $00                          ; $00ED: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $00EE: normal track data 
                    db       $80                          ; $00EF: vol off, pitch, no note, no instrument 
                    dw       $FFFF                        ; $00F0: pitch 
                    db       $42                          ; $00F2: normal track data 
                    db       $80                          ; $00F3: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $00F4: pitch 
                    db       $42                          ; $00F6: normal track data 
                    db       $00                          ; $00F7: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $00F8: normal track data, note: C0 
                    db       $87                          ; $00F9: vol = $C (inverted), no pitch, no note, no instrument 
                    dw       $FFFF                        ; $00FA: pitch 
                    db       $42                          ; $00FC: normal track data 
                    db       $80                          ; $00FD: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $00FE: pitch 
                    db       $42                          ; $0100: normal track data 
                    db       $00                          ; $0101: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $0102: normal track data 
                    db       $80                          ; $0103: vol off, pitch, no note, no instrument 
                    dw       $FFFF                        ; $0104: pitch 
                    db       $42                          ; $0106: normal track data 
                    db       $80                          ; $0107: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $0108: pitch 
                    db       $42                          ; $010A: normal track data 
                    db       $09                          ; $010B: vol = $B (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $010C: normal track data 
                    db       $80                          ; $010D: vol off, pitch, no note, no instrument 
                    dw       $FFFF                        ; $010E: pitch 
                    db       $42                          ; $0110: normal track data 
                    db       $80                          ; $0111: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $0112: pitch 
                    db       $42                          ; $0114: normal track data 
                    db       $0B                          ; $0115: vol = $A (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0116: normal track data, note: C0 
                    db       $8D                          ; $0117: vol = $9 (inverted), no pitch, no note, no instrument 
                    dw       $FFFF                        ; $0118: pitch 
                    db       $42                          ; $011A: normal track data, note: C0 
                    db       $8F                          ; $011B: vol = $8 (inverted), no pitch, no note, no instrument 
                    dw       $0001                        ; $011C: pitch 
                    db       $42                          ; $011E: normal track data 
                    db       $11                          ; $011F: vol = $7 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0120: normal track data 
                    db       $93                          ; $0121: vol = $6 (inverted), no pitch, no note, no instrument 
                    dw       $FFFF                        ; $0122: pitch 
                    db       $42                          ; $0124: normal track data, note: C0 
                    db       $95                          ; $0125: vol = $5 (inverted), no pitch, no note, no instrument 
                    dw       $0001                        ; $0126: pitch 
                    db       $42                          ; $0128: normal track data, note: C0 
                    db       $17                          ; $0129: vol = $4 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $012A: normal track data 
                    db       $99                          ; $012B: vol = $3 (inverted), no pitch, no note, no instrument 
                    dw       $FFFF                        ; $012C: pitch 
                    db       $42                          ; $012E: normal track data 
                    db       $9B                          ; $012F: vol = $2 (inverted), no pitch, no note, no instrument 
                    dw       $0001                        ; $0130: pitch 
                    db       $42                          ; $0132: normal track data, note: C0 
                    db       $1D                          ; $0133: vol = $1 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0134: normal track data, note: C0 
                    db       $9F                          ; $0135: vol = $0 (inverted), no pitch, no note, no instrument 
                    dw       $FFFF                        ; $0136: pitch 
                    db       $42                          ; $0138: normal track data 
                    db       $80                          ; $0139: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $013A: pitch 
                    db       $00                          ; $013C: track end signature found 
trackDef2GameOverMusic: 
                    db       $CC                          ; $013D: normal track data, note: A5 
                    db       $E5                          ; $013E: vol = $D (inverted), no pitch, no note, no instrument 
                    dw       $FFFF                        ; $013F: pitch 
                    db       $01                          ; $0141: instrument 
                    db       $42                          ; $0142: normal track data 
                    db       $80                          ; $0143: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $0144: pitch 
                    db       $42                          ; $0146: normal track data 
                    db       $00                          ; $0147: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $0148: normal track data 
                    db       $83                          ; $0149: vol = $E (inverted), no pitch, no note, no instrument 
                    dw       $FFFF                        ; $014A: pitch 
                    db       $42                          ; $014C: normal track data 
                    db       $81                          ; $014D: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0001                        ; $014E: pitch 
                    db       $42                          ; $0150: normal track data 
                    db       $00                          ; $0151: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $0152: normal track data 
                    db       $80                          ; $0153: vol off, pitch, no note, no instrument 
                    dw       $FFFF                        ; $0154: pitch 
                    db       $42                          ; $0156: normal track data 
                    db       $80                          ; $0157: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $0158: pitch 
                    db       $42                          ; $015A: normal track data 
                    db       $00                          ; $015B: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $015C: normal track data 
                    db       $80                          ; $015D: vol off, pitch, no note, no instrument 
                    dw       $FFFF                        ; $015E: pitch 
                    db       $42                          ; $0160: normal track data 
                    db       $83                          ; $0161: vol = $E (inverted), no pitch, no note, no instrument 
                    dw       $0001                        ; $0162: pitch 
                    db       $42                          ; $0164: normal track data 
                    db       $00                          ; $0165: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $0166: normal track data 
                    db       $80                          ; $0167: vol off, pitch, no note, no instrument 
                    dw       $FFFF                        ; $0168: pitch 
                    db       $42                          ; $016A: normal track data 
                    db       $80                          ; $016B: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $016C: pitch 
                    db       $42                          ; $016E: normal track data 
                    db       $00                          ; $016F: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $0170: normal track data, note: C0 
                    db       $85                          ; $0171: vol = $D (inverted), no pitch, no note, no instrument 
                    dw       $FFFF                        ; $0172: pitch 
                    db       $42                          ; $0174: normal track data 
                    db       $80                          ; $0175: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $0176: pitch 
                    db       $42                          ; $0178: normal track data 
                    db       $00                          ; $0179: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $017A: normal track data 
                    db       $80                          ; $017B: vol off, pitch, no note, no instrument 
                    dw       $FFFF                        ; $017C: pitch 
                    db       $42                          ; $017E: normal track data 
                    db       $80                          ; $017F: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $0180: pitch 
                    db       $42                          ; $0182: normal track data, note: C0 
                    db       $07                          ; $0183: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $0184: normal track data 
                    db       $80                          ; $0185: vol off, pitch, no note, no instrument 
                    dw       $FFFF                        ; $0186: pitch 
                    db       $42                          ; $0188: normal track data 
                    db       $80                          ; $0189: vol off, pitch, no note, no instrument 
                    dw       $0001                        ; $018A: pitch 
                    db       $42                          ; $018C: normal track data 
                    db       $00                          ; $018D: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $018E: normal track data 
                    db       $80                          ; $018F: vol off, pitch, no note, no instrument 
                    dw       $FFFF                        ; $0190: pitch 
                    db       $42                          ; $0192: normal track data 
                    db       $89                          ; $0193: vol = $B (inverted), no pitch, no note, no instrument 
                    dw       $0001                        ; $0194: pitch 
                    db       $42                          ; $0196: normal track data 
                    db       $00                          ; $0197: vol off, no pitch, no note, no instrument 
                    db       $42                          ; $0198: normal track data 
                    db       $80                          ; $0199: vol off, pitch, no note, no instrument 
                    dw       $FFFF                        ; $019A: pitch 
                    db       $42                          ; $019C: normal track data 
                    db       $8B                          ; $019D: vol = $A (inverted), no pitch, no note, no instrument 
                    dw       $0001                        ; $019E: pitch 
                    db       $42                          ; $01A0: normal track data, note: C0 
                    db       $0D                          ; $01A1: vol = $9 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $01A2: normal track data, note: C0 
                    db       $8F                          ; $01A3: vol = $8 (inverted), no pitch, no note, no instrument 
                    dw       $FFFF                        ; $01A4: pitch 
                    db       $42                          ; $01A6: normal track data 
                    db       $91                          ; $01A7: vol = $7 (inverted), no pitch, no note, no instrument 
                    dw       $0001                        ; $01A8: pitch 
                    db       $42                          ; $01AA: normal track data 
                    db       $13                          ; $01AB: vol = $6 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $01AC: normal track data, note: C0 
                    db       $95                          ; $01AD: vol = $5 (inverted), no pitch, no note, no instrument 
                    dw       $FFFF                        ; $01AE: pitch 
                    db       $42                          ; $01B0: normal track data, note: C0 
                    db       $97                          ; $01B1: vol = $4 (inverted), no pitch, no note, no instrument 
                    dw       $0001                        ; $01B2: pitch 
                    db       $42                          ; $01B4: normal track data 
                    db       $19                          ; $01B5: vol = $3 (inverted), no pitch, no note, no instrument 
                    db       $42                          ; $01B6: normal track data 
                    db       $9B                          ; $01B7: vol = $2 (inverted), no pitch, no note, no instrument 
                    dw       $FFFF                        ; $01B8: pitch 
                    db       $42                          ; $01BA: normal track data, note: C0 
                    db       $9D                          ; $01BB: vol = $1 (inverted), no pitch, no note, no instrument 
                    dw       $0010                        ; $01BC: pitch 
                    db       $42                          ; $01BE: normal track data, note: C0 
                    db       $9F                          ; $01BF: vol = $0 (inverted), no pitch, no note, no instrument 
                    dw       $0001                        ; $01C0: pitch 
                    db       $42                          ; $01C2: normal track data 
                    db       $80                          ; $01C3: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $01C4: pitch 
