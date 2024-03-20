.data

Int_1: .asciiz "Please enter first integer: "
Int_2: .asciiz "Please enter second integer: "
Task: .asciiz "0:Add 1:sub 2:multiply Enter your choice "
Result: .asciiz "The result of the operation is : "

.text
.globl main
main:

li $v0,4
la $a0,Int_1
syscall

li $v0,5            
syscall
move $s1,$v0

li $v0,4
la $a0,Int_2
syscall

li $v0,5           
syscall
move $s2,$v0

li $v0,4
la $a0,Task
syscall

li $v0,5          
syscall
move $s0,$v0

li $s3,1
beq $s0,$0,Add
beq $s0,$s3,Sub
li $s3,2
beq $s0,$s3,Mul



Sub:
sub $s3,$s1,$s2
li $v0,4      
la $a0,Result
syscall
li $v0,1            
add $a0,$s3,$0
syscall
j Exit


Add:
add $s3,$s1,$s2
li $v0,4            
la $a0,Result
syscall
li $v0,1           
add $a0,$s3,$0
syscall
j Exit

Mul:
mult $s1,$s2
li $v0,4           
la $a0,Result
syscall
li $v0,1           
mfhi $a0
syscall
li $v0,1
mflo $a0
syscall

Exit:
li $v0,10
syscall


