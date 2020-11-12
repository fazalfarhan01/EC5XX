% THIS SNIPPET IS TO ADD PADDING TO THE PLOT

function setAxisLimits(axisData, padding)
    % RELATIVE TO THE OVERALL PLOT
    % 0.1 IS 10% AND 0.5 IS 50%

    arguments
        axisData;
        padding = 0.05;
    end

    axisLength = axisData(2) - axisData(1);
    axisHeight = axisData(4) - axisData(3);
    axis([axisData(1) - padding * axisLength axisData(2) + padding * axisLength axisData(3) - padding * axisHeight axisData(4) + padding * axisHeight]);
end
