load('ORL_data', 'fea_Train', 'gnd_Train', 'fea_Test', 'gnd_Test');
[N_train, P] = size(fea_Train); % 200 * 1024
N_test = size(fea_Test, 1);
% YOUR CODE HERE
show_face(fea_Train);
% 1. Feature preprocessing
% 2. Run PCA
% 3. Visualize eigenface
% 4. Project data on to low dimensional space
% 5. Run KNN in low dimensional space
% 6. Recover face images form low dimensional space, visualize them
num_pc = [8, 16, 32, 64, 128];
for i = 5:5
    [eigvector_train, eigvalue_train] = pca(fea_Train, num_pc(i));
    [eigvector_test, eigvalue_test] = pca(fea_Test, num_pc(i));
    

    % reduce
    low_dim_train_face = eigvector_train' * fea_Train'; % num_pc * N_train
    low_dim_test_face = eigvector_train' * fea_Test';

    % knn
    k = 1;
    label_test = knn(low_dim_test_face, low_dim_train_face, gnd_Train', k)'; % (1 by n_test)'
    accuracy_rate = sum(gnd_Test' == label_test') / N_test;
    fprintf('dimension:%d error rate: %f\n', num_pc(i), 1-accuracy_rate);
    
    
    
end

show_face(eigvector_train'); % 1024 * num_pc
% recover
recover_train_face = eigvector_train * low_dim_train_face;
show_face(recover_train_face');