.global fill_buffer, strncpy

.text
fill_buffer:
	addi a2 a2 -1
	li t3 '#'
	loop:
		sb t3 (a0)
		addi a1 a1 1 
		addi a0 a0 1
		blt a1 a2 loop
	li t3 '\0'
	sb t3 (a0)
	ret


strncpy: # the function is equivalent to the code given in C
 	beqz a2 label 
	lb t1 (a0)
	beqz t1 label
	lb t1 (a1)
	beqz t1 label
	
	li t2 0 # cnt
	loop1:
		lb t1 (a1)
		sb t1 (a0)
		addi t2 t2 1
		addi a1 a1 1
		addi a0 a0 1
		bge t2 a2 break
		lb t1 (a1)
		beqz t1 break
		j loop1
	break:
		li t1 '\0'
	loop2:
		bge t2 a2 label
		sb t1 (a0)
		addi a0 a0 1
		addi t2 t2 1
		j loop2
	
	label:
		ret
