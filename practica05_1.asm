;============================================================
; PRACTICA 5.1: Repetir hasta que el usuario ingrese 0
; Materia: Lenguajes de Interfaz - Unidad 2
; Nombre: Angulo Martinez Juan Jose
; Horario: 8:00-9:00 a. m.
; Docente: Dr. Jose Luis Medina Jimenez
; Arquitectura: MASM x86 de 32 bits + Irvine32
;============================================================
INCLUDE Irvine32.inc


.data
    pregunta BYTE "Ingresa un numero (0 para terminar): ",0
    aviso BYTE "Ingresaste: ",0
.code
main PROC
repetir:
    mov edx, OFFSET pregunta
    call WriteString
    call ReadInt

    cmp eax, 0
    je terminar

    push eax              ; Guardar el numero mientras se muestra el aviso
    mov edx, OFFSET aviso
    call WriteString
    pop eax
    call WriteInt
    call Crlf
    jmp repetir

terminar:
    exit
main ENDP
END main
