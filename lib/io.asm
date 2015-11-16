extern _printf
;type c_string_out, @function
section .text
global c_string_out
c_string_out:
	enter 0, 0
	mov rsi, rdi
	mov rdi, .pure_string_format
	mov rax, 1
	call _printf
	leave
	ret
.pure_string_format db "%s", 10, 0
