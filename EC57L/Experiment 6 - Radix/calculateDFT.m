clear all;
close all;
clc;

sequence = input("Enter a sequence: ");

[DITFFT, ditOutputStages] = dit_fft(sequence);
[DIFFFT, difOutputStages] = dif_fft(sequence);

disp("Intermediate stages of DIT FFT");
disp(ditOutputStages);
disp("Final DFT using DIT algorhithm: ");
disp(DITFFT);


disp("Intermediate stages of DIF FFT");
disp(difOutputStages);
disp('Final DFT using DIF algorhithm: ');
disp(DIFFFT);