% graphNARX = genErrorGraph(outputNARX);
% graphNARXPCA = genErrorGraph(outputNARXPCA);
% graphMLP = genErrorGraph(outputMLP);
% graphPCA = genErrorGraph(outputMLPPCA);

colourMatrix = [0, 0.4470, 0.7410 ; 0.8500, 0.3250, 0.0980;0.9290, 0.6940, 0.1250;0.6350, 0.0780, 0.1840];

figure;gscatter(inputData(1,:),inputData(19,:),targetData.',colourMatrix,'o');
axis equal;
title('Graph of Class Values for the Left Sensor Against the Forward Sensor')
xlabel('Forward Sensor') % x-axis label
ylabel('Left Sensor') % y-axis label
legend('Move Forward','Slight Right Turn','Sharp Right Turn','Slight Left Turn');
