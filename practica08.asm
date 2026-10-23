;============================================================
; PRACTICA 8: Operaciones aritmeticas
; Materia: Lenguajes de Interfaz - Unidad 2
; Nombre: Angulo Martinez Juan Jose
; Horario: 8:00-9:00 a. m.
; Docente: Dr. Jose Luis Medina Jimenez
; Arquitectura: MASM x86 de 32 bits + Irvine32
;============================================================
INCLUDE Irvine32.inc


.data
    a DWORD 20
    b DWORD 6
    msgS BYTE "Suma: ",0
    msgR BYTE "Resta: ",0
    msgM BYTE "Multiplicacion: ",0
    msgD BYTE "Division (cociente): ",0
    msgResiduo BYTE "Residuo: ",0
.code
main PROC
    mov edx, OFFSET msgS
    call WriteString
    mov eax, a
    add eax, b
    call WriteDec
    call Crlf

    mov edx, OFFSET msgR
    call WriteString
    mov eax, a
    sub eax, b
    call WriteDec
    call Crlf

    mov edx, OFFSET msgM
    call WriteString
    mov eax, a
    mul b
    call WriteDec
    call Crlf

    mov edx, OFFSET msgD
    call WriteString
    mov eax, a
    xor edx, edx
    div b
    push edx
    call WriteDec
    call Crlf

    mov edx, OFFSET msgResiduo
    call WriteString
    pop eax
    call WriteDec
    call Crlf
    exit
main ENDP
END main
