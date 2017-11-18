function [eigvector, eigvalue] = pca(data, k)
%PCA	Principal Component Analysis
%
%             Input:
%               data       - Data matrix. Each row vector of fea is a data point.
%
%             Output:
%               eigvector - Each column is an embedding function, for a new
%                           data point (row vector) x,  y = x*eigvector
%                           will be the embedding result of x.
%               eigvalue  - The sorted eigvalue of PCA eigen-problem.
%

[N, P] = size(data);
centered_data = data - repmat(mean(data), N, 1);
S = centered_data' * centered_data;
[eigvector, eigvalue] = eigs(S, k, 'LM');

eigvalue = diag(eigvalue)';
% sort
%[sort_eigvalue, sort_eigvalue_i] = sort(eigvalue, 2, 'descend');
%eigvector = eigvector(:, sort_eigvalue_i);

end