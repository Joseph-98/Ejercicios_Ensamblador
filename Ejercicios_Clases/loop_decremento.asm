section .data
	msj db "Ingrese un número:"
	len equ $ - msj
	new_line db '',10

section .bss
	numero resb 2
	resultado resb 1
	
section .text
	global _start

_start :
	; ******* mensaje ingrese número
	mov eax, 4
	mov ebx, 1
	mov ecx, msj
	mov edx, len
	int 80h

	mov eax, 3
	mov ebx, 2
	mov ecx, numero
	mov edx, 1
	int 80h

	mov ecx, [numero]
	sub ecx, '0'	
	jmp imprimir

imprimir:
	push ecx		; en numero
	mov eax, ecx
	add eax, '0'
	mov [numero], eax

	mov eax, 4
	mov ebx, 1
	mov ecx, numero
	mov edx, 1
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, new_line
	mov edx, 1
	int 80h

	pop ecx
	loop imprimir
	jmp salir
salir:
	mov eax, 1
	int 80h
