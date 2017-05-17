function net = train_net(trainingset, hidden_neurons)    
% Parameters:     
% train_set:      
% labels - y     
% hidden_neurons_count:      
% Return value:     
% net – object representing a neural network 
   
% initialization     
% hidden neuron activation function- tanh,     
% output neuron activation - linear     

net=newff(trainingset(:, 1)', trainingset(:, 2)',hidden_neurons,{'tansig', 'purelin'},'trainlm'); 
rand('state',sum(100*clock));      %random numbers generator initialization     
net=init(net);                     %weights initialization     
net.trainParam.goal = 0.01;        %stop- mse criterion     
net.trainParam.epochs = 400;       %number of epochs iterations     
net=train(net,trainingset(:, 1)', trainingset(:, 2)'); %network training
