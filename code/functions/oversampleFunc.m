function [ oversampled ] = oversampleFunc( toOversample,sampleRate2,sampleRate4 )

    startOfBlock = 1;
    currentClass = toOversample(1,25);
    oversampled = [];

    for idx = 1:size(toOversample,1)
        if not(toOversample(idx,25)==currentClass)
            if currentClass==1||currentClass==3
                oversampled = [oversampled;toOversample(startOfBlock:(idx-1),:)];
            else
                if (idx - startOfBlock)==1
                    oversampled = [oversampled;toOversample(startOfBlock:(idx-1),:)];
                else
                    if currentClass==2
                        sampleRate=sampleRate2;
                    else
                        sampleRate=sampleRate4;
                    end
                    oversampledTemp = resample(toOversample(startOfBlock:(idx-1),:),sampleRate,1);
                    oversampledTemp = [oversampledTemp(:,1:24) round(oversampledTemp(:,25))];
                    delId = or(oversampledTemp(:,25) == 0,oversampledTemp(:,25) == 1);
                    oversampledTemp(delId,:) = [];          
                    oversampled = [oversampled;oversampledTemp];
                end
            end
            currentClass = toOversample(idx,25);
            startOfBlock = idx;
        end
    end
    
    fiveId = oversampled(:,25) == 5 ;
    oversampled(fiveId,25) = 4 ;
    

    
end

