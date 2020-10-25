clear all;
close all;
clc;


xn = input("Enter the sequence 1: ");
hn = input("Enter the sequence 2: ");

LinearConv = linearConvolution(xn, hn);
lengthOfCircConv = max(length(xn), length(hn));

circularConv = zeros(1,lengthOfCircConv);

for index = 0:length(LinearConv)-1
    index1 = mod(index, lengthOfCircConv) + 1;
    circularConv(index1) = circularConv(index1) + LinearConv(index + 1);
end

disp("Circular Convolution using Linear Convolution is: ");
disp(circularConv);