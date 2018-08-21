function [X_norm, mu, sigma] = FeatureNormalize(X)
  mu = mean(X);
  sigma = std(X);
  X_norm = X;
  X_norm = (X - mu) ./ sigma;
endfunction
