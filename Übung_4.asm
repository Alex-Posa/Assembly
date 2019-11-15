%include "io.inc"


section .data

; change numbers below when needed

first_number  DD 0xABCDEF
second_number DD 0xFFFFFFFF
product       DQ 0x0



section .text
global CMAIN
CMAIN:
    ;write your code here
    
    mov eax, 0
    mov ebx, 0
    mov edx, 0
    mov ecx, 0
    mov ecx, [second_number]
    
    addition_loop:
    add eax, [first_number]
    
    jnc no_overflow
    add edx, 1
    
    no_overflow:
    Loop addition_loop
    
    
    mov DWORD [product],   eax
    mov DWORD [product+4], edx
    
    PRINT_HEX 4, [product+4]
    PRINT_HEX 4,   [product]
    
    
    xor eax, eax
    ret
