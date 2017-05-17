% sample session using the provided scripts

% load the data and normalize it:
[trainSet testSet] = preprocessdata();

% view the training set samples (plot second column against the first)
plot(trainSet(:, 1), trainSet(:, 2), 'r.');

% train a new neural network using chosen number of hidden neurons
nHiddenNeurons = 4;
nIterations = 300;
figure(2);
net = trainnet(trainSet, nHiddenNeurons, nIterations);

% check the MSE on training and test datasets
mseTrain = evaluatenet(net, trainSet)
mseTest = evaluatenet(net, testSet)

% plot the function implemented by the trained neural network
figure(3);
plotfunction(net, -5, 5);
