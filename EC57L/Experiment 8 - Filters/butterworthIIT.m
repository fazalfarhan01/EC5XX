clear all;
close all;
clc;

gainType = input("Select Gain Type: 1 for Normal, 2 for Decibels: ");

passBandGain = input("Enter Passband Gain: ");
stopBandGain = input("Enter Stopband Gain: ");

frequencyType = input("Frequency Unit: 1 for Hz, 2 for Rad/s: ");

passBandFrequency = input('Enter Passband Frequency (Analog Domain): ');
stopBandFrequency = input('Enter Stopband Frequency (Analog Domain): ');

samplingTime = input('Enter the sampling time: ');
disp('Low Pass => 1');
disp('High Pass => 2');
disp('Band Pass => 3');
disp('Band Stop => 4');

filterType = input("Enter filter type: ")

% minPassBandGain = 1.9328;
% maxStopBandGain = 13.9794;
% passBandFrequency = 0.62;
% stopBandFrequency = 1.88;
% samplingTime = 1;
% gainType = 2;
% frequencyType = 2;

if gainType == 1
    passBandGain = -20 * log10(passBandGain);
    stopBandGain = -20 * log10(stopBandGain);
end

if frequencyType == 1
    passBandFrequency = 2 * pi * passBandFrequency;
    stopBandFrequency = 2 * pi * stopBandFrequency;
end

% Finding all the parameters needed in analog domain
selectedOrder = ceil(log10((10^(0.1 * maxStopBandGain) - 1) / (10^(0.1 * minPassBandGain) - 1)) / (2 * log10(stopBandFrequency / passBandFrequency)));
omegaCp = passBandFrequency / (10^(0.1 * minPassBandGain) - 1)^(1 / (2 * selectedOrder));
omegaCs = stopBandFrequency / (10^(0.1 * maxStopBandGain) - 1)^(1 / (2 * selectedOrder));
omegaC = mean([omegaCp omegaCs]);

% Getting transfer function coefficients for analog butterworth filter
[normallisedAnalogNumerator, normallisedAnalogDenominator] = butter(selectedOrder, 1, "low", "s"); % Normallised

% Getting the actual transfer function
normallisedAnalogTransferFunction = tf(normallisedAnalogNumerator, normallisedAnalogDenominator); % Normallised

switch filterType
    case 1
        % low pass
        [deNormallisedAnalogNumerator, deNormallisedAnalogDenominator] = butter(selectedOrder, omegaC, "low", "s"); % Denormallised
        [digitalNumerator, digitalDenominator] = impinvar(deNormallisedAnalogNumerator, deNormallisedAnalogDenominator, 1 / samplingTime);
    case 2
        % High Pass
        [deNormallisedAnalogNumerator, deNormallisedAnalogDenominator] = butter(selectedOrder, omegaC, "high", "s"); % Denormallised
        digitalCutoff = 2 * omegaC;
        [digitalNumerator, digitalDenominator] = butter(selectedOrder, digitalCutoff / pi, 'high');
        % [digitalNumerator, digitalDenominator] = impinvar(deNormallisedAnalogNumerator, deNormallisedAnalogDenominator, 1 / samplingTime);
    case 3
        % Band Pass
        [deNormallisedAnalogNumerator, deNormallisedAnalogDenominator] = butter(selectedOrder, [omegaCp omegaCs], "bandpass", "s"); % Denormallised
        digitalCutoff = 2 * [omegaCp omegaCs];
        [digitalNumerator, digitalDenominator] = butter(selectedOrder, digitalCutoff / pi, 'bandpass');
    case 4
        % Band stop
        [deNormallisedAnalogNumerator, deNormallisedAnalogDenominator] = butter(selectedOrder, [omegaCp omegaCs], "stop", "s"); % Denormallised
        digitalCutoff = 2 * [omegaCp omegaCs];
        [digitalNumerator, digitalDenominator] = butter(selectedOrder, digitalCutoff / pi, 'stop');
end

deNormallisedAnalogTransferFunction = tf(deNormallisedAnalogNumerator, deNormallisedAnalogDenominator); % Denormallised
digitalTransferFunction = tf(digitalNumerator, digitalDenominator, 1 / samplingTime);

% Frequency Response of digital filter
[h, w] = freqz(digitalNumerator, digitalDenominator, 1024);

% Displaying the values in MATLAB command window
disp("OmegaCp:");
disp(omegaCp); % omegaCp
disp("OmegaCs:");
disp(omegaCs); % omegaCs
disp("OmegaC:");
disp(omegaC); % omegaCs

disp('Calculated Order is:');
disp(selectedOrder); % Order N

disp('Normallised H(s) is:');
normallisedAnalogTransferFunction% Show normallised analog filter

disp('Denormallised H(s) is:');
deNormallisedAnalogTransferFunction% Show de-normallised analog filter

disp('H(z) is:');
digitalTransferFunction% Show digital filter transfer function

plot(w / pi, 20 * log10(abs(h))); % plot the frequency response
% w => ranges from 0 to pi so dividing by pi gives x axis ranging from 0 to 1
% 20*log10 => to convert the gain to db
grid on;
% axis([0 22/7 -inf inf]);
setAxisLimits(axis);
setPlotAttributes("Frequency in r/s", "Gain in db", "Frequency response of Digital Butterworth Filter");
