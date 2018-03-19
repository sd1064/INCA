% Finding best networkst test

possibleNeuronSize = 30;
timesRepeated      = 10;
numLayers          =  2;
stepSize           =  3;

neuronArray = [0 1 2 3 4 5 7 10 15 20 25 30];

feedbackDelaySize = 1:4; 
inputDelaySize    = 1:4;

trainingFunction = 'trainlm';

% Recurrent network - NARX

% outputNARX = narxNexRepeat(inputDelaySize,feedbackDelaySize,possibleNeuronSize, ...
%     numLayers,timesRepeated,stepSize,inputData,oneHotTarget ...
%     ,training,validation,test,final,trainingFunction);

% MLP
% trainingFunction = 'trainlm';
% outputMLP = patterNetRepeat(possibleNeuronSize ,numLayers ,timesRepeated , ... 
%     stepSize ,inputData ,oneHotTarget , ...
%     training,validation,test,final,trainingFunction);

outputNARXPCA = narxNexRepeat(neuronArray,inputDelaySize,feedbackDelaySize,possibleNeuronSize, ...
    numLayers,timesRepeated,stepSize,inputDataPCA,oneHotTarget ...
    ,training,validation,test,final,trainingFunction);

outputMLPPCA = patterNetRepeat(neuronArray,possibleNeuronSize ,numLayers ,timesRepeated , ... 
    stepSize ,inputDataPCA ,oneHotTarget , ...
    training,validation,test,final,trainingFunction);

figure;genErrorGraph( outputNARXPCA,numLayers,[ 0.8500, 0.3250, 0.0980],'Recurrent Neural Network - PCA','Classification Accuracy (%)','Network Layer(s) Size' )
figure;genErrorGraph( outputMLPPCA,numLayers ,[0.9290, 0.6940, 0.1250],'Multi-Layer Perceptron - PCA','Classification Accuracy (%)','Network Layer(s) Size' )

% figure;genErrorGraph( outputMLP,numLayers ,[0.9290, 0.6940, 0.1250],'Multi-Layer Perceptron','Classification Accuracy (%)','Network Layer(s) Size' )
% figure;genErrorGraph( outputNARX,numLayers,[ 0.8500, 0.3250, 0.0980],'Recurrent Neural Network ','Classification Accuracy (%)','Network Layer(s) Size' )
