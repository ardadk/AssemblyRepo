; Arda Demirk?ran 1231602097 2.Grubun 7.Sorusu
odev segment
main proc far   
assume cs:odev, ds:odev
mov ax,0
push ds ax
mov ax, odev
mov ds, ax      
jmp dongu  
  
data_segment:
    s1 db 0           
    s2 db 0           
    s3 db 0           
    s4 db 0           
    s5 db 0           
    m1 db 10,13, '1. sayiyi giriniz:$'
    m2 db 10,13, '2. sayiyi giriniz:$'
    m3 db 10,13, '3. sayiyi giriniz:$'
    m4 db 10,13, '4. sayiyi giriniz:$'
    m5 db 10,13, '5. sayiyi giriniz:$'
    m6 db 10,13, 'Siralama:$'

dongu:
  
    mov ah, 09h
    lea dx, m1
    int 21h
    mov ah, 01h           
    int 21h
    sub al, 30h           
    mov [s1], al       

    mov ah, 09h
    lea dx, m2
    int 21h
    mov ah, 01h
    int 21h
    sub al, 30h
    mov [s2], al       

    mov ah, 09h
    lea dx, m3
    int 21h
    mov ah, 01h
    int 21h
    sub al, 30h
    mov [s3], al       

    mov ah, 09h
    lea dx, m4
    int 21h
    mov ah, 01h
    int 21h
    sub al, 30h
    mov [s4], al       

    mov ah, 09h
    lea dx, m5
    int 21h
    mov ah, 01h
    int 21h
    sub al, 30h
    mov [s5], al       

    mov cx, 4          
    
dongu1:
    mov al, [s1]
    mov bl, [s2]
    cmp al, bl
    jle dongu2            
    mov [s1], bl
    mov [s2], al
dongu2:

    mov al, [s2]
    mov bl, [s3]
    cmp al, bl
    jle dongu3
    mov [s2], bl
    mov [s3], al
dongu3:

    mov al, [s3]
    mov bl, [s4]
    cmp al, bl
    jle dongu4
    mov [s3], bl
    mov [s4], al
dongu4:

    mov al, [s4]
    mov bl, [s5]
    cmp al, bl
    jle dongu5
    mov [s4], bl
    mov [s5], al
dongu5:

    loop dongu1         

    mov ah, 09h
    lea dx, m6
    int 21h

    mov dl, [s1]
    add dl, 30h           
    mov ah, 02h
    int 21h
    mov dl, ' '
    int 21h

    mov dl, [s2]
    add dl, 30h
    mov ah, 02h
    int 21h
    mov dl, ' '
    int 21h

    mov dl, [s3]
    add dl, 30h
    mov ah, 02h
    int 21h
    mov dl, ' '
    int 21h

    mov dl, [s4]
    add dl, 30h
    mov ah, 02h
    int 21h
    mov dl, ' '
    int 21h

    mov dl, [s5]
    add dl, 30h
    mov ah, 02h
    int 21h
    mov dl, ' '
    int 21h

    ret
main endp
odev ends
end main