#include <stdio.h>

extern void imprimir_parametros(int, double, char*);
int main(){
	int a = 5;
	double b = 3.2;
	imprimir_parametros(a, b, "pepito pepe");
	return 0;
}
