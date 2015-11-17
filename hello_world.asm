%include "macro/common.inc"

%define SYS_WRITE 0x2000004
%define STDOUT 1

global _main

section .text

_main:
	mov	rax, SYS_WRITE
	mov	rdi, STDOUT
	lea	rsi, [rel txt]
	mov	rdx, txt.len
	syscall

	exit 0
section .rodata

txt:	db	"Hello, World!", `\n`
.len:	equ	$ - txt

