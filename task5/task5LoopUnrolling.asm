.586

.model flat

.data
    warray DD 23, 8, 10, 4, 65, 117, 98, 34, 10, 344, 78, 65, 70, 13, 321
    result DD 0



.code
_main PROC

    mov ecx, LENGTHOF warray
    mov eax, 0
    mov ebx, 0
    mov edx, 0
    add eax, warray[ebx] 
    mov result, eax
    
    ;multiplicity factor is 4
    

    ;eax stores current value
    ;ebx stores current index
    ;ecx stores array length
   


    LOOPUNROLLED: 
    sub ecx, 4
    cmp ecx, 0
    js addFour
    jz finished


    add ebx, 4
    mov eax, 0
    add eax, warray[ebx]

    iter1:
    cmp eax, result
    jg changeResult1

    iter2:
    add ebx, 4
    mov eax, 0
    add eax, warray[ebx]
    cmp eax, result
    jg changeResult2

    iter3:
    add ebx, 4
    mov eax, 0
    add eax, warray[ebx]
    cmp eax, result
    jg changeResult3

    
    iter4:
    add ebx, 4
    mov eax, 0
    add eax, warray[ebx]
    cmp eax, result
    jg changeResult4

    jmp LOOPUNROLLED

changeResult1:
    mov result, eax
    jmp iter2

changeResult2:
    mov result, eax
    jmp iter3

changeResult3:
    mov result, eax
    jmp iter4

changeResult4:
    mov result, eax
    jmp LOOPUNROLLED
    
changeResultRemained:
    mov result, eax
    jmp ALLTHATREMAINED

addFour:
  add ecx, 4
  jmp ALLTHATREMAINED

    ALLTHATREMAINED:
    sub ecx, 1
    cmp ecx, 0
    jz finished
    js finished
    add ebx, 4
    mov eax, 0
    add eax, warray[ebx]
    cmp eax, result
    jg changeResultRemained
    jmp ALLTHATREMAINED




finished:
    int     3                    ; trap to enter debugger and check string.


_main endp
end _main
