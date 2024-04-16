all: flex gcc 
	@echo "Done."

flex: EZScanner.l
	flex EZScanner.l

gcc: lex.yy.c
	gcc lex.yy.c -lfl

clean:
	rm *.c *.out