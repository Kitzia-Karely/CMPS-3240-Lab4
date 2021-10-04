	.file	"fact.c"
	.text
	.section	.rodata 
.LC0:
	.string	"10th Fibonacci number is %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$10, -4(%rbp) /* VARIABLE A */
	movl	$0, -8(%rbp) /* first fib value (n1)*/ 
    movl    $1, -12(%rbp) /* second fib value (n2)*/

.L2:
	movl	-8(%rbp), %eax /*first fib value */
    movl    -12(%rbp), %ecx /*second fib value*/

    
    movl    %ecx, -8(%rbp) /* n2 -> n1*/
    
    addl    %eax, %ecx
    movl    %ecx, -12(%rbp) /* old n1 + old n2 -> n1*/

	subl	$1, -4(%rbp) 
    /* subl -4(%rbp) -4(%rbp) -1

     Set up expression
     1) 
     2) Set RHS =0 A-1 > 0
     3) Carries out expr*/
	cmpl	$1, -4(%rbp)
	jge	.L2

	movl	-8(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
