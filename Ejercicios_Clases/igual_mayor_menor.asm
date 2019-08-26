section .data
	msj_negativo db '1 XXXX'
	len_negativo equ $ - msj_negativo
	msj_positivo db 'es positivo'
	len_positivo equ $ - msj_positivo

section .text 
	global _start

_start:
	mov ax, 6
	mov bx, 5
	jg mayor
	
mayor:
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
