%macro escribir 2 
	mov eax, 4
	mov ebx, 2
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

section .data
	msj1 db 'La resta es:', 10
	len_msj1 equ $-msj1
	num1 db '518'
	num2 db '197' 
	resta db '   '
	
section .text
	global _start

_start:
	mov ecx, 3       ; numero de operaciones de resta
	mov esi, 2       ; posición del dígito en cada cadena n1 y n2
	clc              ; pone la bandera del carry en cero (apagada)
	
loop_resta:
	mov al, [num1 + esi]
	sbb al, [num2 + esi]  ; suma el acarreo a la resta en binario
	aas                 ; ajusta la operacion binaria al sistema decimal
	pushf
	or al, 30h
	popf
	mov [resta + esi], al
	dec esi
	loop loop_resta
	escribir msj1, len_msj1
	escribir resta, 3
	
salir:
	mov eax,1
	int 80h
