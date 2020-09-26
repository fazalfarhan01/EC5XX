clear;
clc;
close all;
sequence = input("Enter the Sequence in time domain: ");

lengthOfSequence = length(sequence);

DFT = dft(sequence);
[DTFT pointLength] = dtft(sequence);

plot(abs(DTFT));
hold on;
grid on;
stem((0:lengthOfSequence-1)*(pointLength/lengthOfSequence),abs(DFT), "lineWidth", 1);
hold off;
set(get(gca, 'XLabel'), 'String', 'n -->');
set(get(gca, 'YLabel'), 'String', 'DTFT/DFT Amplitude');
set(get(gca, 'Title'), 'String', 'DTFT & DFT from a time domain signal');
axisData = axis;
axisLength = axisData(2) - axisData(1);
axisHeight = axisData(4) - axisData(3);
padding = 0.1; % Relative to the overall output
axis([axisData(1)-padding*axisLength axisData(2)+padding*axisLength axisData(3)-padding*axisHeight axisData(4)+padding*axisHeight])

clear all;
clc;