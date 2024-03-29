ORG 100h                    ; store 10 odd number starting from 4 at 5000:1000   5 7 9 11 13 15 17 19  SI
                            ; store sum of first+last, num2 + n-1 ...            a1 a2 a3
                            ; store sum of all odd numbers
MOV AX, 5000h
MOV DS, AX
MOV BX, 1000h
MOV SI, BX

MOV DL, 4
MOV CX, 10
MOV DH, 2

findodd: INC CX
         MOV AX, 0
         MOV AL, DL 
         DIV DH    ;al/dh q->al r->ah
         CMP AH, 0
         JZ notodd
         MOV B.[BX], DL
         INC BX
         DEC CX
         
 notodd: INC DL
         LOOP findodd
                                                
MOV BX, 1010h                                    
MOV DX, SI                                        
MOV CX, 5                                     
                                                       
                                                            
forward: MOV AL, B.[SI]         ;SI points at arr1                BX points at arr2      
         ADD B.[BX], AL                               
         INC BX
         INC SI
         LOOP forward

MOV CX, 5
DEC BX
         
reverse: MOV AL, B.[SI]
         ADD B.[BX], AL
         DEC BX
         INC SI
         LOOP reverse       
   
MOV SI, DX
MOV BX, 1020h
MOV CX, 10

    sum: MOV AL, B.[SI]
         ADD B.[BX], AL
         INC SI
         LOOP sum
              
RET  