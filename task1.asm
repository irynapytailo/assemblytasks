;Task 1: Add 3 integers


.386
.model flat


.data

num1 DWORD 7  ; declare first int
num2 DWORD 45 ; declare second int
num3 DWORD 65 ;declare third int
sum DWORD ?   ; variable to store result

.code 
main PROC

mov eax, 0
mov eax, num1
add eax, num2
add eax, num3
mov sum, eax

finished:
int 3

main ENDP
END main