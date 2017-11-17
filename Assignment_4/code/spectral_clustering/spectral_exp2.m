load('TDT2_data', 'fea', 'gnd');
% gnd n*1

% construct graph
options = [];
options.NeighborMode = 'Supervised';
options.gnd = gnd;
options.bLDA = 1;
W = full(constructW(fea));

K = size(unique(gnd),1);
N = size(gnd, 1);
% 把gnd的标签映射为[1,K]
% 子集1最大
gnd_map = map_label(gnd);

iter = 100;

accu_rate_spectral = 0;
accu_rate_kmeans = 0;
mihat_spectral = 0;
mihat_kmeans = 0;
for i = 1:iter
    % spectral clustering
    idx = spectrals(W, K);
    idx_map = map_label(idx);
    % calculate accuracy rate;
    accu_num_spectral = sum(idx_map == gnd_map);
    accu_rate_spectral = accu_rate_spectral + accu_num_spectral / N;
    mihat_spectral = mihat_spectral + MutualInfo(idx_map, gnd_map);

    % keamns
    idx = kmeans(full(fea), K);
    idx_map = map_label(idx);
    % calculate accuracy rate
    accu_num_kmeans = sum(idx_map == gnd_map);
    accu_rate_kmeans = accu_rate_kmeans + accu_num_kmeans / N;
    mihat_kmeans = mihat_kmeans + MutualInfo(idx_map, gnd_map);
end

accu_rate_spectral = accu_rate_spectral / iter;
accu_rate_kmeans = accu_rate_kmeans / iter;
mihat_spectral = mihat_spectral / iter;
mihat_kmeans = mihat_kmeans / iter;

fprintf('accuracy of spectral: %f\n', accu_rate_spectral);
fprintf('accuracy of kmeans: %f\n', accu_rate_kmeans);
fprintf('mutual info of spectral: %f\n', mihat_spectral);
fprintf('mutual info of kmeans: %f\n', mihat_kmeans);
