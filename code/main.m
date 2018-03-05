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
% output = patterNetRepeat(possibleNeuronSize ,numLayers ,timesRepeated , ... 
%     stepSize ,inputData ,oneHotTarget , ...
%     training,validation,test,final);
% 
% outputPCA = patterNetRepeat(possibleNeuronSize ,numLayers ,timesRepeated , ... 
%     stepSize ,inputDataStdPCA ,oneHotTarget , ...
%     training,validation,test,final);

% Recurrent network
% NAR