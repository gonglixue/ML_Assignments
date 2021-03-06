function [idx, ctrs, iter_ctrs] = kmeans(X, K)
%KMEANS K-Means clustering algorithm
%
%   Input: X - data point features, n-by-p maxtirx.
%          K - the number of clusters
%
%   OUTPUT: idx  - cluster label N by 1 每个样本属于哪个cluster
%           ctrs - cluster centers, K-by-p matrix.
%           iter_ctrs - cluster centers of each iteration, K-by-p-by-iter
%                       3D matrix.

% YOUR CODE HERE
% 从X中随机选取K个点作为聚类中心
[N,P] = size(X);
iter_times = 10000;

ctrs_index = randperm(N, K);  %k个聚类中心在样本中的index 1 by K? unique?
ctrs = X(ctrs_index, :); %每一行是一个聚类中心坐标 K by P


iter_ctrs = [];
iter_ctrs(:,:,1) = ctrs;

old_idx = zeros(N,1);
for i=2:iter_times
   %计算每个样本与每个聚类中心的距离
   distance = pdist2(X, ctrs, 'euclidean'); % N by K
   %计算每个样本属于哪个聚类中心
   [distance_sort, idx] = min(distance,[],2);
   %belong_to_center_index = center_index(:,1); % N by 1
   if(all(idx==old_idx))
       break;
   end
   
   old_idx = idx;
   %计算新的聚类中心
   for j=1:K
      X_this_cluster = repmat(idx == j, 1, P) .* X;
      ctrs(j,:) = sum(X_this_cluster) ./ sum(idx==j);
   end
   
   iter_ctrs(:,:,i) = ctrs;
end

fprintf('iter_time: %d\n', i);

end
