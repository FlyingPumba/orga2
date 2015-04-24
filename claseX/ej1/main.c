/* ************************************************************************* */
/* Organizacion del Computador II                                            */
/*                                                                           */
/*   main: Archivo principal para la solucion del trabajo practico 2         */
/*                                                                           */
/* ************************************************************************* */

#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
 
 
#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include "bmp.h"

void suma_por_filas(int *mat, int *mat_res, int w, int h){
	for (int c=0;c<w;c++){
		mat_res[c]=0;
		for (int j=0;j<h;j++){
			mat_res[c]+= mat[c*(w)+j];
		}
	}
}

void print_matrix(int *mat, int w, int h){
		
	printf("\n");
	
	for (int i=0;i<h;i++){
		for (int j=0;j<w;j++){
			printf("%d,",mat[i*w+j]);
		}
		printf("\n");
	}
		printf("\n");
	
}



//~ void solo_verde(uint8_t * data){
extern  void solo_verde(uint8_t * data);
	//~ for (int i=0;i<512;i++){
		//~ for (int j=0;j<512;j++){ 
			//~ data[i*512*3+j*3]=0 ;			// B
			//~ data[i*512*3+j*3+2]=0;		// R
		//~ }
	//~ }	
//~ }

 
int main(){
 
	char * fname = "lena.bmp";
	char * fname_output = "lena_output.bmp";
	
	BMP* bmp1n = bmp_read(fname);
	BMP* bmpNEW = bmp_copy(bmp1n, 1);
	
	
	uint8_t* data1n = bmp_get_data(bmpNEW);
	
	//~ solo_verde( data1n , 512 );
	solo_verde( data1n);
	//~ solo_rojo( data1n , 512 );
	
 
	
	bmp_save(fname_output, bmpNEW);
	
	return 0;
}
