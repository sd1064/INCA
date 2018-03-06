function [ graph ] = genErrorGraph( inputArray )

    ticks = [ 1:size(inputArray,1) ] ;
    means = [ inputArray(:,size(inputArray,2)-1).' ];
    std   = [ inputArray(:,size(inputArray,2)).' ];

    % Output NARXPCA
    figure;
    graph = errorbar(ticks,means,std);
    grid on;
    % Some way of displaying the Neural network layers - "Strings ?"
    
end

