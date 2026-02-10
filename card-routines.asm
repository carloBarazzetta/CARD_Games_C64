; da65 V2.19 - Git f166ca8
; Created:    2026-02-10 11:36:53
; Input file: CARD_Games_C64/Dev/Briscola-en/card-routines.prg
; Page:       1


        .setcpu "6502"

; ----------------------------------------------------------------------------
TXTPTR          := $007A                        ; BASIC text pointer (lo byte)
TXTPTR_HI       := $007B                        ; BASIC text pointer (hi byte)
SHFLAG          := $0291                        ; Shift key disable flag
IGONE_LO        := $0308                        ; BASIC IGONE vector (lo)
IGONE_HI        := $0309                        ; BASIC IGONE vector (hi)
NEWSTT          := $A7AE                        ; BASIC: execute next statement
GONE            := $A7E4                        ; BASIC: execute current token
SYNERR          := $AF08                        ; BASIC: ?SYNTAX ERROR
IQERR           := $B248                        ; BASIC: ?ILLEGAL QUANTITY ERROR
FRMNUM          := $B79B                        ; BASIC: evaluate numeric expression
CARDBUF         := $C000                        ; Card character buffer (63 bytes, 9 rows x 7 cols)
CARDBUF_01      := $C001
CARDBUF_02      := $C002
CARDBUF_03      := $C003
CARDBUF_04      := $C004
CARDBUF_06      := $C006
CARDBUF_07      := $C007
CARDBUF_08      := $C008
CARDBUF_09      := $C009
CARDBUF_0A      := $C00A
CARDBUF_0B      := $C00B
CARDBUF_0C      := $C00C
CARDBUF_0D      := $C00D
CARDBUF_0F      := $C00F
CARDBUF_13      := $C013
CARDBUF_1E      := $C01E
CARDBUF_1F      := $C01F
CARDBUF_20      := $C020
CARDBUF_2B      := $C02B
CARDBUF_2F      := $C02F
CARDBUF_32      := $C032
CARDBUF_36      := $C036
CARDBUF_TOP_ROW := $C038                        ; Top row of card (first drawn)
CARDBUF_39      := $C039
CARDBUF_END     := $C03E                        ; Last byte of buffer
TEMP            := $C03F                        ; Temporary variable
VMCSB           := $D018                        ; VIC-II memory control register
; ----------------------------------------------------------------------------
; Pip position lookup table (56 bytes)
PIP_TABLE:
        .byte   $1F,$2D,$11,$2D,$1F,$11,$2C,$2E ; C040 1F 2D 11 2D 1F 11 2C 2E  .-.-..,.
        .byte   $10,$12,$2C,$2E,$1F,$10,$12,$2C ; C048 10 12 2C 2E 1F 10 12 2C  ..,....,
        .byte   $2E,$1E,$20,$10,$12,$2C,$2E,$26 ; C050 2E 1E 20 10 12 2C 2E 26  .. ..,.&
        .byte   $1E,$20,$10,$12,$33,$35,$25,$27 ; C058 1E 20 10 12 33 35 25 27  . ..35%'
        .byte   $17,$19,$09,$0B,$33,$35,$25,$27 ; C060 17 19 09 0B 33 35 25 27  ....35%'
        .byte   $1F,$17,$19,$09,$0B,$33,$35,$2D ; C068 1F 17 19 09 0B 33 35 2D  .....35-
        .byte   $25,$27,$17,$19,$11,$09,$0B     ; C070 25 27 17 19 11 09 0B     %'.....
; Null terminator / base for token lookup
PIP_TABLE_END:
        .byte   $00                             ; C077 00                       .
; CARD token: C=$43 A=$41 R=$52 D=$C4
CARD_TOKEN:
        .byte   $43,$41,$52,$C4                 ; C078 43 41 52 C4              CAR.
; Unused padding ($A0 = PETSCII space)
TOKEN_PAD:
        .byte   $A0,$A0,$A0,$A0                 ; C07C A0 A0 A0 A0              ....
; Param limits: X<34, Y<17, type<16, suit<4
PARAM_MAX:
        .byte   $22,$11,$10,$04                 ; C080 22 11 10 04              "...
; Card column (0-33)
PARAM_X:.byte   $10                             ; C084 10                       .
; Card row (0-16)
PARAM_Y:.byte   $08                             ; C085 08                       .
; Card type (0=clear,1-10=A-10,11-13=J/Q/K,14=Joker,15=back)
PARAM_TYPE:
        .byte   $04                             ; C086 04                       .
; Suit (0=spades,1=clubs,2=diamonds,3=hearts)
PARAM_SUIT:
        .byte   $03                             ; C087 03                       .
; Card back colors: $06=blue, $02=red
BACK_COLORS:
        .byte   $06,$02                         ; C088 06 02                    ..
; ----------------------------------------------------------------------------
; SYS 49290: Enable CARD command + custom charset
EnableCard:
        ldx     LC0C1                           ; C08A AE C1 C0                 ...
        ldy     LC0C2                           ; C08D AC C2 C0                 ...
        stx     IGONE_LO                        ; C090 8E 08 03                 ...
        sty     IGONE_HI                        ; C093 8C 09 03                 ...
; SYS 49302: Disable shift keys, select charset at $0800
EnableCharset:
        lda     SHFLAG                          ; C096 AD 91 02                 ...
        ora     #$80                            ; C099 09 80                    ..
        sta     SHFLAG                          ; C09B 8D 91 02                 ...
        lda     VMCSB                           ; C09E AD 18 D0                 ...
        and     #$F3                            ; C0A1 29 F3                    ).
        ora     #$02                            ; C0A3 09 02                    ..
        sta     VMCSB                           ; C0A5 8D 18 D0                 ...
        rts                                     ; C0A8 60                       `

; ----------------------------------------------------------------------------
; SYS 49321: Disable CARD command, restore ROM charset
DisableCard:
        ldx     LC0D1                           ; C0A9 AE D1 C0                 ...
        ldy     LC0D2                           ; C0AC AC D2 C0                 ...
        stx     IGONE_LO                        ; C0AF 8E 08 03                 ...
        sty     IGONE_HI                        ; C0B2 8C 09 03                 ...
        lda     VMCSB                           ; C0B5 AD 18 D0                 ...
        and     #$F5                            ; C0B8 29 F5                    ).
        ora     #$04                            ; C0BA 09 04                    ..
        sta     VMCSB                           ; C0BC 8D 18 D0                 ...
        rts                                     ; C0BF 60                       `

; ----------------------------------------------------------------------------
; NOT CODE - holds ParseToken addr $C0C3 in operand bytes
AddrHolder:
LC0C1           := * + 1
LC0C2           := * + 2
        lda     ParseToken                      ; C0C0 AD C3 C0                 ...
; IGONE wedge: match 'CARD' token in BASIC text
ParseToken:
        ldy     #$00                            ; C0C3 A0 00                    ..
; Compare next token character
ParseLoop:
        iny                                     ; C0C5 C8                       .
        lda     PIP_TABLE_END,y                 ; C0C6 B9 77 C0                 .w.
        tax                                     ; C0C9 AA                       .
        and     #$7F                            ; C0CA 29 7F                    ).
        cmp     (TXTPTR),y                      ; C0CC D1 7A                    .z
        beq     CharMatch                       ; C0CE F0 03                    ..
LC0D1           := * + 1
LC0D2           := * + 2
        jmp     GONE                            ; C0D0 4C E4 A7                 L..

; ----------------------------------------------------------------------------
; Character matched, check if last (bit 7)
CharMatch:
        txa                                     ; C0D3 8A                       .
        bpl     ParseLoop                       ; C0D4 10 EF                    ..
; Full token matched - advance TXTPTR and execute
TokenMatch:
        tya                                     ; C0D6 98                       .
        clc                                     ; C0D7 18                       .
        adc     TXTPTR                          ; C0D8 65 7A                    ez
        sta     TXTPTR                          ; C0DA 85 7A                    .z
        bcc     LC0E0                           ; C0DC 90 02                    ..
        inc     TXTPTR_HI                       ; C0DE E6 7B                    .{
LC0E0:  lda     #$00                            ; C0E0 A9 00                    ..
; Token matched: evaluate params then execute
ExecCard:
        jsr     EvalParams                      ; C0E2 20 F6 C0                  ..
        jmp     NEWSTT                          ; C0E5 4C AE A7                 L..

; ----------------------------------------------------------------------------
; SYS 49384: SYS-based card draw (no wedge needed)
SysCard:ldy     #$00                            ; C0E8 A0 00                    ..
LC0EA:  ldx     #$00                            ; C0EA A2 00                    ..
; Parse next comma-separated parameter
SysParamLoop:
        lda     (TXTPTR,x)                      ; C0EC A1 7A                    .z
        cmp     #$2C                            ; C0EE C9 2C                    .,
        beq     LC0F5                           ; C0F0 F0 03                    ..
        jmp     SYNERR                          ; C0F2 4C 08 AF                 L..

; ----------------------------------------------------------------------------
LC0F5:  tya                                     ; C0F5 98                       .
; Evaluate and validate 4 card parameters
EvalParams:
        pha                                     ; C0F6 48                       H
; Evaluate one numeric param via FRMNUM
EvalOneParam:
        jsr     FRMNUM                          ; C0F7 20 9B B7                  ..
        pla                                     ; C0FA 68                       h
        tay                                     ; C0FB A8                       .
        txa                                     ; C0FC 8A                       .
        cmp     PARAM_MAX,y                     ; C0FD D9 80 C0                 ...
        bcc     StoreParam                      ; C100 90 03                    ..
        jmp     IQERR                           ; C102 4C 48 B2                 LH.

; ----------------------------------------------------------------------------
; Store validated param at PARAMS,Y
StoreParam:
        sta     PARAM_X,y                       ; C105 99 84 C0                 ...
        iny                                     ; C108 C8                       .
        cpy     #$04                            ; C109 C0 04                    ..
        bne     LC0EA                           ; C10B D0 DD                    ..
; SYS 49421: Build card in buffer and blit to screen
DrawCard:
        lda     #$20                            ; C10D A9 20                    . 
        ldy     PARAM_TYPE                      ; C10F AC 86 C0                 ...
        cpy     #$0F                            ; C112 C0 0F                    ..
        bne     SetFillChar                     ; C114 D0 02                    ..
        lda     #$66                            ; C116 A9 66                    .f
SetFillChar:
        ldx     #$3E                            ; C118 A2 3E                    .>
; Fill 63-byte buffer with A register
FillBuf:sta     CARDBUF,x                       ; C11A 9D 00 C0                 ...
        dex                                     ; C11D CA                       .
        bpl     FillBuf                         ; C11E 10 FA                    ..
        tya                                     ; C120 98                       .
        beq     LC198                           ; C121 F0 75                    .u
; Draw card border: corners + edges
DrawFrame:
        ldx     #$4E                            ; C123 A2 4E                    .N
        stx     CARDBUF_TOP_ROW                 ; C125 8E 38 C0                 .8.
        inx                                     ; C128 E8                       .
        stx     CARDBUF_END                     ; C129 8E 3E C0                 .>.
        ldx     #$57                            ; C12C A2 57                    .W
        stx     CARDBUF                         ; C12E 8E 00 C0                 ...
        inx                                     ; C131 E8                       .
        stx     CARDBUF_06                      ; C132 8E 06 C0                 ...
        lda     #$55                            ; C135 A9 55                    .U
        ldx     #$04                            ; C137 A2 04                    ..
; Fill top/bottom border chars ($55)
FillBorders:
        sta     CARDBUF_39,x                    ; C139 9D 39 C0                 .9.
        sta     CARDBUF_01,x                    ; C13C 9D 01 C0                 ...
        dex                                     ; C13F CA                       .
        bpl     FillBorders                     ; C140 10 F7                    ..
        sec                                     ; C142 38                       8
        ldx     #$2A                            ; C143 A2 2A                    .*
; Fill left/right side borders ($7F)
FillSides:
        lda     #$7F                            ; C145 A9 7F                    ..
        sta     CARDBUF_07,x                    ; C147 9D 07 C0                 ...
        sta     CARDBUF_0D,x                    ; C14A 9D 0D C0                 ...
        txa                                     ; C14D 8A                       .
        sbc     #$07                            ; C14E E9 07                    ..
        tax                                     ; C150 AA                       .
        bpl     FillSides                       ; C151 10 F2                    ..
        cpy     #$0F                            ; C153 C0 0F                    ..
; Card back (type 15)? Skip face rendering
CheckBack:
        beq     LC1D5                           ; C155 F0 7E                    .~
; Build card face: value + pips/figure
BuildFace:
        dey                                     ; C157 88                       .
        tya                                     ; C158 98                       .
; Calculate character for card value (ORA #$40)
CalcValueChar:
        ora     #$40                            ; C159 09 40                    .@
        sta     CARDBUF_32                      ; C15B 8D 32 C0                 .2.
        sta     CARDBUF_36                      ; C15E 8D 36 C0                 .6.
        cmp     #$47                            ; C161 C9 47                    .G
        beq     ApplyXor                        ; C163 F0 10                    ..
        cmp     #$4D                            ; C165 C9 4D                    .M
        beq     ApplyXor                        ; C167 F0 0C                    ..
        cmp     #$45                            ; C169 C9 45                    .E
        beq     LC171                           ; C16B F0 04                    ..
        cmp     #$48                            ; C16D C9 48                    .H
        bne     AdjustChar                      ; C16F D0 02                    ..
LC171:  eor     #$1D                            ; C171 49 1D                    I.
; Adjust character code for special card types
AdjustChar:
        eor     #$10                            ; C173 49 10                    I.
; Apply final EOR to value character
ApplyXor:
StoreValueChar  := * + 2                        ; Store value char in buffer corners
        sta     CARDBUF_08                      ; C175 8D 08 C0                 ...
        sta     CARDBUF_0C                      ; C178 8D 0C C0                 ...
        cmp     #$4D                            ; C17B C9 4D                    .M
        bne     JumpToBlit                      ; C17D D0 1B                    ..
; Draw 3-char-wide figure pattern (J/Q/K)
DrawFigure:
        ldx     #$23                            ; C17F A2 23                    .#
        ldy     #$70                            ; C181 A0 70                    .p
LC183:  tya                                     ; C183 98                       .
FigureLoop      := * + 1                        ; Fill figure char columns across rows
        sta     CARDBUF_09,x                    ; C184 9D 09 C0                 ...
        iny                                     ; C187 C8                       .
        tya                                     ; C188 98                       .
        sta     CARDBUF_0A,x                    ; C189 9D 0A C0                 ...
        iny                                     ; C18C C8                       .
        tya                                     ; C18D 98                       .
        sta     CARDBUF_0B,x                    ; C18E 9D 0B C0                 ...
        iny                                     ; C191 C8                       .
        txa                                     ; C192 8A                       .
        sbc     #$07                            ; C193 E9 07                    ..
        tax                                     ; C195 AA                       .
        bne     LC183                           ; C196 D0 EB                    ..
LC198:  beq     LC217                           ; C198 F0 7D                    .}
; Type 0: skip to screen blit (clear area)
JumpToBlit:
DrawSuitPips    := * + 2                        ; Place suit symbols based on card value
        lda     PARAM_SUIT                      ; C19A AD 87 C0                 ...
        ora     #$68                            ; C19D 09 68                    .h
        sta     CARDBUF_2B                      ; C19F 8D 2B C0                 .+.
        sta     CARDBUF_2F                      ; C1A2 8D 2F C0                 ./.
        ora     #$04                            ; C1A5 09 04                    ..
        sta     CARDBUF_0F                      ; C1A7 8D 0F C0                 ...
        sta     CARDBUF_13                      ; C1AA 8D 13 C0                 ...
; Card value >= 10? Use two-digit display
CheckTens:
        cpy     #$0A                            ; C1AD C0 0A                    ..
        bcc     BackDone                        ; C1AF 90 26                    .&
; Calculate chars for tens digit (10='1'+0)
CalcDigitChars:
        tya                                     ; C1B1 98                       .
        sbc     #$0A                            ; C1B2 E9 0A                    ..
        tay                                     ; C1B4 A8                       .
        lda     #$AA                            ; C1B5 A9 AA                    ..
LC1B7:  adc     #$15                            ; C1B7 69 15                    i.
        dey                                     ; C1B9 88                       .
        bpl     LC1B7                           ; C1BA 10 FB                    ..
        tay                                     ; C1BC A8                       .
        sec                                     ; C1BD 38                       8
; Draw digit characters on card face
DrawDigits:
        ldx     #$31                            ; C1BE A2 31                    .1
LC1C0:  tya                                     ; C1C0 98                       .
DigitLoop       := * + 1                        ; Place 3 digit chars per row across card
        sta     CARDBUF_02,x                    ; C1C1 9D 02 C0                 ...
        iny                                     ; C1C4 C8                       .
        tya                                     ; C1C5 98                       .
        sta     CARDBUF_03,x                    ; C1C6 9D 03 C0                 ...
        iny                                     ; C1C9 C8                       .
        tya                                     ; C1CA 98                       .
        sta     CARDBUF_04,x                    ; C1CB 9D 04 C0                 ...
        iny                                     ; C1CE C8                       .
        txa                                     ; C1CF 8A                       .
        sbc     #$07                            ; C1D0 E9 07                    ..
        tax                                     ; C1D2 AA                       .
        bne     LC1C0                           ; C1D3 D0 EB                    ..
LC1D5:  beq     LC217                           ; C1D5 F0 40                    .@
; Card back: jump to blit
BackDone:
        cpy     #$03                            ; C1D7 C0 03                    ..
; Check for Joker special case
CheckJoker:
        bne     PlacePips                       ; C1D9 D0 11                    ..
        cmp     #$6F                            ; C1DB C9 6F                    .o
        bne     PlacePips                       ; C1DD D0 0D                    ..
        ldx     #$5D                            ; C1DF A2 5D                    .]
        stx     CARDBUF_1E                      ; C1E1 8E 1E C0                 ...
        inx                                     ; C1E4 E8                       .
        stx     CARDBUF_1F                      ; C1E5 8E 1F C0                 ...
        inx                                     ; C1E8 E8                       .
        stx     CARDBUF_20                      ; C1E9 8E 20 C0                 . .
; Place suit pips using PIP_TABLE lookup
PlacePips:
        clc                                     ; C1EC 18                       .
        tya                                     ; C1ED 98                       .
        tax                                     ; C1EE AA                       .
LC1EF:
PipCalcLoop     := * + 2                        ; Calculate pip table offset (triangular number)
        stx     TEMP                            ; C1EF 8E 3F C0                 .?.
        adc     TEMP                            ; C1F2 6D 3F C0                 m?.
        dex                                     ; C1F5 CA                       .
        bpl     LC1EF                           ; C1F6 10 F7                    ..
        tax                                     ; C1F8 AA                       .
LC1F9:  pha                                     ; C1F9 48                       H
PipDrawLoop     := * + 1                        ; Read PIP_TABLE and place suit chars in buffer
        lda     PIP_TABLE,x                     ; C1FA BD 40 C0                 .@.
        tax                                     ; C1FD AA                       .
        lda     PARAM_SUIT                      ; C1FE AD 87 C0                 ...
        ora     #$60                            ; C201 09 60                    .`
        cpx     #$1C                            ; C203 E0 1C                    ..
        bcs     StorePip                        ; C205 B0 06                    ..
        cmp     #$62                            ; C207 C9 62                    .b
        beq     StorePip                        ; C209 F0 02                    ..
        ora     #$04                            ; C20B 09 04                    ..
; Store suit character at buffer position
StorePip:
        sta     CARDBUF,x                       ; C20D 9D 00 C0                 ...
        pla                                     ; C210 68                       h
        tax                                     ; C211 AA                       .
        dex                                     ; C212 CA                       .
        txa                                     ; C213 8A                       .
        dey                                     ; C214 88                       .
        bpl     LC1F9                           ; C215 10 E2                    ..
LC217:  lda     TXTPTR                          ; C217 A5 7A                    .z
; Copy card buffer to screen + color RAM
BlitCard:
        pha                                     ; C219 48                       H
        lda     TXTPTR_HI                       ; C21A A5 7B                    .{
        pha                                     ; C21C 48                       H
        lda     #$36                            ; C21D A9 36                    .6
        sta     TXTPTR_HI                       ; C21F 85 7B                    .{
; Calculate screen address: Y*40 + X
CalcScreenAddr:
        lda     PARAM_Y                         ; C221 AD 85 C0                 ...
        asl     a                               ; C224 0A                       .
        asl     a                               ; C225 0A                       .
        adc     PARAM_Y                         ; C226 6D 85 C0                 m..
        asl     a                               ; C229 0A                       .
        asl     a                               ; C22A 0A                       .
        rol     TXTPTR_HI                       ; C22B 26 7B                    &{
        asl     a                               ; C22D 0A                       .
        rol     TXTPTR_HI                       ; C22E 26 7B                    &{
        adc     PARAM_X                         ; C230 6D 84 C0                 m..
        sta     TXTPTR                          ; C233 85 7A                    .z
        bcc     LC239                           ; C235 90 02                    ..
        inc     TXTPTR_HI                       ; C237 E6 7B                    .{
LC239:
CalcColor       := * + 2                        ; Determine card color from suit
        lda     PARAM_SUIT                      ; C239 AD 87 C0                 ...
        lsr     a                               ; C23C 4A                       J
        cpy     #$0F                            ; C23D C0 0F                    ..
        beq     LC244                           ; C23F F0 03                    ..
        asl     a                               ; C241 0A                       .
        bcc     LC248                           ; C242 90 04                    ..
LC244:  tax                                     ; C244 AA                       .
BackColor       := * + 1                        ; Card back: get color from BACK_COLORS table
        lda     BACK_COLORS,x                   ; C245 BD 88 C0                 ...
LC248:  ldx     #$3E                            ; C248 A2 3E                    .>
; Start new row (Y=6, rightmost column)
BlitRow:ldy     #$06                            ; C24A A0 06                    ..
; Write one character: color to ColorRAM, char to ScreenRAM
BlitCol:sta     (TXTPTR),y                      ; C24C 91 7A                    .z
        pha                                     ; C24E 48                       H
        lda     TXTPTR_HI                       ; C24F A5 7B                    .{
        eor     #$DC                            ; C251 49 DC                    I.
        sta     TXTPTR_HI                       ; C253 85 7B                    .{
        lda     CARDBUF,x                       ; C255 BD 00 C0                 ...
        sta     (TXTPTR),y                      ; C258 91 7A                    .z
        lda     TXTPTR_HI                       ; C25A A5 7B                    .{
        eor     #$DC                            ; C25C 49 DC                    I.
        sta     TXTPTR_HI                       ; C25E 85 7B                    .{
        pla                                     ; C260 68                       h
        dex                                     ; C261 CA                       .
; Buffer done? If not, next column or next row
BlitNext:
        bmi     BlitDone                        ; C262 30 12                    0.
        dey                                     ; C264 88                       .
        bpl     BlitCol                         ; C265 10 E5                    ..
; Advance pointer by 40 (next screen row)
NextRow:pha                                     ; C267 48                       H
        lda     TXTPTR                          ; C268 A5 7A                    .z
        clc                                     ; C26A 18                       .
        adc     #$28                            ; C26B 69 28                    i(
        sta     TXTPTR                          ; C26D 85 7A                    .z
        pla                                     ; C26F 68                       h
        bcc     BlitRow                         ; C270 90 D8                    ..
        inc     TXTPTR_HI                       ; C272 E6 7B                    .{
        bcs     BlitRow                         ; C274 B0 D4                    ..
; Restore TXTPTR and return
BlitDone:
        pla                                     ; C276 68                       h
        sta     TXTPTR_HI                       ; C277 85 7B                    .{
        pla                                     ; C279 68                       h
        sta     TXTPTR                          ; C27A 85 7A                    .z
        rts                                     ; C27C 60                       `

; ----------------------------------------------------------------------------
