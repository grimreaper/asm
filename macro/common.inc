%define SYS_EXIT 0x2000001
%macro M_sys_exit 1
	mov	rax, SYS_EXIT
	mov	rdi, %1
	syscall
%endmacro

