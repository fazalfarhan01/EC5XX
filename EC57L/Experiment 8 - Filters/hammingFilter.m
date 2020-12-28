clear all;
close all;
clc;
lengthofsequence = input('Enter the length of Hamming Filter: ');
filterType = input("Select An option for which Filter Type\n1. Low pass filter\n2. High pass \n3. Bandpass filter\n4. Stopband filter: ");
samplingFrequency = 2000;
% disp("Selected Sampling Frequency is: ");
% disp(samplingFrequency);

switch filterType
    case 1
        Cuttofffreq = input('Enter the Cuttoff Frequency: ');
        Cuttofffreq = Cuttofffreq / (samplingFrequency / 2);
        hammingFilterOutput = fir1(lengthofsequence, Cuttofffreq, "low", hamming(lengthofsequence + 1));
        freqz(hammingFilterOutput, 1, 1024);
    case 2
        Cuttofffreq = input('Enter the Cuttoff Frequency: ');
        Cuttofffreq = Cuttofffreq / (samplingFrequency / 2);
        hammingFilterOutput = fir1(lengthofsequence, Cuttofffreq, "high", hamming(lengthofsequence + 1));
        freqz(hammingFilterOutput, 1, 1024);
    case 3
        FirstCutofffreq = input('Enter the Cutoff freq Omega(L): ');
        SecondCuttofffreq = input('Enter the cutoff freq Omega(U): ');
        Cuttofffreq = [FirstCutofffreq SecondCuttofffreq]
        Cuttofffreq = Cuttofffreq / (samplingFrequency / 2);
        hammingFilterOutput = fir1(lengthofsequence, Cuttofffreq, "bandpass", hamming(lengthofsequence + 1));
        freqz(hammingFilterOutput, 1, 1024);
    case 4
        typeOfFilter = "stop"
        FirstCutofffreq = input('Enter the Cutoff freq Omega(L): ');
        SecondCuttofffreq = input('Enter the cutoff freq Omega(U): ');
        Cuttofffreq = [FirstCutofffreq SecondCuttofffreq]
        Cuttofffreq = Cuttofffreq / (samplingFrequency / 2);
        hammingFilterOutput = fir1(lengthofsequence, Cuttofffreq, "stop", hamming(lengthofsequence + 1));
        freqz(hammingFilterOutput, 1, 1024);
end
