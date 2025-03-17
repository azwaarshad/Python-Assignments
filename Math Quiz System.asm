;Quiz Masters By Azwa Arshad, Waleha Batool, Syed Hani Rizvi

 ;===============================printing function for string =================================  
print macro p1     
mov dx , offset p1
mov ah,09
int 21h
endm 
;===========================printing function for single character==========================
printc macro p1     
mov dl , p1
mov ah,02
int 21h    
endm
 ;=======================clear screen ==============================
cscr macro    
 mov  ah, 0
  mov  al, 3
  int  10H
endm  
takingInput macro
mov ah , 01         
int 21h 
endm  
 ;============================printing question and choices ======================================
Q.A macro question,answer
print newline
print question     
print newline
takingInput   
cmp al, answer  
endm    
   

;x========================================================================================================x    
.model large
.stack 2048h

.data
;========================== strings which we are going to use in this program============================= 
  x2 db "      ==========================================",0ah,0dh,"$"       
  x db "                   ! WRONG INPUT !                          ",0ah,0dh,"$"  
  x1 db "      ==========================================",0ah,0dh,"$" 
  newline db 0ah,0dh,"$"
  m1 db "          ==========================================",0ah,0dh,"$"
  m2 db "                  Wellcome TO Mathematic Quiz           ",0ah,0dh,"$"
  m3 db "          ==========================================",0ah,0dh,"$"
  m4 db  0ah,0dh,"$"
  m13 db 0ah,0ah,"$"
  m5 db "          ==========================================",0ah,0dh,"$"
  m6 db "         |          Select Difficulty               |",0ah,0dh,"$"
  m7 db "         |                                          |",0ah,0dh,"$" 
  m8 db "         |  1) ADD,SUB,MULTIPLY AND DIVITION        |",0ah,0dh,"$"
  m9 db "         |  2) GREATER THAN OR LESS THAN            |",0ah,0dh,"$" 
  m10 db "         |  3) LCM/HCF                              |",0ah,0dh,"$"
  m11 db "          ===========================================",0ah,0dh,"$"  
  m12 db "          (ENTER YOUR CHOICE) =  $" 
  ;x========================================================================================x
  ;==============================CHOICE 1============================================== 
  ;=============================DMAS QUESTIONS=========================================    
  1q1 db  "QUESTION 1) 2 + 3 = ?",10,13,"1)3          2)5          3)1$"       ;   2
  1q2 db   "QUESTION 2) 5 - 9 = ?",10,13,"1)1          2)0         3)-4$"         ; 3
  1q3 db  "QUESTION 3) 9 * 6 = ?",10,13,"1)64          2)37         3)54$"        ; 3
  1q4 db  "QUESTION 4) 16 / 4 = ?",10,13,"1)4          2)3          3)5$"          ;1
  1q5 db  "QUESTION 5) 46 + 150 = ?",10,13,"1)200          2)196          3)190$"   ;2
  1q6 db  "QUESTION 6) 175 - 55 = ?",10,13,"1)135          2)120          3)125$"  ; 2
  1q7 db   "QUESTION 7) 8 * 8 = ?",10,13,"1)64          2)60          3)72$"        ;1
   ;==============================CHOICE 2============================================== 
  ;==============================GTOLT QUESTIONS =======================================   
  2q1 db  "QUESTION 1) 4 < 11 = ?",10,13,"1)TRUE          2)FALSE$"   ;1
  2q2 db "QUESTION 2) 12 < 9 = ?",10,13,"1)TRUE          2)FALSE$"     ;2
  2q3 db  "QUESTION 3) 4 > 10 = ?",10,13,"1)TRUE          2)FALSE$"   ;2
  2q4 db "QUESTION 4) 9 > 2 = ?",10,13,"1)TRUE          2)FALSE$"     ;1
  2q5 db  "QUESTION 5) 4+5 < 12-5 = ?",10,13,"1)TRUE          2)FALSE$"   ; 2
  2q6 db  "QUESTION 6) 99-50 > 30 = ?",10,13,"1)TRUE          2)FALSE$"   ; 1
  2q7 db "QUESTION 7) 23.9 < 45.2 = ?",10,13,"1)TRUE          2)FALSE$"    ;  1
   ;==============================CHOICE 3============================================== 
  ;===============================LCM/HCF QUESTIONS =========================================  
  3q1 db  "QUESTION 1)What is the L.C.M. of 25, 30, 35 and 40?",10,13,"1) 3800          2)4200          3)440$"    ;2
  3q2 db  "QUESTION 2) The H.C.F. of two numbers is 12 and their difference is 12.",10,13,"1)66,77          2)66,106          3)84,96$"   ;3
  3q3 db "QUESTION 3) What is the H.C.F. of 4/9, 10/21 and 20/63?",10,13,"1)2/63         2)6/63          3)20/21$"   ;1
  3q4 db  "QUESTION 4) The HCF of two numbers is 29 & their sum is 174.",10,13,"1) 74,100          2)29, 154          3)29, 145$"  ;3
  3q5 db "QUESTION 5) The product of two numbers is 6760 and their H.C.F. is 13. How many such pairs can be formed?",10,13,"1) 2          2)0          3)5$"   ;1
  3q6 db  "QUESTION 6) least perfect cube which is divisible by 2,3,4 and 6 is",10,13,"1) 360          2)1728          3)216$"   ;3
  3q7 db  "QUESTION 7) The least perfect square number which is divisible by 3, 4, 5, 6 and 8",10,13,"1) 3600          2)900         3)2500$"   ;1
  ;x======================================================================================x
  ;==================choice correct answer by pressing 1,2 and 3=========================== 
  ;==========================DIVIDE MULTIPLY  ADDTION & SUBTRACTION====================
  ;=================================ANSWERS DMAS==========================================
 1a1 db   50  
 1a2 db   51
 1a3 db   51
 1a4 db   49
 1a5 db   50 
 1a6 db   50  
 1a7 db   49
        
  ;==================choice correct answer by pressing 1,2=============================
  ;============================GREATER THAN OR LESS THAN===========================
  ;==================================ANSWERS GTOLT=======================================
 2a1 db   49 
 2a2 db   50
 2a3 db   50
 2a4 db   49
 2a5 db   50
 2a6 db   49 
 2a7 db   49   
  ;==================choice correct answer by pressing 1,2 and 3============================== 
  ;======================Least Common Divisor  / Highest Common Factor========================
  ;====================================ANSWERS LCM/HCF ========================================
 3a1 db   50 
 3a2 db   51
 3a3 db   49
 3a4 db   51
 3a5 db   49
 3a6 db   51 
 3a7 db   49
 ;x==========================================================================================x
 ;======================================USER SCORE==========================================
 score db 0
 mm db "===================$"
 m db "Your Score is = $"
 mmm db "===================$"    
 ;x==============================================================================================x
 ;===================================code segement================================= 
.CODE
;======================================main procedure===========================
MAIN PROC 
   
    MOV AX,@DATA  ;data segment
	MOV DS,AX 
	call OM ; Display Choice Message On Screen 
call Choice
call Exit  






Choice proc 
    ;======================taking user input For the Choice========================== 
takingInput   
mov bl , al 
;=======================clear screen ============================
cscr 
;===================checking user choice=====================
cmp bl , 51  
ja WRONG               
cmp bl , 49  
je DMAS      ;===========JUMP TO DMAS if we press 1==============
cmp bl , 50
je GTOLT      ;==============JUMP TO GTOLT if we press 2==============
cmp bl , 51
je LCMOHCF      ;=================JUMP TO LCM/HCF if we press 3============
 DMAS:    
call ChoiceDMAS
ret
GTOLT:  
call ChoiceGTOLT
ret 
LCMOHCF:  
call ChoiceLCMOHCF
ret
;=======if wrong input / print wrong input message label==================  
WRONG:
print newline
print x2 
print x
print x1
ret 
Choice endp 
   ;================================================DMAS============================================
ChoiceDMAS proc
Q.A 1q1,1a1
jne DMAS2   
inc score
DMAS2:     ;==========label ==============
Q.A 1q2,1a2
jne DMAS3
inc score
DMAS3: ;==========label ==============          
Q.A 1q3,1a3  
jne DMAS4           
inc score 
DMAS4:   ;==========label ==============
Q.A 1q4,1a4
jne DMAS5       
inc score 
DMAS5:   ;==========label ==============
Q.A 1q5,1a5
jne DMAS6
inc score
DMAS6: ;==========label ==============
Q.A 1q6,1a6
jne DMAS7
inc score
DMAS7: ;==========label ==============
Q.A 1q7,1a7
jne DMAS8
inc score
DMAS8:  ;==========label ==============         
call UserScore
ret    
ChoiceDMAS endp     
                  
  ;================================================GTOLT=================================================                
                  
ChoiceGTOLT proc
Q.A 2q1,2a1
jne GTOLT2
inc score
GTOLT2:       ;==========label ============== 
Q.A 2q2,2a2
jne GTOLT3
inc score
GTOLT3:  ;==========label ==============          
Q.A 2q3,2a3  
jne GTOLT4           
inc score 
GTOLT4:  ;==========label ==============
Q.A 2q4,2a4
jne GTOLT5       
inc score 
GTOLT5: ;==========label ==============
Q.A 2q5,2a5
jne GTOLT6
inc score
GTOLT6:  ;==========label ==============
Q.A 2q6,2a6
jne GTOLT7
inc score
GTOLT7: ;==========label ==============
Q.A 2q7,2a7
jne GTOLT8
inc score
GTOLT8:  ;==========label ==============         
call UserScore
ret    
ChoiceGTOLT endp
  ;==========================================================LCM============================================  
ChoiceLCMOHCF proc 

Q.A 3q1,3a1
jne LCM2
inc score
LCM2:   ;==========label ==============
Q.A 3q2,3a2
jne LCM3
inc score
LCM3:  ;==========label ==============         
Q.A 3q3,3a3  
jne LCM4           
inc score 
LCM4:  ;==========label ==============
Q.A 3q4,3a4
jne LCM5       
inc score 
LCM5: ;==========label ==============
Q.A 3q5,3a5
jne LCM6
inc score
LCM6: ;==========label ==============
Q.A 3q6,3a6
jne LCM7
inc score
LCM7:  ;==========label ==============
Q.A 3q7,3a7
jne LCM8
inc score
LCM8:  ;==========label ==============         
call UserScore
ret    
ChoiceLCMOHCF endp  
  ;x===================================================================================================x
 ;======================OPENING MESSAGE PROCEDURE/PRINTING MESSAGE USING PRINT FUNCTION =========================
 ;==================================front page display message==========================================
OM proc 
    print m1
print m2
print m3
print m4
print m5
print m6
print m7
print m8
print m9
print m10
print m11
print m12   
    ret
OM endp 
 ;==================================SCORE PROCEDURE ==================================
 UserScore proc
cscr
print newline
mov bl , score
add bl , 48
 ;=====================printing score===============================
print mm 
print newline
print m 
printc bl
print newline
print mmm
 ;==============================after printing score / exit or terminate program =====================
call Exit    
ret
UserScore endp
;============================================EXIT=======================================
Exit proc     ; Program Exit Procedure
mov ah,4ch
int 21h    
Exit endp  

end main ;code Segment Close