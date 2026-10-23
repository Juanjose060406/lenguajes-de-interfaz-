;============================================================
; PRACTICA 14: Captura y almacenamiento de dato numerico
; Materia: Lenguajes de Interfaz - Unidad 2
; Nombre: Angulo Martinez Juan Jose
; Horario: 8:00-9:00 a. m.
; Docente: Dr. Jose Luis Medina Jimenez
; Arquitectura: MASM x86 de 32 bits + Irvine32
;============================================================
INCLUDE Irvine32.inc


.data
    pregunta BYTE "Cantidad recibida (1-99): ",0
    errorMsg BYTE "Entrada invalida. Intenta otra vez.",0
    salida BYTE "Existencia actual: ",0
    existenciaInicial DWORD 25
    cantidadRecibida DWORD ?
    existenciaActual DWORD ?
    longitud DWORD ?
    entrada BYTE 16 DUP(0)
    bufferSalida BYTE 11 DUP(0)
.code
main PROC
capturar:
    mov edx, OFFSET pregunta
    call WriteString
    mov edx, OFFSET entrada
    mov ecx, 15
    call ReadString
    mov longitud, eax

    cmp eax, 1
    jb invalida
    cmp eax, 2
    ja invalida

    mov ecx, longitud
    mov esi, OFFSET entrada
validar:
    mov al, [esi]
    cmp al, '0'
    jb invalida
    cmp al, '9'
    ja invalida
    inc esi
    loop validar

    movzx eax, BYTE PTR [entrada]
    sub eax, '0'
    cmp longitud, 1
    je rango
    imul eax, 10
    movzx ebx, BYTE PTR [entrada+1]
    sub ebx, '0'
    add eax, ebx

rango:
    cmp eax, 1
    jb invalida
    cmp eax, 99
    ja invalida
    mov cantidadRecibida, eax

    mov eax, existenciaInicial
    add eax, cantidadRecibida
    mov existenciaActual, eax

    mov eax, existenciaActual
    mov edi, OFFSET bufferSalida
    call DecimalAAscii

    mov edx, OFFSET salida
    call WriteString
    mov edx, OFFSET bufferSalida
    call WriteString
    call Crlf
    exit

invalida:
    mov edx, OFFSET errorMsg
    call WriteString
    call Crlf
    jmp capturar
main ENDP

; Convierte EAX a decimal ASCII; EDI apunta al buffer
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
    jmp terminar
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
terminar:
    mov BYTE PTR [esi], 0
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
DecimalAAscii ENDP
END main
