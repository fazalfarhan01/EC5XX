function convolutionResult = circularConv(sequence1, sequence2)
    N1 = length(sequence1);
    N2 = length(sequence2);

    % CHECKING IF LENGTH OF 2 SEQUENCES IS EQUAL
    if N1 ~= N2
        % FIND OUT THE MAX LENGTH OF 2 SEQUENCES
        N = max(N1, N2);

        % APPENDING ZEROS
        sequence1 = [sequence1 zeros(1,N-N1)];
        sequence2 = [sequence2 zeros(1,N-N2)];
    end
    circularMatrix = toeplitz(sequence1, reverse(sequence1));
    convolutionResult = circularMatrix * sequence2.';
end