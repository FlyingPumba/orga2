global solo_verde
 
section .data
mask_verde: db 0,255,0,	0,255,0, 0,255,0, 0,255,0, 0,255,0, 0
mask_verde2: db 0, 0,255,0,	0,255,0, 0,255,0, 0,255,0, 0,255,0

section .text
; void solo_verde(uint8_t * data)
solo_verde:
	push rbp
	mov rbp, rsp
	push rbx
	push r12
	push r14
	push r15
 
 	mov rbx, rdi ; rbx = *data
	xor r14, r14 ; Contador de filas
    movdqu xmm1, [mask_verde] 	; Cargo la mascara. xmm1 = |0|0|255|0|...|0|255|0|
    movdqu xmm2, [mask_verde2] 	; Cargo la mascara. xmm2 = |0|255|0|...|0|255|0|0|
	.ciclo1:
		xor rcx , rcx ; Contador de columnas
        mov rax, 1536
        mul r14
        mov r15, rax
		.ciclo2:
            mov rdi, rcx
            add rdi, r15
			movdqu xmm0, [rbx + rdi] ; xmm0 = |byte basura|p5|p4|p3|p2|p1|
			pand xmm0, xmm1				; Aplico la mascara
			movdqu [rbx + rdi], xmm0		; Bajo

			add rcx, 15					; Avanzo lo que calcule
			cmp rcx, 510*3 				; Me fijo si termine el ancho
			jl .ciclo2

            sub rcx, 10 ; procesamos los ultimos dos bytes

            mov rdi, rcx
            add rdi, r15
			movdqu xmm0, [rbx + rdi] ; xmm0 = |p512|p511|p510|p509|p508|byte basura|
			pand xmm0, xmm2				; Aplico la mascara
			movdqu [rbx + rdi], xmm0		; Bajo
			
		    inc r14	; Incremento el contador de filas

			cmp r14,512 				; Me fijo si termine las filas
			je .fin
			jmp .ciclo1
	.fin:	
		pop r15
		pop r14
		pop r12
		pop rbx
        pop rbp
		ret
	
