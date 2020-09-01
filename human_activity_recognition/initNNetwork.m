function [ theta, lambda ] = initNNetwork( X, y, Xval, yval, S );
%
%INITNNETWORK Initialize the parameters Theta and lambda for a neural network.
% [ theta, lambda ] = initNNetwork(X, y, Xval, yval, S) initializes the
% weight matrices and stores them in Theta and then uses cross validation
% to set the regularization parameter lambda.
%
% Parameters:
% ----------
%   X, y        :   Training data.
%   Xval, yval  :   Cross-validation data.
%   S           :   A vector containing the number of units in each layer of
%                   of the network.
%
% Returns:
% -------
%   theta       :   Weight matrices unrolled into a column vector.
%   lambda      :   The regularization parameter.
%
% ########################################################################


[ m , n ] = size(X);
L = length(S);          # number of layers
K = max(y);             # number of classes

% initialize weights
Theta = {};
for i = 2:L
    Theta{ i - 1 } = randInitializeWeights( S(i - 1), S(i) );
end

% unroll
init_params = [];
for i = 1:L - 1
    theta = Theta{i};
    init_params = [ init_params; theta(:) ];
end

% set options for fmincg
options = optimset('GradObj', 'on', 'MaxIter', 50);

% set regularization
lambda_range = [ 0.001, 0.003, 0.005, 0.01, 0.03, 0.05, 0.1, 0.3, 0.5, ...
                 1.0, 3.0, 5.0, 10.0, 30.0, 50.0 ];

best_accuracy = 0;
lambda = 0;

% set options for fmincg
options = optimset('GradObj', 'on', 'MaxIter', 20);

for l = lambda_range
    theta = fmincg(@(t)(nnCostFunction(t, S, X, y, l)), init_params, options);

    % check performance
    p = predict(theta, S, Xval);
    accuracy = mean(double(p == yval));
    
    if accuracy > best_accuracy
        best_accuracy =  accuracy;
        lambda = l;
    end
end

% use initial random weights for theta
theta = init_params;
