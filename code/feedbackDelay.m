timesRepeated = 10;
numLayers     =  1;
neuronArray   = [25];
trainingFunction = 'trainlm';
sizes = [1 3 5 10 20];
output = [];

for size=sizes
    feedbackDelaySize = size; inputDelaySize = size;
    
    outputNARX = narxNexRepeat(neuronArray,inputDelaySize,feedbackDelaySize, ...
    numLayers,timesRepeated,inputData,oneHotTarget,training,validation,test,final,trainingFunction);

    output = [output; size outputNARX];
end

figure;genErrorGraphfeedbackDelay( output,numLayers,[ 0.8500, 0.3250, 0.0980],'Recurrent Neural Network','Classification Accuracy (%)','Number of previous inputs and outputs to use' )


