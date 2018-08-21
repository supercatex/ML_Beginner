% �¼ƾڡB�����B��X���M
clear; close all; clc;

% ���J�ƾ�
data = load('2.txt');
X = data(:, 1:2);
y = data(:, 3);

% ��ܼƾ�
hold on;
for i = 0:1
  indices = find(y == i);
  plot(X(indices, 1), X(indices, 2), 'o');
endfor
hold off;

% �W�[Features
X = PolynomialFeatures(X);
[m, n] = size(X);

% ��l��theta
theta = zeros(n, 1);
alpha = 0.1;
lambda = 0.1;
[J, grad] = CostFunction(X, y, theta, alpha, lambda)

% Gradient Descent (fminunc�󦳮Ĳv)
%theta = GradientDescent(X, y, 0.01, 500000);
options = optimset('GradObj', 'on', 'MaxIter', 1500);
[theta, cost] = ...
    fminunc(@(t)CostFunction(X, y, t, alpha, lambda), ...
    theta, options);

% ��ܤ��j�u
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