%define org_address 0x07c00

[BITS 16]
[ORG org_address]

section .dataS
line db 0x00

hello db "Hello!",0
hello_len equ $-hello 

section .text
start:
    ; EXERCISE: 
    ;   TASK: register isr0 for interrupt 0
    ;   QUESTION: which command triggers an interrupt
    cli 
    ;---- fill in your code below ---
    ;MOV STUFF AROUND
    ; 0000h , wir brauchen nur 2 bytes weil wir ohne segments arbeiten
    
    ;cli

        ;Offset
        ;Die Adresse unserer Interrupt Service Routine

        ;mov WORD [es:0], __int0x00

    ;sti  
    ;jmp isr0
    
    
    ;---- fill in your code above ---
    sti 

    ; call ISR for interrupt 0 
    int 0

    ; EXERCISE: 
    ;   TASK: perform a calculation that triggers interrupt 0 without using the "int" command.
    ;   QUESTION: why is it looping?
    ;---- fill in your code below ---
    
    ;in(something)
    
    
    ;out(something)


    ;---- fill in your code above ---

halt: ; stop cpu and wait for interrupts
    hlt
    jmp halt

isr0:
    mov bx,hello
    mov cx,hello_len - 1
    call output

    iret

output:
    push bp
    mov bp,sp

    push bp       ; save current bp
    mov bp, bx    ; move string start address to bp 

    xor bx, bx    ; bx = 0
    mov es, bx    ; es = bx = 0

    mov ah, 0x13  ; use function 13h
    mov al, 0x01  ; mode 1
    
    mov bl, 0x07  ; color: white
    mov bh, 0x00  ; screen page 0

    mov dl, 0x00  ; set column
    mov dh, [line] ; set line
    inc byte [line] 

    int 0x10 

    pop bp        ; restore bp

    leave
    ret

section .magic start=(org_address + 510)
db 0x55
db 0xaa
