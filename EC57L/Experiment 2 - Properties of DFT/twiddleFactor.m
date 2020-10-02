function twiddleMatrix = twiddleFactor(sequenceLenght, needMatrix)
    arguments
        sequenceLenght
        needMatrix = 1;
    end
    twiddleMatrix = ones([sequenceLenght sequenceLenght]);
    theta = 2 * pi / sequenceLenght;

    for index1 = 2:sequenceLenght

        for index2 = 2:sequenceLenght
            twiddleMatrix(index1, index2) = cos(theta * (index2 - 1) * (index1 - 1)) - i * sin(theta * (index2 - 1) * (index1 - 1));
        end

    end

    if ~needMatrix
        twiddleMatrix = twiddleMatrix(:, 2);
    end