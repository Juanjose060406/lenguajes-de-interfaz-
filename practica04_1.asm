;============================================================
; PRACTICA 4.1: Mayor, menor o igual con entrada del usuario
; Materia: Lenguajes de Interfaz - Unidad 2
; Nombre: Angulo Martinez Juan Jose
; Horario: 8:00-9:00 a. m.
; Docente: Dr. Jose Luis Medina Jimenez
; Arquitectura: MASM x86 de 32 bits + Irvine32
;============================================================
INCLUDE Irvine32.inc


.data
    p1 BYTE "Ingresa el primer numero: ",0
    p2 BYTE "Ingresa el segundo numero: ",0
    mMayor BYTE "El primero es mayor.",0
    mMenor BYTE "El primero es menor.",0
    mIgual BYTE "Los numeros son iguales.",0
    n1 DWORD ?
    n2 DWORD ?
.code
main PROC
    mov edx, OFFSET p1
    call WriteString
    call ReadDec
    mov n1, eax

    mov edx, OFFSET p2
    call WriteString
    call ReadDec
    mov n2, eax

    mov eax, n1
    cmp eax, n2
    ja mayor
    jb menor

    mov edx, OFFSET mIgual
    call WriteString
    jmp fin

mayor:
    mov edx, OFFSET mMayor
    call WriteString
    jmp fin

menor:
    mov edx, OFFSET mMenor
    call WriteString

fin:
    call Crlf
    exit
main ENDP
END main
