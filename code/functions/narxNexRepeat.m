function [ outputArray ] = narxNexRepeat(neuronArray,inputDelaySize,feedbackDelaySize, ...
    numLayers,timesRepeated,input,target ...
    ,training,validation,test,final,trainingFunction)

    outputArray = [];
    % combo = permn(0:stepSize:possibleNeuronSize,numLayers);
    combo = permn(neuronArray,numLayers);
    
    indicesFirst = find(combo(:,1)==0);
    combo(indicesFirst,:) = [];
    
    disp('Length');
    disp(size(combo,1));
    
    for neuronInd = 1:length(combo)
        correct = [];
        disp('Neuron');
        disp(combo(neuronInd,:));
        for neuron = 1:timesRepeated
            disp('Repeated');
            disp(neuron);
            inputLayers = combo(neuronInd,:);
            inputLayers( inputLayers == 0 ) = [];
            
            [ net , c] = narxNet(1:inputDelaySize,1:feedbackDelaySize,inputLayers, ...
                            input,target,training,validation,test,final,trainingFunction);
            
            correct = [correct (100*(1-c))];
        end
        row = [combo(neuronInd,:) , correct , mean(correct) , std(correct)];
        outputArray = [outputArray ; row ];
%         neuronInd
    end 
    
end

