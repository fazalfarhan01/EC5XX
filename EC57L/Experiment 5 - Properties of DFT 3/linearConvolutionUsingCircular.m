xn = input("Enter the first sequence: ");
hn = input("Enter the second sequence: ");

length_of_xn = length(xn);
length_of_hn = length(hn);

linearConvLength = length_of_xn + length_of_hn - 1;

xn = [xn zeros(1, linearConvLength - length_of_xn)];
hn = [hn zeros(1, linearConvLength - length_of_hn)];

linearConv = circularConvolution(xn, hn);

disp("Linear Convolution calculated using Circular Convolution is: ");
disp(linearConv);