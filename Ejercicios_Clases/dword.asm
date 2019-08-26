;byte 		1
;Word		2
;dword		4
;qword		8
;tbyte		10

section .data
	mensaje: db "Hola Clase", 10
	tamano: equ $-mensaje

section .text
	global _start
_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, mensaje
	mov edx, tamano
	int 0x80

	mov [mensaje], dword 'mala'

	mov eax, 4
	mov ebx, 1
	mov ecx, mensaje
	mov edx, tamano
	int 0x80

	mov [mensaje + 5], dword 'dia'

	mov eax, 4
	mov ebx, 1
	mov ecx, mensaje
	mov edx, tamano
	int 0x80


	mov eax, 1
	mov ebx, 0
	int 0x80
