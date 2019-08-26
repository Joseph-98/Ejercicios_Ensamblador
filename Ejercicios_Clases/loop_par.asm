section .data
	msj1 db 'Ingrese un numero par para continuar o impar para terminar', 0xA, 0xD
	len equ $-msj1
	par db 'Ingrese otro #', 0xA, 0xD
	len1 equ $-par
	impar db 'ha salido del sistema'
	len2 equ $-impar

section .bss
	n1 resb 5

section .text
	global _start

_start :
	jmp mensaje_prin
	
mensaje_prin :
	mov eax, 4 	 ;funcion
	mov ebx, 1	 ;parametro
	mov ecx, msj1    ;dato
	mov edx, len	 ;tamaño
	int 80h
	jmp lectura

lectura :
	mov eax, 3
	mov ebx, 2
	mov ecx, n1
	mov edx, 2
	int 80h
	jmp proceso

proceso :
	mov ax, [n1]
	and ax, 1
	jz mensaje_prin
	jmp salir

salir :
	mov eax, 1
	int 80h
