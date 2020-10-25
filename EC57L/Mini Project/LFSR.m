function K2 = LFSR(K1)
    K2 = K1;
    for index = 1:numel(K1)
        K1Binary = de2bi(K1(index), 8);
        % XOR of bit 8, 6, 5, 1 with 1 being LSB
        K2Binary = circshift(K1Binary, 1);
        K2Binary(1) = xor(K1Binary(2), xor(K1Binary(3), xor(K1Binary(4), K1Binary(1))));
        K2(index) = bi2de(K2Binary);
    end
end