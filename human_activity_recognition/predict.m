function p = predict(theta, S, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network theta with architecture defined by S.

% Useful values
m = size(X, 1);
L = length(S);

% reshape Theta
last = 0;
Theta = {};
for i = 2:L
    L_in = S(i - 1);
    L_out = S(i);
    first = last + 1;
    last = first + ((1 + L_in) * L_out); 
    Theta{ i - 1 } = reshape( theta(first:last), L_out, 1 + L_in );
end

% Feed forward to get values
h = [];
for i = 1:L-1
    h = sigmoid([ones(m, 1) X] * Theta{i}');
end

[~, p] = max(h, [], 2);
% =========================================================================


end
