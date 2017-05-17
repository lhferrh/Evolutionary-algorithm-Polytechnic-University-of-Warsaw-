% sample session using the provided scripts
load('dataNeuralNetwork');
% load the data :
trainSet=datatrainSet;
testSet=datatestSet;

% view the training set samples (plot second column against the first)
% plot(trainSet(:, 1), trainSet(:, 2), 'r.');
neurons=[1 3 6 8 12 16 20 30 50 100];
a=1;
for i=neurons
    %TRAINING: train a new neural network using chosen number of hidden neurons
    nHiddenNeurons = i;
    nIterations = 100;
    net = trainnet(trainSet, nHiddenNeurons, nIterations);

    %check the MSE on training and test datasets
    mseTrain = evaluatenet(net, trainSet)
    mseTest = evaluatenet(net, testSet)
    
    %results
    resultTrain = net(trainSet(:, 1)')';
    resultTest = net(testSet(:, 1)')';

    % plot the function implemented by the trained neural network
    figure(i);
    hold on
    sn = @(x)sin(x) / x;
    fplot(sn, [0, 15],'r');
    plot(testSet(:, 1), resultTest,'b--');
    legend('f(x)', 'f*(x)','east')
    xlabel 'x'
    ylabel 'f(x)'
    title(strjoin({'NeuralNetwork: ', num2str(i),'neurons'}))
    hold off
    print(strjoin( {'Plot', num2str(i)}),'-djpeg');
    
    datamse(a,1)=i;
    datamse(a,2)=mseTrain;
    datamse(a,3)=mseTest;
    a=a+1;
end

figure(111)
hold on
semilogy(datamse(:,1),datamse(:, 3))
legend('msetest')
xlabel 'neurons'
ylabel 'log(mse)'
title(strjoin({'distribucion mse/neurons'}))
hold off
