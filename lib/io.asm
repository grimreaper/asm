%include "macro/libc.inc"
;type c_string_out, @function
section .text

global c_line_out
c_line_out:
; Prints a null terminated string with a newline
; all registers are caller saved
; rdi = pointer to start of string
; no return
	enter 0, 0
	mov rsi, rdi
	lea rdi, [rel .newline_string_format]
	mov rax, 1
	call printf

	mov	rdi, 0
	mov	rax, 1
	call	fflush

	leave
	ret
.newline_string_format db "%s", `\n`, 0

global c_string_out
c_string_out:
; Prints a null terminated string
; all registers are caller saved
; rdi = pointer to start of string
; no return
	enter 0, 0
	mov rsi, rdi
	lea rdi, [rel .pure_string_format]
	mov rax, 1
	call printf

	mov	rdi, 0
	mov	rax, 1
	call	fflush

	leave
	ret

.pure_string_format db "%s", 0
