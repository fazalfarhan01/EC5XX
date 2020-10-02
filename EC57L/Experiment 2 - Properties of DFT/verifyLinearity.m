clear all;
close all;
clc;

widthOfLine = 1;

% sequence1 = input("Enter sequence 1: \n");
% sequence2 = input("Enter sequence 2: \n");

sequence1 = [1 2 3 4];
sequence2 = [5 6 7 8];

DFT1 = dft(sequence1);
DFT2 = dft(sequence2);
combinedDFT = dft(sequence1 + sequence2);

disp(strcat(['DFT of sequence 1: x1(n)']));
disp(round(DFT1, 3));

disp(strcat(['DFT of sequence 2: x2(n)']));
disp(round(DFT2, 3));

disp(strcat(['DFT of sum of x1(n) and x2(n): ']));
disp(round(combinedDFT, 3));

disp(strcat(['Sum of DFTs x1(n) and x2(n): ']));
disp(round(DFT1 + DFT2, 3));

xAxis = linspace(0, length(sequence2) - 1, length(sequence2));

subplot(4, 2, 1);
localY = abs(DFT1);
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("n \rightarrow", "Amplitude", "DFT of sequence 1 $$ x_1(n) $$");
text(xAxis, localY, strcat("\leftarrow", num2str(round(localY, 1))));


subplot(4, 2, 2);
localY = angle(round(DFT1,5))*180/pi;
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("n \rightarrow", "Phase (°)", "DFT of sequence 1 $$ x_1(n) $$");
text(xAxis, localY, strcat("\leftarrow", num2str(round(localY, 1))));

subplot(4, 2, 3);
localY = abs(DFT2);
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("n \rightarrow", "Amplitude", "DFT of sequence 2 $$ x_2(n) $$");
text(xAxis, localY, strcat("\leftarrow", num2str(round(localY, 1))));


subplot(4, 2, 4);
localY = angle(round(DFT2,5))*180/pi;
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("n \rightarrow", "Phase (°)", "DFT of sequence 2 $$ x_2(n) $$");
text(xAxis, localY, strcat("\leftarrow", num2str(round(localY, 1))));

subplot(4, 2, 5);
localY = abs(combinedDFT);
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("n \rightarrow", "Amplitude", "DFT of sum of $$ x_1(n) $$ and $$ x_2(n) $$");
text(xAxis, localY, strcat("\leftarrow", num2str(round(localY, 1))));


subplot(4, 2, 6);
localY = angle(round(combinedDFT,5))*180/pi;
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("n \rightarrow", "Phase (°)", "DFT of sum of $$ x_1(n) $$ and $$ x_2(n) $$");
text(xAxis, localY, strcat("\leftarrow", num2str(round(localY, 1))));

subplot(4, 2, 7);
localY = abs(DFT1+DFT2);
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("n \rightarrow", "Amplitude", "Sum of DFTs of $$ x_1(n) $$ and $$ x_2(n) $$");
text(xAxis, localY, strcat("\leftarrow", num2str(round(localY, 1))));


subplot(4, 2, 8);
localY = angle(round(DFT1+DFT2,5))*180/pi;
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("n \rightarrow", "Phase (°)", "Sum of DFTs of $$ x_1(n) $$ and $$ x_2(n) $$");
text(xAxis, localY, strcat("\leftarrow", num2str(round(localY, 1))));
