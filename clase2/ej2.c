#include <stdio.h>

extern double sumar(double, double);
int main(){
	double a = 5.3;
	double b = 3.2;
	//cin >> a;
	//cin >> b;
	printf("%5.2f\n", sumar(a,b));
	return 0;
}
