% 舊數據、視窗、輸出全清
clear; close all; clc;

% 載入數據
data = load('2.txt');
X = data(:, 1:2);
y = data(:, 3);

% 顯示數據
hold on;
for i = 0:1
  indices = find(y == i);
  plot(X(indices, 1), X(indices, 2), 'o');
endfor
hold off;

% 增加Features
X = PolynomialFeatures(X);
[m, n] = size(X);

% 初始化theta
theta = zeros(n, 1);
alpha = 0.1;
lambda = 0.1;
[J, grad] = CostFunction(X, y, theta, alpha, lambda)

% Gradient Descent (fminunc更有效率)
%theta = GradientDescent(X, y, 0.01, 500000);
options = optimset('GradObj', 'on', 'MaxIter', 1500);
[theta, cost] = ...
    fminunc(@(t)CostFunction(X, y, t, alpha, lambda), ...
    theta, options);

% 顯示分隔線
hold on;
u = linspace(min(X(:, 2)), max(X(:, 2)), 50);
v = linspace(min(X(:, 2)), max(X(:, 2)), 50);
z = zeros(length(u), length(v));
for i = 1:length(u)
  for j = 1:length(v)
    uv = PolynomialFeatures([u(i), v(j)]);
    z(j, i) = uv * theta;
  end
end
contour(u, v, z, [-1, 0, 1], 'LineWidth', 1);
hold off;