    net = perceptron;
    
    net.divideFcn = 'divideind';
    net.divideParam.trainInd = training:(validation-1);
    net.divideParam.valInd   = validation:(test-1);
    net.divideParam.testInd  = test:final;
    
    [net,tr] = train(net,inputData,oneHotTarget);
    
    testInput = inputData(:,tr.testInd);
    testTarget = oneHotTarget(:,tr.testInd);

    testOutputs = net(testInput);
    testIndices = vec2ind(testOutputs);
    
    [c,cm] = confusion(testTarget,testOutputs);