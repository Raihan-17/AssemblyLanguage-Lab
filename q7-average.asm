.model small
.stack 100h

.data
arr DB 1, 2, 3
Text DB 10,13, "The average is: $"

.code
main proc
    mov AX, @data
    mov DS, AX

    mov AH, 09
    LEA DX, Text
    int 21h

    LEA SI, arr
    mov CX, 3
    mov AX, 0

loop1:
    add AL, [SI]
    inc SI
    dec CX
    jnz loop1

    mov BL, 3
    div BL             ; AL = AL / BL
    mov DL, AL
    add DL, 30h        ; Convert to ASCII
    mov AH, 02
    int 21h

    mov AH, 4Ch
    int 21h
main endp
end main
