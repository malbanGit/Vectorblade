; bank 2
PARTICLES_PER_FIRE  =        9 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; new list object to U
; destroys d, u 
newFWObject                                               ;#isfunction  
                    ldu      fwlist_empty_head 
                    cmpu     #OBJECT_LIST_COMPARE_ADDRESS 
                    bls      fw_cs_done_no 
                                                          ; set the new empty head 
                    ldd      FW_NEXT_OBJECT,u             ; the next in out empty list will be the new 
                    std      fwlist_empty_head            ; head of our empty list 
                                                          ; load last of current object list 
; the old head is always our next
                    ldd      fwlist_objects_head 
                    std      FW_NEXT_OBJECT,u 
; newobject is always head
                    stu      fwlist_objects_head 
fw_cs_done_no 
                    rts      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; this macro is placed at the end of each possible "remove" exit
; it stores the just removed object at the head of the "empty" list and 
; sets up its "next" pointer
FW_UPDATE_EMPTY_LIST  macro  
                    ldy      fwlist_empty_head            ; set u free, as new free head 
                    sty      FW_NEXT_OBJECT,x             ; load to u the next linked list element 
                    stx      fwlist_empty_head 
                    endm     
;
fwdestroyPObject                                          ;#isfunction  
; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; in ds+u_offset1 pointer to the object that must be removed
; destroys x, y 
; puls from ds the next object behaviour
; 
; this version is called at the end of an explosion called by "behaviours"
;
                    leax     u_offset1,u                  ; x -> pointer object struture (correction of offset) 
                    cmpx     fwlist_objects_head          ; is it the first? 
                    bne      fwwas_not_first_enem         ; no -> jump 
fwwas_first_enem 
                    ldu      FW_NEXT_OBJECT,x             ; s pointer to next objext 
                    stu      fwlist_objects_head          ; the next object will be the first 
                    bra      fwpRemoveDone 

fwwas_not_first_enem                                      ;      find previous, go thru all objects from first and look where "I" am the next... 
                    ldy      fwlist_objects_head          ; start at list head 
fwtry_next_enem 
                    cmpx     FW_NEXT_OBJECT,y             ; am I the next object of the current investigated list element 
                    beq      fwfound_next_switch_enem     ; jup -> jump 
                    ldy      FW_NEXT_OBJECT,y             ; otherwise load the next as new current 
                    bra      fwtry_next_enem              ; and search further 

fwfound_next_switch_enem 
                    ldu      FW_NEXT_OBJECT,x             ; we load "our" next object to s 
                    stu      FW_NEXT_OBJECT,y             ; and store our next in the place of our previous next and thus eleminate ourselfs 
fwpRemoveDone 
                    FW_UPDATE_EMPTY_LIST                  ; and clean up the empties 
; do a clean ending - which is usually done at the end of "SmartDraw"
                    _ZERO_VECTOR_BEAM  
                    MY_MOVE_TO_A_END  
                    pulu     d,pc                         ; (D = y,x, X = vectorlist) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MEGA simple particles and emitters
; one object only has 6 byte
; thus nearly 140 objects can be created!
;
; the demo runs with abour 135 dots
;***************************************************************************
rocketEmitterBehaviour                                    ;#isfunction  
                    ldb      FW_X_POS+u_offset1,u 
                    MY_MOVE_TO_D_START  
; change coordinates, 16 bit
; ypos
                    ldd      FW_Y_VEL+u_offset1,u 
                    ldx      FW_Y_POS+u_offset1,u 
                    leax     d,x 
                    leax     d,x 
                    stx      FW_Y_POS+u_offset1,u 
; xpos
                    ldd      FW_X_VEL+u_offset1,u 
                    ldx      FW_X_POS+u_offset1,u 
                    leax     d,x 
                    leax     d,x 
                    stx      FW_X_POS+u_offset1,u 
                    dec      FW_AGE+u_offset1,u 
                    beq      explodeRocket 
                    ldu      FW_NEXT_OBJECT+u_offset1,u   ; preload next user stack 
                    lda      #$7f 
                    MY_MOVE_TO_B_END  
                    _INTENSITY_A  
                    LDB      #20                          ; really BRIGHT 
; print a rocket
                    clra     
                    dec      <VIA_shift_reg               ;Store in VIA shift register 
LF2CC_2_rl 
                    DECB                                  ;Delay leaving beam in place 
                    bpl      LF2CC_2_rl 
                    sta      <VIA_shift_reg               ;Blank beam in VIA shift register 
                    lda      #$3f 
                    _INTENSITY_A  
                    _ZERO_VECTOR_BEAM  
                    pulu     d,pc 
; ...............................................
explodeRocket 
                    pshs     u 
                    lda      playSoundFlags 
                    anda     #%11000000 
                                                          ; bne noNewFWSound 
REPLACE_1_2_FW2Data_varFromIRQ1_2 
                    ldx      #0                           ; FW2Data 
                    stx      sfx_pointer_1 
noNewFWSound 
                    leax     ,u 
                    lda      #PARTICLES_PER_FIRE 
                    sta      tmp1 
contEmit_er 
                    jsr      newFWObject 
                    cmpu     #OBJECT_LIST_COMPARE_ADDRESS 
                    bls      noNewParticle3_fr 
; 16 bit position of velocityParticle
                    clrb     
                    lda      FW_Y_POS+u_offset1,x 
                    std      FW_Y_POS, u 
                    lda      FW_X_POS+u_offset1,x 
                    std      FW_X_POS, u 
                    sta      FW_ZERO,u 
                    clra     
                    RANDOM_B  
                    std      FW_Y_VEL, u 
                    RANDOM_B  
                    andb     #%00111111                   ; slightly different FW_AGE 
                    negb     
                    addb     #150 
                    stb      FW_AGE,U 
                    RANDOM_B  
                    andb     #$ff-$80 
                    sex      
                    std      FW_X_VEL, u 
                    ldd      #velocityPositiveXParticleParticleBehaviour 
                    std      FW_BEHAVIOUR, u 
                    dec      tmp1 
                    bpl      contEmit_er 
noNewParticle3_fr 
                    puls     u 
                    jmp      fwdestroyPObject 

;
;***************************************************************************
;
GRAVITY_Y           =        4 
GRAVITY_X           =        1 
;
velocityPositiveXParticleParticleBehaviour                ;#isfunction  
; position to 
                    ldb      FW_X_POS+u_offset1,u 
;LEFT half of firework
                    MY_MOVE_TO_D_START  
; Thought:
; the velocity stuuf needs only be done ONCE per 'rocket', not per particle!
;
; update 
; x velocity towards 0
                    ldd      FW_X_VEL+u_offset1,u 
                    bmi      xStays 
                    subd     #GRAVITY_X 
                    std      FW_X_VEL+u_offset1,u 
xStays 
; xpos
                    addd     FW_X_POS+u_offset1,u 
                    lbvs     fwdestroyPObject 
                    std      FW_X_POS+u_offset1,u 
;
; y velocity towards -128
                    ldd      FW_Y_VEL+u_offset1,u 
                    subd     #GRAVITY_Y 
; Hm... no overflow occurs - so don't check... (experimental proof :-) )
                    std      FW_Y_VEL+u_offset1,u 
; change coordinates, 16 bit
; ypos
                    addd     FW_Y_POS+u_offset1,u 
                    lbvs     fwdestroyPObject 
                    std      FW_Y_POS+u_offset1,u 
; aging
                    dec      FW_AGE+u_offset1,u 
                    lbEQ     fwdestroyPObject 
                    lda      #$60/2 
                    sta      <VIA_t1_cnt_lo 
                    lda      FW_AGE+u_offset1,u 
                    lsra     
                    lsra     
                    lsra     
                    ldx      #fwshiftValues 
                    lda      a,x 
                    pshs     a 
                    ldb      FW_ZERO+u_offset1,u 
; assuming WAIT is finished by now!
                    sta      <VIA_shift_reg               ;Store in VIA shift register 
                    subb     FW_X_POS+u_offset1,u 
                    clra     
                    sta      <VIA_shift_reg               ;Store in VIA shift register 
                    aslb     
                    lda      FW_AGE+u_offset1,u 
                    lsra                                  ; 75-0 
                    suba     #75 
;                    asra     
                    asra     
;                    aslb     
                    aslb     
;RIGHT half of firework
                    MY_MOVE_TO_D_START  
                    lda      #$60 
                    sta      <VIA_t1_cnt_lo 
                    puls     a 
                    ldu      FW_NEXT_OBJECT+u_offset1,u   ; preload next user stack 
                    MY_MOVE_TO_B_END  
                    sta      <VIA_shift_reg               ;Store in VIA shift register 
                    clra     
                    LDB      #$CC 
                    sta      <VIA_shift_reg               ;Store in VIA shift register 
                    STB      VIA_cntl                     ;/BLANK low and /ZERO low 
                    pulu     d,pc 
fwshiftValues 
                    db       %10000000 
                    db       %10000000 
                    db       %10000000 
                    db       %10000000 
                    db       %11000000 
                    db       %11000000 
                    db       %11100000 
                    db       %11100000 
                    db       %11110000 
                    db       %11110000 
                    db       %11111000 
                    db       %11111000 
                    db       %11111100 
                    db       %11111100 
                    db       %11111110 
                    db       %11111110 
                    db       %11111110 
                    db       %11111110 
                    db       %11111110 
                    db       %11111110 
