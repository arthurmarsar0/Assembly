org 0x7c00
jmp _start

message db "Hello World!", 0
BITS 16

_start:
    mov ah, 0x0e
    mov si, message

print_loop:
    lodsb
    cmp al, 0
    je done
    int 0x10
    jmp print_loop

done:
    jmp $

times 510 - ($ - $$) db 0
dw 0xaa55
    
