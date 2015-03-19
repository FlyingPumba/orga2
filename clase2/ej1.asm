global sumar
section .text
	sumar:
	mov rax, 0
	add rax, rdi
	add rax, rsi
	ret
