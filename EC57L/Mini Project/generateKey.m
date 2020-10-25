function Key = generateKey(sizeOfImage, xn, r)
K1 = logisticMap(sizeOfImage, xn, r);
K2 = LFSR(K1);
Key = bitxor(K1, K2);
end