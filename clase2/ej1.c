#include <stdio.h>

extern int sumar(int, int);
int main(){
	int a = 5;
	int b = 3;
	//cin >> a;
	//cin >> b;
	printf("%d\n", sumar(a,b));
	return 0;
}
