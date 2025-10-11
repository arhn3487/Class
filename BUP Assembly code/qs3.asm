.stack 100h
.data
    msg db "Enter a character: $"
    outmsg db "Output: $"
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, msg
    int 21h
    
    mov ah, 1
    int 21h
    mov bl, al
    
    mov ah, 2
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h
    
    mov ah, 9
    lea dx, outmsg
    int 21h
    
    mov cx, 10
print10:
    mov dl, bl
    mov ah, 2
    int 21h
    inc bl
    loop print10
    
    mov ah, 4ch
    int 21h
main endp
end main