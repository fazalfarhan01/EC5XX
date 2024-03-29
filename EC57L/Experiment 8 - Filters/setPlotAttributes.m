function setPlotAttributes(xAxisLabel, yAxisLabel, plotTitle)
    set(get(gca, 'XLabel'), 'String', xAxisLabel);
    set(get(gca, 'YLabel'), 'String', yAxisLabel);
    % set(get(gca, 'Title'), 'String', plotTitle);
    title(plotTitle,  'Interpreter', 'latex');
end