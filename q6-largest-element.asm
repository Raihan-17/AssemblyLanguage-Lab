.model small
.stack 100h

.data
arr DB 3,5,2,8,4,9
Text DB 10,13, "The largest element : $"

.code
main proc
    mov AX, @data
    mov DS, AX

    mov CX, 5
    LEA SI, arr
    mov BL, [SI]

Loop:
    inc SI
    cmp BL, [SI]
    jge Next
    mov BL, [SI]

Next:
    dec CX
    jnz Loop

    mov AH, 09h
    LEA DX, Text
    int 21h

    mov AH, 02
    mov DL, BL
    add DL, 30h
    int 21h

    mov AH, 4Ch
    int 21h
main endp
end main
