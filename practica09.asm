;============================================================
; PRACTICA 9: PUSH y POP
; Materia: Lenguajes de Interfaz - Unidad 2
; Nombre: Angulo Martinez Juan Jose
; Horario: 8:00-9:00 a. m.
; Docente: Dr. Jose Luis Medina Jimenez
; Arquitectura: MASM x86 de 32 bits + Irvine32
;============================================================
INCLUDE Irvine32.inc


.data
    mensaje1 BYTE "Primer valor recuperado: ",0
    mensaje2 BYTE "Segundo valor recuperado: ",0
    primero DWORD ?
    segundo DWORD ?
.code
main PROC
    mov eax, 25
    mov ebx, 43
    push eax              ; Guarda 25
    push ebx              ; Guarda 43

    pop eax               ; Recupera 43 primero
    mov primero, eax
    pop eax               ; Recupera 25 despues
    mov segundo, eax

    mov edx, OFFSET mensaje1
    call WriteString
    mov eax, primero
    call WriteDec
    call Crlf

    mov edx, OFFSET mensaje2
    call WriteString
    mov eax, segundo
    call WriteDec
    call Crlf
    exit
main ENDP
END main
