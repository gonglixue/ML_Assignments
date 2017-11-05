%% (a)
K = 2;
load('kmeans_data');

iter_times = 1000;
max_total = -1;
min_total = 10000;

for i = 1:iter_times
   [idx, ctrs, iter_ctrs] = kmeans(X,K);
   distance = pdist2(X, ctrs, 'euclidean');
   total_d2c = sum(sqrt(sum((X - ctrs(idx,:)).^2, 2)));
   
   if total_d2c > max_total
      max_total = total_d2c;
      idx_max = idx;
      ctrs_max = ctrs;
      iter_ctrs_max = iter_ctrs;
   end
   if total_d2c < min_total
      min_total = total_d2c;
      idx_min = idx;
      ctrs_min = ctrs;
      iter_ctrs_min = iter_ctrs;
   end
end

kmeans_plot(X, idx_min, ctrs_min, iter_ctrs_min)
figure;
kmeans_plot(X, idx_max, ctrs_max, iter_ctrs_max);