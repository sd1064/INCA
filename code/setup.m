data = readtable('sensor_readings_24.csv');

% 1000 = 1 Move Forward
% 0100 = 2 Slight right turn
% 0010 = 3 Sharp right turn
% 0001 = 4 Slight Left turn

inputData = table2array(data(:,1:24));
inputData = inputData.';

targetData = table2array(data(:,25));

% OVERSAMPLE STUFF
target = targetData(1:2728,:);
input = inputData(:,1:2728);
toOversample = [input.' target];
sampleRate2   = 2;
sampleRate4   = 6;
oversampled = oversampleFunc( toOversample,sampleRate2,sampleRate4 );

joined = [ oversampled ; inputData(:,2729:end).' targetData(2729:end,:) ];

inputData = joined(:,1:24).';
targetOversampled = joined(:,25);

% valueLabels = unique(targetData);
% nLabels = length(valueLabels);
% nSamples = size(targetData,1);
% oneHotTarget = zeros(nSamples, nLabels);

valueLabels = unique(targetOversampled);
nLabels = length(valueLabels);
nSamples = size(targetOversampled,1);
oneHotTarget = zeros(nSamples, nLabels);

for i = 1:nLabels
	oneHotTarget(:,i) = (targetOversampled == valueLabels(i));
end

oneHotTarget = oneHotTarget.';

training = 1;
validation = size(oversampled,1);
test = (validation + 1364);
final = size(joined,1);

% training = 1;
% validation = 2728;
% test = 4092;
% final = 5456;

