%include "macro/libc.inc"
;type c_string_out, @function
section .text
global c_string_out
c_string_out:
	enter 0, 0
	mov rsi, rdi
	lea rdi, [rel .pure_string_format]
	mov rax, 1
	call printf
	leave
	ret
.pure_string_format db "%s", 10, 0
