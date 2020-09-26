function IDFT = idft(sequence)

    IDFT = conj(dft(conj(sequence')))/length(sequence);

end