function [ output_args ] = narxNet(inputDelays,feedbackDelays,hiddenLayerSize,input,target,training,validation,test,final )

    net = narxnet(inputDelays,feedbackDelays,hiddenLayerSize);

    net.divideFcn = 'divideind';
    net.divideParam.trainInd = training:(validation-1);
    net.divideParam.valInd   = validation:(test-1);
    net.divideParam.testInd  = test:final;
    
    seqInput =  con2seq(input);
    seqTarget = con2seq(target);
    
    [inputs,inputStates,layerStates,targets] = preparets(net,seqInput,{},seqTarget);
    [net,tr] = train(net,inputs,targets,inputStates,layerStates);

    testInputs = inputs(:,tr.testInd);
    testTargets = targets(:,tr.testInd);
    testOutputs = net(testInputs);
    
    testOutputs = [testOutputs{:}];
    testTargets = [testTargets{:}];
    
    testIndices = vec2ind(testOutputs);
    
    [c,cm] = confusion(testTargets,testOutputs);

    % fprintf('Percentage Correct Classification   : %f%%\n', 100*(1-c));
    % fprintf('Percentage Incorrect Classification : %f%%\n', 100*c);
    
    % figure;
    % plotroc(testTargets,testOutputs);
    
    % figure;
    % plotperform(tr);
    
    % figure;
    % plotconfusion(testTarget,testOutputs)
end

