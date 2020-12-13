// #include <stdio.h>
// #include <math.h>
// int r[20];
// const float PI = 3.1416;
// int i[20];
// int main(void)
// {
// 	int N, m, n, a, b;
// 	float p, q;
// 	printf("Enter the value of n: ");
// 	scanf("%d", &n);
// 	printf("Enter the size of X(K): ");
// 	scanf("%d", &N);
// 	printf("Enter the sequence X(K): ");

// 	for (m = 0; m < N; m++)
// 	{
// 		scanf("%d %d", &r[m], &i[m]);
// 	}

// 	printf("Entered sequence X(K) is \n");
// 	for (m = 0; m < N; m++)
// 	{
// 		printf("%d + j%d\n", r[m], i[m]);
// 	}
// 	printf("IDFT of the sequence X(K) is: \n");
// 	for (a = 0; a < n; a++)
// 	{
// 		p = 0;
// 		q = 0;
// 		for (b = 0; b < N; b++)
// 		{
// 			p = p + ((r[b] * cos(PI * b * a / N)) + (i[b] * (sin(PI * b * a / N))));
// 			q = q + ((r[b] * (-sin(PI * b * a / N))) + (i[b] * cos(PI * b * a / N)));
// 		}
// 		printf("%.2f+i%.2f\n", p / N, q / N);
// 	}
// 	return 0;
// }

#include<stdio.h>
#include<math.h>
/*
 * main.c
 */

int main(void) {
	int N,k,n,i;
	float pi=3.1416,sumre=0,sumim=0,out_real[8]={0,0},out_imag[8]={0,0};
	int x[32];
	printf("Enter the length of sequence: ");
	scanf("%d", &N);
	printf("Enter the sequence: ");
	for(i=0;i<N;i++){
		scanf("%d",&x[i]);
	}
	for(k=0;k<N;k++){
		sumre=0;
		sumim=0;
		for(n=0;n<N;n++){
			sumre=sumre+x[n]*cos(2*pi*k*n/N);
			sumim=sumim-x[n]*sin(2*pi*k*n/N);
		}
		out_real[k]=sumre;
		out_imag[k]=sumim;
		printf("x([%d])=\t%f\t+\t%fj\n",k,out_real[k]/8,-out_imag[k]/8);
	}

	return 0;
}
