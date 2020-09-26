function [DTFT dtftPointLength] = dtft(sequence)
    sequenceLength = length(sequence);
    dtftPointLength = 1000;
    DTFT = dft([sequence zeros(1,dtftPointLength-sequenceLength)]);
end