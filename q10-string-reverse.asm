.model small
.stack 100h

.data
string_length DB 20, ?, 20 DUP('$')
Text DB "Enter a string: $"
Result DB 10,13, "Reversed String: $"

.code
main proc
    mov AX, @data
    mov DS, AX

    mov AH, 09
    LEA DX, Text
    int 21h

    LEA DX, string_length
    mov AH, 0Ah
    int 21h

    mov CL, [string_length + 1]
    mov CH, 0

    LEA SI, string_length + 2
    ADD SI, CX

    mov AH, 09
    LEA DX, Result
    int 21h

reverse:
    dec SI
    mov DL, [SI]
    mov AH, 02
    int 21h
    loop reverse

    mov AH, 4Ch
    int 21h
main endp
end main
