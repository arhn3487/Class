.MODEL SMALL
.STACK 100H
.DATA
    NL DB 10,13,'$'   
    STAR DB '*$'
.CODE  
            
            
MAIN PROC   
    MOV AX,@DATA
    MOV DS,AX
    MOV AH,01
    INT 21H
    SUB AL,'0'
    MOV CL,AL
    XOR CH,CH
    MOV SI,CX 
    XOR BX,BX 


PRINT_NL:
   INC BX
   MOV CX,BX

PRINT_STAR:
    MOV AH,09H
    MOV DX,OFFSET STAR
    INT 21H
    
    LOOP PRINT_STAR
    
    MOV DX,OFFSET NL
    MOV AH,09H
    INT 21H
    
    CMP BX,SI
    JNE PRINT_NL

    MAIN ENDP
END MAIN