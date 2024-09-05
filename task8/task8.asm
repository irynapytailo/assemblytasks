.586




INCLUDE Irvine32.inc
	
.data

 msg1  db "Input array:", 0
 newline db " ", 13, 10, 0
  warray DB 6, 5, 3, 1, 8, 7, 2, 4
   msg2  db "Sorted array:", 0
  \


;db 8 bits
;dw 16 bits
;dd 32 bits





.code
_main PROC

    mov edx, offset msg1
	call writestring
    mov edx, offset newline
	call writestring

  
    call OUTPUT
    mov ecx, 0
    add ecx, LENGTHOF warray
    sub ecx, 2
    mov ebx, 0
    add ebx, 0
    mov al, 0


    l1:
    cmp ebx, ecx
    jg RESTART
    mov ah, 0
    add ah, warray[ebx]
    mov dh, 0
    add dh, warray[ebx + 1]
    inc ebx
    cmp ah, dh
    jg SWAP
    jmp l1

    
    SWAP:

    mov warray[ebx], 0
    mov warray[ebx - 1], 0

    mov warray[ebx], ah
    mov warray[ebx -1], dh

    add al, 1
    jmp l1

    RESTART:
    cmp al, 0
    je finished
    mov al, 0
    mov ebx, 0
    jmp l1
 


finished:
    mov edx, offset newline
	call writestring
    mov edx, offset msg2
	call writestring
    mov edx, offset newline
	call writestring

    call OUTPUT
    int     3                    ; trap to enter debugger and check string.

 
OUTPUT PROC

    mov eax, 0
   mov ecx, LENGTHOF warray
   mov edx, 0

    mov edi, 0
    ITERATE:
   
    movzx eax, warray[edi]
    call writeint
    mov eax, 0
    add edi, TYPE warray
    inc edx
    cmp edx, ecx
    jl ITERATE
    ret

OUTPUT ENDP


_main endp
end _main
