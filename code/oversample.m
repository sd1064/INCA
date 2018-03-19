% Oversample

% -------------------------------------------------------------------------
% One Method 
%Find indices to elements in first column of A that satisfy the equality
% toOversample = [inputData ; targetData.'];
% 
% ind1 = toOversample(25,:) == 1;
% ind2 = toOversample(25,:)  == 2;
% ind3 = toOversample(25,:)  == 3;
% ind4 = toOversample(25,:)  == 4;
% 
% Use the logical indices to index into A to return required sub-matrices
% toOversample2 = toOversample(1:24,ind2);
% overSampled2  = resample(toOversample2.',5,2);
% overSampled2 = overSampled2.';
% overSampled2 = [overSampled2; repelem(2,size(overSampled2,2))];
% toOversample4 = toOversample(1:24,ind4);
% overSampled4  = resample(toOversample4.',14,2);
% overSampled4 = overSampled4.';
% overSampled4 = [overSampled4; repelem(4,size(overSampled4,2))];
% notToOversample1 = toOversample(:,ind1);
% notToOversample3 = toOversample(:,ind3);
% data = [notToOversample1  overSampled2  notToOversample3  overSampled4];
% -------------------------------------------------------------------------
% toOversample = [inputData.' targetData];
% sampleRate = 10;
% overSampled = resample(toOversample,10,1);
% 
% overSampled = [overSampled(:,1:24) round(overSampled(:,25))];



















