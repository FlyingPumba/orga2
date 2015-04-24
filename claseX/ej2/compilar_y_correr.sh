#/bin/bash
nasm  -f elf64 -g -F DWARF funcs.asm -o funcs.o && c99 -Wextra -pedantic -O0 -ggdb -lm -std=c99  funcs.o main.c -o main && ./main
