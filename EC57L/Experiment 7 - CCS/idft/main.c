#include <stdio.h>
#include <math.h>
int r[20];
const float PI = 3.1416;
int i[20];
int main(void)
{
	int N, m, n, a, b;
	float p, q;
	printf("Enter the value of n: ");
	scanf("%d", &n);
	printf("Enter the size of X(K): ");
	scanf("%d", &N);
	printf("Enter the sequence X(K): ");

	for (m = 0; m < N; m++)
	{
		scanf("%d %d", &r[m], &i[m]);
	}

	printf("Entered sequence X(K) is \n");
	for (m = 0; m < N; m++)
	{
		printf("%d + j%d\n", r[m], i[m]);
	}
	printf("IDFT of the sequence X(K) is: \n");
	for (a = 0; a < n; a++)
	{
		p = 0;
		q = 0;
		for (b = 0; b < N; b++)
		{
			p = p + ((r[b] * cos(PI * b * a / N)) + (i[b] * (sin(PI * b * a / N))));
			q = q + ((r[b] * (-sin(PI * b * a / N))) + (i[b] * cos(PI * b * a / N)));
		}
		printf("%.2f+i%.2f\n", p / N, q / N);
	}
	return 0;
}
