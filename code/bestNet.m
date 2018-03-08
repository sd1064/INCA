% Finding best networkst test

possibleNeuronSize =  20;
timesRepeated      =   5;
numLayers          =   2;
stepSize           =   5;

feedbackDelaySize = 1:4; 
inputDelaySize    = 1:4;

% Recurrent network - NARX
trainingFunction = 'trainlm';
outputNARX = narxNexRepeat(inputDelaySize,feedbackDelaySize,possibleNeuronSize, ...
    numLayers,timesRepeated,stepSize,inputData,oneHotTarget ...
    ,training,validation,test,final,trainingFunction);

outputNARXPCA = narxNexRepeat(inputDelaySize,feedbackDelaySize,possibleNeuronSize, ...
    numLayers,timesRepeated,stepSize,inputDataStdPCA,oneHotTarget ...
    ,training,validation,test,final,trainingFunction);

% MLP
trainingFunction = 'trainlm';
outputMLP = patterNetRepeat(possibleNeuronSize ,numLayers ,timesRepeated , ... 
    stepSize ,inputData ,oneHotTarget , ...
    training,validation,test,final,trainingFunction);

outputMLPPCA = patterNetRepeat(possibleNeuronSize ,numLayers ,timesRepeated , ... 
    stepSize ,inputDataStdPCA ,oneHotTarget , ...
    training,validation,test,final,trainingFunction);
