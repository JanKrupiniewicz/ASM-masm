.686
.model flat
extern _malloc : PROC
extern _free : PROC
public _single_neuron, _objetsc_stozka
.data
trzy dd 3.0

.code
_objetsc_stozka PROC
	push ebp
	mov ebp, esp
	push ebx
	push esi
	push edi
	
	mov esi, [ebp + 8]		; R
	mov edi, [ebp + 12]		; r
	mov ebx, [ebp + 16]		; h
	
	finit
	fldpi
	fld dword ptr [trzy]
	fdiv
	fld dword ptr [ebx]
	fmul

	fld dword ptr [esi]
	fmul dword ptr [esi]
	fld dword ptr [esi]
	fmul dword ptr [edi]
	fld dword ptr [edi]
	fmul dword ptr [edi]
	fadd
	fadd
	fmul

	pop edi
	pop esi
	pop ebx
	pop ebp
	ret
_objetsc_stozka ENDP

_single_neuron PROC
	push ebp
	mov ebp, esp
	push ebx
	push esi
	push edi

	push 4
	call _malloc
	add esp, 4

	mov esi, [ebp + 8]			; tablica x zmiennych 
	mov edi, [ebp + 12]			; tablica w wag
	mov ecx, [ebp + 16]			; ilosc zmiennych

	finit
	fldz

	xor ebx, ebx
	licz_srednia:
	fld qword ptr [esi + 8*ebx]
	fld dword ptr [edi + 4*ebx]
	fmul
	fadd

	inc ebx
	loop licz_srednia

	fldz
	fxch
	fcomi st(0), st(1)
	jb jest_zero
	fst dword ptr [eax]
	jmp srednia_koniec

	jest_zero:
	mov dword ptr [eax], 0

	srednia_koniec:

	pop edi
	pop esi
	pop ebx
	pop ebp
	ret
_single_neuron ENDP
END
