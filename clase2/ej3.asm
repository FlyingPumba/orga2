section .data
    formato: DB '%d %5.2f %s', 10
    largo EQU $ - formato
global imprimir_parametros
extern printf
section .text
	imprimir_parametros:
    push rbp ; align stack
    mov rbp, rsp ; move rbp to current rsp
    mov rdx, rsi ; move rsi one slot ahead: rdx <- rsi
    mov rsi, rdi ; move rdi one slot ahead: rsi <- rdi
    mov rdi, formato ; put format in rdi
	call printf
    pop rbp ; restore stack
	ret
