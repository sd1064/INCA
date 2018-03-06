clc;
clear all;

setup;
% plotMatrix;
pcaAnalysis;

possibleNeuronSize =   20;
timesRepeated      =   10;
numLayers          =    2;
stepSize           =    3;

feedbackDelaySize = 1:4; 
inputDelaySize    = 1:4;

% Recurrent network - NARX
outputNARX = narxNexRepeat(inputDelaySize,feedbackDelaySize,possibleNeuronSize, ...
    numLayers,timesRepeated,stepSize,inputData,oneHotTarget ...
    ,training,validation,test,final);

graphNARX = genErrorGraph(outputNARX);

outputNARXPCA = narxNexRepeat(inputDelaySize,feedbackDelaySize,possibleNeuronSize, ...
    numLayers,timesRepeated,stepSize,inputDataStdPCA,oneHotTarget ...
    ,training,validation,test,final);

graphNARXPCA = genErrorGraph(outputNARXPCA);

% MLP
outputMLP = patterNetRepeat(possibleNeuronSize ,numLayers ,timesRepeated , ... 
    stepSize ,inputData ,oneHotTarget , ...
    training,validation,test,final);

graphMLP = genErrorGraph(outputMLP);


outputMLPPCA = patterNetRepeat(possibleNeuronSize ,numLayers ,timesRepeated , ... 
    stepSize ,inputDataStdPCA ,oneHotTarget , ...
    training,validation,test,final);

graphPCA = genErrorGraph(outputMLPPCA);
