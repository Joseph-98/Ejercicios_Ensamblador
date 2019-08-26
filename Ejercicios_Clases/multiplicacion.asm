section .data
	msg db "El resultado es:", 0xA,0xD 
	len equ $- msg 

segment .bss
	res resb 1
	resax resb 2


section	.text
   global _start    

_start:             
	mov al,'3' 	; movimientos a al
	sub al, '0'
	
	mov bl, '2'	; movimientos a bl
	sub bl, '0'

	mul bl		; multiplicación
	add al, '0'
	
	mov [res], al
	mov [resax], ax

	mov ecx,msg	
	mov edx, len
	mov eax,4	;lectura del primer mensaje
	mov ebx,1	
	int 0x80	;call kernel
	
	mov ecx,res
	mov edx, 1
	mov eax,4	; lectura del segundo mensaje
	mov ebx,1
	int 0x80

	mov ecx,resax
	mov edx, 1
	mov eax,4	; lectura del segundo mensaje
	mov ebx,1
	int 0x80	

	mov eax,1 ; salida
	int 0x80
