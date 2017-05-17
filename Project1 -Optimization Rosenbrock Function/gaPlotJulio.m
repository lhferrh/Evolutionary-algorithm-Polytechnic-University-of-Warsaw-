function state = gaPlot(~,state,~)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

individuals = mean(state.Population);

xc = individuals(1);
yc = individuals(2);

v = var(state.Population);

l = abs(v(1,1));

pdecirc(xc,yc,l*(0.001));


end

