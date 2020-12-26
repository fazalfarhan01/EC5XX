lengthofsequence = input('Enter the length of Hamming Filter: ');
Ftype = input("Select An option for which ftype filter\n1. Low pass filter\n2. High pass \n3. Bandpass filter\n4. Stopband filter: ");

switch Ftype
    case 1
        Cuttofffreq = input('Enter the Cuttoff Frequency: ');
        hammingFilterOutput = fir1(lengthofsequence, Cuttofffreq / pi, "low", hamming(lengthofsequence + 1));
        freqz(hammingFilterOutput, 1, 1024);
    case 2
        Cuttofffreq = input('Enter the Cuttoff Frequency: ');
        hammingFilterOutput = fir1(lengthofsequence, Cuttofffreq / pi, "high", hamming(lengthofsequence + 1));
        freqz(hammingFilterOutput, 1, 1024);
    case 3
        FirstCutofffreq = input('Enter the Cutoff freq Omega(L): ');
        SecondCuttofffreq = input('Enter the cutoff freq Omega(U): ');
        Cuttofffreq = [FirstCutofffreq SecondCuttofffreq]
        hammingFilterOutput = fir1(lengthofsequence, Cuttofffreq / pi, "bandpass", hamming(lengthofsequence + 1));
        freqz(hammingFilterOutput, 1, 1024);
    case 4
        typeOfFilter = "stop"
        FirstCutofffreq = input('Enter the Cutoff freq Omega(L): ');
        SecondCuttofffreq = input('Enter the cutoff freq Omega(U): ');
        Cuttofffreq = [FirstCutofffreq SecondCuttofffreq]
        hammingFilterOutput = fir1(lengthofsequence, Cuttofffreq / pi, "stop", hamming(lengthofsequence + 1));
        freqz(hammingFilterOutput, 1, 1024);
end
