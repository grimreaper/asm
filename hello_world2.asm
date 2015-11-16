%define SYS_EXIT 0x2000001

extern c_string_out

global _main

section .text

_main:
	enter	0, 0
	lea	rdi, [rel txt]
	call	c_string_out

	mov 	rax, SYS_EXIT
	mov	rdi, 0
	syscall

section .rodata

txt:	db	"Hello, World!", `\n`, `\0`
