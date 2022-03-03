;
; ASM_AULA_SEM.asm
;
; Created: 03/03/2022 16:21:28
; Author : icaro
;
.org 0x00

; Replace with your application code
setup:
    ldi r16  , 0x80
	out DDRD , r16
	ldi r16  , 0x00
	out PORTD, r16
	clr r16

	ldi r16  , 0x40
	out DDRD , r16
	ldi r16  , 0x00
	out PORTD, r16
	clr r16 

	ldi r16  , 0x20
	out DDRD , r16
	ldi r16  , 0x00
	out PORTD, r16
	clr r16

	ldi r18  , 0x80
	ldi r19	 , 0x40
	ldi r20  , 0x20
	ldi r21  , 0x00


	nop

loop:
	rjmp D7

	dec r22      ;se decrementar duas vezes
	breq load22  ;inverte a  porta e reinicia o contador

	dec r23		;se decrementar duas vezes
	breq load23	;inverte a  porta e reinicia o contador

	rjmp delay_ms ;delay 1ms
	
	
	rjmp loop



delay_ms:                   ;sub-rotina de delay 

    ldi r17,2               ; 1 ciclo (62.5 ns)
     
aux1:
    ldi   r16,250           ; 1 ciclo (62,5 ns)

aux2:
    nop                     ; 1 ciclo (62,5 ns)
    nop                     ; 1 ciclo (62,5 ns)
    nop                     ; 1 ciclo (62,5 ns)
    nop                     ; 1 ciclo (62,5 ns)
    nop                     ; 1 ciclo (62,5 ns)
    nop                     ; 1 ciclo (62,5 ns)
    nop                     ; 1 ciclo (62,5 ns)
    nop                     ; 1 ciclo (62,5 ns)
    nop                     ; 1 ciclo (62,5 ns)
    nop                     ; 1 ciclo (62,5 ns)
    nop                     ; 1 ciclo (62,5 ns)
    nop                     ; 1 ciclo (62,5 ns)
    nop                     ; 1 ciclo (62,5 ns)
    nop                     ; 1 ciclo (62,5 ns)
    nop                     ; 1 ciclo (62,5 ns)
    nop                     ; 1 ciclo (62,5 ns)
    nop                     ; 1 ciclo (62,5 ns)
    nop                     ; 1 ciclo (62,5 ns)
    nop                     ; 1 ciclo (62,5 ns)
    nop                     ; 1 ciclo (62,5 ns)
    nop                     ; 1 ciclo (62,5 ns)
    nop                     ; 1 ciclo (62,5 ns)
    nop                     ; 1 ciclo (62,5 ns)
    nop                     ; 1 ciclo (62,5 ns)
    nop                     ; 1 ciclo (62,5 ns)
    nop                     ; 1 ciclo (62,5 ns)
    nop                     ; 1 ciclo (62,5 ns)
    nop                     ; 1 ciclo (62,5 ns)
    dec   r16               ; 1 ciclo (62,5 ns)
    breq  dec_r17           ; 1 ciclo (62,5 ns)
    rjmp  aux2              ; 2 ciclos | TOTAL 32 ciclos
                            ; 250 x 32 = 8000 ciclos

dec_r17:
    dec   r17               
    breq  end_100ms        
    rjmp  aux1              
                            ; 8 x 8000 = 64000
                            ; 1.6E3 x 62.5ns = 2ms
end_100ms: 
    ret     
	
D7:
	eor r21  , r18
	out PORTD, r21 ;portd7 1khz
	ret

D6:
	eor r21  , r19
	out PORTD, r21 ;portd6 500hz
	ret

D5:
	eor r21  , r20
	out PORTD, r21 ;portd5 250hz
	ret

load22:
	ldi r22  , 0x02
	rjmp D6
	ret

load23:
	ldi r23  , 0x04
	rjmp D5
	ret                
