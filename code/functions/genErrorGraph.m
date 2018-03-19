function [ graph ] = genErrorGraph( inputArray,numLayers ,colour,graphTitle,yAxisLablel,xAxisLablel )

    bigness = size(inputArray,2);
    
    means = inputArray(:,bigness-1);
    means = means.';
    
    std = inputArray(:,bigness)
    std   = std.';

    xAxis = {}
    for i=1:size(inputArray,1)
        display = inputArray(i,1:numLayers);
        display( :, all(~display,1) ) = [];
        xAxis = [ xAxis ; mat2str(display)];
    end
   
    graph = errorbar(1:size(inputArray,1),means,std);
    set(gca,'XTick',1:size(xAxis,1),'XTickLabel',xAxis)
    set(gca,'XTickLabelRotation',45);
    graph.Color = colour;
    grid on;
    xlabel(xAxisLablel);
    ylabel(yAxisLablel);
    title(graphTitle);
    ylim([0 100]);
    
end

