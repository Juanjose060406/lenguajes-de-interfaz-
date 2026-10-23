;============================================================
; PRACTICA 3: Comparacion y prueba
; Materia: Lenguajes de Interfaz - Unidad 2
; Nombre: Angulo Martinez Juan Jose
; Horario: 8:00-9:00 a. m.
; Docente: Dr. Jose Luis Medina Jimenez
; Arquitectura: MASM x86 de 32 bits + Irvine32
;============================================================
INCLUDE Irvine32.inc


.data
    a DWORD 12
    b DWORD 12
    igual BYTE "Los valores son iguales.",0
    diferente BYTE "Los valores son diferentes.",0
.code
main PROC
    mov eax, a
    cmp eax, b            ; Compara sin guardar una resta
    jne noIguales

    mov edx, OFFSET igual
    call WriteString
    jmp terminar

noIguales:
    mov edx, OFFSET diferente
    call WriteString

terminar:
    call Crlf
    exit
main ENDP
END main
