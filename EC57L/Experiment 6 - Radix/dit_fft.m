function [y, outputStages] = dit_fft(x)

    p = nextpow2(length(x));
    x = [x zeros(1, (2^p) - length(x))];
    N = length(x);
    totalStages = log2(N);
    Half = 1;
    x = bitrevorder(x);

    outputStages = zeros(N, 1);

    for stage = 1:totalStages; % stages of transformation

        for index = 0:(2^stage):(N - 1); % series of "butterflies" for each stage

            for n = 0:(Half - 1); % creating "butterfly" and saving the results
                pos = n + index + 1; % index of the data sample
                pow = (2^(totalStages - stage)) * n; % part of power of the complex multiplier
                w = exp((-1i) * (2 * pi) * pow / N); % complex multiplier
                a = x(pos) + x(pos + Half) .* w; % 1-st part of the "butterfly" creating operation
                b = x(pos) - x(pos + Half) .* w; % 2-nd part of the "butterfly" creating operation
                x(pos) = a; % saving computation of the 1-st part
                x(pos + Half) = b; % saving computation of the 2-nd part
            end

        end

        outputStages = [outputStages transpose(x)];
        Half = 2 * Half; % computing the next "Half" value
    end

    outputStages = outputStages(:, 2:end);

    y = transpose(x); % returning the result from function
end
