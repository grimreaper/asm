; A program which prints out envp, line by line

%include "macro/common.inc"
%include "macro/libc.inc"
%include "lib/io.inc"

global _main

section .text

_main:
	; On Entry:
	; 	rdi = argc
	; 	rsi = argv
	;	rdx = envp

	; Registers
	; r12 = current envp

	enter	0, 0
	mov	r12, [rdx]

pnext:	cmp     dword [r12], 0
	jz	over
	mov	rdi, r12
	call	c_line_out
	
	; find the nul terminator and move on
	cld
	mov	rdi, r12
	mov	rax, 0
	repne scasb
	mov	r12, rdi

	jmp	pnext

over:	M_sys_exit 0
