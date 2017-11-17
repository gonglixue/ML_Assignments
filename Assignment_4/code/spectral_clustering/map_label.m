function idx = map_label(label)

k  = length(unique(label));
n = size(label,1);
min_label = min(label);
max_label = max(label);
bin_num = max_label - min_label + 1;
[bin,~] = hist(label, bin_num);

[bin_sort, bin_sort_i] = sort(bin, 2, 'descend');
bin_sort_i(bin_sort==0) = []; % 相当于前k个
bin_sort(bin_sort==0) = [];

bin_sort_i = bin_sort_i + min_label - 1;

idx = zeros(n, 1);
for i=1:n
    [~, idx(i)] = max(bin_sort_i==label(i));
end


end