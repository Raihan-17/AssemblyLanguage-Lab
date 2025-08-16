.model small
.stack 100h
.data
    Text db "Enter a number: $"
    Text2 db 10, 13, "The number is odd.$"
    Text3 db 10, 13, "The number is even.$"

.code
main proc
    mov ax, @data       ; Initialize data segment
    mov ds, ax

    ; Display prompt
    mov ah, 09h
    lea dx, Text
    int 21h

    ; Read single digit input
    mov ah, 01h
    int 21h
    
    ; Convert ASCII to number and check parity
    sub al, 30h         ; Convert from ASCII to numeric value
    test al, 1          ; Test least significant bit
    jz even_num         ; Jump if zero (even)
    
    ; Number is odd
    mov ah, 09h
    lea dx, Text2
    jmp display_result

even_num:
    ; Number is even
    mov ah, 09h
    lea dx, Text3

display_result:
    int 21h             ; Display result message

    ; Exit to DOS
    mov ah, 4ch
    int 21h
main endp
end main