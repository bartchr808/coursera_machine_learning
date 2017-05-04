function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

h = sigmoid(X*theta);
[J, grad] = costFunction(theta, X, y);

% remove the first theta to ignore; use this theta instead
temp_t = theta;
temp_t(1) = 0;

J = J + (lambda/(2*m))*sum(temp_t .^2);

grad(1) = 1 / m * sum((h - y) .* X(:, 1));

for j = 2:size(theta, 1)
    grad(j) = 1 / m * sum((h - y) .* X(:, j)) + (lambda/m)*temp_t(j);
end





% =============================================================

end
