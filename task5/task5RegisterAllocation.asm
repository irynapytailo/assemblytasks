.586

.model flat

.data
    warray DD 44, 38, 12, 0, 99, 119, 5, 76
    result DD 0



.code
_main PROC

    mov ecx, LENGTHOF warray
    mov eax, 0
    mov edi, 0
    mov ebx, 0
    mov edx, 0
    add eax, warray[edi]
    mov ebx, eax
    add edi, TYPE warray
    inc edx


    L1: 
    cmp edx, ecx
    je finished
    mov eax, 0
    add eax, warray[edi]
    add edi, TYPE warray
    inc edx
    cmp eax, ebx
    jg changeResult
    jmp L1

changeResult:
    mov ebx, eax
    jmp L1
    


finished:   
    mov result, ebx
    int     3                   


_main endp
end _main
