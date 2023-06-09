org 0x7c00
jmp _start

buffer times 64 db 0

BITS 16

_start:
    mov si, buffer
    xor ax, ax 
    xor bx, bx
    xor cx, cx 
    xor dx, dx 
    
    call getstring
    call endl
    call letter
    call endl
    call printcount
    call done
    
getstring:
    call getchar
    call putchar
    cmp al, 0x0d
    je .done
    inc cl 
    stosb
    inc si
    
    jmp getstring
    
    .done:
        ret
            
endl: 
    mov ax, 0x0a
    call putchar
    mov ax, 0x0d
    call putchar
    ret
        
letter:
    call getchar
    mov bl, al
    call putchar
    ret
        
printcount:
    mov cx, 0x0e
    int 10h
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
    
    
    

