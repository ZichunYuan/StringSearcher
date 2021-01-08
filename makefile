# AU20 Lab 6 makefile Copyright 2020 Neil Kirby Do not remove this comment
# Name: Zichun Yuan
#




# print how many "words" in different strings!
lab6: lab6main.o search.s evaluate.s count.s 
	gcc -g -m64 -o lab6 lab6main.o print.o count.s evaluate.s search.s
	
# evaluate function that uses count function to print how many "words" in a string
evaluate: evalmain.o count.s evaluate.s
	gcc -g -m64 -o evaluate evalmain.o print.o count.s evaluate.s

# count function that counts how many "words" in a string
count: countmain.o count.s
	gcc -g -m64 -o count countmain.o print.o count.s


# you need to add an entry to build your zipfile
# you should be experts at this by now.
lab6.zip: count evaluate lab6 README_LAB6 makefile
	zip lab6.zip *.h *.c *.s *.o README_LAB6 makefile




#students ignore this entry, it's how I built the zip file of goodies 
l6_stuff.zip : makefile *.txt lab6main.c evalmain.c countmain.c lab6.h print.o
	zip $@ $^




# this is our master compiler rule to generate .o files.
# It needs all 4 warnings

%.o:%.c *.h
	gcc -ansi -pedantic -Wimplicit-function-declaration -Wreturn-type -g -c $< -o $@


