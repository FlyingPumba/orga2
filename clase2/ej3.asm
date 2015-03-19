global imprimir_parametros
extern printf
section .text
	imprimir_parametros:
	mov rax, 1
	sub rsp, 8
	call printf
	add rsp, 8
	ret
