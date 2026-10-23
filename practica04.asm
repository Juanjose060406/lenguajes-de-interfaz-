;============================================================
; PRACTICA 4: Saltos
; Materia: Lenguajes de Interfaz - Unidad 2
; Nombre: Angulo Martinez Juan Jose
; Horario: 8:00-9:00 a. m.
; Docente: Dr. Jose Luis Medina Jimenez
; Arquitectura: MASM x86 de 32 bits + Irvine32
;============================================================
INCLUDE Irvine32.inc


.data
    mensaje BYTE "Salto condicional: ",0
    casoVerdadero BYTE "EAX es cero.",0
    casoFalso BYTE "EAX no es cero.",0
.code
main PROC
    mov edx, OFFSET mensaje
    call WriteString

    mov eax, 0
    cmp eax, 0
    je esCero              ; Salta si son iguales

    mov edx, OFFSET casoFalso
    call WriteString
    jmp fin

esCero:
    mov edx, OFFSET casoVerdadero
    call WriteString

fin:
    call Crlf
    exit
main ENDP
END main
