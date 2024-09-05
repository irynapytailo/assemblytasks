INCLUDE Irvine32.inc

.data
msg1 db "Enter the number:", 0
msg2  db "Result from recursion: ", 0
msg3  db "Result from loop: ", 0
msg4  db "Error! Negative numbers not supported ", 0
newline db " ", 13, 10, 0
resultRecursion DWORD ?
resultLoop DWORD ?
number DWORD ?
.code
main PROC
	
	mov edx, offset msg1
	call writestring
	call readint
	js finished
	mov number, eax
	call LOOPFACT
	mov resultLoop, eax

	mov eax, 0
	mov eax, number
	push eax			
	call Factorial		; calculate factorial (eax)
	mov resultRecursion, eax
	
	mov edx, offset msg2
	call writestring
	mov eax, resultRecursion
	call writeint

	mov edx, offset newline
	call writestring

	mov edx, offset msg3
	call writestring
	mov eax, resultLoop
	call writeint

	exit

	finished: 
	mov edx, offset msg4
	call writestring

main ENDP

LOOPFACT PROC
mov ebx,0  ; result
add ebx, eax
mov eax, 1


L1:
	mul ebx
	sub ebx, 1
	cmp ebx, 1
	jg L1
	ret

LOOPFACT ENDP

Factorial PROC
	push ebp
	mov  ebp,esp
	mov  eax,[ebp+8]	; get n
	cmp  eax,0		; n < 0?
	ja   L1			; yes: continue
	mov  eax,1		; no: return 1
	jmp  L2

L1:	dec  eax
	push eax			; Factorial(n-1)
	call Factorial



ReturnFact:
	mov  ebx,[ebp+8]   	; get n
	mul  ebx          	; ax = ax * bx

L2:	pop  ebp			; return EAX
	ret  4			; clean up stack
Factorial ENDP

END main
