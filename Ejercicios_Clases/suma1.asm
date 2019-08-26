section .data
	resultado db "El resultado es:",0xa
	len equ $-resultado
	

section .bss
	suma resb 1

section .text
	global _start
_start:

	mov eax, 2
	mov ebx, 5
	add ax,bx;
	add ax,'0';

	mov [suma],ax
	
	mov eax,4
	mov ebx,1
	mov ecx,resultado
	mov edx,len	
	int 80h

	mov eax,4
	mov ebx,1
	mov ecx,suma
	mov edx,1
	int 80h

	mov eax,1
	mov ebx,0
	int 80h
