all: parser flex gcc 
	@echo "Done."

parser: parser.y
	bison parser.y

flex: scanner.l
	flex scanner.l

gcc: parser.c scanner.c 
	gcc -Wall parser.c scanner.c -ly

clean:
	rm *.c *.h *.out

