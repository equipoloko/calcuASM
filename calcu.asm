MODEL SMALL

.STACK 
;--------------------------INICIALIZACION DE PILA----------------------------

  ORG	100H

.DATA 
;-------------------------DECLARACION DE VARIABLES---------------------------

  menu db 'Menu:',13,10,'$'
  suma db '1.- Suma', 13, 10, '$'
  resta db '2.- Resta', 13, 10, '$'
  multi db '3.- Multiplicacion', 13, 10, '$'
  divi db '4.- Division', 13, 10, '$'
  op db 'Elige una opcion: ', 13, 10, '$'
  
  primer db 'Dame el primer numero: ', 13, 10, '$'
  segundo db 'Dame el segundo numero', 13, 10, '$'
  resultado db 'Elige una opcion: ', 13, 10, '$'
  presiona db 'Presiona una tecla para continuar', 13, 10, '$'
  
  opcion  db  01+1,0ffh dup(0)
  num1  db  02+1,0ffh dup(0)
  num2  db  02+1,0ffh dup(0)
  
  enter1  db  13,10,'$'

.CODE

;----------------------------INICIO DE PROGRAMA------------------------------
INICIO:	
  MOV AX,@DATA
  MOV DS,AX		;OBTENEMOS LA DIRECCION DEL SEGMENTO DE DATOS

  ;cuerpo principal

  call clrscr; MACRO
   
  lea dx, menu 
  call mostrar
  lea dx, suma 
  call mostrar
  lea dx, resta 
  call mostrar
  lea dx, multi 
  call mostrar
  lea dx, divi 
  call mostrar
  lea dx, op 
  call mostrar
  
  lea	dx, opcion
  call leer
  lea bx, opcion
  inc bx
  mov ah, 0
  mov al, [bx]
  inc bx
  add bx, ax
  mov byte ptr [bx], 24h; usa un solo byte

  lea dx, enter1
  call mostrar

  lea dx, opcion
  inc dx
  inc dx
  call mostrar

  call espera

  MOV AX,4C00H		;REALIZAMOS LA SALIDA AL DOS
  INT 21H	
	
;-------------------------------FIN DE PROGRAMA------------------------------

clrscr proc near ;limpia la pantalla
  mov ah,00h 
  mov AL,03h
  int 10h
ret
clrscr endp

mostrar proc near ;despliega cadena indexada por DX
 mov ah,09h
 int 21h
 ret
mostrar endp

espera proc near ; espera una tecla (captura tecla en AL sin eco)
  mov ah,08h 
  int 21h
ret
espera endp

leer proc near ; captura cadena en el buffer indexado por DX
	mov	ah,0ah		
	int	21h
ret
leer endp

END INICIO