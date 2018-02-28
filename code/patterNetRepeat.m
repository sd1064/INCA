function [ outputArray ] = patterNetRepeat( possibleNeuronSize , possibleLayers , timesRepeated , input , target )
    outputArray = [];
    for neuron = 1:possibleNeuronSize
        correct = [];
        for neuron = 1:timesRepeated
            [ net , c] = patternNet([neuron],input,target);
            correct = [correct (100*(1-c))];
        end
        outputArray = [outputArray ; correct mean(correct) std(correct) ];
    end
end

