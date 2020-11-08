clear all;
close all;
clc;

sequence = input("Enter a sequence: ");

[DITFFT, ditOutputStages] = dit_fft(sequence);
[DIFFFT, difOutputStages] = dif_fft(sequence);

N = length(DIFFFT);

disp("Intermediate stages of DIT FFT");
disp(ditOutputStages);
disp("Final DFT using DIT algorhithm: ");
disp(DITFFT);


disp("Intermediate stages of DIF FFT");
disp(difOutputStages);
disp('Final DFT using DIF algorhithm: ');
disp(DIFFFT);

% PLOTS
widthOfLine = 1;

xAxis = 0:N-1;
subplot(2, 2, 1);
localY = abs(DIFFFT);
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("k \rightarrow", "Amplitude", "DFT of $$ x(n) \rightarrow X(k) $$ using DIF FFT algorhithm");
for index = xAxis
    localY1 = localY(index + 1);
    text(index, localY1, strcat("\leftarrow", num2str(round(localY1, 1))));
end

subplot(2, 2, 2);
localY = angle(round(DIFFFT,5))*180/pi;
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("k \rightarrow", "Phase", "DFT of $$ x(n) \rightarrow X(k) $$ using DIF FFT algorhithm");
for index = xAxis
    localY1 = localY(index + 1);
    text(index, localY1, strcat("\leftarrow", num2str(round(localY1, 1))));
end

subplot(2, 2, 3);
localY = abs(fft(sequence));
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("k \rightarrow", "Amplitude", "DFT of $$ x(n) \rightarrow X(k) $$ using built in MATLAB function");
for index = xAxis
    localY1 = localY(index + 1);
    text(index, localY1, strcat("\leftarrow", num2str(round(localY1, 1))));
end

subplot(2, 2, 4);
localY = angle(round(fft(sequence),5))*180/pi;
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("k \rightarrow", "Phase", "DFT of $$ x(n) \rightarrow X(k) $$ using built in MATLAB function");
for index = xAxis
    localY1 = localY(index + 1);
    text(index, localY1, strcat("\leftarrow", num2str(round(localY1, 1))));
end