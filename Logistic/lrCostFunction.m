function [J, grad] = lrCostFunction(theta, X, y, lambda)
% Compute the cost function and gradient of cost function

m = length(y);
z=X*theta;
h=sigmoid(z);

J=-(1/m)*(y'*log(h)+(1-y)'*log(1-h))+(lambda)/(2*m)*(theta(2:end,:)'*(theta(2:end,:)));
grad=(1/m)*((X'*(h-y)));
grad(2:end)= grad(2:end)+lambda/m.*theta(2:end);

grad = grad(:);

end
