public suma_siedmiu_liczb
.data

.code
suma_siedmiu_liczb PROC
	push rbp
	mov rbp, rsp
	push rsi

	xor rax, rax
	; PIERWSZE 4 ARGUMENTY PRZEKAZYWANE PRZEZ rcx, rdx, r8, r9
	add rax, rcx
	add rax, rdx
	add rax, r8
	add rax, r9

	; MUSIMY WZIAC POD UWAGE OBSZAR TZW Shadow Space
	add rax, [rbp + 32 + 16]
	add rax, [rbp + 32 + 24]
	add rax, [rbp + 32 + 32]

	pop rsi
	pop rbp
	ret
suma_siedmiu_liczb ENDP
END