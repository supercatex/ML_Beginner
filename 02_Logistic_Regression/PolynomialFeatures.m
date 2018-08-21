function X_new = PolynomialFeatures(X)
  [m, n] = size(X);
  X_new = [ones(m, 1), X];
  for i = 2:3
    X_new = [X_new, X .^ i];
  endfor
endfunction
