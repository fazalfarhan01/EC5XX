clear all;
close all;
clc

% sequence = input("Enter the sequence: ");
% m = input("Enter the number of shifts: ");

sequence = [4 -4 5 -5];
m = 2;

N = length(sequence);

n = 1:N;
k = n;
xAxis = n - 1;
widthOfLine = 1;

x(n) = sequence;

DFT(k) = dft(x(n));
disp("Input Sequence:");
disp(sequence);
disp("DFT of the input sequence is:");
disp(DFT(k));

shiftedDFT(k) = dft(x(circshift(n, m)));
disp("Circularly Shifted Signal:");
disp(x(circshift(n, m)));
disp("DFT of circularly shifted signal:");
disp(shiftedDFT);

shiftedUsingProperty(k) = DFT * (exp(-i * 2 * pi * (k - 1) * m / N) .* eye(N));
disp("DFT of circularly shifted signal using property:");
disp(shiftedUsingProperty);

% DFT of signal

subplot(3, 2, 1);
localY = abs(DFT.');
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("n \rightarrow", "Amplitude", "DFT of $$ x(n) $$");
text(xAxis, localY, strcat("\leftarrow", num2str(round(localY, 1))));
grid on;

subplot(3, 2, 2);
localY = angle(round(DFT.', 5)) * 180 / pi;
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("n \rightarrow", "Phase (°)", "DFT of $$ x(n) $$");
text(xAxis, localY, strcat("\leftarrow", num2str(round(localY, 1))));
grid on;

% DFT of shifted signal

subplot(3, 2, 3);
localY = abs(shiftedDFT.');
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("n \rightarrow", "Amplitude", "DFT of $$ x(n+m) $$");
text(xAxis, localY, strcat("\leftarrow", num2str(round(localY, 1))));
grid on;

subplot(3, 2, 4);
localY = angle(round(shiftedDFT.', 5)) * 180 / pi;
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("n \rightarrow", "Phase (°)", "DFT of $$ x(n+m) $$");
text(xAxis, localY, strcat("\leftarrow", num2str(round(localY, 1))));
grid on;

% DFT of shifted signal using property

subplot(3, 2, 5);
localY = abs(shiftedUsingProperty.');
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("n \rightarrow", "Amplitude", "DFT of $$ x(n+m) $$ using property");
text(xAxis, localY, strcat("\leftarrow", num2str(round(localY, 1))));
grid on;

subplot(3, 2, 6);
localY = angle(round(shiftedUsingProperty.', 5)) * 180 / pi;
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("n \rightarrow", "Phase (°)", "DFT of $$ x(n+m) $$ using property");
text(xAxis, localY, strcat("\leftarrow", num2str(round(localY, 1))));
grid on;
