clear all;
close all;
clc

sequence = input("Enter a 'Real' sequence: ");
N = length(sequence);

n = 1:N;

x(n) = sequence;    % INPUT SEQUENCE
X = dft(x);         % DFT OF INPUT SEQUENCE

x1 = reverse(x);    % REVERSED INPUT SEQUENCE x(-n)
X1 = conj(dft(x1));;  % DFT OF CONJUGATE OF INPUT SEQUENCE


disp("x(n) is: ");
disp(x);

disp("DFT of x(n) ==> X(k)")
disp(X);

disp("X(-n) is: ");
disp(x1);

disp("Conjugate of DFT of x(-n) ==> X*(-k)N");
disp(X1);

if round(X,2) == round(X1,2)
    disp("The Sequence is Conjugate Symmetric");
else
    disp("The Sequence is not Conjugate Symmetric");
end