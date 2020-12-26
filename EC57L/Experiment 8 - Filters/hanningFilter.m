lengthofsequence = input('Enter the length of Hanning filter: ');
Ftype = input("Select An option for which ftype filter\n1. Low pass filter\n2. High pass \n3. Bandpass filter\n4. Stopband filter");

switch Ftype
    case 1
        Cuttofffreq = input('Enter the Cuttoff Frequency: ');
        hanningFilterOutput = fir1(lengthofsequence, Cuttofffreq / pi, "low", hann(lengthofsequence + 1));
        freqz(hanningFilterOutput, 1, 1024);
    case 2
        Cuttofffreq = input('Enter the Cuttoff Frequency: ');
        hanningFilterOutput = fir1(lengthofsequence, Cuttofffreq / pi, "high", hann(lengthofsequence + 1));
        freqz(hanningFilterOutput, 1, 1024);
    case 3
        FirstCutofffreq = input('Enter the Cutoff freq Omega(L): ');
        SecondCuttofffreq = input('Enter the cutoff freq Omega(U): ');
        Cuttofffreq = [FirstCutofffreq SecondCuttofffreq]
        hanningFilterOutput = fir1(lengthofsequence, Cuttofffreq / pi, "bandpass", hann(lengthofsequence + 1));
        freqz(hanningFilterOutput, 1, 1024);
    case 4
        typeOfFilter = "stop"
        FirstCutofffreq = input('Enter the Cutoff freq Omega(L): ');
        SecondCuttofffreq = input('Enter the cutoff freq Omega(U): ');
        Cuttofffreq = [FirstCutofffreq SecondCuttofffreq]
        hanningFilterOutput = fir1(lengthofsequence, Cuttofffreq / pi, "stop", hann(lengthofsequence + 1));
        freqz(hanningFilterOutput, 1, 1024);
end
