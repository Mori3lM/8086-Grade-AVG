; Moriel's project
; 10th(4)
IDEAL
MODEL small
STACK 100h
P486 ; expanding the jump's range
DATASEG
; --------------------------
; -------ArraysStart--------
	arraya db 10 dup('$', ' ')
	arrayb db 10 dup('$', ' ')
	arrayc db 10 dup('$', ' ')
	arrayp db 10 dup('$', ' ')
	arraye db 10 dup('$', ' ')
; -------ArraysEnd----------
; -------CountsStart--------
	arrayacount dw 0
	arraybcount dw 0
	arrayccount dw 0
	evennumcount db 0
	oddnumcount db 0
	evenarraycount db 0
	oddarraycount db 0
; -------CountsEnd----------
; -------PrintMessagesStart--------
	user_name_print db 'Hello ', 20 dup('$')
	user_name_input db 'Hello, Please enter your name: $'
	startinput db 'Please Enter 9 grades: $' 
	secondinput db 'Please press A, B, C, P, E, V or # to end this input $'
	end_message1 db 'Thank you for using my program' ,0ah, 'Would you like to go back to the menu?',0ah, '(Yes - Y Or No - N) $'
	end_message2 db 'Program Made By Moriel Moyal $'
	end_message3 db 'Good Bye... $ '
	start_text db 'Ok, lets start: $'
	part1_text db 'Part 1: $'
	part2_text db 'Part 2: $'
	menu_text db 'Press S to start',0ah, 'Press I for information about the program',0ah, 'Press N to change your name' ,0ah,'Press Esc to exit $'
	info_start db 'In this program you need to enter 9 grades (1 digit = 1 grade).', 0ah, 'After that, the program will split the grades to 3 categorys:', 0ah, 'a - grade which is 8 or bigger.', 0ah, 'b - grade is 6 or 7.', 0ah, 'c - grade is less then 6.',0ah, 0ah, 'It will print to the screen how much grades are in each category and the grades,how much grades are even and how much are odd and the average of the grades.' ,0ah, 0ah, 'After that you can press a, b, c, p, e, v or #. ',0ah, 'a - to see the grades in category a.', 0ah, 'b - to see the grades in category b', 0ah, 'c - to see the grades in category c', 0ah, 'p - to see the even grades.', 0ah, 'e - to see the odd grades', 0ah, 'v - to see the average of the grades' ,0ah, '# - to finish the program ' ,0ah,'Thank you for reading.$'
	info_end db 'Press S to start' ,0ah, 'Press M to go back to the menu',0ah,'Press Esc to exit the program $'
; --------PrintMessagesEnd---------
; -------OtherStart--------
	avg db 0
	user_input db 0
	program_times_count db 1
	pressed_instructions db 0
; --------OtherEnd---------
; --------------------------
; ----------ProjectStart----------
CODESEG
; ----------Part1procsStart-----------
proc orderarrays ; proc which ordering all the 3 arrays: A, B, C, P and E
; ----------OrderArraysStart-----------
; ----------OrderArrayAStart-----------
	mov bx, offset arraya
    mov cx, [arrayacount]
	cmp [arraya], 'n'
    je finish_order_arraya
    xor si, si
orderarraya1:
    push cx
    add si, 2
    push si
orderarraya2:
    mov al, [arraya + si]
    cmp [bx], al
    jna next_orderarraya
	cmp al, '$' ; if it's '$' it will jump to the next place
	je next_orderarraya
    mov dl, [bx]
    mov [bx], al
    mov [arraya + si], dl
	jmp next_orderarraya
finish_order_arraya:
    mov cx, 1
    jmp end_loop_arraya
next_orderarraya:
    add si, 2
    loop orderarraya2
    pop si cx
    add bx, 2
end_loop_arraya:
    loop orderarraya1
; ----------OrderArrayAEnd-----------
; ----------OrderArrayBStart-----------
	xor bx, bx
	mov bx, offset arrayb
    mov cx, [arraybcount]
	cmp [arrayb], 'n'
    je finish_order_arrayb
    xor si, si
orderarrayb1:
    push cx
    add si, 2
    push si
orderarrayb2:
    mov al, [arrayb + si]
    cmp [bx], al
    jna next_orderarrayb
	cmp al, '$' ; if it's '$' it will jump to the next place
	je next_orderarrayb
    mov dl, [bx]
    mov [bx], al
    mov [arrayb + si], dl
	jmp next_orderarrayb
finish_order_arrayb:
    mov cx, 1
    jmp end_loop_arrayb
next_orderarrayb:
    add si, 2
    loop orderarrayb2
    pop si cx
    add bx, 2
end_loop_arrayb:
    loop orderarrayb1
; ----------OrderArrayBEnd-----------
; ----------OrderArrayCStart-----------
	xor bx, bx
	mov bx, offset arrayc
    mov cx, [arrayccount]
	cmp [arrayc], 'n'
    je finish_order_arrayc
    xor si, si
orderarrayc1:
    push cx
    add si, 2
    push si
orderarrayc2:
    mov al, [arrayc + si]
    cmp [bx], al
    jna next_orderarrayc
	cmp al, '$' ; if it's '$' it will jump to the next place
	je next_orderarrayc
    mov dl, [bx]
    mov [bx], al
    mov [arrayc + si], dl
	jmp next_orderarrayc
finish_order_arrayc:
    mov cx, 1
    jmp end_loop_arrayc
next_orderarrayc:
    add si, 2
    loop orderarrayc2
    pop si cx
    add bx, 2
end_loop_arrayc:
    loop orderarrayc1
; ----------OrderArrayCEnd-----------
; ----------OrderArrayPStart-----------
	xor bx, bx
	mov bx, offset arrayp
    mov cl, [evennumcount]
	cmp [arrayp], 'n'
    je finish_order_arrayp
    xor si, si
orderarrayp1:
    push cx
    add si, 2
    push si
orderarrayp2:
    mov al, [arrayp + si]
    cmp [bx], al
    jna next_orderarrayp
	cmp al, '$' ; if it's '$' it will jump to the next place
	je next_orderarrayp
    mov dl, [bx]
    mov [bx], al
    mov [arrayp + si], dl
	jmp next_orderarrayp
finish_order_arrayp:
    mov cx, 1
    jmp end_loop_arrayp
next_orderarrayp:
    add si, 2
    loop orderarrayp2
    pop si cx
    add bx, 2
end_loop_arrayp:
    loop orderarrayp1
; ----------OrderArrayPEnd-----------
; ----------OrderArrayEStart-----------
	xor bx, bx
	mov bx, offset arraye
    mov cl, [oddnumcount]
	cmp [arraye], 'n'
	je finish_order_arraye
    xor si, si
orderarraye1:
    push cx
    add si, 2
    push si
orderarraye2:
    mov al, [arraye + si]
    cmp [bx], al
    jna next_orderarraye
	cmp al, '$'  ; if it's '$' it will continue to the next place of the array
	je next_orderarraye
    mov dl, [bx]
    mov [bx], al
    mov [arraye + si], dl
	jmp next_orderarraye
finish_order_arraye:
	mov cx, 1
	jmp end_loop_arraye
next_orderarraye:
    add si, 2
    loop orderarraye2
    pop si cx
    add bx, 2
end_loop_arraye:
    loop orderarraye1
; ----------OrderArrayEEnd-----------
; ----------OrderArraysEnd-----------
	ret
	endp orderarrays

proc calcavg
	xor ax, ax
	mov bl, 9
	mov al, [avg]
	div bl ; calculating the final average of the grades
	mov [avg], al ; moving the final average to avg
	ret
	endp calcavg

proc abc_order ; ordering the number to the arrays
	cmp al, 7 ; comparing between 7 to the grade that the user entered
	ja categorya ; if it's bigger then 7 it jumps to the label categorya
	je categoryb ; if it's equal to 7 it jumps to the label categoryb
	cmp al, 6 ; comparing between 6 to the grade that the user entered
	je categoryb ; if it's equal to 6 it jumps to the label categoryb
	jb categoryc ; if it's smaller then 6 it jumps to the label categoryc
categorya:
	add al, 30h ; adding to al 30h to print the number
	mov [si], al
	add si, 2 ; adding to si 2 to be ready to move more number to the next place of the array except the '$'
	inc [arrayacount]
	jmp finish_abc
categoryb:
	add al, 30h ; adding to al 30h to print the number
	mov [di], al
	add di, 2 ; adding to di 2 to be ready to move more number to the next place of the array except the '$'
	inc [arraybcount]
	jmp finish_abc
categoryc:
	add al, 30h ; adding to al 30h to print the number
	mov [bx], al
	add bx, 2 ; adding to bx 2 to be ready to move more number to the next place of the array except the '$'
	inc [arrayccount]
finish_abc:
	ret
	endp abc_order

proc evenorodd ; checking if the grade is even or odd
	push si di bx
	mov si, offset arrayp
	mov di, offset arraye
    mov bl, 2
    div bl
    cmp ah, 0 ; comparing between the remainder to 0
    je evennum ; if the remainder is equal to 0 it's even number
    jmp oddnum ; if the remainder isn't equal to 0 it's even number
evennum:
	xor dx, dx
	xor al, al
	mov al, [user_input]
	mov dl, [evenarraycount]
	add si, dx
	mov [si], al
	add [evenarraycount], 2h
    inc [evennumcount] ; adding one to the count of the even grades from the input
    jmp finish_evenorodd
oddnum:
	xor dx, dx
	xor al, al
	mov al, [user_input]
	mov dl, [oddarraycount]
	add di, dx
	mov [di], al
	add [oddarraycount], 2h
    inc [oddnumcount] ; adding one to the count of the odd grades from the input
    jmp finish_evenorodd
finish_evenorodd:
	pop bx di si
    ret
    endp evenorodd

proc printspace ; print space
	mov dx, ' '
	mov ah, 2h ; print
	int 21h
	ret
	endp printspace

proc printlinedown ; printing line down 
	mov ah, 2h ; print
	mov dl, 0ah ; line down
	int 21h ; interrupt
	ret
	endp printlinedown

proc printarraya ; printing array a (after it ordered)
	mov dx, 'A'
	mov ah, 2h ; print
	int 21h
	call printspace
	mov dx, [arrayacount]
	mov ah, 2h ; print
	int 21h ; interrupt
	call printspace
	mov dx, offset arraya
	mov ah, 9h ; print string
	int 21h ; interrupt
	ret
	endp printarraya

proc printarrayb ; printing array b (after it ordered)
	mov dx, 'B'
	mov ah, 2h ; print
	int 21h
	call printspace
	mov dx, [arraybcount]
	mov ah, 2h ; print
	int 21h ; interrupt
	call printspace
	mov dx, offset arrayb
	mov ah, 9h ; print string
	int 21h ; interrupt
	ret
	endp printarrayb

proc printarrayc ; printing array c (after it ordered)
	mov dx, 'C'
	mov ah, 2h ; print
	int 21h
	call printspace
	mov dx, [arrayccount]
	mov ah, 2h ; print
	int 21h ; interrupt
	call printspace
	mov dx, offset arrayc
	mov ah, 9h ; print string
	int 21h ; interrupt
	ret
	endp printarrayc

proc printarraye ; printing array e (after it ordered)
    mov dx, 'E'
    mov ah, 2h ; print
    int 21h
    call printspace
    mov dl, [oddnumcount]
    mov ah, 2h ; print
    int 21h ; interrupt
    call printspace
    mov dx, offset arraye
    mov ah, 9h ; print string
    int 21h ; interrupt
    ret
    endp printarraye

proc printarrayp ; printing array p (after it ordered)
    mov dx, 'P'
    mov ah, 2h ; print
    int 21h
    call printspace
    mov dl, [evennumcount]
    mov ah, 2h ; print
    int 21h ; interrupt
    call printspace
    mov dx, offset arrayp
    mov ah, 9h ; print string
    int 21h ; interrupt
    ret
    endp printarrayp

proc printevennumcount ; printing how much of the grades are even
	mov dx, 'P'
	mov ah, 2h ; print
	int 21h ; interrupt
	call printspace
	mov dl, [evennumcount]
	mov ah, 2h ; print
	int 21h ; interrupt
	call printspace
	ret
	endp printevennumcount

proc printoddnumcount ; printing how much of the grades are odd
	mov dx, 'E'
	mov ah, 2h ; print
	int 21h ; interrupt
	call printspace
	mov dl, [oddnumcount]
	mov ah, 2h ; print
	int 21h ; interrupt
	call printspace
	ret
	endp printoddnumcount

proc printavg ; printing the average grade
	mov dx, 'A'
	mov ah, 2h ; print
	int 21h ; interrupt
	mov dx, 'V'
	mov ah, 2h ; print
	int 21h ; interrupt
	mov dx, 'G'
	mov ah, 2h ; print
	int 21h ; interrupt
	call printspace
	mov dl, [avg]
	mov ah, 2h ; print
	int 21h ; interrupt
	ret
	endp printavg

proc cls ; moving to text mode
	mov ax, 3h ; text mode (it clears the console because I set up that to text mod)
	int 10h ; interrupt
	ret
	endp cls

proc menu ; the menu of the program
	cmp [program_times_count], 1
	ja menu_print
user_name:
	call cls
	mov dx, offset user_name_input
    mov ah, 9h ; print string
    int 21h ; interrupt
    mov bx, offset user_name_print
    add bx, 5
username_input:
    inc bx
    mov ah, 1h ; input
    int 21h ; interrupt
    mov [bx], al
    cmp al, 0Dh ; enter key
    jne username_input
    mov [byte ptr bx], '$'
menu_print:
	call cls
	mov dx, offset user_name_print
    mov ah, 9h ; print string
    int 21h ; interrupt
	mov dl, ','
	mov ah, 2h ; print char
	int 21h
	call printlinedown
	mov dx, offset menu_text
    mov ah, 9h ; print string
	int 21h ; interrupt
menu_input:
	mov ah, 0 ; keyboard
	int 16h ; interrupt
;------CmpForButtonNStart-------
	cmp al, 'n'
	je user_name
	cmp al, 'N'
	je user_name
;------CmpForButtonNEnd-------
;------CmpForButtonIStart-------
	cmp al, 'i'
	je information
	cmp al, 'I'
	je information
;------CmpForButtonIEnd-------
;------CmpForButtonSStart-------
	cmp al, 's'
	je starting_text
	cmp al, 'S'
	je starting_text
;------CmpForButtonSEnd-------
;------CmpForButtonEscStart-------
	cmp ah, 1 ; Escape scan code (Esc button)
	je end_messageesc
;------CmpForButtonEscEnd-------
	jmp menu_input
information:
	call cls
	mov dx, offset info_start
    mov ah, 9h ; print string
	int 21h
	call printlinedown
	mov dx, offset info_end
    mov ah, 9h ; print string
	int 21h ; interrupt
info_input:
;------CmpForButtonEscStart-------
	mov ah, 0 ; keyboard
	int 16h ; interrupt
	cmp ah, 1 ; Escape scan code
	je end_messageesc
;------CmpForButtonEscEnd-------
;------CmpForButtonSStart-------
	cmp al, 'S'
	je starting_text
	cmp al, 's'
	je starting_text
;------CmpForButtonSEnd-------
;------CmpForButtonMStart-------
	cmp al, 'm'
	je menu_print
	cmp al, 'M'
	je menu_print
;------CmpForButtonMEnd-------
	jmp info_input
starting_text:
	call cls
	mov dx, offset start_text
    mov ah, 9h ; print string
	int 21h ; interrupt
	call printlinedown
	mov dx, offset part1_text
    mov ah, 9h ; print string
	int 21h ; interrupt
	call printlinedown
	ret
	endp menu
proc grades_amount
	cmp [arrayacount], 0 ; if there are no grades which categorised in category a
	je no_grades_arraya
check_grades1:
	cmp [arraybcount], 0 ; if there are no grades which categorised in category b
	je no_grades_arrayb
check_grades2:
	cmp [arrayccount], 0 ; if there are no grades which categorised in category c
	je no_grades_arrayc
check_grades3:
	cmp [evennumcount], 0 ; if there are no grades which categorised in category p
	je no_grades_arrayp
check_grades4:
	cmp [oddnumcount], 0 ; if there are no grades which categorised in category e
	je no_grades_arraye
	jne callingorderarrays
no_grades_arraya:
	xor si, si
	mov si, offset arraya
	mov [arraya], 'n' ; shortcut of "null"
	jmp check_grades1
no_grades_arrayb:
	xor si, si
	mov si, offset arrayb
	mov [arrayb], 'n' ; shortcut of "null"
	jmp check_grades2
no_grades_arrayc:
	xor si, si
	mov si, offset arrayc
	mov [arrayc], 'n' ; shortcut of "null"
	jmp check_grades3
no_grades_arrayp:
	xor si, si
	mov si, offset arrayp
	mov [arrayp], 'n' ; shortcut of "null"
	jmp check_grades4
no_grades_arraye:
	xor si, si
	mov si, offset arraye
	mov [arraye], 'n' ; shortcut of "null"
	ret
	endp grades_amount
proc clear_all ; it cleans everything if the user wants to use the program again
	xor si, si
	xor di, di
	xor bx, bx
	xor ax, ax
	xor dx, dx
	mov cx, 10
loopremem:
	mov [arrayp+bx], 0 
	mov [arraye+bx], 0 
	inc bx
	loop loopremem
	mov [arrayacount], 0
	mov [arraybcount], 0
	mov [arrayccount], 0
	mov [evennumcount], 0
	mov [oddnumcount], 0
	mov [evenarraycount], 0
	mov [oddarraycount], 0
	mov si, offset arraya
	mov di, offset arrayb
	mov bx, offset arrayc
	mov cx, 10 ; the array's length
reset_arrays_a:
	push bx
	mov bl, '$'
	mov [si], bl
	add si, 2h
	pop bx
	loop reset_arrays_a
	xor si, si
	mov cx, 10
reset_arrays_b:
	push bx
	mov bl, '$'
	mov [di], bl
	add di, 2h
	pop bx
	loop reset_arrays_b
	xor di, di
	mov cx, 10
reset_arrays_c:
	mov al, '$'
	mov [bx], al
	add bx, 2h
	loop reset_arrays_c
	mov si, offset arrayp
	mov di, offset arraye
	mov cx, 10
reset_arrays_p:
	mov al, '$'
	mov [si], al
	add si, 2h
	loop reset_arrays_p
	mov cx, 10
reset_arrays_e:
	mov al, '$'
	mov [di], al
	add di, 2h
	loop reset_arrays_e
	xor ax, ax
	xor bx, bx
	xor dx, dx
	xor si, si
	xor di, di
	mov [arrayacount], 0
	mov [arraybcount], 0
	mov [arrayccount], 0
	mov [evennumcount], 0
	mov [oddnumcount], 0
	mov [evenarraycount], 0
	mov [avg], 0
	mov [user_input], 0
	ret
	endp clear_all
; ----------Part1procsEnd-----------
start:
	mov ax, @data
	mov ds, ax
; --------------------------
; ----------Part3Start1-----------
	jmp program_start ; Jumping to the menu for the first time
call_clear_all:
	call clear_all
	inc [program_times_count]
program_start:
	call cls ; clearing the console
	call menu ; the main menu
; ----------Part3End1-----------
; ----------Part1Start----------
	mov cx, 9
	mov si, offset arraya
	mov di, offset arrayb
	mov bx, offset arrayc
	mov dx, offset startinput
    mov ah, 9h ; print string
	int 21h ; interrupt
	
input:
	mov ah, 1h ; input
	int 21h ; interrupt
	mov [user_input], al
	sub al, 30h ; converting from ascii code to the original number
	add [avg], al
	call abc_order
	call evenorodd
	loop input ; loop the label which getting input from the user
	call calcavg ; calculating the average
	call grades_amount ; checking if there are not grades in each category and if it's right it will move 'n' (means null) expect the first place of the array which checked
callingorderarrays:
	call orderarrays ; ordering the grades in each array
; ---------PrintStart------------
print_arrays:
	call printlinedown
	add [arrayccount], 30h ; retrieving it to ascii to print it
	call printarrayc
	add [arraybcount], 30h ; retrieving it to ascii to print it
	call printarrayb
	add [arrayacount], 30h ; retrieving it to ascii to print it
	call printarraya
	add [evennumcount], 30h ; retrieving it to ascii to print it
	call printevennumcount
	add [oddnumcount], 30h ; retrieving it to ascii to print it
	call printoddnumcount
	add [avg], 30h ; retrieving it to ascii to print it
	call printavg
	call printlinedown
	mov dx, offset part2_text
    mov ah, 9h ; print string
	int 21h ; interrupt
; ---------PrintEnd------------
; ----------Part1End-----------
; ----------Part2Start-----------

part2_input:
	call printlinedown
	mov dx, offset secondinput
    mov ah, 9h ; print string
	int 21h ; interrupt
	
mid_input:
	mov ah, 0 ; keyboard
	int 16h ; interrupt
;------CmpForButtonAStart-----
	cmp al, 'A'
	je print_arraya
	cmp al, 'a'
	je print_arraya
;------CmpForButtonAEnd-------
;------CmpForButtonBStart-----
	cmp al, 'B'
	je print_arrayb
	cmp al, 'b'
	je print_arrayb
;------CmpForButtonBEnd-------
;------CmpForButtonCStart-----
	cmp al, 'C'
	je print_arrayc
	cmp al, 'c'
	je print_arrayc
;------CmpForButtonCEnd-------
;------CmpForButtonPStart-----
	cmp al, 'P'
	je print_even_numbers
	cmp al, 'p'
	je print_even_numbers
;------CmpForButtonPEnd-------
;------CmpForButtonEStart-----
	cmp al, 'E'
	je print_odd_numbers
	cmp al, 'e'
	je print_odd_numbers
;------CmpForButtonEEnd-------
;------CmpForButtonVStart-----
	cmp al, 'V'
	je print_avg
	cmp al, 'v'
	je print_avg
;------CmpForButtonVEnd-------
;------CmpForButton#Start-----
	cmp al, '#'
	je ending
	jne mid_input ; if al not equal to '#' it will get from the user input again
;------CmpForButton#End-------
	
print_avg:
	call printlinedown
	call printavg
	jmp part2_input
	
print_odd_numbers:
	call printlinedown
	call printarraye
	jmp part2_input
	
print_even_numbers:
	call printlinedown
	call printarrayp
	jmp part2_input
	
print_arrayc:
	call printlinedown
	call printarrayc
	jmp part2_input
	
print_arrayb:
	call printlinedown
	call printarrayb
	jmp part2_input
	
print_arraya:
	call printlinedown
	call printarraya
	jmp part2_input
	
; ----------Part2End-----------
; ----------Part3Start2-----------
ending:
	call cls
	mov dx, offset end_message1 ; 'Thank you for using my program' ,0ah, 'Would you like to go back to the menu?',0ah, '(Yes - Y Or No - N) $'
    mov ah, 9h ; print string
	int 21h ; interrupt
	
endinginput:
	mov ah, 0 ; keyboard
	int 16h ; interrupt
;------CmpForButtonYStart-------
	cmp al, 'Y'
	je call_clear_all
	cmp al, 'y'
	je call_clear_all
;------CmpForButtonYEnd-------
;------CmpForButtonNStart-------
	cmp al, 'n'
	je end_message
	cmp al, 'N'
	je end_message
;------CmpForButtonNEnd-------
	jmp endinginput
	
end_message:
	call printlinedown
	mov dx, offset end_message2 ; 'Program Made By Moriel Moyal $'
    mov ah, 9h ; print string
	int 21h ; interrupt
	jmp exit
	
end_messageesc:
	call cls
	mov dx, offset end_message3
	mov ah, 9h ; print string
	int 21h ; interrupt
	call printlinedown
	mov dx, offset end_message2
    mov ah, 9h ; print string
	int 21h ; interrupt
; ----------Part3End2-----------
; ----------ProjectEnd----------
; --------------------------
exit:
	mov ax, 4c00h
	int 21h
END start
