// #include <stdio.h>

// int main()
// {
//     int x, h; // variables to store length of sequences

//     printf("Enter length of x(n): ");
//     scanf("%d", &x); // Getting length of x(n)

//     printf("\nEnter the lenth of h(n): ");
//     scanf("%d", &h); // Getting length of h(n)

//     // Initiallising the variables to store sequences
//     int i, k, xn[100], hn[100], yn[199];

//     for (i = 0; i <= x + h - 1; i++)
//     {
//         yn[i] = 0;
//     }

//     printf("\nEnter x(n): ");
//     for (i = 0; i < x; i++)
//     {
//         scanf("%d", &xn[i]); // Getting the sequence x(n)
//     }

//     printf("\nEnter h(n): ");
//     for (i = 0; i < h; i++)
//     {
//         scanf("%d", &hn[i]); // Getting the sequence h(n)
//     }

//     printf("\nEntered h(n): ");
//     for (i = 0; i < h; i++)
//     {
//         printf("%d ", hn[i]); // Printing the sequence h(n)
//     }
//     printf("\nEntered x(n): ");
//     for (i = 0; i < x; i++)
//     {
//         printf("%d ", xn[i]); // Printing the sequence h(n)
//     }

//     for (i = 0; i < h + x - 1; i++)
//     {
//         yn[i] = 0;
//         for (k = 0; k <= i; k++)
//         {
//             yn[i] = yn[i] + (xn[k] * hn[i - k]); // Calculating Convolution using summation
//         }
//     }

//     //displaying the o/p
//     for (i = 0; i < x + h - 1; i++)
//     {
//         printf("\nThe Value of output y[%d]=%d", i, yn[i]); // Displaying the Values
//     }

//     printf("\n\n");
//     return 0;
// }

#include <stdio.h>

int x[15], h[15], y[15];

int main()
{
    int i, j, m, n;

    printf("Enter length of x(n): ");
    scanf("%d", &m);
    printf("\nEnter the lenth of h(n): ");
    scanf("%d", &n);

    printf("\nEnter x(n): ");

    for (i = 0; i < m; i++)
    {
        scanf("%d", &x[i]);
    }

    printf("\nEnter h(n): ");
    for (i = 0; i < n; i++)
    {
        scanf("%d", &h[i]);
    }


    for (i = 0; i < m + n - 1; i++)
    {
        y[i] = 0;
        for (j = 0; j <= i; j++)
        {
            y[i] = y[i] + (x[j] * h[i - j]);
        }
    }

    //displaying the o/p
    for (i = 0; i < m + n - 1; i++)
    {
        printf("The Value of output y[%d]=%d\n", i, y[i]);
    }
    printf("\n\n");
}