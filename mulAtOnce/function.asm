.686
.model flat
.XMM
public _objetosc_stozka, _mul_at_once
.data
	trzy dd 3.0

.code
_mul_at_once PROC
	push ebp
	mov ebp, esp
	push ebx
	push esi
	push edi
	
	mov esi, [ebp + 8]		; tab1
	mov edi, [ebp + 12]		; tab2
	mov ecx, [ebp + 16]		; rozmiar tablic
	
	mnozenie_tab:
	movups xmm5, [esi]
	movups xmm6, [edi]
	mulps xmm5, xmm6
	movups [esi], xmm5

	add esi, 16
	add edi, 16
	loop mnozenie_tab

	pop edi
	pop esi
	pop ebx
	pop ebp
	ret
_mul_at_once ENDP

_objetosc_stozka PROC
	push ebp
	mov ebp, esp
	push ebx
	push esi
	push edi
	
	finit
	fild dword ptr [ebp + 8] 
	fmul st(0), st(0)
	fild dword ptr [ebp + 8] 
	fimul dword ptr [ebp + 12]
	fild dword ptr [ebp + 12]
	fimul dword ptr [ebp + 12]
	fadd
	fadd
	fldpi
	fld dword ptr [ebp + 16]
	fmul
	fmul
	fdiv dword ptr [trzy]

	pop edi
	pop esi
	pop ebx
	pop ebp
	ret
_objetosc_stozka ENDP
END