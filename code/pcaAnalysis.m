% PCA
% processpca
% mapstd

inputDataStd = mapstd(inputData);
inputDataPCA = processpca(inputDataStd,0.02);