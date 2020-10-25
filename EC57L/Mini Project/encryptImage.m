image = imread("image.jpg");
imageBW = rgb2gray(image);

R = image(:,:,1);
G = image(:,:,2);
B = image(:,:,3);

sizeOfImage = size(imageBW);
xn = 0.9532;
r = 3.9455;

Key = uint8(generateKey(sizeOfImage, xn, r));


allBlack = zeros(sizeOfImage);

justRed = cat(3, R, allBlack, allBlack);
justGreen = cat(3, allBlack, G, allBlack);
justBlue = cat(3, allBlack, allBlack, B);

encryptedRed = cat(3, bitxor(R, Key), allBlack, allBlack);
encryptedGreen = cat(3, allBlack, bitxor(G, Key), allBlack);
encryptedBlue = cat(3, allBlack, allBlack, bitxor(B, Key));

encryptedImage = encryptedRed + encryptedGreen + encryptedBlue;
encryptedImage = bitxor(image, Key);


figure;
subplot(1, 2, 1);
imshow(Key);
subplot(1, 2, 2);
imshow(encryptedImage);

figure;
subplot(2, 3, 1);
imshow(justRed);
subplot(2, 3, 2);
imshow(justGreen);
subplot(2, 3, 3);
imshow(justBlue);
subplot(2, 3, 4);
imshow(encryptedRed);
subplot(2, 3, 5);
imshow(encryptedGreen);
subplot(2, 3, 6);
imshow(encryptedBlue);