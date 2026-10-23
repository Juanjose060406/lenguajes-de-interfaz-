;============================================================
; PRACTICA 13: String hexadecimal: DWORD a 8 caracteres
; Materia: Lenguajes de Interfaz - Unidad 2
; Nombre: Angulo Martinez Juan Jose
; Horario: 8:00-9:00 a. m.
; Docente: Dr. Jose Luis Medina Jimenez
; Arquitectura: MASM x86 de 32 bits + Irvine32
;============================================================
INCLUDE Irvine32.inc


.data
    numero DWORD 12AB34CDh
    bufferHex BYTE 9 DUP(0)
    digitos BYTE "0123456789ABCDEF"
    mensaje BYTE "Hexadecimal: ",0
.code
main PROC
    mov eax, numero
    mov esi, OFFSET bufferHex
    add esi, 7
    mov ecx, 8

extraer:
    mov ebx, eax
    and ebx, 0Fh
    mov bl, digitos[ebx]
    mov [esi], bl
    shr eax, 4
    dec esi
    loop extraer

    mov BYTE PTR bufferHex[8], 0
    mov edx, OFFSET mensaje
    call WriteString
    mov edx, OFFSET bufferHex
    call WriteString
    call Crlf
    exit
main ENDP
END main
