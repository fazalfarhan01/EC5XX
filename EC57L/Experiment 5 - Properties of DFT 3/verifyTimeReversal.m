% Time reversal property
% DFT[x(N-n)] is given by X(N-k)

clear all;
close all
clc;

% TAKING THE INPUT FROM THE USER
sequence = input("Enter the sequence: ");

N = length(sequence);
n = 1:N;
k = n;

widthOfLine = 1;

% MAIN SEQUENCE AND IT'S DFT
x(n) = sequence;
X(k) = dft(x(n));

% TIME REVERSED SEQUENCE AND IT'S DFT
x1(n) = reverse(sequence);
X1(k) = dft(x1(n));

% CONJUGATE OF THE MAIN SEQUENCE'S DFT
X2(k) = conj(X(k));

disp("DFT of x(n) is: ");
disp(round(X(k), 3));

disp('The time reversed sequence x(-n) is: ');
disp(round(x1(n), 3));

disp("DFT of time reversed sequence x(-n) is: ");
disp(round(X1(k), 3));

disp("Conjugate of X(k) is: ");
disp(round(X2(k), 3));

disp("The DFT of time reversed sequence is equal to the conjugate of x(n)");
disp("Thus the time reversal property is verified.")


% PLOTTING THE DFT OF MAIN SEQUENCE
xAxis = 0:N-1;
subplot(2, 3, 1);
localY = abs(X);
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("k \rightarrow", "Amplitude", "DFT of $$ x(n) \rightarrow X(k) $$");
for index = xAxis
    localY1 = localY(index + 1);
    text(index, localY1, strcat("\leftarrow", num2str(round(localY1, 1))));
end

subplot(2, 3, 4);
localY = angle(round(X,5))*180/pi;
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("k \rightarrow", "Phase (°)", "DFT of $$ x(n) \rightarrow X(k) $$");
for index = xAxis
    localY1 = localY(index + 1);
    text(index, localY1, strcat("\leftarrow", num2str(round(localY1, 1))));
end

% PLOTTING THE DFT OF TIME REVERSED SEQUENCE
xAxis = 0:N-1;
subplot(2, 3, 2);
localY = abs(X1);
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("k \rightarrow", "Amplitude", "DFT of $$ x(-n) \rightarrow $$ $$ DFT[x(-n)] $$");
for index = xAxis
    localY1 = localY(index + 1);
    text(index, localY1, strcat("\leftarrow", num2str(round(localY1, 1))));
end

subplot(2, 3, 5);
localY = angle(round(X1,5))*180/pi;
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("k \rightarrow", "Phase (°)", "DFT of $$ x(-n) \rightarrow $$ $$ DFT[x(-n)] $$");
for index = xAxis
    localY1 = localY(index + 1);
    text(index, localY1, strcat("\leftarrow", num2str(round(localY1, 1))));
end

% PLOTTING THE CONJUGATE OF THE DFT OF MAIN SEQUENCE
xAxis = 0:N-1;
subplot(2, 3, 3);
localY = abs(X1);
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("k \rightarrow", "Amplitude", "Conjugate of DFT of $$ x(n) \rightarrow X(N-k) $$");
for index = xAxis
    localY1 = localY(index + 1);
    text(index, localY1, strcat("\leftarrow", num2str(round(localY1, 1))));
end

subplot(2, 3, 6);
localY = angle(round(X1,5))*180/pi;
stem(xAxis, localY, "lineWidth", widthOfLine);
setAxisLimits(axis);
setPlotAttributes("k \rightarrow", "Phase (°)", "Conjugate of DFT of $$ x(n) \rightarrow X(N-k) $$");
for index = xAxis
    localY1 = localY(index + 1);
    text(index, localY1, strcat("\leftarrow", num2str(round(localY1, 1))));
end