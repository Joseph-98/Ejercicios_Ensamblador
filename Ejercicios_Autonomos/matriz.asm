section .data
	msj db " *"
	lenMsj equ $ -msj
	
	salto db "",10
	leng_salto equ $ -salto

	msjDatCol db "Ingrese el valor para la matriz: "
	lengMsjDataCol equ $-msjDatCol
	
section .bss
	num resb 10

section .text
	global _start

_start:
	;imprimimos el mensaje
	mov eax, 4
	mov ebx, 1
	mov ecx, msjDatCol
	mov edx, lengMsjDataCol
	int 80H

	;guardamos el dato en memoria
	mov eax, 3
	mov ebx, 2
	mov ecx, num
	mov edx, 2;da la siguiente linea a leeer
	int 80H

	mov al,[num]
	sub eax,'0'

	;inicializamos la variable para que nos de el numero de columnas
	mov ecx, eax
	push ecx
	jmp colum

;for (int i=10;i>0;i--){
;	for(int j=10;j>0;i--){codigo}
;codigo
;}


colum:

	;imprimimos un salto de linea
	mov eax, 4
	mov ebx, 1
	mov ecx, salto
	mov edx, 1
	int 80H


	;ejecutamos para la interaccion en i
	pop ecx
	cmp ecx, 0
	jz  salir
	dec ecx
	push ecx

	;le damos la variable de inicializacion a j
	mov al,[num]
	sub eax,'0'
	
	mov ecx, eax
	push ecx
	jmp fila

fila:
	pop ecx
	cmp ecx, 0
	
	jz  colum
	push ecx
	jmp imprimir

imprimir:
	mov eax, 4
	mov ebx, 1
	mov ecx, msj
	mov edx, lenMsj
	int 80H
	pop ecx
	dec ecx
	push ecx
	jmp fila

salir:
	mov eax, 1
	mov ebx, 0
	int 80H
