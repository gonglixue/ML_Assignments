function digits = hack(img_name)
%HACK Recognize a CAPTCHA image
%   Inputs:
%       img_name: filename of image
%   Outputs:
%       digits: 1x5 matrix, 5 digits in the input CAPTCHA image.

load('hack_data'); % load image_matrix and label_matrix
% YOUR CODE HERE
K = 80;
% load test image
test_image = extract_image(img_name); % 140 by 5
show_image(test_image);
% use knn
digits = knn(test_image, image_matrix, label_matrix, K);

end