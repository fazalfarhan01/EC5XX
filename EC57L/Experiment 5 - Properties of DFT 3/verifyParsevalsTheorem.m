% Parseval's Theorem defines energy in time domain 
% is equivalent represented in frequency 

clear all;
close all
clc;


sequence = input("Enter the sequence: ");
DFT = dft(sequence);
N = length(sequence);


energyInTime = abs(sum(sequence.*conj(sequence)));
energyInFreq = abs(sum(DFT.*conj(DFT))/N);

disp("Energy in time domain is: ");
disp(energyInTime);

disp("Energy in freq domain is: ");
disp(energyInFreq);

if round(energyInTime, 5) == round(energyInFreq, 5)
    disp("Thus the Parseval's theorem is verified...!");
end