clear all;
close all;
clc;


xn = input("Enter the first sequence: ");
hn = input("Enter the second sequence: ");

length_of_xn = length(xn);
length_of_hn = length(hn);

linearConvLength = length_of_xn + length_of_hn - 1;

xn = [xn zeros(1, linearConvLength - length_of_xn)];
hn = [hn zeros(1, linearConvLength - length_of_hn)];

linearConv = circularConvolution(xn, hn).';

disp("x(n) and h(n) after making their length equal to length of Linear Conv. sequence");
disp("x(n):");
disp(xn);
disp("h(n)");
disp(hn);

disp("Linear Convolution calculated using Circular Convolution is: ");
disp(linearConv);

%% PLOTS

widthOfLine = 1;

xAxis = 0:length(linearConv)-1;
% subplot(1, 2, 1);
localY = abs(linearConv);
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("k \rightarrow", "Amplitude", "Linear Convolution of $$ x(n) $$ with $$ h(n) $$ using Circular Convolution");
for index = xAxis
    localY1 = localY(index + 1);
    text(index, localY1, strcat("\leftarrow", num2str(round(localY1, 1))));
end