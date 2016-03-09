# Stochastic Linear Regression using Gradient Descent

function [theta, trError] = stLR(X, y, alpha, NumOfIterations)

m = size(X, 1);
n = size(X, 2);

theta = rand(n + 1, 1);
X = [ones(m, 1) X];

trError = [];

NewError = 0;
OldError = Inf;

j = 1;
#while abs(NewError - OldError) > threshold
for i = 1:NumOfIterations
  j = mod(j, m + 1);
  if j == 0
    j = 1;
    X = X(randperm(m), :);
    #alpha = alpha / 2;
  end;
  
  theta = theta - (alpha * ((X(j, :) * theta) - y(j)) * X(j, :)');
  
  OldError = NewError;
  NewError = (1 / (2*m)) * sum(((X * theta) - y).^2);
  
  trError = [trError NewError];
  
++j;
end;

plot(10:10:size(trError, 2), trError(10:10:size(trError, 2)), 'r');
xlabel('# of Iterations');
ylabel('Training Error');

end;