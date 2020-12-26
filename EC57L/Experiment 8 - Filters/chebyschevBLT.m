clear all;
close all;
clc;

minPassBandGain = 0.75;
maxStopBandGain = 0.23;
% passBandFrequency = 0.62;
% stopBandFrequency = 1.88;
digitalPassBandFrequency = 0.25 * pi;
digitalStopBandFrequency = 0.63 * pi;
samplingTime = 2;
gainType = 1;
frequencyType = 2;
% digitalPassBandFrequency = 2 * atan(samplingTime * passBandFrequency / 2);
% digitalStopBandFrequency = 2 * atan(samplingTime * stopBandFrequency / 2);
passBandFrequency = (2 * tan(digitalPassBandFrequency / 2)) / samplingTime;
stopBandFrequency = (2 * tan(digitalStopBandFrequency / 2)) / samplingTime;

% disp('Enter the frequencies type');
% inputDomain = input("Enter 1 for analog frequencies, 2 for digital: ");

% samplingTime = input('Enter the sampling time: ');
% gainType = input("Select Gain Type: 1 for Normal, 2 for Decibels: ");

% minPassBandGain = input("Enter Passband Gain: ");
% maxStopBandGain = input("Enter Stopband Gain: ");

% frequencyType = input("Frequency Unit: 1 for Hz, 2 for Rad/s: ");

% if inputDomain == 1
%     passBandFrequency = input('Enter Passband Frequency (Analog Domain): ');
%     stopBandFrequency = input('Enter Stopband Frequency (Analog Domain): ');

%     if frequencyType == 1
%         passBandFrequency = 2 * pi * passBandFrequency;
%         stopBandFrequency = 2 * pi * stopBandFrequency;
%     end

%     digitalPassBandFrequency = 2 * atan(samplingTime * passBandFrequency / 2);
%     digitalStopBandFrequency = 2 * atan(samplingTime * stopBandFrequency / 2);
% else
%     digitalPassBandFrequency = input('Enter Passband Frequency (Digital Domain): ');
%     digitalStopBandFrequency = input('Enter Stopband Frequency (Digital Domain): ');

%     if frequencyType == 1
%         digitalPassBandFrequency = 2 * pi * digitalPassBandFrequency;
%         digitalStopBandFrequency = 2 * pi * digitalStopBandFrequency;
%     end

%     passBandFrequency = (2 * tan(digitalPassBandFrequency / 2)) / samplingTime;
%     stopBandFrequency = (2 * tan(digitalStopBandFrequency / 2)) / samplingTime;
% end

disp('Low Pass => 1');
disp('High Pass => 2');
disp('Band Pass => 3');
disp('Band Stop => 4');

filterType = input("Enter filter type: ");

if gainType == 1
    minPassBandGain = -20 * log10(minPassBandGain);
    maxStopBandGain = -20 * log10(maxStopBandGain);
end

normallisedPassBandFrequency = passBandFrequency / passBandFrequency;
normallisedStopBandFrequency = stopBandFrequency / passBandFrequency;

epsilon = sqrt((10^(0.1 * minPassBandGain)) - 1);

selectedOrder = ceil((maxStopBandGain - 20 * log10(epsilon) + 6) / (6 + 20 * log10(normallisedStopBandFrequency)));

switch filterType
    case 1
        % low pass
        [normallisedAnalogNumerator, normallisedAnalogDenominator] = cheby1(selectedOrder, minPassBandGain, normallisedPassBandFrequency, "low", "s");
        [digitalNumerator, digitalDenominator] = cheby1(selectedOrder, minPassBandGain, digitalPassBandFrequency / pi, "low");
    case 2
        % High Pass
        [normallisedAnalogNumerator, normallisedAnalogDenominator] = cheby1(selectedOrder, minPassBandGain, normallisedPassBandFrequency, "high", "s");
        [digitalNumerator, digitalDenominator] = cheby1(selectedOrder, minPassBandGain, digitalPassBandFrequency / pi, "high");
    case 3
        % Band Pass
        [normallisedAnalogNumerator, normallisedAnalogDenominator] = cheby1(selectedOrder, minPassBandGain, [normallisedPassBandFrequency normallisedStopBandFrequency], "bandpass", "s");
        [digitalNumerator, digitalDenominator] = cheby1(selectedOrder, minPassBandGain, [digitalPassBandFrequency, digitalStopBandFrequency] / pi, "bandpass");
    case 4
        % Band stop
        [normallisedAnalogNumerator, normallisedAnalogDenominator] = cheby1(selectedOrder, minPassBandGain, [normallisedPassBandFrequency normallisedStopBandFrequency], "bandpass", "s");
        [digitalNumerator, digitalDenominator] = cheby1(selectedOrder, minPassBandGain, [digitalPassBandFrequency, digitalStopBandFrequency] / pi, "stop");
end

normallisedAnalogTransferFunction = tf(normallisedAnalogNumerator, normallisedAnalogDenominator);
digitalTransferFunction = tf(digitalNumerator, digitalDenominator, 1 / samplingTime);

[h, w] = freqz(digitalNumerator, digitalDenominator, 1024);

% Display Given
disp("Given: ")
disp('   Min Pass Band Gain - Ap: (in db)');
disp(minPassBandGain);
disp('   Max Stop Band Gain - As: (in db)');
disp(maxStopBandGain);
disp('   Pass Band Frequency (Analog Domain) in rad/s');
disp(passBandFrequency);
disp('   Stop Band Frequency (Analog Domain) in rad/s');
disp(stopBandFrequency);

% Display Normallised Frequencies
disp('Normallised Frequencies')
disp('   Normallised Pass Band Frequency: ');
disp(normallisedPassBandFrequency);
disp('   Normallised Stop Band Frequency: ');
disp(normallisedStopBandFrequency);

% Display Ripple Factor
disp('Epsilon => ε: ');
disp(epsilon);

% DIsplay Order N
disp('Order => N');
disp(selectedOrder);

% Display Normallised Transferfunction
disp('Normallised Analog Transfer Function H1(s)');
normallisedAnalogTransferFunction

% Display Digital butterworth filter
digitalTransferFunction

plot(w / pi, 20 * log10(abs(h))); % plot the frequency response
% w => ranges from 0 to pi so dividing by pi gives x axis ranging from 0 to 1
% 20*log10 => to convert the gain to db
grid on;
setAxisLimits(axis);
setPlotAttributes("Frequency in r/s", "Gain in db", "Frequency response of Digital Chebyschev Filter");
