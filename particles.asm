;BANK 0
INIT_OBJECTLIST     macro    count, size, endJump 
                    clr      pCount 
                    ldd      #endJump                     ; explosions jump back to here after all have been rendered 
                    std      PARTICLES_DONE_A 
; setup objects
                    lda      #count 
                    ldu      #pobject_list 
                    stu      plist_empty_head 
                    ldy      #PARTICLES_DONE 
next_list_exentry_1\? 
                    leax     size,u 
                    stx      NEXT_OBJECT,u 
                    leau     ,x 
                    deca     
                    bne      next_list_exentry_1\? 
                    leau     -size,u 
                    sty      NEXT_OBJECT,u 
                    sty      plist_objects_head 
                    endm     
PARTICLE1_MAX_COUNT  =       57                           ;8 ; max with below RAM 
; Structures
                    struct   Emitter 
                    ds       EMITTER_DATA, 2 
                    ds       BEHAVIOUR, 2 
                    ds       NEXT_OBJECT, 2 
                    end struct 
                    struct   EmitterData 
                    ds       YPOS,1 
                    ds       XPOS,1 
                    ds       ECOUNTER_RESET, 1 
                    ds       EDATA, 1 
                    ds       ECOUNTER, 1 
                    ds       EANGLE_INC, 1 
                    end struct 
                    struct   Particle 
                    ds       P_SCALE, 1 
                    ds       PA_ANGLE, 1 
                    ds       BEHAVIOUR, 2 
                    ds       NEXT_OBJECT, 2 
                    end struct 
; RAM
initParticle1 
                    INIT_OBJECTLIST  PARTICLE1_MAX_COUNT, Particle, objectsFinished1_pa 
EMITT_ANGLE_ADD     =        4 
EMITT_DELAY         =        0 
;
                    ldx      #emitterData1 
                    ldd      #0                           ; position of emitter 
                    std      YPOS,x 
                    ldd      #EMITT_DELAY*256+0           ; delay 1, start angle 0 
                    std      ECOUNTER_RESET,x 
                    ldd      #0*256+EMITT_ANGLE_ADD       ; start countdown = 0, angle inc = 3 
                    std      ECOUNTER,x 
                    jsr      buildStationaryEmitter 
;
                    ldx      #emitterData2 
                    ldd      #0                           ; position of emitter 
                    std      YPOS,x 
                    ldd      #EMITT_DELAY*256+(255/3)     ; delay 1, start angle 0 
                    std      ECOUNTER_RESET,x 
                    ldd      #1*256+EMITT_ANGLE_ADD       ; start countdown = 0, angle inc = 3 
                    std      ECOUNTER,x 
                    jsr      buildStationaryEmitter 
;
                    ldx      #emitterData3 
                    ldd      #0                           ; position of emitter 
                    std      YPOS,x 
                    ldd      #EMITT_DELAY*256+0+((255/3)*2) ; delay 1, start angle 0 
                    std      ECOUNTER_RESET,x 
                    ldd      #2*256+EMITT_ANGLE_ADD       ; start countdown = 0, angle inc = 3 
                    std      ECOUNTER,x 
                    jsr      buildStationaryEmitter 
                    clr      anglechangeCountDown 
                    ldd      #angleAddData 
                    std      angleChangePointer 
                    rts      

;***************************************************************************
playParticle1 
                    dec      anglechangeCountDown 
                    bpl      noAngleChange 
                    lda      #5 
                    sta      anglechangeCountDown 
                    ldu      angleChangePointer 
                    leau     1,u 
                    cmpu     #angleAddDataEnd 
                    bne      noAngleReset 
                    ldu      #angleAddData 
noAngleReset 
                    stu      angleChangePointer 
                    lda      ,u 
                    sta      emitterData1+EANGLE_INC 
                    sta      emitterData2+EANGLE_INC 
                    sta      emitterData3+EANGLE_INC 
noAngleChange 
; pointer to circle data - is a constant!
                    ldy      #circleData 
                    ldu      plist_objects_head 
                    pulu     d,pc                         ; (D = y,x) ; do all objects 
objectsFinished1_pa 
                    rts      

;***************************************************************************
angleAddData 
                    db       1,2,3,4,5,6,6,6,6,6,6,6,6,6,6,6,5,4,3,2,1,-1,-2,-3,-4,-5,-6,-6,-6,-6,-6,-6,-6,-6,-6,-6,-6,-5,-4,-3,-2,-1 
                    db       1,2,3,4,5,6,7,8,9,10,10,10,10,10,10,10,10,10,10,10,11,12,13,14,14,14,14,14,14,14,14,14,14,15,15,15,15,15,15,15,15,15,15,15,15,15 
angleAddDataEnd 
;***************************************************************************
;...........................................................................
buildStationaryEmitter 
                    bsr      newObject 
                    cmpu     #PLIST_COMPARE_ADDRESS 
                    bls      noNewEmitter 
                    stx      EMITTER_DATA,u 
                    ldd      #stationaryEmitterBehaviour 
                    std      BEHAVIOUR, u 
noNewEmitter 
                    rts      

;...........................................................................
stationaryEmitterBehaviour 
                    ldx      EMITTER_DATA+u_offset1,u 
                    lda      EDATA,x 
                    adda     EANGLE_INC,x 
                    sta      EDATA,x 
                    dec      ECOUNTER,x 
                    bpl      noNewParticle 
                    pshs     u 
                    lda      ECOUNTER_RESET,x 
                    sta      ECOUNTER,x 
                    bsr      newObject 
                    cmpu     #PLIST_COMPARE_ADDRESS 
                    bls      noNewParticle2 
                    lda      #1                           ; start scale 
                    ldb      EDATA,x                      ; position / angle 
                    std      P_SCALE,u 
                    ldd      #scaledAngleParticleBehaviour 
                    std      BEHAVIOUR, u 
noNewParticle2 
                    puls     u 
noNewParticle 
                    ldu      NEXT_OBJECT+u_offset1,u      ; preload next user stack 
                    pulu     d,pc 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; new list object to U
; destroys d, u 
newObject                                                 ;#isfunction  
                    ldu      plist_empty_head 
                    cmpu     #PLIST_COMPARE_ADDRESS 
                    bls      cs_done_no 
                                                          ; set the new empty head 
                    ldd      NEXT_OBJECT,u                ; the next in out empty list will be the new 
                    std      plist_empty_head             ; head of our empty list 
                                                          ; load last of current object list 
; the old head is always our next
                    ldd      plist_objects_head 
                    std      NEXT_OBJECT,u 
; newobject is always head
                    stu      plist_objects_head 
                    inc      pCount                       ; and remember that we created a new object 
cs_done_no 
                    rts      

;...........................................................................
scaledAngleParticleBehaviour 
; position to 
;                    lda      #23 
;                    sta      <VIA_t1_cnt_lo 
                    ldd      #$7000 
;                    ldd      #$7f00 
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    ldd      P_SCALE+u_offset1,u 
                    sta      <VIA_t1_cnt_lo 
                    clra     
                    MY_LSL_D  
                    leay     d,y 
                    MY_MOVE_TO_A_END  
                    ldd      ,y 
                    MY_MOVE_TO_D_START_NO_SHIFT  
                    ldy      #circleData 
                    lda      P_SCALE+u_offset1,u 
                    adda     #2 
                    cmpa     #$23 
                    bhi      destroyPObject 
                    sta      P_SCALE+u_offset1,u 
                    ldu      NEXT_OBJECT+u_offset1,u      ; preload next user stack 
                    LDB      Vec_Dot_Dwell                ;Get dot dwell (brightness) 
                    DECB                                  ;Delay leaving beam in place 
;                    MY_MOVE_TO_A_END  
                    ldd      #$eecc                       ; light ON, ZERO OFF 
                    sta      <VIA_cntl                    ; [4] ZERO disabled, and BLANK disabled 
                    WAIT4    
                    lda      #$ec                         ; ZERO ON, blank of 
                    sta      <VIA_cntl                    ; 
                    lda      #23 
                    sta      <VIA_t1_cnt_lo 
                    stb      <VIA_cntl                    ; [4] ZERO disabled, and BLANK disabled 
                    pulu     d,pc 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; this macro is placed at the end of each possible "remove" exit
; it stores the just removed object at the head of the "empty" list and 
; sets up its "next" pointer
UPDATE_EMPTY_LIST   macro    
                    dec      pCount 
                    ldy      plist_empty_head             ; set u free, as new free head 
                    sty      NEXT_OBJECT,x                ; load to u the next linked list element 
                    stx      plist_empty_head 
                    endm     
;
destroyPObject                                            ;#isfunction  
; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; in ds+u_offset1 pointer to the object that must be removed
; destroys x, y 
; puls from ds the next object behaviour
; 
; this version is called at the end of an explosion called by "behaviours"
;
                    leax     u_offset1,u                  ; x -> pointer object struture (correction of offset) 
                    cmpx     plist_objects_head           ; is it the first? 
                    bne      was_not_first_enem           ; no -> jump 
was_first_enem 
                    ldu      NEXT_OBJECT,x                ; s pointer to next objext 
                    stu      plist_objects_head           ; the next object will be the first 
                    bra      pRemoveDone 

was_not_first_enem                                        ;        find previous, go thru all objects from first and look where "I" am the next... 
                    ldy      plist_objects_head           ; start at list head 
try_next_enem 
                    cmpx     NEXT_OBJECT,y                ; am I the next object of the current investigated list element 
                    beq      found_next_switch_enem       ; jup -> jump 
                    ldy      NEXT_OBJECT,y                ; otherwise load the next as new current 
                    bra      try_next_enem                ; and search further 

found_next_switch_enem 
                    ldu      NEXT_OBJECT,x                ; we load "our" next object to s 
                    stu      NEXT_OBJECT,y                ; and store our next in the place of our previous next and thus eleminate ourselfs 
                    UPDATE_EMPTY_LIST                     ; and clean up the empties 
pRemoveDone 
; do a clean ending - which is usually done at the end of "SmartDraw"
                    lda      #$7f 
                    STa      <VIA_t1_cnt_lo 
                    _ZERO_VECTOR_BEAM  
                    MY_MOVE_TO_A_END  
                    pulu     d,pc                         ; (D = y,x, X = vectorlist) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; circle generated 0-360 in 255 steps (cos, -sin), radius: 127
DIVIDER_P           =        1 
circleData 
                    db       $7F/DIVIDER_P, $00 /DIVIDER_P ; degrees: 0 
                    db       $7E/DIVIDER_P, $FD /DIVIDER_P ; degrees: 1 
                    db       $7E/DIVIDER_P, $FA /DIVIDER_P ; degrees: 2 
                    db       $7E/DIVIDER_P, $F7 /DIVIDER_P ; degrees: 4 
                    db       $7E/DIVIDER_P, $F4 /DIVIDER_P ; degrees: 5 
                    db       $7E/DIVIDER_P, $F1 /DIVIDER_P ; degrees: 7 
                    db       $7D/DIVIDER_P, $EE /DIVIDER_P ; degrees: 8 
                    db       $7D/DIVIDER_P, $EB /DIVIDER_P ; degrees: 9 
                    db       $7C/DIVIDER_P, $E8 /DIVIDER_P ; degrees: 11 
                    db       $7B/DIVIDER_P, $E5 /DIVIDER_P ; degrees: 12 
                    db       $7B/DIVIDER_P, $E2 /DIVIDER_P ; degrees: 14 
                    db       $7A/DIVIDER_P, $DE /DIVIDER_P ; degrees: 15 
                    db       $79/DIVIDER_P, $DB /DIVIDER_P ; degrees: 16 
                    db       $78/DIVIDER_P, $D9 /DIVIDER_P ; degrees: 18 
                    db       $77/DIVIDER_P, $D6 /DIVIDER_P ; degrees: 19 
                    db       $76/DIVIDER_P, $D3 /DIVIDER_P ; degrees: 21 
                    db       $75/DIVIDER_P, $D0 /DIVIDER_P ; degrees: 22 
                    db       $74/DIVIDER_P, $CD /DIVIDER_P ; degrees: 23 
                    db       $72/DIVIDER_P, $CA /DIVIDER_P ; degrees: 25 
                    db       $71/DIVIDER_P, $C7 /DIVIDER_P ; degrees: 26 
                    db       $6F/DIVIDER_P, $C4 /DIVIDER_P ; degrees: 28 
                    db       $6E/DIVIDER_P, $C2 /DIVIDER_P ; degrees: 29 
                    db       $6C/DIVIDER_P, $BF /DIVIDER_P ; degrees: 31 
                    db       $6B/DIVIDER_P, $BC /DIVIDER_P ; degrees: 32 
                    db       $69/DIVIDER_P, $BA /DIVIDER_P ; degrees: 33 
                    db       $67/DIVIDER_P, $B7 /DIVIDER_P ; degrees: 35 
                    db       $65/DIVIDER_P, $B5 /DIVIDER_P ; degrees: 36 
                    db       $63/DIVIDER_P, $B2 /DIVIDER_P ; degrees: 38 
                    db       $61/DIVIDER_P, $B0 /DIVIDER_P ; degrees: 39 
                    db       $5F/DIVIDER_P, $AD /DIVIDER_P ; degrees: 40 
                    db       $5D/DIVIDER_P, $AB /DIVIDER_P ; degrees: 42 
                    db       $5B/DIVIDER_P, $A9 /DIVIDER_P ; degrees: 43 
                    db       $59/DIVIDER_P, $A6 /DIVIDER_P ; degrees: 45 
                    db       $57/DIVIDER_P, $A4 /DIVIDER_P ; degrees: 46 
                    db       $54/DIVIDER_P, $A2 /DIVIDER_P ; degrees: 48 
                    db       $52/DIVIDER_P, $A0 /DIVIDER_P ; degrees: 49 
                    db       $50/DIVIDER_P, $9E /DIVIDER_P ; degrees: 50 
                    db       $4D/DIVIDER_P, $9C /DIVIDER_P ; degrees: 52 
                    db       $4B/DIVIDER_P, $9A /DIVIDER_P ; degrees: 53 
                    db       $48/DIVIDER_P, $98 /DIVIDER_P ; degrees: 55 
                    db       $46/DIVIDER_P, $97 /DIVIDER_P ; degrees: 56 
                    db       $43/DIVIDER_P, $95 /DIVIDER_P ; degrees: 57 
                    db       $40/DIVIDER_P, $93 /DIVIDER_P ; degrees: 59 
                    db       $3E/DIVIDER_P, $92 /DIVIDER_P ; degrees: 60 
                    db       $3B/DIVIDER_P, $90 /DIVIDER_P ; degrees: 62 
                    db       $38/DIVIDER_P, $8F /DIVIDER_P ; degrees: 63 
                    db       $35/DIVIDER_P, $8D /DIVIDER_P ; degrees: 64 
                    db       $32/DIVIDER_P, $8C /DIVIDER_P ; degrees: 66 
                    db       $30/DIVIDER_P, $8B /DIVIDER_P ; degrees: 67 
                    db       $2D/DIVIDER_P, $8A /DIVIDER_P ; degrees: 69 
                    db       $2A/DIVIDER_P, $89 /DIVIDER_P ; degrees: 70 
                    db       $27/DIVIDER_P, $88 /DIVIDER_P ; degrees: 72 
                    db       $24/DIVIDER_P, $87 /DIVIDER_P ; degrees: 73 
                    db       $21/DIVIDER_P, $86 /DIVIDER_P ; degrees: 74 
                    db       $1E/DIVIDER_P, $85 /DIVIDER_P ; degrees: 76 
                    db       $1B/DIVIDER_P, $84 /DIVIDER_P ; degrees: 77 
                    db       $18/DIVIDER_P, $84 /DIVIDER_P ; degrees: 79 
                    db       $15/DIVIDER_P, $83 /DIVIDER_P ; degrees: 80 
                    db       $11/DIVIDER_P, $83 /DIVIDER_P ; degrees: 81 
                    db       $0E/DIVIDER_P, $82 /DIVIDER_P ; degrees: 83 
                    db       $0B/DIVIDER_P, $82 /DIVIDER_P ; degrees: 84 
                    db       $08/DIVIDER_P, $82 /DIVIDER_P ; degrees: 86 
                    db       $05/DIVIDER_P, $82 /DIVIDER_P ; degrees: 87 
                    db       $02/DIVIDER_P, $82 /DIVIDER_P ; degrees: 88 
                    db       $00/DIVIDER_P, $82 /DIVIDER_P ; degrees: 90 
                    db       $FD/DIVIDER_P, $82 /DIVIDER_P ; degrees: 91 
                    db       $F9/DIVIDER_P, $82 /DIVIDER_P ; degrees: 93 
                    db       $F6/DIVIDER_P, $82 /DIVIDER_P ; degrees: 94 
                    db       $F3/DIVIDER_P, $82 /DIVIDER_P ; degrees: 95 
                    db       $F0/DIVIDER_P, $83 /DIVIDER_P ; degrees: 97 
                    db       $ED/DIVIDER_P, $83 /DIVIDER_P ; degrees: 98 
                    db       $EA/DIVIDER_P, $84 /DIVIDER_P ; degrees: 100 
                    db       $E7/DIVIDER_P, $84 /DIVIDER_P ; degrees: 101 
                    db       $E4/DIVIDER_P, $85 /DIVIDER_P ; degrees: 103 
                    db       $E1/DIVIDER_P, $86 /DIVIDER_P ; degrees: 104 
                    db       $DE/DIVIDER_P, $86 /DIVIDER_P ; degrees: 105 
                    db       $DB/DIVIDER_P, $87 /DIVIDER_P ; degrees: 107 
                    db       $D8/DIVIDER_P, $88 /DIVIDER_P ; degrees: 108 
                    db       $D5/DIVIDER_P, $89 /DIVIDER_P ; degrees: 110 
                    db       $D2/DIVIDER_P, $8A /DIVIDER_P ; degrees: 111 
                    db       $CF/DIVIDER_P, $8C /DIVIDER_P ; degrees: 112 
                    db       $CC/DIVIDER_P, $8D /DIVIDER_P ; degrees: 114 
                    db       $C9/DIVIDER_P, $8E /DIVIDER_P ; degrees: 115 
                    db       $C6/DIVIDER_P, $90 /DIVIDER_P ; degrees: 117 
                    db       $C4/DIVIDER_P, $91 /DIVIDER_P ; degrees: 118 
                    db       $C1/DIVIDER_P, $93 /DIVIDER_P ; degrees: 119 
                    db       $BE/DIVIDER_P, $94 /DIVIDER_P ; degrees: 121 
                    db       $BC/DIVIDER_P, $96 /DIVIDER_P ; degrees: 122 
                    db       $B9/DIVIDER_P, $98 /DIVIDER_P ; degrees: 124 
                    db       $B6/DIVIDER_P, $99 /DIVIDER_P ; degrees: 125 
                    db       $B4/DIVIDER_P, $9B /DIVIDER_P ; degrees: 127 
                    db       $B1/DIVIDER_P, $9D /DIVIDER_P ; degrees: 128 
                    db       $AF/DIVIDER_P, $9F /DIVIDER_P ; degrees: 129 
                    db       $AD/DIVIDER_P, $A1 /DIVIDER_P ; degrees: 131 
                    db       $AA/DIVIDER_P, $A3 /DIVIDER_P ; degrees: 132 
                    db       $A8/DIVIDER_P, $A5 /DIVIDER_P ; degrees: 134 
                    db       $A6/DIVIDER_P, $A8 /DIVIDER_P ; degrees: 135 
                    db       $A4/DIVIDER_P, $AA /DIVIDER_P ; degrees: 136 
                    db       $A2/DIVIDER_P, $AC /DIVIDER_P ; degrees: 138 
                    db       $A0/DIVIDER_P, $AE /DIVIDER_P ; degrees: 139 
                    db       $9E/DIVIDER_P, $B1 /DIVIDER_P ; degrees: 141 
                    db       $9C/DIVIDER_P, $B3 /DIVIDER_P ; degrees: 142 
                    db       $9A/DIVIDER_P, $B6 /DIVIDER_P ; degrees: 143 
                    db       $98/DIVIDER_P, $B8 /DIVIDER_P ; degrees: 145 
                    db       $96/DIVIDER_P, $BB /DIVIDER_P ; degrees: 146 
                    db       $95/DIVIDER_P, $BE /DIVIDER_P ; degrees: 148 
                    db       $93/DIVIDER_P, $C0 /DIVIDER_P ; degrees: 149 
                    db       $91/DIVIDER_P, $C3 /DIVIDER_P ; degrees: 151 
                    db       $90/DIVIDER_P, $C6 /DIVIDER_P ; degrees: 152 
                    db       $8E/DIVIDER_P, $C9 /DIVIDER_P ; degrees: 153 
                    db       $8D/DIVIDER_P, $CB /DIVIDER_P ; degrees: 155 
                    db       $8C/DIVIDER_P, $CE /DIVIDER_P ; degrees: 156 
                    db       $8B/DIVIDER_P, $D1 /DIVIDER_P ; degrees: 158 
                    db       $8A/DIVIDER_P, $D4 /DIVIDER_P ; degrees: 159 
                    db       $88/DIVIDER_P, $D7 /DIVIDER_P ; degrees: 160 
                    db       $87/DIVIDER_P, $DA /DIVIDER_P ; degrees: 162 
                    db       $87/DIVIDER_P, $DD /DIVIDER_P ; degrees: 163 
                    db       $86/DIVIDER_P, $E0 /DIVIDER_P ; degrees: 165 
                    db       $85/DIVIDER_P, $E3 /DIVIDER_P ; degrees: 166 
                    db       $84/DIVIDER_P, $E6 /DIVIDER_P ; degrees: 167 
                    db       $84/DIVIDER_P, $E9 /DIVIDER_P ; degrees: 169 
                    db       $83/DIVIDER_P, $EC /DIVIDER_P ; degrees: 170 
                    db       $83/DIVIDER_P, $EF /DIVIDER_P ; degrees: 172 
                    db       $82/DIVIDER_P, $F2 /DIVIDER_P ; degrees: 173 
                    db       $82/DIVIDER_P, $F6 /DIVIDER_P ; degrees: 175 
                    db       $82/DIVIDER_P, $F9 /DIVIDER_P ; degrees: 176 
                    db       $82/DIVIDER_P, $FC /DIVIDER_P ; degrees: 177 
                    db       $82/DIVIDER_P, $FF /DIVIDER_P ; degrees: 179 
                    db       $82/DIVIDER_P, $01 /DIVIDER_P ; degrees: 180 
                    db       $82/DIVIDER_P, $04 /DIVIDER_P ; degrees: 182 
                    db       $82/DIVIDER_P, $07 /DIVIDER_P ; degrees: 183 
                    db       $82/DIVIDER_P, $0A /DIVIDER_P ; degrees: 184 
                    db       $82/DIVIDER_P, $0E /DIVIDER_P ; degrees: 186 
                    db       $83/DIVIDER_P, $11 /DIVIDER_P ; degrees: 187 
                    db       $83/DIVIDER_P, $14 /DIVIDER_P ; degrees: 189 
                    db       $84/DIVIDER_P, $17 /DIVIDER_P ; degrees: 190 
                    db       $84/DIVIDER_P, $1A /DIVIDER_P ; degrees: 191 
                    db       $85/DIVIDER_P, $1D /DIVIDER_P ; degrees: 193 
                    db       $86/DIVIDER_P, $20 /DIVIDER_P ; degrees: 194 
                    db       $87/DIVIDER_P, $23 /DIVIDER_P ; degrees: 196 
                    db       $87/DIVIDER_P, $26 /DIVIDER_P ; degrees: 197 
                    db       $88/DIVIDER_P, $29 /DIVIDER_P ; degrees: 199 
                    db       $8A/DIVIDER_P, $2C /DIVIDER_P ; degrees: 200 
                    db       $8B/DIVIDER_P, $2F /DIVIDER_P ; degrees: 201 
                    db       $8C/DIVIDER_P, $32 /DIVIDER_P ; degrees: 203 
                    db       $8D/DIVIDER_P, $35 /DIVIDER_P ; degrees: 204 
                    db       $8E/DIVIDER_P, $37 /DIVIDER_P ; degrees: 206 
                    db       $90/DIVIDER_P, $3A /DIVIDER_P ; degrees: 207 
                    db       $91/DIVIDER_P, $3D /DIVIDER_P ; degrees: 208 
                    db       $93/DIVIDER_P, $40 /DIVIDER_P ; degrees: 210 
                    db       $95/DIVIDER_P, $42 /DIVIDER_P ; degrees: 211 
                    db       $96/DIVIDER_P, $45 /DIVIDER_P ; degrees: 213 
                    db       $98/DIVIDER_P, $48 /DIVIDER_P ; degrees: 214 
                    db       $9A/DIVIDER_P, $4A /DIVIDER_P ; degrees: 215 
                    db       $9C/DIVIDER_P, $4D /DIVIDER_P ; degrees: 217 
                    db       $9E/DIVIDER_P, $4F /DIVIDER_P ; degrees: 218 
                    db       $A0/DIVIDER_P, $52 /DIVIDER_P ; degrees: 220 
                    db       $A2/DIVIDER_P, $54 /DIVIDER_P ; degrees: 221 
                    db       $A4/DIVIDER_P, $56 /DIVIDER_P ; degrees: 223 
                    db       $A6/DIVIDER_P, $58 /DIVIDER_P ; degrees: 224 
                    db       $A8/DIVIDER_P, $5B /DIVIDER_P ; degrees: 225 
                    db       $AA/DIVIDER_P, $5D /DIVIDER_P ; degrees: 227 
                    db       $AD/DIVIDER_P, $5F /DIVIDER_P ; degrees: 228 
                    db       $AF/DIVIDER_P, $61 /DIVIDER_P ; degrees: 230 
                    db       $B1/DIVIDER_P, $63 /DIVIDER_P ; degrees: 231 
                    db       $B4/DIVIDER_P, $65 /DIVIDER_P ; degrees: 232 
                    db       $B6/DIVIDER_P, $67 /DIVIDER_P ; degrees: 234 
                    db       $B9/DIVIDER_P, $68 /DIVIDER_P ; degrees: 235 
                    db       $BC/DIVIDER_P, $6A /DIVIDER_P ; degrees: 237 
                    db       $BE/DIVIDER_P, $6C /DIVIDER_P ; degrees: 238 
                    db       $C1/DIVIDER_P, $6D /DIVIDER_P ; degrees: 239 
                    db       $C4/DIVIDER_P, $6F /DIVIDER_P ; degrees: 241 
                    db       $C6/DIVIDER_P, $70 /DIVIDER_P ; degrees: 242 
                    db       $C9/DIVIDER_P, $72 /DIVIDER_P ; degrees: 244 
                    db       $CC/DIVIDER_P, $73 /DIVIDER_P ; degrees: 245 
                    db       $CF/DIVIDER_P, $74 /DIVIDER_P ; degrees: 247 
                    db       $D2/DIVIDER_P, $76 /DIVIDER_P ; degrees: 248 
                    db       $D5/DIVIDER_P, $77 /DIVIDER_P ; degrees: 249 
                    db       $D8/DIVIDER_P, $78 /DIVIDER_P ; degrees: 251 
                    db       $DB/DIVIDER_P, $79 /DIVIDER_P ; degrees: 252 
                    db       $DE/DIVIDER_P, $7A /DIVIDER_P ; degrees: 254 
                    db       $E1/DIVIDER_P, $7A /DIVIDER_P ; degrees: 255 
                    db       $E4/DIVIDER_P, $7B /DIVIDER_P ; degrees: 256 
                    db       $E7/DIVIDER_P, $7C /DIVIDER_P ; degrees: 258 
                    db       $EA/DIVIDER_P, $7C /DIVIDER_P ; degrees: 259 
                    db       $ED/DIVIDER_P, $7D /DIVIDER_P ; degrees: 261 
                    db       $F0/DIVIDER_P, $7D /DIVIDER_P ; degrees: 262 
                    db       $F3/DIVIDER_P, $7E /DIVIDER_P ; degrees: 263 
                    db       $F6/DIVIDER_P, $7E /DIVIDER_P ; degrees: 265 
                    db       $F9/DIVIDER_P, $7E /DIVIDER_P ; degrees: 266 
                    db       $FD/DIVIDER_P, $7E /DIVIDER_P ; degrees: 268 
                    db       $00/DIVIDER_P, $7E /DIVIDER_P ; degrees: 269 
                    db       $02/DIVIDER_P, $7E /DIVIDER_P ; degrees: 271 
                    db       $05/DIVIDER_P, $7E /DIVIDER_P ; degrees: 272 
                    db       $08/DIVIDER_P, $7E /DIVIDER_P ; degrees: 273 
                    db       $0B/DIVIDER_P, $7E /DIVIDER_P ; degrees: 275 
                    db       $0E/DIVIDER_P, $7E /DIVIDER_P ; degrees: 276 
                    db       $11/DIVIDER_P, $7D /DIVIDER_P ; degrees: 278 
                    db       $15/DIVIDER_P, $7D /DIVIDER_P ; degrees: 279 
                    db       $18/DIVIDER_P, $7C /DIVIDER_P ; degrees: 280 
                    db       $1B/DIVIDER_P, $7C /DIVIDER_P ; degrees: 282 
                    db       $1E/DIVIDER_P, $7B /DIVIDER_P ; degrees: 283 
                    db       $21/DIVIDER_P, $7A /DIVIDER_P ; degrees: 285 
                    db       $24/DIVIDER_P, $79 /DIVIDER_P ; degrees: 286 
                    db       $27/DIVIDER_P, $78 /DIVIDER_P ; degrees: 287 
                    db       $2A/DIVIDER_P, $77 /DIVIDER_P ; degrees: 289 
                    db       $2D/DIVIDER_P, $76 /DIVIDER_P ; degrees: 290 
                    db       $30/DIVIDER_P, $75 /DIVIDER_P ; degrees: 292 
                    db       $32/DIVIDER_P, $74 /DIVIDER_P ; degrees: 293 
                    db       $35/DIVIDER_P, $73 /DIVIDER_P ; degrees: 295 
                    db       $38/DIVIDER_P, $71 /DIVIDER_P ; degrees: 296 
                    db       $3B/DIVIDER_P, $70 /DIVIDER_P ; degrees: 297 
                    db       $3E/DIVIDER_P, $6E /DIVIDER_P ; degrees: 299 
                    db       $40/DIVIDER_P, $6D /DIVIDER_P ; degrees: 300 
                    db       $43/DIVIDER_P, $6B /DIVIDER_P ; degrees: 302 
                    db       $46/DIVIDER_P, $69 /DIVIDER_P ; degrees: 303 
                    db       $48/DIVIDER_P, $68 /DIVIDER_P ; degrees: 304 
                    db       $4B/DIVIDER_P, $66 /DIVIDER_P ; degrees: 306 
                    db       $4D/DIVIDER_P, $64 /DIVIDER_P ; degrees: 307 
                    db       $50/DIVIDER_P, $62 /DIVIDER_P ; degrees: 309 
                    db       $52/DIVIDER_P, $60 /DIVIDER_P ; degrees: 310 
                    db       $54/DIVIDER_P, $5E /DIVIDER_P ; degrees: 312 
                    db       $57/DIVIDER_P, $5C /DIVIDER_P ; degrees: 313 
                    db       $59/DIVIDER_P, $5A /DIVIDER_P ; degrees: 314 
                    db       $5B/DIVIDER_P, $57 /DIVIDER_P ; degrees: 316 
                    db       $5D/DIVIDER_P, $55 /DIVIDER_P ; degrees: 317 
                    db       $5F/DIVIDER_P, $53 /DIVIDER_P ; degrees: 319 
                    db       $61/DIVIDER_P, $50 /DIVIDER_P ; degrees: 320 
                    db       $63/DIVIDER_P, $4E /DIVIDER_P ; degrees: 321 
                    db       $65/DIVIDER_P, $4B /DIVIDER_P ; degrees: 323 
                    db       $67/DIVIDER_P, $49 /DIVIDER_P ; degrees: 324 
                    db       $69/DIVIDER_P, $46 /DIVIDER_P ; degrees: 326 
                    db       $6B/DIVIDER_P, $44 /DIVIDER_P ; degrees: 327 
                    db       $6C/DIVIDER_P, $41 /DIVIDER_P ; degrees: 328 
                    db       $6E/DIVIDER_P, $3E /DIVIDER_P ; degrees: 330 
                    db       $6F/DIVIDER_P, $3C /DIVIDER_P ; degrees: 331 
                    db       $71/DIVIDER_P, $39 /DIVIDER_P ; degrees: 333 
                    db       $72/DIVIDER_P, $36 /DIVIDER_P ; degrees: 334 
                    db       $74/DIVIDER_P, $33 /DIVIDER_P ; degrees: 336 
                    db       $75/DIVIDER_P, $30 /DIVIDER_P ; degrees: 337 
                    db       $76/DIVIDER_P, $2D /DIVIDER_P ; degrees: 338 
                    db       $77/DIVIDER_P, $2A /DIVIDER_P ; degrees: 340 
                    db       $78/DIVIDER_P, $27 /DIVIDER_P ; degrees: 341 
                    db       $79/DIVIDER_P, $25 /DIVIDER_P ; degrees: 343 
                    db       $7A/DIVIDER_P, $22 /DIVIDER_P ; degrees: 344 
                    db       $7B/DIVIDER_P, $1E /DIVIDER_P ; degrees: 345 
                    db       $7B/DIVIDER_P, $1B /DIVIDER_P ; degrees: 347 
                    db       $7C/DIVIDER_P, $18 /DIVIDER_P ; degrees: 348 
                    db       $7D/DIVIDER_P, $15 /DIVIDER_P ; degrees: 350 
                    db       $7D/DIVIDER_P, $12 /DIVIDER_P ; degrees: 351 
                    db       $7E/DIVIDER_P, $0F /DIVIDER_P ; degrees: 352 
                    db       $7E/DIVIDER_P, $0C /DIVIDER_P ; degrees: 354 
                    db       $7E/DIVIDER_P, $09 /DIVIDER_P ; degrees: 355 
                    db       $7E/DIVIDER_P, $06 /DIVIDER_P ; degrees: 357 
                    db       $7E/DIVIDER_P, $03 /DIVIDER_P ; degrees: 358 
                    db       $7F/DIVIDER_P, $00 /DIVIDER_P ; degrees: 0 
