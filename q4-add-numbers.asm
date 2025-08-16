.model small
.stack 100h

.data
Text1 DB "Enter two numbers: $"
Text2 DB 10,13,"The sum is : $"

.code
main proc
    mov AX, @data
    mov DS, AX

    mov AH, 09
    LEA DX, Text1
    int 21h

    mov AH, 01
    int 21h
    mov BL, AL
    int 21h
    mov BH, AL

    sub BL, 30h
    sub BH, 30h

    mov AH, 09
    LEA DX, Text2
    int 21h

    add BL, BH
    add BL, 30h

    mov AH, 02
    mov DL, BL
    int 21h

    mov AH, 4Ch
    int 21h
main endp
end main
