.386
.model flat

move macro word, lenght, outputString

	MOV ESI, word 
	MOV EDI, outputString
	MOV ECX, lenght

	funcLoop:
		MOV [EDI], [ESI]
		INC EDI
		INC ESI
	LOOP funcLoop
ENDM

.DATA
	SIZE DD 0
.CODE
	func PROC
		PUSH EBP
		MOV EBX, [ESP+8]  ; читаем 1 переменную
		MOV ESI, EBX      ; сохраняем 1 переменную
		MOV EDP, [ESP+12] ; читаем 2 переменную
		MOV EDI, EDP	      ; сохраняем из byte
		MOV EBX, [ESP+16] ; читаем 3 переменную
		MOV SIZE, EBX        ; сохраняем из byte
		MOV ESP, ESI

		ADD ESI, EBX
		XOR EDX, EDX
		DEC ESI
		INC EDX
		FUNC:
			CMP [ESI], ' '
			JE FUNC2
			DEC ESI
			INC EDX

		FUNC2:
			INC ESI
			MOVE ESI, EDX, SIZE  ; вызываем макрокоманду
			SUB ESI, EDX
			CMP ESI, ESP
			JE EXIT
			DEC ESI
			MOV [EDI], ' '
			INC EDI
			MOV ECX, 2
			XOR EDX, EDX
		LOOP FUNC

		EXIT:
		POP EBP
		RET
	func ENDP
END
