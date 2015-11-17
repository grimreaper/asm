; A program which prints its arguments line by line: prefixed by the number which they are

%include "macro/common.inc"
%include "macro/libc.inc"

global _main

section .text

_main:
	; On Entry:
	; 	rdi = argc
	; 	rsi = argv

	; Registers
	; rbx = counter; callee saved
	; r12 = stored argc; callee saved
	; r13 = next param; callee saved

	enter	0, 0
	mov	rbx, 0
	mov	r12, rdi
	mov	r13, rsi


pnext:	mov	rdx, [r13] ; rdx = second argument
	mov	rsi, rbx ; rsi = first argument
	lea	rdi, [rel .datum] ; rdi = format string
	mov	rax, 0 ; rax = number of vector arguments
	call	_printf

	add	rbx, 1
	add	r13, 8
	cmp	rbx, r12
	jnz	pnext

	exit 0
section .rodata

.datum db `%u : %s\n\0`
