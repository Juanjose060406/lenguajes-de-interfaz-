;============================================================
; PRACTICA 11: Operaciones logicas
; Materia: Lenguajes de Interfaz - Unidad 2
; Nombre: Angulo Martinez Juan Jose
; Horario: 8:00-9:00 a. m.
; Docente: Dr. Jose Luis Medina Jimenez
; Arquitectura: MASM x86 de 32 bits + Irvine32
;============================================================
INCLUDE Irvine32.inc


.data
    msg BYTE "Resultado en AL (decimal): ",0
.code
main PROC
    ; AND: solo quedan los bits que son 1 en ambos operandos
    mov al, 00000101b
    and al, 00000011b
    movzx eax, al
    mov edx, OFFSET msg
    call WriteString
    call WriteDec
    call Crlf

    ; OR: activa bits que sean 1 en cualquiera
    mov al, 00000101b
    or al, 00000010b
    movzx eax, al
    call WriteDec
    call Crlf

    ; XOR: activa bits diferentes
    mov al, 00000101b
    xor al, 00000010b
    movzx eax, al
    call WriteDec
    call Crlf

    ; NOT: invierte los 8 bits de AL
    mov al, 00000101b
    not al
    movzx eax, al
    call WriteDec
    call Crlf

    ; TEST: actualiza banderas sin guardar el resultado
    mov al, 00000101b
    test al, 00000010b
    jz bitApagado
    mov edx, OFFSET msg
    call WriteString
    mov eax, 1
    call WriteDec
    call Crlf
    jmp fin

bitApagado:
    mov eax, 0
    call WriteDec
    call Crlf
fin:
    exit
main ENDP
END main
