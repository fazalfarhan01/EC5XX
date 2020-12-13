// Code for corelation of two sequences

#include <stdio.h>

int x[20], h[20], y[20], z[20];

int main()
{
    int i, j, m, n;

    printf("Enter length of x(n): ");
    scanf("%d", &m); // Getting Length of x(n)
    printf("\nEnter the length of h(n): ");
    scanf("%d", &n); // Getting Length of h(n)

    printf("\nEnter x(n): ");

    for (i = 0; i < m; i++)
    {
        scanf("%d", &x[i]); // Getting x(n)
    }

    printf("\nEnter h(n): ");
    for (i = n - 1; i >= 0; i--)
    {
        scanf("%d", &h[i]); // Getting h(n)
    }

    for (i = 0; i < m + n - 1; i++)
    {
        y[i] = 0;
        for (j = 0; j <= i; j++)
        {
            y[i] = y[i] + (x[j] * h[i - j]); // Calculating Co relation
        }
    }

    //displaying the o/p
    for (i = 0; i < m + n - 1; i++)
    {
        printf("y[%d]=%d\n", i, y[i]); // Printing it to STDOUT
    }
    printf("\n");
}
