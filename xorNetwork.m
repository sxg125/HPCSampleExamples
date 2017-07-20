% XOR Implementation from the scratch
% Create a network with one input and 2 layers - hidden and the output
net = network(1,2);

% Let’s change the transfer functions to tansig and logsig for hidden and output layer:
 net.layers{1}.transferFcn = 'tansig';
 % net.layers{2}.transferFcn = 'logsig';
 
 % Now, assign the number of neurons as 4, 3 and 2 for first, second and the third layer
 net.layers{1}.size = 3;
 net.layers{2}.size = 1;
 
 % Change the initialization function for layers, as follows:

 net.layers{1}.initFcn = 'initnw';
 net.layers{1}.initFcn = 'initnw';

 
 % Toggle the value to 1 for all layers  to connect  bias
  net.biasconnect = [1;1]; % equivalent net.biasconnect{1} = 0
 
  % Connect the input to the first layer
 net.inputConnect(1,1) = 1; % input weight connection going to the 1st layer to the first input

 % Connect the output layer to the hidden layer
 net.layerconnect = [0 0; 1 0];

 % Connect the output to the output layer
 net.outputconnect=[0 1];
 
 % Input size (x & y) i.e. 2
 net.inputs{1}.size = 2;             % Displays on the bottom of the layer
 
 % Layers' Name
 net.layers{1}.name = 'Hidden Layer'; % Displays on the top of layer
 net.layers{2}.name = 'Output Layer'; % Xor needs at least one hidden layer

 % Set the initialization function to initialize according to layer
 % initialization function
 net.initFcn = 'initlay';
 
 % Set the learn function 'learngdm' to the weights going to the 2nd layer from the first layer
 net.layerWeights{2,1}.learnFcn = 'learngdm';
 
 % Learning occurs according to the Learning Parameters (LP) - learning rate (lr) and momentum constant (mc) given by:
LP.lr = 0.01;       % default is 0.01
LP.mc = 0.9;        % default is 0.9
 
 
 % Set the performance function to mse (mean squared error) and the training function to trainlm (Levenberg-Marquardt backpropagation) to meet the final requirement of the custom network.

net.performFcn = 'mse';
net.trainFcn = 'trainlm';
 
% Set the divide function to dividerand (divide training data randomly).

 net.divideFcn = 'dividerand';
 
 % Initialize the Network with the initial weights and biases
 net = init(net);
 
 % Input Data
 

 X = [ 0 0 1 1 0 0 1 1 ; 0 1 0 1 0 1 0 1 ]
%{
 X =

     0     0     1     1     0     0     1     1
     0     1     0     1     0     1     0     1
 %}
 
 % The target output is:
 T = [0 1 1 0 0 1 1 0];
 
 % Before Training, the output Y is:
 Y = sim(net,X)
 
 % Train the network
 net = train(net,X,T);
 
 % After the training, the output Y is:
 Y = sim(net,X)
 
 
 
