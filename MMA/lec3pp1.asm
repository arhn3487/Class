.MODEL SMALL
.STACK 100H
.DATA
NL DB 10,13,'$'
F DB "FIRST IS GREATER$"
S DB "SECOND IS GREATER$"  
E DB "TWO ARE EQUAL$"
.CODE

MAIN PROC   
    MOV AX,@DATA
    MOV DS,AX
    MOV AH,01H
    INT 21H  
    SUB AL,'0'
    MOV BL,AL 
    MOV AH,09H  
    MOV DX,OFFSET NL
    INT 21H  
    MOV AH,01H
    INT 21H   
    SUB AL,'0' 
    MOV AH,09H  
    MOV DX,OFFSET NL
    INT 21H  
    CMP BL,AL
    JZ EQ
    JG GR
    JL LS
    
    
    
    
    EQ:
    MOV DX, OFFSET E  
    JMP FIN
    GR:
    MOV DX, OFFSET F
    JMP FIN
    LS:
    MOV DX, OFFSET S
    
    FIN:
    MOV AH,09H   
    INT 21H
    
    MAIN ENDP
END MAIN
    