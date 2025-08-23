.MODEL SMALL
.STACK 100H
.DATA 
    B DB 0 
    NL DB 10,13,'$'
.CODE 

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
    MOV BX,0
    MOV CX,8
    
    INPUT:
    MOV AH,01H
    INT 21H
    SUB AL,'0'
    SHL BL,1
    OR BL,AL
    LOOP INPUT
    
    MOV CX,8 
    
    MOV DX, OFFSET NL
    MOV AH,09H
    INT 21H
    
    OUTPUT:
    TEST BL,10000000b
    JZ PRINT_ZERO
    
    MOV AH,02H
    MOV DL,'1'
    INT 21H 
    JMP K
               
    PRINT_ZERO:
        MOV AH,02H
        MOV DL,'0'
        INT 21H 
    K:  
    SHL BL,1
    LOOP OUTPUT
    
    MAIN ENDP
END MAIN