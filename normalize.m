function X = normalize(X)

m = size(X, 1);
n = size(X, 2);

for i = 1:n
  X(:, i) = (X(:, i) - min(X(:, i))) / (max(X(:, i)) - min(X(:, i)));
end;

end;