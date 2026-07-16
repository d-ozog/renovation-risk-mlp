% Data loaded from csv file
opts.DataLines = 2; % Skip the first row (headers)
M = readmatrix(['data.csv'], opts);
p = M(:,1:13)'; % Inputs
t = M(:,14)'; % Expected outputs

% Definition of MLP network with 4 hidden layers (total 6 layers: input, 4 hidden, output)
hiddenLayerSizes = [260 90 90 90];   % Number of neurons in the layers
net = feedforwardnet(hiddenLayerSizes);

% Activation functions
net.layers{1}.transferFcn = 'tansig';   % First layer
net.layers{2}.transferFcn = 'tansig';   % Second layer
net.layers{3}.transferFcn = 'tansig';   % Third layer
net.layers{4}.transferFcn = 'tansig';   % Fourth layer
net.layers{5}.transferFcn = 'purelin';  % Output layer

% Training function
net.trainFcn = 'trainlm';   % Levenberg-Marquardt

% Funkcja błędu
net.performFcn = 'mse';     % Mean Squared Error

% Split data into training, validation and test sets
net.divideFcn = 'dividerand';   % Random split
net.divideParam.trainRatio = 0.8;  % 80% training data
net.divideParam.valRatio   = 0.1;  % 10% validation data
net.divideParam.testRatio  = 0.1;  % 10% test data

% Train the network
[net,tr] = train(net,p,t);

% Testing on the test set
testX = p(:,tr.testInd);
testT = t(:,tr.testInd);
testY = net(testX);

% Display results
disp('Expected outputs (test set):');
disp(testT);
disp('Network outputs (test set):');
disp(testY);

% Visualization of network structure
view(net);

% Comparative plot
figure;
plot(testT,'ro-','LineWidth',2); hold on;       % Red circles – expected data
plot(testY,'bx--','LineWidth',2);               % Blue crosses – network results
legend('Test data (expected)','Network results'');
xlabel('Sample number');
ylabel('Output value');
title('Comparison of test data with MLP network results');
grid on;

% Additional diagnostic plots
figure, plotperform(tr);   % Error progression
figure, plottrainstate(tr); % Training state
figure, plotconfusion(testT,testY); % Confusion matrix