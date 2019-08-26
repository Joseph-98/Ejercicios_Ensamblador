section	.data
   msj db '*'

section	.text
   global _start        ;must be declared for using gcc
	
_start:	
	mov ecx, 9
	jmp principal

principal:
	cmp ecx, 0
	jz salir
	jmp imprimir


imprimir:
	dec ecx
	push ecx
	mov eax, 4
	mov ebx, 1
	mov ecx, msj
	mov edx, 1
	int 80h
	pop ecx
	jmp principal

salir:
	mov eax,1             ;system call number (sys_exit)
	int 0x80              ;call kernel
