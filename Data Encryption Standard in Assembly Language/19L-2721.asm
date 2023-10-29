;Abdullah Shaukat (19L-2721)
;Usman Hameed (19L-1221)


[org 0x0100] 
         jmp start
		 
sbox:       push bp
            mov bp,sp
			
			push bx
			push cx
			
			mov bx,0
			mov cx,[bp+4]
			shl cl,3
			rcl bl,1
			shr cl,4
			rcl bl,1
			
			shl bl,1;multiplying by 2
			mov di,bx
			mov si,[bp+6+di]
			mov ch,0
			add si,cx
			mov dx,[si];Final Result will be stored here
			mov dh,0
			
			pop cx
			pop bx
			pop bp
			ret 10

s1_a: db 14,04,13,01,02,15,11,08,03,10,06,12,05,09,00,07
s1_b: db 00,15,07,04,14,02,13,01,10,06,12,11,09,05,03,08
s1_c: db 04,01,14,08,13,06,02,11,15,12,09,07,03,10,05,00
s1_d: db 15,12,08,02,04,09,01,07,05,11,03,14,10,00,06,13
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

s2_a: db 15,01,08,14,06,11,03,04,09,07,02,13,12,00,05,10
s2_b: db 03,13,04,07,15,02,18,14,12,00,01,10,06,09,11,05
s2_c: db 00,14,07,11,10,04,13,01,05,08,12,06,09,03,02,15
s2_d: db 13,08,10,01,03,15,04,02,11,06,07,12,00,05,14,09
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

s3_a: db 10,00,09,14,06,03,15,05,01,13,12,07,11,04,02,08
s3_b: db 13,07,00,09,03,04,06,10,02,08,05,14,12,11,15,01
s3_c: db 13,06,04,09,08,15,03,00,11,01,02,12,05,10,14,07
s3_d: db 01,10,13,00,06,09,08,07,04,15,14,03,11,05,02,12
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

s4_a: db 07,13,14,03,00,06,09,10,01,02,08,05,11,12,04,15
s4_b: db 13,08,11,05,06,15,00,03,04,07,02,12,01,10,14,09
s4_c: db 10,06,09,00,12,11,07,13,15,01,03,14,05,02,08,04
s4_d: db 03,15,00,06,10,01,13,08,09,04,05,11,12,07,02,14
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

s5_a: db 02,12,04,01,07,10,11,06,08,05,03,15,13,00,14,09
s5_b: db 14,11,02,12,04,07,13,01,05,00,15,10,03,09,08,06
s5_c: db 04,02,01,11,10,13,07,08,15,09,12,05,06,03,00,14
s5_d: db 11,08,12,07,01,14,02,13,06,15,00,09,10,04,05,03
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

s6_a: db 12,01,10,15,09,02,06,08,00,13,03,04,14,07,05,11
s6_b: db 10,15,04,02,07,12,09,05,06,01,13,14,00,11,03,08
s6_c: db 09,14,15,05,02,08,12,03,07,00,04,10,01,13,11,06
s6_d: db 04,03,02,12,09,05,15,10,11,14,01,07,06,00,08,13
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

s7_a: db 04,11,02,14,15,00,08,13,03,12,09,07,05,10,06,01
s7_b: db 13,00,11,07,04,09,01,10,14,03,05,12,02,15,08,06
s7_c: db 01,04,11,13,12,03,07,14,10,15,06,08,00,05,09,02
s7_d: db 06,11,13,08,01,04,10,07,09,05,00,15,14,02,03,12
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

s8_a: db 13,02,08,04,06,15,11,01,10,09,03,14,05,00,12,07
s8_b: db 01,15,13,08,10,03,07,04,12,05,06,11,00,14,09,02
s8_c: db 07,11,04,01,09,12,14,02,00,06,10,13,15,03,05,08
s8_d: db 02,01,14,07,04,10,08,13,15,12,09,00,03,05,06,11


f_function:
       push ax
	   push bx
	   push cx
	   push dx
	   
;E-function will be called here	   
;Dealing with each bit one by one

    ;1st bit
	                    
       mov ax,[input+4]
	   and ax,0x8000
	   cmp ax,0
	   je l1
	   add word[result],1
l1:	   add word[result],0
	   shl word[result],1
	  ;2nd bit
	   mov ax,[input+6]
	   and ax,0x0001
	   cmp ax,0
	   je l2
	   add word[result],1
l2:	   add word[result],0
	   shl word[result],1
	   ;3rd bit
	   mov ax,[input+6]
	   and ax,0x0002
	   cmp ax,0
	   je l3
	   add word[result],1
l3:	   add word[result],0
	   shl word[result],1
	    ;4th bit
	   mov ax,[input+6]
	   and ax,0x0004
	   cmp ax,0
	   je l4
	   add word[result],1
l4:	   add word[result],0
	   shl word[result],1
	   ;5th bit
	   mov ax,[input+6]
	   and ax,0x0008
	   cmp ax,0
	   je l5
	   add word[result],1
l5:	   add word[result],0
	   shl word[result],1
	   ;6th bit
	   mov ax,[input+6]
	   and ax,0x0010
	   cmp ax,0
	   je l6
	   add word[result],1
l6:	   add word[result],0
	   shl word[result],1
	   ;7th bit
	   mov ax,[input+6]
	   and ax,0x0008
	   cmp ax,0
	   je l7
	   add word[result],1
l7:	   add word[result],0
	   shl word[result],1
	   ;8th bit
	   mov ax,[input+6]
	   and ax,0x0010
	   cmp ax,0
	   je l8
	   add word[result],1
l8:	   add word[result],0
	   shl word[result],1
	   ;9th bit
	   mov ax,[input+6]
	   and ax,0x0020
	   cmp ax,0
	   je l9
	   add word[result],1
l9:	   add word[result],0
	   shl word[result],1
	   ;10th bit
	   mov ax,[input+6]
	   and ax,0x0040
	   cmp ax,0
	   je l10
	   add word[result],1
l10:   add word[result],0
	   shl word[result],1
	   ;11th bit
	   mov ax,[input+6]
	   and ax,0x0080
	   cmp ax,0
	   je l11
	   add word[result],1
l11:   add word[result],0
	   shl word[result],1
	   ;12th bit
	   mov ax,[input+6]
	   and ax,0x0100
	   cmp ax,0
	   je l12
	   add word[result],1
l12:   add word[result],0
	   shl word[result],1
	   ;13th bit
	   mov ax,[input+6]
	   and ax,0x0080
	   cmp ax,0
	   je l13
	   add word[result],1
l13:   add word[result],0
	   shl word[result],1
	   ;14th bit
	   mov ax,[input+6]
	   and ax,0x0100
	   cmp ax,0
	   je l14
	   add word[result],1
l14:   add word[result],0
	   shl word[result],1
	   ;15th bit
	   mov ax,[input+6]
	   and ax,0x0200
	   cmp ax,0
	   je l15
	   add word[result],1
l15:   add word[result],0
	   shl word[result],1
	   ;16th bit
	   mov ax,[input+6]
	   and ax,0x0400
	   cmp ax,0
	   je l16
	   add word[result],1
l16:   add word[result],0;No need to shift the LSB as we are already at the left most bit of the memory location, same logic will be followed in bit 32 & 48.
	 
	   ;17th bit
	   mov ax,[input+6]
	   and ax,0x0800
	   cmp ax,0
	   je l17
	   add word[result+2],1
l17:   add word[result+2],0
	   shl word[result+2],1
	   ;18th bit
	   mov ax,[input+6]
	   and ax,0x1000
	   cmp ax,0
	   je l18
	   add word[result+2],1
l18:   add word[result+2],0
	   shl word[result+2],1
	   ;19th bit
	   mov ax,[input+6]
	   and ax,0x0800
	   cmp ax,0
	   je l19
	   add word[result+2],1
l19:   add word[result+2],0
	   shl word[result+2],1
	   ;20th bit
	   mov ax,[input+6]
	   and ax,0x1000
	   cmp ax,0
	   je l20
	   add word[result+2],1
l20:   add word[result+2],0
	   shl word[result+2],1
	   ;21th bit
	   mov ax,[input+6]
	   and ax,0x2000
	   cmp ax,0
	   je l21
	   add word[result+2],1
l21:   add word[result+2],0
	   shl word[result+2],1
	   ;22th bit
	   mov ax,[input+6]
	   and ax,0x4000
	   cmp ax,0
	   je l22
	   add word[result+2],1
l22:   add word[result+2],0
	   shl word[result+2],1
	   ;23th bit
	   mov ax,[input+6]
	   and ax,0x8000
	   cmp ax,0
	   je l23
	   add word[result+2],1
l23:   add word[result+2],0
	   shl word[result+2],1
	   ;24th bit
	   mov ax,[input+4]
	   and ax,0x0001
	   cmp ax,0
	   je l24
	   add word[result+2],1
l24:   add word[result+2],0
	   shl word[result+2],1
	   ;25th bit
	   mov ax,[input+6]
	   and ax,0x8000
	   cmp ax,0
	   je l25
	   add word[result+2],1
l25:   add word[result+2],0
	   shl word[result+2],1
	    ;26th bit
	   mov ax,[input+4]
	   and ax,0x0001
	   cmp ax,0
	   je l26
	   add word[result+2],1
l26:   add word[result+2],0
	   shl word[result+2],1
	    ;27th bit
	   mov ax,[input+4]
	   and ax,0x0002
	   cmp ax,0
	   je l27
	   add word[result+2],1
l27:   add word[result+2],0
	   shl word[result+2],1
	    ;28th bit
	   mov ax,[input+4]
	   and ax,0x0004
	   cmp ax,0
	   je l28
	   add word[result+2],1
l28:   add word[result+2],0
	   shl word[result+2],1
	    ;29th bit
	   mov ax,[input+4]
	   and ax,0x0008
	   cmp ax,0
	   je l29
	   add word[result+2],1
l29:   add word[result+2],0
	   shl word[result+2],1
	    ;30th bit
	   mov ax,[input+4]
	   and ax,0x0010
	   cmp ax,0
	   je l30
	   add word[result+2],1
l30:   add word[result+2],0
	   shl word[result+2],1
	    ;31th bit
	   mov ax,[input+4]
	   and ax,0x0008
	   cmp ax,0
	   je l31
	   add word[result+2],1
l31:   add word[result+2],0
	   shl word[result+2],1
	    ;32th bit
	   mov ax,[input+4]
	   and ax,0x0010
	   cmp ax,0
	   je l32
	   add word[result+2],1
l32:   add word[result+2],0
	
        ;33th bit
	   mov ax,[input+4]
	   and ax,0x0020
	   cmp ax,0
	   je l33
	   add word[result+4],1
l33:   add word[result+4],0
	   shl word[result+4],1
	    ;34th bit
	   mov ax,[input+4]
	   and ax,0x0040
	   cmp ax,0
	   je l34
	   add word[result+4],1
l34:   add word[result+4],0
	   shl word[result+4],1
	    ;35th bit
	   mov ax,[input+4]
	   and ax,0x0080
	   cmp ax,0
	   je l35
	   add word[result+4],1
l35:   add word[result+4],0
	   shl word[result+4],1
	    ;36th bit
	   mov ax,[input+4]
	   and ax,0x0100
	   cmp ax,0
	   je l36
	   add word[result+4],1
l36:   add word[result+4],0
	   shl word[result+4],1
	    ;37th bit
	   mov ax,[input+4]
	   and ax,0x0080
	   cmp ax,0
	   je l37
	   add word[result+4],1
l37:   add word[result+4],0
	   shl word[result+4],1
	    ;38th bit
	   mov ax,[input+4]
	   and ax,0x0100
	   cmp ax,0
	   je l38
	   add word[result+4],1
l38:   add word[result+4],0
	   shl word[result+4],1
	    ;39th bit
	   mov ax,[input+4]
	   and ax,0x0200
	   cmp ax,0
	   je l39
	   add word[result+4],1
l39:   add word[result+4],0
	   shl word[result+4],1
	    ;40th bit
	   mov ax,[input+4]
	   and ax,0x0400
	   cmp ax,0
	   je l40
	   add word[result+4],1
l40:   add word[result+4],0
	   shl word[result+4],1
	    ;41th bit
	   mov ax,[input+4]
	   and ax,0x0800
	   cmp ax,0
	   je l41
	   add word[result+4],1
l41:   add word[result+4],0
	   shl word[result+4],1
	    ;42th bit
	   mov ax,[input+4]
	   and ax,0x1000
	   cmp ax,0
	   je l42
	   add word[result+4],1
l42:   add word[result+4],0
	   shl word[result+4],1
	    ;43th bit
	   mov ax,[input+4]
	   and ax,0x0800
	   cmp ax,0
	   je l43
	   add word[result+4],1
l43:   add word[result+4],0
	   shl word[result+4],1
	    ;44th bit
	   mov ax,[input+4]
	   and ax,0x1000
	   cmp ax,0
	   je l44
	   add word[result+4],1
l44:   add word[result+4],0
	   shl word[result+4],1
	    ;45th bit
	   mov ax,[input+4]
	   and ax,0x2000
	   cmp ax,0
	   je l45
	   add word[result+4],1
l45:   add word[result+4],0
	   shl word[result+4],1
	    ;46th bit
	   mov ax,[input+4]
	   and ax,0x4000
	   cmp ax,0
	   je l46
	   add word[result+4],1
l46:   add word[result+4],0
	   shl word[result+4],1
	    ;47th bit
	   mov ax,[input+4]
	   and ax,0x8000
	   cmp ax,0
	   je l47
	   add word[result+4],1
l47:   add word[result+4],0
	   shl word [result+4],1
	    ;48th bit
	   mov ax,[input+6]
	   and ax,0x0001
	   cmp ax,0
	   je l48
	   add word[result+4],1
l48:   add word[result+4],0
	   
	   mov dx,[key]
       xor [result],dx
	   mov dx,[key+2]
       xor [result+2],dx
	   mov dx,[key+4]
	   xor [result+4],dx
	   
	   ;Sboxes will be called from here onwards

            ;push each s box one by one & 6 bit number on stack

            mov bx,s1_d              ; Push Fourth Array
            push bx
			mov bx,s1_c              ; Push Third Array
            push bx
			mov bx,s1_b              ; Push Second Array
            push bx
			mov bx,s1_a              ; Push First Array
            push bx
			
			mov bx,[result]           ;mov the most significant 16 bits in bx & then shl bx by ten obtain 16 bits
			and bx,0xfc00
			shr bx,10
            
			push bx
			call sbox
			mov [answer],dl
			shl byte[answer],4
			
			mov bx,s2_d              ; Push Fourth Array
            push bx
			mov bx,s2_c              ; Push Third Array
            push bx
			mov bx,s2_b              ; Push Second Array
            push bx
			mov bx,s2_a              ; Push First Array
            push bx
			
			mov bx,[result]
			and bx,0x3f0
			shr bx,4
			
			push bx
			call sbox
			add [answer],dl
			
			mov bx,s3_d              ; Push Fourth Array
            push bx
			mov bx,s3_c              ; Push Third Array
            push bx
			mov bx,s3_b              ; Push Second Array
            push bx
			mov bx,s3_a              ; Push First Array
            push bx
			
			mov bx,[result+2]
			and bx,0xc000
			shr bx,14
			mov cx,[result];mov the more siginificant bits to cx, shift it & and less signinficant bits & then push it
			and cx,0x000f
			shl cx,2
			add cx,bx   ;;;;;;;;;00000000000111100 , 11000000000000
			
  
			push cx
			call sbox
			mov [answer+1],dl
			shl byte[answer+1],4
			
			mov bx,s4_d              ; Push Fourth Array
            push bx
			mov bx,s4_c              ; Push Third Array
            push bx
			mov bx,s4_b              ; Push Second Array
            push bx
			mov bx,s4_a              ; Push First Array
            push bx
			
			mov bx,[result+2]
			and bx,0x3f00
			shr bx,8
			
			push bx
			call sbox
			add [answer+1],dl
			
			mov bx,s5_d              ; Push Fourth Array
            push bx
			mov bx,s5_c              ; Push Third Array
            push bx
			mov bx,s5_b              ; Push Second Array
            push bx
			mov bx,s5_a              ; Push First Array
            push bx
			
			mov bx,[result+2]
			and bx,0xfc
			shr bx,2
			
			push bx
			call sbox
			mov [answer+2],dl
			shl byte[answer+2],4
			
			mov bx,s6_d              ; Push Fourth Array
            push bx
			mov bx,s6_c              ; Push Third Array
            push bx
			mov bx,s6_b              ; Push Second Array
            push bx
			mov bx,s6_a              ; Push First Array
            push bx
			
			mov bx,[result+4]
			and bx,0xf000
			shr bx,12
			mov cx,[result+2]
			and cx,0x0003
			shl cx,4
			add cx,bx
			
			push cx
			call sbox
			add [answer+2],dl
			
			mov bx,s7_d              ; Push Fourth Array
            push bx
			mov bx,s7_c              ; Push Third Array
            push bx
			mov bx,s7_b              ; Push Second Array
            push bx
			mov bx,s7_a              ; Push First Array
            push bx
			
			mov bx,[result+4]
			and bx,0xfc0
			shr bx,6
			
			push bx
			call sbox
			mov [answer+3],dl
			shl byte[answer+3],4
			
			mov bx,s8_d              ; Push Fourth Array
            push bx
			mov bx,s8_c              ; Push Third Array
            push bx
			mov bx,s8_b              ; Push Second Array
            push bx
			mov bx,s8_a              ; Push First Array
            push bx

            mov bx,[result+4]
			and bx,0x3f

			push bx
			call sbox
			add [answer+3],dl
			
			
			
			
		;p-function will be called here
		;Deal with each bit one by one
         push word [input];push input as its memory will now be used in p-function
         push word [input]		 
		 
		 mov word[input],0x0000
         mov word[input],0x0000	

		 
		 ;1st bit
	     mov ax,[answer+2]
	     and ax,0x8000
	     cmp ax,0
	     je f1
	     add word[input],1
f1:      add word[input],0
         shl word[input],1
		 
		  ;2nd bit
	     mov ax,[answer+2]
	     and ax,0x0040
	     cmp ax,0
	     je f2
	     add word[input],1
f2:      add word[input],0
         shl word[input],1
		 
		  ;3rd bit
	     mov ax,[answer]
	     and ax,0x0008
	     cmp ax,0
	     je f3
	     add word[input],1
f3:      add word[input],0
         shl word[input],1
		 
		 ;4th bit
	     mov ax,[answer]
	     and ax,0x0010
	     cmp ax,0
	     je f4
	     add word[input],1
f4:      add word[input],0
         shl word[input],1
		 
		 ;5th bit
	     mov ax,[answer]
	     and ax,0x1000
	     cmp ax,0
	     je f5
	     add word[input],1
f5:      add word[input],0
         shl word[input],1
		 
		 ;6th bit
	     mov ax,[answer+2]
	     and ax,0x0800
	     cmp ax,0
	     je f6
	     add word[input],1
f6:      add word[input],0
         shl word[input],1
			
		;7th bit
	     mov ax,[answer]
	     and ax,0x1000
	     cmp ax,0
	     je f7
	     add word[input],1
f7:      add word[input],0
         shl word[input],1	
		 
		 ;8th bit
	     mov ax,[answer]
	     and ax,0x0001
	     cmp ax,0
	     je f8
	     add word[input],1
f8:      add word[input],0
         shl word[input],1	
		 
		 ;9th bit
	     mov ax,[answer+2]
	     and ax,0x0001
	     cmp ax,0
	     je f9
	     add word[input],1
f9:      add word[input],0
         shl word[input],1	
		 
		  ;10th bit
	     mov ax,[answer+2]
	     and ax,0x4000
	     cmp ax,0
	     je f10
	     add word[input],1
f10:     add word[input],0
         shl word[input],1	
		 
		 ;11th bit
	     mov ax,[answer]
	     and ax,0x0040
	     cmp ax,0
	     je f11
	     add word[input],1
f11:     add word[input],0
         shl word[input],1
		 
		  ;12th bit
	     mov ax,[answer]
	     and ax,0x0200
	     cmp ax,0
	     je f12
	     add word[input],1
f12:     add word[input],0
         shl word[input],1
		 
		  ;13th bit
	     mov ax,[answer+2]
	     and ax,0x0010
	     cmp ax,0
	     je f13
	     add word[input],1
f13:     add word[input],0
         shl word[input],1
		 
		 ;14th bit
	     mov ax,[answer]
	     and ax,0x0002
	     cmp ax,0
	     je f14
	     add word[input],1
f14:     add word[input],0
         shl word[input],1
		 
		 ;15th bit
	     mov ax,[answer]
	     and ax,0x4000
	     cmp ax,0
	     je f15
	     add word[input],1
f15:     add word[input],0
         shl word[input],1
		 
		 ;16th bit
	     mov ax,[answer+2]
	     and ax,0x0200
	     cmp ax,0
	     je f16
	     add word[input],1
f16:     add word[input],0

        ;17th bit
	     mov ax,[answer+2]
	     and ax,0x0002
	     cmp ax,0
	     je f17
	     add word[input+2],1
f17:     add word[input+2],0
         shl word[input+2],1
		 
		 ;18th bit
	     mov ax,[answer+2]
	     and ax,0x0080
	     cmp ax,0
	     je f18
	     add word[input+2],1
f18:     add word[input+2],0
         shl word[input+2],1
		 
		 ;19th bit
	     mov ax,[answer]
	     and ax,0x0080
	     cmp ax,0
	     je f19
	     add word[input+2],1
f19:     add word[input+2],0
         shl word[input+2],1
		
         ;20th bit
	     mov ax,[answer+2]
	     and ax,0x2000
	     cmp ax,0
	     je f20
	     add word[input+2],1
f20:     add word[input+2],0
         shl word[input+2],1

         ;21th bit
	     mov ax,[answer]
	     and ax,0x8000
	     cmp ax,0
	     je f21
	     add word[input+2],1
f21:     add word[input+2],0
         shl word[input+2],1	

         ;22nd bit
	     mov ax,[answer]
	     and ax,0x0400
	     cmp ax,0
	     je f22
	     add word[input+2],1
f22:     add word[input+2],0
         shl word[input+2],1	

         ;23rd bit
	     mov ax,[answer+2]
	     and ax,0x0004
	     cmp ax,0
	     je f23
	     add word[input+2],1
f23:     add word[input+2],0
         shl word[input+2],1	

         ;24th bit
	     mov ax,[answer+2]
	     and ax,0x0100
	     cmp ax,0
	     je f24
	     add word[input+2],1
f24:     add word[input+2],0
         shl word[input+2],1	

         ;25th bit
	     mov ax,[answer]
	     and ax,0x0004
	     cmp ax,0
	     je f25
	     add word[input+2],1
f25:     add word[input+2],0
         shl word[input+2],1	

         ;26th bit
	     mov ax,[answer+2]
	     and ax,0x1000
	     cmp ax,0
	     je f26
	     add word[input+2],1
f26:     add word[input+2],0
         shl word[input+2],1	

         ;27th bit
	     mov ax,[answer]
	     and ax,0x2000
	     cmp ax,0
	     je f27
	     add word[input+2],1
f27:     add word[input+2],0
         shl word[input+2],1	

         ;28th bit
	     mov ax,[answer+2]
	     and ax,0x0020
	     cmp ax,0
	     je f28
	     add word[input+2],1
f28:     add word[input+2],0
         shl word[input+2],1		

         ;29th bit
	     mov ax,[answer]
	     and ax,0x0020
	     cmp ax,0
	     je f29
	     add word[input+2],1
f29:     add word[input+2],0
         shl word[input+2],1	

         ;30th bit
	     mov ax,[answer+2]
	     and ax,0x0400
	     cmp ax,0
	     je f30
	     add word[input+2],1
f30:     add word[input+2],0
         shl word[input+2],1

         ;31th bit
	     mov ax,[answer+2]
	     and ax,0x0008
	     cmp ax,0
	     je f31
	     add word[input+2],1
f31:     add word[input+2],0
         shl word[input+2],1

         ;32th bit
	     mov ax,[answer]
	     and ax,0x0100
	     cmp ax,0
	     je f32
	     add word[input+2],1
f32:     add word[input+2],0			 
			
		mov ax,[input];writing answer back in "answer" labelled memory location after changing the bit order through p-function
		mov [answer],ax
		mov ax,[input+2]
		mov [answer+2],ax
		
		
       pop word [input+2]
       pop word [input]	   
	   pop dx
	   pop cx
	   pop bx
	   pop ax
       ret

	   
PC_1:
	   
	   ;1st bit                   
       mov ax,[key_64]
	   and ax,0000000100000000b
	   cmp ax,0
	   je G1
	   add word[key_56],1
G1:	   add word[key_56],0
	   shl word[key_56],1
	  ;2nd bit
	   mov ax,[key_64]
	   and ax,0000000000000001b
	   cmp ax,0
	   je G2
	   add word[key_56],1
G2:	   add word[key_56],0
	   shl word[key_56],1
	   ;3rd bit
	   mov ax,[key_64+2]
	   and ax,0000000100000000b
	   cmp ax,0
	   je G3
	   add word[key_56],1
G3:	   add word[key_56],0
	   shl word[key_56],1
	    ;4th bit
	   mov ax,[key_64+2]
	   and ax,0000000000000001b
	   cmp ax,0
	   je G4
	   add word[key_56],1
G4:	   add word[key_56],0
	   shl word[key_56],1
	   ;5th bit
	   mov ax,[key_64+4]
	   and ax,0000000100000000b
	   cmp ax,0
	   je G5
	   add word[key_56],1
G5:	   add word[key_56],0
	   shl word[key_56],1
	   ;6th bit
	   mov ax,[key_64+4]
	   and ax,0000000000000001b
	   cmp ax,0
	   je G6
	   add word[key_56],1
G6:	   add word[key_56],0
	   shl word[key_56],1
	   ;7th bit
	   mov ax,[key_64+6]
	   and ax,0000000100000000b
	   cmp ax,0
	   je G7
	   add word[key_56],1
G7:	   add word[key_56],0
	   shl word[key_56],1
	   ;8th bit
	   mov ax,[key_64+6]
	   and ax,0000000000000001b
	   cmp ax,0
	   je G8
	   add word[key_56],1
G8:	   add word[key_56],0

	   ;no shifting due to msb
	  
	   ;9th bit
	   mov ax,[key_64]
	   and ax,0000001000000000b
	   cmp ax,0
	   je G9
	   add word[key_56+2],1
G9:	   add word[key_56+2],0
	   shl word[key_56+2],1
	   ;10th bit
	   mov ax,[key_64]
	   and ax,0000001000000000b
	   cmp ax,0
	   je G10
	   add word[key_56+2],1
G10:   add word[key_56+2],0
	   shl word[key_56+2],1
	   ;11th bit
	   mov ax,[key_64+2]
	   and ax,0000100000000000b
	   cmp ax,0
	   je G11
	   add word[key_56+2],1
G11:       add word[key_56+2],0
	   shl word[key_56+2],1

	   ;12th bit
	   mov ax,[key_64+2]
	   and ax,0000000000000010b
	   cmp ax,0
	   je G12
	   add word[key_56+2],1
G12:       add word[key_56+2],0
	   shl word[key_56+2],1
	   ;13th bit
	   mov ax,[key_64+4]
	   and ax,0000001000000000b
	   cmp ax,0
	   je G13
	   add word[key_56+2],1
G13:       add word[key_56+2],0
	   shl word[key_56+2],1
	   ;14th bit
	   mov ax,[key_64+4]
	   and ax,0000000000000010b
	   cmp ax,0
	   je G14
	   add word[key_56+2],1
G14:       add word[key_56+2],0
	   shl word[key_56+2],1
	   ;15th bit
	   mov ax,[key_64+6]
	   and ax,0000001000000000b
	   cmp ax,0
	   je G15
	   add word[key_56+2],1
G15:       add word[key_56+2],0 
	   shl word[key_56+2],1
	   ;16th bit
	   mov ax,[key_64+6]
	   and ax,0000000000000010b
	   cmp ax,0
	   je G16
	   add word[key_56+2],1
G16:       add word[key_56+2],0
	   shl word[key_56+2],1
	   ;17th bit
	   mov ax,[key_64]
	   and ax,0000010000000000b
	   cmp ax,0
	   je G17
	   add word[key_56+2],1
G17:       add word[key_56+2],0
	   shl word[key_56+2],1
	   ;18th bit
	   mov ax,[key_64]
	   and ax,0000000000000100b
	   cmp ax,0
	   je G18
	   add word[key_56+2],1
G18:       add word[key_56+2],0
	   shl word[key_56+2],1
	   ;19th bit
	   mov ax,[key_64+2]
	   and ax,0000010000000000b
	   cmp ax,0
	   je G19
	   add word[key_56+2],1
G19:       add word[key_56+2],0
	   shl word[key_56+2],1
	   ;20th bit
	   mov ax,[key_64+2]
	   and ax,0000000000000100b
	   cmp ax,0
	   je G20
	   add word[key_56+2],1
G20:       add word[key_56+2],0
	   shl word[key_56+2],1
	   ;21th bit
	   mov ax,[key_64+4]
	   and ax,0000100000000000b
	   cmp ax,0
	   je G21
	   add word[key_56+2],1
G21:        add word[key_56+2],0
	   shl word[key_56+2],1
	   ;22th bit
	   mov ax,[key_64+4]
	   and ax,0000000000000100b
	   cmp ax,0
	   je G22
	   add word[key_56+2],1
G22:     add word[key_56+2],0
	   shl word[key_56+2],1
	   ;23th bit
	   mov ax,[key_64+6]
	   and ax,0000000100000000b
	   cmp ax,0
	   je G23
	   add word[key_56+2],1
G23:       add word[key_56+2],0
	   shl word[key_56+2],1
	   ;24th bit
	   mov ax,[key_64+6]
	   and ax,0000000000000100b
	   cmp ax,0
	   je G24
	   add word[key_56+2],1
G24:       add word[key_56+2],0
                               ;no shifting due to msb
	   
	    ;25th bit
	   mov ax,[key_64]
	   and ax,0000100000000000b
	   cmp ax,0
	   je G25
	   add word[key_56+4],1
G25:        add word[key_56+4],0
	     shl word[key_56+4],1
	    ;26th bit
	   mov ax,[key_64]
	   and ax,0000000000001000b
	   cmp ax,0
	   je G26
	   add word[key_56+4],1
G26:       add word[key_56+4],0
	   shl word[key_56+4],1
	    ;27th bit
	   mov ax,[key_64+2]
	   and ax,0000100000000000b
	   cmp ax,0
	   je G27
	   add word[key_56+4],1
G27:       add word[key_56+4],0
	   shl word[key_56+4],1
	    ;28th bit
	   mov ax,[key_64+2]
	   and ax,0000000000001000b
	   cmp ax,0
	   je G28
	   add word[key_56+4],1
G28:        add word[key_56+4],0
	   shl word[key_56+4],1
	    ;29th bit
	   mov ax,[key_64]
	   and ax,0100000000000000b
	   cmp ax,0
	   je G29
	   add word[key_56+4],1
G29:       add word[key_56+4],0
	   shl word[key_56+4],1
	    ;30th bit
	   mov ax,[key_64]
	   and ax,0000000001000000b
	   cmp ax,0
	   je G30
	   add word[key_56+4],1
G30:   add word[key_56+4],0
	   shl word[key_56+4],1
	    ;31th bit
	   mov ax,[key_64+2]
	   and ax,0100000000000000b
	   cmp ax,0
	   je G31
	   add word[key_56+4],1
G31:        add word[key_56+4],0
            shl word[key_56+4],1
	
        ;32th bit
	   mov ax,[key_64+2]
	   and ax,0000000001000000b
	   cmp ax,0
	   je G32
	   add word[key_56+4],1
G32:       add word[key_56+4],0
	   shl word[key_56+4],1
	    ;33th bit
	   mov ax,[key_64+4]
	   and ax,0100000000000000b
	   cmp ax,0
	   je G33
	   add word[key_56+4],1
G33:         add word[key_56+4],0
	    shl word[key_56+4],1
	    ;34th bit
	   mov ax,[key_64+4]
	   and ax,0000000001000000b
	   cmp ax,0
	   je G34
	   add word[key_56+4],1
G34:         add word[key_56+4],0
	   shl word[key_56+4],1
	    ;35th bit
	   mov ax,[key_64+6]
	   and ax,0100000000000000b
	   cmp ax,0
	   je G35
	   add word[key_56+4],1
G35:   add word[key_56+4],0
	   shl word[key_56+4],1
	    ;36th bit
	   mov ax,[key_64+6]
	   and ax,0000000001000000b
	   cmp ax,0
	   je G36
	   add word[key_56+4],1
G36:       add word[key_56+4],0
	   shl word[key_56+4],1
	    ;37th bit
	   mov ax,[key_64]
	   and ax,0010000000000000b
	   cmp ax,0
	   je G37
	   add word[key_56+4],1
G37:       add word[key_56+4],0
	   shl word[key_56+4],1
	    ;38th bit
	   mov ax,[key_64]
	   and ax,0000000000100000b
	   cmp ax,0
	   je G38
	   add word[key_56+4],1
G38:   add word[key_56+4],0
	   shl word[key_56+4],1
	    ;39th bit
	   mov ax,[key_64+2]
	   and ax,0010000000000000b
	   cmp ax,0
	   je G39
	   add word[key_56+4],1
G39:   add word[key_56+4],0
	   shl word[key_56+4],1
	    ;40th bit
	   mov ax,[key_64+2]
	   and ax,0000000000100000b
	   cmp ax,0
	   je G40
	   add word[key_56+4],1
G40:       add word[key_56+4],0 ;no shiftng as msb occur
	  
	    ;41th bit
	   mov ax,[key_64+4]
	   and ax,0010000000000000b
	   cmp ax,0
	   je G41
	   add word[key_56+6],1
G41:       add word[key_56+6],0
	   shl word[key_56+6],1
	    ;42th bit
	   mov ax,[key_64+4]
	   and ax,0000000000100000b
	   cmp ax,0
	   je G42
	   add word[key_56+6],1
G42:       add word[key_56+6],0
	   shl word[key_56+6],1
	    ;43th bit
	   mov ax,[key_64+6]
	   and ax,0010000000000000b
	   cmp ax,0
	   je G43
	   add word[key_56+6],1
G43:   add word[key_56+6],0
	   shl word[key_56+6],1
	    ;44th bit
	   mov ax,[key_64+6]
	   and ax,0000000000100000b
	   cmp ax,0
	   je G44
	   add word[key_56+6],1
G44:       add word[key_56+6],0
	   shl word[key_56+6],1
	    ;45th bit
	   mov ax,[key_64]
	   and ax,0001000000000000b
	   cmp ax,0
	   je G45
	   add word[key_56+6],1
G45:   add word[key_56+6],0
	   shl word[key_56+6],1
	    ;46th bit
	   mov ax,[key_64]
	   and ax,0000000000010000b
	   cmp ax,0
	   je G46
	   add word[key_56+6],1
G46:        add word[key_56+6],0
	   shl word [key_56+6],1
	    ;47th bit
	   mov ax,[key_64+2]
	   and ax,0001000000000000b
	   cmp ax,0
	   je G47
	   add word[key_56+6],1
G47:       add word[key_56+6],0
           shl word [key_56+6],1
	   
	    ;48th bit
	   mov ax,[key_64+2]
	   and ax,0000000000010000b
	   cmp ax,0
	   je G48
	   add word[key_56+6],1
G48:   add word[key_56+6],0
	   shl word[key_56+6],1
	    ;49th bit
	   mov ax,[key_64+4]
	   and ax,0001000000000000b
	   cmp ax,0
	   je G49
	   add word[key_56+6],1
G49:       add word[key_56+6],0 
	   shl word[key_56+6],1
	    ;50th bit
	   mov ax,[key_64+4]
	   and ax,0000000000010000b
	   cmp ax,0
	   je G50
	   add word[key_56+6],1
G50:       add word[key_56+6],0
	   shl word[key_56+6],1

	    ;51th bit
	   mov ax,[key_64+6]
	   and ax,0001000000000000b
	   cmp ax,0
	   je G51
	   add word[key_56+6],1
G51:      add word[key_56+6],0
	   shl word[key_56+6],1
	    ;52th bit
	   mov ax,[key_64+6]
	   and ax,0000000000010000b
	   cmp ax,0
	   je G52
	   add word[key_56+6],1
G52:       add word[key_56+6],0
	   shl word[key_56+6],1
	    ;53th bit
	   mov ax,[key_64+4]
	   and ax,0000100000000000b
	   cmp ax,0
	   je G53
	   add word[key_56+6],1
G53:       add word[key_56+6],0
	   shl word[key_56+6],1
	    ;54th bit
	   mov ax,[key_64+4]
	   and ax,0000000000001000b
	   cmp ax,0
	   je G54
	   add word[key_56+6],1
G54:        add word[key_56+6],0
	   shl word [key_56+6],1
	    ;55th bit
	   mov ax,[key_64+6]
	   and ax,0000100000000000b
	   cmp ax,0
	   je G55
	   add word[key_56+6],1
G55:       add word[key_56+6],0
           shl word [key_56+6],1
	    ;56th bit
	   mov ax,[key_64+6]
	   and ax,0000000000001000b
	   cmp ax,0
	   je G56
	   add word[key_56+6],1
G56:       add word[key_56+6],0
       ;no shifting as MSB has occured
	   
	   ret    
	
	
	
	
	
	
	
rotations:
         push ax
		 shl word [key_56+2],1
		 rcl word [key_56],1
		 mov ax, [key_56]
		 and word [key_56],0000111111111111b
		 and ax,0001000000000000b
		 cmp ax,0
		 je i1
		 add word [key_56+2],1
i1:      add word [key_56+2],0
         
		 shl word [key_56+6],1
		 rcl word [key_56+4],1
		 mov ax, [key_56+4]
		 and word [key_56+4],0000111111111111b
		 and ax,0001000000000000b
		 cmp ax,0
		 je i2
		 add word [key_56+6],1
i2:      add word [key_56+6],0	

         pop ax
         ret
		 
make_28bits_each:		 

         shl word  [key_56+4],1;Shift Left by one bit, the 3rd index
		 rcl word [key_56+2],1;Move the carry Produced in the 2nd index
		 rcl word [key_56],1;Move the carry Produced in 1st index
		 shl word [key_56+4],1
		 rcl word [key_56+2],1
		 rcl word [key_56],1
		 shl word [key_56+4],1
		 rcl word [key_56+2],1
		 rcl word [key_56],1
		 shl word [key_56+4],1
		 rcl word [key_56+2],1
		 rcl word [key_56],1
		 
		 shr word[key_56+4],4 ;After this operation, there will be 28 bits in index 1 and 2, and 28 in index 3 and 4
		 		              ;The form of the memory location after this operation:-
							  ;0000xxxxxxxx.......b,0000xxxxxxxx........b
		 ret
make_one_of_56_bits:

         shl word [key_56+4],4;By performing this operation, the four zeros(which make the memory location of 28 bits) at the start of [key_56+4]will be wasted.
         
		 shr word [key_56],1;Shift right the first index
		 rcr word [key_56+2],1;shift rigth carry in 2nd index
		 rcr word [key_56+4],1;shift right carry in 3rd index
		 shr word [key_56],1 
		 rcr word [key_56+2],1 
		 rcr word [key_56],1 
		 shr word [key_56],1 
		 rcr word [key_56+2],1 
		 rcr word [key_56],1 
		 shr word [key_56],1 
		 rcr word [key_56+2],1 
		 rcr word [key_56],1 
		 
		 ret
		 
		 
		 
move_rotated_bits_to_location_key_56_to_P2:
         push ax
		 
		 mov ax,[key_56]
		 mov [key_56_to_P2],ax
		 mov ax,[key_56+2]
		 mov [key_56_to_P2+2],ax
		 mov ax,[key_56+4]
		 mov [key_56_to_P2+4],ax
		 mov ax,[key_56+6]
		 mov [key_56_to_P2+6],ax
		 
		 pop ax
		 ret
		 
PC_2:
      
	   mov word [key],0
	   mov word [key+2],0
	   mov word [key+4],0
 
      ;1st bit                   
       mov ax,[key_56_to_P2+6]
	   and ax,0010000000000000b
	   cmp ax,0
	   je H1
	   add word[key],1
H1:	   add word[key],0
	   shl word[key],1
	  ;2nd bit
	   mov ax,[key_56_to_P2+4]
	   and ax,0000000000000001b
	   cmp ax,0
	   je H2
	   add word[key],1
H2:	   add word[key],0
	   shl word[key],1
	   ;3rd bit
	   mov ax,[key_56_to_P2+6]
	   and ax,0000010000000000b
	   cmp ax,0
	   je H3
	   add word[key],1
H3:	   add word[key],0
	   shl word[key],1
	    ;4th bit
	   mov ax,[key_56_to_P2+4]
	   and ax,0000000010000000b
	   cmp ax,0
	   je H4
	   add word[key],1
H4:	   add word[key],0
	   shl word[key],1
	   ;5th bit
	   mov ax,[key_56_to_P2+6]
	   and ax,0000000000000001b
	   cmp ax,0
	   je H5
	   add word[key],1
H5:	   add word[key],0
	   shl word[key],1
	   ;6th bit
	   mov ax,[key_56_to_P2+6]
	   and ax,0000000000010000b
	   cmp ax,0
	   je H6
	   add word[key],1
H6:	   add word[key],0
	   shl word[key],1
	   ;7th bit
	   mov ax,[key_56_to_P2+6]
	   and ax,0000000000000100b
	   cmp ax,0
	   je H7
	   add word[key],1
H7:	   add word[key],0
	   shl word[key],1
	   
	   ;8th bit
	   mov ax,[key_56_to_P2+4]
	   and ax,0000100000000000b
	   cmp ax,0
	   je H8
	   add word[key],1
H8:	   add word[key],0
	   shl word[key],1
	   ;9th bit
	   mov ax,[key_56_to_P2+6]
	   and ax,0100000000000000b
	   cmp ax,0
	   je H9
	   add word[key],1
H9:      add word[key],0
	   shl word[key],1
	   ;10th bit
	   mov ax,[key_56_to_P2+6]
	   and ax,0000000000100000b
	   cmp ax,0
	   je H10
	   add word[key],1
H10:       add word[key],0
	   shl word[key],1

	   ;11th bit
	   mov ax,[key_56_to_P2+4]
	   and ax,0000000000010000b
	   cmp ax,0
	   je H11
	   add word[key],1
H11:       add word[key],0
	   shl word[key],1
	   ;12th bit
	   mov ax,[key_56_to_P2+6]
	   and ax,0000001000000000b
	   cmp ax,0
	   je H12
	   add word[key],1
H12:       add word[key],0
	   shl word[key],1
	   ;13th bit
	   mov ax,[key_56_to_P2+4]
	   and ax,0000000010000000b
	   cmp ax,0
	   je H13
	   add word[key],1
H13:       add word[key],0
	   shl word[key],1
	   ;14th bit
	   mov ax,[key_56_to_P2+4]
	   and ax,0000000000000100b
	   cmp ax,0
	   je H14
	   add word[key],1
H14:       add word[key],0 
	   shl word[key],1
	   ;15th bit
	   mov ax,[key_56_to_P2+6]
	   and ax,0000100000000000b
	   cmp ax,0
	   je H15
	   add word[key],1
H15:       add word[key],0
       shl word[key],1
	   ;16th bit
	   mov ax,[key_56_to_P2+6]
	   and ax,0000000000001000b
	   cmp ax,0
	   je H16
	   add word[key],1
H16:       add word[key],0
	   ;no shifting as LSB has occured
	   
	   ;17th bit
	   mov ax,[key_56_to_P2+4]
	   and ax,0000001000000000b
	   cmp ax,0
	   je H17
	   add word[key+2],1
H17:       add word[key+2],0
	   shl word[key+2],1
	   ;18th bit
	   mov ax,[key_56_to_P2+6]
	   and ax,0000000010000000b
	   cmp ax,0
	   je H18
	   add word[key+2],1
H18:       add word[key+2],0
	   shl word[key+2],1
	   ;19th bit
	   mov ax,[key_56_to_P2+6]
	   and ax,1000000000000000b
	   cmp ax,0
	   je H19
	   add word[key+2],1
H19:       add word[key+2],0
	   shl word[key+2],1
	   ;20th bit
	   mov ax,[key_56_to_P2+6]
	   and ax,0000000001000000b
	   cmp ax,0
	   je H20
	   add word[key+2],1
H20:        add word[key+2],0
	   shl word[key+2],1
	   ;21th bit
	   mov ax,[key_56_to_P2+4]
	   and ax,0000010000000000b
	   cmp ax,0
	   je H21
	   add word[key+2],1
H21:     add word[key+2],0
	   shl word[key+2],1
	   ;22th bit
	   mov ax,[key_56_to_P2+4]
	   and ax,0000000000001000b
	   cmp ax,0
	   je H22
	   add word[key+2],1
H22:       add word[key+2],0
	   shl word[key+2],1
	   ;23th bit
	   mov ax,[key_56_to_P2+6]
	   and ax,0001000000000000b
	   cmp ax,0
	   je H23
	   add word[key+2],1
H23:       add word[key+2],0
	   shl word[key+2],1
	    ;24th bit
	   mov ax,[key_56_to_P2+6]
	   and ax,0000000000000010b
	   cmp ax,0
	   je H24
	   add word[key+2],1
H24:        add word[key+2],0
       shl word[key+2],1
	    ;25th bit
	   mov ax,[key_56_to_P2+2]
	   and ax,0000000100000000b
	   cmp ax,0
	   je H25
	   add word[key+2],1
H25:       add word[key+2],0
	   shl word[key+2],1
	    ;26th bit
	   mov ax,[key_56_to_P2]
	   and ax,0000000000001000b
	   cmp ax,0
	   je H26
	   add word[key+2],1
H26:       add word[key+2],0
	   shl word[key+2],1
	    ;27th bit
	   mov ax,[key_56_to_P2+4]
	   and ax,0100000000000000b
	   cmp ax,0
	   je H27
	   add word[key+2],1
H27:        add word[key+2],0
	   shl word[key+2],1
	    ;28th bit
	   mov ax,[key_56_to_P2+2]
	   and ax,0000000000010000b
	   cmp ax,0
	   je H28
	   add word[key+2],1
H28:       add word[key+2],0
	   shl word[key+2],1
	    ;29th bit
	   mov ax,[key_56_to_P2+2]
	   and ax,0100000000000000b
	   cmp ax,0
	   je H29
	   add word[key+2],1
H29:   add word[key+2],0
	   shl word[key+2],1
	    ;30th bit
	   mov ax,[key_56_to_P2]
	   and ax,0000000001000000b
	   cmp ax,0
	   je H30
	   add word[key+2],1
H30:        add word[key+2],0
            shl word[key+2],1
	
        ;31th bit
	   mov ax,[key_56_to_P2+4]
	   and ax,0010000000000000b
	   cmp ax,0
	   je H31
	   add word[key+2],1
H31:       add word[key+2],0
	   shl word[key+2],1
	    ;32th bit
	   mov ax,[key_56_to_P2+2]
	   and ax,0000000010000000b
	   cmp ax,0
	   je H32
	   add word[key+2],1
H32:         add word[key+2],0
	   ;No shifting as LSB has occured


	    ;33th bit
	   mov ax,[key_56_to_P2]
	   and ax,0000000000000100b
	   cmp ax,0
	   je H33
	   add word[key+4],1
H33:       add word[key+4],0
	   shl word[key+4],1
	    ;34th bit
	   mov ax,[key_56_to_P2+2]
	   and ax,0001000000000000b
	   cmp ax,0
	   je H34
	   add word[key+4],1
H34:       add word[key+4],0
	   shl word[key+4],1
	    ;35th bit
	   mov ax,[key_56_to_P2+2]
	   and ax,0000000000000001b
	   cmp ax,0
	   je H35
	   add word[key+4],1
H35:       add word[key+4],0
	   shl word[key+4],1
	    ;36th bit
	   mov ax,[key_56_to_P2+2]
	   and ax,1000000000000000b
	   cmp ax,0
	   je H36
	   add word[key+4],1
H36:       add word[key+4],0
	   shl word[key+4],1
	    ;37th bit
	   mov ax,[key_56_to_P2+2]
	   and ax,0000100000000000b
	   cmp ax,0
	   je H37
	   add word[key+4],1
H37:       add word[key+4],0
	   shl word[key+4],1
	    ;38th bit
	   mov ax,[key_56_to_P2]
	   and ax,0000000000000001b
	   cmp ax,0
	   je H38
	   add word[key+4],1
H38:      add word[key+4],0
	   shl word[key+4],1
	    ;39th bit
	   mov ax,[key_56_to_P2+2]
	   and ax,0000000001000000b
	   cmp ax,0
	   je H39
	   add word[key+4],1
H39:       add word[key+4],0 
	    shl word[key+4],1
	    ;40th bit
	   mov ax,[key_56_to_P2]
	   and ax,0000000010000000b
	   cmp ax,0
	   je H40
	   add word[key+4],1
H40:       add word[key+4],0
	   shl word[key+4],1
	    ;41th bit
	   mov ax,[key_56_to_P2+2]
	   and ax,0000000000000010b
	   cmp ax,0
	   je H41
	   add word[key+4],1
H41:       add word[key+4],0
	   shl word[key+4],1
	    ;42th bit
	   mov ax,[key_56_to_P2]
	   and ax,0000000000010000b
	   cmp ax,0
	   je H42
	   add word[key+4],1
H42:   add word[key+4],0
	   shl word[key+4],1
	    ;43th bit
	   mov ax,[key_56_to_P2+2]
	   and ax,0010000000000000b
	   cmp ax,0
	   je H43
	   add word[key+4],1
H43:       add word[key+4],0
	   shl word[key+4],1
	    ;44th bit
	   mov ax,[key_56_to_P2+2]
	   and ax,0000001000000000b
	   cmp ax,0
	   je H44
	   add word[key+4],1
H44:   add word[key+4],0
	   shl word[key+4],1
	    ;45th bit
	   mov ax,[key_56_to_P2]
	   and ax,0000000000000010b
	   cmp ax,0
	   je H45
	   add word[key+4],1
H45:        add word[key+4],0
	   shl word [key+4],1
	    ;46th bit
	   mov ax,[key_56_to_P2+2]
	   and ax,0000000000001000b
	   cmp ax,0
	   je H46
	   add word[key+4],1
H46:       add word[key+4],0
           shl word [key+4],1

	    ;47th bit
	   mov ax,[key_56_to_P2+4]
	   and ax,0001000000000000b
	   cmp ax,0
	   je H47
	   add word[key+4],1
H47:        add word[key+4],0
	   shl word [key+4],1
	    ;48th bit
	   mov ax,[key_56_to_P2+4]
	   and ax,1000000000000000b
	   cmp ax,0
	   je H48
	   add word[key+4],1
H48:       add word[key+4],0
      ;No shifting as LSB has occured
	  
	  ret		 
	  
IP: 
       ;1st bit                   
       mov ax,[input_64]
	   and ax,0000001000000000b
	   cmp ax,0
	   je M1
	   add word[input],1
M1:	   add word[input],0
	   shl word[input],1
	  ;2nd bit
	   mov ax,[input_64]
	   and ax,0000000000000010b
	   cmp ax,0
	   je M2
	   add word[input],1
M2:	   add word[input],0
	   shl word[input],1
	   ;3rd bit
	   mov ax,[input_64+2]
	   and ax,0000001000000000b
	   cmp ax,0
	   je M3
	   add word[input],1
M3:	   add word[input],0
	   shl word[input],1
	    ;4th bit
	   mov ax,[input_64+2]
	   and ax,0000000000000010b
	   cmp ax,0
	   je M4
	   add word[input],1
M4:	   add word[input],0
	   shl word[input],1
	   ;5th bit
	   mov ax,[input_64+4]
	   and ax,0000001000000000b
	   cmp ax,0
	   je M5
	   add word[input],1
M5:	   add word[input],0
	   shl word[input],1
	   ;6th bit
	   mov ax,[input_64+4]
	   and ax,0000000000000010b
	   cmp ax,0
	   je M6
	   add word[input],1
M6:	   add word[input],0
	   shl word[input],1
	   ;7th bit
	   mov ax,[input_64+6]
	   and ax,0000001000000000b
	   cmp ax,0
	   je M7
	   add word[input],1
M7:	   add word[input],0
	   shl word[input],1
	   ;8th bit
	   mov ax,[input_64+6]
	   and ax,0000000000000010b
	   cmp ax,0
	   je M8
	   add word[input],1
M8:	   add word[input],0
           shl word[input],1
	   ;no shiftinM due to msb
	  
	   ;9th bit
	   mov ax,[input_64]
	   and ax,0000100000000000b
	   cmp ax,0
	   je M9
	   add word[input],1
M9:	   add word[input],0
	   shl word[input],1
	   ;10th bit
	   mov ax,[input_64]
	   and ax,0000000000001000b
	   cmp ax,0
	   je M10
	   add word[input],1
M10:   add word[input],0
	   shl word[input],1
	   ;11th bit
	   mov ax,[input_64+2]
	   and ax,0000100000000000b
	   cmp ax,0
	   je M11
	   add word[input],1
M11:       add word[input],0
	   shl word[input],1

	   ;12th bit
	   mov ax,[input_64+2]
	   and ax,0000000000001000b
	   cmp ax,0
	   je M12
	   add word[input],1
M12:       add word[input],0
	   shl word[input],1
	   ;13th bit
	   mov ax,[input_64+4]
	   and ax,0000100000000000b
	   cmp ax,0
	   je M13
	   add word[input],1
M13:       add word[input],0
	   shl word[input],1
	   ;14th bit
	   mov ax,[input_64+4]
	   and ax,0000000000001000b
	   cmp ax,0
	   je M14
	   add word[input],1
M14:       add word[input],0
	   shl word[input],1
	   ;15th bit
	   mov ax,[input_64+6]
	   and ax,0000100000000000b
	   cmp ax,0
	   je M15
	   add word[input],1
M15:       add word[input],0 
	   shl word[input],1
	   ;16th bit
	   mov ax,[input_64+6]
	   and ax,0000000000001000b
	   cmp ax,0
	   je M16
	   add word[input],1
M16:       add word[input],0
	   
	   ;17th bit
	   mov ax,[input_64]
	   and ax,0010000000000000b
	   cmp ax,0
	   je M17
	   add word[input+2],1
M17:       add word[input+2],0
	   shl word[input+2],1
	   ;18th bit
	   mov ax,[input_64]
	   and ax,0000000000100000b
	   cmp ax,0
	   je M18
	   add word[input+2],1
M18:       add word[input+2],0
	   shl word[input+2],1
	   ;19th bit
	   mov ax,[input_64+2]
	   and ax,0010000000000000b
	   cmp ax,0
	   je M19
	   add word[input+2],1
M19:       add word[input+2],0
	   shl word[input+2],1
	   ;20th bit
	   mov ax,[input_64+2]
	   and ax,0000000010000000b
	   cmp ax,0
	   je M20
	   add word[input+2],1
M20:       add word[input+2],0
	   shl word[input+2],1
	   ;21th bit
	   mov ax,[input_64+4]
	   and ax,0010000000000000b
	   cmp ax,0
	   je M21
	   add word[input+2],1
M21:        add word[input+2],0
	   shl word[input+2],1
	   ;22th bit
	   mov ax,[input_64+4]
	   and ax,0000000000100000b
	   cmp ax,0
	   je M22
	   add word[input+2],1
M22:     add word[input+2],0
	   shl word[input+2],1
	   ;23th bit
	   mov ax,[input_64+6]
	   and ax,0010000000000000b
	   cmp ax,0
	   je M23
	   add word[input+2],1
M23:       add word[input+2],0
	   shl word[input+2],1
	   ;24th bit
	   mov ax,[input_64+6]
	   and ax,0000000000100000b
	   cmp ax,0
	   je M24
	   add word[input+2],1
M24:       add word[input+2],0
           shl word[input+2],1                    
	   
	    ;25th bit
	   mov ax,[input_64]
	   and ax,1000000000000000b
	   cmp ax,0
	   je M25
	   add word[input+2],1
M25:        add word[input+2],0
	     shl word[input+2],1
	    ;26th bit
	   mov ax,[input_64]
	   and ax,0000000010000000b
	   cmp ax,0
	   je M26
	   add word[input+2],1
M26:       add word[input+2],0
	   shl word[input+2],1
	    ;27th bit
	   mov ax,[input_64+2]
	   and ax,1000000000000000b
	   cmp ax,0
	   je M27
	   add word[input+2],1
M27:       add word[input+2],0
	   shl word[input+2],1
	    ;28th bit
	   mov ax,[input_64+2]
	   and ax,0000000010000000b
	   cmp ax,0
	   je M28
	   add word[input+2],1
M28:        add word[input+2],0
	   shl word[input+2],1
	    ;29th bit
	   mov ax,[input_64+4]
	   and ax,1000000000000000b
	   cmp ax,0
	   je M29
	   add word[input+2],1
M29:       add word[input+2],0
	   shl word[input+2],1
	    ;30th bit
	   mov ax,[input_64+4]
	   and ax,0000000010000000b
	   cmp ax,0
	   je M30
	   add word[input+2],1
M30:   add word[input+2],0
	   shl word[input+2],1
	    ;31th bit
	   mov ax,[input_64+6]
	   and ax,1000000000000000b
	   cmp ax,0
	   je M31
	   add word[input+2],1
M31:        add word[input+2],0
            shl word[input+2],1
	
        ;32th bit
	   mov ax,[input_64+6]
	   and ax,0000000010000000b
	   cmp ax,0
	   je M32
	   add word[input+2],1
M32:       add word[input+2],0
      
	  ; No shifting as msb
	    ;33th bit;;;
	   mov ax,[input_64]
	   and ax,0000000100000000b
	   cmp ax,0
	   je M33
	   add word[input+4],1
M33:         add word[input+4],0
	    shl word[input+4],1
	    ;34th bit
	   mov ax,[input_64]
	   and ax,0000000100000000b
	   cmp ax,0
	   je M34
	   add word[input+4],1
M34:         add word[input+4],0
	   shl word[input+4],1
	    ;35th bit
	   mov ax,[input_64+2]
	   and ax,0000001000000000b
	   cmp ax,0
	   je M35
	   add word[input+4],1
M35:   add word[input+4],0
	   shl word[input+4],1
	    ;36th bit
	   mov ax,[input_64+2]
	   and ax,0000000000000001b
	   cmp ax,0
	   je M36
	   add word[input+4],1
M36:       add word[input+4],0
	   shl word[input+4],1
	    ;37th bit
	   mov ax,[input_64+4]
	   and ax,0000000100000000b
	   cmp ax,0
	   je M37
	   add word[input+4],1
M37:       add word[input+4],0
	   shl word[input+4],1
	    ;38th bit
	   mov ax,[input_64+6]
	   and ax,0000000000000001b
	   cmp ax,0
	   je M38
	   add word[input+4],1
M38:   add word[input+4],0
	   shl word[input+4],1
	    ;39th bit
	   mov ax,[input_64+6]
	   and ax,0000000100000000b
	   cmp ax,0
	   je M39
	   add word[input+4],1
M39:   add word[input+4],0
	   shl word[input+4],1
	    ;40th bit
	   mov ax,[input_64+6]
	   and ax,0000000000000001b
	   cmp ax,0
	   je M40
	   add word[input+4],1
M40:       add word[input+4],0 ;no shiftnM as msb occur
	    shl word[input+4],1
	    ;41th bit
	   mov ax,[input_64]
	   and ax,0000010000000000b
	   cmp ax,0
	   je M41
	   add word[input+4],1
M41:       add word[input+4],0
	   shl word[input+4],1
	    ;42th bit
	   mov ax,[input_64]
	   and ax,0000000000000100b
	   cmp ax,0
	   je M42
	   add word[input+4],1
M42:       add word[input+4],0
	   shl word[input+4],1
	    ;43th bit
	   mov ax,[input_64+2]
	   and ax,0000010000000000b
	   cmp ax,0
	   je M43
	   add word[input+4],1
M43:   add word[input+4],0
	   shl word[input+4],1
	    ;44th bit
	   mov ax,[input_64+2]
	   and ax,0000000000000100b
	   cmp ax,0
	   je M44
	   add word[input+4],1
M44:       add word[input+4],0
	   shl word[input+4],1
	    ;45th bit
	   mov ax,[input_64+4]
	   and ax,0000001000000000b
	   cmp ax,0
	   je M45
	   add word[input+4],1
M45:   add word[input+4],0
	   shl word[input+4],1
	    ;46th bit
	   mov ax,[input_64+4]
	   and ax,0000000000000100b
	   cmp ax,0
	   je M46
	   add word[input+4],1
M46:        add word[input+4],0
	   shl word [input+4],1
	    ;47th bit
	   mov ax,[input_64+6]
	   and ax,0000010000000000b
	   cmp ax,0
	   je M47
	   add word[input+4],1
M47:       add word[input+4],0
           shl word [input+4],1
	   
	    ;48th bit
	   mov ax,[input_64+6]
	   and ax,0000000000000100b
	   cmp ax,0
	   je M48
	   add word[input+4],1
M48:       add word[input+4],0
	   ;;;;;;
	    ;49th bit
	   mov ax,[input_64]
	   and ax,0001000000000000b
	   cmp ax,0
	   je M49
	   add word[input+6],1
M49:       add word[input+6],0 
	   shl word[input+6],1
	    ;50th bit
	   mov ax,[input_64]
	   and ax,0000000000010000b
	   cmp ax,0
	   je M50
	   add word[input+6],1
M50:       add word[input+6],0
	   shl word[input+6],1

	    ;51th bit
	   mov ax,[input_64+2]
	   and ax,0001000000000000b
	   cmp ax,0
	   je M51
	   add word[input+6],1
M51:      add word[input+6],0
	   shl word[input+6],1
	    ;52th bit
	   mov ax,[input_64+2]
	   and ax,0000000000010000b
	   cmp ax,0
	   je M52
	   add word[input+6],1
M52:       add word[input+6],0
	   shl word[input+6],1
	    ;53th bit
	   mov ax,[input_64+4]
	   and ax,0001000000000000b
	   cmp ax,0
	   je M53
	   add word[input+6],1
M53:       add word[input+6],0
	   shl word[input+6],1
	    ;54th bit
	   mov ax,[input_64+4]
	   and ax,0000000000010000b
	   cmp ax,0
	   je M54
	   add word[input+6],1
M54:        add word[input+6],0
	   shl word [input+6],1
	    ;55th bit
	   mov ax,[input_64+6]
	   and ax,0001000000000000b
	   cmp ax,0
	   je M55
	   add word[input+6],1
M55:       add word[input+6],0
           shl word [input+6],1
	    ;56th bit
	   mov ax,[input_64+6]
	   and ax,0000000000010000b
	   cmp ax,0
	   je M56
	   add word[input+6],1
M56:       add word[input+6],0
            shl word [input+6],1
      
	   	    ;57th bit
	   mov ax,[input_64]
	   and ax,0100000000000100b
	   cmp ax,0
	   je M57
	   add word[input+6],1
M57:       add word[input+6],0
shl word [input+6],1
	   ;;;;;;
	    ;58th bit
	   mov ax,[input_64]
	   and ax,0000000001000000b
	   cmp ax,0
	   je M58
	   add word[input+6],1
M58:       add word[input+6],0 
	   shl word[input+6],1
	    ;59th bit
	   mov ax,[input_64+2]
	   and ax,0100000000000000b
	   cmp ax,0
	   je M59
	   add word[input+6],1
M59:       add word[input+6],0
	   shl word[input+6],1

	    ;60th bit
	   mov ax,[input_64+2]
	   and ax,0000000001000000b
	   cmp ax,0
	   je M60
	   add word[input+6],1
M60:       add word[input+6],0
	   shl word[input+6],1
	    ;61th bit
	   mov ax,[input_64+4]
	   and ax,0100000000000000b
	   cmp ax,0
	   je M61
	   add word[input+6],1
M61:       add word[input+6],0
	   shl word[input+6],1
	    ;62th bit
	   mov ax,[input_64+4]
	   and ax,0000000001000000b
	   cmp ax,0
	   je M62
	   add word[input+6],1
M62:       add word[input+6],0
	   shl word[input+6],1
	    ;63th bit
	   mov ax,[input_64+6]
	   and ax,0100000000000000b
	   cmp ax,0
	   je M63
	   add word[input+6],1
M63:        add word[input+6],0
	   shl word [input+6],1
	    ;64th bit
	   mov ax,[input_64+6]
	   and ax,0001000001000000b
	   cmp ax,0
	   je M64
	   add word[input+6],1
M64:       add word[input+6],0

	 ret
	 
	 
FP:	  
     ;1st bit                   
       mov ax,[input+2]
	   and ax,0000001000000000b
	   cmp ax,0
	   je N1
	   add word[input_64],1
N1:	   add word[input_64],0
	   shl word[input_64],1
	  ;2nd bit
	   mov ax,[input+6]
	   and ax,0000000010000000b
	   cmp ax,0
	   je N2
	   add word[input_64],1
N2:	   add word[input_64],0
	   shl word[input_64],1
	   ;3rd bit
	   mov ax,[input+2]
	   and ax,1000000000000000b
	   cmp ax,0
	   je N3
	   add word[input_64],1
N3:	   add word[input_64],0
	   shl word[input_64],1
	    ;4th bit
	   mov ax,[input+6]
	   and ax,1000000000000000b
	   cmp ax,0
	   je N4
	   add word[input_64],1
N4:	   add word[input_64],0
	   shl word[input_64],1
	   ;5th bit
	   mov ax,[input]
	   and ax,0000000010000000b
	   cmp ax,0
	   je N5
	   add word[input_64],1
N5:	   add word[input_64],0
	   shl word[input_64],1
	   ;6th bit
	   mov ax,[input+4]
	   and ax,0000000010000000b
	   cmp ax,0
	   je N6
	   add word[input_64],1
N6:	   add word[input_64],0
	   shl word[input_64],1
	   ;7th bit
	   mov ax,[input]
	   and ax,1000000000000000b
	   cmp ax,0
	   je N7
	   add word[input_64],1
N7:	   add word[input_64],0
	   shl word[input_64],1
	   ;8th bit
	   mov ax,[input+4]
	   and ax,1000000000000000b
	   cmp ax,0
	   je N8
	   add word[input_64],1
N8:	   add word[input_64],0
           shl word[input_64],1
	   
	  
	   ;9th bit
	   mov ax,[input+2]
	   and ax,0000000001000000b
	   cmp ax,0
	   je N9
	   add word[input_64],1
N9:	   add word[input_64],0
	   shl word[input_64],1
	   ;10th bit
	   mov ax,[input+6]
	   and ax,0100000000000000b
	   cmp ax,0
	   je N10
	   add word[input_64],1
N10:   add word[input_64],0
	   shl word[input_64],1
	   ;11th bit
	   mov ax,[input]
	   and ax,0100000001000000b
	   cmp ax,0
	   je N11
	   add word[input_64],1
N11:       add word[input_64],0
	   shl word[input_64],1

	   ;12th bit
	   mov ax,[input+4]
	   and ax,0000000001000000b
	   cmp ax,0
	   je N12
	   add word[input_64],1
N12:       add word[input_64],0
	   shl word[input_64],1
	   ;13th bit
	   mov ax,[input]
	   and ax,0100000000000000b
	   cmp ax,0
	   je N13
	   add word[input_64],1
N13:       add word[input_64],0
	   shl word[input_64],1
	   ;14th bit
	   mov ax,[input+6]
	   and ax,0000100000000000b
	   cmp ax,0
	   je N14
	   add word[input_64],1
N14:       add word[input_64],0
	   shl word[input_64],1
	   ;15th bit
	   mov ax,[input]
	   and ax,010000000000000b
	   cmp ax,0
	   je N15
	   add word[input_64],1
N15:       add word[input_64],0 
	   shl word[input_64],1
	   ;16th bit
	   mov ax,[input+4]
	   and ax,0100000000000000b
	   cmp ax,0
	   je N16
	   add word[input_64],1
N16:       add word[input_64],0
	   
	   ;17th bit
	   mov ax,[input+2]
	   and ax,0000000000100000b
	   cmp ax,0
	   je N17
	   add word[input_64+2],1
N17:       add word[input_64+2],0
	   shl word[input_64+2],1
	   ;18th bit
	   mov ax,[input+6]
	   and ax,0000000000100000b
	   cmp ax,0
	   je N18
	   add word[input_64+2],1
N18:       add word[input_64+2],0
	   shl word[input_64+2],1
	   ;19th bit
	   mov ax,[input+2]
	   and ax,0010000000000000b
	   cmp ax,0
	   je N19
	   add word[input_64+2],1
N19:       add word[input_64+2],0
	   shl word[input_64+2],1
	   ;20th bit
	   mov ax,[input+6]
	   and ax,0010000000000000b
	   cmp ax,0
	   je N20
	   add word[input_64+2],1
N20:       add word[input_64+2],0
	   shl word[input_64+2],1
	   ;21th bit
	   mov ax,[input]
	   and ax,0000000000100000b
	   cmp ax,0
	   je N21
	   add word[input_64+2],1
N21:        add word[input_64+2],0
	   shl word[input_64+2],1
	   ;22th bit
	   mov ax,[input+4]
	   and ax,0000000000100000b
	   cmp ax,0
	   je N22
	   add word[input_64+2],1
N22:     add word[input_64+2],0
	   shl word[input_64+2],1
	   ;23th bit
	   mov ax,[input]
	   and ax,0010000000000000b
	   cmp ax,0
	   je N23
	   add word[input_64+2],1
N23:       add word[input_64+2],0
	   shl word[input_64+2],1
	   ;24th bit
	   mov ax,[input+4]
	   and ax,0010000000000000b
	   cmp ax,0
	   je N24
	   add word[input_64+2],1
N24:       add word[input_64+2],0
           shl word[input_64+2],1                    
	   
	    ;25th bit
	   mov ax,[input+2]
	   and ax,0000000000010000b
	   cmp ax,0
	   je N25
	   add word[input_64+2],1
N25:        add word[input_64+2],0
	     shl word[input_64+2],1
	    ;26th bit
	   mov ax,[input+6]
	   and ax,0000000000010000b
	   cmp ax,0
	   je N26
	   add word[input_64+2],1
N26:       add word[input_64+2],0
	   shl word[input_64+2],1
	    ;27th bit
	   mov ax,[input+2]
	   and ax,0001000000000000b
	   cmp ax,0
	   je N27
	   add word[input_64+2],1
N27:       add word[input_64+2],0
	   shl word[input_64+2],1
	    ;28th bit
	   mov ax,[input+6]
	   and ax,0001000000000000b
	   cmp ax,0
	   je N28
	   add word[input_64+2],1
N28:        add word[input_64+2],0
	   shl word[input_64+2],1
	    ;29th bit
	   mov ax,[input]
	   and ax,0000000000010000b
	   cmp ax,0
	   je N29
	   add word[input_64+2],1
N29:       add word[input_64+2],0
	   shl word[input_64+2],1
	    ;30th bit
	   mov ax,[input+4]
	   and ax,0000000000010000b
	   cmp ax,0
	   je N30
	   add word[input_64+2],1
N30:   add word[input_64+2],0
	   shl word[input_64+2],1
	    ;31th bit
	   mov ax,[input]
	   and ax,0001000000000000b
	   cmp ax,0
	   je N31
	   add word[input_64+2],1
N31:        add word[input_64+2],0
            shl word[input_64+2],1
	
        ;32th bit
	   mov ax,[input+4]
	   and ax,0001000000000000b
	   cmp ax,0
	   je N32
	   add word[input_64+2],1
N32:       add word[input_64+2],0
      
	  ;No shifting as msb
	    ;33th bit;;;
	   mov ax,[input+4]
	   and ax,0000000000001000b
	   cmp ax,0
	   je N33
	   add word[input_64+4],1
N33:         add word[input_64+4],0
	    shl word[input_64+4],1
	    ;34th bit
	   mov ax,[input+6]
	   and ax,0000000000001000b
	   cmp ax,0
	   je N34
	   add word[input_64+4],1
N34:         add word[input_64+4],0
	   shl word[input_64+4],1
	    ;35th bit
	   mov ax,[input+2]
	   and ax,0000100000000000b
	   cmp ax,0
	   je N35
	   add word[input_64+4],1
N35:   add word[input_64+4],0
	   shl word[input_64+4],1
	    ;36th bit
	   mov ax,[input+6]
	   and ax,0000100000000000b
	   cmp ax,0
	   je N36
	   add word[input_64+4],1
N36:       add word[input_64+4],0
	   shl word[input_64+4],1
	    ;37th bit
	   mov ax,[input]
	   and ax,0000000000000100b
	   cmp ax,0
	   je N37
	   add word[input_64+4],1
N37:       add word[input_64+4],0
	   shl word[input_64+4],1
	    ;38th bit
	   mov ax,[input+4]
	   and ax,0000000000001000b
	   cmp ax,0
	   je N38
	   add word[input_64+4],1
N38:   add word[input_64+4],0
	   shl word[input_64+4],1
	    ;39th bit
	   mov ax,[input]
	   and ax,0001000000000000b
	   cmp ax,0
	   je N39
	   add word[input_64+4],1
N39:   add word[input_64+4],0
	   shl word[input_64+4],1
	    ;40th bit
	   mov ax,[input+4]
	   and ax,0000100000000000b
	   cmp ax,0
	   je N40
	   add word[input_64+4],1
N40:       add word[input_64+4],0 ;no shiftnN as msb occur
	    shl word[input_64+4],1
	    ;41th bit
	   mov ax,[input+2]
	   and ax,0000000000000100b
	   cmp ax,0
	   je N41
	   add word[input_64+4],1
N41:       add word[input_64+4],0
	   shl word[input_64+4],1
	    ;42th bit
	   mov ax,[input+6]
	   and ax,0000000000000100b
	   cmp ax,0
	   je N42
	   add word[input_64+4],1
N42:       add word[input_64+4],0
	   shl word[input_64+4],1
	    ;43th bit
	   mov ax,[input+2]
	   and ax,0000010000000000b
	   cmp ax,0
	   je N43
	   add word[input_64+4],1
N43:   add word[input_64+4],0
	   shl word[input_64+4],1
	    ;44th bit
	   mov ax,[input+6]
	   and ax,0000010000000000b
	   cmp ax,0
	   je N44
	   add word[input_64+4],1
N44:       add word[input_64+4],0
	   shl word[input_64+4],1
	    ;45th bit
	   mov ax,[input]
	   and ax,0000000000000100b
	   cmp ax,0
	   je N45
	   add word[input_64+4],1
N45:   add word[input_64+4],0
	   shl word[input_64+4],1
	    ;46th bit
	   mov ax,[input+4]
	   and ax,0000000000000100b
	   cmp ax,0
	   je N46
	   add word[input_64+4],1
N46:        add word[input_64+4],0
	   shl word [input+4],1
	    ;47th bit
	   mov ax,[input]
	   and ax,0000010000000000b
	   cmp ax,0
	   je N47
	   add word[input_64+4],1
N47:       add word[input_64+4],0
           shl word [input+4],1
	   
	    ;48th bit
	   mov ax,[input+4]
	   and ax,0001000000000000b
	   cmp ax,0
	   je N48
	   add word[input_64+4],1
N48:       add word[input_64+4],0
	   ;;;;;;
	    ;49th bit
	   mov ax,[input+2]
	   and ax,0000000000000010b
	   cmp ax,0
	   je N49
	   add word[input_64+6],1
N49:       add word[input_64+6],0 
	   shl word[input_64+6],1
	    ;50th bit
	   mov ax,[input+6]
	   and ax,0000000000000010b
	   cmp ax,0
	   je N50
	   add word[input_64+6],1
N50:       add word[input_64+6],0
	   shl word[input_64+6],1

	    ;51th bit
	   mov ax,[input+2]
	   and ax,0000001000000000b
	   cmp ax,0
	   je N51
	   add word[input_64+6],1
N51:      add word[input_64+6],0
	   shl word[input_64+6],1
	    ;52th bit
	   mov ax,[input+6]
	   and ax,0000001000000000b
	   cmp ax,0
	   je N52
	   add word[input_64+6],1
N52:       add word[input_64+6],0
	   shl word[input_64+6],1
	    ;53th bit
	   mov ax,[input]
	   and ax,0001000000000010b
	   cmp ax,0
	   je N53
	   add word[input_64+6],1
N53:       add word[input_64+6],0
	   shl word[input_64+6],1
	    ;54th bit
	   mov ax,[input+4]
	   and ax,0000000000010010b
	   cmp ax,0
	   je N54
	   add word[input_64+6],1
N54:        add word[input_64+6],0
	   shl word [input+6],1
	    ;55th bit
	   mov ax,[input]
	   and ax,0000001000000000b
	   cmp ax,0
	   je N55
	   add word[input_64+6],1
N55:       add word[input_64+6],0
           shl word [input+6],1
	    ;56th bit
	   mov ax,[input+4]
	   and ax,0000001000000000b
	   cmp ax,0
	   je N56
	   add word[input_64+6],1
N56:       add word[input_64+6],0
            shl word [input+6],1
      
	   	    ;57th bit
	   mov ax,[input+2]
	   and ax,0100000000000001b
	   cmp ax,0
	   je N57
	   add word[input_64+6],1
N57:       add word[input_64+6],0
shl word [input+6],1
	   ;;;;;;
	    ;58th bit
	   mov ax,[input+6]
	   and ax,0000000000000001b
	   cmp ax,0
	   je N58
	   add word[input_64+6],1
N58:       add word[input_64+6],0 
	   shl word[input_64+6],1
	    ;59th bit
	   mov ax,[input+2]
	   and ax,0000000100000000b
	   cmp ax,0
	   je N59
	   add word[input_64+6],1
N59:       add word[input_64+6],0
	   shl word[input_64+6],1

	    ;60th bit
	   mov ax,[input+6]
	   and ax,0000000100000000b
	   cmp ax,0
	   je N60
	   add word[input_64+6],1
N60:       add word[input_64+6],0
	   shl word[input_64+6],1
	    ;61th bit
	   mov ax,[input]
	   and ax,0000000000000001b
	   cmp ax,0
	   je N61
	   add word[input_64+6],1
N61:       add word[input_64+6],0
	   shl word[input_64+6],1
	    ;62th bit
	   mov ax,[input+4]
	   and ax,0000000000000001b
	   cmp ax,0
	   je N62
	   add word[input_64+6],1
N62:       add word[input_64+6],0
	   shl word[input_64+6],1
	    ;63th bit
	   mov ax,[input]
	   and ax,0000000100000000b
	   cmp ax,0
	   je N63
	   add word[input_64+6],1
N63:        add word[input_64+6],0
	   shl word [input_64+6],1
	    ;64th bit
	   mov ax,[input+6]
	   and ax,0000000100000000b
	   cmp ax,0
	   je N64
	   add word[input_64+6],1
N64:       add word[input_64+6],0
	  
	 ret	 

key_64:dw 0000000000000000b,0000000000000000b,0000000000000000b,0000000000000000b

;Take input of key in label 'key_64'
;Move this key in label 'key_56', this label will still consist of 64 but the most signifciant 8 bits will be zero,so 
;we will ultimatly have 56 effective bits
;i.e key_56=00000000xxxxxxxxb,xxxxxxxxxxxxxxxxb,xxxxxxxxxxxxxxxxb,xxxxxxxxxxxxxxxxb

key_56:dw 0000000000000000b,0000000000000000b,0000000000000000b,0000000000000000b

;we will move the key after rotations to the location 'key_56_to_P2', from this location, we will perform the 2nd permutation.
key_56_to_P2 dw 0000000000000000b,0000000000000000b,0000000000000000b,0000000000000000b
;The 48 bit key will be stored in the label 'key'
key: dw 0000000000000000b,0000000000000000b,0000000000000000b

answer:dw 0x0000,0x0000;Array to store 32-bit output of s-boxes,final answer of the f-function "after running p-function" will also be stored here
input:dw 0xffff,0xffff,0xffff,0xffff;<-----Dont enter your input here,, this location is being used by the program to do its wotking, Enter you input in the label 'input_64'
result:dw 0,0,0;48-bit Result after expansion "from E-function" will be stored here

input_64:dw 0,0,0,0;<-----Enter 64 bit input here, 32 LSBs of this input will be sent to f-function, Final 64 bit answer after Final Permutation will be stored here.


         start:
		 call IP;Paste USman Hameed;s contect here and at last line
		 
		 call PC_1
		 
         ;round 1
         call make_28bits_each ;This will divide 28 bits in both memory locations.
		 call rotations;This will rotate the bits once
		 call make_one_of_56_bits;This will combine the rotated bits to again make combined 56 bits.
		 call move_rotated_bits_to_location_key_56_to_P2;This will move the rotated bits to the location 'key_56_to_P2'
		 call PC_2;This will move the 48-bits from PC_2 to the label 'key'
		 
		 call f_function
		 ;Taking XOR of output of f function with 32 MSBs of Input
		 mov ax,[answer]
		 xor word [input],ax
		 mov ax,[answer+2]
		 xor word [input+2],ax
		 ;Swapping the 32 LSBs with the 32 MSBs
		 mov ax,[input]
		 mov bx,[input+2]
		 mov cx,[input+4]
		 mov dx,[input+6]
		 mov [input],cx
		 mov [input+2],dx
		 mov [input+4],ax
		 mov [input+6],bx
		 
		 
		 ;round 2
         call make_28bits_each 
		 call rotations
		 call make_one_of_56_bits
		 call move_rotated_bits_to_location_key_56_to_P2
		 call PC_2
		 
		 call f_function
		 ;Taking XOR of output of f function with 32 MSBs of Input
		 mov ax,[answer]
		 xor word [input],ax
		 mov ax,[answer+2]
		 xor word [input+2],ax
		 ;Swapping the 32 LSBs with the 32 MSBs
		 mov ax,[input]
		 mov bx,[input+2]
		 mov cx,[input+4]
		 mov dx,[input+6]
		 mov [input],cx
		 mov [input+2],dx
		 mov [input+4],ax
		 mov [input+6],bx
		 
		 
		 
		 ;round 3
         call make_28bits_each 
		 call rotations
		 call rotations
		 call make_one_of_56_bits
		 call move_rotated_bits_to_location_key_56_to_P2
		 call PC_2
		 
		 
		 call f_function  
		 ;Taking XOR of output of f function with 32 MSBs of Input
		 mov ax,[answer]
		 xor word [input],ax
		 mov ax,[answer+2]
		 xor word [input+2],ax
		 ;Swapping the 32 LSBs with the 32 MSBs
		 mov ax,[input]
		 mov bx,[input+2]
		 mov cx,[input+4]
		 mov dx,[input+6]
		 mov [input],cx
		 mov [input+2],dx
		 mov [input+4],ax
		 mov [input+6],bx
		 
		 
		 ;round 4
         call make_28bits_each 
		 call rotations
		 call rotations
		 call make_one_of_56_bits
		 call move_rotated_bits_to_location_key_56_to_P2
		 call PC_2
		 
		 
		 call f_function
		 ;Taking XOR of output of f function with 32 MSBs of Input
		 mov ax,[answer]
		 xor word [input],ax
		 mov ax,[answer+2]
		 xor word [input+2],ax
		 ;Swapping the 32 LSBs with the 32 MSBs
		 mov ax,[input]
		 mov bx,[input+2]
		 mov cx,[input+4]
		 mov dx,[input+6]
		 mov [input],cx
		 mov [input+2],dx
		 mov [input+4],ax
		 mov [input+6],bx
		 
		 
		 ;round 5
         call make_28bits_each 
		 call rotations
		 call rotations
		 call make_one_of_56_bits
		 call move_rotated_bits_to_location_key_56_to_P2
		 call PC_2
		 
		 call f_function
		 ;Taking XOR of output of f function with 32 MSBs of Input
		 mov ax,[answer]
		 xor word [input],ax
		 mov ax,[answer+2]
		 xor word [input+2],ax
		 ;Swapping the 32 LSBs with the 32 MSBs
		 mov ax,[input]
		 mov bx,[input+2]
		 mov cx,[input+4]
		 mov dx,[input+6]
		 mov [input],cx
		 mov [input+2],dx
		 mov [input+4],ax
		 mov [input+6],bx
		 
		 
		 
		 ;round 6
         call make_28bits_each 
		 call rotations
		 call rotations
		 call make_one_of_56_bits
		 call move_rotated_bits_to_location_key_56_to_P2
		 call PC_2
		 
		 
		 call f_function
		 ;Taking XOR of output of f function with 32 MSBs of Input
		 mov ax,[answer]
		 xor word [input],ax
		 mov ax,[answer+2]
		 xor word [input+2],ax
		 ;Swapping the 32 LSBs with the 32 MSBs
		 mov ax,[input]
		 mov bx,[input+2]
		 mov cx,[input+4]
		 mov dx,[input+6]
		 mov [input],cx
		 mov [input+2],dx
		 mov [input+4],ax
		 mov [input+6],bx
		 
		 
		 ;round 7
         call make_28bits_each 
		 call rotations
		 call rotations
		 call make_one_of_56_bits
		 call move_rotated_bits_to_location_key_56_to_P2
		 call PC_2
		 
		 call f_function
		 ;Taking XOR of output of f function with 32 MSBs of Input
		 mov ax,[answer]
		 xor word [input],ax
		 mov ax,[answer+2]
		 xor word [input+2],ax
		 ;Swapping the 32 LSBs with the 32 MSBs
		 mov ax,[input]
		 mov bx,[input+2]
		 mov cx,[input+4]
		 mov dx,[input+6]
		 mov [input],cx
		 mov [input+2],dx
		 mov [input+4],ax
		 mov [input+6],bx
		 
		 
		 
		 ;round 8
         call make_28bits_each 
		 call rotations
		 call rotations
		 call make_one_of_56_bits
		 call move_rotated_bits_to_location_key_56_to_P2
		 call PC_2
		 
		 call f_function
		 ;Taking XOR of output of f function with 32 MSBs of Input
		 mov ax,[answer]
		 xor word [input],ax
		 mov ax,[answer+2]
		 xor word [input+2],ax
		 ;Swapping the 32 LSBs with the 32 MSBs
		 mov ax,[input]
		 mov bx,[input+2]
		 mov cx,[input+4]
		 mov dx,[input+6]
		 mov [input],cx
		 mov [input+2],dx
		 mov [input+4],ax
		 mov [input+6],bx
		 
		 
		 
		 ;round 9
         call make_28bits_each 
		 call rotations
		 call make_one_of_56_bits
		 call move_rotated_bits_to_location_key_56_to_P2
		 call PC_2
		 
		 call f_function
		 ;Taking XOR of output of f function with 32 MSBs of Input
		 mov ax,[answer]
		 xor word [input],ax
		 mov ax,[answer+2]
		 xor word [input+2],ax
		 ;Swapping the 32 LSBs with the 32 MSBs
		 mov ax,[input]
		 mov bx,[input+2]
		 mov cx,[input+4]
		 mov dx,[input+6]
		 mov [input],cx
		 mov [input+2],dx
		 mov [input+4],ax
		 mov [input+6],bx
		 
		 
		 
		 ;round 10
         call make_28bits_each 
		 call rotations
		 call rotations
		 call make_one_of_56_bits
		 call move_rotated_bits_to_location_key_56_to_P2
		 call PC_2
		 
		 call f_function
		 ;Taking XOR of output of f function with 32 MSBs of Input
		 mov ax,[answer]
		 xor word [input],ax
		 mov ax,[answer+2]
		 xor word [input+2],ax
		 ;Swapping the 32 LSBs with the 32 MSBs
		 mov ax,[input]
		 mov bx,[input+2]
		 mov cx,[input+4]
		 mov dx,[input+6]
		 mov [input],cx
		 mov [input+2],dx
		 mov [input+4],ax
		 mov [input+6],bx
		 
		 
		 
		 
		 ;round 11
         call make_28bits_each 
		 call rotations
		 call rotations
		 call make_one_of_56_bits
		 call move_rotated_bits_to_location_key_56_to_P2
		 call PC_2
		 
		 
		 call f_function
		 ;Taking XOR of output of f function with 32 MSBs of Input
		 mov ax,[answer]
		 xor word [input],ax
		 mov ax,[answer+2]
		 xor word [input+2],ax
		 ;Swapping the 32 LSBs with the 32 MSBs
		 mov ax,[input]
		 mov bx,[input+2]
		 mov cx,[input+4]
		 mov dx,[input+6]
		 mov [input],cx
		 mov [input+2],dx
		 mov [input+4],ax
		 mov [input+6],bx
		 
		 
		 
		 ;round 12
         call make_28bits_each 
		 call rotations
		 call rotations
		 call make_one_of_56_bits
		 call move_rotated_bits_to_location_key_56_to_P2
		 call PC_2
		 
		 
		 call f_function
		 ;Taking XOR of output of f function with 32 MSBs of Input
		 mov ax,[answer]
		 xor word [input],ax
		 mov ax,[answer+2]
		 xor word [input+2],ax
		 ;Swapping the 32 LSBs with the 32 MSBs
		 mov ax,[input]
		 mov bx,[input+2]
		 mov cx,[input+4]
		 mov dx,[input+6]
		 mov [input],cx
		 mov [input+2],dx
		 mov [input+4],ax
		 mov [input+6],bx
		 
		 
		 
		 ;round 13
         call make_28bits_each 
		 call rotations
		 call rotations
		 call make_one_of_56_bits
		 call move_rotated_bits_to_location_key_56_to_P2
		 call PC_2
		 
		 
		 call f_function
		 ;Taking XOR of output of f function with 32 MSBs of Input
		 mov ax,[answer]
		 xor word [input],ax
		 mov ax,[answer+2]
		 xor word [input+2],ax
		 ;Swapping the 32 LSBs with the 32 MSBs
		 mov ax,[input]
		 mov bx,[input+2]
		 mov cx,[input+4]
		 mov dx,[input+6]
		 mov [input],cx
		 mov [input+2],dx
		 mov [input+4],ax
		 mov [input+6],bx
		 
		 
		 
		 ;round 14
         call make_28bits_each 
		 call rotations
		 call rotations
		 call make_one_of_56_bits
		 call move_rotated_bits_to_location_key_56_to_P2
		 call PC_2
		 
		 
		 call f_function
		 ;Taking XOR of output of f function with 32 MSBs of Input
		 mov ax,[answer]
		 xor word [input],ax
		 mov ax,[answer+2]
		 xor word [input+2],ax
		 ;Swapping the 32 LSBs with the 32 MSBs
		 mov ax,[input]
		 mov bx,[input+2]
		 mov cx,[input+4]
		 mov dx,[input+6]
		 mov [input],cx
		 mov [input+2],dx
		 mov [input+4],ax
		 mov [input+6],bx
		 
		 
		 
		 ;round 15
         call make_28bits_each 
		 call rotations
		 call rotations
		 call make_one_of_56_bits
		 call move_rotated_bits_to_location_key_56_to_P2
		 call PC_2
		 
		 
		 call f_function
		 ;Taking XOR of output of f function with 32 MSBs of Input
		 mov ax,[answer]
		 xor word [input],ax
		 mov ax,[answer+2]
		 xor word [input+2],ax
		 ;Swapping the 32 LSBs with the 32 MSBs
		 mov ax,[input]
		 mov bx,[input+2]
		 mov cx,[input+4]
		 mov dx,[input+6]
		 mov [input],cx
		 mov [input+2],dx
		 mov [input+4],ax
		 mov [input+6],bx
		 
		 
		 
		 ;round 16
         call make_28bits_each 
		 call rotations
		 call make_one_of_56_bits
		 call move_rotated_bits_to_location_key_56_to_P2
		 call PC_2
		 
		 
		 call f_function
		 ;Taking XOR of output of f function with 32 MSBs of Input
		 mov ax,[answer]
		 xor word [input],ax
		 mov ax,[answer+2]
		 xor word [input+2],ax
		 ;Swapping the 32 LSBs with the 32 MSBs
		 mov ax,[input]
		 mov bx,[input+2]
		 mov cx,[input+4]
		 mov dx,[input+6]
		 mov [input],cx
		 mov [input+2],dx
		 mov [input+4],ax
		 mov [input+6],bx
		 
		 
		 call FP;finally, the answer is moved back to the label 'input_64' in this Subroutine.

 mov ax, 0x4c00 
 int 0x21