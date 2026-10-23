;============================================================
; PRACTICA 5: Condicionales
; Materia: Lenguajes de Interfaz - Unidad 2
; Nombre: Angulo Martinez Juan Jose
; Horario: 8:00-9:00 a. m.
; Docente: Dr. Jose Luis Medina Jimenez
; Arquitectura: MASM x86 de 32 bits + Irvine32
;============================================================
INCLUDE Irvine32.inc


.data
    pregunta BYTE "Ingresa un numero: ",0
    positivo BYTE "El numero es mayor que cero.",0
    noPositivo BYTE "El numero es cero o menor.",0
.code
main PROC
    mov edx, OFFSET pregunta
    call WriteString
    call ReadInt

    cmp eax, 0
    jg esPositivo

    mov edx, OFFSET noPositivo
    call WriteString
    jmp fin

esPositivo:
    mov edx, OFFSET positivo
    call WriteString

fin:
    call Crlf
    exit
main ENDP
END main
