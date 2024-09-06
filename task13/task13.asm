
INCLUDE Irvine32.inc

	
.data


	n1 dd 23
	n2 dd 34
    result dd ?

    n3 dw 123
    n4 dw 45
    resultQuotient dw ?
    resultRemainder dw ?

    msg  db "Error - division by 0", 0 

AddMacro  macro param1,param2
      mov eax, param1
      add    eax, param2
      mov result, eax
      endm

SubtractMacro  macro param1,param2
      mov eax, 0
      add    eax, param1
      sub    eax, param2
      mov result, eax
      endm
         
MultiplyDDMacro  macro param1,param2
      mov eax, 0
      mov    eax, param1
      mul param2
      endm

DivideWordMacro macro param1, param2
    cmp param2, 0
    je ErrorLoop
    mov ax, param1
    div param2
    mov resultQuotient, ax
    mov resultRemainder, dx
    endm


.code
_main PROC
    

    AddMacro n1, n2
    SubtractMacro n1, n2

    MultiplyDDMacro n1, n2
    DivideWordMacro n3, n4
 

finished:
    int     3                    ; trap to enter debugger and check string.

ErrorLoop:

	mov edx, offset msg
	call writestring
    

_main endp
end _main
