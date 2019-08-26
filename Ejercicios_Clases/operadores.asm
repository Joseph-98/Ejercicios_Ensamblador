section .data
	suma db 'La suma de 3+5 es:',0xA,0xD
	len_suma equ $ - suma

	resta db 0xA,0xD,'La resta de 5-3 es:',0xA,0xD
	len_resta equ $ - resta
	
	incremento db 0xA,0xD,'El incremento de eax es:',0xA,0xD
	len_incremento equ $ - incremento
	
	decremento db 0xA,0xD,'El decremento de eax es:',0xA,0xD
	len_decremento equ $ - decremento

section .bss
	res resb 1

section .text
	global _start

_start:
	;***************suma********
	mov eax, 4
	mov ebx, 1
	mov ecx, suma
	mov edx, len_suma
	int 80h

	mov eax,5
	mov ebx,3
	add eax,ebx
	add eax,'0'
	mov [res],eax

	mov eax, 4
	mov ebx, 1
	mov ecx, res
	mov edx, 3
	int 80h

	; **********************resta******************

	mov eax, 4
	mov ebx, 1
	mov ecx, resta
	mov edx, len_resta
	int 80h

	mov eax,5
	mov ebx,3
	sub eax,ebx
	add eax,'0'
	mov [res],eax

	mov eax, 4
	mov ebx, 1
	mov ecx, res
	mov edx, 3
	int 80h

	; **********************incremento******************

	mov eax, 4
	mov ebx, 1
	mov ecx, incremento
	mov edx, len_incremento
	int 80h

	mov eax,5
	inc eax
	add eax,'0'
	mov [res],eax

	mov eax, 4
	mov ebx, 1
	mov ecx, res
	mov edx, 1
	int 80h


	; **********************decremento******************

	mov eax, 4
	mov ebx, 1
	mov ecx, decremento
	mov edx, len_decremento
	int 80h

	mov eax,5
	dec eax
	add eax,'0'
	mov [res],eax

	mov eax, 4
	mov ebx, 1
	mov ecx, res
	mov edx, 1
	int 80h


	mov eax,1
	int 80h

	
