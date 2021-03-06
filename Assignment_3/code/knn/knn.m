function y = knn(X, X_train, y_train, K)
%KNN k-Nearest Neighbors Algorithm.
%
%   INPUT:  X:         testing sample features, P-by-N_test matrix.
%           X_train:   training sample features, P-by-N matrix.
%           y_train:   training sample labels, 1-by-N row vector.
%           K:         the k in k-Nearest Neighbors
%
%   OUTPUT: y    : predicted labels, 1-by-N_test row vector.
%

% YOUR CODE HERE
% calculat the distance between X and X_train
N_test = size(X, 2);
N_train = size(X_train, 2);
distance = zeros(N_test, N_train); % 每一行是一个测试样本的距离情况

for i=1:N_train
    train_sample = X_train(:,i);
    distance_i = sum((X - repmat(train_sample,1,N_test)).^2); % 1 * N_test
    distance(:,i) = sqrt(distance_i');
    
end

% sort
[distance_sort, index_sort] = sort(distance, 2, 'ascend');

first_k_index = index_sort(:, 1:K);
first_k_label = y_train(first_k_index); % N_test* K

if K==1
    y = first_k_label;  
else
    % count the nums of label
    [hist_bar hist_bin_label] = hist(first_k_label', 0:max(max(first_k_label))); %直方图bin是0~最大的label
    %hist_bar label_num * N_test
    [max_value max_index] = max(hist_bar);
    y = hist_bin_label(max_index);
end




end

