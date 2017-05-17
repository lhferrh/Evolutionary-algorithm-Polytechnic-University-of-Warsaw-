%Problem: Design a multilayer perceptron for function approximation y=f(x) based on a given training set. 
%Network structure: 2 input neurons: x and 1 (bias), one hidden layer of m neurons, one output neuron

%Generation of data test
%where: ) (0,15?x and ? – random number uniformly distributed in the interval (-0.1, 0.1) 
%Data sets  - pairs {x,y}: - 
datatrainSet=ones(40,1);
datatestSet=ones(400,1);
%snn_a.txt, - training set: 40 examples {x,y} uniformly distributed in the interval  (0, 15)  
datatrainSet(:,1) = linspace(0.1, 15, 40)';
%snn_b.txt. - test set: 400 examples {x,y} uniformly distributed in the interval  (0, 15)
datatestSet(:,1) =  linspace(0.1, 15, 400)';
%Epsilon is a random number uniformly distributed  in the interval
%(-0.1,0.1)
epsilon=generateEpsilon(1);
%Apply y(x) for all the x 
datatrainSet(:,2) = sin(datatrainSet(:,1))./datatrainSet(:,1)-epsilon;
datatestSet(:,2) = sin(datatestSet(:,1))./datatestSet(:,1)-epsilon;

save('dataNeuralNetwork.mat','datatrainSet','datatestSet');
%For generating a random number between -0.1 and 0.1
function [ epsilon ] = generateEpsilon(tamArray)
     epsilon = 0.2*rand(tamArray,1)-0.1;
end

%Activation function of hidden neurons : 
function [ z ] = activationFunc( h)
    z = tanh(h);
    
end