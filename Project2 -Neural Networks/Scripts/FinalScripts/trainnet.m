function net = trainnet(trainSet, nHiddenNeurons, nIterations)
%TRAINNET train a neural network using trainSet

minAttrVal = floor(min(trainSet(:, 1)));
maxAttrVal = ceil(max(trainSet(:, 1)));

net = newff([minAttrVal maxAttrVal], [nHiddenNeurons 1], {'tansig', 'purelin'}, 'trainlm');

% net = init(net);

% manual initialization yields better results than Nguyen-Widrow
net.IW{1} = (rand(nHiddenNeurons, 1) - 0.5) / (0.5 / 0.15);
net.LW{2} = (rand(1, nHiddenNeurons) - 0.5) / (0.5 / 0.15);
net.b{1}  = (rand(nHiddenNeurons, 1) - 0.5) / (0.5 / 0.15);
net.b{2}  = (rand() - 0.5) / (0.5 / 0.15);

net.trainParam.epochs = nIterations;
%net.trainParam.showWindow = false;

net = train(net, trainSet(:, 1)', trainSet(:, 2)');

end

