data segment
pa equ 0DC00h
pb equ 0DC01h
pc equ 0DC02h
cp equ 0DC03h
a db 0ffh
h db 0c0h,0f9h,0a4h,0b0h,99h,92h,82h,0f8h,80h,90h
data ends
code segment
assume cs:code,ds:data
start:mov ax,data
mov ds,ax
mov dx,cp
mov al,80h
out dx,al
mov ax,a 
rl:mov ah,0
mov dl,10
div dl
mov bl,ah
mov bh,0
push ax
mov al,h[bx]
call disp
pop ax
dec disp
jnz rl
mov ah,4ch
int 21h

disp proc
push cx
mov cx,8
l:rol al,1
mov dx,pb
out dx,al
push ax
mov al,1
mov dx,pc
out dx,al
mov al,0
out dx,al
pop ax
loop l
pop cx 
ret
disp endp
code ends
end start
