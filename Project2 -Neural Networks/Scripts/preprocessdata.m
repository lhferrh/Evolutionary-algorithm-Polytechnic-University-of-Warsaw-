
function [trainSet testSet] = preprocessdata()
% loads data and performs normalization

load('train40');
load('test400');
rawtrain=inputforty;
rawTest=inputfourHundr;
trainSet=rawtrain;
testSet=rawTest;
% this is a regression task, we should normalize both input and output
% (real-life application will require denormalizing the output)
%[trainSet testSet] = simnormalize(rawTrain, rawTest);
