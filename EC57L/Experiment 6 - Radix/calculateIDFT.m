% clear all;
% close all;
% clc;

inputSequence = input("Enter a sequence: ");
sequence = conj(inputSequence);

[DITIFFT, ditOutputStages] = dit_fft(sequence);
[DIFIFFT, difOutputStages] = dif_fft(sequence);

DIFIFFT = DIFIFFT/length(DIFIFFT);
DITIFFT = DITIFFT/length(DITIFFT);

ditOutputStages(:,end) = ditOutputStages(:,end)/length(ditOutputStages(:,end));
difOutputStages(:,end) = difOutputStages(:,end)/length(difOutputStages(:,end));


disp("Intermediate stages of DIT FFT");
disp(ditOutputStages);
disp("Final IDFT using DIT algorhithm: ");
disp(conj(DITIFFT));


disp("Intermediate stages of DIF FFT");
disp(difOutputStages);
disp('Final IDFT using DIF algorhithm: ');
disp(conj(DIFIFFT));