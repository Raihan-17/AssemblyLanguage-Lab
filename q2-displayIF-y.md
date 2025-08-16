.model small
.stack 100h
.data
    msg1 db 'Enter a character: $'
    yesMsg db 0Dh,0Ah, 'YES$'
    noMsg  db 0Dh,0Ah, 'NO$'

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Show prompt
    mov ah, 09h
    lea dx, msg1
    int 21h

    ; Read a character
    mov ah, 01h
    int 21h
    mov bl, al      ; store input in BL

    ; Check if 'y'
    cmp bl, 'y'
    je printYes
    ; Check if 'Y'
    cmp bl, 'Y'
    je printYes

printNo:
    ; Print "NO"
    mov ah, 09h
    lea dx, noMsg
    int 21h
    jmp exitProg

printYes:
    ; Print "YES"
    mov ah, 09h
    lea dx, yesMsg
    int 21h

exitProg:
    ; Exit
    mov ah, 4Ch
    int 21h
main endp
end main
