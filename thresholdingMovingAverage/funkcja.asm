.686
.model flat
extern _malloc : PROC
extern _free : PROC

public _uint48_float, _progowanie_sredniej_kroczacej, _single_neuron
.data
dzielnik dd 10000h
minus_hex dd -16
jeden dd 1.0
dwa dd 2.0

.code
_progowanie_sredniej_kroczacej PROC
	push ebp
	mov ebp, esp
	push ebx
	push edi
	push esi

	mov esi, [ebp + 8]		; adres tablicy
	mov ebx, [ebp + 16]		; zmienna m
	inc ebx

	mov eax, [ebp + 12]
	mov edx, 4
	mul edx
	add eax, 8
	push eax
	call _malloc
	add esp, 4
	mov edi, eax			; tablica d-word na srednie
	mov eax, dword ptr 0
	mov [edi], eax
	mov [edi + 4], eax

	finit
	mov ecx, dword ptr 1
	licz_srednie:
	fld dword ptr [esi + 4*ecx - 4]
	fld qword ptr [edi]
	fadd
	fst qword ptr [edi]
	push ecx
	fild dword ptr [esp]
	add esp, 4
	fdiv
	fstp dword ptr [edi + 4*ecx + 4]

	inc ecx
	cmp ecx, ebx
	jne licz_srednie
	
	fld dword ptr [edi + 4*ecx]

	push edi
	call _free
	add esp, 4

	pop esi
	pop edi
	pop ebx
	pop ebp
	ret
_progowanie_sredniej_kroczacej ENDP

_uint48_float PROC
	push ebp
	mov ebp, esp
	finit

	fild qword ptr [ebp+8]
	fidiv dword ptr dzielnik

	pop ebp
	ret
_uint48_float ENDP
END