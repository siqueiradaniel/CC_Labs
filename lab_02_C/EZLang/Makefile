all: bison flex gcc

bison: parser.y
	bison parser.y

flex: scanner.l
	flex scanner.l

gcc: scanner.c parser.c
	gcc -Wall scanner.c parser.c -ly

clean: 
	rm *.h *.c *.out 