data = readtable('sensor_readings_24.csv');

% 1000 = 1 Move Forward
% 0100 = 2 Slight right turn
% 0010 = 3 Sharp right turn
% 0001 = 4 Slight Left turn

inputData = table2array(data(:,1:24));
inputData = inputData.';

targetData = table2array(data(:,25));

valueLabels = unique(targetData);
nLabels = length(valueLabels);
nSamples = size(targetData,1);
oneHotTarget = zeros(nSamples, nLabels);

for i = 1:nLabels
	oneHotTarget(:,i) = (targetData == valueLabels(i));
end

oneHotTarget = oneHotTarget.';