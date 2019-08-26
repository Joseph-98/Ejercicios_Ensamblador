; Alumno: Joseph Iñaguazo

%macro escribir 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

section .data

	mensaje1 db 'Valor 1',10
	len_mensaje1 equ $-mensaje1

	mensaje2 db 'Valor 2',10
	len_mensaje2 equ $-mensaje2

	msj db 'La resta es:'
	len equ $-msj
	resta db '   '


	archivo1 db '/home/joshep/Escritorio/Ensamblador/archivo1.txt',0 ;-----pwd-->obtiene la ruta
	archivo2 db '/home/joshep/Escritorio/Ensamblador/archivo2.txt',0 

section .bss
	texto resb 25		; variable que almacena el contenido del archivo
	texto2 resb 25

	idarchivo1 resd 1 	; identificador que se obtiene del archivo, el archivo es el fisico
	idarchivo2 resd 1

section .text
	global _start

_start:

	;LECTURA DEL PRIMER ARCHIVO 1	

	mov eax, 5		;servicio 5 para leer el archivo
	mov ebx, archivo1	;direccion del archivo
	mov ecx,0 		;modo de acceso-->leer=0, escribir=1, leer y escribir=2
	mov edx,0 		;permite leer si esta craeado
	int 80h 

	test eax,eax		;instruccion de comparacion-->modifica el valor de las banderas
	jz salir

	mov dword[idarchivo1], eax

	escribir mensaje1, len_mensaje1

	mov eax,3		;servicio 3 lectura	
	mov ebx,[idarchivo1]	;unidad de entrada
	mov ecx,texto
	mov edx,25
	int 80h
	
	escribir texto , 25

	mov eax,6		;servicio 6 cerrar el archivo
	mov ebx,[idarchivo1]
	mov ecx,0
	mov edx,0
	int 80h

	;LECTURA ARCHIVO 2

	mov eax, 5		;servicio 5 para leer el archivo
	mov ebx, archivo2	;direccion del archivo
	mov ecx,0 		;modo de acceso-->leer=0, escribir=1, leer y escribir=2
	mov edx,0 		;permite leer si esta craeado
	int 80h 

	test eax,eax		;instruccion de comparacion-->modifica el valor de las banderas
	jz salir

	mov dword[idarchivo2], eax

	escribir mensaje2, len_mensaje2

	mov eax,3		;servicio 3 lectura	
	mov ebx,[idarchivo2]	;unidad de entrada
	mov ecx,texto2
	mov edx,25
	int 80h
	
	escribir texto2 , 25

	mov eax,6		;servicio 6 cerrar el archivo
	mov ebx,[idarchivo2]
	mov ecx,0
	mov edx,0
	int 80h

	;RESTA DE LOS DOS ARCHIVOS
	
	mov ecx, 3		;numero de operaciones
	mov esi, 2		;posicion del numero
	clc			;permite poner la bandera del carry en 0(cf=0)

loop_resta:
	mov al, [texto + esi]
	sbb al, [texto2 + esi]  ; suma el acarreo a la resta en binario
	aas                 ; ajusta la operacion binaria al sistema decimal
	pushf
	or al, 30h
	popf
	mov [resta + esi], al
	dec esi
	loop loop_resta
	
	escribir msj, len
	escribir resta, 3
	
	

salir:

	mov eax,1
	int 80h
