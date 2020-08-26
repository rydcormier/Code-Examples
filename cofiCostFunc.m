function [J, grad] = cofiCostFunc(params, Y, R, num_features, lambda)
%COFICOSTFUNC Collaborative filtering cost function
%   [J, grad] = COFICOSTFUNC(params, Y, R, num_users, num_movies, ...
%   num_features, lambda) returns the cost and gradient for the
%   collaborative filtering problem.
% =========================================================================
%   params          :   A vector containing the unrolled parameters.
%   Y               :   A matrix (num_items x num_users) storing user 
%                       reactions
%   R               :   Binary indicator matrix where R(i, j) = 1 indicates
%                       user j gave a rating to item i.
%   num_features    :   Dimension of parameter vectors.
%   lambda          :   Regularization parameter.
%
%   J               :   Cost function value.
%   grad            :   Vector containg the unrolled partial derivatives of
%                       the costfunction with respect to X and Theta.
%
%   Author          :   Ryan Cormier <rydcormier@gmail.com>
%   Date            :   8/23/20
% =========================================================================

% Determine dimensions
[ num_items, num_users ] = size( Y );

% Unfold the U and W matrices from params
X = reshape( params( 1:num_items * num_features ), num_items, num_features );
Theta = reshape( ...
    params( num_items * num_features + 1:end ), num_users, num_features);

% values to return            
J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));

% Compute predicion values and ignore empty reviews.
H = ( X * Theta' )(:); 
H( ~R(:) ) = 0;
H = reshape( H , num_items, num_users );

% unregularized cost
J = sum( sum( ( H - Y ) .^ 2 ) ) / 2;

% unregualized gradients
for i = 1:num_items
    idx = find( R( i, : ) );
    Theta_temp = Theta( idx, : );
    Y_temp = Y(i, idx);
    X_grad( i, : ) = ( X( i, : ) * Theta_temp' - Y_temp ) * Theta_temp;
end

for i = 1:num_users
    idx = find( R( :, i ) );
    X_temp = X( idx, : );
    Y_temp = Y( idx, i );
    Theta_grad( i, : ) = ( X_temp * Theta(i,:)' - Y_temp )' * X_temp;
end

% Add regularization to cost
J = J + ( lambda / 2 ) * ( sum( sum( Theta .^ 2 ) ) + sum( sum( X .^ 2 ) ) );

% add regularization to gradients
X_grad = X_grad + lambda * X;
Theta_grad = Theta_grad + lambda * Theta;

% unroll and we're done.
grad = [X_grad(:); Theta_grad(:)];

end
