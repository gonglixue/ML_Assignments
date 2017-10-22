function w = ridge(X, y, lambda)
%RIDGE Ridge Regression.
%
%   INPUT:  X: training sample features, P-by-N matrix.
%           y: training sample labels, 1-by-N row vector.
%           lambda: regularization parameter.
%
%   OUTPUT: w: learned parameters, (P+1)-by-1 column vector.
%

% YOUR CODE HERE
[P, N] = size(X);
X_design = [ones(1, N); X]';

I = eye(P+1);
I(1,1) = 0;

w = pinv( X_design'*X_design + lambda*I ) * X_design' * y';

end
