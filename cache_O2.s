	.file	"cache_lab.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	allocate_matrix
	.type	allocate_matrix, @function
allocate_matrix:
.LFB39:
	.cfi_startproc
	endbr64
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movsx	r12, edi
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	lea	rdi, 0[0+r12*8]
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	sub	rsp, 8
	.cfi_def_cfa_offset 64
	call	malloc@PLT
	mov	QWORD PTR matrix[rip], rax
	test	rax, rax
	je	.L5
	mov	r13, r12
	test	r12d, r12d
	jle	.L4
	mov	rbx, rax
	lea	rbp, 0[0+r12*4]
	mov	r14d, r12d
	xor	r15d, r15d
	.p2align 4,,10
	.p2align 3
.L7:
	mov	rdi, rbp
	call	malloc@PLT
	mov	QWORD PTR [rbx+r15*8], rax
	test	rax, rax
	je	.L5
	mov	ecx, r15d
	.p2align 4,,10
	.p2align 3
.L6:
	mov	edx, ecx
	mov	esi, ecx
	add	ecx, 1
	add	rax, 4
	imul	rdx, rdx, 1374389535
	shr	rdx, 37
	imul	edx, edx, 100
	sub	esi, edx
	mov	DWORD PTR -4[rax], esi
	cmp	ecx, r14d
	jne	.L6
	add	r15, 1
	add	r14d, 1
	cmp	r12, r15
	jne	.L7
.L4:
	mov	DWORD PTR current_size[rip], r13d
	mov	eax, 1
.L1:
	add	rsp, 8
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret
.L5:
	.cfi_restore_state
	xor	eax, eax
	jmp	.L1
	.cfi_endproc
.LFE39:
	.size	allocate_matrix, .-allocate_matrix
	.p2align 4
	.globl	free_matrix
	.type	free_matrix, @function
free_matrix:
.LFB40:
	.cfi_startproc
	endbr64
	mov	rdi, QWORD PTR matrix[rip]
	test	rdi, rdi
	je	.L24
	mov	eax, DWORD PTR current_size[rip]
	push	rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	test	eax, eax
	jle	.L17
	xor	ebx, ebx
	.p2align 4,,10
	.p2align 3
.L19:
	mov	rdi, QWORD PTR [rdi+rbx*8]
	add	rbx, 1
	call	free@PLT
	cmp	DWORD PTR current_size[rip], ebx
	mov	rdi, QWORD PTR matrix[rip]
	jg	.L19
.L17:
	call	free@PLT
	pop	rbx
	.cfi_def_cfa_offset 8
	mov	QWORD PTR matrix[rip], 0
	mov	DWORD PTR current_size[rip], 0
	ret
	.p2align 4,,10
	.p2align 3
.L24:
	.cfi_restore 3
	ret
	.cfi_endproc
.LFE40:
	.size	free_matrix, .-free_matrix
	.p2align 4
	.globl	traverse_row_major
	.type	traverse_row_major, @function
traverse_row_major:
.LFB41:
	.cfi_startproc
	endbr64
	movsx	rax, DWORD PTR current_size[rip]
	test	eax, eax
	jle	.L31
	mov	rdi, QWORD PTR matrix[rip]
	lea	r8, 0[0+rax*4]
	xor	edx, edx
	lea	r9, [rdi+rax*8]
	.p2align 4,,10
	.p2align 3
.L29:
	mov	rax, QWORD PTR [rdi]
	lea	rsi, [r8+rax]
	.p2align 4,,10
	.p2align 3
.L30:
	movsx	rcx, DWORD PTR [rax]
	add	rax, 4
	add	rdx, rcx
	cmp	rsi, rax
	jne	.L30
	add	rdi, 8
	cmp	rdi, r9
	jne	.L29
	mov	rax, rdx
	ret
.L31:
	xor	edx, edx
	mov	rax, rdx
	ret
	.cfi_endproc
.LFE41:
	.size	traverse_row_major, .-traverse_row_major
	.p2align 4
	.globl	traverse_column_major
	.type	traverse_column_major, @function
traverse_column_major:
.LFB42:
	.cfi_startproc
	endbr64
	movsx	rax, DWORD PTR current_size[rip]
	test	eax, eax
	jle	.L37
	mov	r8, QWORD PTR matrix[rip]
	lea	r9, 0[0+rax*4]
	xor	esi, esi
	xor	edx, edx
	lea	rdi, [r8+rax*8]
	.p2align 4,,10
	.p2align 3
.L35:
	mov	rax, r8
	.p2align 4,,10
	.p2align 3
.L36:
	mov	rcx, QWORD PTR [rax]
	add	rax, 8
	movsx	rcx, DWORD PTR [rcx+rsi]
	add	rdx, rcx
	cmp	rdi, rax
	jne	.L36
	add	rsi, 4
	cmp	r9, rsi
	jne	.L35
	mov	rax, rdx
	ret
.L37:
	xor	edx, edx
	mov	rax, rdx
	ret
	.cfi_endproc
.LFE42:
	.size	traverse_column_major, .-traverse_column_major
	.p2align 4
	.globl	measure_time
	.type	measure_time, @function
measure_time:
.LFB43:
	.cfi_startproc
	endbr64
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	mov	r12, rdi
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	mov	rbp, rsi
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	call	clock@PLT
	mov	rbx, rax
	xor	eax, eax
	call	r12
	mov	QWORD PTR 0[rbp], rax
	call	clock@PLT
	pxor	xmm0, xmm0
	sub	rax, rbx
	pop	rbx
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	cvtsi2sd	xmm0, rax
	pop	r12
	.cfi_def_cfa_offset 8
	divsd	xmm0, QWORD PTR .LC0[rip]
	mulsd	xmm0, QWORD PTR .LC1[rip]
	ret
	.cfi_endproc
.LFE43:
	.size	measure_time, .-measure_time
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"\n--- Matrix Size: %d x %d ---\n"
	.align 8
.LC3:
	.string	"Failed to allocate matrix of size %d\n"
	.align 8
.LC4:
	.string	"Row-major:    %.2f ms (sum: %lld)\n"
	.align 8
.LC5:
	.string	"Column-major: %.2f ms (sum: %lld)\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC7:
	.string	"Ratio (col/row): %.2fx\n"
	.section	.rodata.str1.8
	.align 8
.LC8:
	.string	"WARNING: Sums don't match! Check your implementations."
	.text
	.p2align 4
	.globl	run_test
	.type	run_test, @function
run_test:
.LFB44:
	.cfi_startproc
	endbr64
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	mov	ecx, edi
	mov	edx, edi
	xor	eax, eax
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	lea	rsi, .LC2[rip]
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	mov	ebx, edi
	mov	edi, 2
	sub	rsp, 16
	.cfi_def_cfa_offset 48
	call	__printf_chk@PLT
	mov	edi, ebx
	call	allocate_matrix
	test	eax, eax
	je	.L65
	call	clock@PLT
	mov	rbx, rax
	movsx	rax, DWORD PTR current_size[rip]
	test	eax, eax
	jle	.L56
	mov	rsi, QWORD PTR matrix[rip]
	lea	rdi, 0[0+rax*4]
	xor	ebp, ebp
	lea	r8, [rsi+rax*8]
	.p2align 4,,10
	.p2align 3
.L44:
	mov	rax, QWORD PTR [rsi]
	lea	rcx, [rdi+rax]
	.p2align 4,,10
	.p2align 3
.L45:
	movsx	rdx, DWORD PTR [rax]
	add	rax, 4
	add	rbp, rdx
	cmp	rcx, rax
	jne	.L45
	add	rsi, 8
	cmp	r8, rsi
	jne	.L44
.L43:
	call	clock@PLT
	pxor	xmm0, xmm0
	sub	rax, rbx
	cvtsi2sd	xmm0, rax
	divsd	xmm0, QWORD PTR .LC0[rip]
	mulsd	xmm0, QWORD PTR .LC1[rip]
	movsd	QWORD PTR [rsp], xmm0
	call	clock@PLT
	mov	r12, rax
	movsx	rax, DWORD PTR current_size[rip]
	test	eax, eax
	jle	.L57
	mov	rdi, QWORD PTR matrix[rip]
	lea	r8, 0[0+rax*4]
	xor	ecx, ecx
	xor	ebx, ebx
	lea	rsi, [rdi+rax*8]
	.p2align 4,,10
	.p2align 3
.L47:
	mov	rax, rdi
	.p2align 4,,10
	.p2align 3
.L48:
	mov	rdx, QWORD PTR [rax]
	add	rax, 8
	movsx	rdx, DWORD PTR [rdx+rcx]
	add	rbx, rdx
	cmp	rsi, rax
	jne	.L48
	add	rcx, 4
	cmp	r8, rcx
	jne	.L47
.L46:
	call	clock@PLT
	pxor	xmm0, xmm0
	mov	rdx, rbp
	lea	rsi, .LC4[rip]
	sub	rax, r12
	mov	edi, 2
	cvtsi2sd	xmm0, rax
	divsd	xmm0, QWORD PTR .LC0[rip]
	mov	eax, 1
	mulsd	xmm0, QWORD PTR .LC1[rip]
	movsd	QWORD PTR 8[rsp], xmm0
	movsd	xmm0, QWORD PTR [rsp]
	call	__printf_chk@PLT
	movsd	xmm0, QWORD PTR 8[rsp]
	mov	rdx, rbx
	lea	rsi, .LC5[rip]
	mov	edi, 2
	mov	eax, 1
	call	__printf_chk@PLT
	movsd	xmm1, QWORD PTR [rsp]
	pxor	xmm0, xmm0
	comisd	xmm1, xmm0
	ja	.L66
	cmp	rbp, rbx
	jne	.L67
.L51:
	mov	rdi, QWORD PTR matrix[rip]
	test	rdi, rdi
	je	.L41
	mov	eax, DWORD PTR current_size[rip]
	test	eax, eax
	jle	.L53
	xor	ebx, ebx
	.p2align 4,,10
	.p2align 3
.L55:
	mov	rdi, QWORD PTR [rdi+rbx*8]
	add	rbx, 1
	call	free@PLT
	cmp	DWORD PTR current_size[rip], ebx
	mov	rdi, QWORD PTR matrix[rip]
	jg	.L55
.L53:
	call	free@PLT
	mov	QWORD PTR matrix[rip], 0
	mov	DWORD PTR current_size[rip], 0
.L41:
	add	rsp, 16
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	pop	rbx
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
.L67:
	.cfi_restore_state
	lea	rdi, .LC8[rip]
	call	puts@PLT
	jmp	.L51
.L66:
	movsd	xmm0, QWORD PTR 8[rsp]
	mov	edi, 2
	mov	eax, 1
	lea	rsi, .LC7[rip]
	divsd	xmm0, xmm1
	call	__printf_chk@PLT
	cmp	rbp, rbx
	je	.L51
	jmp	.L67
.L65:
	add	rsp, 16
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	mov	edx, ebx
	mov	edi, 2
	pop	rbx
	.cfi_def_cfa_offset 24
	lea	rsi, .LC3[rip]
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	jmp	__printf_chk@PLT
.L57:
	.cfi_restore_state
	xor	ebx, ebx
	jmp	.L46
.L56:
	xor	ebp, ebp
	jmp	.L43
	.cfi_endproc
.LFE44:
	.size	run_test, .-run_test
	.section	.rodata.str1.1
.LC9:
	.string	"Cache Behavior Lab"
.LC10:
	.string	"=================="
	.section	.rodata.str1.8
	.align 8
.LC11:
	.string	"Comparing row-major vs column-major matrix traversal"
	.section	.rodata.str1.1
.LC13:
	.string	"\n=================="
.LC14:
	.string	"Tests complete."
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB45:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	lea	rdi, .LC9[rip]
	push	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	sub	rsp, 40
	.cfi_def_cfa_offset 64
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 24[rsp], rax
	xor	eax, eax
	mov	rbx, rsp
	lea	rbp, 16[rsp]
	call	puts@PLT
	lea	rdi, .LC10[rip]
	call	puts@PLT
	lea	rdi, .LC11[rip]
	call	puts@PLT
	movdqa	xmm0, XMMWORD PTR .LC12[rip]
	movaps	XMMWORD PTR [rsp], xmm0
.L69:
	mov	edi, DWORD PTR [rbx]
	add	rbx, 4
	call	run_test
	cmp	rbx, rbp
	jne	.L69
	lea	rdi, .LC13[rip]
	call	puts@PLT
	lea	rdi, .LC14[rip]
	call	puts@PLT
	mov	rax, QWORD PTR 24[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L73
	add	rsp, 40
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	xor	eax, eax
	pop	rbx
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
.L73:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE45:
	.size	main, .-main
	.globl	current_size
	.bss
	.align 4
	.type	current_size, @object
	.size	current_size, 4
current_size:
	.zero	4
	.globl	matrix
	.align 8
	.type	matrix, @object
	.size	matrix, 8
matrix:
	.zero	8
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1093567616
	.align 8
.LC1:
	.long	0
	.long	1083129856
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC12:
	.long	1000
	.long	2000
	.long	4000
	.long	8000
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
