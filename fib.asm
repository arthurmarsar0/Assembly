org 0x7c00
jmp _start
vector db 1, 1, 2, 3, 5, 8, 2, 10, 1, 0
_start:
    xor ax,ax
    xor bx, bx
    xor cx, cx

    mov ah, 0x00
    mov bh, 12h 
    int 10h

    mov ah, 0xb 
    mov bh, 0
    mov bl, 1h
    int 10h
    
    call gets
    call endl
    call getinput
    call fib
    call done
gets:
    mov ah, 0x00 
    int 16h
    
    cmp al, 0x0d
    jmp .done
    
    inc cx
    
    sub al, '0' 
    stosb
    add al, '0'
    
    call putchar
    
    call gets
    
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
    xor ax, ax
    jmp .ciclo
    mov dx, 10
    div dx
    ret
    .ciclo:
        lodsb
        mov dx, 10
        mul dx
        add ax, bx
        dec cx
        cmp cx, 0
        ja .ciclo
fib:
    mov bl, ah
    mov bh, 0x0
    mov ax, [vector+bx]
    call putchar
    ret
done:
    jmp $
times 510 - ($ - $$) db 0
dw 0xaa55