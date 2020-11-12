function labelOnPlot(A)
    text(real(A(1)), imag(A(1)), strcat("\rightarrow",num2str(A(1))));
    text(real(A(2)), imag(A(2)), strcat("\rightarrow",num2str(A(2))));
end
