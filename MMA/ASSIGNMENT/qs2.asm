.MODEL SMALL
.STACK 100h
.DATA
  PROMPT DB 'Enter n: $'
  NL     DB 0Dh,0Ah,'$'
.CODE
MAIN PROC
    mov ax,@DATA
    mov ds,ax

    lea dx,PROMPT
    mov ah,9
    int 21h

    mov ah,1         
    int 21h
    sub al,'0'
    mov cl,al         
    lea dx,NL         
    mov ah,9
    int 21h

    mov ch,1
U_LOOP:
    cmp ch,cl
    jge U_END

    mov bl,ch                 
    call PRINT_HASHES

    mov al,cl                
    sub al,ch
    mov bl,al
    shl bl,1
    call PRINT_SPACES

    mov bl,ch                 
    call PRINT_HASHES
    call NEWLINE

    inc ch
    jmp U_LOOP
U_END:


    mov bl,cl
    shl bl,1
    call PRINT_HASHES
    call NEWLINE

    mov ch,cl
    dec ch
L_LOOP:
    cmp ch,0
    jz DONE

    mov bl,ch                 
    call PRINT_HASHES

    mov al,cl                
    sub al,ch
    mov bl,al
    shl bl,1
    call PRINT_SPACES

    mov bl,ch                 
    call PRINT_HASHES
    call NEWLINE

    dec ch
    jmp L_LOOP

DONE:
    mov ah,4Ch
    int 21h
MAIN ENDP


PRINT_HASHES PROC
    push ax
    push dx
    mov al,'#'
PH1: cmp bl,0
     jz PH2
     mov dl,al
     mov ah,2
     int 21h
     dec bl
     jmp PH1
PH2: pop dx
     pop ax
     ret
PRINT_HASHES ENDP

PRINT_SPACES PROC
    push ax
    push dx
    mov al,' '
PS1: cmp bl,0
     jz PS2
     mov dl,al
     mov ah,2
     int 21h
     dec bl
     jmp PS1
PS2: pop dx
     pop ax
     ret
PRINT_SPACES ENDP

NEWLINE PROC
    push dx
    mov dx,OFFSET NL
    mov ah,9
    int 21h
    pop dx
    ret
NEWLINE ENDP

END MAIN
