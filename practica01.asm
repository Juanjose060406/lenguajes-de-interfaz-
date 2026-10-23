;============================================================
; PRACTICA 1: Ciclos numericos
; Materia: Lenguajes de Interfaz - Unidad 2
; Nombre: Angulo Martinez Juan Jose
; Horario: 8:00-9:00 a. m.
; Docente: Dr. Jose Luis Medina Jimenez
; Arquitectura: MASM x86 de 32 bits + Irvine32
;============================================================
INCLUDE Irvine32.inc


.data
    mensaje BYTE "Contador del 1 al 10:",0
.code
main PROC
    mov edx, OFFSET mensaje
    call WriteString
    call Crlf

    mov ecx, 10          ; Numero de repeticiones
    mov eax, 1           ; Primer valor

ciclo:
    call WriteDec        ; Mostrar el contador
    call Crlf
    inc eax              ; Incrementar contador
    loop ciclo           ; Repetir mientras ECX != 0

    exit
main ENDP
END main
