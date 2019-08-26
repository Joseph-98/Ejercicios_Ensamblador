section .data
	msj_n1		db		10,'Numero 1: ',0
	len_n1		equ		$ - msj_n1
	msj_n2		db		'Numero 2: ',0
	len_n2		equ		$ - msj_n2

	iguales		db		10,'Iguales'
	len_iguales	equ		$ - iguales
	no_iguales	db		10,'NO Iguales'
	len_no_iguales	equ		$ - no_iguales
 
section .bss 
	n1:		resb	1
	n2:		resb 	1
 
section .text
	global _start
 
_start:
	; Imprimimos en pantalla el mensaje 1
	mov eax, 4
	mov ebx, 1
	mov ecx, msj_n1
	mov edx, len_n1
	int 80h
  
	; Obtenemos el numero 1
	mov eax, 3
	mov ebx, 0
	mov ecx, n1
	mov edx, 2
	int 80h
 
	; Imprimimos en pantalla el mensaje 3
	mov eax, 4
	mov ebx, 1
	mov ecx, msj_n2
	mov edx, len_n2
	int 80h
 
	; Obtenemos el numero 2
	mov eax, 3
	mov ebx, 0
	mov ecx, n2
	mov edx, 2
	int 80h

	mov al, [n1]
	mov bl, [n2]
 
	sub al, '0'	; Convertimos los valores ingresados de ascii a decimal
	sub bl, '0'
 
	cmp al, bl
	jz imprmir_iguales
	jmp imprmir_no_iguales

imprmir_iguales:
	mov eax, 4
	mov ebx, 1
	mov ecx, iguales
	mov edx, len_iguales
	int 80h
	jmp salir	
 
imprmir_no_iguales:
	mov eax, 4
	mov ebx, 1
	mov ecx, no_iguales
	mov edx, len_no_iguales
	int 80h

salir:
	mov eax, 1
	mov ebx, 0
	int 80h
