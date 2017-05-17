function plotfunction(net, startX, endX)
% plot the function implemented by neural network, on the
% [startX, endX] interval

x = startX:0.01:endX;

%Matlab:
% [predicted, Pf, Af, E, perf] = sim(net, x);

%Octave:
predicted = sim(net, x);

plot(x, predicted, '.');

end
