function [J, grad] = CostFunction(X, y, theta, alpha, lambda)
  m = length(y);
  h = Sigmoid(X * theta);
  p = theta' * theta .* lambda ./ m ./ 2;
  J = -(y' * log(h) + (1 - y)' * log(1 - h)) ./ m + p;
  grad = (X' * (h - y) + lambda .* theta) ./ m .* alpha;
endfunction
