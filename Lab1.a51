		ORG 	00
		JMP 	MAIN
				; MACROS MUST BE DEFINED BEFORE USE IN THE SOURCE CODE
		BLOCK1 	MACRO 	;START OF A REPEAT BLOCK 1
		CLR 	A 
		MOVC 	A, @A+DPTR
		MOV 	B,A
		ENDM

		BLOCK2 	MACRO 	;START OF A REPEAT BLOCK 2
		CLR 	A
		MOVC 	A, @A+DPTR
		MOV 	C, 00
		ADD 	A,B
		MOV 	00, C
		ENDM

		ORG 	30H
MAIN:
		MOV 	P0, #0
		MOV 	P1, #0
		MOV 	P2, #0
		MOV 	P3, #0
		CLR 	00
	
		MOV 	DPTR, #100H 
				BLOCK1
		MOV 	DPTR, #105H
				BLOCK2
		MOV 	40H, A
		MOV 	P2, A
	
	
		MOV 	DPTR, #101H
				BLOCK1
		MOV 	DPTR, #106H
				BLOCK2
		MOV 	41H, A
		MOV 	P1, A
		
		
		MOV 	DPTR, #102H
				BLOCK1
		MOV 	DPTR, #107H
				BLOCK2
		MOV 	42H, A
		MOV 	P0, A
	
	
		JNB 	OV, NOOV
		MOV 	A, #1
		MOV 	43H, A
		MOV 	P3, A
		JMP 	WAIT
NOOV: 
		MOV 	A, #0
		MOV 	P3, A
WAIT: 	JMP $
		
		ORG 	100H
		DB 		0, 18, 69
		ORG		105H
		DB		66, -12, 66
		END
			
	
	