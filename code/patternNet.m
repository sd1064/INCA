function [ net , c] = patternNet(neurons,input,target)

%  The default network for function fitting (or regression) problems, 
%  patternnet, is a feedforward network with the default tan-sigmoid transfer function in the hidden layer, 
%  and a softmax transfer function in the output layer. 
%  You assigned ten neurons (somewhat arbitrary) to the one hidden layer in the previous section.

    net = patternnet(neurons);
    [net,tr] = train(net,input,target);
    
    % figure;
    % plotperform(tr);

    testInput = input(:,tr.testInd);
    testTarget = target(:,tr.testInd);

    testOutputs = net(testInput);
    testIndices = vec2ind(testOutputs);
    
    % figure;
    % plotconfusion(testTarget,testOutputs)

    [c,cm] = confusion(testTarget,testOutputs);

    fprintf('Percentage Correct Classification   : %f%%\n', 100*(1-c));
    fprintf('Percentage Incorrect Classification : %f%%\n', 100*c);
    
    % figure;
    % plotroc(testTarget,testOutputs)

    
end

