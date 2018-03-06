function [ outputArray ] = narxNexRepeat(inputDelaySize,feedbackDelaySize,possibleNeuronSize, ...
    numLayers,timesRepeated,stepSize,input,target ...
    ,training,validation,test,final)

    outputArray = [];
    combo = permn(0:stepSize:possibleNeuronSize,numLayers);
       
    indicesFirst = find(combo(:,1)==0);
    combo(indicesFirst,:) = [];
    
    length(combo)
    
    for neuronInd = 1:length(combo)
        correct = [];
        for neuron = 1:timesRepeated
            
            inputLayers = combo(neuronInd,:);
            inputLayers( inputLayers == 0 ) = [];
            
            [ net , c] = narxNet(1:inputDelaySize,1:feedbackDelaySize,inputLayers, ...
                            input,target,training,validation,test,final);
            
            correct = [correct (100*(1-c))];
        end
        row = [combo(neuronInd,:) , correct , mean(correct) , std(correct)];
        outputArray = [outputArray ; row ];
        neuronInd
    end 
    
end
