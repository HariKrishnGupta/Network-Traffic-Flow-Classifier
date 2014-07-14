function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

J = 0;
grad = zeros(size(theta));

% Note: grad has the same dimensions as theta

hypothesis = sigmoid(X * theta);
things_to_sum = (-y .* log(hypothesis)) - ( (1 - y) .* log(1 - hypothesis) );
J = sum(things_to_sum) / m;
grad = (X' * (hypothesis - y)) / m;

% =============================================================

end
