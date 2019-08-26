section .data
	msj db 'Joseph', 0xA, 0xD
	len equ $-msj

section .bss


section .text

global _start

_start :
			;--------------------- Presentar mensaje
	mov eax, 4
	mov ebx, 1
	mov ecx, msj
	mov edx, len
	int 80h
			;--------------------- Presentar estrellas
	mov eax, 4
	mov ebx, 1
	mov [msj], dword 'andr' ;dword para el tamaño al cambiar el valor
	mov ecx, msj
	mov edx, len
	int 80h
			;--------------------- Salida
	mov eax, 1
	int 80h
