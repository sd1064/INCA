function [ outputArray, timeArray] = patterNetRepeat(neuronArray,numLayers, ...
    timesRepeated,input,target ...
    ,training,validation,test,final,trainingFunction)

    outputArray = [];
    timeArray = [];
%     combo = permn(0:stepSize:possibleNeuronSize,numLayers);
    combo = permn(neuronArray,numLayers);
    
    indicesFirst = find(combo(:,1)==0);
    combo(indicesFirst,:) = [];
    
    length(combo)
    
    for neuronInd = 1:length(combo)
        correct = [];
        time = [];
        for neuron = 1:timesRepeated
            inputLayers = combo(neuronInd,:);
            inputLayers( inputLayers == 0 ) = [];
            [ net , c, timeStep] = patternNet(inputLayers,input,target,training,validation,test,final,trainingFunction);
            correct = [correct (100*(1-c))];
            time = [time timeStep];
        end
        row = [combo(neuronInd,:) , correct , mean(correct) , std(correct) ];
        outputArray = [outputArray ; row ];
        timeArray = [ timeArray;  mean(time)];
        neuronInd
        save('MLPnet','outputArray');
    end 
end

