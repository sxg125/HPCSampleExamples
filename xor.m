N=200;
u = rand(2,N);                      % 2 X 200 Matrix
u = u > 0.5;                        % Getting 0s and 1s. If each element is greater than 0.5 assign 1 else assign 0
u = double(u);                      % type cast double for preceiosn

%Randomly generate training set; actual output obtained from the input with the raining data

y = zeros(1,size(u,2));             % size(u) gives the matrix size; size(u,2) return the number of columns
for i = 1:1:size(u,2)               % For all values of y
if u(1,i) == u(2,i)                 % y gets 0 if both the inputs are same
y(i) = 0;
else
y(i) = 1;                           % y gets 1 if both inputs are different
end
end

%Solution for randomly generated training data prepared - XNOR gate results
%are calculated

u_train = u(:,1:N/2);                % Training data from the half portion (column)  of randomly generated data
u_test = u(:,N/2+1:N);               % Test data from the other half
y_train = y(:,1:N/2);                % trained output
y_test = y(:,N/2+1:N);               % test output
%Test and Training data separated

% create a new neural network (Feed Forward (ff))
% Old ways
% net = newff(u_train, y_train, 3)     % training data (u_train), target data(y_train), and number of layers (3)
% New Ways
net = feedforwardnet([3]); % feedforwardnet([3 2 1]) create three hidden layers with 3,2, & 1 neurons repectively

% simulate prior to training
[y_train_sim, pf] = sim(net, u_train);  % output: Simulated output and Performance (pf); input: model (net) and training data (U_train)
figure, plot(y_train);  %training solution
hold on;
plot(y_train_sim,'r:'); %solution obtained from the system
hold off;
title('Simulation results (before training)');
xlabel('Samples');
ylabel('Value');


% train and simulate again
[net,tr] = train(net,u_train,y_train);   % train the newtwork with training data (u_train) and target/output data (y_train)
[y_train_sim, pf] = sim(net, u_train);   % Run the simulation after training
figure, plot(y_train);
hold on;
plot(y_train_sim,'r:');
hold off;
title('Simulation results (after training)');
xlabel('Samples');
ylabel('Value');


% simulate on testing set
[y_test_sim, pf] = sim(net, u_test);      % Try the testing set (u_test)
figure, plot(y_test);
hold on;
plot(y_test_sim,'r:');
hold off;
title('Simulation results (testing set, after training)');
xlabel('Samples');
ylabel('Value');
