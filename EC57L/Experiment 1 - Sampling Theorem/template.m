%%Time specifications:
Fs = 100;                      % samples per second
dt = 1/Fs;                     % seconds per sample
StopTime = 1;                  % seconds
t = (0:dt:StopTime-dt)';
N = size(t,1);
%%Sine wave:
Fc = 12;                       % hertz
x = cos(2*pi*Fc*t);
%%Fourier Transform:
X = fftshift(fft(x));
%%Frequency specifications:
dF = Fs/N;                      % hertz
f = -Fs/2:dF:Fs/2-dF;           % hertz
%%Plot the spectrum:
figure;
plot(f,abs(X)/N);
xlabel('Frequency (in hertz)');
title('Magnitude Response');


% This block is templete for finding the frequency!
% [maximum, index] = max(absolute);
% maximum
% index = ((index - 1)-messageSignalFrequency)/2