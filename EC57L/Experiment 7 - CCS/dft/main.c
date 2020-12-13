#include <stdio.h>
#include <math.h>
int main()
{
    int sequence[8];
    const float pi = 3.1415;
    int numberOfPointsOfDFT, index, lengthOfsequence, index2;
    float realPart, imaginaryPart;
    printf("Enter the value of N: ");
    scanf("%d", &numberOfPointsOfDFT); // Number of DFT points to calculate

    printf("\nEnter the size of x(n): ");
    scanf("%d", &lengthOfsequence); // Length of x(n)

    printf("\nEnter the sequence x(n):");
    for (index = 0; index < lengthOfsequence; index++)
    {
        scanf("%d", &sequence[index]); // Getting x(n)
    }
    for (index = lengthOfsequence; index < numberOfPointsOfDFT; index++)
    {
        sequence[index] = 0; // 0 Padding
    }
    printf("DFT of the sequence x(n) is:\n");

    for (index = 0; index < numberOfPointsOfDFT; index++)
    {
        realPart = 0;
        imaginaryPart = 0;
        for (index2 = 0; index2 < lengthOfsequence; index2++)
        {
            realPart = realPart + (sequence[index2] * cos(2 * pi * index2 * index / numberOfPointsOfDFT));
            imaginaryPart = imaginaryPart + (sequence[index2] * sin(2 * pi * index2 * index / numberOfPointsOfDFT));
        }
        if (imaginaryPart < 0)
        {
            printf("%.2f +", realPart);
            printf("%.2f j\n", -imaginaryPart);
        }
        else
        {
            printf("%.2f -", realPart);
            printf("%.2f j\n", imaginaryPart);
        }
    }
    return 0;
}
