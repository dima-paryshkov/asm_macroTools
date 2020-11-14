.386
.model flat,C

qwer MACRO wrd, lenght, outputString

	MOV ESI, wrd 
	MOV EDI, outputString
	MOV ECX, lenght

	funcLoop:
		MOV EDX, [ESI]
		MOV [EDI], EDX
		INC EDI
		INC ESI
	LOOP funcLoop
ENDM

.DATA
	SIZ DD ?
.CODE
	func PROC
		PUSH EBP
		MOV EBX, [ESP+8] 
		MOV ESI, EBX     
		MOV EBX, [ESP+12] 
		MOV EDI, EBX	      
		MOV EBX, [ESP+16] 
		MOV SIZ, EBX       
		MOV ESP, ESI

		ADD ESI, EBX
		XOR EDX, EDX
		;DEC ESI
		;INC EDX

		FUNC0:
			MOV CL, 32
			MOV CH, [ESI]
			CMP CL, CH
			JE FUNC2
			DEC ESI
			INC EDX
		LOOP FUNC0

		FUNC2:
			INC ESI
			qwer ESI,EDX,EDI 
			SUB ESI, EDX
			CMP ESI, ESP
			JE EXIT
			DEC ESI
			MOV ECX, 32
			MOV [EDI], ECX
			INC EDI
			XOR EDX, EDX
		LOOP FUNC0
		EXIT:
		POP EBP
		RET
	func ENDP
END
