.686
.model flat
extern _ExitProcess@4 : PROC
extern __read : PROC
extern __write : PROC

public _main
.data
	dekoder db '0123456789ABCDEFGHIJLK' 
	zly_symbol db 0
	podstawa dd ?
	znaki db 12 dup (?)
	obszar db 12 dup (?)
.code

wczytaj_do_EAX PROC
	push ebx 
	push ecx 
	push edx 
	push esi 
	push edi 
	push ebp 
	
	push dword PTR 12
	push OFFSET obszar
	push dword PTR 0
	call __read
	add esp, 12

	mov ebx, OFFSET obszar
	mov eax, 0

	ptl3:
	mov cl, [ebx]
	inc ebx

	cmp cl, 10
	je koniec

	cmp cl, '0'
	jb zle_znaki

	cmp cl, '9'
	ja znak
	sub cl, 30H
	jmp dalej

	znak:
	cmp cl, 'A'
	jb zle_znaki

	cmp cl, 'B'
	ja znak_maly
	sub cl, 'A' - 10

	znak_maly:
	cmp cl, 'a'
	jb zle_znaki

	cmp cl, 'b'
	ja zle_znaki
	sub cl, 'a' - 10

	dalej:
	movzx ecx, cl
	mul dword PTR podstawa
	add eax, ecx
	jmp ptl3

	jmp koniec

	zle_znaki:
	mov zly_symbol, 1

	koniec:

	pop ebp 
	pop edi 
	pop esi 
	pop edx 
	pop ecx 
	pop ebx 
	ret 
wczytaj_do_EAX ENDP

wyswietl_EAX PROC 
	pusha 
	
	mov esi, 10

	ptl1:
	mov edx, 0
	div podstawa
	mov bl, dekoder[edx]
	mov znaki[esi], bl

	dec esi
	cmp eax, 0
	jne ptl1

	ptl2:
	cmp esi, 0
	je wypisz
	mov byte PTR znaki[esi], ' '
	dec esi
	jmp ptl2

	wypisz:
	mov byte PTR znaki[11], 10
	mov byte PTR znaki[0], 10

	push byte PTR 12
	push byte PTR OFFSET znaki
	push 1
	call __write
	add esp, 12

	popa
	ret
wyswietl_EAX ENDP

_main PROC
	mov podstawa, 12
	call wczytaj_do_EAX
	mov ecx, eax
	call wczytaj_do_EAX
	mov edx, eax

	cmp zly_symbol, 1
	je zakoncz_program

	mov eax, ecx
	call wyswietl_EAX

	mov eax, edx
	call wyswietl_EAX

	mov ecx, 1
	mov edx, 0
	ptl4:
	cmp edx, 0
	jne odejmij
	add eax, ecx
	mov edx, 1
	jmp pokaz_liczbe
	odejmij:
	sub eax, ecx
	mov edx, 0

	pokaz_liczbe:
	call wyswietl_EAX
	inc ecx
	cmp ecx, 20
	jbe ptl4

	zakoncz_program:

	push 0
	call _ExitProcess@4
_main ENDP
END