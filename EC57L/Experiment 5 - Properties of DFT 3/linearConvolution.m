function yn = linearConvolution(xn, hn)
    yn = toeplitzDSP(xn, hn)*xn';
end