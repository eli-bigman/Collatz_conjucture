SECTION .bss
var resd 255

SECTION .data
msg: db "Please enter a number", 0xa
cal: db "Calculating ...", 0xa
msglen equ $- msg
callen equ $- cal

SECTION .text
	global _start
_start:
	mov eax, msg
	mov edi, 22
	call sprintlng

	mov edx, 255
	mov ecx, var
	mov ebx, 2
	mov eax, 3
	int 80h

	mov eax, cal
	mov edi, callen
	call sprintlng
	mov eax, var
	call str2int
	call collatz


	call quit

quit:
	mov eax, 1
	mov ebx, 0
	int 80h


collatz:
	mov ebx, 0
	mov esi, 0
	call intprint

.lp:
	cmp eax, 1
	jle .done

	push eax
	call EorO

	cmp eax, 1
	je	.odd
	jmp .even

.even:
	pop eax
	mov edx, 0
	mov esi, 2
	idiv esi
	call intprint
	jmp .lp

.odd:
	pop eax
	mov ebx, 3
	imul ebx
	add eax, 1
	call intprint
	jmp .lp


	
.done:
	ret


sprint:
	push eax
	push ebx
	push ecx
	push edx

	mov edx, 1
	mov ecx, eax
	mov ebx, 1
	mov eax, 4
	int 80h

	pop edx
	pop ecx
	pop ebx
	pop eax
	ret

intprint:
	push eax
	push ebx
	push ecx
	push edx

	mov ecx, 0

.divlp:
	mov edx, 0
	mov esi, 10
	idiv esi
	add edx, 48
	push edx
	inc ecx
	cmp eax, 0
	jz .printlp
	jmp .divlp

.printlp:
	cmp ecx, 0
	jz .restore
	mov eax, esp
	call sprint
	pop edx
	dec ecx
	jmp .printlp


.restore:
	call nwln
	pop edx
	pop ecx
	pop ebx
	pop eax
	ret
	


nwln:
	push eax
	mov eax, 0xa
	push eax
	mov eax, esp
	call sprint
	pop eax
	pop eax
	ret


EorO:
	mov edx, 0
	mov esi, 2
	idiv esi
	mov eax, edx
	ret

str2int:
	mov esi, eax
	mov ecx, 0
	mov eax, 0


.multiplylp:
	xor ebx, ebx
	mov bl, [esi + ecx]


	cmp bl, 48
	jl .finaldiv
	cmp bl, 57
	jg .finaldiv

	sub bl, 48
	add  eax, ebx
	mov ebx, 10
	mul ebx
	inc ecx
	jmp .multiplylp
	
.finaldiv:
	cmp ecx, 0	
	je .restore
	mov esi, 10
	idiv esi
	
.restore:
	ret

sprintlng:
	push eax
	push ebx
	push ecx
	push edx

	mov edx, edi
	mov ecx, eax
	mov ebx, 1
	mov eax, 4
	int 80h

	pop edx
	pop ecx
	pop ebx
	pop eax
	ret
	
