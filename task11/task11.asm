INCLUDE Irvine32.inc


.data


newline db " ", 13, 10, 0
msg7  db "Enter expression:", 0
msg8  db "Finished", 0
input db ?
MAX = 80                     ;max chars to read
stringIn db MAX+1 DUP (?)  ;room for null
result dd ?
otherarg dd ?
twooperands dd ?
msg9  db "Error - invalid operands", 0
noughts dd ?
tens dd ?
hundreads dd ?


.code
main PROC
	
	MAINLOOP:
	mov edx, offset newline
	call writestring
	mov edx, offset msg7
	call writestring
	
    mov  edx,OFFSET stringIn
    mov  ecx,MAX            ;buffer size - 1
    call ReadString
	
	mov eax, 0
	mov esi, 0
	mov edi, 0
	mov edx, 0  ; 0 - ones, 1 - tens, 2 - hundreads
	mov ecx, 0 ; current number
	add ecx, 0
	mov dl, 0 ; current sign 1 for minus 2 for plus
	mov result, 0
	mov  twooperands , 0
	mov dh, 0

	
	L1:
		movzx eax, stringIn[esi]
		mov bl, 0
		cmp al, bl
		je DECRESI
		inc esi


	  cmp al, '+'
	je MAKEANUMBER
	cmp al, '-'
	je MAKEANUMBER


	cmp dh, 0
	je NOUGHTS1
	cmp dh, 1
	je TENS1
	  	

	loop L1

	DECRESI:
		
		dec esi
		add dl, 3

		jmp MAKEANUMBER
	
	  
	NOUGHTS1:
	inc dh
	sub al, '0'
	mov noughts, eax
	jmp L1

	TENS1:
	inc dh
	sub al, '0'
	mov tens, eax
	jmp L1

	MAKEANUMBER:

	cmp dh, 1
	je ONE
	cmp dh, 2
	je TWO
	
	
	
	ONENEG:

	mov eax, 0
	add eax, 43
	push eax


	mov eax, 0
	add eax, noughts
	NEG eax
	push eax

	cmp dl, 3
	je STRINGPROCESSED
	mov eax, 0
	movzx eax, stringIn[esi-1]
	push eax
	mov dh, 0
	mov noughts, 0
	mov tens, 0
	jmp L1
	 

	ONE:

	mov eax, 0
	pop eax
	cmp eax, 45
	je ONENEG

	push eax


	mov eax, 0
	add eax, noughts
	push eax

	cmp dl, 3
	je STRINGPROCESSED
	mov eax, 0
	movzx eax, stringIn[esi-1]
	push eax
	mov dh, 0
	mov noughts, 0
	mov tens, 0
	jmp L1

	TWONEG:

	
	mov eax, 0
	add eax, 43
	push eax


	mov bh, 0
	add bh, 10
	mov eax, 0
	mov eax, noughts
	mul bh
	add eax, tens
	NEG eax
	push eax
	
	cmp dl, 3
	je STRINGPROCESSED

	mov eax, 0
	movzx eax, stringIn[esi-1]
	push eax



	mov dh, 0
	mov noughts, 0
	mov tens, 0
	cmp dl, 3
	je STRINGPROCESSED
	jmp L1


	TWO:

	mov eax, 0
	pop eax
	cmp eax, 45
	je TWONEG

	push eax


	mov bh, 0
	add bh, 10
	mov eax, 0
	mov eax, noughts
	mul bh
	add eax, tens
	push eax
	
	cmp dl, 3
	je STRINGPROCESSED

	mov eax, 0
	movzx eax, stringIn[esi-1]
	push eax



	mov dh, 0
	mov noughts, 0
	mov tens, 0
	cmp dl, 3
	je STRINGPROCESSED
	jmp L1

	STRINGPROCESSED:

	jmp FINISHLOOP


	finished:
	mov eax, 0
	add eax, ebx
	call writeint





	int 3

	FINISHLOOP:

	mov eax, 0
	pop eax
	mov ebx, 0
	add ebx, eax ; 0p1
	mov eax, 0
	pop eax  ; sign
	cmp eax, 43
	je PLUS
	cmp eax, 45
	je MINUS

	jmp finished

	PLUS:
	mov eax, 0
	pop eax ; op2
	add eax, ebx
	push eax
	jmp FINISHLOOP

	MINUS:
	mov eax, 0
	pop eax
	sub eax, ebx
	push eax
	jmp FINISHLOOP

	

main ENDP
END main
