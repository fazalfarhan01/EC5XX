#include <stdio.h>
int x[20], h[20], y[7];
int main(void)
{
    int i, j, m, n, N;
    printf("Enter the size of x(n): ");
    scanf("%d", &m);
    printf("Enter the size of h(n): ");
    scanf("%d", &n);
    printf("Enter the values of x(n): ");
    for (i = 0; i < m; i++)
    {
        scanf("%d", &x[i]);
    }
    printf("Enter the values of h(n): ");
    for (i = 0; i < n; i++)
    {
        scanf("%d", &h[i]);
    }
    N = m > n ? m : n;
    // Zero Padding the sequences
    for (i = m; i < N; i++)
    {
        x[i] = 0;
    }
    for (i = n; i < N; i++)
    {
        h[i] = 0;
    }
    // Circ Conv
    for (i = 0; i < N; i++)
    {
        for (j = 0; j <= N; j++)
        {
            y[(i + j) % N] = y[(i + j) % N] + (x[i] * h[j]);
        }
    }
    for (i = 0; i < N; i++)
    {
        printf("y[%d]=\t%d\n",i, y[i]);
    }
    return 0;
}
