.include "macros.s"

.macro _strncpy(%dest, %src, %n)
.text
	la a0 %dest # dest 
	la a1 str
	#la a1 %src # src
	li a2 %n # n = the size of trasfering data
	jal strncpy
.end_macro

.global main
.eqv INPUT_SIZE 7
.eqv DEST_SIZE 10
.data
.align 0
buf_in: .space INPUT_SIZE # len(str) = INPUT_SIZE - 1, buf_in = src
.align 0
buf_dest: .space DEST_SIZE  # len(str) = DEST_SIZE - 1, buf_dest = dest
str: .asciz "hello"
.text
main:
	la a0 buf_in
	li a1 INPUT_SIZE
	#get_string # string from user for src
	
	print_new_line
	
	la a0 buf_dest
	li a1 0 # cnt
	li a2 DEST_SIZE 
	jal fill_buffer # buf_dest is filled with '#' and '0' is put at the end forming a string
	
	_strncpy(buf_dest , buf_in, 7) # macro for func strncpy
	
	la a0 buf_dest
	print_string
	
	finish_with_exit_code_0
