#Zichun Yuan
#BY SUBMITTING THIS FILE AS PART OF MY LAB ASSIGNEMNT, I CERTIFY THAT ALL OF THE CODE FOUND
#WITHIN THIS FILE WAS CREATED BY ME WITH NO ASSISTANCE FROM ANY PERSON OTHER THAN THE 
#INSTRUCTOR OF THIS COURSE OR ONE OF OUR UNDERGRADUATE GRADERS. I WROTE THIS CODE BY HAND,
#IT IS NOT MACHINE GENERATED OR TAKEN FROM MACHINE GENERATED CODE.

.file "search.s"	#optional directive
.section .rodata	#required directives for rodata
.output:
	.string "search: \"%s\" has the most words using range %i with %i found. \n"
.data			#required for read write file scope data
.globl search		#required directive for every function
	.type search, @function #required directive

.text
search:
	pushq %rbp		#setup stack frame
	movq %rsp, %rbp		#setup stack frame

	pushq %rbx		#save the register before use
	pushq %r12		#save the register before use
	pushq %r13		#save the register before use
	pushq %r14		#save the register before use
	
	movq $0, %rbx		#initialize the best pointer to NULL
	movq $-1, %r12		#initialize the best count to -1
	movq %rdx, %r13		#make a copy of the range 
	movq %rsi, %r14		#initialize the index from high to low
	decq %r14		#get the upper bound index
	movq %rdi, %r15		#make a copy of the string table
	
loop:
	movq (%r15,%r14,8),%rdi 	#load the first parameter for evaluate
	movq %r13, %rsi 	#load the second parameter for evaluate
	call evaluate		#get the highest count 

	movq (%r15,%r14,8),%rdi		#temporary pointer holder
	cmpq %r12, %rax		#find the best count
	cmovg %rax, %r12	#update best count if smaller	
	cmovg %rdi, %rbx	#update the best pointer if smaller

	decq %r14		#update the index
	jns loop		#loop again if not out of range

	movq $.output, %rdi	#print the output message
	movq %rbx, %rsi		#print the string
	movq %r13, %rdx		#print the range
	movq %r12, %rcx		#print the count
	xorq %rax, %rax		#to keep ABI happy
	call print		#output message

	movq %rbx, %rax		#load the return value
	
	popq %r14		#restore the old register value
	popq %r13		#restore the old register value
	popq %r12		#restore the old register value
	popq %rbx		#restore the old register value

	leave			#roll the stack frame		
	ret			#return
	.size search, .-search	#required directive












