function [w, iter, train_error] = perceptron(X, y)
%PERCEPTRON Perceptron Learning Algorithm.
%
%   INPUT:  X: training sample features, P-by-N matrix.
%           y: training sample labels, 1-by-N row vector.
%
%   OUTPUT: w:    learned perceptron parameters, (P+1)-by-1 column vector.
%           iter: number of iterations
%
P = size(X, 1); % numbers of row in X, num of feature
N = size(X, 2);
X = [ones(1, N); X];  % add first const feature
w = rand(P+1, 1);

learning_rate = 0.001;
iter = 0;
iter_limit = 1000;
loss = N;

for i=1:iter_limit
   predict = sign(w'*X);
   for j = 1:N
       if predict(1,j) * y(1,j) >= 0
           % nothing
       else
           %grad = (-1 * X(:,j) * y(1,j));
           %w =  w - learning_rate * grad;
           w = w + learning_rate * X(:,j) * y(1,j);
       end
       
   end
   
   loss = sum(predict ~= y);
   
   if loss == 0
      iter = i;
      break;
   end
end

train_error = loss;

if loss ~= 0
   fprintf('can not converge. loss: %d iter:%d\n', loss, iter);
else
    fprintf('classify all point correctly. loss: %d iter: %d\n', loss, iter);
end

end
