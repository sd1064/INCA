half = 4075;
inputSize = 16;
numHiddenUnits = 100;
numClasses = 4;
maxEpochs = 100;

trainingData    = inputDataPCA(:,1:half);
traingingTarget = oneHotTarget(:,1:half);

simData   = inputDataPCA(:,half+1:end);
simActual = oneHotTarget(:,half+1:end);

layers = [ ...
    sequenceInputLayer(inputSize)
    lstmLayer(numHiddenUnits,'OutputMode','last')
    fullyConnectedLayer(numClasses)
    softmaxLayer
    classificationLayer];

options = trainingOptions('adam');
net = trainNetwork(trainingData,traingingTarget,layers,options);

simPredict = classify(net,simData);
acc = sum(simPredict == simActual)./numel(simActual);