function img = hack_pca(filename)
% Input: filename -- input image file name/path
% Output: img -- image without rotation
img_r = double(imread(filename));
% YOUR CODE HERE
[eigvector, eigvalue] = pca(img_r, 6);
angle = rad2deg(atan(eigvector(2,1) / eigvector(2,2)));
imshow(imrotate(imread(filename), angle));
      
end