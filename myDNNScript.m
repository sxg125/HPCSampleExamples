% Classify images of digits using Deep Neural Network (DNN)

% Load the training data into memory
[xTrainImages,tTrain] = digittrain_dataset;

% Display some of the training images
clf
for i = 1:20
    subplot(4,5,i);
    imshow(xTrainImages{i});
end


% set the random number generator seed
rng('default')

% Set the size of the first hidden layer for the autoencoder
hiddenSize1 = 100;

% Train the first auto-encoder - unsupervised learning
autoenc1 = trainAutoencoder(xTrainImages,hiddenSize1, ...
    'MaxEpochs',400, ...
    'L2WeightRegularization',0.004, ...
    'SparsityRegularization',4, ...
    'SparsityProportion',0.15, ...
    'ScaleData', false);

% vector of weights associated with the auto-encoder
figure()
plotWeights(autoenc1);

% the features learned by the autoencoder represent curls and stroke patterns from the digit images
%  use the encoder from the trained autoencoder to generate the features (feat1 to feed second auto-encoder
feat1 = encode(autoenc1,xTrainImages);

hiddenSize2 = 50;
% Train the second auto-encoder - unsupervised learning
autoenc2 = trainAutoencoder(feat1,hiddenSize2, ...
    'MaxEpochs',100, ...
    'L2WeightRegularization',0.002, ...
    'SparsityRegularization',4, ...
    'SparsityProportion',0.1, ...
    'ScaleData', false);

% Generate the feature to feed softmax layer
feat2 = encode(autoenc2,feat1);

% Train a Softmax Layer - supervised learning using labels or traget for the training data (tTrain)
softnet = trainSoftmaxLayer(feat2,tTrain,'MaxEpochs',400);

% Stacked auto-encoders and Softmax layer to form a Deep Neural Network
deepnet = stack(autoenc1,autoenc2,softnet);

% View DNN
view(deepnet)

% Get the number of pixels in each image
imageWidth = 28;
imageHeight = 28;
inputSize = imageWidth*imageHeight;

% Load the test images
[xTestImages,tTest] = digittest_dataset;

% Turn the test images into vectors and put them in a matrix
xTest = zeros(inputSize,numel(xTestImages));
for i = 1:numel(xTestImages)
    xTest(:,i) = xTestImages{i}(:);
end

% Get the output without training the DNN & visualize a result in a confusion Matrix
y = deepnet(xTest);
plotconfusion(tTest,y);

% Turn the training images into vectors and put them in a matrix
xTrain = zeros(inputSize,numel(xTrainImages));
for i = 1:numel(xTrainImages)
    xTrain(:,i) = xTrainImages{i}(:);
end

% Perform fine tuning by training
deepnet = train(deepnet,xTrain,tTrain);

% Visulaize the results after the training
y = deepnet(xTest);
plotconfusion(tTest,y);
