.686
.model flat

public _silnia
.data

.code

_nwd_liczb PROC
		
		ret
_nwd_liczb ENDP

_fibonacci PROC
		push ebp
		mov ebp, esp

		push ebx
		push edi
		push esi

		mov eax, [ebp + 8]
		cmp eax, 2
		ja dalej_fib
		mov eax, 1
		jmp koniec_fib

	dalej_fib:
		
		mov ebx, eax
		dec ebx

		push ebx
		call _fibonacci
		pop ebx

		mov edi, eax
		; add eax, ebx

		dec ebx
		push ebx
		call _fibonacci
		pop ebx

		add eax, edi 
		; add eax, ebx 

	koniec_fib:

		pop esi
		pop edi
		pop ebx
		pop ebp
		ret
_fibonacci ENDP

_silnia PROC
		push ebp
		mov ebp, esp

		push ebx
	
		mov eax, [ebp + 8]
		cmp eax, 1
		jne dalej
		mov eax, 1
		jmp koniec
	dalej:

		mov ebx, eax
		dec ebx

		push ebx
		call _silnia
		pop ebx

		inc ebx
		mul ebx

	koniec:

		pop ebx
		pop ebp
		ret
_silnia ENDP
END
