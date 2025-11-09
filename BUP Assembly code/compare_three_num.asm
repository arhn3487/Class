.model small
.stack 100h
.data
msg1 db "Enter first digit: $"
msg2 db "Enter second digit: $"
msg3 db "Enter third digit: $"
res1 db "First$"
res2 db "Second$"
res3 db "Third$"
.code
main proc
    mov ax,@data
    mov ds,ax

    lea dx,msg1
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    sub al,30h
    mov bl,al   

    lea dx,msg2
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    sub al,30h
    mov bh,al  

    lea dx,msg3
    mov ah,9
    int 21h
    mov ah,1    
    int 21h     
    sub al,30h
    mov cl,al  

    mov al,bl
    cmp bh,al
    ja set_b
    cmp cl,al
    ja set_c
    jmp set_a

set_b:
    mov al,bh
    cmp cl,al
    ja set_c
    jmp set_b_label

set_c:
    lea dx,res3
    jmp print

set_b_label:
    lea dx,res2
    jmp print

set_a:
    lea dx,res1

print:
    mov ah,9
    int 21h

    mov ah,4Ch
    int 21h
main endp
end main