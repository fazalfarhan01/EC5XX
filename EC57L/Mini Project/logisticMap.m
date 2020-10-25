function array = logisticMap(imageDimensions, xn, r)
    arguments 
    imageDimensions = [256 256];
    xn = 0.5;
    r = 3.9;
    end

    array = ones(imageDimensions);

    array(1) = xn;
    
    for index = 2:imageDimensions(1)*imageDimensions(2)
        array(index) = array(index-1) * r * (1 - array(index-1));
    end

    array = round(array * 255);
end