;============================================================
; PRACTICA 6: Decremento e incremento
; Materia: Lenguajes de Interfaz - Unidad 2
; Nombre: Angulo Martinez Juan Jose
; Horario: 8:00-9:00 a. m.
; Docente: Dr. Jose Luis Medina Jimenez
; Arquitectura: MASM x86 de 32 bits + Irvine32
;============================================================
INCLUDE Irvine32.inc


.data
    mensaje BYTE "Valor: ",0
    valor DWORD 5
.code
main PROC
    mov ecx, 5
ciclo:
    mov edx, OFFSET mensaje
    call WriteString
    mov eax, valor
    call WriteDec
    call Crlf
    inc valor              ; Incrementar variable
    loop ciclo

    dec valor              ; Decrementar una vez
    exit
main ENDP
END main
