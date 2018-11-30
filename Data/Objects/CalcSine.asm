; ---------------------------------------------------------------------------
; Calculates the sine and cosine of the angle in d0 (360 degrees = 256)
; Returns the sine in d0 and the cosine in d1 (both multiplied by $100)
; Optimized by Natsumi
; ---------------------------------------------------------------------------

SineTableCos		= SineTable+($40*2)-16
SineTableSin		= SineTable-16

; =============== S U B R O U T I N E =======================================

CalcSine:
GetSineCosine:
		andi.w	#$FF,d0
		addq.w	#8,d0
		add.w	d0,d0
		move.w	SineTableCos(pc,d0.w),d1
		move.w	SineTableSin(pc,d0.w),d0
		rts
; End of function GetSineCosine
; ---------------------------------------------------------------------------

SineTable:	binclude	"Misc Data/Sine.bin"
	even