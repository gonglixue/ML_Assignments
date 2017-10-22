% You can use this skeleton or write your own.
% You are __STRONGLY__ suggest to run this script section-by-section using Ctrl+Enter.
% See http://www.mathworks.cn/cn/help/matlab/matlab_prog/run-sections-of-programs.html for more details.

%% Part1: Preceptron
nRep = 1000; % number of replicates
nTrain = 100; % number of training data
nTest = 1000;

E_train = 0;
E_test = 0;
avgIter = 0;
for i = 1:nRep
    [X, y, w_f] = mkdata(nTrain);
    [w_g, iter, train_error] = perceptron(X, y);
    % Compute training, testing error
    E_train = E_train + (train_error)/nTrain;
    % gen test-data
    [X_test, y_test] = mktestdata(nTest, w_f);
    X_test_predict = sign(w_g' * X_test); % 1 by N
    E_test = E_test + sum(X_test_predict ~= y_test)/nTest;
    
    % Sum up number of iterations
    avgIter = avgIter + iter;
end

E_train = E_train / nRep;
E_test = E_test / nRep;
avgIter = avgIter / nRep;
fprintf('E_train is %f, E_test is %f.\n', E_train, E_test);
fprintf('Average number of iterations is %d.\n', avgIter);
plotdata(X, y, w_f, w_g, 'Pecertron');

%% Part2: Preceptron: Non-linearly separable case
nTrain = 100; % number of training data
[X, y, w_f] = mkdata(nTrain, 'noisy');
[w_g, iter] = perceptron(X, y);


%% Part3: Linear Regression
nRep = 1000; % number of replicates
nTrain = 100; % number of training data
nTest = 1000;

E_train = 0;
E_test = 0;

for i = 1:nRep
    [X, y, w_f] = mkdata(nTrain);
    w_g = linear_regression(X, y);
    % Compute training, testing error
    % training error
    X_aug = [ones(1, size(X,2)); X];
    y_train = sign(X_aug'*w_g); % N by 1
    y_train = y_train';
    E_train = E_train + sum(y_train ~= y)/nTrain;
    
    % testing error
    [x_test, y_test] = mktestdata(nTest, w_f);
    y_test_predict = sign(w_g' * x_test);
    E_test = E_test + sum(y_test_predict ~= y_test)/nTest;
end

E_train = E_train / nRep;
E_test = E_test / nRep;
fprintf('E_train is %f, E_test is %f.\n', E_train, E_test);
plotdata(X, y, w_f, w_g, 'Linear Regression');

%% Part4: Linear Regression: noisy
nRep = 1000; % number of replicates
nTrain = 100; % number of training data
nTest = 1000;

E_train = 0;
E_test = 0;

for i = 1:nRep
    [X, y, w_f] = mkdata(nTrain, 'noisy');
    w_g = linear_regression(X, y);
    % Compute training, testing error
    % training error
    X_aug = [ones(1, size(X,2)); X];
    y_train = sign(X_aug'*w_g); % N by 1
    y_train = y_train';
    E_train = E_train + sum(y_train ~= y)/nTrain;
    
    % testing error
    [x_test, y_test] = mktestdata(nTest, w_f);
    y_test_predict = sign(w_g' * x_test);
    E_test = E_test + sum(y_test_predict ~= y_test)/nTest;
end

E_train = E_train / nRep;
E_test = E_test / nRep;
fprintf('E_train is %f, E_test is %f.\n', E_train, E_test);
plotdata(X, y, w_f, w_g, 'Linear Regression noisy');

%% Part5: Linear Regression: poly_fit
load('poly_train', 'X', 'y');
load('poly_test', 'X_test', 'y_test');
w = linear_regression(X, y)
% Compute training, testing error
%training error
X_aug = [ones(1, size(X,2)); X];
y_train = sign(w' * X_aug);
E_train = sum(y_train ~= y)/size(X,2);
% testing error
X_test_aug = [ones(1, size(X_test,2)); X_test];
y_test_predict = sign(w' * X_test_aug);
E_test = sum(y_test_predict ~= y_test)/size(X_test,2);
fprintf('E_train is %f, E_test is %f.\n', E_train, E_test);

% poly_fit with transform
%X_t = X; % CHANGE THIS LINE TO DO TRANSFORMATION
X_t = [X; X(1,:).*X(2,:); X(1,:).^2; X(2,:).^2];
%X_test_t = X_test; % CHANGE THIS LINE TO DO TRANSFORMATION
X_test_t = [X_test; X_test(1,:).*X_test(2,:); X_test(1,:).^2; X_test(2,:).^2];
w = linear_regression(X_t, y);
% Compute training, testing error
% training error
X_t_aug = [ones(1, size(X,2)); X_t];
y_t_train = sign(w' * X_t_aug);
E_train = sum(y_t_train ~= y)/size(X,2);
% testing error
X_test_t_aug = [ones(1, size(X_test,2)); X_test_t];
y_test_t_predict = sign(w' * X_test_t_aug);
E_test = sum(y_test_t_predict ~= y_test)/size(X_test,2);
fprintf('E_train is %f, E_test is %f.\n', E_train, E_test);


%% Part6: Logistic Regression
nRep = 100; % number of replicates
nTrain = 100; % number of training data
nTest = 1000;

E_train = 0;
E_test = 0;
for i = 1:nRep
    [X, y, w_f] = mkdata(nTrain);
    w_g = logistic(X, y);
    % Compute training, testing error
    y_train = sigmoid(w_g, [ones(1, size(X,2)); X]');  %y_train: N by 1
    E_train = E_train + sum(y_train' ~= y)/nTrain;
    % testing error
    [X_test, y_test] = mktestdata(nTest, w_f);
    y_test_predict = sigmoid(w_g, X_test');
    E_test = E_test + sum(y_test_predict' ~= y_test)/nTest;
    
end

E_train = E_train / nRep;
E_test = E_test / nRep;

fprintf('E_train is %f, E_test is %f.\n', E_train, E_test);
plotdata(X, y, w_f, w_g, 'Logistic Regression');

%% Part7: Logistic Regression: noisy
nRep = 100; % number of replicates
nTrain = 100; % number of training data
nTest = 1000;

E_train = 0;
E_test = 0;
for i = 1:nRep
    [X, y, w_f] = mkdata(nTrain, 'noisy');
    w_g = logistic(X, y);
    % Compute training, testing error
    y_train = sigmoid(w_g, [ones(1, size(X,2)); X]');  %y_train: N by 1
    E_train = E_train + sum(y_train' ~= y)/nTrain;
    % testing error
    [X_test, y_test] = mktestdata(nTest, w_f);
    y_test_predict = sigmoid(w_g, X_test');
    E_test = E_test + sum(y_test_predict' ~= y_test)/nTest;
    
end

E_train = E_train / nRep;
E_test = E_test / nRep;

fprintf('E_train is %f, E_test is %f.\n', E_train, E_test);
plotdata(X, y, w_f, w_g, 'Logistic Regression: noisy');

%% Part8: SVM
nRep = 1000; % number of replicates
nTrain = 100; % number of training data
nTest = 1000;

E_train = 0;
E_test = 0;
total_sv = 0;
for i = 1:nRep
    [X, y, w_f] = mkdata(nTrain);
    [w_g, num_sc] = svm(X, y);
    % Compute training, testing error
    y_train = sign(w_g'*[ones(1, size(X,2));X]);
    E_train = E_train + sum(y_train ~= y)/nTrain;
    % testing error
    [x_test, y_test] = mktestdata(nTest, w_f);
    y_test_predict = sign(w_g'*x_test);
    E_test = E_test + sum(y_test_predict ~= y_test)/nTest;
    % Sum up number of support vectors
    total_sv = total_sv + num_sc;
end

E_train = E_train / nRep;
E_test = E_test / nRep;
total_sv = total_sv/nRep;
fprintf('E_train is %f, E_test is %f. total_sv=%d\n', E_train, E_test, total_sv);
plotdata(X, y, w_f, w_g, 'SVM');
