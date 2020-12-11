% Loading Image
% encryptedImage = imread("./Results/encrypted.bmp");
encryptedImage = imread("./Results/encrypted.jpg");
% encryptedImage = imread("./Results/encrypted.png");
startDecryptImage(encryptedImage);

function decryptedImage = startDecryptImage(encryptedImage)
    % Decryption Parameters
    sizeOfImage = size(encryptedImage(:,:,1));
    % xn = 0.9532;
    xn = 0.9532;
    r = 3.9455;
    
    % Generating the key
    Key = uint8(generateKey(sizeOfImage, xn, r));
    
    % Decrypting the image
    decryptedImage = bitxor(encryptedImage, Key);
    imwrite(decryptedImage, "./Results/decrypted.png")
    imwrite(decryptedImage, "./Results/decrypted.jpeg")
    
    figure;
    imshow(decryptedImage);
end

