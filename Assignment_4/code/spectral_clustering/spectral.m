function idx = spectral(W, k)
%SPECTRUAL spectral clustering
%   Input:
%     W: Adjacency matrix, N-by-N matrix
%     k: number of clusters
%   Output:
%     idx: data point cluster labels, n-by-1 vector.  // from zero?

% YOUR CODE HERE
N = size(W,1);
D = diag(sum(W,2)); 

L = D - W;
%计算L的前k特征向量
[eig_vec, eig_value] = eig(L);
% 对特征值排序
[sort_eig_value_v, sort_eig_value_i] = sort(diag(eig_value));
%eig_vec_k = eig_vec(:,1:k);  % n by k
eig_vec_k = eig_vec(:,sort_eig_value_i(1:k));

idx = kmeans(eig_vec_k, k);
end
