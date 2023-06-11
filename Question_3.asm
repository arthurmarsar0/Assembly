
org 0x7c00
jmp _start

_start:
    xor ax, ax
    xor si, si
    
    call getchar
    call endl
    
    xor ax, ax
    call getchar
    call endl

    xor ax, ax
    call getchar
    call endl
    
    xor ax, ax
    call getchar
    call endl
    
    xor ax, ax
    xor si, si
    call teste
    
    call done
    
getchar:
    mov ah, 0x00 
    int 16h
    call putchar
    
    sub al, '0'
    
    stosb
    
    add al, '0'
    
    ret
    
putchar:
    mov ah, 0x0e
    int 10h
    ret
    
endl:
    mov ah, 0x0a
    call putchar
    mov ah, 0x0d
    call putchar
    ret
    
teste:
    lodsb
    cmp al, 0
    je .done
    add ax, '0'
    call putchar
    call endl
    jmp teste
    
    .done:
        ret
    
done:
    jmp $
    
times 510 - ($ - $$) db 0
dw 0xaa55




