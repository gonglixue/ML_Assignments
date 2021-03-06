function w = linear_regression(X, y)
%LINEAR_REGRESSION Linear Regression.
%
%   INPUT:  X: training sample features, P-by-N matrix.
%           y: training sample labels, 1-by-N row vector.
%
%   OUTPUT: w:    learned perceptron parameters, (P+1)-by-1 column vector.
%

% YOUR CODE HERE
% for 2 class
% use normal equation
N = size(X,2);
X = [ones(1,N); X]';  %design matrix
w = pinv((X'*X))*X'*y';

end
