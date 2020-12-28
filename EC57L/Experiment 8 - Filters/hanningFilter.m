clear all;
close all;
clc;
lengthofsequence = input('Enter the length of Hanning Filter: ');
filterType = input("Select An option for which Filter Type\n1. Low pass filter\n2. High pass \n3. Bandpass filter\n4. Stopband filter: ");
samplingFrequency = 2000;
% disp("Selected Sampling Frequency is: ");
% disp(samplingFrequency);

switch filterType
    case 1
        Cuttofffreq = input('Enter the Cuttoff Frequency: ');
        Cuttofffreq = Cuttofffreq / (samplingFrequency / 2);
        hanningFilterOutput = fir1(lengthofsequence, Cuttofffreq, "low", hann(lengthofsequence + 1));
        freqz(hanningFilterOutput, 1, 1024);
    case 2
        Cuttofffreq = input('Enter the Cuttoff Frequency: ');
        Cuttofffreq = Cuttofffreq / (samplingFrequency / 2);
        hanningFilterOutput = fir1(lengthofsequence, Cuttofffreq, "high", hann(lengthofsequence + 1));
        freqz(hanningFilterOutput, 1, 1024);
    case 3
        FirstCutofffreq = input('Enter the Cutoff freq Omega(L): ');
        SecondCuttofffreq = input('Enter the cutoff freq Omega(U): ');
        Cuttofffreq = [FirstCutofffreq SecondCuttofffreq]
        Cuttofffreq = Cuttofffreq / (samplingFrequency / 2);
        hanningFilterOutput = fir1(lengthofsequence, Cuttofffreq, "bandpass", hann(lengthofsequence + 1));
        freqz(hanningFilterOutput, 1, 1024);
    case 4
        typeOfFilter = "stop"
        FirstCutofffreq = input('Enter the Cutoff freq Omega(L): ');
        SecondCuttofffreq = input('Enter the cutoff freq Omega(U): ');
        Cuttofffreq = [FirstCutofffreq SecondCuttofffreq]
        Cuttofffreq = Cuttofffreq / (samplingFrequency / 2);
        hanningFilterOutput = fir1(lengthofsequence, Cuttofffreq, "stop", hann(lengthofsequence + 1));
        freqz(hanningFilterOutput, 1, 1024);
end
