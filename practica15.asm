;============================================================
; PRACTICA 15: Manipulacion de archivo: escribir y leer
; Materia: Lenguajes de Interfaz - Unidad 2
; Nombre: Angulo Martinez Juan Jose
; Horario: 8:00-9:00 a. m.
; Docente: Dr. Jose Luis Medina Jimenez
; Arquitectura: MASM x86 de 32 bits + Irvine32
;============================================================
INCLUDE Irvine32.inc


.data
    nombreArchivo BYTE "practica15.txt",0
    texto BYTE "Practica de manipulacion de archivos en MASM.",13,10
    longitudTexto DWORD ($ - texto)
    bufferLectura BYTE 128 DUP(0)
    msgEscritura BYTE "Se escribio el archivo.",0
    msgLectura BYTE "Contenido leido:",13,10,0
    msgError BYTE "No se pudo abrir o crear el archivo.",0
    manejador DWORD ?
.code
main PROC
    ; Crear archivo de salida
    mov edx, OFFSET nombreArchivo
    call CreateOutputFile
    cmp eax, INVALID_HANDLE_VALUE
    je errorArchivo
    mov manejador, eax

    ; Escribir el texto
    mov eax, manejador
    mov edx, OFFSET texto
    mov ecx, longitudTexto
    call WriteToFile
    mov eax, manejador
    call CloseFile

    mov edx, OFFSET msgEscritura
    call WriteString
    call Crlf

    ; Abrir archivo para leer
    mov edx, OFFSET nombreArchivo
    call OpenInputFile
    cmp eax, INVALID_HANDLE_VALUE
    je errorArchivo
    mov manejador, eax

    mov eax, manejador
    mov edx, OFFSET bufferLectura
    mov ecx, SIZEOF bufferLectura - 1
    call ReadFromFile
    mov BYTE PTR bufferLectura[eax], 0

    mov eax, manejador
    call CloseFile

    mov edx, OFFSET msgLectura
    call WriteString
    mov edx, OFFSET bufferLectura
    call WriteString
    call Crlf
    jmp fin

errorArchivo:
    mov edx, OFFSET msgError
    call WriteString
    call Crlf
fin:
    exit
main ENDP
END main
