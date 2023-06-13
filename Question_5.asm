org 0x7c00
jmp _start

_start:
    xor ax,ax
    xor si, si
    xor bx, bx
    xor cx, cx
    xor dx, dx
    
    call getchar
    call endl
    
    call getinput
    
    xor cx, cx
    mov cx, 1
    xor bx, bx
    xor ax, ax
    mov ax, 1
    push ax
    push ax
    call fib
    
    call done
    
getchar:
    xor ax, ax
    mov ah, 0x00 
    int 16h
    
    cmp al, 0x0d
    jmp .done
    
    inc cl
    
    call putchar
    
    sub al, '0' 
    stosb
    
    call getchar
    
    .done: 
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
    
getinput:
    cmp cl, 2
    jmp .dez
    
    lodsb
    mov dx, ax
    jmp .done
    
    .dez:
        xor cx, cx
        lodsb
        mov bx, ax
        imul bx, 10
        add dl, bl
        lodsb
        xor bx, bx
        mov bx, ax
        add dl, bl
        ret
        
    .done:
        ret
        
fib:
    inc cx
    cmp cx, dx
    je .mod11

    pop ax
    
    add bx, ax
    
    pop ax
    
    add bx, ax
    
    push bx
    
    push ax
    
    xor bx, bx
    
    jmp fib
    
    .mod11:
        cmp ax, 11
        jb .done
        
        sub ax, 11
        jmp .mod11
        
        .done:
            call putchar
            ret
    
done:
    jmp $
    
times 510 - ($ - $$) db 0
dw 0xaa55
