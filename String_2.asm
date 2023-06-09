org 0x7c00
jmp _start

BITS 16

_start:
    xor ax, ax
    
    call getstring
    call done
    
getstring:
    mov ah, 0x00 
    int 16h
    call putchar
    cmp al, 0x0d 
    je .endl
    jmp getstring
    
    .endl:
        mov ax, 0x0a
        call putchar
        mov ax, 0x0d
        call putchar
        jmp .letter
        
        .letter:
            call getchar
            call putchar
            ret
        
putchar:
    mov ah, 0x0e
    int 10h
    ret
    
getchar:
    mov ah, 0x00 
    int 16h
    ret
    
done:
    jmp $
    
times 510 - ($ - $$) db 0
dw 0xaa55
    
    
    
