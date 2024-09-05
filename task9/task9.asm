



INCLUDE Irvine32.inc


.data
a dd ?
b dd ?
buffer db 21 DUP(0)          ; input buffer
msg1  db "Enter first number:", 0
msg2 db "Enter second number: ", 0
msg3 db "Enter operation sign (+, -, *, /): ",0
msg4 db "Result is ", 0
msg5 db " with the remainder of ", 0
msg6 db "Incorrect synthax", 0
msg7 db "Error! Division by zero not allowed", 0
byteCount DWORD ? 
plussign db "+", 0
minussign db "-", 0
multiplysign db "*", 0
divisionsign db "/", 0
newline db " ", 13, 10, 0

.code
main PROC
	
	MAINLOOP:
	mov edx, offset newline
	call writestring
	mov edx, offset msg1
	call writestring
	call readint
	mov a, eax
	mov edx, offset msg2
	call writestring
	call readint
	mov b, eax

	mov edx, offset msg3
	call writestring
	MOV     EDX, OFFSET buffer     ; pointer
    MOV     ECX, SIZEOF buffer ; max byte count, not including terminating 0
    call    ReadString
	mov   byteCount,eax 

	mov eax, 0
	mov ebx, 0
	mov ah, buffer[0]
	mov al, plussign[0]
	cmp ah, al
	je ADD1
	mov al, 0
	cmp ah, minussign[0]
	je SUBTRACT
	mov al, 0
	cmp ah, multiplysign[0]
	je MULTIPLY
	mov al, 0
	cmp ah, divisionsign[0]
	je DIVIDE
	mov edx,0
	mov edx, offset msg6
	call writestring
	jmp MAINLOOP

	ADD1:
	mov eax, a
	mov ebx, b
	add eax, ebx
	mov edx, offset msg4
	call writestring
	call writeint
	jmp MAINLOOP

	SUBTRACT:
	mov eax, a
	mov ebx, b
	sub eax, ebx
	mov edx, offset msg4
	call writestring
	call writeint
	jmp MAINLOOP

	MULTIPLY:
	mov edx, offset msg4
	call writestring
	mov eax, a
	mov ecx, b
	mul b
	call writeint
	jmp MAINLOOP



	DIVIDE:
	cmp b, 0
	je DIVBYZERO
	mov edx, offset msg4
	call writestring
	mov eax, 0
	mov edx,0
	mov ecx,0
	mov eax, a
	mov ecx, b
	div b
	mov ecx, 0
	mov ecx, edx
	call writeint
	mov edx, offset msg5
	call writestring
	mov eax, 0
	mov eax, ecx
	call writeint
	jmp MAINLOOP

	DIVBYZERO:
	mov edx, offset msg7
	call writestring
	jmp MAINLOOP


main ENDP
END main
