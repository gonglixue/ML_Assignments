function img = hack_pca(filename)
% Input: filename -- input image file name/path
% Output: img -- image without rotation

img_r = double(imread(filename));
[eigvector, eigvalue] = PCA(img_r);

% YOUR CODE HERE

end