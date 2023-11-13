.macro print_new_line
.text
	li a0 '\n'
	li a7 11
	ecall
.end_macro

.macro get_string
.text
	li a7 8
	ecall
.end_macro

.macro print_string
.text
	li a7 4
	ecall
.end_macro

.macro 	finish_with_exit_code_0
	li a7 10
	ecall
.end_macro