STKSEG segment stack
    db 32 dup ('stack')
STKSEG ends

DATASEG segment para
    print_star db '*' ; Define the character to print
    color_blue db 09h   
    color_red db 0Ch   
DATASEG ends

CODESEG segment para
    main PROC far 
        assume ds:DATASEG, cs:CODESEG, ss:STKSEG

        mov AX, DATASEG
        mov Ds, Ax

FlashLoop:
    ;FIRST LINE
        ;clear screen
        mov Ah,06h
        mov Al,25
        mov Cl,0
        mov Ch,0
        mov Dl,79
        mov Dh,24
        mov Bh,01h
        int 10h 
        ;move cursor
        mov ah,02h
        mov dh,12
        mov dl,39
        mov bh,0
        int 10h
        ;print
        mov ah, 09h          ; Function 09h - Display string
        mov dx, offset print_star  ; Load DX with the address of the string
        mov AL,'*'
        mov cx, 1            ; Display one character
        mov bl, color_blue        ; Load BL with the color attribute
        int 10h              ; Display the character at the current cursor position with the specified color

;THIRDLINE
        ;move cursor
        mov Bh,04h
        mov ah,02h
        mov dh,14
        mov dl,37
        mov bh,0
        int 10h
        ;print
        mov ah, 09h          
        mov dx, offset print_star  
        mov cx, 1            
        mov bl, color_blue       
        int 10h              
        ;move cursor
        mov Bh,04h
        mov ah,02h
        mov dh,14
        mov dl,41
        mov bh,0
        int 10h
        ;print
        mov ah, 09h          
        mov dx, offset print_star  
        mov cx, 1           
        mov bl, color_blue        
        int 10h             

    
    mov cx, 65535        
FlashDelay:
    dec cx
    jnz FlashDelay      

    mov bl, color_red   
    int 10h

    ;SECOND LINE
        ;move cursor
        mov Bh,04h
        mov ah,02h
        mov dh,13
        mov dl,38
        mov bh,0
        int 10h
        ;print
        mov ah, 09h         
        mov dx, offset print_star  
        mov cx, 1            
        mov bl, color_red       
        int 10h             
        ;move cursor
        mov Bh,04h
        mov ah,02h
        mov dh,13
        mov dl,40
        mov bh,0
        int 10h
        ;print
        mov ah, 09h          
        mov dx, offset print_star  
        mov cx, 1            
        mov bl, color_red       
        int 10h              

        ;FORTHLINE
        ;move cursor
        mov Bh,04h
        mov ah,02h
        mov dh,15
        mov dl,36
        mov bh,0
        int 10h
        ;print
        mov ah, 09h         
        mov dx, offset print_star  
        mov cx, 1           
        mov bl, color_red        
        int 10h             
        ;move cursor
        mov Bh,04h
        mov ah,02h
        mov dh,15
        mov dl,42
        mov bh,0
        int 10h
        ;print
        mov ah, 09h          
        mov dx, offset print_star  
        mov cx, 1            
        mov bl, color_red       
        int 10h              
   
    mov cx, 65535       
FlashDelay2:
    dec cx
    jnz FlashDelay2     

   
    jmp FlashLoop       

        ;return
        mov Ax,4C00h
        int 21h

    main endp
CODESEG ends
end main