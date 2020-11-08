% 1. Radix 2 | DIT FFT Algorhithm


function [y, outputStages] = dit_fft(x)

    p = nextpow2(length(x));
    x = [x zeros(1, (2^p) - length(x))];
    N = length(x);
    totalStages = log2(N);
    Half = 1;
    x = bitrevorder(x);

    outputStages = zeros(N, 1);

    for stage = 1:totalStages;

        for index = 0:(2^stage):(N - 1);

            for n = 0:(Half - 1); % creating "butterfly" and saving the results
                pos = n + index + 1;
                pow = (2^(totalStages - stage)) * n;
                w = exp((-1i) * (2 * pi) * pow / N);
                a = x(pos) + x(pos + Half) .* w;
                b = x(pos) - x(pos + Half) .* w;
                x(pos) = a;
                x(pos + Half) = b;
            end

        end

        outputStages = [outputStages transpose(x)];
        Half = 2 * Half;
    end

    outputStages = outputStages(:, 2:end);

    y = transpose(x); % returning the result from function
end
