dowaves:
 ldx #192			;how many scalines to wave
 ldy wavefrm
 inc wavefrm		;increase wave offset
@nope
 lda paralaxtbl,y
 sta $2005		;this write updates t horizontal component

 lda $2002			;this will reset $2005 toggle
 
 iny
 tya
 and #$1f
 tay
 and #1				;every other scanline compensate for too many dots lost.
 bne @bne1
 nop
@bne1				;now, we need to burn some cpu cycles while ppu is rendering visible portion of the scanline
 nop
 txa
 ldx #15			;wait for majority of scanline
@lp
 dex
 bne @lp
 tax
 dex
 bne @nope
 rts

paralaxtbl:
 db $00,$00,$01,$01		;this table holds values we write to $2005.
 db $02,$02,$03,$03
 db $04,$04,$05,$05
 db $06,$06,$07,$07
 db $07,$07,$06,$06
 db $05,$05,$04,$04
 db $03,$03,$02,$02
 db $01,$01,$00,$00
