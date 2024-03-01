.686
.model flat
public _sortowanie

.code
_sortowanie PROC
	push ebp
	mov ebp, esp
	push esi
	push edi
	push ebx

	mov esi, [ebp + 8]
	mov ecx, [ebp + 12]
	sub ecx, 1

	sort1:	
	push ecx

	xor ecx, ecx
	sort2:
	mov eax, [esi + 8*ecx]
	mov edx, [esi + 8*ecx + 4]

	mov ebx, [esi + 8*ecx + 8]
	mov edi, [esi + 8*ecx + 12]

	cmp edx, edi
	jb sort_dalej
	je porownuj_dalej

	mov [esi + 8*ecx + 8], eax
	mov [esi + 8*ecx + 12], edx

	mov [esi + 8*ecx], ebx
	mov [esi + 8*ecx + 4], edi

	jmp sort_dalej

	porownuj_dalej:
	cmp eax, ebx
	jbe sort_dalej
	mov [esi + 8*ecx + 8], eax
	mov [esi + 8*ecx], ebx

	sort_dalej:

	inc ecx
	cmp ecx, [ebp + 12]
	jb sort2

	pop ecx
	loop sort1

	pop ebx
	pop edi
	pop esi
	pop ebp
	ret
_sortowanie ENDP
END