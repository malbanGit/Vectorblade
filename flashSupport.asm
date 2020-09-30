; bank 0
;
;
; all flash operations (write, erase, test - must be done, and the RAM buffer to copy the rotuines must be available!)
; RAM buffer at "flashUserRAM" (title RAM definition)
;
;
; **************************************************************************
; read flash options to RAM
; fill current/next block values
; expects bank 0 active
; in "currentFlashROMStart" current relevant block address
; returns currentFlashROMStart = 0 if error occured
; needs flash "RAM" block
;
; on error Z = 1
; **************************************************************************
 if  VECFEVER = 1 
initFlash                                                 ;#isfunction  
                    rts      

;.
checkFlash 
                    clr      flashAvailable 
                    bsr      readOptionsOnly              ; and highscore 
REPLACE_1_2_buildShadowramFever_varFromIRQ1_32 
                    ldx      #0                           ;buildShadowramFever 
                    jsr      jsrBank1_fromBank0_T1 
                    lda      flashAvailable 
                    ora      #FLASH_AVAILABLE_BIT 
                    sta      flashAvailable 
REPLACE_1_2_checkForSavedGameFever_varFromIRQ1_1 
                    ldx      #0                           ;checkForSavedGameFever 
                    jsr      jsrBank1_fromBank0_T1 
                    bra      readHighscore 

;.
;.......................................................................
;.
;
; copies options to RAM
; uses current block
; no flash check, since default options are available
; **************************************************************************
readOptionsOnly                                           ;#isfunction  
REPLACE_1_2_optionsToVectrexRAM_varFromIRQ1_1 
                    ldx      #0                           ;optionsToVectrexRAM 
                    jmp      jsrBank1_fromBank0_T1 

;.
;.......................................................................
;.
; reads highscore to RAM, highscore RAM must be available
; uses current block
; no flash check, since default HS are available
; **************************************************************************
readHighscore 
REPLACE_1_2_highscoreToVectrexRAM_varFromIRQ1_1 
                    ldx      #0                           ;highscoreToVectrexRAM 
                    jmp      jsrBank1_fromBank0_T1 

saveBlockOnChange 
; fill shadow with "defaults"
REPLACE_1_2_buildShadowramFever_varFromIRQ1_1 
                    ldx      #0                           ;buildShadowramFever 
                    jsr      jsrBank1_fromBank0_T1 
REPLACE_1_2_copyOptionsToShadowram_varFromIRQ1_1 
                    ldx      #0                           ;copyOptionsToShadowram 
                    jsr      jsrBank1_fromBank0_T1 
REPLACE_1_2_copyHighScoreToShadowram_varFromIRQ1_1 
                    ldx      #0                           ;copyHighScoreToShadowram 
                    jsr      jsrBank1_fromBank0_T1 
REPLACE_1_2_romifyShadowRamFever_varFromIRQ1_1 
                    ldx      #0                           ;romifyShadowRamFever 
                    jmp      jsrBank1_fromBank0_T1 

 else                                                     ; if VECFEVER = 1 
initFlash                                                 ;#isfunction  
                    clr      flashAvailable 
                    jsr      checkFlash 
                    lda      flashAvailable 
                    anda     #FLASH_AVAILABLE_BIT 
                    beq      flashErrorOut 
                    ldx      #flashRAMROM 
checkNextBlock 
                    ldd      FlashBlock,x 
                    cmpd     #$ffff                       ; empty flash space 
                    beq      flashBlockFound 
                    leax     FlashBlock,x 
                    cmpx     #$c000 
                    blo      checkNextBlock 
                    ldx      #0 
                    bra      flashErrorOut 

; in x the address of the current relevant flash block
flashBlockFound 
                    stx      currentFlashROMStart 
                    bsr      readOptionsOnly 
                    bsr      readHighscore 
                                                          ; ensure Z != 1 
                    lda      #1 
flashErrorOut 
                    rts      

;.
;.......................................................................
;.
;
; copies options to RAM
; uses current block
; no flash check, since default options are available
; **************************************************************************
readOptionsOnly                                           ;#isfunction  
; copy options data
                    ldu      #Ram_Options_Start 
                    ldx      currentFlashROMStart 
copyOptionsLoop 
                    lda      ,x+ 
                    sta      ,u+ 
                    cmpu     #Ram_Options_End 
                    blo      copyOptionsLoop 
                    lda      additionalFlags 
                    anda     #%00001111 
                    sta      additionalFlags 
                    rts      

;.
;.......................................................................
;.
; reads highscore to RAM, highscore RAM must be available
; uses current block
; no flash check, since default HS are available
; **************************************************************************
readHighscore 
                    ldu      #Ram_HighScore_Start 
                    ldx      currentFlashROMStart 
                    leax     OptionStruct,x 
                    ldb      #HighScoreEntry*4 *2 
; lda difficulty
; bpl normalHSLoad
;                    leax     HighScoreEntry*4,x ; load Hardcore highscore
;normalHSLoad
copyHSLoop 
                    lda      ,x+ 
                    sta      ,u+ 
                    decb     
                    bne      copyHSLoop 
                    rts      

;.
;.......................................................................
; clears complete sector (from $b000)
; nothing else
; needs flash "RAM" block
;
; Sector-Erase Operation
; The Sector-Erase operation allows the system to erase the device on a sector-by-sector basis. The
; sector architecture is based on uniform sector size of 4 KByte. The Sector-Erase operation is initiated
; by executing a six-byte command load sequence for Software Data Protection with Sector-Erase command
; (30H) and sector address (SA) in the last bus cycle. The sector address is latched on the falling
; edge of the sixth WE# pulse, while the command (30H) is latched on the rising edge of the sixth WE#
; pulse. The internal Erase operation begins after the sixth WE# pulse. The End-of-Erase can be determined
; using either Data# Polling or Toggle Bit methods. See Figure 10 for timing waveforms. Any commands
; written during the Sector-Erase operation will be ignored.
;.
; **************************************************************************
eraseSector                                               ;#isfunction  
                    lda      flashAvailable 
                    anda     #FLASH_AVAILABLE_BIT 
                    beq      flashErrorOutR1 
                    bsr      eraseSector_2RAM 
                    jmp      flashUserRAM 

;.
eraseSector_2RAM 
                    ldx      #eraseSector_Start 
                    ldu      #flashUserRAM 
eraseSector_copyNextWord 
                    ldd      ,x++ 
                    std      ,u++ 
                    cmpx     #eraseSector_End 
                    blo      eraseSector_copyNextWord 
                    rts      

;.
eraseSector_Start 
; data 1,
                    lda      #$aa 
; address 1
                    sta      $5555 
; data 2
                    lda      #$55 
; address 2
                    sta      $2aaa 
; data 3
                    lda      #$80 
; address 3
                    sta      $5555 
; data 4
                    lda      #$aa 
; address 4
                    sta      $5555 
; data 5
                    lda      #$55 
; address 5
                    sta      $2aaa 
; data 6
                    lda      #$30 
; address 6
                    sta      $b000                        ; earse sector beginning at $b000 
eraseToggleWait 
                    ldb      $0000                        ; load from even address 
                    eorb     $0000                        ; load again even and eor 
                    bitb     #%01000000                   ; if not equal go on waiting 
                    bne      eraseToggleWait 
flashErrorOutR1 
                    rts      

eraseSector_End 
;.
;.......................................................................
;.
; finds and sets new flash block
; if last flash block was used, than flash sector is
; erased and flash blocks start anew from $b000
;.
; Assumed: currentFlashROMStart was initialized to current block
;.
; **************************************************************************
findNextFlashBlock                                        ;#isfunction  
                    ldx      currentFlashROMStart 
                    leax     FlashBlock,x                 ; load next memory address of flashblock 
                    cmpx     #$c000 - FlashBlock          ; check if next address has enough space left 
                    blo      blockAddressOk 
; format flash
                    bsr      eraseSector 
                    ldx      #$b000 
blockAddressOk 
                    stx      currentFlashROMStart 
; in x now correct adress block of flash that can be written to
                    rts      

;.
;.......................................................................
;.
; saves options and highscores to next block
; Highscores AND options are always taken from RAM
; sets/corrects current next block
;.
; needs flash "RAM" block
;.
; **************************************************************************
saveCurrentBlock                                          ;#isfunction  
                    lda      flashAvailable 
                    anda     #FLASH_AVAILABLE_BIT 
                    lbeq     flashErrorOut 
                    jsr      writeFlashByte_2RAM 
                    bsr      findNextFlashBlock           ; also loads to X 
                    lbeq     flashErrorOut 
; first write options
                    ldu      #Ram_Options_Start 
writeNextOptionByte 
                    lda      ,u+ 
                    jsr      flashUserRAM 
                    leax     1,x 
                    cmpu     #Ram_Options_End 
                    blo      writeNextOptionByte 
; second write Highscore
                    ldu      #Ram_HighScore_Start 
writeNextHSByte 
                    lda      ,u+ 
                    jsr      flashUserRAM 
                    leax     1,x 
                    cmpu     #Ram_HardcoreScore_End 
                    blo      writeNextHSByte 
                    rts      

;.
;.......................................................................
;.
; compares highscore RAM/ROM
; and options RAM/ROM
; if different -> saves to flash
;.
; needs flash "RAM" block
; **************************************************************************
saveBlockOnChange                                         ;#isfunction  
                    lda      flashAvailable 
                    anda     #FLASH_AVAILABLE_BIT 
                    lbeq     flashErrorOut 
                    ldu      #Ram_Options_Start 
                    ldx      currentFlashROMStart 
compareOptionsNextByte 
                    lda      ,u+ 
                    cmpa     ,x+ 
                    bne      saveCurrentBlock 
                    cmpu     #Ram_Options_End 
                    bne      compareOptionsNextByte 
                    ldu      #Ram_HighScore_Start 
compareHSNextByte 
                    lda      ,u+ 
                    cmpa     ,x+ 
                    bne      saveCurrentBlock 
                    cmpu     #Ram_HardcoreScore_End 
                    bne      compareHSNextByte 
                    rts      

;.
;.......................................................................
;.
; check flash ID byte
; z flag set if ok
; z flag not set, than flash id wrong
;.
; needs flash "RAM" block
; **************************************************************************
checkFlash                                                ;#isfunction  
                    jsr      checkForSavedGameFlash 
                    bsr      checkFlash_2RAM 
                    jmp      flashUserRAM 

;.
checkFlash_2RAM 
                    ldx      #checkFlash_Start 
                    ldu      #flashUserRAM 
checkFlash_copyNextWord 
                    ldd      ,x++ 
                    std      ,u++ 
                    cmpx     #checkFlash_End 
                    blo      checkFlash_copyNextWord 
                    rts      

;.
checkFlash_Start 
; data 1,
                    lda      #$aa 
; address 1
                    sta      $5555 
; data 2
                    lda      #$55 
; address 2
                    sta      $2aaa 
; data 3
                    lda      #$90                         ; id 
; address 3
                    sta      $5555 
                    ldx      $0 
                    lda      #$f0 
                    sta      $0 
                    cmpx     #$bfb5                       ; for SST39SF010 
                    beq      flashOk_out 
                    cmpx     #$bfb6                       ; for SST39SF020 
                    beq      flashOk_out 
flashNotOk_out 
                    lda      flashAvailable 
                    anda     #$ff-FLASH_AVAILABLE_BIT 
                    sta      flashAvailable 
                    rts      

flashOk_out 
                    lda      flashAvailable 
                    ora      #FLASH_AVAILABLE_BIT 
                    sta      flashAvailable 
                    rts      

checkFlash_End 
;.
;.......................................................................
;.
; writes one byte to flash memory
; exepcts flash to be properly formated/erased (all bit = 1)
;
; output address = x
; output byte in A
;
; destroys B
;
; needs flash "RAM" block
; **************************************************************************
writeFlashByte_2RAM 
                    ldx      #writeFlashByte_Start 
                    ldu      #flashUserRAM 
writeFlashByte_copyNextWord 
                    ldd      ,x++ 
                    std      ,u++ 
                    cmpx     #writeFlashByte_End 
                    blo      writeFlashByte_copyNextWord 
                    rts      

;.
writeFlashByte_Start 
                    ldb      #$aa 
                    stb      $5555 
                    ldb      #$55 
                    stb      $2aaa 
                    ldb      #$a0 
                    stb      $5555 
                    sta      0, x 
                                                          ; wait for write to be done 
writeByteToggleLoop 
                    ldb      0, x 
                    eorb     0, x 
                    andb     #%01000000 
                    bne      writeByteToggleLoop 
                    rts      

writeFlashByte_End 
;.
;.......................................................................
;.
;. 46 byte!
eraseSector_Startra000 
; data 1,
                    lda      #$aa 
; address 1
                    sta      $5555 
; data 2
                    lda      #$55 
; address 2
                    sta      $2aaa 
; data 3
                    lda      #$80 
; address 3
                    sta      $5555 
; data 4
                    lda      #$aa 
; address 4
                    sta      $5555 
; data 5
                    lda      #$55 
; address 5
                    sta      $2aaa 
; data 6
                    lda      #$30 
; address 6
                    sta      $a000                        ; earse sector beginning at $a000 
eraseToggleWaitra000 
                    ldb      $0000                        ; load from even address 
                    eorb     $0000                        ; load again even and eor 
                    bitb     #%01000000                   ; if not equal go on waiting 
                    bne      eraseToggleWaitra000 
flashErrorOutra000 
                    rts      

eraseSector_Endra000 
;.
;.......................................................................
; clears complete sector (from $a000)
; nothing else
; needs flash "RAM" block
;
; Sector-Erase Operation
; The Sector-Erase operation allows the system to erase the device on a sector-by-sector basis. The
; sector architecture is based on uniform sector size of 4 KByte. The Sector-Erase operation is initiated
; by executing a six-byte command load sequence for Software Data Protection with Sector-Erase command
; (30H) and sector address (SA) in the last bus cycle. The sector address is latched on the falling
; edge of the sixth WE# pulse, while the command (30H) is latched on the rising edge of the sixth WE#
; pulse. The internal Erase operation begins after the sixth WE# pulse. The End-of-Erase can be determined
; using either Data# Polling or Toggle Bit methods. See Figure 10 for timing waveforms. Any commands
; written during the Sector-Erase operation will be ignored.
;.
; **************************************************************************
eraseSectora000                                           ;#isfunction  
                    lda      flashAvailable 
                    anda     #FLASH_AVAILABLE_BIT 
                    lbeq     flashErrorOutR1 
                    bsr      eraseSector_2RAMra000 
                    jmp      bank0flashUserRAM            ; THIS MUST BE AVAILABLE! 

;.
eraseSector_2RAMra000 
                    ldx      #eraseSector_Startra000 
                    ldu      #bank0flashUserRAM 
eraseSector_copyNextWordra000 
                    ldd      ,x++ 
                    std      ,u++ 
                    cmpx     #eraseSector_Endra000 
                    blo      eraseSector_copyNextWordra000 
                    rts      

;.
;.......................................................................
;.
; writes one byte to flash memory
; exepcts flash to be properly formated/erased (all bit = 1)
;
; output address = x
; output byte in A
;
; destroys B
;
; needs flash "RAM" block
; **************************************************************************
writeFlashByte_2RAMA000 
                    ldx      #writeFlashByte_Start 
                    ldu      #bank0flashUserRAM 
writeFlashByte_copyNextWordA000 
                    ldd      ,x++ 
                    std      ,u++ 
                    cmpx     #writeFlashByte_End 
                    blo      writeFlashByte_copyNextWordA000 
                    rts      

 endif                                                    ; if VECFEVER = 1 
