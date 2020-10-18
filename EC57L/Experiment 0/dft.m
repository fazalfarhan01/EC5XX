function DFT = dft(sequence)

sequenceLength = length(sequence);
twiddleFactorMatrix = twiddleFactor(sequenceLength);
twiddleFactorMatrix(:,2)
DFT = twiddleFactorMatrix*sequence.';
    
end