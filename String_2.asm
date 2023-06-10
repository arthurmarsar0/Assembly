org 0x7c00
jmp _start

buffer times 64 db 0

_start:
   

    
done:
    jmp $
    
times 510 - ($ - $$) db 0
dw 0xaa55
    
    
    


