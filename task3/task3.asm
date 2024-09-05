


.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data

num1 dword 45
num2 dword 65
num3 dword 345
max DWORD ?

.code 
main PROC

mov eax,num1
mov ebx, num2
mov ecx, num3


cmp eax, ebx
jg l1
cmp ebx, ecx
jg l3
mov max, ecx
jmp finished

l1: 
cmp eax, ecx
jg l2
mov max, ecx
jmp finished

l2: 
	mov max, eax
	jmp finished

l3: 
	mov max, ebx
	jmp finished

finished:
	invoke ExitProcess,0

main ENDP
END main
