.stack 100h
.data
    msg db "Enter 5 Characters: $"
    rev db "REVERSE Order: $"
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, msg
    int 21h
    
    mov cx, 5
read5:
    mov ah, 1
    int 21h
    push ax
    loop read5
    
    mov ah, 2
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h
    
    mov ah, 9
    lea dx, rev
    int 21h
    
    mov cx, 5
print5:
    pop dx
    mov ah, 2
    int 21h
    loop print5
    
    mov ah, 4ch
    int 21h
main endp
end main