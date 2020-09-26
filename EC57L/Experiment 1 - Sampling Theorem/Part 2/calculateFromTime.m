clear;
clc;
close all;
sequence = input("Enter the Sequence in time domain: ");

lengthOfSequence = length(sequence);

DFT = dft(sequence)
[DTFT pointLength] = dtft(sequence);

% Plotting Amplitude Graph

subplot(2, 1, 1);

plot(abs(DTFT), "lineWidth", 1);
hold on;
grid on;
stem((0:lengthOfSequence-1)*(pointLength/lengthOfSequence),abs(DFT), "lineWidth", 1.5);
hold off;
set(get(gca, 'XLabel'), 'String', 'n -->');
set(get(gca, 'YLabel'), 'String', 'DTFT/DFT Amplitude');
set(get(gca, 'Title'), 'String', 'Amplitude of DTFT & DFT from a time domain signal');
for index = 0:lengthOfSequence-1
    text((index)*(pointLength/lengthOfSequence), abs(DFT(index+1)), strcat('\rightarrow', num2str(abs(DFT(index+1)))));
end

axisData = axis;
axisLength = axisData(2) - axisData(1);
axisHeight = axisData(4) - axisData(3);
padding = 0.1; % Relative to the overall output
axis([axisData(1)-padding*axisLength axisData(2)+padding*axisLength axisData(3)-padding*axisHeight axisData(4)+padding*axisHeight]);

% Plotting Phase Graph

subplot(2, 1, 2);
stem((0:lengthOfSequence-1)*(pointLength/lengthOfSequence), angle(DFT), "lineWidth", 1.5);
set(get(gca, 'XLabel'), 'String', 'n -->');
set(get(gca, 'YLabel'), 'String', 'Angle in Degrees (°)');
set(get(gca, 'Title'), 'String', 'Angle of DFT from time domain Signal');
for index = 0:lengthOfSequence-1
    text((index)*(pointLength/lengthOfSequence), angle(DFT(index+1)), strcat('\rightarrow', num2str(round(angle(DFT(index+1))*180/pi)), '°'));
end

axisData = axis;
axisLength = axisData(2) - axisData(1);
axisHeight = axisData(4) - axisData(3);
padding = 0.1; % Relative to the overall output
axis([axisData(1)-padding*axisLength axisData(2)+padding*axisLength axisData(3)-padding*axisHeight axisData(4)+padding*axisHeight]);


% clear all;
% clc;