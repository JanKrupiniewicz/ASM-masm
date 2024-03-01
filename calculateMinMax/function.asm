.686
.XMM
.model flat
public _szybki_max, _szybki_min
.data

.code
_szybki_max PROC
	push ebp
	mov ebp, esp
	push ebx
	push edi
	push esi
	
	mov esi, [ebp + 8]
	mov edi, [ebp + 12]
	mov ebx, [ebp + 16]
	xor ecx, ecx

	szukaj_max:
	movups xmm5, [esi + 4*ecx]
	movups xmm6, [edi + 4*ecx]
	maxps xmm5, xmm6
	movups [ebx], xmm5

	add ebx, 16
	add ecx, 4
	cmp ecx, [ebp + 20]
	jb szukaj_max


	pop esi
	pop edi
	pop ebx
	pop ebp
	ret
_szybki_max ENDP

_szybki_min PROC
	push ebp
	mov ebp, esp
	push ebx
	push edi
	push esi
	
	mov esi, [ebp + 8]
	mov edi, [ebp + 12]
	mov ebx, [ebp + 16]
	xor ecx, ecx

	szukaj_min:
	movups xmm5, [esi + 4*ecx]
	movups xmm6, [edi + 4*ecx]
	minps xmm5, xmm6
	movups [ebx], xmm5

	add ebx, 16
	add ecx, 4
	cmp ecx, [ebp + 20]
	jb szukaj_min


	pop esi
	pop edi
	pop ebx
	pop ebp
	ret
_szybki_min ENDP
END