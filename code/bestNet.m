% Finding best networkst test

timesRepeated      =  10;
numLayers          =  1;
neuronArray = [15];
feedbackDelaySize = 4; 
inputDelaySize    = 4;
trainingFunction = 'trainlm';

% outputMLP = patterNetRepeat(neuronArray,numLayers ,timesRepeated , ... 
%     inputData ,oneHotTarget , ...
%     training,validation,test,final,trainingFunction);

[outputNARX,corrrect] = narxNexRepeat(neuronArray,inputDelaySize,feedbackDelaySize, ...
    numLayers,timesRepeated,inputData,oneHotTarget ...
    ,training,validation,test,final,trainingFunction);

% narx = load('narxNet.mat');
% mlp = load('MLPNet.mat');

figure;genErrorGraph( outputNARX,numLayers,[ 0.8500, 0.3250, 0.0980],'Recurrent Neural Network','Classification Accuracy (%)','Hidden Layer Structure' )
% figure;genErrorGraph( mlp.outputArray,numLayers ,[0, 0.4470, 0.7410],'Multi-Layer Perceptron','Classification Accuracy (%)','Hidden Layer Structure' )
