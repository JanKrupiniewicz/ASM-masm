.686
.model flat
extern _malloc : PROC
extern _free : PROC
extern _strtoll : PROC

public _convert_to_array
.data
system_base equ 10

.code
_convert_to_array PROC
		push ebp
		mov ebp, esp
		push ebx
		push esi
		push edi

		mov esi, [ebp + 8]
		lea sei, [ebp - 4]

		push 255 * 8 
		call _malloc
		add esp, 4

		mov ebx, eax
		xor ecx, ecx

	conver:
		push ecx
		push system_base
		push 
		call _strtoll

		pop ecx

		jmp conver

		pop edi
		pop esi
		pop ebx
		pop ebp
		ret
_convert_to_array ENDP
END