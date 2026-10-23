;============================================================
; PRACTICA 10: Cadena con decimal: convertir numero a texto
; Materia: Lenguajes de Interfaz - Unidad 2
; Nombre: Angulo Martinez Juan Jose
; Horario: 8:00-9:00 a. m.
; Docente: Dr. Jose Luis Medina Jimenez
; Arquitectura: MASM x86 de 32 bits + Irvine32
;============================================================
INCLUDE Irvine32.inc


.data
    numero DWORD 12345
    buffer BYTE 11 DUP(0)
    mensaje BYTE "Numero convertido a cadena: ",0
.code
main PROC
    mov eax, numero
    mov edi, OFFSET buffer
    call DecimalAAscii

    mov edx, OFFSET mensaje
    call WriteString
    mov edx, OFFSET buffer
    call WriteString
    call Crlf
    exit
main ENDP

; EAX = numero, EDI = buffer de salida
DecimalAAscii PROC
    push eax
    push ebx
    push ecx
    push edx
    push esi

    mov esi, edi
    mov ebx, 10
    xor ecx, ecx
    cmp eax, 0
    jne convertir

    mov BYTE PTR [esi], '0'
    inc esi
    jmp terminarCadena

convertir:
    xor edx, edx
    div ebx
    push edx
    inc ecx
    test eax, eax
    jnz convertir

guardar:
    pop edx
    add dl, '0'
    mov [esi], dl
    inc esi
    loop guardar

terminarCadena:
    mov BYTE PTR [esi], 0
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
DecimalAAscii ENDP
END main
