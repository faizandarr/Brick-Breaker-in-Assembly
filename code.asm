
.model small
.stack 100h
.data
;==========================MENU MATERIAL=================================
widt dw 250
height dw 50
fname db "player.txt",'0'
fhandle dw ?
datta db 50 dup(?)
msg1 db "press any key to continue",'$'
msg db "Enter your name: ",'$'
name1 db 10 dup(' ')      
ins0 db "      INSTRUCTION",'$'
ins1 db "Its a 4 min game.",'$'
ins2 db "You can move paddle right and left to save your ball",'$'
ins3 db "YOU CAN press enter for pause.",'$'
ins4 db "JAZAKALLAH press esc to go menu and a back from record",'$'
plname db "Player Name: ",'$'

;====================================================================
temp_paddle dw ?   ; handles x coordinate of the paddle
xcor_start dw 150         ;  the x coordinate of ball   ; 15 start x 17 start y 300 y end  x end 620
xcor_end dw 155
paddle_x_start dw 70
paddle_x_end dw 80
paddle_y_start dw  285
paddle_y_end dw  299
p dw 250        ; that gives a new initial position to temp acc to left right
dumy dw 70
b_collision dw 0   ; by default no collision

ycor_start dw 120          ; handles the y coordinate of ball
ycor_end dw 125

x_brick_start dw ?
x_brick_end dw ?
y_brick_start dw ?
y_brick_end dw ?

level db 0


spacee db ': '

;final score db 2 dup('$')

ballvx dw 0
ballvy dw 0

ZINDAGI DW 3

fileinfo dw 0
buffer db 100 dup('$')
;====================================================================
brick1 dw 1
brick2 dw 1
brick3 dw 1
brick4 dw 1
brick5 dw 1
brick6 dw 1
brick7 dw 1
brick8 dw 1
brick9 dw 1
brick10 dw 1

brick11 dw 1
brick12 dw 1
brick13 dw 1
brick14 dw 1
brick15 dw 1
brick16 dw 1
brick17 dw 1
brick18 dw 1
brick19 dw 1
brick20 dw 1


brick21 dw 1
brick22 dw 1
brick23 dw 1
brick24 dw 1
brick25 dw 1
brick26 dw 1
brick27 dw 1
brick28 dw 1
brick29 dw 1
brick30 dw 1

lane1 dw 1
lane2 dw 1
lane3 dw 1


;====================================================================

rows dw 10  ;can change the rows
row dw 10

col dw 3  ;;can change the colums

timer1 db '0'  ;count for the timer
timer2 db '0'
timer3 db '0'

SCORE1 db '0'  ;count for the score
score2 db '0'


blocksx dw 20
blocksy dw 20
blockex dw 70
blockey dw 30



life1 db 3
life2 db 3
life3 db 3
color db 1
;msg1 db "Enter a alphabet: "
;====================================================================
.code

mov ax,@data
mov ds,ax

mov ah,00h ; video streaming mode
mov al,10h ; screen mode Number
int 10h ; display

jmp game_start    ; the start of the program


;mmmmmmmmmmmmmMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
introduction proc

mov ah,0h
mov al,10h
int 10h



mov ah,02h
mov bh,0
mov dh,12
mov dl,30
int 10h

mov al, 'B'
mov bl,01
mov bh,0
mov ah,0Eh
int 10h

mov al, 'R'
mov bl,04
mov bh,0
mov ah,0Eh
int 10h

mov al, 'I'
mov bl,11
mov bh,0
mov ah,0Eh
int 10h

mov al, 'C'
mov bl,13
mov bh,0
mov ah,0Eh
int 10h

mov al, 'K'
mov bl,12
mov bh,0
mov ah,0Eh
int 10h

mov al, ' '
mov bl,14
mov bh,0
mov ah,0Eh
int 10h
mov al, 'B'
mov bl,01
mov bh,0
mov ah,0Eh
int 10h

mov al, 'R'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, 'E'
mov bl,07
mov bh,0
mov ah,0Eh
int 10h

mov al, 'A'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, 'K'
mov bl,10
mov bh,0
mov ah,0Eh
int 10h

mov al, 'E'
mov bl,15
mov bh,0
mov ah,0Eh
int 10h

mov al, 'R'
mov bl,09
mov bh,0
mov ah,0Eh
int 10h

mov ah,02h
mov bh,0
mov dh,15
mov dl,23
int 10h


mov dx, offset msg1
mov ah,09h
int 21h 

mov ah,01h
int 21h


;clear screen
mov ah,0h
mov al,10h
int 10h

ret
introduction endp




;================================================================================
enter_name proc

mov ah,0ch  ; clear screen
mov al,10
mov bh,0


mov ah,02h
mov bh,0
mov dh,12
mov dl,12
int 10h

;file handling
;existing file


mov dx, offset msg
mov ah,09h
int 21h 

mov ah,02h
mov bh,0
mov dh,16
mov dl,12
int 10h


mov si,0
mov cx,0
 
againnn:
mov ah,01h
int 21h
cmp al,13
je exitt
mov name1[si],al
inc si 
inc cx
jmp againnn
exitt:


;;;;;;
mov dx,offset fname
mov al,1
mov ah,3dh
int 21h

;Add
mov bx,ax
mov cx,0
mov ah,42h
mov al,02h
int 21h



;write
mov cx,lengthof name1      
mov dx,offset name1
mov ah,40h
int 21h

;closing
mov ah,3eh
int 21h

ret
enter_name endp

;=========================================================================
;=========================================================================
menu proc


main:
mov ah,0h
mov al,10h
int 10h


mov ah,02h
mov bh,0
mov dh,02
mov dl,52
int 10h

mov dx, offset plname
mov ah,09h
int 21h 


mov dx, offset name1
mov ah,09h
int 21h 



mov ah,02h
mov bh,0
mov dh,04
mov dl,28
int 10h

mov al, 'B'
mov bl,10
mov bh,0
mov ah,0eh
int 10h

mov al, 'R'
mov bl,04
mov bh,0
mov ah,0Eh
int 10h

mov al, 'I'
mov bl,11
mov bh,0
mov ah,0Eh
int 10h

mov al, 'C'
mov bl,13
mov bh,0
mov ah,0Eh
int 10h

mov al, 'K'
mov bl,12
mov bh,0
mov ah,0Eh
int 10h

mov al, ' '
mov bl,14
mov bh,0
mov ah,0Eh
int 10h
mov al, 'B'
mov bl,10
mov bh,0
mov ah,0Eh
int 10h

mov al, 'R'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, 'E'
mov bl,07
mov bh,0
mov ah,0Eh
int 10h

mov al, 'A'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, 'K'
mov bl,10
mov bh,0
mov ah,0Eh
int 10h

mov al, 'E'
mov bl,15
mov bh,0
mov ah,0Eh
int 10h

mov al, 'R'
mov bl,09
mov bh,0
mov ah,0Eh
int 10h

mov ah,02h
mov bh,0
mov dh,15
mov dl,05
int 10h


;Level 1

mov ah,02h
mov bh,0
mov dh,08
mov dl,30
int 10h

mov al, '1'
mov bl,15
mov bh,0
mov ah,0Eh
int 10h

mov al, '-'
mov bl,15
mov bh,0
mov ah,0Eh
int 10h


mov al, 'L'
mov bl,10
mov bh,0
mov ah,0Eh
int 10h

mov al, 'E'
mov bl,04
mov bh,0
mov ah,0Eh
int 10h

mov al, 'V'
mov bl,11
mov bh,0
mov ah,0Eh
int 10h

mov al, 'E'
mov bl,13
mov bh,0
mov ah,0Eh
int 10h

mov al, 'L'
mov bl,12
mov bh,0
mov ah,0Eh
int 10h

mov al, ' '
mov bl,14
mov bh,0
mov ah,0Eh
int 10h
mov al, '1'
mov bl,10
mov bh,0
mov ah,0Eh
int 10h

mov ah,02h
mov bh,0
mov dh,15
mov dl,05
int 10h

;Level 2


mov ah,02h
mov bh,0
mov dh,11
mov dl,30
int 10h

mov al, '2'
mov bl,15
mov bh,0
mov ah,0Eh
int 10h

mov al, '-'
mov bl,15
mov bh,0
mov ah,0Eh
int 10h


mov al, 'L'
mov bl,10
mov bh,0
mov ah,0Eh
int 10h

mov al, 'E'
mov bl,04
mov bh,0
mov ah,0Eh
int 10h

mov al, 'V'
mov bl,11
mov bh,0
mov ah,0Eh
int 10h

mov al, 'E'
mov bl,13
mov bh,0
mov ah,0Eh
int 10h

mov al, 'L'
mov bl,12
mov bh,0
mov ah,0Eh
int 10h

mov al, ' '
mov bl,14
mov bh,0
mov ah,0Eh
int 10h
mov al, '2'
mov bl,10
mov bh,0
mov ah,0Eh
int 10h


mov ah,02h
mov bh,0
mov dh,15
mov dl,05
int 10h



;Level 3

mov ah,02h
mov bh,0
mov dh,14
mov dl,30
int 10h

mov al, '3'
mov bl,15
mov bh,0
mov ah,0Eh
int 10h

mov al, '-'
mov bl,15
mov bh,0
mov ah,0Eh
int 10h


mov al, 'L'
mov bl,10
mov bh,0
mov ah,0Eh
int 10h

mov al, 'E'
mov bl,04
mov bh,0
mov ah,0Eh
int 10h

mov al, 'V'
mov bl,11
mov bh,0
mov ah,0Eh
int 10h

mov al, 'E'
mov bl,13
mov bh,0
mov ah,0Eh
int 10h

mov al, 'L'
mov bl,12
mov bh,0
mov ah,0Eh
int 10h

mov al, ' '
mov bl,14
mov bh,0
mov ah,0Eh
int 10h
mov al, '3'
mov bl,10
mov bh,0
mov ah,0Eh
int 10h

;Instruction

mov ah,02h
mov bh,0
mov dh,17
mov dl,30
int 10h

mov al, '4'
mov bl,15
mov bh,0
mov ah,0Eh
int 10h

mov al, '-'
mov bl,15
mov bh,0
mov ah,0Eh
int 10h


mov al, 'I'
mov bl,12
mov bh,0
mov ah,0Eh
int 10h

mov al, 'N'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h
mov al, 'S'
mov bl,10
mov bh,0
mov ah,0Eh
int 10h

mov al, 'T'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, 'R'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, 'U'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, 'C'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, 'T'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, 'U'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, 'R'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, 'E'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, 'S'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov ah,02h
mov bh,0
mov dh,15
mov dl,05
int 10h

; Record

mov ah,02h
mov bh,0
mov dh,20
mov dl,30
int 10h

mov al, '5'
mov bl,15
mov bh,0
mov ah,0Eh
int 10h

mov al, '-'
mov bl,5
mov bh,0
mov ah,0Eh
int 10h

mov al, 'R'
mov bl,6
mov bh,0
mov ah,0Eh
int 10h

mov al, 'E'
mov bl,7
mov bh,0
mov ah,0Eh
int 10h

mov al, 'C'
mov bl,8
mov bh,0
mov ah,0Eh
int 10h

mov al, 'O'
mov bl,9
mov bh,0
mov ah,0Eh
int 10h

mov al, 'R'
mov bl,10
mov bh,0
mov ah,0Eh
int 10h

mov al, 'D'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

ret
menu endp


;============================================================

instruction proc

mov ah,0h
mov al,10h
int 10h

mov ah,02h
mov bh,0
mov dh,04
mov dl,20
int 10h

mov dx,offset ins0
mov ah,09h
int 21h

mov ah,02h
mov bh,0
mov dh,06
mov dl,20
int 10h

mov dx,offset ins1
mov ah,09h
int 21h

mov ah,02h
mov bh,0
mov dh,08
mov dl,20
int 10h

mov dx,offset ins2
mov ah,09h
int 21h

mov ah,02h
mov bh,0
mov dh,10
mov dl,20
int 10h

mov dx,offset ins3
mov ah,09h
int 21h

mov ah,02h
mov bh,0
mov dh,12
mov dl,20
int 10h

mov dx,offset ins4
mov ah,09h
int 21h

mov ah,0
int 16h
.if(al==27)
ret
.endif
instruction endp


;============================================================================

beep proc

mov al, 182        
out 43h, al        
mov ax, 400        
                            
out 42h, al       
mov al, ah        
out 42h, al
in  al, 61h      
                           
or al, 00000011b  
out 61h, al      
mov bx, 2       
pause1:
mov cx, 65535
pause2:
dec cx
jne pause2
dec bx
jne pause1
in  al, 61h     
                                
and al, 11111100b   
out 61h, al


ret
beep endp
;============================================================================


bricks proc
MOV CX, 20 
MOV DX, 30  
MOV AL, 10 ;Blue color 
MOV AH, 0CH 
INT 10H




largest:

largge:
mov ah,0ch
mov al,color   ; color of bricks
mov bh,0

.if(color==16)
mov Ah,2
mov color,ah
.else
inc color

.endif

mov cx,blocksy
mov dx,blocksx

shape:
inc cx
hig:
inc dx
int 10h
cmp dx,blockey
jb hig
mov dx,blocksx

cmp cx,blockex
jb shape


;for updating blockex
mov ax,0
mov ax,blockex
add ax,60
mov blockex,ax

;for updating blocksy
mov ax,0
mov ax,blocksy
add ax,60
mov blocksy,ax


dec row
cmp row,0
ja largge


;for updating blocksx
mov ax,0
mov ax,blocksx
add ax,40
mov blocksx,ax


;for updating blockey
mov ax,0
mov ax,blockey
add ax,40
mov blockey,ax


mov ax,10
mov blocksy,20
mov ax,rows
mov row,ax
mov ax,70
mov blockex,ax
mov ax,0



dec col
cmp col,0
ja largest

ret
bricks endp
;============================================================================
frame proc

mov ah,0h
mov al,10h
int 10h

;BOX

mov ah,0ch
mov al,05
mov bh,0

mov cx,15 ;length
mov dx,15;height

;upper line

upper:

int 10h
inc cx
cmp cx, 620
jb upper

;lower line

mov cx,15  ;length
mov dx,300  ;height

lower:

int 10h
inc cx
cmp cx, 620
jb lower


;left line

mov cx,15  ; length
mov dx,15  ; height

left:

int 10h
inc dx
cmp dx, 300
jb left


; right line

mov cx,620  ; length
mov dx,15  ; height



right:

int 10h
inc dx
cmp dx, 300
jb right

ret
frame endp

;============================================================================
backcolor proc   ; background color

mov ah,06h
mov al,0
mov cx,0
mov dh,80
mov dl,80
mov bh,0h
mov bl,14
int 10h          ; display

ret
backcolor endp
;============================================================================
remove_brick proc
	
	mov dx,y_brick_start
		L1:
			MOV CX, x_brick_start
			L2:
				MOV AL, 00
				MOV AH, 0CH
				INT 10H
				
				INC CX
				CMP CX,x_brick_end
			JNE L2
			
			INC DX
			
			CMP DX,y_brick_end
		JNE L1
	ret	
	remove_brick endp
;============================================================================
;============================================================================
white_brick proc
	
	mov dx,y_brick_start
		L1:
			MOV CX, x_brick_start
			L2:
				MOV AL, 15
				MOV AH, 0CH
				INT 10H
				
				INC CX
				CMP CX,x_brick_end
			JNE L2
			
			INC DX
			
			CMP DX,y_brick_end
		JNE L1
	ret	
	white_brick endp
;============================================================================
;============================================================================
red_brick proc
	
	mov dx,y_brick_start
		L1:
			MOV CX, x_brick_start
			L2:
				MOV AL, 4
				MOV AH, 0CH
				INT 10H
				
				INC CX
				CMP CX,x_brick_end
			JNE L2
			
			INC DX
			
			CMP DX,y_brick_end
		JNE L1
	ret	
	red_brick endp
;============================================================================
;============================================================================
color_change_brick proc
	
	mov dx,y_brick_start
		L1:
			MOV CX, x_brick_start
			L2:
				MOV AL, 10
				MOV AH, 0CH
				INT 10H
				
				INC CX
				CMP CX,x_brick_end
			JNE L2
			
			INC DX
			
			CMP DX,y_brick_end
		JNE L1
	ret	
	color_change_brick endp
;============================================================================
remove_ball proc
	
	mov dx,ycor_start
		L1:
			MOV CX, xcor_start
			L2:
				MOV AL, 0
				MOV AH, 0CH
				INT 10H
				
				INC CX
				CMP CX,xcor_end
			JNE L2
			
			INC DX
			
			CMP DX,ycor_end
		JNE L1
	ret	
	remove_ball endp

;============================================================================
make_ball proc

	mov dx,ycor_start 
		L1:
			MOV CX, xcor_start
			L2:
				MOV AL, 7
				MOV AH, 0CH
				INT 10H
				
				INC CX
				CMP CX,xcor_end
			JNE L2
			
			INC DX
			
			CMP DX,ycor_end
		JNE L1
	ret	
	make_ball endp
;============================================================================

;============================================================================
make_paddle_right_1 proc

call remove_paddle

mov di,p
mov paddle_x_start,di
add di,60
mov paddle_x_end,di
mov di,0           ; refresh di

.if(paddle_x_end>615 )               ; boundaries check
mov di,p
mov paddle_x_start,di
sub paddle_x_start,70
mov paddle_x_end,di
mov di,0           ; refresh di
.endif

	mov dx,paddle_y_start 
		L1:
			MOV CX, paddle_x_start
			L2:
				MOV AL, 14
				MOV AH, 0CH
				INT 10H
				
				INC CX
				CMP CX,paddle_x_end
			JNE L2
			
			INC DX
			
			CMP DX,paddle_y_end
		JNE L1
	ret	
	make_paddle_right_1 endp
;============================================================================
;============================================================================
make_paddle_right_2 proc

call remove_paddle

mov di,p
mov paddle_x_start,di
add di,45
mov paddle_x_end,di
mov di,0           ; refresh di

.if(paddle_x_end>615 )               ; boundaries check
mov di,p
mov paddle_x_start,di
sub paddle_x_start,45
mov paddle_x_end,di
mov di,0           ; refresh di
.endif

	mov dx,paddle_y_start ;290
		L1:
			MOV CX, paddle_x_start
			L2:
				MOV AL, 14
				MOV AH, 0CH
				INT 10H
				
				INC CX
				CMP CX,paddle_x_end
			JNE L2
			
			INC DX
			
			CMP DX,paddle_y_end
		JNE L1
	ret	
	make_paddle_right_2 endp
;============================================================================
;============================================================================
make_paddle_right_3 proc

call remove_paddle

mov di,p
mov paddle_x_start,di
add di,30
mov paddle_x_end,di
mov di,0           ; refresh di

.if(paddle_x_end>615 )               ; boundaries check
mov di,p
mov paddle_x_start,di
sub paddle_x_start,30
mov paddle_x_end,di
mov di,0           ; refresh di
.endif

	mov dx,paddle_y_start 
		L1:
			MOV CX, paddle_x_start
			L2:
				MOV AL, 14
				MOV AH, 0CH
				INT 10H
				
				INC CX
				CMP CX,paddle_x_end
			JNE L2
			
			INC DX
			
			CMP DX,paddle_y_end
		JNE L1
	ret	
	make_paddle_right_3 endp
;============================================================================
;============================================================================
remove_paddle proc

	mov dx,paddle_y_start ;290
		L1:
			MOV CX, paddle_x_start
			L2:
				MOV AL, 0
				MOV AH, 0CH
				INT 10H
				
				INC CX
				CMP CX,paddle_x_end
			JNE L2
			
			INC DX
			
			CMP DX,paddle_y_end
		JNE L1
	ret	
	remove_paddle endp
;============================================================================
;============================================================================
make_paddle_left_1 proc

call remove_paddle
mov di,p
mov paddle_x_start,di
add di,60
mov paddle_x_end,di
mov di,0           ; refresh di

.if(paddle_x_start<18 )   ; boundary checks
mov di,p
add di,50
mov paddle_x_start,di
add di,70
mov paddle_x_end,di
mov di,0           ; refresh di
.endif

	mov dx,paddle_y_start ;290
		L1:
			MOV CX, paddle_x_start
			L2:
				MOV AL, 13
				MOV AH, 0CH
				INT 10H
				
				INC CX
				CMP CX,paddle_x_end
			JNE L2
			
			INC DX
			
			CMP DX,paddle_y_end
		JNE L1

	ret	
	make_paddle_left_1 endp
;============================================================================
;============================================================================
make_paddle_left_2 proc

call remove_paddle
mov di,p
mov paddle_x_start,di
add di,45
mov paddle_x_end,di
mov di,0           ; refresh di

.if(paddle_x_start<18 )   ; boundary checks
mov di,p
add di,45
mov paddle_x_start,di
add di,45
mov paddle_x_end,di
mov di,0           ; refresh di
.endif

	mov dx,paddle_y_start ;290
		L1:
			MOV CX, paddle_x_start
			L2:
				MOV AL, 13
				MOV AH, 0CH
				INT 10H
				
				INC CX
				CMP CX,paddle_x_end
			JNE L2
			
			INC DX
			
			CMP DX,paddle_y_end
		JNE L1

	ret	
	make_paddle_left_2 endp
;============================================================================
;============================================================================
make_paddle_left_3 proc

call remove_paddle
mov di,p
mov paddle_x_start,di
add di,30
mov paddle_x_end,di
mov di,0           ; refresh di
;add p,30

.if(paddle_x_start<18 )   ; boundary checks
mov di,p
add di,30
mov paddle_x_start,di
add di,30
mov paddle_x_end,di
mov di,0           ; refresh di
.endif

	mov dx,paddle_y_start ;290
		L1:
			MOV CX, paddle_x_start
			L2:
				MOV AL, 13
				MOV AH, 0CH
				INT 10H
				
				INC CX
				CMP CX,paddle_x_end
			JNE L2
			
			INC DX
			
			CMP DX,paddle_y_end
		JNE L1

	ret	
	make_paddle_left_3 endp
;============================================================================
ball1 proc        ; control movement of ball


;call make_paddle_right
call lives
call sccore
call timeupdate
call Time

call remove_ball                   
mov ax, ballvx
add xcor_start,ax
add xcor_end,ax



mov ax, ballvy
add ycor_start,ax
add ycor_end,ax


call make_ball

mov si,paddle_x_start
sub si,5
mov di,paddle_x_end
add di,65

.if(ycor_start<=285  &&  ycor_start>=280)
     .if(xcor_start>=si &&  xcor_end<=di)
	 call ballspeedy
	 
	

	 
	 .endif
.elseif(xcor_start<=20)                                  ; 15 start x 17 start y 300 y end  x end 620

call ballspeedx

.elseif(xcor_start >= 610)
call ballspeedx


.elseif(ycor_start< 20)
call ballspeedy


.elseif(ycor_start==290)
dec zindagi
.if(zindagi==2)
mov bl,0
mov life3,bl
.elseif(zindagi==1)
mov bl,0
mov life2,bl
.elseif(zindagi==0)
mov bl,0
mov life1,bl
call gameover

.endif




call ballspeedy
call ballspeedx
mov si,paddle_x_start
add si,20
mov di,paddle_x_end
add di,70

.if(xcor_end>si)
 call ballspeedx
 .elseif(xcor_start<di)
 call ballspeedx
 .else
 call ballspeedy
 .endif
.endif








;kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk



	


.if(ycor_end>=99 && ycor_end<=116)

.if(xcor_end>=21 && xcor_end<=71 && brick1!=0)
			
			mov x_brick_start,21
			mov x_brick_end,71
			mov y_brick_start,101
			mov y_brick_end,111
			dec brick1
			.if(brick1==0)
			call beep
			call remove_brick
			
			
			.endif	
			neg ballvy
			inc score2 
			

.elseif(xcor_end>=81 && xcor_end<=131 && brick2!=0)
			mov x_brick_start,81
			mov x_brick_end,131
			mov y_brick_start,101
			mov y_brick_end,111
			dec brick2
			.if(brick2==0)
			call beep
			call remove_brick
			neg ballvy
				
			
			.endif	
			
			inc score2	
			
.elseif(xcor_end>=141 && xcor_end<=191 && brick3!=0)
			dec brick3
			mov x_brick_start,141
			mov x_brick_end,191
			mov y_brick_start,101
			mov y_brick_end,111
			
			.if(brick3==0)
			call beep
			call remove_brick
			
			
			.endif	
			neg ballvy
			inc score2			

.elseif(xcor_end>=201 && xcor_end<=251 && brick4!=0)
			mov x_brick_start,201
			mov x_brick_end,251
			mov y_brick_start,101
			mov y_brick_end,111
			dec brick4
			.if(brick4==0)
			call beep
			call remove_brick
			
			
			.endif	
			neg ballvy
			inc score2			

.elseif(xcor_end>=261 && xcor_end<=311 && brick5!=0)
			mov x_brick_start,261
			mov x_brick_end,311
			mov y_brick_start,101
			mov y_brick_end,111
			dec brick5
			.if(brick5==0)
			call beep
			call remove_brick
			neg ballvy
			
			.endif	
			neg ballvy
			inc score2		

.elseif(xcor_end>=321 && xcor_end<=371 && brick6!=0)
			mov x_brick_start,321
			mov x_brick_end,371
			mov y_brick_start,101
			mov y_brick_end,111
			dec brick6
			.if(brick6==0)
			call beep
			call remove_brick
			
			
			.endif	
			neg ballvy
			inc score2			

.elseif(xcor_end>=381 && xcor_end<=431 && brick7!=0)
			mov x_brick_start,381
			mov x_brick_end,431
			mov y_brick_start,101
			mov y_brick_end,111
			
			dec brick7
			.if(brick7==0)
			call beep
			call remove_brick
			
			
			.endif	
			neg ballvy
			inc score2	

.elseif(xcor_end>=441 && xcor_end<=491 && brick8!=0)
			mov x_brick_start,441
			mov x_brick_end,491
			mov y_brick_start,101
			mov y_brick_end,111
			
			dec brick8
			.if(brick8==0)
			call beep
			call remove_brick
			
			
			.endif	
			neg ballvy
			inc score2	
			
.elseif(xcor_end>=501 && xcor_end<=551 && brick9!=0)
			mov x_brick_start,501
			mov x_brick_end,551
			mov y_brick_start,101
			mov y_brick_end,111
			dec brick9
			.if(brick9==0)
			call beep
			call remove_brick
			
			
			.endif	
			neg ballvy
			inc score2		
		
.elseif(xcor_end>=561 && xcor_end<=611 && brick10!=0)
			mov x_brick_start,561
			mov x_brick_end,611
			mov y_brick_start,101
			mov y_brick_end,111
			dec brick10
			.if(brick10==0)
			call beep
			call remove_brick
			
			.endif	
			neg ballvy
			inc score2				


.endif


.elseif(ycor_end>=61 && ycor_end<=75)

.if(xcor_end>=21 && xcor_end<=71 && brick11!=0)
			mov x_brick_start,21
			mov x_brick_end,71
			mov y_brick_start,61
			mov y_brick_end,71
			dec brick11
			.if(brick11==0)
			call beep
			call remove_brick
			
			.endif	
			neg ballvy
			inc score2
			
.elseif(xcor_end>=81 && xcor_end<=131 && brick12!=0)
			mov x_brick_start,81
			mov x_brick_end,131
			mov y_brick_start,61
			mov y_brick_end,71
			dec brick12
			.if(brick12==0)
			call beep
			call remove_brick
			
			.endif	
			neg ballvy
			inc score2
						
.elseif(xcor_end>=141 && xcor_end<=191 && brick13!=0)
			mov x_brick_start,141
			mov x_brick_end,191
			mov y_brick_start,61
			mov y_brick_end,71
			dec brick13
			.if(brick13==0)
			call beep
			call remove_brick
			
			.endif	
			neg ballvy
			inc score2
			
.elseif(xcor_end>=201 && xcor_end<=251 && brick14!=0)
			mov x_brick_start,201
			mov x_brick_end,251
			mov y_brick_start,61
			mov y_brick_end,71
			dec brick14
			.if(brick14==0)
			call beep
			call remove_brick
			
			.endif	
			neg ballvy
			inc score2
			

.elseif(xcor_end>=261 && xcor_end<=311 && brick15!=0)
			mov x_brick_start,261
			mov x_brick_end,311
			mov y_brick_start,61
			mov y_brick_end,71
			dec brick15
			.if(brick15==0)
			call beep
			call remove_brick
			
			.endif	
			neg ballvy
			inc score2
			

.elseif(xcor_end>=321 && xcor_end<=371 && brick16!=0)
			mov x_brick_start,321
			mov x_brick_end,371
			mov y_brick_start,61
			mov y_brick_end,71
			dec brick16
			.if(brick16==0)
			call beep
			call remove_brick
			
			.endif	
			neg ballvy
			inc score2
			
.elseif(xcor_end>=381 && xcor_end<=431 && brick17!=0)
			mov x_brick_start,381
			mov x_brick_end,431
			mov y_brick_start,61
			mov y_brick_end,71
			dec brick17
			.if(brick17==0)
			call beep
			call remove_brick
			
			.endif	
			neg ballvy
			inc score2
			
.elseif(xcor_end>=441 && xcor_end<=491 && brick18!=0)
			mov x_brick_start,441
			mov x_brick_end,491
			mov y_brick_start,61
			mov y_brick_end,71
			dec brick18
			.if(brick18==0)
			call beep
			call remove_brick
			
			.endif	
			neg ballvy
			inc score2
						
.elseif(xcor_end>=501 && xcor_end<=551 && brick19!=0)
			mov x_brick_start,501
			mov x_brick_end,551
			mov y_brick_start,61
			mov y_brick_end,71
			dec brick19
			.if(brick19==0)
			call beep
			call remove_brick
			
			.endif	
			neg ballvy
			inc score2
						
.elseif(xcor_end>=561 && xcor_end<=611 && brick20!=0)
			mov x_brick_start,561
			mov x_brick_end,611
			mov y_brick_start,61
			mov y_brick_end,71
			dec brick20
			.if(brick20==0)
			call beep
			call remove_brick
			
			.endif	
			neg ballvy
			inc score2
			


.endif

.elseif(ycor_end>=21 && ycor_end<=38)

.if(xcor_end>=21 && xcor_end<=71 && brick21!=0)
			mov x_brick_start,21
			mov x_brick_end,71
			mov y_brick_start,21
			mov y_brick_end,33
			dec brick21
			.if(brick21==0)
			call beep
			call remove_brick
			
			.endif	
			neg ballvy
			inc score2
			
.elseif(xcor_end>=81 && xcor_end<=131 && brick22!=0)
			mov x_brick_start,81
			mov x_brick_end,131
			mov y_brick_start,21
			mov y_brick_end,33
			dec brick22
			.if(brick22==0)
			call beep
			call remove_brick
			
			.endif	
			neg ballvy
			inc score2
						
.elseif(xcor_end>=141 && xcor_end<=191 && brick23!=0)
			mov x_brick_start,141
			mov x_brick_end,191
			mov y_brick_start,21
			mov y_brick_end,33
			dec brick23
			.if(brick23==0)
			call beep
			call remove_brick
			
			.endif	
			neg ballvy
			inc score2
			
.elseif(xcor_end>=201 && xcor_end<=251 && brick24!=0)
			mov x_brick_start,201
			mov x_brick_end,251
			mov y_brick_start,21
			mov y_brick_end,33
			dec brick24
			.if(brick24==0)
			call beep
			call remove_brick
			
			.endif	
			neg ballvy
			inc score2
			

.elseif(xcor_end>=261 && xcor_end<=311 && brick25!=0)
			mov x_brick_start,261
			mov x_brick_end,311
			mov y_brick_start,21
			mov y_brick_end,33
			dec brick25
			.if(brick25==0)
			call beep
			call remove_brick
			
			.endif	
			neg ballvy
			inc score2
			

.elseif(xcor_end>=321 && xcor_end<=371 && brick26!=0)
			mov x_brick_start,321
			mov x_brick_end,371
			mov y_brick_start,21
			mov y_brick_end,33
			dec brick26
			.if(brick26==0)
			call beep
			call remove_brick
			
			.endif	
			neg ballvy
			inc score2
			
.elseif(xcor_end>=381 && xcor_end<=431 && brick27!=0)
			mov x_brick_start,381
			mov x_brick_end,431
			mov y_brick_start,21
			mov y_brick_end,33
			dec brick27
			.if(brick27==0)
			call beep
			call remove_brick
			
			.endif	
			neg ballvy
			inc score2
			
.elseif(xcor_end>=441 && xcor_end<=491 && brick28!=0)
			mov x_brick_start,441
			mov x_brick_end,491
			mov y_brick_start,21
			mov y_brick_end,33
			dec brick28
			.if(brick28==0)
			call beep
			call remove_brick
			
			.endif	
			neg ballvy
			inc score2
						
.elseif(xcor_end>=501 && xcor_end<=551 && brick29!=0)
			mov x_brick_start,501
			mov x_brick_end,551
			mov y_brick_start,21
			mov y_brick_end,33
			dec brick29
			.if(brick29==0)
			call beep
			call remove_brick
			
			.endif	
			neg ballvy
			inc score2
						
.elseif(xcor_end>=561 && xcor_end<=611 && brick30!=0)
			mov x_brick_start,561
			mov x_brick_end,611
			mov y_brick_start,21
			mov y_brick_end,33
			dec brick30
			.if(brick30==0)
			call beep
			call remove_brick
			
			.endif	
			neg ballvy
			inc score2
			


.endif



.endif


.if(brick1==0 && brick2==0 && brick3==0 &&  brick4==0 && brick5==0 && brick6==0 && brick7==0 && brick8==0 && brick9==0 && brick10==0)
dec lane1

.endif
.if(brick11==0 && brick12==0 && brick13==0 && brick14==0 && brick15==0 && brick16==0 && brick17==0 && brick18==0  &&  brick19==0 &&  brick20==0)
dec lane2

.endif	
.if(brick21==0 && brick22==0 && brick23==0 &&   brick24==0 &&  brick25==0 && brick26==0 && brick27==0 && brick28==0 && brick29==0 &&  brick30==0  )
dec lane3

.endif

.if(lane1==0 && lane2==0 && lane3==0)	
call youwin
.endif


	call make_ball
	
	


ret 
ball1 endp
;============================================================================
ball2 proc        ; control movement of ball


;call make_paddle_right
call lives
call sccore
call timeupdate
call Time

call remove_ball                   
mov ax, ballvx
add xcor_start,ax
add xcor_end,ax



mov ax, ballvy
add ycor_start,ax
add ycor_end,ax


call make_ball

mov si,paddle_x_start
sub si,5
mov di,paddle_x_end
add di,60

.if(ycor_start<=285  &&  ycor_start>=279)
     .if(xcor_start>=si &&  xcor_end<=di)
	 call ballspeedy
	 .endif

.elseif(xcor_start<=20)                                  ; 15 start x 17 start y 300 y end  x end 620

call ballspeedx

.elseif(xcor_start >= 610)
call ballspeedx


.elseif(ycor_start< 20)
call ballspeedy


.elseif(ycor_start>=290)
dec zindagi
.if(zindagi==2)
mov bl,0
mov life3,bl
.elseif(zindagi==1)
mov bl,0
mov life2,bl
.elseif(zindagi==0)
mov bl,0
mov life1,bl
call gameover

.endif

call ballspeedy
call ballspeedx
mov si,paddle_x_start
sub si,10
mov di,paddle_x_end
add di,50

.if(xcor_end>si)
 call ballspeedx
 .elseif(xcor_start<di)
 call ballspeedx
  .else
 call ballspeedy
 .endif
.endif





;kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk



	


.if(ycor_end>=99 && ycor_end<=118)

.if(xcor_end>=21 && xcor_end<=71 && brick1!=0)
			
			mov x_brick_start,21
			mov x_brick_end,71
			mov y_brick_start,101
			mov y_brick_end,111
			dec brick1
			.if(brick1==0)
			call beep
			call remove_brick
			inc score2			
			.elseif(brick1==1)
			call color_change_brick

			.endif	
			neg ballvy
 
			

.elseif(xcor_end>=81 && xcor_end<=131 && brick2!=0)
			mov x_brick_start,81
			mov x_brick_end,131
			mov y_brick_start,101
			mov y_brick_end,111
			dec brick2
			.if(brick2==0)
			call beep
			call remove_brick
			neg ballvy
			inc score2
			.elseif(brick2==1)
			call color_change_brick
			.endif	
				
			
.elseif(xcor_end>=141 && xcor_end<=191 && brick3!=0)
			dec brick3
			mov x_brick_start,141
			mov x_brick_end,191
			mov y_brick_start,101
			mov y_brick_end,111
			
			.if(brick3==0)
			call beep
			call remove_brick
			inc score2
			.elseif(brick3==1)
			call color_change_brick
			
			.endif	
			neg ballvy
						

.elseif(xcor_end>=201 && xcor_end<=251 && brick4!=0)
			mov x_brick_start,201
			mov x_brick_end,251
			mov y_brick_start,101
			mov y_brick_end,111
			dec brick4
			.if(brick4==0)
			call beep
			call remove_brick
			inc score2
			.elseif(brick4==1)
			call color_change_brick

			.endif	
			neg ballvy
				

.elseif(xcor_end>=261 && xcor_end<=311 && brick5!=0)
			mov x_brick_start,261
			mov x_brick_end,311
			mov y_brick_start,101
			mov y_brick_end,111
			dec brick5
			.if(brick5==0)
			call beep
			call remove_brick
			
			inc score2
			.elseif(brick5==1)
			call color_change_brick
			.endif	

			neg ballvy
					

.elseif(xcor_end>=321 && xcor_end<=371 && brick6!=0)
			mov x_brick_start,321
			mov x_brick_end,371
			mov y_brick_start,101
			mov y_brick_end,111
			dec brick6
			.if(brick6==0)
			call beep
			call remove_brick
			inc score2			
			.elseif(brick6==1)
			call color_change_brick
			.endif	
			neg ballvy			

.elseif(xcor_end>=381 && xcor_end<=431 && brick7!=0)
			mov x_brick_start,381
			mov x_brick_end,431
			mov y_brick_start,101
			mov y_brick_end,111
			
			dec brick7
			.if(brick7==0)
			call beep
			call remove_brick
			inc score2			
			.elseif(brick7==1)
			call color_change_brick

			.endif	
			neg ballvy
				

.elseif(xcor_end>=441 && xcor_end<=491 && brick8!=0)
			mov x_brick_start,441
			mov x_brick_end,491
			mov y_brick_start,101
			mov y_brick_end,111
			
			dec brick8
			.if(brick8==0)
			call beep
			call remove_brick
			inc score2			
			.elseif(brick8==1)
			call color_change_brick
			
			.endif	
			neg ballvy	
			
.elseif(xcor_end>=501 && xcor_end<=551 && brick9!=0)
			mov x_brick_start,501
			mov x_brick_end,551
			mov y_brick_start,101
			mov y_brick_end,111
			dec brick9
			.if(brick9==0)
			call beep
			call remove_brick
			inc score2
			.elseif(brick9==1)
			call color_change_brick
			.endif	
			neg ballvy
			inc score2		
		
.elseif(xcor_end>=561 && xcor_end<=611 && brick10!=0)
			mov x_brick_start,561
			mov x_brick_end,611
			mov y_brick_start,101
			mov y_brick_end,111
			dec brick10
			.if(brick10==0)
			call beep
			call remove_brick
			.elseif(brick10==1)
			call color_change_brick
			.endif	
			neg ballvy
			inc score2				


.endif


.elseif(ycor_end>=61 && ycor_end<=77)

.if(xcor_end>=21 && xcor_end<=71 && brick11!=0)
			mov x_brick_start,21
			mov x_brick_end,71
			mov y_brick_start,61
			mov y_brick_end,71
			dec brick11
			.if(brick11==0)
			call beep
			call remove_brick
			.elseif(brick11==1)
			call color_change_brick
			.endif	
			neg ballvy
			inc score2
			
.elseif(xcor_end>=81 && xcor_end<=131 && brick12!=0)
			mov x_brick_start,81
			mov x_brick_end,131
			mov y_brick_start,61
			mov y_brick_end,71
			dec brick12
			.if(brick12==0)
			call beep
			call remove_brick
			.elseif(brick12==1)
			call color_change_brick
			.endif	
			neg ballvy
			inc score2
						
.elseif(xcor_end>=141 && xcor_end<=191 && brick13!=0)
			mov x_brick_start,141
			mov x_brick_end,191
			mov y_brick_start,61
			mov y_brick_end,71
			dec brick13
			.if(brick13==0)
			call beep
			call remove_brick
			.elseif(brick13==1)
			call color_change_brick
			.endif	
			neg ballvy
			inc score2
			
.elseif(xcor_end>=201 && xcor_end<=251 && brick14!=0)
			mov x_brick_start,201
			mov x_brick_end,251
			mov y_brick_start,61
			mov y_brick_end,71
			dec brick14
			.if(brick14==0)
			call beep
			call remove_brick
			.elseif(brick14==1)
			call color_change_brick
			.endif	
			neg ballvy
			inc score2
			

.elseif(xcor_end>=261 && xcor_end<=311 && brick15!=0)
			mov x_brick_start,261
			mov x_brick_end,311
			mov y_brick_start,61
			mov y_brick_end,71
			dec brick15
			.if(brick15==0)
			call beep
			neg ballvy
			call remove_brick
			.elseif(brick15==1)
			call color_change_brick
			;neg ballvy
			.endif	
			neg ballvy
			inc score2
			

.elseif(xcor_end>=321 && xcor_end<=371 && brick16!=0)
			mov x_brick_start,321
			mov x_brick_end,371
			mov y_brick_start,61
			mov y_brick_end,71
			dec brick16
			.if(brick16==0)
			call beep
			call remove_brick
			.elseif(brick16==1)
			call color_change_brick
			.endif	
			neg ballvy
			inc score2
			
.elseif(xcor_end>=381 && xcor_end<=431 && brick17!=0)
			mov x_brick_start,381
			mov x_brick_end,431
			mov y_brick_start,61
			mov y_brick_end,71
			dec brick17
			.if(brick17==0)
			call beep
			call remove_brick
			.elseif(brick17==1)
			call color_change_brick
			.endif	
			neg ballvy
			inc score2
			
.elseif(xcor_end>=441 && xcor_end<=491 && brick18!=0)
			mov x_brick_start,441
			mov x_brick_end,491
			mov y_brick_start,61
			mov y_brick_end,71
			dec brick18
			.if(brick18==0)
			call beep
			call remove_brick
			.elseif(brick18==1)
			call color_change_brick
			.endif	
			neg ballvy
			inc score2
						
.elseif(xcor_end>=501 && xcor_end<=551 && brick19!=0)
			mov x_brick_start,501
			mov x_brick_end,551
			mov y_brick_start,61
			mov y_brick_end,71
			dec brick19
			.if(brick19==0)
			call beep
			call remove_brick
			.elseif(brick19==1)
			call color_change_brick
			.endif	
			neg ballvy
			inc score2
						
.elseif(xcor_end>=561 && xcor_end<=611 && brick20!=0)
			mov x_brick_start,561
			mov x_brick_end,611
			mov y_brick_start,61
			mov y_brick_end,71
			dec brick20
			.if(brick20==0)
			call beep
			call remove_brick
			.elseif(brick20==1)
			call color_change_brick
			.endif	
			neg ballvy
			inc score2
			


.endif

.elseif(ycor_end>=21 && ycor_end<=39)

.if(xcor_end>=21 && xcor_end<=71 && brick21!=0)
			mov x_brick_start,21
			mov x_brick_end,71
			mov y_brick_start,21
			mov y_brick_end,33
			dec brick21
			.if(brick21==0)
			call beep
			call remove_brick
			.elseif(brick21==1)
			call color_change_brick
			.endif	
			neg ballvy
			inc score2
			
.elseif(xcor_end>=81 && xcor_end<=131 && brick22!=0)
			mov x_brick_start,81
			mov x_brick_end,131
			mov y_brick_start,21
			mov y_brick_end,33
			dec brick22
			.if(brick22==0)
			call beep
			call remove_brick
			.elseif(brick22==1)
			call color_change_brick
			.endif	
			neg ballvy
			inc score2
						
.elseif(xcor_end>=141 && xcor_end<=191 && brick23!=0)
			mov x_brick_start,141
			mov x_brick_end,191
			mov y_brick_start,21
			mov y_brick_end,33
			dec brick23
			.if(brick23==0)
			call beep
			call remove_brick
			.elseif(brick23==1)
			call color_change_brick
			.endif	
			neg ballvy
			inc score2
			
.elseif(xcor_end>=201 && xcor_end<=251 && brick24!=0)
			mov x_brick_start,201
			mov x_brick_end,251
			mov y_brick_start,21
			mov y_brick_end,33
			dec brick24
			.if(brick24==0)
			call beep
			call remove_brick
			.elseif(brick24==1)
			call color_change_brick
			.endif	
			neg ballvy
			inc score2
			

.elseif(xcor_end>=261 && xcor_end<=311 && brick25!=0)
			mov x_brick_start,261
			mov x_brick_end,311
			mov y_brick_start,21
			mov y_brick_end,33
			dec brick25
			.if(brick25==0)
			call beep
			call remove_brick
			.elseif(brick25==1)
			call color_change_brick
			.endif	
			neg ballvy
			inc score2
			

.elseif(xcor_end>=321 && xcor_end<=371 && brick26!=0)
			mov x_brick_start,321
			mov x_brick_end,371
			mov y_brick_start,21
			mov y_brick_end,33
			dec brick26
			.if(brick26==0)
			call beep
			call remove_brick
			.elseif(brick26==1)
			call color_change_brick
			.endif	
			neg ballvy
			inc score2
			
.elseif(xcor_end>=381 && xcor_end<=431 && brick27!=0)
			mov x_brick_start,381
			mov x_brick_end,431
			mov y_brick_start,21
			mov y_brick_end,33
			dec brick27
			.if(brick27==0)
			call beep
			call remove_brick
			.elseif(brick27==1)
			call color_change_brick
			.endif	
			neg ballvy
			inc score2
			
.elseif(xcor_end>=441 && xcor_end<=491 && brick28!=0)
			mov x_brick_start,441
			mov x_brick_end,491
			mov y_brick_start,21
			mov y_brick_end,33
			dec brick28
			.if(brick28==0)
			call beep
			call remove_brick
			.elseif(brick28==1)
			call color_change_brick
			.endif	
			neg ballvy
			inc score2
						
.elseif(xcor_end>=501 && xcor_end<=551 && brick29!=0)
			mov x_brick_start,501
			mov x_brick_end,551
			mov y_brick_start,21
			mov y_brick_end,33
			dec brick29
			.if(brick29==0)
			call beep
			call remove_brick
			.elseif(brick29==1)
			call color_change_brick
			.endif	
			neg ballvy
			inc score2
						
.elseif(xcor_end>=561 && xcor_end<=611 && brick30!=0)
			mov x_brick_start,561
			mov x_brick_end,611
			mov y_brick_start,21
			mov y_brick_end,33
			dec brick30
			.if(brick30==0)
			call beep
			call remove_brick
			.elseif(brick20==1)
			call color_change_brick
			.endif	
			neg ballvy
			inc score2
			


.endif



.endif

.if(brick1==0 && brick2==0 && brick3==0 &&  brick4==0 && brick5==0 && brick6==0 && brick7==0 && brick8==0 && brick9==0 && brick10==0)
dec lane1

.endif
.if(brick11==0 && brick12==0 && brick13==0 && brick14==0 && brick15==0 && brick16==0 && brick17==0 && brick18==0  &&  brick19==0 &&  brick20==0)
dec lane2

.endif	
.if(brick21==0 && brick22==0 && brick23==0 &&   brick24==0 &&  brick25==0 && brick26==0 && brick27==0 && brick28==0 && brick29==0 &&  brick30==0  )
dec lane3

.endif

.if(lane1==0 && lane2==0 && lane3==0)	
call youwin
.endif


	call make_ball
	
	


ret 
ball2 endp
;============================================================================
ball3 proc        ; control movement of ball


;
call lives
call sccore
call timeupdate
call Time

call remove_ball                   
mov ax, ballvx
add xcor_start,ax
add xcor_end,ax



mov ax, ballvy
add ycor_start,ax
add ycor_end,ax


call make_ball

mov si,paddle_x_start
sub si,5
mov di,paddle_x_end
add di,35

.if(ycor_start<=289  &&  ycor_start>=278)
     .if(xcor_start>=si &&  xcor_end<=di)
	 call ballspeedy
	 
	

	 
	 .endif
.elseif(xcor_start<=20)                                  ; 15 start x 17 start y 300 y end  x end 620

call ballspeedx

.elseif(xcor_start >= 610)
call ballspeedx
call ballspeedy

.elseif(ycor_start< 20)
call ballspeedy


.elseif(ycor_start>=290  )
dec zindagi
.if(zindagi==2)
mov bl,0
mov life3,bl
.elseif(zindagi==1)
mov bl,0
mov life2,bl
.elseif(zindagi==0)
mov bl,0
mov life1,bl
call gameover

.endif



call ballspeedy
call ballspeedx
mov si,paddle_x_start
sub si,10
mov di,paddle_x_end
add di,35

.if(xcor_end>si)
 call ballspeedx
 .elseif(xcor_start<di)
 call ballspeedx
  .else
 call ballspeedy
 .endif
.endif









;kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk

.if(ycor_end>=99 && ycor_end<=118)

.if(xcor_end>=21 && xcor_end<=71 && brick1!=0)
			
			mov x_brick_start,21
			mov x_brick_end,71
			mov y_brick_start,101
			mov y_brick_end,111
			dec brick1
			.if(brick1==0)
			call beep
			call remove_brick

			.elseif(brick1>1)
			call color_change_brick
			.elseif(brick1>0)
			call white_brick
			.endif	
			neg ballvy
			inc score2 
			

.elseif(xcor_end>=81 && xcor_end<=131 && brick2!=0)
			mov x_brick_start,81
			mov x_brick_end,131
			mov y_brick_start,101
			mov y_brick_end,111
			dec brick2
			.if(brick2==0)
			call beep
			call remove_brick
			neg ballvy
				
			
			.elseif(brick2>1)
			call color_change_brick
			.elseif(brick2>0)
			call white_brick
			.endif	
			
			inc score2	
			
.elseif(xcor_end>=141 && xcor_end<=191 && brick3!=0)
			dec brick3
			mov x_brick_start,141
			mov x_brick_end,191
			mov y_brick_start,101
			mov y_brick_end,111
			
			.if(brick3==0)
			call beep
			call remove_brick
			
			

			
			.elseif(brick3>1)
			call color_change_brick
			.elseif(brick3>0)
			call white_brick
			.endif	
			neg ballvy
			inc score2			

.elseif(xcor_end>=201 && xcor_end<=251 && brick4!=0)
			mov x_brick_start,201
			mov x_brick_end,251
			mov y_brick_start,101
			mov y_brick_end,111
			dec brick4
			.if(brick4==0)
			call beep
			call red_brick
			
			.elseif(brick4>0)
			call red_brick
			.endif	
			neg ballvy
			inc score2			

.elseif(xcor_end>=261 && xcor_end<=311 && brick5!=0)
			mov x_brick_start,261
			mov x_brick_end,311
			mov y_brick_start,101
			mov y_brick_end,111
			dec brick5
			.if(brick5==0)
			call beep
			call remove_brick
			neg ballvy
			
			.elseif(brick5>1)
			call color_change_brick
			.elseif(brick5>0)
			call white_brick
			.endif	
			neg ballvy
			inc score2		

.elseif(xcor_end>=321 && xcor_end<=371 && brick6!=0)
			mov x_brick_start,321
			mov x_brick_end,371
			mov y_brick_start,101
			mov y_brick_end,111
			dec brick6
			.if(brick6==0)
			call beep
			call remove_brick
			
			.elseif(brick6>1)
			call color_change_brick
			.elseif(brick6>0)
			call white_brick
			.endif	
			neg ballvy
			inc score2			

.elseif(xcor_end>=381 && xcor_end<=431 && brick7!=0)
			mov x_brick_start,381
			mov x_brick_end,431
			mov y_brick_start,101
			mov y_brick_end,111
			
			dec brick7
			.if(brick7==0)
			call beep
			call remove_brick
			.elseif(brick7>1)
			call color_change_brick
			.elseif(brick7>0)
			call white_brick
			
			.endif	
			neg ballvy
			inc score2	

.elseif(xcor_end>=441 && xcor_end<=491 && brick8!=0)
			mov x_brick_start,441
			mov x_brick_end,491
			mov y_brick_start,101
			mov y_brick_end,111
			
			dec brick8
			.if(brick8==0)
			call beep
			call remove_brick
			.elseif(brick8>1)
			call color_change_brick
			.elseif(brick8>0)
			call white_brick
			
			.endif	
			neg ballvy
			inc score2	
			
.elseif(xcor_end>=501 && xcor_end<=551 && brick9!=0)
			mov x_brick_start,501
			mov x_brick_end,551
			mov y_brick_start,101
			mov y_brick_end,111
			dec brick9
			.if(brick9==0)
			call beep
			call remove_brick
			.elseif(brick9>1)
			call color_change_brick
			.elseif(brick9>0)
			call white_brick
			
			.endif	
			neg ballvy
			inc score2		
		
.elseif(xcor_end>=561 && xcor_end<=611 && brick10!=0)
			mov x_brick_start,561
			mov x_brick_end,611
			mov y_brick_start,101
			mov y_brick_end,111
			dec brick10
			.if(brick10==0)
			call beep
			call remove_brick
			.elseif(brick10>1)
			call color_change_brick
			.elseif(brick10>0)
			call white_brick
			
			.endif	
			neg ballvy
			inc score2				


.endif


.elseif(ycor_end>=61 && ycor_end<=78)

.if(xcor_end>=21 && xcor_end<=71 && brick11!=0)
			mov x_brick_start,21
			mov x_brick_end,71
			mov y_brick_start,61
			mov y_brick_end,71
			dec brick11
			.if(brick11==0)
			call beep
			call remove_brick
			.elseif(brick11>1)
			call color_change_brick
			.elseif(brick11>0)
			call white_brick
			.endif	
			neg ballvy
			inc score2
			
.elseif(xcor_end>=81 && xcor_end<=131 && brick12!=0)
			mov x_brick_start,81
			mov x_brick_end,131
			mov y_brick_start,61
			mov y_brick_end,71
			dec brick12
			.if(brick12==0)
			call beep
			call remove_brick
			.elseif(brick12>1)
			call color_change_brick
			.elseif(brick12>0)
			call white_brick
			.endif	
			neg ballvy
			inc score2
						
.elseif(xcor_end>=141 && xcor_end<=191 && brick13!=0)
			mov x_brick_start,141
			mov x_brick_end,191
			mov y_brick_start,61
			mov y_brick_end,71
			dec brick13
			.if(brick13==0)
			call beep
			call remove_brick
			.elseif(brick13>1)
			call color_change_brick
			.elseif(brick13>0)
			call white_brick
			.endif	
			neg ballvy
			inc score2
			
.elseif(xcor_end>=201 && xcor_end<=251 && brick14!=0)
			mov x_brick_start,201
			mov x_brick_end,251
			mov y_brick_start,61
			mov y_brick_end,71
			dec brick14
			.if(brick14==0)
			call beep
			call remove_brick
			.elseif(brick14>1)
			call color_change_brick
			.elseif(brick14>0)
			call white_brick
			.endif	
			neg ballvy
			inc score2
			

.elseif(xcor_end>=261 && xcor_end<=311 && brick15!=0)
			mov x_brick_start,261
			mov x_brick_end,311
			mov y_brick_start,61
			mov y_brick_end,71
			dec brick15
			.if(brick15==0)
			call beep
			call remove_brick
			.endif

			.if(level==3)

			mov x_brick_start,21            ; brick 21
			mov x_brick_end,71
			mov y_brick_start,21
			mov y_brick_end,33
			
			call beep
			call remove_brick

			mov x_brick_start,441           ; brick 28
			mov x_brick_end,491
			mov y_brick_start,21
			mov y_brick_end,33
			
			call beep
			call remove_brick

			mov x_brick_start,561           ; brick 20
			mov x_brick_end,611
			mov y_brick_start,101
			mov y_brick_end,111
			
			call beep
			call remove_brick

			mov x_brick_start,261           ; brick 25
			mov x_brick_end,311
			mov y_brick_start,21
			mov y_brick_end,33
			
			call beep
			call remove_brick

			mov x_brick_start,321          ; brick 26
			mov x_brick_end,371
			mov y_brick_start,21
			mov y_brick_end,33
			
			call beep
			call remove_brick
			
			.endif
			
			.if(brick15>0)
			call color_change_brick
			.endif	
			neg ballvy
			inc score2
			

.elseif(xcor_end>=321 && xcor_end<=371 && brick16!=0)
			mov x_brick_start,321
			mov x_brick_end,371
			mov y_brick_start,61
			mov y_brick_end,71
			dec brick16
			.if(brick16==0)
			call beep
			call remove_brick
			.elseif(brick16>1)
			call color_change_brick
			.elseif(brick16>0)
			call white_brick
			.endif	
			neg ballvy
			inc score2
			
.elseif(xcor_end>=381 && xcor_end<=431 && brick17!=0)
			mov x_brick_start,381
			mov x_brick_end,431
			mov y_brick_start,61
			mov y_brick_end,71
			dec brick17
			.if(brick17==0)
			call beep
			call remove_brick
			.elseif(brick17>1)
			call color_change_brick
			.elseif(brick17>0)
			call white_brick
			.endif	
			neg ballvy
			inc score2
			
.elseif(xcor_end>=441 && xcor_end<=491 && brick18!=0)
			mov x_brick_start,441
			mov x_brick_end,491
			mov y_brick_start,61
			mov y_brick_end,71
			dec brick18
			.if(brick18==0)
			call beep
			call remove_brick
			.elseif(brick18>1)
			call color_change_brick
			.elseif(brick18>0)
			call white_brick
			.endif	
			neg ballvy
			inc score2
						
.elseif(xcor_end>=501 && xcor_end<=551 && brick19!=0)
			mov x_brick_start,501
			mov x_brick_end,551
			mov y_brick_start,61
			mov y_brick_end,71
			dec brick19
			.if(brick19==0)
			call beep
			call red_brick
			.elseif(brick19>0)
			call red_brick
			.endif	
			neg ballvy
			inc score2
						
.elseif(xcor_end>=561 && xcor_end<=611 && brick20!=0)
			mov x_brick_start,561
			mov x_brick_end,611
			mov y_brick_start,61
			mov y_brick_end,71
			dec brick20
			.if(brick20==0)
			call beep
			call remove_brick
			.elseif(brick20>1)
			call color_change_brick
			.elseif(brick20>0)
			call white_brick
			.endif	
			neg ballvy
			inc score2
			


.endif

.elseif(ycor_end>=21 && ycor_end<=38)

.if(xcor_end>=21 && xcor_end<=71 && brick21!=0)
			mov x_brick_start,21
			mov x_brick_end,71
			mov y_brick_start,21
			mov y_brick_end,33
			dec brick21
			.if(brick21==0)
			call beep
			call remove_brick
			.elseif(brick21>1)
			call color_change_brick
			.elseif(brick21>0)
			call white_brick
			.endif	
			neg ballvy
			inc score2
			
.elseif(xcor_end>=81 && xcor_end<=131 && brick22!=0)
			mov x_brick_start,81
			mov x_brick_end,131
			mov y_brick_start,21
			mov y_brick_end,33
			dec brick22
			.if(brick22==0)
			call beep
			call remove_brick
			.elseif(brick22>1)
			call color_change_brick
			.elseif(brick22>0)
			call white_brick
			.endif	
			neg ballvy
			inc score2
						
.elseif(xcor_end>=141 && xcor_end<=191 && brick23!=0)
			mov x_brick_start,141
			mov x_brick_end,191
			mov y_brick_start,21
			mov y_brick_end,33
			dec brick23
			.if(brick23==0)
			call beep
			call remove_brick
			.elseif(brick23>1)
			call color_change_brick
			.elseif(brick23>0)
			call white_brick
			.endif	
			neg ballvy
			inc score2
			
.elseif(xcor_end>=201 && xcor_end<=251 && brick24!=0)
			mov x_brick_start,201
			mov x_brick_end,251
			mov y_brick_start,21
			mov y_brick_end,33
			dec brick24
			.if(brick24==0)
			call beep
			call red_brick
			.elseif(brick24>0)
			call red_brick
			.endif	
			neg ballvy
			inc score2
			

.elseif(xcor_end>=261 && xcor_end<=311 && brick25!=0)
			mov x_brick_start,261
			mov x_brick_end,311
			mov y_brick_start,21
			mov y_brick_end,33
			dec brick25
			.if(brick25==0)
			call beep
			call remove_brick
			.elseif(brick25>1)
			call color_change_brick
			.elseif(brick25>0)
			call white_brick
			.endif	
			neg ballvy
			inc score2
			

.elseif(xcor_end>=321 && xcor_end<=371 && brick26!=0)
			mov x_brick_start,321
			mov x_brick_end,371
			mov y_brick_start,21
			mov y_brick_end,33
			dec brick26
			.if(brick26==0)
			call beep
			call remove_brick
			.elseif(brick26>1)
			call color_change_brick
			.elseif(brick26>0)
			call white_brick
			.endif	
			neg ballvy
			inc score2
			
.elseif(xcor_end>=381 && xcor_end<=431 && brick27!=0)
			mov x_brick_start,381
			mov x_brick_end,431
			mov y_brick_start,21
			mov y_brick_end,33
			dec brick27
			.if(brick27==0)
			call beep
			call remove_brick
			.elseif(brick27>1)
			call color_change_brick
			.elseif(brick27>0)
			call white_brick
			.endif	
			neg ballvy
			inc score2
			
.elseif(xcor_end>=441 && xcor_end<=491 && brick28!=0)
			mov x_brick_start,441
			mov x_brick_end,491
			mov y_brick_start,21
			mov y_brick_end,33
			dec brick28
			.if(brick28==0)
			call beep
			call remove_brick
			.elseif(brick28>1)
			call color_change_brick
			.elseif(brick28>0)
			call white_brick
			.endif	
			neg ballvy
			inc score2
						
.elseif(xcor_end>=501 && xcor_end<=551 && brick29!=0)
			mov x_brick_start,501
			mov x_brick_end,551
			mov y_brick_start,21
			mov y_brick_end,33
			dec brick29
			.if(brick29==0)
			call beep
			call red_brick
			.elseif(brick29>0)
			call red_brick
			.endif	
			neg ballvy
			inc score2
						
.elseif(xcor_end>=561 && xcor_end<=611 && brick30!=0)
			mov x_brick_start,561
			mov x_brick_end,611
			mov y_brick_start,21
			mov y_brick_end,33
			dec brick30
			.if(brick30==0)
			call beep
			call red_brick
			.elseif(brick30>0)
			call red_brick
			.endif	
			neg ballvy
			inc score2
			


.endif



.endif

.if(brick1==0 && brick2==0 && brick3==0 &&  brick5==0 && brick6==0 && brick7==0 && brick8==0 && brick9==0 && brick10==0)
dec lane1

.endif
.if(brick11==0 && brick12==0 && brick13==0 && brick14==0 && brick15==0 && brick16==0 && brick17==0 && brick18==0  && brick20==0)
dec lane2

.endif	
.if(brick21==0 && brick22==0 && brick23==0 &&  brick25==0 && brick26==0 && brick27==0 && brick28==0)
dec lane3

.endif

.if(lane1==0 && lane2==0 && lane3==0)	
call youwin
.endif


call make_ball

ret 
ball3 endp
;============================================================================
sccore proc

mov ah,02h
mov bh,0
mov dh,22
mov dl,18
int 10h

mov al, 'S'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, 'C'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, 'O'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, 'R'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, 'E'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, ':'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h


.if(score2=='9')
mov bl,48
mov score2,bl
inc score1
.else

.endif


mov al, score1
mov bl,14
mov bh,0
mov ah,0Eh
int 10h


mov al, score2
mov bl,14
mov bh,0
mov ah,0Eh
int 10h


ret
sccore endp



;============================================================================
Time proc

mov ah,02h
mov bh,0
mov dh,22
mov dl,05
int 10h

mov al, 'T'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, 'I'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, 'M'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, 'E'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, 'R'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, ':'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, timer1
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, ':'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h


mov al, timer2
mov bl,14
mov bh,0
mov ah,0Eh
int 10h


mov al, timer3
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

ret
Time endp



;============================================================================
lives proc

mov ah,02h
mov bh,0
mov dh,22
mov dl,50
int 10h

mov al, 'L'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, 'I'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, 'V'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, 'E'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, 'S'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, ':'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, life1
mov bl,4
mov bh,0
mov ah,0Eh
int 10h

mov al, life2
mov bl,4
mov bh,0
mov ah,0Eh
int 10h

mov al, life3
mov bl,4
mov bh,0
mov ah,0Eh
int 10h

ret
lives endp
;============================================================================


game_start:
main proc

call backcolor
call introduction
call frame
call enter_name
call frame
triss:
call backcolor
call menu


mov ah,01h
int 21h

.if(al=='1')
mov ballvx,-1
mov ballvy,-1

mov brick1 , 1
mov brick2 , 1
mov brick3 , 1
mov brick4 , 1
mov brick5 , 1
mov brick6 , 1
mov brick7 , 1
mov brick8 , 1
mov brick9 , 1
mov brick10 ,1

mov brick11 , 1
mov brick12 , 1
mov brick13 , 1
mov brick14 , 1
mov brick15 , 1
mov brick16 , 1
mov brick17 , 1
mov brick18 , 1
mov brick19 , 1
mov brick20 , 1


mov brick21 , 1
mov brick22 , 1
mov brick23 , 1
mov brick24 , 1
mov brick25 , 1
mov brick26 , 1
mov brick27 , 1
mov brick28 , 1
mov brick29 , 1
mov brick30 , 1

jmp level_1

.elseif(al=='2')
mov ballvx,-2
mov ballvy,-2

mov brick1 , 2
mov brick2 , 2
mov brick3 , 2
mov brick4 , 2
mov brick5 , 2
mov brick6 , 2
mov brick7 , 2
mov brick8 , 2
mov brick9 , 2
mov brick10 , 2

mov brick11 , 2
mov brick12 , 2
mov brick13 , 2
mov brick14 , 2
mov brick15 , 2
mov brick16 , 2
mov brick17 , 2
mov brick18 , 2
mov brick19 , 2
mov brick20 , 2


mov brick21 , 2
mov brick22 , 2
mov brick23 , 2
mov brick24 , 2
mov brick25 , 2
mov brick26 , 2
mov brick27 , 2
mov brick28 , 2
mov brick29 , 2
mov brick30 , 2


jmp level_2

.elseif(al=='3')
mov level,3
mov ballvx,-3
mov ballvy,-3

mov brick1 , 3
mov brick2 , 3
mov brick3 , 3
mov brick4 , 3
mov brick5 , 3
mov brick6 , 3
mov brick7 , 3
mov brick8 , 3
mov brick9 , 3
mov brick10 , 3

mov brick11 , 3
mov brick12 , 3
mov brick13 , 3
mov brick14 , 3
mov brick15 , 3
mov brick16 , 3
mov brick17 , 3
mov brick18 , 3
mov brick19 , 3
mov brick20 , 3


mov brick21 , 3
mov brick22 , 3
mov brick23 , 3
mov brick24 , 3
mov brick25 , 3
mov brick26 , 3
mov brick27 , 3
mov brick28 , 3
mov brick29 , 3
mov brick30 , 3


jmp level_3



.elseif(al=='4')
call instruction
jmp triss

.elseif(al=='5')
call recor
jmp triss

.else
jmp exit
.endif

mov al,0
mov ah,01h
int 21h
cmp al,27
je exit

cmp al,27
je exit

level_1:

call frame
call make_paddle_right_1
call bricks
call Time
call sccore
call lives



Go_I:

call ball1




mov ah,1
int 16h
jz Go_I


mov ah,0
int 16h


cmp ah,4Dh
je RIGHT

cmp ah,4BH
je LEFT

cmp al,27
je exit

cmp al,13     ; exit the program for esc key pressed
je pause


jmp Go_I


pause:
again:
call wai

jmp Go_I


RIGHT:
add p,10
mov si,p
call make_paddle_right_1

jmp Go_I

LEFT:
sub p,10
mov si,p
call make_paddle_left_1
jmp Go_I
;======================================================================================
level_2:

call frame
call make_paddle_right_1
call bricks
call Time
call sccore
call lives



Go_II:

call ball2




mov ah,1
int 16h
jz Go_II


mov ah,0
int 16h


cmp ah,4Dh
je RIGHT_II

cmp ah,4BH
je LEFT_II

cmp al,27
je exit

cmp al,13     ; exit the program for esc key pressed
je pause_II


jmp Go_II


pause_II:
again_II:
call wai

jmp Go_II


RIGHT_II:
add p,10
mov si,p
call make_paddle_right_2

jmp Go_II

LEFT_II:
sub p,10
mov si,p
call make_paddle_left_2
jmp Go_II

;======================================================================================
;======================================================================================
level_3:

call frame
call make_paddle_right_3
call bricks
call Time
call sccore
call lives



Go_III:

call ball3




mov ah,1
int 16h
jz Go_III


mov ah,0
int 16h


cmp ah,4Dh
je RIGHT_III

cmp ah,4BH
je LEFT_III

cmp al,27
je exit

cmp al,13     ; exit the program for esc key pressed
je pause_III


jmp Go_III


pause_III:
again_III:
call wai

jmp Go_III


RIGHT_III:
add p,10
mov si,p
call make_paddle_right_3

jmp Go_III

LEFT_III:
sub p,10
mov si,p
call make_paddle_left_3
jmp Go_III

main endp
;=======================================================================================
ballspeedx:
neg ballvx
ret

ballspeedy:
neg ballvy
ret


dellay:
mov si,5000
t:
dec si
cmp si,0
ja t
ret

haha:
;====================================================================
;====================================================================
timeupdate proc

;call dellay
call dellay


.if(timer3=='9')
inc timer2
mov bl,48
mov timer3,bl

.elseif(timer2=='5' && timer3=='8')
inc timer1
mov bl,48
mov timer2,bl
mov timer3,bl


.elseif(timer1=='4')
call gameover

.else
inc timer3
.endif


ret
timeupdate endp 


;=================================================================
youwin proc

mov ah,0h
mov al,10h
int 10h

call frame

mov ah,02h
mov bh,0
mov dh,12
mov dl,30
int 10h

mov al, 'Y'
mov bl,01
mov bh,0
mov ah,0Eh
int 10h

mov al, 'O'
mov bl,04
mov bh,0
mov ah,0Eh
int 10h

mov al, 'U'
mov bl,11
mov bh,0
mov ah,0Eh
int 10h

mov al, ' '
mov bl,13
mov bh,0
mov ah,0Eh
int 10h

mov al, 'W'
mov bl,12
mov bh,0
mov ah,0Eh
int 10h

mov al, 'I'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h
mov al, 'N'
mov bl,01
mov bh,0
mov ah,0Eh
int 10h

mov ah,02h
mov bh,0
mov dh,16
mov dl,30
int 10h

mov al, 'S'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, 'C'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, 'O'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, 'R'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, 'E'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, ':'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, score1
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, score2
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

jmp exit

youwin endp
;===================================
recor proc

mov ah,0ch  ; clear screen
mov al,10
mov bh,0

call backcolor


mov ah,02h
mov bh,0
mov dh,10
mov dl,30
int 10h

;file handling
;existing file

mov ah,3dh  
mov al,0                
mov dx,offset fname
int 21h
mov fileinfo,ax
mov ah,3fh
mov bx,fileinfo
mov cx,90
mov dx,offset buffer
int 21h



mov dx,offset buffer
mov ah,09h
int 21h


mov ah,3eh
int 21h

mov ah,0
int 16h
.if(al=='a')
ret
.endif
recor endp
;===================================
wai proc



mov ah,02h
mov bh,0
mov dh,12
mov dl,30
int 10h

mov al, 'P'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, 'A'
mov bl,04
mov bh,0
mov ah,0Eh
int 10h

mov al, 'U'
mov bl,11
mov bh,0
mov ah,0Eh
int 10h

mov al, 'S'
mov bl,13
mov bh,0
mov ah,0Eh
int 10h

mov al, 'E'
mov bl,12
mov bh,0
mov ah,0Eh
int 10h

 mov ah,0
 int 16h

 .if( al==13)

 mov ah,02h
mov bh,0
mov dh,12
mov dl,30
int 10h

 mov al, 'P'
mov bl,0
mov bh,0
mov ah,0Eh
int 10h

mov al, 'A'
mov bl,0
mov bh,0
mov ah,0Eh
int 10h

mov al, 'U'
mov bl,0
mov bh,0
mov ah,0Eh
int 10h

mov al, 'S'
mov bl,0
mov bh,0
mov ah,0Eh
int 10h

mov al, 'E'
mov bl,0
mov bh,0
mov ah,0Eh
int 10h

 ret
 .endif

wai endp
;====================================================
gameover proc

mov ah,0h
mov al,10h
int 10h



mov ah,02h
mov bh,0
mov dh,12
mov dl,30
int 10h

mov al, 'G'
mov bl,01
mov bh,0
mov ah,0Eh
int 10h

mov al, 'A'
mov bl,04
mov bh,0
mov ah,0Eh
int 10h

mov al, 'M'
mov bl,11
mov bh,0
mov ah,0Eh
int 10h

mov al, 'E'
mov bl,13
mov bh,0
mov ah,0Eh
int 10h

mov al, ' '
mov bl,12
mov bh,0
mov ah,0Eh
int 10h

mov al, 'O'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h
mov al, 'V'
mov bl,01
mov bh,0
mov ah,0Eh
int 10h

mov al, 'E'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, 'R'
mov bl,07
mov bh,0
mov ah,0Eh
int 10h



mov ah,02h
mov bh,0
mov dh,16
mov dl,30
int 10h

mov al, 'S'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, 'C'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, 'O'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, 'R'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, 'E'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, ':'
mov bl,14
mov bh,0
mov ah,0Eh
int 10h


mov al, score1
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

mov al, score2
mov bl,14
mov bh,0
mov ah,0Eh
int 10h

;;;;;;
mov dx,offset fname
mov al,1
mov ah,3dh
int 21h

;Appending File
mov bx,ax
mov cx,0
mov ah,42h
mov al,02h
int 21h



;Writing File
mov cx,2       ; should have been 1 less than length of msg.
mov dx,offset spacee
mov ah,40h
int 21h

;close file
mov ah,3eh
int 21h

;;;;;;
mov dx,offset fname
mov al,1
mov ah,3dh
int 21h

;Appending File
mov bx,ax
mov cx,0
mov ah,42h
mov al,02h
int 21h



;Writing File
mov cx,1      ; should have been 1 less than length of msg.
mov dx,offset score1
mov ah,40h
int 21h

;close file
mov ah,3eh
int 21h

;;;;;;
mov dx,offset fname
mov al,1
mov ah,3dh
int 21h

;Appending File
mov bx,ax
mov cx,0
mov ah,42h
mov al,02h
int 21h



;Writing File
mov cx,lengthof score1       ; should have been 1 less than length of msg.
mov dx,offset score2
mov ah,40h
int 21h

;close file
mov ah,3eh
int 21h

;;;;;;
mov dx,offset fname
mov al,1
mov ah,3dh
int 21h

;Appending File
mov bx,ax
mov cx,0
mov ah,42h
mov al,02h
int 21h



;Writing File
mov cx,lengthof score1       ; should have been 1 less than length of msg.
mov dx,0AH
mov ah,40h
int 21h

;close file
mov ah,3eh
int 21h







gameover endp
;=====================================================

exit:

MOV AH,4CH
INT 21h
END

