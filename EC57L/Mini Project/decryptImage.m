% Loading Image
% encryptedImage = imread("encrypted.png");
% decryptImage(encryptedImage);

function decryptedImage = decryptImage(encryptedImage)
    % Decryption Parameters
    sizeOfImage = size(encryptedImage(:,:,1));
    xn = 0.9532;
    r = 3.9455;
    
    % Generating the key
    Key = uint8(generateKey(sizeOfImage, xn, r));
    
    % Decrypting the image
    decryptedImage = bitxor(encryptedImage, Key);
    
    figure;
    imshow(decryptedImage);
end

