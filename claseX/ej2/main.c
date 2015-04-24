/* ************************************************************************* */
/* Organizacion del Computador II                                            */
/*                                                                           */
/*   main: Archivo principal para la solucion del trabajo practico 2         */
/*                                                                           */
/* ************************************************************************* */

#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>

void print_matrix_short(short *mat, int w, int h){
		
	printf("\n");
	
	for (int i=0;i<h;i++){
		for (int j=0;j<w;j++){
			printf("%d,",mat[i*w+j]);
		}
		printf("\n");
	}
		printf("\n");
}

void print_matrix_byte(char *mat, int w, int h){
		
	printf("\n");
	
	for (int i=0;i<h;i++){
		for (int j=0;j<w;j++){
			printf("%d,",mat[i*w+j]);
		}
		printf("\n");
	}
		printf("\n");
	
}



 
int main(){
 
	char *format ='i=%d';
	int h=8;
	int w=8;
	char mat[h*w];
	
	short * mat_res;
	short * mat_res2;
	
	// Caso1: Cargo cada elemento de la matriz con el numero de fila
	for (int i=0;i<h;i++) for (int j=0;j<w;j++) mat[i*w+j]=i;
	for (int i=0;i<w;i++) mat[i] = 255;
	
	mat_res = suma_por_filas(mat,w,h);	
	print_matrix_byte(mat,w,h);
	print_matrix_short(mat_res,w,1);
	 
		
	// Cargo cada elemento de la matriz con el numero de columna
	for (int i=0;i<h;i++) for (int j=0;j<w;j++) mat[i*w+j]=j;

	mat_res2 = suma_por_filas(mat,w,h);	
	print_matrix_byte(mat,w,h);
	print_matrix_short(mat_res2,w,1);
	
	
	// Libero memoria dinamica
	free(mat_res);
	free(mat_res2);
	return 0;
}
