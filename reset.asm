reset:
 sei
 cld
 lda #$40
 sta $4017
 
 ldx #$FF
 txs
 inx
 stx $2000
 stx $2001
 stx $4010
 stx addr
 stx addr+1
 
@wait1:
 bit $2002
 bpl @wait1
 
@wait2:
 bit $2002
 bpl @wait2
 
@wait3:
 bit $2002
 bpl @wait3
 
 ldy #0
clearram:
@2
 lda #0
@1
 sta (addr),y
 iny
 bne @1
@3
 inc addr+1
 lda addr+1
 cmp #8
 bne @2
 
 
 jmp startmainloop