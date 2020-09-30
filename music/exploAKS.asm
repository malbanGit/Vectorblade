; This file was build using VIDE - Vectrex Integrated Development Environment
; Original bin file was: /Users/chrissalo/NetBeansProjects/Vide/_projects/Vectorblade/Music/explo.bin
; 
; offset for AKS file assumed: $0000 guessed by accessing byte data[13] * 256)
; not used by vectrex player and therefor omitted:
;  DB "AT10" ; Signature of Arkos Tracker files
;  DB $01 ; sample channel
;  DB $40, 42, 0f ; YM custom frequence - little endian
;  DB $02 ; Replay frequency (0=13hz,1=25hz,2=50hz,3=100hz,4=150hz,5=300hz)
SongAddress: 
                    db       $06                          ; $0009: default speed 
                    dw       $0032                        ; $000A: size of instrument table (without this word pointer) 
                    dw       instrument0                  ; $000C: [$0010] pointer to instrument 0 
                    dw       instrument1                  ; $000E: [$0019] pointer to instrument 1 
instrument0: 
                    db       $00                          ; $0010: speed 
                    db       $00                          ; $0011: retrig 
instrument0loop: 
                    db       $00                          ; $0012: dataColumn_0 (non hard), vol=$0 
                    db       $00                          ; $0013: dataColumn_0 (non hard), vol=$0 
                    db       $00                          ; $0014: dataColumn_0 (non hard), vol=$0 
                    db       $00                          ; $0015: dataColumn_0 (non hard), vol=$0 
                    db       $0D                          ; $0016: dataColumn_0 (hard) 
                    dw       instrument0loop              ; $0017: [$0012] loop 
instrument1: 
                    db       $01                          ; $0019: speed 
                    db       $00                          ; $001A: retrig 
                    db       $7E                          ; $001B: dataColumn_0 (non hard), vol=$F 
                    db       $3F                          ; $001C: dataColumn_1, noise=$1F 
                    db       $12                          ; $001D: arpegio 
                    db       $76                          ; $001E: dataColumn_0 (non hard), vol=$D 
                    db       $2C                          ; $001F: dataColumn_1, noise=$0C 
                    db       $10                          ; $0020: arpegio 
                    db       $7C                          ; $0021: dataColumn_0 (non hard), vol=$F 
                    db       $0E                          ; $0022: arpegio 
                    db       $6A                          ; $0023: dataColumn_0 (non hard), vol=$A 
                    db       $39                          ; $0024: dataColumn_1, noise=$19 
                    db       $0C                          ; $0025: arpegio 
                    db       $7C                          ; $0026: dataColumn_0 (non hard), vol=$F 
                    db       $0A                          ; $0027: arpegio 
                    db       $74                          ; $0028: dataColumn_0 (non hard), vol=$D 
                    db       $08                          ; $0029: arpegio 
                    db       $62                          ; $002A: dataColumn_0 (non hard), vol=$8 
                    db       $3F                          ; $002B: dataColumn_1, noise=$1F 
                    db       $07                          ; $002C: arpegio 
                    db       $7C                          ; $002D: dataColumn_0 (non hard), vol=$F 
                    db       $06                          ; $002E: arpegio 
                    db       $78                          ; $002F: dataColumn_0 (non hard), vol=$E 
                    db       $05                          ; $0030: arpegio 
                    db       $70                          ; $0031: dataColumn_0 (non hard), vol=$C 
                    db       $04                          ; $0032: arpegio 
                    db       $68                          ; $0033: dataColumn_0 (non hard), vol=$A 
                    db       $03                          ; $0034: arpegio 
                    db       $6C                          ; $0035: dataColumn_0 (non hard), vol=$B 
                    db       $02                          ; $0036: arpegio 
                    db       $68                          ; $0037: dataColumn_0 (non hard), vol=$A 
                    db       $01                          ; $0038: arpegio 
                    db       $20                          ; $0039: dataColumn_0 (non hard), vol=$8 
                    db       $14                          ; $003A: dataColumn_0 (non hard), vol=$5 
                    db       $0D                          ; $003B: dataColumn_0 (hard) 
                    dw       instrument0loop              ; $003C: [$0012] loop 
; start of linker definition
linker: 
                    db       $08                          ; $003E: first height 
                    db       $00                          ; $003F: transposition1 
                    db       $00                          ; $0040: transposition2 
                    db       $00                          ; $0041: transposition3 
                    dw       specialtrackDef0             ; $0042: [$004E] specialTrack 
pattern0Definition: 
                    db       $00                          ; $0044: pattern 0 state 
                    dw       trackDef0                    ; $0045: [$004F] pattern 0, track 1 
                    dw       trackDef1                    ; $0047: [$0055] pattern 0, track 2 
                    dw       trackDef2                    ; $0049: [$005A] pattern 0, track 3 
pattern1Definition: 
                    db       $01                          ; $004B: pattern 1 state 
                    dw       pattern0Definition           ; $004C: [$0044] song restart address 
specialtrackDef0: 
                    db       $00                          ; $004E: wait 128 
trackDef0: 
                    db       $68                          ; $004F: normal track data 
                    db       $E0                          ; $0050: vol off, pitch, note, instrument 
                    dw       $0000                        ; $0051: pitch 
                    db       $01                          ; $0053: instrument 
                    db       $00                          ; $0054: track end signature found 
trackDef1: 
                    db       $42                          ; $0055: normal track data 
                    db       $80                          ; $0056: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $0057: pitch 
                    db       $00                          ; $0059: track end signature found 
trackDef2: 
                    db       $42                          ; $005A: normal track data 
                    db       $80                          ; $005B: vol off, pitch, no note, no instrument 
                    dw       $0000                        ; $005C: pitch 
                    db       $00                          ; $005E: track end signature found 
