function A = toeplitzDSP(xn, hn)

length_of_xn = length(xn);
length_of_hn = length(hn);
dimensions = length_of_xn + length_of_hn - 1;

number_of_zeros = dimensions - length_of_hn;

z = [hn(1) zeros(1,number_of_zeros)];
A = toeplitz([hn zeros(1,number_of_zeros)],z);
end