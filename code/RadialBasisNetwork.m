% split data in half

half = size(inputData,2)/2;

trainingData    = inputData(:,1:half);
traingingTarget = oneHotTarget(:,1:half);

simData = inputData(:,half+1:end);
simActual = oneHotTarget(:,half+1:end);

[net,tr] = newrb(trainingData,traingingTarget,0.8);

simFromNetwork = sim(net,simData);

[c,cm] = confusion(simActual,simFromNetwork);