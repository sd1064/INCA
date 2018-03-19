% % split data in half
half = size(inputData,2)/(4/3);

trainingData    = inputData(:,1:half);
traingingTarget = oneHotTarget(:,1:half);
simData         = inputData(:,half+1:end);

% trainingDataPCA    = inputDataPCA(:,1:half);
% simDataPCA         = inputDataPCA(:,half+1:end);

simActual = oneHotTarget(:,half+1:end);

spread = 1.0;
error_target = 0.0;
disp_n = 1;
repeat = 1;
Confusion = [];
pcaConfusion = [];
neurons = [1 2 3 4 5 10 15 20 25 50 75];

for num = neurons
    row = [];
    for i=1:repeat
        rb = newrb(trainingData,traingingTarget,error_target,spread,num,disp_n);
        output_train = sim(rb,trainingData);
        output_test = sim(rb,simData);
        c = confusion(simActual,output_test);
        row = [row (100*(1-c))];
    end
    row = [row mean(row) std(row)];
    Confusion = [Confusion; row];
end

% for num = neurons
%     row = [];
%     for i=1:repeat
%         rb = newrb(trainingDataPCA,traingingTarget,error_target,spread,num,disp_n);
%         output_train = sim(rb,trainingDataPCA);
%         output_test = sim(rb,simDataPCA);
%         c = confusion(simActual,output_test);
%         row = [row (100*(1-c))];
%     end
%     row = [row mean(row) std(row)];
%     pcaConfusion = [pcaConfusion; row];
% end

genErrorGraphRBF( Confusion,neurons,[0, 0.4470, 0.7410],'Radial Basis Function Network','Classification Accuracy (%)','Number of Neurons');
% rbfpca = genErrorGraphRBF( pcaConfusion,neurons,[0.8500, 0.3250, 0.0980 ],'Radial Basis Function Network','Classification Accuracy (%)','Number of Neurons');
% 
% h1 = subplot(2,2,1);  
% copyobj(rbf,h1);    
% grid on;
% set(gca,'XTick',1:20,'XTickLabel',xAxis);
% set(gca,'XTickLabelRotation',45);
% set(get(h1, 'ylabel'), 'string', 'Classification Accuracy (%)') 
% set(get(h1, 'xlabel'), 'string', 'Network Layer(s) Size') 
% ylim([55 95]);
% title('Recurrent Neural Network - trainlm');
% 
% h2 = subplot(2,2,2);
% copyobj(rbfpca,h2); 
% grid on;
% set(gca,'XTick',1:20,'XTickLabel',xAxis);
% set(gca,'XTickLabelRotation',45);
% set(get(h2, 'ylabel'), 'string', 'Classification Accuracy (%)') 
% set(get(h2, 'xlabel'), 'string', 'Network Layer(s) Size') 
% ylim([55 95]);
% title('Recurrent Neural Network - trainscg');


