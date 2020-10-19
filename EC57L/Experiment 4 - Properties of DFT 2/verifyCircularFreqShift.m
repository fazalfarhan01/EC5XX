clear all;
close all;
clc;

widthOfLine = 1;

% sequence = input("Enter the sequence x(n): ");
% m = input("Enter the value (m) to be shifted: ");


sequence = [4 5 6 7];
m = 1;

N = length(sequence);

n = 1:N;
k = n;

x(n) = sequence;

X(k) = fft(x);

x1(n) = x.*exp(i*2*pi*m*(n-1)/N);
X1(k) = fft(x1(n));

X2(k) = circshift(X, m);

disp("DFT of x(n) is: ");
disp(X);

disp("Circularly Shifted X(l-k)N: ");
disp(X2);

disp("DFT of x(n)*e^(j*2*pi*m*n/N) is: ");
disp(X1);

xAxis = 0:N-1;


subplot(3, 2, 1);
localY = abs(X);
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("k \rightarrow", "Amplitude", "DFT of $$ x(n) \rightarrow X(k) $$");
for index = xAxis
    localY1 = localY(index + 1);
    text(index, localY1, strcat("\leftarrow", num2str(round(localY1, 1))));
end

subplot(3, 2, 2);
localY = angle(round(X,5))*180/pi;
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("k \rightarrow", "Phase (°)", "DFT of $$ x(n) \rightarrow X(k) $$");
for index = xAxis
    localY1 = localY(index + 1);
    text(index, localY1, strcat("\leftarrow", num2str(round(localY1, 1))));
end


subplot(3, 2, 3);
localY = abs(X1);
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("k \rightarrow", "Amplitude", "Circularly Shifted DFT signal by $$ m \rightarrow X(m-k)_N $$");
for index = xAxis
    localY1 = localY(index + 1);
    text(index, localY1, strcat("\leftarrow", num2str(round(localY1, 1))));
end

subplot(3, 2, 4);
localY = angle(round(X1,5))*180/pi;
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("k \rightarrow", "Phase (°)", "Circularly Shifted DFT signal by $$ m \rightarrow X(m-k)_N $$");
for index = xAxis
    localY1 = localY(index + 1);
    text(index, localY1, strcat("\leftarrow", num2str(round(localY1, 1))));
end

subplot(3, 2, 5);
localY = abs(X2);
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("k \rightarrow", "Amplitude", "DFT of $$ x(n)*e^(j*2*pi*m*n/N) \rightarrow X(m-k)_N $$");
for index = xAxis
    localY1 = localY(index + 1);
    text(index, localY1, strcat("\leftarrow", num2str(round(localY1, 1))));
end

subplot(3, 2, 6);
localY = angle(round(X2,5))*180/pi;
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("k \rightarrow", "Phase (°)", "DFT of $$ x(n)*e^{(j*2*pi*m*n/N)} \rightarrow X(m-k)_N $$");
for index = xAxis
    localY1 = localY(index + 1);
    text(index, localY1, strcat("\leftarrow", num2str(round(localY1, 1))));
end