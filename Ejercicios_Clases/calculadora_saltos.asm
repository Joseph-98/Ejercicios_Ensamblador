section .data
	msg_n1		db		10,'Numero 1: ',0
	len_msg_n1	equ		$ - msg_n1
 
	msg_n2		db		'Numero 2: ',0
	len_msg_n2	equ		$ - msg_n2
  
	msg_res		db		10,'Resultado xxx: ',0
	len_msg_res	equ		$ - msg_res
   
section .bss
	num1:		resb	2
	num2:		resb 	2
	resultado:	resb 	2
 
section .text 
	global _start
 
_start: 
	; ************* número 1***************
	mov eax, 4
	mov ebx, 1
	mov ecx, msg_n1
	mov edx, len_msg_n1
	int 80h
 
	mov eax, 3
	mov ebx, 0
	mov ecx, num1
	mov edx, 2
	int 80h
 
	; ************* número 2***************
	mov eax, 4
	mov ebx, 1
	mov ecx, msg_n2
	mov edx, len_msg_n2
	int 80h
 
	mov eax, 3
	mov ebx, 0
	mov ecx, num2
	mov edx, 2
	int 80h

 	; ************* Inician los saltos*************** 
	jmp multiplicar 
 
sumar:
	mov al, [num1]
	mov bl, [num2]
 
	sub al, '0' 	; Convertimos los valores ingresados de ascii a decimal
	sub bl, '0'
 
	add al, bl	
 	add al, '0'
 
	mov [resultado], al

	mov [msg_res + 11], dword 'sum' 

	mov eax, 4
	mov ebx, 1
	mov ecx, msg_res
	mov edx, len_msg_res
	int 80h
 
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, 2
	int 80h
 
	jmp salir
 
restar:
	mov al, [num1]
	mov bl, [num2]
 
	sub al, '0'
	sub bl, '0'
 
	sub al, bl
 	add al, '0'
 
	mov [resultado], al
 
	mov [msg_res + 11], dword 'res' 

	mov eax, 4
	mov ebx, 1
	mov ecx, msg_res
	mov edx, len_msg_res
	int 80h
 
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, 1
	int 80h
 
	jmp dividir
 
multiplicar:
	mov al, [num1]
	mov bl, [num2]
 
	sub al, '0'
	sub bl, '0'
 
	mul bl 		; Multiplicamos. AX = AL X BL
	add ax, '0'
 
	mov [resultado], ax

	mov [msg_res + 11], dword 'mul'  

	mov eax, 4
	mov ebx, 1
	mov ecx, msg_res
	mov edx, len_msg_res
	int 80h
 
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, 1
	int 80h
 
	jmp restar
 
dividir:
	mov al, [num1]
	mov bl, [num2]
 
	mov dx, 0
	mov ah, 0
 
	sub al, '0'
	sub bl, '0'
 
	div bl
 
	add ax, '0'
 
	mov [resultado], ax

	mov [msg_res + 11], dword 'div'  

	mov eax, 4
	mov ebx, 1
	mov ecx, msg_res
	mov edx, len_msg_res
	int 80h
 
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, 1
	int 80h

	jmp sumar
 
salir: 
	mov eax, 1
	mov ebx, 0
	int 80h
