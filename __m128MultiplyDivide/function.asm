.686
.XMM
.model flat
public _dziel, _mnoz
.data
zmienna_pom dq 2 dup(?)

.code
_mnoz PROC
	push ebp
	mov ebp, esp
	push ebx
	push esi
	push edi
	
	finit 
	fld dword ptr [ebp + 16]
	fst dword ptr [zmienna_pom]
	fst dword ptr [zmienna_pom + 4]
	fst dword ptr [zmienna_pom + 8]
	fstp dword ptr [zmienna_pom + 12]

	mov esi, [ebp + 8]					; tablica
	mov ecx, [ebp + 12]					; iterator 

	petla_mnoz:
	movups xmm5, [esi]
	mulps xmm5, xmmword ptr zmienna_pom
	movups [esi], xmm5
	add esi, 16
	loop petla_mnoz

	pop edi
	pop esi
	pop ebx
	pop ebp
	ret
_mnoz ENDP

_dziel PROC
	push ebp
	mov ebp, esp
	push ebx
	push esi
	push edi

	finit
	fld dword ptr [ebp+16]					; dzielnik
	fst dword ptr [zmienna_pom]
	fst dword ptr [zmienna_pom + 4]
	fst dword ptr [zmienna_pom + 8]
	fstp dword ptr [zmienna_pom + 12]

	mov esi, [ebp + 8]						; tablica __m128
	mov ecx, [ebp + 12]						; wielkosc tablicy
	petla:
	movups xmm5, [esi]
	divps xmm5, xmmword ptr zmienna_pom
	movups [esi], xmm5
	add esi, 16
	loop petla

	pop edi
	pop esi
	pop ebx
	pop ebp
	ret
_dziel ENDP
END

