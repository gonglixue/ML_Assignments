img = imread('sample1.jpg');
fea = double(reshape(img, size(img, 1)*size(img, 2), 3));
% YOUR (TWO LINE) CODE HERE
K = 10;
[idx, ctrs, iter_ctrs] = kmeans(fea,K);
kmeans_plot(fea, idx, ctrs, iter_ctrs)

fea = ctrs(idx,:);
imshow(uint8(reshape(fea, size(img))));
