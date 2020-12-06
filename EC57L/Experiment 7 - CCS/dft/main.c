#include <stdio.h>
#include <math.h>
#define PI 3.1415
int x[8];
int main()
{
    int N, m, n, a, b;
    float r, i;
    printf("Enter the value of N: ");
    scanf("%d", &N); // Number of DFT points to calculate

    printf("\nEnter the size of x(n): ");
    scanf("%d", &n); // Length of x(n)

    printf("\nEnter the sequence x(n):");
    for (m = 0; m < n; m++)
    {
        scanf("%d", &x[m]); // Getting x(n)
    }
    for (m = n; m < N; m++)
    {
        x[m] = 0; // 0 Padding
    }
    printf("DFT of the sequence x(n) is:\n");

    for (a = 0; a < N; a++)
    {
        r = 0;
        i = 0;
        for (b = 0; b < n; b++)
        {
            r = r + (x[b] * cos(2 * PI * b * a / N));
            i = i + (x[b] * sin(2 * PI * b * a / N));
        }
        printf("%.2f - (%.2f j)\n", r, i);
    }
    return 0;
}
