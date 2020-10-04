clear all;
close all;
clc;

sequence = input("Enter the input sequence: ");


N = length(sequence);
n = 1:N;
k = n;
xAxis = n-1;
widthOfLine = 1.5;


DFT(k) = dft(sequence(n));
shiftedDFT(k) = dft(sequence(mod(N+n,N+1)+1));

disp("DFT of x(n): ");
disp(DFT.');

disp("DFT of x(n+N): ");
disp(shiftedDFT.');

figure('Name','Using manually coded functions !')

subplot(2,2,1);
localY = abs(DFT.');
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("n \rightarrow", "Amplitude", "DFT of $$ x(n) $$");
text(xAxis, localY, strcat("\leftarrow", num2str(round(localY, 1))));
grid on;

subplot(2, 2, 2);
localY = angle(round(DFT.',5))*180/pi;
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("n \rightarrow", "Phase (°)", "DFT of $$ x(n) $$");
text(xAxis, localY, strcat("\leftarrow", num2str(round(localY, 1))));
grid on;

subplot(2,2,3);
localY = abs(shiftedDFT.');
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("n \rightarrow", "Amplitude", "DFT of $$ x(n+N) $$");
text(xAxis, localY, strcat("\leftarrow", num2str(round(localY, 1))));
grid on;

subplot(2, 2, 4);
localY = angle(round(shiftedDFT.',5))*180/pi;
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("n \rightarrow", "Phase (°)", "DFT of $$ x(n+N) $$");
text(xAxis, localY, strcat("\leftarrow", num2str(round(localY, 1))));
grid on;


% Using builtin functions

DFT(k) = fft(sequence(n));
shiftedDFT(k) = fft(sequence(mod(N+n,N+1)+1));

disp("DFT of x(n): ");
disp(DFT.');

disp("DFT of x(n+N): ");
disp(shiftedDFT.');

figure('Name','Using builtin matlab functions !')

subplot(2,2,1);
localY = abs(DFT.');
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("n \rightarrow", "Amplitude", "DFT of $$ x(n) $$");
text(xAxis, localY, strcat("\leftarrow", num2str(round(localY, 1))));
grid on;

subplot(2, 2, 2);
localY = angle(round(DFT.',5))*180/pi;
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("n \rightarrow", "Phase (°)", "DFT of $$ x(n) $$");
text(xAxis, localY, strcat("\leftarrow", num2str(round(localY, 1))));
grid on;

subplot(2,2,3);
localY = abs(shiftedDFT.');
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("n \rightarrow", "Amplitude", "DFT of $$ x(n+N) $$");
text(xAxis, localY, strcat("\leftarrow", num2str(round(localY, 1))));
grid on;

subplot(2, 2, 4);
localY = angle(round(shiftedDFT.',5))*180/pi;
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("n \rightarrow", "Phase (°)", "DFT of $$ x(n+N) $$");
text(xAxis, localY, strcat("\leftarrow", num2str(round(localY, 1))));
grid on;