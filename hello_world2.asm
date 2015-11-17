%include "macro/libc.inc"
%include "macro/common.inc"

extern c_string_out

global _main

section .text

_main:
	enter	0, 0
	lea	rdi, [rel txt]
	call	c_string_out

	mov	rdi, 0
	call exit
section .rodata

txt:	db	`Hello, World!\n\0`
