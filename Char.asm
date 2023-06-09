org 0x7c00
jmp _start

BITS 16

_start:
    xor ax, ax
    
    mov ah, 0
    mov bh, 12h
    int 10h
    
    mov ah, 0xb
    mov bh, 0
    mov bl, 1h
    int 10h
    
    xor ax, ax
    
    call getchar
    call putchar
    
    jmp done
    
getchar:
    mov ah, 0x00 
    int 16h
    ret
    
putchar:
    mov ah, 0x0e
    int 10h
    ret
    
done:
    jmp $
    
times 510 - ($ - $$) db 0
dw 0xaa55

