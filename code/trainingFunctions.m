% Training function tests

possibleNeuronSize =   20;
timesRepeated      =    5;
numLayers          =    2;
stepSize           =    5;

feedbackDelaySize = 1:4; 
inputDelaySize    = 1:4;

% NARX
trainingFunction = 'trainlm';
outputTrainNARXLM = narxNexRepeat(inputDelaySize,feedbackDelaySize,possibleNeuronSize, ...
    numLayers,timesRepeated,stepSize,inputData,oneHotTarget ...
    ,training,validation,test,final,trainingFunction);

trainingFunction = 'trainscg';
outputTrainNARXSCG = narxNexRepeat(inputDelaySize,feedbackDelaySize,possibleNeuronSize, ...
    numLayers,timesRepeated,stepSize,inputData,oneHotTarget ...
    ,training,validation,test,final,trainingFunction);


% MLP
trainingFunction = 'trainlm';
outputTrainMLPLM = patterNetRepeat(possibleNeuronSize ,numLayers ,timesRepeated , ... 
    stepSize ,inputData ,oneHotTarget , ...
    training,validation,test,final,trainingFunction);

trainingFunction = 'trainscg';
outputTrainMLPSCG = patterNetRepeat(possibleNeuronSize ,numLayers ,timesRepeated , ... 
    stepSize ,inputData ,oneHotTarget , ...
    training,validation,test,final,trainingFunction);

% PLOTTING

graphNARXLM  = genErrorGraph( outputTrainNARXLM,2,[0, 0.4470, 0.7410 ],'','','' );
graphNARXSCG = genErrorGraph( outputTrainNARXSCG,2,[0.8500, 0.3250, 0.0980],'','','');

graphMLPLM  = genErrorGraph( outputTrainMLPLM,2,[0, 0.4470, 0.7410 ],'','','' );
graphMLPSCG = genErrorGraph( outputTrainMLPSCG,2,[0.8500, 0.3250, 0.0980],'','','' );

figure;

xAxis = {}
for i=1:size(outputTrainNARXLM,1)
    display = outputTrainNARXLM(i,1:numLayers);
    display( :, all(~display,1) ) = [];
    xAxis = [ xAxis ; mat2str(display)];
end

h1 = subplot(2,2,1);  
copyobj(graphNARXLM,h1);    
grid on;
set(gca,'XTick',1:20,'XTickLabel',xAxis);
set(gca,'XTickLabelRotation',45);
set(get(h1, 'ylabel'), 'string', 'Classification Accuracy (%)') 
set(get(h1, 'xlabel'), 'string', 'Network Layer(s) Size') 
ylim([55 95]);
title('Recurrent Neural Network - trainlm');

h2 = subplot(2,2,2);
copyobj(graphNARXSCG,h2); 
grid on;
set(gca,'XTick',1:20,'XTickLabel',xAxis);
set(gca,'XTickLabelRotation',45);
set(get(h2, 'ylabel'), 'string', 'Classification Accuracy (%)') 
set(get(h2, 'xlabel'), 'string', 'Network Layer(s) Size') 
ylim([55 95]);
title('Recurrent Neural Network - trainscg');

h3 = subplot(2,2,3);
copyobj(graphMLPLM,h3); 
grid on;
set(gca,'XTick',1:20,'XTickLabel',xAxis);
set(gca,'XTickLabelRotation',45);
set(get(h3, 'ylabel'), 'string', 'Classification Accuracy (%)') 
set(get(h3, 'xlabel'), 'string', 'Network Layer(s) Size') 
ylim([55 95]);
title('Multi-Layer Perceptron - trainlm');

h4 = subplot(2,2,4);
copyobj(graphMLPSCG,h4); 
grid on;
set(gca,'XTick',1:20,'XTickLabel',xAxis);
set(gca,'XTickLabelRotation',45);
set(get(h4, 'ylabel'), 'string', 'Classification Accuracy (%)') 
set(get(h4, 'xlabel'), 'string', 'Network Layer(s) Size') 
ylim([55 95]);
title('Multi-Layer Perceptron - trainscg');
