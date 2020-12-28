function digitalFrequency = analogToDigital(analogFrequency, conversionType, samplingTime)
    arguments
        analogFrequency double;
        conversionType string = "blt";
        samplingTime = 2;
    end
    if conversionType == "blt" 
        digitalFrequency = 2 * atan(analogFrequency*samplingTime/2);
    elseif conversionType == "iit"
        digitalFrequency = samplingTime * analogFrequency;
    end
end