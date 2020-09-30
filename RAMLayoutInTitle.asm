                    org      Vec_Music_Work 
; simple redefines for source compatability 
PLY_PSGREGISTERSARRAY                                     ;#isfunction  
PLY_PSGREG0         ds       1 
PLY_PSGREG1         ds       1 
PLY_PSGREG2         ds       1 
PLY_PSGREG3         ds       1 
PLY_PSGREG4         ds       1 
PLY_PSGREG5         ds       1 
PLY_PSGREG6         ds       2 
PLY_PSGREG8         ds       1 
PLY_PSGREG9         ds       1 
PLY_PSGREG10        ds       1 
PLY_PSGREG11        ds       1 
PLY_PSGREG12        ds       2 
PLY_PSGREGISTERSARRAY_END 
                    org      end_static_ram 
;;;;;;;;;; 
;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Game vars
;;;;;;;;;;;;;;;;;;;;;;;;;
hs_place_edit       ds       1 
hs_blink_count      ds       1 
hs_blink_state      ds       1 
hs_place_got        ds       1 
tmp_count2          ds       1 
last_joy_x          ds       1 
last_joy_y          ds       1 
buttonWait          ds       1 
;
; followed by the storage area for abve defined lists
MAX_ENEMY_OBJECTS_TITLE  =   10 
enemyobject_list_title  ds   EnemyStruct*(MAX_ENEMY_OBJECTS_TITLE ) 
enemyobject_list_title_end  ds  0 
;
;
; space where VecFever functions can be executed
;
; this can be moved on RAM shortage to "object" definition space
; no RAM function should be necessary while in game
;
ramfunction         =        enemyobject_list_title_end 
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Arkos vars
;;;;;;;;;;;;;;;;;;;;;;;;;
;
; if no in game music -> this can be moved on RAM shortage to "object" definition space
;
; start of some RAM Vars for Arkos Tracker
;
; below RAM usuage is 74 byte (without psh shadow/work registers, which are set to
; vectrex default RAM locations)
arkosPlayerMemStart  ds      0                            ; $c9d9 
songLoop            ds       1 
tmp_track_param     ds       1 
tmp_track_instrument  ds     1                            ; 
tmp_instrument_second_byte  ds  1 
; following are player vars which are channel independend
PLY_HEIGHT          ds       1                            ; height of pattern 
PLY_SPEED           ds       1                            ; speed of pattern 
PLY_SPEEDCPT        ds       1                            ; current speed position (count down to 0) 
PLY_HEIGHTCPT       ds       1                            ; current height position (count down to 0) 
PLY_TRACK_INSTRUMENTSTABLEPT  ds  2                       ; address of instrument table 
PLY_LINKER_PT       ds       2                            ; current linker position 
PLY_PSGREG13_RETRIG  ds      1                            ; retrigger "flag" - if same as PLY_PSGREG13, than not retriggered, otherewise - yes 
PLY_SAVESPECIALTRACK  ds     2                            ; start position of current special track 
PLY_SPECIALTRACK_PT  ds      2                            ; current position in special track 
PLY_SPECIALTRACK_WAITCOUNTER  ds  1                       ; wait counter for special track (count down to 0) 
;
; in general in below player, y reg points to the start of
; following structure (one for each channel)
                    struct   ArkosChannel 
                    ds       PLY_TRANSPOSITION, 1 
                    ds       PLY_TRACK_SAVEPTINSTRUMENT, 2 
                    ds       PLY_TRACK_INSTRUMENT, 2 
                    ds       PLY_TRACK_INSTRUMENTSPEED, 1 
                    ds       PLY_TRACK_INSTRUMENTSPEEDCPT, 1 
                    ds       PLY_TRACK_PT, 2 
                    ds       PLY_TRACK_WAITCOUNTER, 1 
                    ds       PLY_TRACK_NOTE, 1 
                    ds       PLY_TRACK_VOLUME, 1 
                    ds       PLY_TRACK_PITCH, 2 
                    ds       PLY_TRACK_PITCHADD, 2 
                    ds       PLY_TRACK_REG_7 ,1 
                    end struct 
;
Channel1Data        ds       ArkosChannel 
Channel2Data        ds       ArkosChannel 
Channel3Data        ds       ArkosChannel 
ChannelDataEnd      ds       0 
;
PLY_PSGREG13        ds       1                            ; special - this is used for retrigger activities 
PLY_VOL_REG         ds       2                            ; these two are used to stay "channel" independend 
PLY_FREQ_REG        ds       2                            ; they are loaded befor the "work" routines with the corresponding regs of the current channel 
songOver            ds       1 
arkosPlayerMemEnd   ds       0 
;
;
;********************************************************************
;********************************************************************
; VBTitle
;********************************************************************
;********************************************************************
;
; Defines
;
;
;
                    struct   CompareTile 
                    ds       Y_POS, 1 
                    ds       X_POS, 1 
                    ds       TILE_POINTER, 2              ; pointer to the actual MAP tile in the map (the Macro) 
                    end struct 
compareUp           ds       CompareTile 
compareDown         ds       CompareTile 
highScorePosition   ds       0 
; top and bottom
; since the sprite is taller than one tile high
; we take a top and bottom tile collision
; if both are clean - than no collision
; if one is "not clean" than collision
compareLeftBottom   ds       CompareTile 
compareRightBottom  ds       CompareTile 
compareLeftTop      ds       CompareTile 
compareRightTop     ds       CompareTile 
intensityTile       ds       1 
;last_joy_y          ds       1                            ; and Y, for checking, we don't want an autorun feature... 
;last_joy_x          ds       1                            ; last joystick position X, 
yCoarse             ds       1                            ; position in level, that is the upper left corner 
xCoarse             ds       1                            ; position in level, that is the upper left corner 
xCoarseCheck        ds       1 
yFine               ds       1                            ; fine "pixel" for scrolling 
xFine               ds       1                            ; size depends on tile map definition 
currentLevel        ds       2 
levelLineStart      ds       2 
levelYSize          ds       1 
levelXSize          ds       1 
displayPosY         ds       1                            ; position where the next tile is printed at 
displayPosX         ds       1 
skipDrawFlag        ds       1 
MAXTILES_COLLECTABLE  =      4 
; tiles collected are stored with the x position
; that means all collectable tiles must have a 
; different X position!
tilesCollected 
                    ds       1*MAXTILES_COLLECTABLE 
;tmp_debug           ds       6 
speedy              ds       1 
speedx              ds       1 
anay                ds       1 
anax                ds       1 
; at max 8 different animation counters!
counter0            ds       1 
counter1            ds       1 
counter2            ds       1 
counter3            ds       1 
counter4            ds       1 
counter5            ds       1 
counter6            ds       1 
counter7            ds       1 
animationDelay      ds       1 
; lookaHead buffers
nextDisplayPos      ds       0 
nextDisplayPosY     ds       1                            ; position where the next tile is printed at, used by look ahead 
nextDisplayPosX     ds       1 
endVerticalcompare  ds       1 
; clipping
divide_tmp          ds       2 
;tmp1 ds 2
v0: 
y0:                 ds       1 
x0:                 ds       1 
v1: 
y1:                 ds       1 
x1:                 ds       1 
v2: 
y2:                 ds       1 
x2:                 ds       1 
                    struct   CLIP_VECTORS 
                    ds       _pat1,1 
                    ds       _y1,1 
                    ds       _x1,1 
                    ds       _pat2,1 
                    ds       _y2,1 
                    ds       _x2,1 
                    end struct 
scrollReset         ds       1                            ; "round" counter of scroll text -> if 1 (or higher) the scrolltext has been fully shown 
neggi:              ds       1 
clip_test:          ds       2 
clip_line_counter:  ds       1 
clip_counter:       ds       2 
clip_pattern:       ds       2 
firstVector         ds       1 
BORDER              ds       2 
is_first_letter     ds       1 
do_another_letter   ds       1 
topclip 
bottomclip          ds       2 
rightclip 
leftclip            ds       2 
current_type        ds       1 
verticalBuffer      ds       1 
horizontalLeftBuffer  ds     1 
horizontalRightBuffer  ds    1 
clipped_vector_vertical_type  ds  1 
clipped_vector_vertical:  DS  30*3                        ; maximum 20 vectors to clip - also used as buffer 
clipped_vector_left:  DS     30*3                         ; maximum 20 vectors to clip - also used as buffer 
clipped_vector_final 
clipped_vector_right:  DS    30*3                         ; maximum 20 vectors to clip - also used as buffer 
xFineObject         ds       1 
yFineObject         ds       1 
clip_end            ds       0                            ; about $cbc2 
;
;
; the following values determine the "strength" of the 
; maximum move for the grid to be build
; the size of the grid should always be chosen with maximum strength and manipulated via scale
; max strength in anything is ALWAYS preferable to larger scale!
VERTICAL_MAX        =        127 
VERTICAL_MIN        =        -127 
HORIZONTAL_MAX      =        127 
HORIZONTAL_MIN      =        -127 
SCALE_MOVE          EQU      123                          ; 93 
SCALE_VLIST         EQU      16                           ; 16; 11 
; determines the number of tiles on screen
FULL_TILES_HORIZONTAL  =     12 
FULL_TILES_VERTICAL  =       12 
GRID_HEIGHT         =        (VERTICAL_MAX-VERTICAL_MIN) 
GRID_WIDTH          =        (HORIZONTAL_MAX-HORIZONTAL_MIN) 
ALL_TILES_HORIZONTAL  =      (FULL_TILES_HORIZONTAL+2)    ; scrolling allows on each side a partial tile 
ALL_TILES_VERTICAL  =        (FULL_TILES_VERTICAL+2)      ; scrolling allows on each side a partial tile 
; size of tiles in "pixel", size here means in relation to position in grid
; a "pixel" is a 1 step move in the "SCALE_MOVE" scale
; the "hardware" size of a tile is determinded by the scale "SCALE_VLIST", which should be much much smaller than 
; the move scale.
; The relation between the two is experimentally determined!
; e.g. 254 / 12 = 21 => tile width in scales
;
; these are the values added by a single tile to the position
; exact should be whats commented out
; 16 for easier calc
TILE_WIDTH          =        (GRID_WIDTH / ALL_TILES_HORIZONTAL) 
TILE_HEIGHT         =        (GRID_HEIGHT / ALL_TILES_VERTICAL) 
STEP_HORIZONTAL_TILE_IN_PIXEL  =  (128/TILE_WIDTH) 
STEP_VERTICAL_TILE_IN_PIXEL  =  (128/TILE_HEIGHT) 
; start pos of draw is uper left corner
; in cartesian minX, maxY
START_POS_VERTICAL  =        ((TILE_HEIGHT*FULL_TILES_VERTICAL)/2) 
START_POS_HORIZONTAL  =      (-((TILE_WIDTH*FULL_TILES_HORIZONTAL)/2)) 
START_POS           =        (hi(START_POS_VERTICAL*256)*256) + lo(START_POS_HORIZONTAL) 
; only 5 rows displayed!
FULL_TILES_VERTICAL_END_CHANGED  =  FULL_TILES_VERTICAL-7 ; FULL_TILES_VERTICAL; 
FULL_TILES_VERTICAL_END_CHANGED_BIG  =  FULL_TILES_VERTICAL ; FULL_TILES_VERTICAL; 
;END_POS_VERTICAL = START_POS_VERTICAL - (FULL_TILES_VERTICAL*TILE_HEIGHT)
END_POS_VERTICAL_BIG  =      START_POS_VERTICAL - (FULL_TILES_VERTICAL_END_CHANGED_BIG*TILE_HEIGHT) 
END_POS_VERTICAL    =        START_POS_VERTICAL - (FULL_TILES_VERTICAL_END_CHANGED*TILE_HEIGHT) 
SECOND_END_POS_VERTICAL_BIG  =  START_POS_VERTICAL + ((FULL_TILES_VERTICAL_END_CHANGED_BIG-1)*TILE_HEIGHT) 
END_POS_HORIZONTAL  =        START_POS_HORIZONTAL + (FULL_TILES_HORIZONTAL*TILE_WIDTH) 
SECOND_END_POS_HORIZONTAL  =  START_POS_HORIZONTAL + ((FULL_TILES_HORIZONTAL-1)*TILE_WIDTH) 
END_POS_VERTICAL_TEST  =     END_POS_VERTICAL - TILE_HEIGHT 
END_POS_HORIZONTAL_TEST  =   END_POS_HORIZONTAL + TILE_WIDTH 
FINE_MAX_VERTICAL   equ      TILE_HEIGHT 
FINE_MAX_HORIZONTAL  equ     TILE_WIDTH 
TYPE_SIMPLE         equ      0                            ; can do simple clipping 
TYPE_EXPONENTIAL    equ      1                            ; no easy clipping 
TYPE_EXACT          equ      -1                           ; can do simple clipping 
; following not done!
TYPE_CONTINUE_RESET  equ     2                            ; if set continue is possible after this tile, position is set to next start point 
TYPE_CONTINUE_HERE  equ      4                            ; if set continue is possible, leaving at some arbitrary point 
TYPE_DOUBLE_SCALE   equ      8                            ; if set continue is possible, leaving at some arbitrary point 
TYPE_QUAD_SCALE     equ      16                           ; if set continue is possible, leaving at some arbitrary point 
tiler_END_POS_VERTICAL  ds   1 
mh_playerAnimList   ds       2 
mh_playerAnimCounter  ds     1 
mh_playerAnimDelayCounter  ds  1 
mh_playerTouchesGround  ds   1 
mh_playerXSpeed     ds       1 
mh_playerYSpeed     ds       1 
mh_playerWantDir    ds       1                            ; %0000UDLR 
mh_lastPlayerWantDir  ds     1                            ; %0000UDLR 
mh_currentPossibleDirections  ds  1 
PLAYER_WANTS_RIGHT  =        1 
PLAYER_WANTS_LEFT   =        2 
PLAYER_WANTS_DOWN   =        4 
PLAYER_WANTS_UP     =        8 
PLAYER_CAN_RIGHT    =        1 
PLAYER_CAN_LEFT     =        2 
PLAYER_CAN_DOWN     =        4 
PLAYER_CAN_UP       =        8 
COL_RIGHT           =        1 
COL_LEFT            =        2 
COL_DOWN            =        4 
COL_UP              =        8 
COL_COLLECT         =        16                           ; tile can be collected! 
; is when no more vars are added, and max 30 vectors in tile clipping zone!
; THIS MUST END BEFORE SCOOPY SAVE POSITION!
;--------------------------------------------------------------------------------
; object structures and vars for tile mobs
; reuses RAM
                    org      enemyobject_list_title 
                    struct   TileMOB 
                    ds       T_SCREEN_Y, 1 
                    ds       T_SCREEN_X, 1 
                    ds       T_BEHAVIOUR,2                ; PC 
                    ds       T_NEXT_TILE_OBJECT,2         ; positive = end of list 
                    ds       T_YCOARSE, 1 
                    ds       T_XCOARSE, 1 
                    ds       T_YFINE, 1 
                    ds       T_XFINE, 1 
                    ds       T_ANIM, 1 
                    ds       T_ANIM_COUNTER, 1 
                    ds       T_DEFINITION_POINTER, 2 
                    end struct 
TILE_OBJECT_DONE_A  =        STARS_DONE_A 
TILE_OBJECT         =        STARS_DONE_A-2 
COUNT_TILE_MOBS     =        10 
tileobject_list     ds       TileMOB*(COUNT_TILE_MOBS) 
tileobject_list_end  ds      0 
tileobject_empty_head  =     starlist_empty_head 
tileobject_objects_head  =   starlist_objects_head 
tileobjectCount     =        starCount 
;--------------------------------------------------------------------------------
; RAM highscore
                    org      clipped_vector_vertical 
highScoreBlock 
Ram_HighScore_Start 
highScoreTable      ds       HighScoreEntry * 4           ; 8*4 = 32 byte 
Ram_HighScore_End 
Ram_HardcoreScore_Start 
HardcoreScoreTable  ds       HighScoreEntry * 4           ; 8*4 = 32 byte 
Ram_HardcoreScore_End 
highScoreTableEnd 
tmpHiStart          ds       0                            ; 2 only when displaying hs 
tmpHiMode           =        tmpHiStart + 2 
tmpButtonMode       =        tmpHiStart + 3 
flashUserRAM        ds       100 
