clear all;
close all;
clc;


xn = input("Enter the sequence 1: ");
hn = input("Enter the sequence 2: ");

LinearConv = linearConvolution(xn, hn).';
lengthOfCircConv = max(length(xn), length(hn));

circularConv = zeros(1,lengthOfCircConv);

for index = 0:length(LinearConv)-1
    index1 = mod(index, lengthOfCircConv) + 1;
    circularConv(index1) = circularConv(index1) + LinearConv(index + 1);
end

disp("Linear Convolution of x(n) with h(n) is: ");
disp(LinearConv);

disp("Circular Convolution using Linear Convolution is: ");
disp(circularConv);


%% PLOTS

widthOfLine = 1;

xAxis = 0:length(LinearConv)-1;
subplot(1, 2, 1);
localY = abs(LinearConv);
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("k \rightarrow", "Amplitude", "Linear Convolution of $$ x(n) $$ with $$ h(n) $$");
for index = xAxis
    localY1 = localY(index + 1);
    text(index, localY1, strcat("\leftarrow", num2str(round(localY1, 1))));
end

xAxis = 0:length(circularConv)-1;
subplot(1, 2, 2);
localY = abs(circularConv);
stem(xAxis, localY, "r", "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("k \rightarrow", "Amplitude", "Circular Convolution of $$ x(n) $$ with $$ h(n) $$");
for index = xAxis
    localY1 = localY(index + 1);
    text(index, localY1, strcat("\leftarrow", num2str(round(localY1, 1))));
end