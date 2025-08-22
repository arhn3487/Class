.MODEL SMALL
.STACK 100H
.DATA
F DB "FIRST ONE IS LARGER$"
S DB "SECOND ONE IS LARGER$"
T DB "THIRD ONE IS LARGER$"  
NL DB 10,13,'$'

.CODE

MAIN PROC   
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,01H
    INT 21H
    SUB AL,'0'
    MOV BL,AL  
    CALL PRINTNL
    
    MOV AH,01H
    INT 21H
    SUB AL,'0'
    MOV CL,AL 
    CALL PRINTNL
    
    MOV AH,01H
    INT 21H
    SUB AL,'0'
    MOV BH,AL
    CALL PRINTNL
    
    CMP BL,CL
    
    JGE AC
    JL BC
    
    
    AC:
    CMP BL,BH
    JGE A
    JL C
    
    BC:
    CMP CL,BH
    JGE B  
    JL C 
    
    PRINTNL:
    MOV AH,09H 
    MOV DX, OFFSET NL
    INT 21H
    MOV AH,09H 
    RET
    
    
    A:  
    MOV DX,OFFSET F
    INT 21H
    JMP FIN
    
    B:
    MOV DX,OFFSET S
    INT 21H
    JMP FIN
    
    C:
    MOV DX,OFFSET T
    INT 21H
    JMP FIN  
    
    FIN:
    
    MAIN ENDP 
END MAIN