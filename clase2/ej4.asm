global suma_parametros
extern printf
section .text
	suma_parametros:
    sub rdi, rsi    ; rdi: a1 - a2
    sub rdx, rcx    ; rdx: a3 - a4
    sub r8, r9      ; r8: a5 - a6
    ;pop rcx         ; rcx: a8
    ;pop r9          ; r9: a7
    sub r9, rcx     ; r9: a7 - a8
    add rdi, rdx    ; rdi: a1 - a2 + a3 - a4
    add rdi, r8     ; rdi: a1 - a2 + a3 - a4 + a5 - a6
    add rdi, r9     ; rdi: a1 - a2 + a3 - a4 + a5 - a6 + a7 - a8
    mov rax, rdi    ; result in rax
	ret
