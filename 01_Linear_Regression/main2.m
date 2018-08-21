
clear; close all; clc;

data = load('sample_data_2.txt');
X = data(:, 1:2);
y = data(:, 3);

[X, mu, sigma] = FeatureNormalize(X);
X = [ones(size(X, 1), 1), X];

[theta, J_history, theta_history] = GradientDescent(X, y, 0.1, 600);
theta
% theta = inverse(X' *X) * X' * y
printf('Nomral equations:\n');
theta_nq = inv(X' * X) * X' * y

plot(1:length(J_history), J_history, '-');

[1, ([1300, 3] - mu) ./ sigma] * theta