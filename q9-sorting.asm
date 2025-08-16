.model small
.stack 100h

.data
arr DB 5, 3, 8, 1, 4
len DB 5
text DB "sorted array: $"

.code
main proc
    mov AX, @data
    mov DS, AX

    mov AH, 09
    LEA DX, text
    int 21h

    mov CL, len
    dec CL              ; Outer loop count = len - 1

outer_loop:
    mov CH, CL          ; Inner loop count
    LEA SI, arr         ; Point to start of array

inner_loop:
    mov AL, [SI]
    mov BL, [SI+1]
    cmp AL, BL
    jbe no_swap         ; If AL <= BL, no swap needed

    mov [SI], BL        ; Swap values
    mov [SI+1], AL

no_swap:
    inc SI
    dec CH
    jnz inner_loop

    dec CL
    jnz outer_loop

    mov CL, len
    LEA SI, arr

print:
    mov DL, [SI]
    add DL, 30h         ; Convert to ASCII
    mov AH, 02
    int 21h

    mov DL, ','         ; Print comma separator
    int 21h

    inc SI
    dec CL
    jnz print

    mov AH, 4Ch
    int 21h
main endp
end main
