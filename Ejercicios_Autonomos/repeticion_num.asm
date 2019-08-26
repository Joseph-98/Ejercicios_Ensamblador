%macro escribir 2 
	mov eax, 4
	mov ebx, 2
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

section .data
	
	resultado db " n    = n     veces, n    = n     veces, n    = n     veces, n    = n     veces, n    = n     veces, n    = n     veces, n    = n     veces, n    = n     veces, n    = n     veces, n    = n     veces"
	len_resultado equ $-resultado
	
	contenido db 10
	len_contenido equ $-contenido

	
	cont db '0000000000'
	
	archivo1 db '/home/joshep/Escritorio/Ensamblador/arreglo.txt',0 ;-----pwd-->obtiene la ruta
	archivo2 db '/home/joshep/Escritorio/Ensamblador/repeticiones.txt',0 

section .bss
	texto resb 10
	idarchivo resb 1 

section .text
	global _start
	
	
_start:
	
	; *********apertura del archivo*******	
	mov eax, 5         ; servicio para abrir el archivo
	mov ebx, archivo1  ; direccion del archivo
	mov ecx, 0         ; modo de acceso, read only = 0
	mov edx, 0         ; permisos de archivo
	int 80h            ; igual a int 80h
	
	test eax, eax  ; si existe un error se va activar ZR
	jz salir
	
	; ******* archivo sin excepciones ****
	mov dword [idarchivo], eax    ; respaldo el id del archivo
	
	mov eax, 3
	mov ebx, [idarchivo]
	mov ecx, texto
	mov edx, 10
	int 80h
	
	; *********cerrar el archivo*******	
	mov eax, 6               ; servicio para abrir el archivo
	mov ebx, [idarchivo]     ; identificador del archivo
	mov ecx, 0               
	mov edx, 0              
	int 80h  
	
	mov esi, 0
	
	
loop_comparar:
	mov edi, 0
	cmp esi, 10
	jb loop
	mov esi, 0
	mov al, 0
	mov cl, 0
	mov edi, 0
	jmp comparar
	
loop:
	mov al, [texto + esi]
	mov bl, [texto + edi]
	cmp al, bl
	jz igualador
		
	inc edi
		
	cmp edi,10
	jb loop
		
	inc esi
	jmp loop_comparar
	
salto: 
	inc edi
	cmp edi,10
	jb loop
		
	inc esi
	jmp loop_comparar
		
igualador: 
	mov al,[cont + esi]
	inc al
	mov [cont + esi], al
		
	inc edi
	cmp edi,10
	jb loop
		
	inc esi
	jmp loop_comparar
	
	
comparar:
	mov al, [texto+esi]
	cmp al,cl
	jz loop_cambiar
	inc cl
	jmp comparar

loop_cambiar:
	add edi, 1
	mov [resultado + edi], dword ecx
	add edi, 19
		
loop_texto: 
	inc esi
	mov cl, 0
	cmp esi,10
	jb comparar
		
	mov esi, 0
	mov al, 0
	mov cl, 0
	mov edi, 0
	
comparar_cont:
	mov al, [cont+esi]
	cmp al,cl
	jz cambio_cont
	inc cl
	jmp comparar_cont
		
cambio_cont:
	add edi, 8
	mov [resultado + edi], dword ecx
	add edi, 12
		
loop_contador: 
	inc esi
	mov cl, 0
	cmp esi,10
	jb comparar_cont
	
	escribir resultado, len_resultado
	escribir contenido, len_contenido
	
	; *********apertura del archivo*******	
	mov eax, 8         ; servicio para crear y escribir en archivo
	mov ebx, archivo2      ; direccion del archivo
	mov ecx, 1         ; modo de acceso, = 1
	mov edx, 200h      ; permisos de archivo
	int 80h            ; igual a int 80h
	
	test eax, eax   ; test es un and sin modificar sus operandos, solo modifica banderas
	jz salir
	
	; ******* archivo sin excepciones ****
	mov dword [idarchivo], eax    ; respaldo el id del archivo
	
	mov eax, [resultado]
	mov [resultado], eax
	mov eax, 4
	mov ebx, [idarchivo]
	mov ecx, resultado
	mov edx, len_resultado
	int 80h
	
	mov eax, 6
	mov ebx, [idarchivo]
	mov ecx, 0
	mov edx, 0 
	int 80h
	
salir:
	mov eax,1
	int 80h
