clc;
close all;
clear all;

correlationType = input("Enter Correlation Type\nAuto-Correlation => 1\nCross-Correlation => 2\n:");

lineWidth = 1.5;

if correlationType == 1
    x = input('Enter the sequence 1: ');
    y = x;
elseif correlationType == 2
    x = input('Enter the sequence 1: ');
    y = input('Enter the sequence 2: ');
end

y = xcorr(x, y);

figure;
subplot(2, 1, 1);
stem(x, "lineWidth", lineWidth);
setPlotAttributes("n->", 'Amplitude->', 'Input Sequence');
setAxisLimits(axis);

subplot(2, 1, 2);
stem(fliplr(y), "lineWidth", lineWidth);
setPlotAttributes("n->", 'Amplitude->', 'Correlated Sequence');
setAxisLimits(axis);

disp('The Correlated Sequence is:');
disp(fliplr(y));
