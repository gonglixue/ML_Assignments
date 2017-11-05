img = imread('aa.jpg');
fea = double(reshape(img, size(img, 1)*size(img, 2), 3));
figure;
imshow(uint8(reshape(fea, size(img))));
% YOUR (TWO LINE) CODE HERE
K = [8,16,32,64];
for i = 1:length(K)
   [idx, ctrs, iter_ctrs] = kmeans(fea, K(i));
   fea_out = ctrs(idx,:);
   figure;
   imshow(uint8(reshape(fea_out, size(img))));
end

