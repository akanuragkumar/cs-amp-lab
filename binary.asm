assume cs:code,ds:data
data segment
a db 1,3,5,6,8,9
len dw $-a
key db 9
msg1 db 'key found at position $'
msg2 db 'key not found''$'
data ends
code segment
start: mov ax,data
mov ds,ax
mov bx,0
mov cl,key
mov dx,len
back:   cmp bx,dx
        ja notfound
        mov si,bx
        add si,dx
        shr si,1
        cmp a[si],cl
        jle l0
mov dx,si
dec dx
jmp back
l0: je found
mov bx,si
inc bx
jmp back
found:lea dx,msg1
      mov ah,09h
      int 21h
      mov cx,si
      mov dl,cl
      inc dl
      add dl,30h
      mov ah,06h
      int 21h
      jmp exit
notfound: lea dx,msg2
          mov ah,09h
          int 21h
exit:mov ah,4ch
     int 21h
code ends
end start
