; Arda Demirk?ran 1231602097 1.Grubun 2.Sorusu
data segment
    m1 db "Cumleyi giriniz: $"
    m2 db 13, 10, "Bolucek harfi giriniz: $"
    son1 db 13, 10, "Harften onceki cumle: $"
    son2 db 13, 10, "Harften sonraki cumle: $"
    hatali db 13, 10, "Hatali giris", 13, 10, "$"
    metin db 100 dup('$')   
data ends

odev segment
    assume cs:odev, ds:odev

main proc
    mov ax, data
    mov ds, ax

    
    lea dx, m1
    mov ah, 09h
    int 21h

    lea dx, metin      
    mov ah, 0Ah        
    int 21h            

   
    lea dx, m2
    mov ah, 09h
    int 21h

    mov ah, 01h        
    int 21h
    mov bl, al         

    
    lea si, metin + 2  
harf_bul:
    mov al, [si]       
    cmp al, bl         
    je harf_bulundu    

    inc si             
    cmp al, '$'        
    je harf_bulunamayinca 

    jmp harf_bul      

harf_bulundu:
   
    lea dx, son1
    mov ah, 09h
    int 21h

    lea si, metin + 2  
onceyi_yazdir:
    mov al, [si]
    cmp al, bl         
    je sonrayi_yazdir

    mov dl, al         
    mov ah, 02h
    int 21h

    inc si
    jmp onceyi_yazdir

sonrayi_yazdir:
    
    lea dx, son2
    mov ah, 09h
    int 21h

    mov al, [si]
    mov dl, al
    mov ah, 02h
    int 21h

    inc si
    jmp sonrayi_yazdir2

sonrayi_yazdir2:
    mov al, [si]
    cmp al, '$'
    je bitir
    mov dl, al
    mov ah, 02h
    int 21h

    inc si
    jmp sonrayi_yazdir2

harf_bulunamayinca:
    lea dx, hatali
    mov ah, 09h
    int 21h
    jmp main

bitir:
    mov ah, 4Ch       
    int 21h

main endp
odev ends
end main