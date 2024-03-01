.686
.model flat
extern _ExitProcess@4 : PROC
extern _GetUserNameA@8 : PROC
extern __write: PROC

public _main
.data
nazwa_uzytkownika db 100 dup(?)
rozmiar dd 100

.code
_main PROC
		
	xor eax, eax
	xor ebx, ebx
	
	mov ax, 0FFFFh		; Ustawiamy wartoœæ w rejestrze AX na maksymaln¹ liczbê 16-bitow¹ (wszystkie bity ustawione na 1)
	add ax, 1h			; Dodajemy 1 do wartoœci w AX
						; Po tej instrukcji flaga przeniesienia (CF) bêdzie ustawiona, poniewa¿ nast¹pi³ overflow przy dodawaniu 1 do maksymalnej wartoœci 16-bitowej

	adc bx,	0			; Dodajemy 0 (bez przeniesienia) do wartoœci w BX z uwzglêdnieniem flagi przeniesienia
						; Jeœli CF by³o wczeœniej ustawione, dodajemy dodatkowo 1 (carry) do wartoœci w BX


	
	push dword PTR OFFSET rozmiar
	push dword PTR OFFSET nazwa_uzytkownika
	call _GetUserNameA@8

	push dword PTR rozmiar
	push dword PTR OFFSET nazwa_uzytkownika
	push dword PTR 1
	call __write
	add esp, 12

	push 0
	call _ExitProcess@4
_main ENDP
END