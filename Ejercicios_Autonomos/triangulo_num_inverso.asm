section .data
	nueva_linea db 10,''

section .bss
	resultado resb 1

section .text

	global _start
_start:
	
	mov ecx,9	
	mov ebx,9

;********imprimir enter y evaluar cada fila********
l1:

	push ecx 
	push ebx

	call imprimir_enter; se reemplaza el valor de cx por enter y se reemplaza el valor de ebx por 1

	pop ecx
	push ecx 
	

;********imprimir numero y evaluar cada columna******
l2:
	push ecx
	add ecx, '0'
	mov[resultado],ecx
	call imprimir_numero; se reeplaza el valor de cx por numero y se reemplaza rl valor e ebx popr 1
	
	pop ecx
	loop l2
;*********fin de  ciclo l2*********
 	
	pop ebx
	pop ecx
	dec ebx; decrementa
	loop l1
	jmp salir

imprimir_enter:
	mov eax,4
	mov ebx,1
	mov ecx,nueva_linea
	mov edx,1
	int 80h
	ret

imprimir_numero:

	mov eax,4
	mov ebx,1
	mov ecx,resultado
	mov edx,1
	int 80h
	ret
	
salir:
	
	mov eax,1
	int 80h

