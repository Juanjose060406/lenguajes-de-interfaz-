;============================================================
; PRACTICA 6.1: Control de ocupacion de un estacionamiento
; Materia: Lenguajes de Interfaz - Unidad 2
; Nombre: Angulo Martinez Juan Jose
; Horario: 8:00-9:00 a. m.
; Docente: Dr. Jose Luis Medina Jimenez
; Arquitectura: MASM x86 de 32 bits + Irvine32
;============================================================
INCLUDE Irvine32.inc


.data
    capacidad DWORD 10
    ocupados DWORD 7
    pregunta BYTE "Cuantos autos ingresan? ",0
    lleno BYTE "No hay suficientes espacios.",0
    ok BYTE "Autos registrados. Lugares ocupados: ",0
.code
main PROC
    mov edx, OFFSET pregunta
    call WriteString
    call ReadDec

    ; EAX contiene los autos que intentan entrar
    add eax, ocupados
    cmp eax, capacidad
    ja excede

    mov ocupados, eax
    mov edx, OFFSET ok
    call WriteString
    mov eax, ocupados
    call WriteDec
    call Crlf
    jmp fin

excede:
    mov edx, OFFSET lleno
    call WriteString
    call Crlf

fin:
    exit
main ENDP
END main
