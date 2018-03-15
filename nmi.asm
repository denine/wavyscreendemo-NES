nmi:
 pha
 txa
 pha
 tya
 pha
 
 inc global
 
 lda #>spriteblock	;do a sprite DMA
 sta dmafunc
 
 lda #$20
 sta PPUADDR
 sta PPUADDR
  
 lda #0
 sta scrollcon
 sta scrollcon
 
 lda ppu0
 sta control0
 lda ppu1
 sta control1
 
 pla
 tay
 pla
 tax
 pla
 
break
 rti