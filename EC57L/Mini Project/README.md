# Image Encryption and Decryption using Chaotic Pseudo Random Sequence
## Steps Involved
 - Creation of the Encryption Key using Logistic Map Function.
 - Encrypting the Image file using the generated key.
## Introduction
### What's an Image?
 - An image can be thought of as a rectangle whose area is made up of small squares called pixels. Color images consist of three layers: a red layer, a green layer, and a blue layer. Imagine splitting a green leaf on a white background into the three channels. As you see below, the leaf is present in all three channels. The layers not only determine color, but also brightness.
 - Black and white images can be represented in grids of pixels. Each pixel has a value that corresponds to its brightness. The values span from 0 - 255, for an 8-bit image, from black to white.
    - BW = (0.3R) + (0.59  G) + (0.11  B)

## Key Generation
 - Now, that we want to encrypt this 8 bit gray-scale image, we need to generate an encryption key. The encryption key works as a mask over the original image. For an image of dimensions M x N, we need an encryption key with a total of M*N values. To do this, we are using the Logistic Map function. This function can create pseudo random sequences using the following equation.

    - x(n+1)=rx(n)( 1-x(n) )

 - Plotting a graph of this function, with x-axis parameter as r with a value from 2 to 4, and y-axis as a function of r. It can be observed on the y-axis that the output will lie between 0 and 1, with high degree of randomness as we increase r. By choosing a value of r near 4, we will obtain values with high degree of randomness.

 - Now we use this function to generate a matrix of size equal to the size of the image. Then we convert it to a 8-bit binary number by multiplying it with 255 and rounding it off to the nearest integer value. Thus producing the sequence K1.

 - The generated sequence is then converted to its equivalent binary form and then passed through a linear feedback shift register, to generate another set of sequence - K2. This is then XORed with sequence K1 to produce the final key.
## Encrypting the Image
Now that we have our key, the image has to be encrypted. Firstly, we convert the image to its equivalent binary form. Then the key is XORed with the Image to produce the encrypted image.
## Decrypting the image
The process of decrypting the image is fairly simple. In order to do so. We firstly we have to know the values of r and x(n) used to encrypt the image. Then we must also know the LFSR sequence to generate the sequence K2, then we have to regenerate the encryption key, and then XOR it with the encrypted image to produce the decrypted image.
## Block Diagram

## Conclusion
This LFSR method provides cryptographically better results as compared to methods that encrypt using just the logistic map alone.
The encrypted image is highly uncorrelated and visually just noise.
The LFSR provides a more secure way of encrypting the image.

## References
Advances in Electronics, Computers and Communications - Published in October 2014.
Egwald Mathematics: Nonlinear Dynamics: The Logistic Map and Chaos, by Elmer G. Wiens
