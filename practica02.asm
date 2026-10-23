;============================================================
; PRACTICA 2: Captura y despliegue de mensaje
; Materia: Lenguajes de Interfaz - Unidad 2
; Nombre: Angulo Martinez Juan Jose
; Horario: 8:00-9:00 a. m.
; Docente: Dr. Jose Luis Medina Jimenez
; Arquitectura: MASM x86 de 32 bits + Irvine32
;============================================================
INCLUDE Irvine32.inc


.data
    pregunta BYTE "Escribe un mensaje: ",0
    salida BYTE "Tu mensaje fue: ",0
    entrada BYTE 101 DUP(0)
.code
main PROC
    mov edx, OFFSET pregunta
    call WriteString

    mov edx, OFFSET entrada
    mov ecx, 100
    call ReadString       ; Captura texto en entrada

    mov edx, OFFSET salida
    call WriteString
    mov edx, OFFSET entrada
    call WriteString
    call Crlf
    exit
main ENDP
END main
