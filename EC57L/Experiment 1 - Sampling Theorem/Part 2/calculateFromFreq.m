sequence = input("Enter the sequence in frequency domain: ");

lengthOfSequence = length(sequence)
IDFT = idft(sequence)

figure;
stem(abs(IDFT), "lineWidth", 1.5);
set(get(gca, 'XLabel'), 'String', 'n -->');
set(get(gca, 'YLabel'), 'String', 'Amplitude in time domain');
set(get(gca, 'Title'), 'String', 'Inverse DFT from Freq domain to time domain.');
grid on;

for index = 1:lengthOfSequence
    text(index, IDFT(index), strcat('\rightarrow', num2str(abs(IDFT(index)))));
end

axisData = axis;
axisLength = axisData(2) - axisData(1);
axisHeight = axisData(4) - axisData(3);
padding = 0.1; % Relative to the overall output
axis([axisData(1)-padding*axisLength axisData(2)+padding*axisLength axisData(3)-padding*axisHeight axisData(4)+padding*axisHeight])