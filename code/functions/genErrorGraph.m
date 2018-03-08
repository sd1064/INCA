function [ graph ] = genErrorGraph( inputArray,numLayers ,colour,title,yAxisLablel,xyAxisLablel )

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
   
    figure;
    graph = errorbar(1:size(inputArray,1),means,std);
    set(gca,'XTick',1:20,'XTickLabel',xAxis)
    graph.Color = colour;
    grid on;
    % Some way of displaying the Neural network layers - "Strings ?"
    
end

