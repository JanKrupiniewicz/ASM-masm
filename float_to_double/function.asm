.686
.model flat
public _float_to_double
.data
zmienna dd -1.025 ; WPROWADZ DOWOLNA WARTOSC

.code
_float_to_double PROC
	push ebp
	mov ebp, esp

	sub esp, 32

	push ebx
	push esi
	push edi

	mov esi, ebp
	sub esi, 32
	mov eax, dword ptr zmienna 
	shl eax, 1
	shr eax, 24
	sub eax, 127
	add eax, 1023
	shl eax, 20 
	bt zmienna, 31
	jz dodatnia
	bts eax, 31
	jmp dalej
	dodatnia:
	btr eax, 31

	dalej:
	mov ebx, dword ptr zmienna
	and ebx, 00EFFFFFh
	shr ebx, 3
	and eax, 0FFF00000h
	or eax, ebx

	mov ebx, dword ptr zmienna
	and ebx, 00000007h
	shl ebx, 29

	mov [esi], ebx
	mov [esi + 4], eax

	finit
	fld dword ptr zmienna
	fld qword ptr [esi]

	pop edi
	pop esi
	pop ebx

	add esp, 32
	pop ebp
	ret
_float_to_double ENDP
END
