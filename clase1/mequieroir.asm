section .data
	msg: DB 'En 10 me voy ... '
	largo EQU $ - msg
	cant: DB '9'
	largo2 EQU $ - cant
	fin: DB 'CHAU!!!'
	largo3 EQU $ - fin
	return: DB 10
	largo4 EQU $ - return
global _start
section .txt
	_start:
	cmp BYTE [cant], '0'
	jz salir
	mov rax, 4 ; print En 10 me voy
	mov rbx, 1
	mov rcx, msg
	mov rdx, largo
	int 0x80
	mov rax, 4 ; print cant
	mov rbx, 1
	mov rcx, cant
	mov rdx, largo2
	int 0x80
	mov rax, 4 ; print Return
	mov rbx, 1
	mov rcx, return
	mov rdx, largo4
	int 0x80
	sub BYTE [cant], 0x1
	jmp _start
salir:	
	mov rax, 4 ; print CHAU
	mov rbx, 1
	mov rcx, fin
	mov rdx, largo3
	int 0x80
	mov rax, 4 ; print Return
	mov rbx, 1
	mov rcx, return
	mov rdx, largo4
	int 0x80
	mov rax, 1 ; exit 
	mov rbx, 0
	int 0x80
