function J = CostFunction(X, y, theta)
  % h = theta' * x = theta_0 * x_0 + theta_1 * x_1 (where x_0 = 1)
  % J = 1 / 2m * sum((h - y) ^ 2)
  m = length(y);
  h = X * theta;
  e = h - y;
  J = e' * e / 2 / m;
endfunction