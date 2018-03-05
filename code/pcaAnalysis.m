% PCA
% processpca
% mapstd

inputDataStd = mapstd(inputData);
inputDataStdPCA = processpca(inputDataStd,0.02);