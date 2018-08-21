function theta = GradientDescent(X, y, alpha, iterations)
  [m, n] = size(X);
  theta = zeros(n, 1);
  for i = 1:iterations
    [J, grad] = CostFunction(X, y, theta);
    theta -= grad * alpha;
  endfor
endfunction
