#Zichun Yuan
#BY SUBMITTING THIS FILE AS PART OF MY LAB ASSIGNEMNT, I CERTIFY THAT ALL OF THE CODE FOUND
#WITHIN THIS FILE WAS CREATED BY ME WITH NO ASSISTANCE FROM ANY PERSON OTHER THAN THE 
#INSTRUCTOR OF THIS COURSE OR ONE OF OUR UNDERGRADUATE GRADERS. I WROTE THIS CODE BY HAND,
#IT IS NOT MACHINE GENERATED OR TAKEN FROM MACHINE GENERATED CODE.

.file "evaluate.s"	#optional directive
.section .rodata	#required directives for rodata
.output1:
	.string "evaluate: using range %i to evaluate \"%s\". \n"
.output2:
	.string "evaluate: found %i words in \"%s\" using range %i. \n"
.data			#required for read write file scope data
.globl evaluate		#required directive for every function
	.type evaluate, @function #required directive

.text
evaluate:
	pushq %rbp		#setup stack frame
	movq %rsp, %rbp		#setup stack frame
	
	pushq %r12		#save the register before use
	pushq %r13		#save the register before use
	pushq %r14		#save the register before use

	movq %rdi, %r12		#make a copy of the string
	movq %rsi, %r13		#make a copy of the range

	movq %rdi, %rdx		#put the search string in the output string
	movq $.output1, %rdi	#construct output string
	movq $0, %rax		#to keep ABI happy
	call print		#print the message

	movq %r12, %rdi		#restore the original string
	movq %r13, %rsi		#restore the original range
	call count		#get the words count

	movq %rax, %r14		#make a copy of the count return value
	
	movq $.output2, %rdi	#construct output string
	movq %r14, %rsi		#put the count return value in the output string
	movq %r12, %rdx		#put the string	
	movq %r13, %rcx		#put the range	
	movq $0, %rax		#to keep ABI happy
	call print		#print the message

	movq %r14, %rax		#restore the count return value

	popq %r14		#restore the old register value
	popq %r13		#restore the old register value
	popq %r12		#restore the old register value

	leave			#roll the stack frame		
	ret			#return
	.size evaluate, .-evaluate #required directive













