function [ graph ] = genErrorGraphRBF( inputArray,neurons,colour,graphTitle,yAxisLablel,xAxisLablel )

    bigness = size(inputArray,2);
    
    means = inputArray(:,bigness-1);
    means = means.';
    std = inputArray(:,bigness);
    std = std.';
    
    xAxis = {};
    for i=1:size(inputArray,1)
        display = neurons(1,i);
        xAxis = [ xAxis ; mat2str(display)];
    end
    
    numNeurons = size(neurons,2);
    
    figure(1);
    errorbar(1:numNeurons,means,std);
    set(gca,'XTick',1:numNeurons,'XTickLabel',xAxis)
    grid on;
    xlabel(xAxisLablel);
    ylabel(yAxisLablel);
    title(graphTitle);
    ylim([0 100]);
    
    
end

