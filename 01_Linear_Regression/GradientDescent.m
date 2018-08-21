function [theta, J_history, theta_history] = GradientDescent(X, y, alpha, iterations)
  % theta_j = theta_j - alpha / m * sum((h - y) * x_j)
  m = length(y);
  n = size(X, 2);
  theta = zeros(n, 1);
  J_history = CostFunction(X, y, theta);
  theta_history = theta';
  for i = 1:iterations
    theta = theta - X' * (X * theta - y) / m * alpha;
    J_history = [J_history; CostFunction(X, y, theta)];
    theta_history = [theta_history; theta'];
  end
endfunction