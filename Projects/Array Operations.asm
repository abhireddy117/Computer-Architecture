 .data
Arr: .word 11, 12, -10, 13,  9, 12, 14, 15, -20

QuestionA: .asciiz "The maximum is "
QuestionB: .asciiz "\n The summation is "

.text

main:
li $a2, 9
la $t0, Arr

li $v0, 4
la $a0, QuestionA
syscall 

li $t1, 0
li $a1, 0
j Max_Value


Max_Value:
beq  $t1, $a2, EXIT             
la $t0, Arr                  
sll $t2, $t1, 2                  
add $t0, $t0, $t2          
lw $t3, 0($t0)            
        
li $t4, 1                    
slt $t5, $a1, $t3                  
addi $t1, $t1, 1                
beq  $t4, $t5, Set_Value         
j Max_Value



Sum:
beq  $t1, $a2, EXIT2        
la   $t0, Arr          
sll  $t2, $t1, 2            
add  $t0, $t0, $t2          
lw   $t3, 0($t0)            
        
add  $a1, $t3, $a1                 
addi $t1, $t1, 1            
j Sum

Set_Value:
move $a1, $t3
j Max_Value


EXIT:
li $v0, 1
move $a0, $a1
syscall 

li $v0, 4
la $a0, QuestionB
syscall 

li $t1, 0
li $a1, 0
j Sum



EXIT2:
li $v0, 1
move $a0, $a1
syscall 

li $v0, 10 
syscall






