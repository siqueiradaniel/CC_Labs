all: parser scanner gcc
	@echo "DONE."

parser: parser.y
	bison parser.y 

scanner: scanner.l
	flex scanner.l

gcc: parser.c scanner.c 
	gcc -Wall parser.c scanner.c -ly

clean:
	rm *.c *.h *.out