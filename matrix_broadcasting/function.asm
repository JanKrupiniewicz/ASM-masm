.686
.model flat
extern _malloc : PROC

public _broadcasting
.data

.code
_broadcasting PROC
	push ebp
	mov ebp, esp
	push ebx
	push esi
	push edi

	push 300
	call _malloc
	add esp, 4
	mov ebx, eax			; macierz Wynikowa double
 
	mov esi, [ebp + 8]		; macierz A float
	mov edi, [ebp + 12]		; macierz V int

	xor edx, edx
	ptl1:

	xor eax, eax
	ptl2:

	push eax
	push edx
	mul dword ptr [ebp + 20]
	pop edx

	push edx
	add edx, edx
	add edx, edx
	lea edx, [edx + 4*eax]
	fld dword ptr [esi + edx]
	pop edx

	pop eax

	fild dword ptr [edi + 4*eax]
	fadd
	
	push eax
	push edx
	mul dword ptr [ebp + 20]
	pop edx

	push edx
	add edx, edx
	add edx, edx
	add edx, edx
	lea edx, [edx + 8*eax]
	fstp qword ptr [ebx + edx]
	pop edx

	pop eax

	inc eax
	cmp eax, [ebp + 16]
	jb ptl2

	inc edx
	cmp edx, [ebp + 20]
	jb ptl1

	mov eax, ebx

	pop edi
	pop esi
	pop ebx
	pop ebp
	ret	
_broadcasting ENDP
END