
global suma_por_filas
extern malloc 
extern free

section .data

section .text

suma_por_filas:

	push rbp
	mov rbp, rsp
	push rbx
	push r12
	push r14
	push r15


	; Pido array para resultado
	mov rdi, r14  
	call malloc 

 
 	mov rbx, rdi ; mat
 	mov r14, rsi ; w		
 	mov r15, rdx ; h		
 	
	
	
	xor r12, r12  ; columna de inicio de ciclo
	xor r13, r13 ; contador de filas
	
	pxor xmm8,xmm8 ; Lo voy a usar como mascara

	.ciclo1:
		mov rcx, rbx	; voy al inicio de la matriz
		pxor xmm0, xmm0
		.ciclo2:
			movdqu xmm1, [rcx+r12]		; voy a la columna que corresponda
			paddw xmm0,xmm1				; sumo en el acumulado
			add rcx , r14 				; incremento una fila
			inc r13
			cmp r13, r15				; si es menor sigo procesando filas
			jl .ciclo2
									
			movdqu [rax+r12*2] , xmm0	; bajo acumulado al resultado
			add r12,8 					; incremento en la columna que empiezo
			xor r13,r13					; reseto el contador de filas
			cmp r12, r14
			jl .ciclo1
	.fin:	
		; Libero memoria asi no la pierdo
		mov rdi, rax
		call free
		pop r15
		pop r14
		pop r12
		pop rbx
		pop rbp
		ret
	
