% Linear Regression - 線性迴歸
% Finding the curve that best fits your data is called regression, 
% and when that curve is a straight line, it's called linear regression.
% 找出符合資料規律的最佳直線，就叫作線性迴歸。

% 清空變量、關閉所有視窗、清空終端視窗
clear; close all; clc;

% Step 1: Load data
data = load('sample_data_1.txt');
X = data(:, 1);
y = data(:, 2);

% Step 2: Display data
plot(X, y, 'x');

% Step 3: Normalize feature
mu = 0;
sigma = 1;
[X, mu, sigma] = FeatureNormalize(X);
[m, n] = size(X);
X = [ones(m, 1), X];

% Step 4: try to compute the cost
cost = CostFunction(X, y, zeros(n, 1));
printf('If all theta equal to 0, the cost should be %.2f.\n', cost);

% Step 5: Gradient Descent
[theta, J_history, theta_history] = GradientDescent(X, y, 0.01, 1500);
printf('After 1500 iterations and 0.01 learning rate, theta shoud be:\n');
theta
% theta = inverse(X' *X) * X' * y
printf('Nomral equations:\n');
theta_nq = inv(X' * X) * X' * y

% Step 6: Predict
hold on;
plot([5; 25], [ones(2, 1), ([5; 25] - mu) ./ sigma] * theta, '-');
hold off;
pause;

% Step 7: display cost and theta history
plot(1:length(J_history), J_history, '-');
printf('Cost: %.2f\n', J_history(end));
pause;

theta1_vals = linspace(-10, 10, 100);
theta2_vals = linspace(-10, 10, 100);
J_vals = zeros(length(theta1_vals), length(theta2_vals));
for i = 1:length(theta1_vals)
	for j = 1:length(theta2_vals)
		t = [theta1_vals(i); theta2_vals(j)];    
		J_vals(j, i) = CostFunction(X, y, t);
	end
end

contour(theta1_vals, theta2_vals, J_vals, logspace(-2, 3, 15));
xlabel('\theta_1'); ylabel('\theta_2');
hold on;
for i = 1:10:length(theta_history)
  plot(theta_history(i, 1), theta_history(i, 2), 'o');
  drawnow;
end
hold off;