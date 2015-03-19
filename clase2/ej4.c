#include <stdio.h>

extern int suma_parametros(int, int, int, int, int, int, int, int);
int main(){
	int a1 = 6;
	int a2 = 5;
	int a3 = 8;
	int a4 = 7;
	int a5 = 10;
	int a6 = 8;
	int a7 = 8;
	int a8 = 9;
    // a1 - a2 + a3 - a4 + a5 - a6 + a7 - a8
    // 1 + 1 + 2 - 1
    // 3
	printf("%d\n", suma_parametros(a1, a2, a3, a4, a5, a6, a7, a8));
	return 0;
}
