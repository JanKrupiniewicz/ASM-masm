.686
.model flat
extern _GetSystemDirectoryA@8 : PROC
extern _GetCurrentDirectoryA@8 : PROC
extern __write : PROC
extern _malloc : PROC
extern _free : PROC
public _check_system_dir
.data

.code
get_current_dir PROC
	pusha

	mov ebx, 256
	push eax
	call _malloc
	mov esi, eax
	add esp, 4

	push eax
	push ebx
	call _GetCurrentDirectoryA@8

	push eax
	push esi
	push 1
	call __write
	add esp, 12

	push esi
	call _free
	add esp, 4

	popa
	ret
get_current_dir ENDP

_check_system_dir PROC
	push ebp
	mov ebp, esp
	push esi

	call get_current_dir

	mov esi, [ebp + 8]
	push 256
	push esi
	call _GetSystemDirectoryA@8
	
	pop esi
	pop ebp
	ret
_check_system_dir ENDP
END