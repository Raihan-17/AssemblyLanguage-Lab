; Program to convert lowercase to uppercase and vice versa
; Works for single character input

.model small
.stack 100h
.data
    msg1 db 'Enter a character: $'
    msg2 db 0Dh,0Ah, 'Converted character: $'

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Display prompt
    mov ah, 09h
    lea dx, msg1
    int 21h

    ; Read a character
    mov ah, 01h
    int 21h
    mov bl, al     ; store input in BL

    ; Check if lowercase (a=97h to z=122h)
    cmp bl, 'a'
    jl check_upper
    cmp bl, 'z'
    jg check_upper
    sub bl, 20h    ; convert lowercase to uppercase
    jmp display

check_upper:
    ; Check if uppercase (A=65h to Z=90h)
    cmp bl, 'A'
    jl display
    cmp bl, 'Z'
    jg display
    add bl, 20h    ; convert uppercase to lowercase

display:
    ; Display result message
    mov ah, 09h
    lea dx, msg2
    int 21h

    ; Display character
    mov dl, bl
    mov ah, 02h
    int 21h

    ; Exit program
    mov ah, 4Ch
    int 21h
main endp
end main




