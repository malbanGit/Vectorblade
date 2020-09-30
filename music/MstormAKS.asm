; This file was build using VIDE - Vectrex Integrated Development Environment
; Original bin file was: projects/Vectorblade/Music/Mstorm.bin
; 
; offset for AKS file assumed: $0000 guessed by accessing byte data[13] * 256)
; not used by vectrex player and therefor omitted:
;  DB "AT10" ; Signature of Arkos Tracker files
;  DB $01 ; sample channel
;  DB $40, 42, 0f ; YM custom frequence - little endian
;  DB $02 ; Replay frequency (0=13hz,1=25hz,2=50hz,3=100hz,4=150hz,5=300hz)
SongAddressMStormMusic: 
                    db       $06                          ; $0009: default speed 
                    dw       $00AE                        ; $000A: size of instrument table (without this word pointer) 
                    dw       instrument0MStormMusic       ; $000C: [$0014] pointer to instrument 0 
                    dw       instrument1MStormMusic       ; $000E: [$001D] pointer to instrument 1 
                    dw       instrument2MStormMusic       ; $0010: [$007B] pointer to instrument 2 
                    dw       instrument3MStormMusic       ; $0012: [$0096] pointer to instrument 3 
instrument0MStormMusic: 
                    db       $00                          ; $0014: speed 
                    db       $00                          ; $0015: retrig 
instrument0loopMStormMusic: 
                    db       $00                          ; $0016: dataColumn_0 (non hard), vol=$0 
                    db       $00                          ; $0017: dataColumn_0 (non hard), vol=$0 
                    db       $00                          ; $0018: dataColumn_0 (non hard), vol=$0 
                    db       $00                          ; $0019: dataColumn_0 (non hard), vol=$0 
                    db       $0D                          ; $001A: dataColumn_0 (hard) 
                    dw       instrument0loopMStormMusic   ; $001B: [$0016] loop 
instrument1MStormMusic: 
                    db       $01                          ; $001D: speed 
                    db       $00                          ; $001E: retrig 
                    db       $3C                          ; $001F: dataColumn_0 (non hard), vol=$F 
                    db       $3C                          ; $0020: dataColumn_0 (non hard), vol=$F 
                    db       $3C                          ; $0021: dataColumn_0 (non hard), vol=$F 
                    db       $3C                          ; $0022: dataColumn_0 (non hard), vol=$F 
                    db       $3C                          ; $0023: dataColumn_0 (non hard), vol=$F 
                    db       $38                          ; $0024: dataColumn_0 (non hard), vol=$E 
                    db       $B4                          ; $0025: dataColumn_0 (non hard), vol=$D 
                    dw       $FFFF                        ; $0026: pitch 
                    db       $B4                          ; $0028: dataColumn_0 (non hard), vol=$D 
                    dw       $FFFE                        ; $0029: pitch 
                    db       $38                          ; $002B: dataColumn_0 (non hard), vol=$E 
                    db       $B8                          ; $002C: dataColumn_0 (non hard), vol=$E 
                    dw       $FFFE                        ; $002D: pitch 
                    db       $B4                          ; $002F: dataColumn_0 (non hard), vol=$D 
                    dw       $FFFF                        ; $0030: pitch 
                    db       $B4                          ; $0032: dataColumn_0 (non hard), vol=$D 
                    dw       $FFFE                        ; $0033: pitch 
                    db       $34                          ; $0035: dataColumn_0 (non hard), vol=$D 
                    db       $AC                          ; $0036: dataColumn_0 (non hard), vol=$B 
                    dw       $FFFE                        ; $0037: pitch 
                    db       $AC                          ; $0039: dataColumn_0 (non hard), vol=$B 
                    dw       $FFFF                        ; $003A: pitch 
                    db       $B0                          ; $003C: dataColumn_0 (non hard), vol=$C 
                    dw       $FFFE                        ; $003D: pitch 
                    db       $30                          ; $003F: dataColumn_0 (non hard), vol=$C 
                    db       $B0                          ; $0040: dataColumn_0 (non hard), vol=$C 
                    dw       $FFFE                        ; $0041: pitch 
                    db       $B4                          ; $0043: dataColumn_0 (non hard), vol=$D 
                    dw       $FFFF                        ; $0044: pitch 
                    db       $B0                          ; $0046: dataColumn_0 (non hard), vol=$C 
                    dw       $0001                        ; $0047: pitch 
                    db       $2C                          ; $0049: dataColumn_0 (non hard), vol=$B 
                    db       $AC                          ; $004A: dataColumn_0 (non hard), vol=$B 
                    dw       $FFFE                        ; $004B: pitch 
                    db       $AC                          ; $004D: dataColumn_0 (non hard), vol=$B 
                    dw       $FFFF                        ; $004E: pitch 
                    db       $28                          ; $0050: dataColumn_0 (non hard), vol=$A 
                    db       $A4                          ; $0051: dataColumn_0 (non hard), vol=$9 
                    dw       $FFFE                        ; $0052: pitch 
                    db       $A0                          ; $0054: dataColumn_0 (non hard), vol=$8 
                    dw       $0001                        ; $0055: pitch 
                    db       $20                          ; $0057: dataColumn_0 (non hard), vol=$8 
                    db       $A0                          ; $0058: dataColumn_0 (non hard), vol=$8 
                    dw       $FFFF                        ; $0059: pitch 
                    db       $A0                          ; $005B: dataColumn_0 (non hard), vol=$8 
                    dw       $FFFF                        ; $005C: pitch 
                    db       $1C                          ; $005E: dataColumn_0 (non hard), vol=$7 
                    db       $9C                          ; $005F: dataColumn_0 (non hard), vol=$7 
                    dw       $FFFE                        ; $0060: pitch 
                    db       $1C                          ; $0062: dataColumn_0 (non hard), vol=$7 
                    db       $9C                          ; $0063: dataColumn_0 (non hard), vol=$7 
                    dw       $FFFF                        ; $0064: pitch 
                    db       $9C                          ; $0066: dataColumn_0 (non hard), vol=$7 
                    dw       $FFFE                        ; $0067: pitch 
                    db       $18                          ; $0069: dataColumn_0 (non hard), vol=$6 
                    db       $94                          ; $006A: dataColumn_0 (non hard), vol=$5 
                    dw       $FFFF                        ; $006B: pitch 
                    db       $90                          ; $006D: dataColumn_0 (non hard), vol=$4 
                    dw       $FFFE                        ; $006E: pitch 
                    db       $90                          ; $0070: dataColumn_0 (non hard), vol=$4 
                    dw       $FFFE                        ; $0071: pitch 
                    db       $0C                          ; $0073: dataColumn_0 (non hard), vol=$3 
                    db       $88                          ; $0074: dataColumn_0 (non hard), vol=$2 
                    dw       $FFFF                        ; $0075: pitch 
                    db       $04                          ; $0077: dataColumn_0 (non hard), vol=$1 
                    db       $0D                          ; $0078: dataColumn_0 (hard) 
                    dw       instrument0loopMStormMusic   ; $0079: [$0016] loop 
instrument2MStormMusic: 
                    db       $03                          ; $007B: speed 
                    db       $00                          ; $007C: retrig 
                    db       $3C                          ; $007D: dataColumn_0 (non hard), vol=$F 
                    db       $78                          ; $007E: dataColumn_0 (non hard), vol=$E 
                    db       $0C                          ; $007F: arpegio 
                    db       $34                          ; $0080: dataColumn_0 (non hard), vol=$D 
                    db       $74                          ; $0081: dataColumn_0 (non hard), vol=$D 
                    db       $0C                          ; $0082: arpegio 
                    db       $30                          ; $0083: dataColumn_0 (non hard), vol=$C 
                    db       $6C                          ; $0084: dataColumn_0 (non hard), vol=$B 
                    db       $0C                          ; $0085: arpegio 
                    db       $2C                          ; $0086: dataColumn_0 (non hard), vol=$B 
                    db       $68                          ; $0087: dataColumn_0 (non hard), vol=$A 
                    db       $0C                          ; $0088: arpegio 
                    db       $24                          ; $0089: dataColumn_0 (non hard), vol=$9 
                    db       $60                          ; $008A: dataColumn_0 (non hard), vol=$8 
                    db       $0C                          ; $008B: arpegio 
                    db       $1C                          ; $008C: dataColumn_0 (non hard), vol=$7 
                    db       $5C                          ; $008D: dataColumn_0 (non hard), vol=$7 
                    db       $0C                          ; $008E: arpegio 
                    db       $18                          ; $008F: dataColumn_0 (non hard), vol=$6 
                    db       $14                          ; $0090: dataColumn_0 (non hard), vol=$5 
                    db       $10                          ; $0091: dataColumn_0 (non hard), vol=$4 
                    db       $0C                          ; $0092: dataColumn_0 (non hard), vol=$3 
                    db       $0D                          ; $0093: dataColumn_0 (hard) 
                    dw       instrument0loopMStormMusic   ; $0094: [$0016] loop 
instrument3MStormMusic: 
                    db       $03                          ; $0096: speed 
                    db       $00                          ; $0097: retrig 
                    db       $BC                          ; $0098: dataColumn_0 (non hard), vol=$F 
                    dw       $0001                        ; $0099: pitch 
                    db       $B8                          ; $009B: dataColumn_0 (non hard), vol=$E 
                    dw       $FFFF                        ; $009C: pitch 
                    db       $B4                          ; $009E: dataColumn_0 (non hard), vol=$D 
                    dw       $FFFE                        ; $009F: pitch 
                    db       $A0                          ; $00A1: dataColumn_0 (non hard), vol=$8 
                    dw       $FFFF                        ; $00A2: pitch 
                    db       $A8                          ; $00A4: dataColumn_0 (non hard), vol=$A 
                    dw       $0001                        ; $00A5: pitch 
                    db       $A4                          ; $00A7: dataColumn_0 (non hard), vol=$9 
                    dw       $FFFF                        ; $00A8: pitch 
                    db       $24                          ; $00AA: dataColumn_0 (non hard), vol=$9 
                    db       $A0                          ; $00AB: dataColumn_0 (non hard), vol=$8 
                    dw       $FFFF                        ; $00AC: pitch 
                    db       $1C                          ; $00AE: dataColumn_0 (non hard), vol=$7 
                    db       $98                          ; $00AF: dataColumn_0 (non hard), vol=$6 
                    dw       $FFFF                        ; $00B0: pitch 
                    db       $14                          ; $00B2: dataColumn_0 (non hard), vol=$5 
                    db       $10                          ; $00B3: dataColumn_0 (non hard), vol=$4 
                    db       $0C                          ; $00B4: dataColumn_0 (non hard), vol=$3 
                    db       $08                          ; $00B5: dataColumn_0 (non hard), vol=$2 
                    db       $04                          ; $00B6: dataColumn_0 (non hard), vol=$1 
                    db       $0D                          ; $00B7: dataColumn_0 (hard) 
                    dw       instrument0loopMStormMusic   ; $00B8: [$0016] loop 
; start of linker definition
linkerMStormMusic: 
                    db       $37                          ; $00BA: first height 
                    db       $00                          ; $00BB: transposition1 
                    db       $00                          ; $00BC: transposition2 
                    db       $00                          ; $00BD: transposition3 
                    dw       specialtrackDef0MStormMusic  ; $00BE: [$00CA] specialTrack 
pattern0DefinitionMStormMusic: 
                    db       $00                          ; $00C0: pattern 0 state 
                    dw       trackDef0MStormMusic         ; $00C1: [$00CC] pattern 0, track 1 
                    dw       trackDef1MStormMusic         ; $00C3: [$010B] pattern 0, track 2 
                    dw       trackDef2MStormMusic         ; $00C5: [$012A] pattern 0, track 3 
pattern1DefinitionMStormMusic: 
                    db       $01                          ; $00C7: pattern 1 state 
                    dw       pattern0DefinitionMStormMusic ; $00C8: [$00C0] song restart address 
specialtrackDef0MStormMusic: 
                    db       $15                          ; $00CA: data, speed 5 
                    db       $00                          ; $00CB: wait 128 
trackDef0MStormMusic: 
                    db       $7C                          ; $00CC: normal track data 
                    db       $E1                          ; $00CD: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $00CE: pitch 
                    db       $01                          ; $00D0: instrument 
                    db       $02                          ; $00D1: normal track data, wait 0 
                    db       $7C                          ; $00D2: normal track data, note: F2 
                    db       $47                          ; $00D3: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $00D4: normal track data, wait 0 
                    db       $7E                          ; $00D5: normal track data 
                    db       $41                          ; $00D6: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $00D7: normal track data, wait 0 
                    db       $7E                          ; $00D8: normal track data, note: F#2 
                    db       $47                          ; $00D9: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $00DA: normal track data, wait 0 
                    db       $7C                          ; $00DB: normal track data 
                    db       $41                          ; $00DC: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $00DD: normal track data, wait 0 
                    db       $7C                          ; $00DE: normal track data, note: F2 
                    db       $47                          ; $00DF: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $00E0: normal track data, wait 0 
                    db       $7E                          ; $00E1: normal track data 
                    db       $41                          ; $00E2: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $00E3: normal track data, wait 0 
                    db       $7E                          ; $00E4: normal track data, note: F#2 
                    db       $47                          ; $00E5: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $00E6: normal track data, wait 1 
                    db       $42                          ; $00E7: normal track data, note: C0 
                    db       $0D                          ; $00E8: vol = $9 (inverted), no pitch, no note, no instrument 
                    db       $0C                          ; $00E9: normal track data, wait 5 
                    db       $7C                          ; $00EA: normal track data 
                    db       $41                          ; $00EB: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $00EC: normal track data, wait 0 
                    db       $7C                          ; $00ED: normal track data, note: F2 
                    db       $47                          ; $00EE: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $00EF: normal track data, wait 0 
                    db       $7E                          ; $00F0: normal track data 
                    db       $41                          ; $00F1: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $00F2: normal track data, wait 0 
                    db       $7E                          ; $00F3: normal track data, note: F#2 
                    db       $47                          ; $00F4: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $00F5: normal track data, wait 0 
                    db       $7C                          ; $00F6: normal track data 
                    db       $41                          ; $00F7: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $00F8: normal track data, wait 0 
                    db       $7C                          ; $00F9: normal track data, note: F2 
                    db       $47                          ; $00FA: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $00FB: normal track data, wait 0 
                    db       $86                          ; $00FC: normal track data 
                    db       $41                          ; $00FD: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $00FE: normal track data, wait 0 
                    db       $86                          ; $00FF: normal track data, note: A#2 
                    db       $47                          ; $0100: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $0101: normal track data, wait 0 
                    db       $84                          ; $0102: normal track data 
                    db       $41                          ; $0103: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $02                          ; $0104: normal track data, wait 0 
                    db       $84                          ; $0105: normal track data, note: A2 
                    db       $47                          ; $0106: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $04                          ; $0107: normal track data, wait 1 
                    db       $42                          ; $0108: normal track data, note: C0 
                    db       $0D                          ; $0109: vol = $9 (inverted), no pitch, no note, no instrument 
                    db       $00                          ; $010A: track end signature found 
trackDef1MStormMusic: 
                    db       $42                          ; $010B: normal track data 
                    db       $81                          ; $010C: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $010D: pitch 
                    db       $94                          ; $010F: normal track data 
                    db       $60                          ; $0110: vol off, no pitch, note, instrument 
                    db       $02                          ; $0111: instrument 
                    db       $06                          ; $0112: normal track data, wait 2 
                    db       $57                          ; $0113: full optimization, no escape: F#3 
                    db       $06                          ; $0114: normal track data, wait 2 
                    db       $55                          ; $0115: full optimization, no escape: F3 
                    db       $06                          ; $0116: normal track data, wait 2 
                    db       $57                          ; $0117: full optimization, no escape: F#3 
                    db       $04                          ; $0118: normal track data, wait 1 
                    db       $42                          ; $0119: normal track data, note: C0 
                    db       $07                          ; $011A: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $10                          ; $011B: normal track data, wait 7 
                    db       $94                          ; $011C: normal track data 
                    db       $41                          ; $011D: vol = $F (inverted), no pitch, no note, no instrument 
                    db       $06                          ; $011E: normal track data, wait 2 
                    db       $57                          ; $011F: full optimization, no escape: F#3 
                    db       $06                          ; $0120: normal track data, wait 2 
                    db       $55                          ; $0121: full optimization, no escape: F3 
                    db       $06                          ; $0122: normal track data, wait 2 
                    db       $5F                          ; $0123: full optimization, no escape: A#3 
                    db       $06                          ; $0124: normal track data, wait 2 
                    db       $5D                          ; $0125: full optimization, no escape: A3 
                    db       $04                          ; $0126: normal track data, wait 1 
                    db       $42                          ; $0127: normal track data, note: C0 
                    db       $07                          ; $0128: vol = $C (inverted), no pitch, no note, no instrument 
                    db       $00                          ; $0129: track end signature found 
trackDef2MStormMusic: 
                    db       $AC                          ; $012A: normal track data 
                    db       $E1                          ; $012B: vol = $F (inverted), no pitch, no note, no instrument 
                    dw       $0000                        ; $012C: pitch 
                    db       $03                          ; $012E: instrument 
                    db       $06                          ; $012F: normal track data, wait 2 
                    db       $6F                          ; $0130: full optimization, no escape: F#4 
                    db       $06                          ; $0131: normal track data, wait 2 
                    db       $6D                          ; $0132: full optimization, no escape: F4 
                    db       $06                          ; $0133: normal track data, wait 2 
                    db       $6F                          ; $0134: full optimization, no escape: F#4 
                    db       $16                          ; $0135: normal track data, wait 10 
                    db       $6D                          ; $0136: full optimization, no escape: F4 
                    db       $06                          ; $0137: normal track data, wait 2 
                    db       $6F                          ; $0138: full optimization, no escape: F#4 
                    db       $06                          ; $0139: normal track data, wait 2 
                    db       $6D                          ; $013A: full optimization, no escape: F4 
                    db       $06                          ; $013B: normal track data, wait 2 
                    db       $77                          ; $013C: full optimization, no escape: A#4 
                    db       $06                          ; $013D: normal track data, wait 2 
                    db       $75                          ; $013E: full optimization, no escape: A4 
                    db       $00                          ; $013F: track end signature found 
