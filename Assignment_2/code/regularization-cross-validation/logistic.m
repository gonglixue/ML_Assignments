function w = logistic(X, y)
%LR Logistic Regression.
%
%   INPUT:  X:   training sample features, P-by-N matrix.
%           y:   training sample labels, 1-by-N row vector.
%
%   OUTPUT: w    : learned parameters, (P+1)-by-1 column vector.
%
%


% YOUR CODE HERE
% y=1 or y=0
y = (y == 1);

[P N] = size(X);
X_design = [ones(1, N); X]';
w = rand(P+1, 1);

h = 1./(1 + exp(-1*X_design*w));
loss = (1/N) * (-1 * y * log(h) - (1-y)*log(1-h));

max_iter = 5000;
learning_rate = 0.02;
for i=1:max_iter
   h = 1./(1+exp(-1*X_design*w));
   w =  w - (learning_rate/N)*X_design'*(h-y');
   
   h = 1./(1 + exp(-1*X_design*w));
   loss = (1/N) * (-1 * y * log(h) - (1-y)*log(1-h));
end

end