%define org_address 0x07c00

[BITS 16] 
[ORG org_address] ; sets the org_address to a specific adress, which will be the start adress of the programm

section .data
hello: db "Hello World",0 ; nullterminator [in C:('\0')]

;EQU defines a symbol to a given constant value($)
;define the given label name(hello) to the value
;cannot be changed later
hello_len equ $-hello 

section .text
start:
	
    mov ah, 0x13  ;Eine Zeichenkette ab einer bestimmten Stelle und einer bestimmten Monitorseite ausgeben.
    mov al, 0x01  ;Attribut in BL und die Cursor-Position aktualisieren; char setzen und eins weiter rechts
	
    mov bl, 0x07 ;Attribut-Byte der Zeichen im Modi 0 und 1
    mov bh, 0x00 ;Bildschirmseite
	
	;set counter register to the length of hello_len-1
    mov cx, hello_len - 1
	
	;clearing registers for interrupt calls
    xor dx, dx ; setzt die spalten und zeilen vom bildschirm auf 0 (also auf oben links beim bildschirm)
	
    xor bp, bp ;clearing basepointer
	
    mov es, bp ; baspointer auf extra segment schieben
    mov bp, hello ;
    int 0x10 ; interrupt 
    
halt: 

    hlt 	 ;hält die CPU bis zum nächsten externen interrupt (keyboard)
    jmp halt


section .magic start=(org_address + 510)
db 0x55
db 0xaa
