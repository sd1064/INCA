% Finding best networkst test

timesRepeated      =  1;
numLayers          =  2;

neuronArray = [0 5 7 10 15 20 25];

feedbackDelaySize = 4; 
inputDelaySize    = 4;

trainingFunction = 'trainlm';
outputNARX = narxNexRepeat(neuronArray,inputDelaySize,feedbackDelaySize, ...
    numLayers,timesRepeated,inputData,oneHotTarget ...
    ,training,validation,test,final,trainingFunction);

outputMLP = patterNetRepeat(neuronArray,numLayers ,timesRepeated , ... 
    inputData ,oneHotTarget , ...
    training,validation,test,final,trainingFunction);

figure;genErrorGraph( outputNARX,numLayers,[ 0.8500, 0.3250, 0.0980],'Recurrent Neural Network','Classification Accuracy (%)','Hidden Layer Structure' )
figure;genErrorGraph( outputMLP,numLayers ,[0, 0.4470, 0.7410],'Multi-Layer Perceptron','Classification Accuracy (%)','Hidden Layer Structure' )
