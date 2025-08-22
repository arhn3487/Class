.MODEL SMALL
.STACK 100H
.DATA
P DB "THIS IS A POSITIVE NUMBER$"
N DB "THIS IS A NEGATIVE NUMBER$"
Z DB "THIS IS ZERO$"
NL DB 10,13,'$'

; aita negative number check korte pare na

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,01H
    INT 21H
    MOV BL,AL
    SUB BL,'0'
    
    MOV AH,09H 
    MOV DX,OFFSET NL
    INT 21H         
    
    CMP BL,0
    JE ZE
    JG G
    JL L   
    
    MOV AL,09H
    
    ZE:  
    MOV DX,OFFSET Z   
    INT 21H
    CALL FIN
    
    G:
    MOV DX,OFFSET P
    INT 21H
    CALL FIN   
    
    L:
    MOV DX,OFFSET N    
    INT 21H
    CALL FIN  
    
    FIN:
    
    
    MAIN ENDP
END MAIN
    
    
    