.MODEL SMALL
  .STACK 100H
  .DATA 
  MSB DB ' ******************** BMI CALCULATOR ********************$'
  MSC DB ' """Info - 1feet= 30cm"""$'
  MSD DB ' Input your height in cm:$'
  MSE DB ' Input your weight in kg:$'
  MSF DB ' "Your weight is:over weight"$'
  MSG DB ' "Your weight is:perfect"$'
  MSH DB ' "Your weight is:under weight"$'

  MSN DB ' Congratulation..! Keep it up.$'
  MSM3 DB '          ********THANK YOU********$'

  
  SUM DW ? 
  .CODE
   MAIN PROC
    
    
    MOV AX,@DATA
    MOV DS,AX
    
    
    
    CALL NL
    CALL NL
    
    LEA DX,MSB
    MOV AH,9            ;PRINT MESSAGE
    INT 21H 
    
    CALL NL
    CALL NL
    
    LEA DX,MSC
    MOV AH,9            ;PRINT MESSAGE
    INT 21H 
    
    START:
    
    CALL NL             ;NEW LINE
    CALL NL
    
    LEA DX,MSD
    MOV AH,9
    INT 21H 
           
    MOV AX,0
    MOV BX,0
    MOV CX,0
    MOV DX,0
    MOV SUM,0
    
 
         
 INPUT:               ;FOR HEIGHT
 
    AND AX,000FH    ;For converting the character into digit
    PUSH AX         ;For keeping the value of AX into the stack.
    MOV AX,10
    MUL BX          ;For multiplying the value of AX with BX
    MOV BX,AX
    POP AX          ;For geting the value of AX from the stack.
    ADD BX,AX
    
    MOV AH,1
    INT 21H
     
    CMP AL,0DH      ;For comparing the value of AL with Enter.
    JE PRINT
    
   
    JMP INPUT
    
    
    PRINT: 
    
    CALL NL
    
    LEA DX,MSE
    MOV AH,9
    INT 21H
    
    MOV SUM,BX
    MOV BX,0
    MOV AX,0
     
    INPUT2:            ;FOR WEIGHT
     
    AND AX,000FH
    PUSH AX
    MOV AX,10
    MUL BX
    MOV BX,AX
    POP AX
    ADD BX,AX
    
    MOV AH,1
    INT 21H
     
    CMP AL,0DH
    JE CONVERT
    
    JMP INPUT2 
    
    
     
    CONVERT:        ;DIVIDE HEIGHT/WEIGHT
    
    MOV AX,SUM
    
    DIV BX          ;For dividing the value of AX by BX.
     
    
    CMP AX,1        ;EX 180/100 =1
    JE OVER
    
    CMP AX,2        ;180/90 = 2
    JE OVER
    
    CMP AX,3
    JE PERFECT
    
    CMP AX,4         ;180/45=4
    JE UNDER
    
    CMP AX,5         ;180/35=5
    JE UNDER
    
    OVER:
    
    CALL NL
    CALL NL
    
    LEA DX,MSF
    MOV AH,9
    INT 21H 
    
    JMP EXIT2
    
    PERFECT:
     
    CALL NL
    CALL NL
    
    LEA DX,MSG
    MOV AH,9
    INT 21H
    
    CALL NL
    CALL NL
    
    LEA DX,MSN
    MOV AH,9
    INT 21H 
     
    JMP EXIT2
     
    UNDER:
    
    CALL NL
    CALL NL
    
    LEA DX,MSH
    MOV AH,9
    INT 21H 
    
    JMP EXIT2
                 
   
    NL:
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    RET
    
      
    EXIT2:  
    CALL NL
    CALL NL
    
    LEA DX,MSM3
    MOV AH,9
    INT 21H
     
    MOV AH,4CH
    INT 21H
             
    MAIN ENDP 
    END MAIN





