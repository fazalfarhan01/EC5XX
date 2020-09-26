function DTFT = dtft(sequence)

sequenceLength = length(sequence);
twiddleFactorMatrix = twiddleFactor(sequenceLength);
DTFT = twiddleFactorMatrix*sequence';
    
end