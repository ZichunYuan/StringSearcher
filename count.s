#Zichun Yuan
#BY SUBMITTING THIS FILE AS PART OF MY LAB ASSIGNEMNT, I CERTIFY THAT ALL OF THE CODE FOUND
#WITHIN THIS FILE WAS CREATED BY ME WITH NO ASSISTANCE FROM ANY PERSON OTHER THAN THE 
#INSTRUCTOR OF THIS COURSE OR ONE OF OUR UNDERGRADUATE GRADERS. I WROTE THIS CODE BY HAND,
#IT IS NOT MACHINE GENERATED OR TAKEN FROM MACHINE GENERATED CODE.

.file "count.s"	#optional directive
.section .rodata	#required directives for rodata

Array_decimal:		#Array for range 0, 0-9
.byte 48		#ASCII value of decimal 0	
.byte 57		#ASCII value of decimal 9	
Array_upper:		#Array for range 2, A-Z
.byte 65		#ASCII value of character A
.byte 90		#ASCII value of character Z
Array_lower:		#Array for range 1, a-z
.byte 97		#ASCII value of character a	
.byte 122		#ASCII value of character z

.data			#required for read write file scope data
.globl count		#required directive for every function
	.type count, @function #required directive

.text
count:
	pushq %rbp		#setup stack frame
	movq %rsp, %rbp		#setup stack frame

	movq $Array_decimal, %rax	#store the array into register for cmov
	movq $Array_upper, %r8		#store the array into register for cmov
	movq $Array_lower, %r9		#store the array into register for cmov


	cmpb $0, %sil		#to set the mode if range is 0
	cmove %rax, %rdx	#store the comparison array 
	cmpb $1, %sil		#to set the mode if range is 1
	cmove %r8, %rdx		#store the comparison array 
	cmpb $2, %sil		#to set the mode if range is 2
	cmove %r9, %rdx		#store the comparison array 

	movq $0, %r8		#set up the variable that store the last condition
	movq $0, %r9		#set up the variable that store the current condition
	movq $0, %rcx		#set up the scratch pad for compare
	movq $0, %rax		#set up the variable that store the counts

	movq $0, %r10		#set up the variable for first condition
	movq $0, %r11		#set up the variable for second condition
	
loop_start:	
	movq (%rdx), %rcx	#compare the lower bound	
	cmpb %cl, (%rdi)	#do the first comparison
	setge %r10b		#first condition set
	
	incq %rdx		#compare the upper bound
	movq (%rdx), %rcx	#move the value to the scratch pad for compare	
	cmpb %cl, (%rdi)	#perform the second comparison
	setle %r11b		#second condition set

	addq %r10, %r11		#see if the current condition is true
	cmpq $2, %r11		#see if the current condition is true
	sete %r9b		#set the current condition!

	xorq %rcx, %rcx		#clear the scratch pad for use
	cmpq %r8, %r9		#determine if we found a new word
	setg %cl		#set if a new word found
	
	addq %rcx, %rax		#update the return value

	movq %r9, %r8		#set the last condition to current
	decq %rdx		#reset the array back to origin
	xorq %r10, %r10		#reset the first condition back to origin
	xorq %r11, %r11		#reset the second condition back to origin

	incq %rdi		#update the char 	
	cmpb $0, (%rdi) 	#see if null is reached
	jne loop_start		#loop again if null is not reached

loop_end:
	leave			#roll the stack frame		
	ret			#return
	.size count, .-count #required directive












