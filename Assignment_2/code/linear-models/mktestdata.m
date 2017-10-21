function [X, y] = mktestdata(N, w)
% X: P+1 by N
% y: 1 by N
% w: P+1 by 1
range = [-1,1];
P = 2;

X = rand(P, N) * (range(2)-range(1)) + range(1);
X = [ones(1, N); X];
y = sign(w' * X);
end