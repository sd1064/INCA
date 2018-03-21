timesRepeated = 10;
numLayers     =  1;
% neuronArray   = [20];
trainingFunction = 'trainlm';
sizes = [1 3 5 7 10];
output = [];

for size=sizes
    feedbackDelaySize = 1:size; inputDelaySize = 1:size;
    
    outputNARXPCA = narxNexRepeat(neuronArray,inputDelaySize,feedbackDelaySize, ...
    numLayers,timesRepeated,inputDataPCA,oneHotTarget,training,validation,test,final,trainingFunction);

    output = [output; size outputNARXPCA];
end

figure;genErrorGraphfeedbackDelay( output,numLayers,[ 0.8500, 0.3250, 0.0980],'Recurrent Neural Network','Classification Accuracy (%)','Number of previus inputs and outputs to use' )


