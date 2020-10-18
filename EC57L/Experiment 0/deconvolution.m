function [deconv, A_transpose_A] = deconvolution (A,yn)
A_transpose_A = A'*A
deconv = inv(A_transpose_A)*A'*yn
end