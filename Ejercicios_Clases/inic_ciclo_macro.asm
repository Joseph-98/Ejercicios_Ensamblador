%macro escribir 2 
	mov eax, 4
	mov ebx, 2
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro


section .data
	msj1 db 'Iniciar ciclo'
	len_msj1 equ $-msj1
	msj2 db 'Realizado por:'
	len_msj2 equ $-msj2
	nombre db 'Joseph'
	len_nombre equ $-nombre
	msj3 db 'Fin del ciclo'
	len_msj3 equ $-msj3
	
section .text
	global _start

_start:

	escribir msj1, len_msj1
	
	escribir msj2, len_msj2

	mov cx, 5
	
l1:
	push cx
	escribir nombre, len_nombre
	pop cx
	loop l1	

	escribir msj3, len_msj3
	
salir:	
	mov eax,1
	int 80h

	
