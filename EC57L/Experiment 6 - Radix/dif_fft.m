function [y outputStages] = dif_fft(x)% entry point to the function of FFT decimation in frequency
    p = nextpow2(length(x)); % checking the size of the input array
    x = [x zeros(1, (2^p) - length(x))]; % complementing an array of zeros if necessary
    N = length(x); % computing the array size
    S = log2(N); % computing the number of conversion stages
    Half = N / 2; % half the length of the array

    outputStages = zeros(N, 1);

    for stage = 1:S; % stages of transformation

        for index = 0:(N / (2^(stage - 1))):(N - 1); % series of "butterflies" for each stage

            for n = 0:(Half - 1); % creating "butterfly" and saving the results
                pos = n + index + 1; % index of the data sample
                pow = (2^(stage - 1)) * n; % part of power of the complex multiplier
                w = exp((-1i) * (2 * pi) * pow / N); % complex multiplier
                a = x(pos) + x(pos + Half); % 1-st part of the "butterfly" creating operation
                b = (x(pos) - x(pos + Half)) .* w; % 2-nd part of the "butterfly" creating operation
                x(pos) = a; % saving computation of the 1-st part
                x(pos + Half) = b; % saving computation of the 2-nd part
            end

        end

        outputStages = [outputStages transpose(x)];
        Half = Half / 2; % computing the next "Half" value
    end

    outputStages = outputStages(:, 2:end);
    y = transpose(bitrevorder(x)); % performing bit-reverse operation and returning the result from function
end
