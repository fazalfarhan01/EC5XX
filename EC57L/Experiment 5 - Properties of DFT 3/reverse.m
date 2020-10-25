function REVERSED = reverse(sequence)
    REVERSED = circshift(fliplr(sequence), 1);
end