function W = knn_graph(X, k, threshold)
%KNN_GRAPH Construct W using KNN graph
%   Input: X - data point features, n-by-p maxtirx.
%          k - number of nn.
%          threshold - distance threshold.
%
%   Output:W - adjacency matrix, n-by-n matrix.

% YOUR CODE HERE 


[N,P] = size(X);
distance = pdist2(X,X);
W = zeros(N, N);

[distance_sort, index_sort] = sort(distance, 2);
index_k = index_sort(:,1:k);
for i = 1:N;
    W(i, index_sort(i, distance_sort(i, 1:k) < threshold)) = 1;
    %W(i: index_k(i,:)) = 1;
    %W(i: distance(i,:)>threshold) = 0;
end

end
