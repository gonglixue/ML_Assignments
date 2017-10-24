function w = logistic_r(X, y, lambda)
%LR Logistic Regression.
%
%   INPUT:  X:   training sample features, P-by-N matrix.
%           y:   training sample labels, 1-by-N row vector.
%           lambda: regularization parameter.
%
%   OUTPUT: w    : learned parameters, (P+1)-by-1 column vector.
%

% YOUR CODE HERE
y = (y==1);
[P,N] = size(X);
X_design = [ones(1,N); X]';
w = rand(P+1, 1);

h = 1 ./ (1+exp(-1*X_design*w));
loss = (1/N) * (-1*y*log(h) - (1-y)*log(1-h)) + (lambda/(2*N)) * (w'*w);

max_iter = 3000;
learning_rate = 0.08;
for i=1:max_iter
    reg_term = [0; w(2:end)]; 
    h = 1./(1+exp(-1*X_design*w));
    h = h - (h==1)*0.0001;
    w = w - (learning_rate/N)*(X_design'*(h-y') + lambda*reg_term);
    loss = (1/N) * (-1*y*log(h) - (1-y)*log(1-h)) + (lambda/(2*N)) * (w'*w);
end
%fprintf('final loss: %f\n',loss);
end
