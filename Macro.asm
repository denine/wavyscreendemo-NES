PPUADDR = $2006
PPUDATA = $2007
spriteblock = $700
dmafunc = $4014
control0 = $2000
control1 = $2001
scrollcon = $2005

nmask=	$00
rmask=	$01
lmask=	$02
dmask=	$04
umask=	$08
stmask=	$10
selmask=$20
bmask=	$40
amask=	$80
;---------------------------------------------------------------
macro ldxy var		;Adres do X(high) i Y(low)

 ldx #>(var)
 ldy #<(var)

 .endm

;-----------------------
macro add var
 clc
 adc var

 .endm

;-----------------------
macro sub var
 sec
 sbc var

 .endm

;-----------------------
macro nega
 eor #255
 clc
 adc #1

 .endm