section .data
	msj_negativo db 'es negativo'
	len_negativo equ $ - msj_negativo
	msj_positivo db 'es positivo'
	len_positivo equ $ - msj_positivo

section .text 
	global _start

_start:
	mov ax, 10
	sub ax, 20
	;mov ax, 20
	;sub ax, 10
	js negativo
	jmp positivo
	
negativo:
	mov eax,4
	mov ebx,2
	mov ecx,msj_negativo
	mov edx,len_negativo
	int 80h
	jmp salir

positivo:
	mov eax,4
	mov ebx,2
	mov ecx,msj_positivo
	mov edx,len_positivo
	int 80h
	jmp salir

salir:
	mov eax,1
	int 80h
