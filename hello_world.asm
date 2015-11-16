%define SYS_WRITE 0x2000004
%define SYS_EXIT 0x2000001
%define STDOUT 1

global _main

section .text

_main:
	mov	rax, SYS_WRITE
	mov	rdi, STDOUT
	lea	rsi, [rel txt]
	mov	rdx, txt.len
	syscall

	mov 	rax, SYS_EXIT
	mov	rdi, 0
	syscall

section .rodata

txt:	db	"Hello, World!", 10
.len:	equ	$ - txt

