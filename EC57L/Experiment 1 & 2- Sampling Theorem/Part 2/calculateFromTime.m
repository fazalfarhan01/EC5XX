clear;
clc;
close all;
% Starting fresh

sequence = input("Enter the Sequence in time domain: ");

lengthOfSequence = length(sequence);

DFT = dft(sequence);
[DTFT, pointLength] = dtft(sequence);
disp("Calculated using manually coded function");
round(DFT, 3)

disp("Calculated using builtin coded function");
round(fft(sequence).', 3)

% Plotting Amplitude Graph

subplot(2, 1, 1);
plot(linspace(0, lengthOfSequence, pointLength), abs(DTFT), "lineWidth", 1);
hold on;
grid on;
stem(linspace(0, lengthOfSequence-1, lengthOfSequence), abs(DFT), "lineWidth", 1.5);
hold off;
setPlotAttributes('n \rightarrow \omega \rightarrow', 'DTFT/DFT Amplitude', 'Amplitude of DTFT & DFT from a time domain signal')

for index = 0:lengthOfSequence - 1
    text(index, abs(DFT(index + 1)), strcat('\rightarrow', num2str(round(abs(DFT(index + 1)), 2))));
end

setAxisLimits(axis);

% Plotting Phase Graph

phase = angle(round(DFT, 6)) * 180 / pi;

subplot(2, 1, 2);
stem(linspace(0, lengthOfSequence-1, lengthOfSequence), phase, "lineWidth", 1.5);
grid on;
setPlotAttributes('n \rightarrow', 'Angle in Degrees (°)', 'Angle of DFT from time domain Signal')

for index = 0:lengthOfSequence - 1
    text(index, phase(index + 1), strcat('\rightarrow', num2str(phase(index + 1)), '°'));
end

setAxisLimits(axis);