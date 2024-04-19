.data

equalSigns: .asciiz "\n========================================================================"

x_input: .asciiz "\nInput the number you would like for the base?\n"

y_input: .asciiz "\nInput the number you would like for the exponent?\n"

error_output: .asciiz  "==> **** ERROR: x (base) is not less than 12"

error_output3: .asciiz  "==> **** ERROR: x (base) is less than 0"


error_output2: .asciiz  "==> **** ERROR: y (exponent) is not less than 12"

error_output4: .asciiz  "==> **** ERROR: y (exponent) is less than 0"


product: .asciiz  "The product is "

.text
main: 


addi $t4, $0, 12

enterx: li $v0, 4
la $a0,x_input 
syscall

li $v0, 5
syscall 

add $t0,$v0,$0

blt $t0,$0,errorX
bge  $t0,$t4,errorX2

entery: li $v0, 4
la $a0,y_input 
syscall

li $v0, 5
syscall 

add $t2,$v0,$0

blt $t2,$0,errorY
bge $t2,$t4,errorY2

li $t7,1

#start convenction/guideline stuff

add $a1,$0,$t2 #int y
add $a2,$0,$t0#int x
jal returnPower


add $s5,$v1,$0
#return addresss
li $v0, 4
la $a0,product
syscall


li $v0,1
add $a0,$s5,$0
syscall

li $v0,10
syscall

#loop should be the function 
returnPower: 

li $t3,0

add $t5,$a1,$0 #y
add $t6,$a2,$0#x

 bge  $t3,$t5,return
 
 mul $t7,$t6, $t7
 addi $t3,$t3,1
 j returnPower
 
 return: 
 add $v1,$t7,$0
 jr $ra
 
 errorX:
li $v0, 4
la $a0,error_output3
syscall
 j enterx
 
 errorX2:
li $v0, 4
la $a0,error_output
syscall
 j enterx
 
  errorY:
li $v0, 4
la $a0,error_output4
syscall
 j entery
 
  errorY2:
li $v0, 4
la $a0,error_output2
syscall
 j entery
 
 
 
 

