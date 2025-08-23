.MODEL SMALL
.STACK 100H
.DATA 
    NUM DB "Given input is a number$"
    CON DB "Given input is a Consonant$" 
    VOW DB "Given input is a Vowel$"  
    QS DB "Enter the value of X : $"
    ASK DB "Do you want to give another input?$" 
    INV DB "Invalid input$"
    NL DB 10,13,'$' 
.CODE 
         
         
MAIN PROC 
    
    MOV AX,@DATA
    MOV DS,AX 
    
    JMP MAIN_FUN  
    
    NL_PRINT:
    MOV AH,09H
    MOV DX,OFFSET NL
    INT 21H
    RET
    
    PRINT_MSG:
    MOV AH,09H
    INT 21H
    
    ASK_USER:
    MOV DX,OFFSET ASK 
    MOV AH,09H
    INT 21H 
    CALL NL_PRINT  
    MOV AH,01H
    INT 21H
    CMP AL,'N'
    JE FIN  
    CALL NL_PRINT
    JMP MAIN_FUN
    
    NUM_MSG:
    MOV DX,OFFSET NUM
    MOV AH,09H
    INT 21H  
    CALL NL_PRINT
    JMP ASK_USER 
    
    VOWEL_MSG:
    MOV DX,OFFSET VOW
    MOV AH,09H
    INT 21H   
    CALL NL_PRINT
    JMP ASK_USER
    
    CON_MSG:
    MOV DX,OFFSET CON
    MOV AH,09H
    INT 21H  
    CALL NL_PRINT
    JMP ASK_USER 
    
    INV_MSG:
    MOV DX,OFFSET INV 
    MOV AH,09H
    INT 21H 
    CALL NL_PRINT
    JMP ASK_USER
    
    LETTER_CHK:
    CMP AL,'A'
    JE VOWEL_MSG
    CMP AL,'a'
    JE VOWEL_MSG
    CMP AL,'E'
    JE VOWEL_MSG
    CMP AL,'e'
    JE VOWEL_MSG 
    CMP AL,'I'
    JE VOWEL_MSG
    CMP AL,'i'
    JE VOWEL_MSG 
    CMP AL,'O'
    JE VOWEL_MSG
    CMP AL,'o'
    JE VOWEL_MSG 
    CMP AL,'U'
    JE VOWEL_MSG
    CMP AL,'u'
    JE VOWEL_MSG 
    JMP CON_MSG
    
    
    MAIN_FUN: 
    MOV AH,09H
    LEA DX,QS
    INT 21H 
    
    MOV AH,01H
    INT 21H 
    MOV BL,AL  
    CALL NL_PRINT 
    MOV AL,BL
    CMP AL,07AH
    JGE INV_MSG
    CMP AL,29H
    JLE INV_MSG
    CMP AL,39H
    JLE NUM_MSG
    CMP AL,40H 
    JLE INV_MSG
    CMP AL,5AH
    JLE LETTER_CHK
    CMP AL,60H 
    JLE INV_MSG
    JMP LETTER_CHK  
    
    
    FIN: 
    
    MAIN ENDP
END MAIN