		; ERIKA VAZQUEZ CS343
		ORG 	00
		JMP 	MAIN
		ORG 	30H
MAIN:
		LCALL SUBR1
		LCALL SUBR2
		LCALL SUBR3
		
		
SUBR1:		
		MOV 	DPTR, #100H
		MOV 	A, #4
		MOV 	DPTR, #105H
		MOV 	B, #8
		ADD 	A,B
		MOV 	40H, A
		MOV 	P2, A
		RET
		
SUBR2:		
		MOV 	DPTR, #101H
		MOV 	A, #-12
		MOV 	DPTR, #106H
		MOV 	B, #18
		ADD 	A,B
		MOV 	41H, A
		MOV 	P1, A
		RET
		
SUBR3:		
		MOV 	DPTR, #102H
		MOV 	A, #66
		MOV 	DPTR, #107H
		MOV 	B, #69
		ADD 	A,B
		MOV 	42H, A
		MOV 	P0, A
		RET

		JNB 	OV, NOOV
		MOV 	A, #1
		MOV 	43H, A
		MOV 	P3, A
		SJMP 	$
NOOV: 
		MOV 	A, #0
		MOV 	P3, A
		
		JMP $
		
		END