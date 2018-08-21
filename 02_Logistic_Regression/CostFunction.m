function [J, grad] = CostFunction(X, y, theta)
  m = length(y);
  h = Sigmoid(X * theta);
  J = -(y' * log(h) + (1 - y)' * log(1 - h)) ./ m;
  grad = X' * (h - y) ./ m;
endfunction
