;----------------------------------------------------------------
; constants
;----------------------------------------------------------------
 include "Macro.asm"
;----------------------------------------------------------------
; variables
;----------------------------------------------------------------
   .enum 0
global: dsb 1
ppu0: dsb 1
ppu1: dsb 1
spriteblockpointer: dsb 1

addr: dsb 2
addr2: dsb 2
addr3: dsb 2

wavefrm: dsb 1
   .ende

;----------------------------------------------------------------
; iNES header
;----------------------------------------------------------------

   .db "NES", $1a ;identification of the iNES header
   .db $1 ;number of 16KB PRG-ROM pages
   .db $01 ;number of 8KB CHR-ROM pages
   .db $00|%0001 ;mapper 2 and mirroring
   .dsb 9, $00 ;clear the remaining bytes

;----------------------------------------------------------------
   .base $c000
    include "reset.asm"
	include "nmi.asm"
	include "mainloop.asm"
	include "wavecode.asm"
	
	.org $FFFA
	dw nmi
	dw reset
	dw break
	
	incbin "gfx.chr"