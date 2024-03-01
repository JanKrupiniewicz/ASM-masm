.686
.model flat
extern __write : PROC

public _potegowanie_e, _wypisz_z_precyzja
.data
	hex dd 10.0
	hexdo3 dd 1000.0
	znaki db 8 dup (' ')
.code

_wypisz_z_precyzja PROC
	push ecx
	push ebp
	push ebx
	push esi

	mov esi, 6
	mov ebx, 10
	konwersja:

	cmp esi, 3
	jne nie_kropka
	mov znaki[esi], byte ptr 2Eh
	dec esi
	jmp konwersja

	nie_kropka:
	xor edx, edx
	div ebx
	add dl, 30H
	mov znaki[esi], byte ptr dl
	dec esi
	cmp eax, 0
	jne konwersja

	mov byte PTR znaki [7], 0AH

	push dword ptr 8
	push dword ptr offset znaki
	push dword ptr 1
	call __write
	add esp, 12

	pop esi
	pop ebx
	pop ebp
	pop ecx
	ret
_wypisz_z_precyzja ENDP

_potegowanie_e PROC
	push ebp
	push ebx
	push esi
	push edi

	sub esp, 4
	mov ecx, 10
	
	ptl:
	fldl2e
	push ecx
	fild dword ptr [esp] 
	add esp, 4
	fdiv dword ptr [hex]
	
	fmul
	fst st(1)
	frndint
	fxch
	fsub st(0), st(1)
	f2xm1
	fld1
	fadd
	fscale
	fstp st(1)
	fmul dword ptr [hexdo3]
	fistp dword ptr [esp]
	mov eax, dword ptr [esp]

	call _wypisz_z_precyzja
	loop ptl
	
	add esp, 4

	pop edi
	pop esi
	pop ebx
	pop ebp
	ret
_potegowanie_e ENDP
END
