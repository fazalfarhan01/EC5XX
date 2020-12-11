clear all;
close all;
clc;

image = imread("input.jpg");

% Converting to single channel image from 3 channels (RGB=>BW)
% imageBW = rgb2gray(image);

% Separating out the 3 channels of the Color Image
R = image(:,:,1);
G = image(:,:,2);
B = image(:,:,3);

% Getting image size and declaring the encoding parameters
sizeOfImage = size(R);
xn = 0.9532;
r = 3.9455;

% Generating the key
Key = uint8(generateKey(sizeOfImage, xn, r));

% Generating an all 0 (black) to show the separated out channels
allBlack = zeros(sizeOfImage);

% Showing the separate channel Un-Encoded pictures
justRed = cat(3, R, allBlack, allBlack);
justGreen = cat(3, allBlack, G, allBlack);
justBlue = cat(3, allBlack, allBlack, B);

% Showing the separate channel Encoded pictures
encryptedRed = cat(3, bitxor(R, Key), allBlack, allBlack);
encryptedGreen = cat(3, allBlack, bitxor(G, Key), allBlack);
encryptedBlue = cat(3, allBlack, allBlack, bitxor(B, Key));

% Either of these techniques work
% Separate out the channels and encrypt and combine
% Else use BROADCASTING in MATLAB to directly generate key
% BROADCASTING method works better.

% encryptedImage = encryptedRed + encryptedGreen + encryptedBlue;
encryptedImage = bitxor(image, Key);

% Writing the images to disk
imwrite(Key,"./Results/key.png");
imwrite(encryptedImage, "./Results/encrypted.png");
imwrite(encryptedImage, "./Results/encrypted.jpg");
imwrite(encryptedImage, "./Results/encrypted.bmp");
% Un-Encrypted Images (Separated Channels)
imwrite(justRed, "./Results/justRed.png");
imwrite(justBlue, "./Results/justBlue.png");
imwrite(justGreen, "./Results/justGreen.png");
% Encrypted Images (Separated Channels)
imwrite(encryptedRed, "./Results/encryptedRed.png");
imwrite(encryptedBlue, "./Results/encryptedBlue.png");
imwrite(encryptedGreen, "./Results/encryptedGreen.png");

% Show the images
figure;
subplot(1, 3, 1);
imshow(image);
subplot(1, 3, 2);
imshow(Key);
subplot(1, 3, 3);
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