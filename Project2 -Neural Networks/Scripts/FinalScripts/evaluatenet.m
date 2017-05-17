function mseTest = evaluatenet(net, testSet)
%EVALUATENET Calculate MSE of the network on given dataset

%Matlab:
%[predTest, Pf, Af, E, perf] = sim(net, testSet(:, 1)');

%Octave:
predTest = sim(net, testSet(:, 1)');

mseTest = sum((testSet(:, 2) - predTest') .^ 2) / size(testSet, 1);

end

