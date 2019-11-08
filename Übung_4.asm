
%include "io.inc"


section .data

    ;instead of setting 0h 
    ;we need to set all 4 bytes to 0, hence the 8 zeroes
    ; put the numbers you want to add after the zeroes

    first_num  DD 000000255h
    second_num DD 000000255h
    
    ;the product of the two variables will need 8 bytes
    ; DQ for 8 bytes // DD for 4 bytes
     
    product    DQ 0000000000000000h



section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    
    GET_HEX 4,  [first_num]
    GET_HEX 4, [second_num]
    
    ; Usage of registers starts here, set them to zero to
    ; clear(overwrite) any other data
    
    ; eax for first number
    mov eax, 0
    ; ebx for second number
    mov ebx, 0
    ; ecx for possible overflow
    mov ecx, 0
   
    mov ebx, [second_num]
    
    loop_target:
    add eax, [first_num]
    
    jnc overflow
    ; jump not carry if the register would overflow
    add ecx, 1
    jmp loop_target
    
    overflow:
    
    mov DWORD [product], eax
    mov DWORD [product+4], ecx
    
    PRINT_HEX 4, [product+4]
    PRINT_HEX 4,   [product]
    
    xor eax, eax
    ret
