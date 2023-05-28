NOME = maior_numero

all: $(NOME).o
	ld -s -o $(NOME) $(NOME).o
	rm -rfv *.o

%.o: %.asm
	nasm -f elf64 $<
