topRow = [ inputData(23,:) ; inputData(24,:) ; inputData(1,:) ; inputData(2,:) ; inputData(3,:) ];
topRow = topRow.';

rightRow = [ inputData(4,:) ; inputData(5,:) ; inputData(6,:) ; inputData(7,:) ; inputData(8,:) ; inputData(9,:) ; inputData(10,:) ];
rightRow = rightRow.';

bottomRow = [ inputData(15,:) ; inputData(14,:) ; inputData(13,:) ; inputData(12,:) ; inputData(11,:) ];
bottomRow = bottomRow.';

leftRow = [ inputData(16,:) ; inputData(17,:) ; inputData(18,:) ; inputData(19,:) ; inputData(20,:) ; inputData(21,:) ; inputData(22,:) ];
leftRow = leftRow.';

figure;plotmatrix(topRow);
figure;plotmatrix(rightRow);
figure;plotmatrix(bottomRow);
figure;plotmatrix(leftRow);

% So can see that plotmatrix gives no vars are correlated
% So can't drop any using plotmatrix