	.data
	cadena: .byte  -1,-1, -1, -1, -1, -1
	vec: .word 5,6,8,9,1
	
	.text
	.globl main
main:
	addiu $s0,$zero,0
	la $t1, cadena
	la $t2, vec 	#carreguem les direccions dels 2 arrays abans del while
	
while:	
	li $t0,5
	bge $s0,$t0,fi
	
	sll $t3,$s0,2		#com que és word es multiplica per 4
	subu $t4,$t2,$t3	#es resta perquè la i és negativa
	lw $t4, 16($t4)		#4*4 dels (4-i) i els 4 per ser word
	
	addiu $t4,$t4,48 	#La constant 48 prove del char '0'
	addu $t5,$t1,$s0	#No cal multiplicar ja que es un array de chars(1 byte)
	
	sb $t4,0($t5)
	
	addiu $s0,$s0,1
	b while
fi:

	sb $zero,5($t1)	
	#Ara imprimirem la string 
	
	li $v0,4
	move $a0, $t1
	syscall

	jr $ra		# main retorna al codi de startup
