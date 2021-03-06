function [out_sensitivity] = relu_backprop(in_sensitivity, in)
%The backpropagation process of relu
%   input paramter:
%       in_sensitivity  : the sensitivity from the upper layer, shape: 
%                       : [number of images, number of outputs in feedforward]
%                           N*l1
%       in              : the input in feedforward process, shape: same as in_sensitivity
%   
%   output paramter:
%       out_sensitivity : the sensitivity to the lower layer, shape: same as in_sensitivity
%                         ? f'
% TODO
[N, l1] = size(in_sensitivity);
%out_sensitivity = zeros(N, l1);

out_sensitivity = in_sensitivity .* (in > 0);


end

