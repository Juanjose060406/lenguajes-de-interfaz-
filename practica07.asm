;============================================================
; PRACTICA 7: Validacion de formato: uno o dos digitos
; Materia: Lenguajes de Interfaz - Unidad 2
; Nombre: Angulo Martinez Juan Jose
; Horario: 8:00-9:00 a. m.
; Docente: Dr. Jose Luis Medina Jimenez
; Arquitectura: MASM x86 de 32 bits + Irvine32
;============================================================
INCLUDE Irvine32.inc


.data
    pregunta BYTE "Ingresa un numero de 1 a 99: ",0
    errorMsg BYTE "Formato invalido. Intenta otra vez.",0
    okMsg BYTE "Formato valido.",0
    entrada BYTE 16 DUP(0)
    longitud DWORD ?
.code
main PROC
otraVez:
    mov edx, OFFSET pregunta
    call WriteString
    mov edx, OFFSET entrada
    mov ecx, 15
    call ReadString
    mov longitud, eax

    cmp eax, 1
    jb error
    cmp eax, 2
    ja error

    mov ecx, longitud
    mov esi, OFFSET entrada
validar:
    mov al, [esi]
    cmp al, '0'
    jb error
    cmp al, '9'
    ja error
    inc esi
    loop validar

    ; Rechazar el valor 00
    cmp longitud, 1
    je correcto
    cmp BYTE PTR [entrada], '0'
    je error

correcto:
    mov edx, OFFSET okMsg
    call WriteString
    call Crlf
    exit

error:
    mov edx, OFFSET errorMsg
    call WriteString
    call Crlf
    jmp otraVez
main ENDP
END main
