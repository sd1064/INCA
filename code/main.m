clc;
clear all;
setup;

% TO DO
%   - PCA 
%   - Split up data 
%   - Read paper
%   - Different types of net 

possibleNeuronSize = 20;
possibleLayers     =  3;
timesRepeated      = 10;

patterNetRepeat(possibleNeuronSize , possibleLayers , timesRepeated  , inputData , oneHotTarget);