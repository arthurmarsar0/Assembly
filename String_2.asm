org 0x7c00
jmp _start

buffer times 64 db 0

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
    call count_loop
    call print_count
    call done
    
getstring:
    call getchar
    call putchar
    cmp al, 0x0d
    je .done
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
    call putchar
    ret
        
count_loop:
    lodsb
    cmp al, 0
    je .done
    inc cx
    
    jmp count_loop
    
    .done:
        ret

print_count:
    push cx
    mov al, cl
    mov ah, 0x0e
    add al, '0'
    int 10h
    pop cx
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
    
    
    


