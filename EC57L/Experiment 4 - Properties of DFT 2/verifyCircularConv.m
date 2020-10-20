clear all;
close all;
clc

widthOfLine = 1;

sequence1 = input("Enter the Sequence 1: ");
sequence2 = input("Enter the Sequence 2: ");

DFT1 = dft(sequence1);
DFT2 = dft(sequence2);

% CIRCULAR CONVOLUTION IN TIME DOMAIN
timeDomain = circularConvolution(sequence1, sequence2);

% CIRCULAR CONVOLUTION IN FREQUENCY DOMAIN
N1 = length(sequence1);
N2 = length(sequence2);

% FIND OUT THE MAX LENGTH OF 2 SEQUENCES
N = max(N1, N2);

% CHECKING IF LENGTH OF 2 SEQUENCES IS EQUAL
if N1 ~= N2
    % APPENDING ZEROS
    sequence1 = [sequence1 zeros(1,N-N1)];
    sequence2 = [sequence2 zeros(1,N-N2)];
end

% % METHOD 1
% freqDomain = zeros(1,N);

% for i = 0:N-1
%     for j = 0:N-1
%         freqDomain(mod(i+j,N)+1) = freqDomain(mod(i+j,N)+1) + sequence1(i+1)*sequence2(j+1);
%     end
% end

% % METHOD 2
freqDomain = idft(dft(sequence1).*dft(sequence2));

disp("Circular Convolution in time domain: ");
disp(timeDomain.');

disp("Circular Convolution in frequency domain: ");
disp(abs(freqDomain).');

disp("DFT of sequence 1: ");
disp(DFT1);

disp('DFT of sequence 2: ');
disp(DFT2);

xAxis = 0:N1-1;
subplot(2, 2, 1);
localY = abs(DFT1);
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("k \rightarrow", "Amplitude", "DFT of sequence1 $$ \rightarrow X(k) $$");
for index = xAxis
    localY1 = localY(index + 1);
    text(index, localY1, strcat("\leftarrow", num2str(round(localY1, 1))));
end

subplot(2, 2, 2);
localY = angle(round(DFT1,5))*180/pi;
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("k \rightarrow", "Phase (°)", "DFT of sequence1 $$ \rightarrow X(k) $$");
for index = xAxis
    localY1 = localY(index + 1);
    text(index, localY1, strcat("\leftarrow", num2str(round(localY1, 1))));
end

xAxis = 0:N2-1;
subplot(2, 2, 3);
localY = abs(DFT2);
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("k \rightarrow", "Amplitude", "DFT of sequence2 $$ \rightarrow X(k) $$");
for index = xAxis
    localY1 = localY(index + 1);
    text(index, localY1, strcat("\leftarrow", num2str(round(localY1, 1))));
end

subplot(2, 2, 4);
localY = angle(round(DFT2,5))*180/pi;
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("k \rightarrow", "Phase (°)", "DFT of sequence2 $$ \rightarrow X(k) $$");
for index = xAxis
    localY1 = localY(index + 1);
    text(index, localY1, strcat("\leftarrow", num2str(round(localY1, 1))));
end


figure(2);

xAxis = 0:N-1;
subplot(2, 1, 1);
localY = timeDomain;
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("n \rightarrow", "Amplitude", "Convolution in Time Domain");
for index = xAxis
    localY1 = localY(index + 1);
    text(index, localY1, strcat("\leftarrow", num2str(round(localY1, 1))));
end

subplot(2, 1, 2);
localY = abs(freqDomain);
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("n \rightarrow", "Amplitude", "Convolution in Frequency Domain");
for index = xAxis
    localY1 = localY(index + 1);
    text(index, localY1, strcat("\leftarrow", num2str(round(localY1, 1))));
end