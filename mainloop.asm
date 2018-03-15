startmainloop
 lda #$3F
 sta PPUADDR
 lda #0
 sta PPUADDR
 lda pal
 sta PPUDATA
 lda pal+1
 sta PPUDATA
 lda pal+2
 sta PPUDATA
 lda pal+3
 sta PPUDATA	;upload palete data to PPU

 ldxy #$2000
 stx PPUADDR
 sty PPUADDR

 ldxy nametable
 stx addr+1
 sty addr
 ldxy 0
@loadmap
 lda (addr),y
 sta PPUDATA
 iny
 bne @loadmap
 inc addr+1
 inx
 cpx #4
 bne @loadmap	;upload nametable

 lda #%10000000
 sta ppu0
 sta control0
 lda #%00011110
 sta ppu1		;setup ram values to be used in nmi handler
 
infinite
 lda global
-
 cmp global
 beq -			;wait for a frame to pass
 
 jsr dowaves
 jmp infinite 

nametable:
 incbin "nametable.nam"
pal:
 hex 0f091a2a