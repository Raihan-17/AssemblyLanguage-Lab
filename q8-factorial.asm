.model small
.stack 100h

.data
text1 DB "Enter the number: $"
text2 DB 10,13, "Factorial is: $"

.code
main proc
    mov AX, @data
    mov DS, AX

    mov AH, 09
    LEA DX, text1
    int 21h

    mov AH, 01
    int 21h
    sub AL, 30h        ; Convert ASCII to numeric
    mov BL, AL         ; Store input in BL

    mov AH, 09
    LEA DX, text2
    int 21h

    mov AX, 1          ; Initialize AX to 1

fact:
    mul BL             ; AX = AX * BL
    dec BL             ; Decrement BL
    jnz fact           ; Repeat until BL = 0

    add AL, 30h        ; Convert result to ASCII
    mov DL, AL
    mov AH, 02
    int 21h

    mov AH, 4Ch
    int 21h
main endp
end main
