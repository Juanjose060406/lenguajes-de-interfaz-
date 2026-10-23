;============================================================
; PRACTICA 12: Desplazamiento y rotacion
; Materia: Lenguajes de Interfaz - Unidad 2
; Nombre: Angulo Martinez Juan Jose
; Horario: 8:00-9:00 a. m.
; Docente: Dr. Jose Luis Medina Jimenez
; Arquitectura: MASM x86 de 32 bits + Irvine32
;============================================================
INCLUDE Irvine32.inc


.data
    msg BYTE "Resultado: ",0
.code
main PROC
    mov al, 00001100b
    shl al, 1              ; Desplaza a la izquierda
    movzx eax, al
    mov edx, OFFSET msg
    call WriteString
    call WriteBin
    call Crlf

    mov al, 00001100b
    shr al, 1              ; Desplaza a la derecha, rellena con 0
    movzx eax, al
    call WriteBin
    call Crlf

    mov al, 10000001b
    rol al, 1              ; Rota el bit superior al inferior
    movzx eax, al
    call WriteBin
    call Crlf

    mov al, 10000001b
    ror al, 1              ; Rota el bit inferior al superior
    movzx eax, al
    call WriteBin
    call Crlf
    exit
main ENDP
END main
