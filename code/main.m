clc;
clear all;

setup;
% plotMatrix;
pcaAnalysis;

possibleNeuronSize =  20;
timesRepeated      =   3;
numLayers          =   3;
stepSize           =   5;

% Regular MLP
% outputMLP = patterNetRepeat(possibleNeuronSize ,numLayers ,timesRepeated , ... 
%     stepSize ,inputData ,oneHotTarget , ...
%     training,validation,test,final);
% 
% outputMLPPCA = patterNetRepeat(possibleNeuronSize ,numLayers ,timesRepeated , ... 
%     stepSize ,inputDataStdPCA ,oneHotTarget , ...
%     training,validation,test,final);

% Recurrent network - NARX
outputNarx = narxNet(1:4,1:4,10,inputData,oneHotTarget,training,validation,test,final );
