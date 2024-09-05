.586

.model flat

.data
    warray DD 44, 38, 12, 0, 99
    result DD 0



.code
_main PROC

    mov ecx, LENGTHOF warray
    mov eax, 0
    mov ebx, 0
    mov edx, 0
    add eax, warray[ebx]
    mov result, eax
    add ebx, TYPE warray
    inc edx


    L1: 
    cmp edx, ecx
    je finished
    mov eax, 0
    add eax, warray[ebx]
    add ebx, TYPE warray
    inc edx
    cmp eax, result
    jg changeResult
    jmp L1

changeResult:
    mov result, eax
    jmp L1
    


finished:
    int     3                   


_main endp
end _main
