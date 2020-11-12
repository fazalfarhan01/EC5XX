% 1. ζ = 0.7, ωn = 10
% 2. ζ = 0.3, ωn = 10
% 3. ζ = 0.01, ωn = 10

clear all;
close all;
clc;

% DECLARING CONSTANTS STATICALLY
% frictionConstant = [140 60 2];
% springConstant = 1000;

% MORE DYNAMIC CONSTANT CALCULATION
massOfBlock = 10;
zetaValues = [0.7, 0.3, 0.01];
naturalFrequency = 10;

springConstant = naturalFrequency^2 * massOfBlock;
frictionConstant = 2 * zetaValues * sqrt(springConstant * massOfBlock);

for index = 1:length(frictionConstant)
    figure;
    G = tf([1], [massOfBlock frictionConstant(index) springConstant]);

    subplot(1, 2, 1);
    response = stepplot(G, "m");
    grid on;
    legend(strcat("ζ = ", num2str(zetaValues(index)), ", ωn = 10"));
    disp(strcat("Time Domain Parameters of transfer function with ", "ζ = ", num2str(zetaValues(index)), ", ωn = 10"))
    disp(stepinfo(G));
    response.showCharacteristic('PeakResponse');
    response.showCharacteristic('RiseTime');
    response.showCharacteristic('SettlingTime');
    response.showCharacteristic('SteadyState');
    setAxisLimits(axis, 0.05);

    subplot(1, 2, 2);
    pzmap(G, "r");
    grid on;
    poleZeroMap = findobj(gca, 'Type', 'Line');
    poleZeroMap(3).MarkerSize = 20;
    legend(strcat("ζ = ", num2str(zetaValues(index)), ", ωn = 10"));
    labelOnPlot(pzmap(G));
    setAxisLimits(axis, 0.1);
end