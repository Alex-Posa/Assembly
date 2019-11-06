%include "io.inc"

section .data

    A DD 1h
    B DD 2h
    C DD 3h
    Counter DD 0h
    ERG DD 0h
    Erg_nach_schleife DD 0h
    
section .text
global CMAIN
CMAIN:
    ;write your code here
    mov edi, [Counter]
    
    berechnungs_schleife:
    mov eax, [A]
    mov ebx, [B]
    mov ecx, [C]
    mov edx, [ERG]
    
    
    sub eax, ebx
    JO exit
    add eax, [C]
    JO exit
    mov edx, eax
    JO exit
    INC edi
    
    SHL Dword [A], 1
    JO exit
    SHL Dword [B], 1
    JO exit
    SHL Dword [C], 1
    JO exit
    
    
    JMP berechnungs_schleife
    
    exit:
    
    mov esi, [Erg_nach_schleife]
    mov esi, edx 
    mov eax, [A]
    mov ebx, [B]
    mov ecx, [C]
    
    
    PRINT_HEX 4, eax
    NEWLINE
    PRINT_HEX 4, ebx
    NEWLINE
    PRINT_HEX 4, ecx
    NEWLINE
    
    PRINT_HEX 4, esi
    NEWLINE
    PRINT_HEX 4, edi
    
    xor eax, eax
    ret
