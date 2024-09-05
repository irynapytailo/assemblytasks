
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
source byte "i love assembler",0
nameSize = ($ - source) - 1

.code
main proc

; Push the name on the stack.

mov	 ecx,nameSize
	mov	 esi,0

L1:	movzx eax,source[esi]	
	push eax				; push character on stack
	inc	 esi
	loop L1



mov	 ecx,nameSize
	mov	 esi,0

L2:	pop  eax				; get character
	mov	 source[esi],al		; store in string
	inc	 esi
	loop L2

	Invoke ExitProcess,0
main endp
end main
