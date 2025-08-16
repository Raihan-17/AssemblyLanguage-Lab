.model small
.stack 100h
.data
  
    val1 db ?
    val2 db ?
    text db "Enter two numbers (0-9): $"
    T db 10, 13, "The smaller number is: $"
   

.code
main proc
    mov ax, @data       ; Initialize data segment
    mov ds, ax

    mov ah, 09h
    lea dx, text
    int 21h
    
    mov ah, 01h
    int 21h
    mov val1, al
     int 21h
    mov val2, al


   
    mov bl, val1
    cmp bl, val2
    jle smaller
    mov bl, val2

 

smaller:
    mov ah, 09h
    lea dx, T
    int 21h
    
    mov ah, 02
    mov dl, bl 
    int 21h

    mov ah, 4ch
    int 21h
main endp
end main