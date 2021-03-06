function [weight_grad, bias_grad, out_sensitivity] = fullyconnect_backprop(in_sensitivity,  in, weight)
%The backpropagation process of fullyconnect
%   input parameter:
%       in_sensitivity  : the sensitivity from the upper layer, shape: 
%                       : [number of images, number of outputs in
%                       feedforward] N*l2
%       in              : the input in feedforward process, shape: 
%                       : [number of images, number of inputs in
%                       feedforward] N*l1
%       weight          : the weight matrix of this layer, shape: 
%                       : [number of inputs in feedforward, number of outputs in feedforward]
%                           l1 * l2
%   output parameter:
%       weight_grad     : the gradient of the weights, shape:  l1 * l2
%                       : [number of inputs in feedforward, number of outputs in feedforward]
%       out_sensitivity : the sensitivity to the lower layer, shape:  
%                           N * l1
%                       : [number of images, number of inputs in feedforward]
%       bias_grad : l2 * 1
% Note : remember to divide by number of images in the calculation of gradients.

% TODO
[N, l1] = size(in);
l2 = size(in_sensitivity, 2);

% weight_grad = -1 * in' * in_sensitivity ./ N;
weight_grad = in' * in_sensitivity ./ N;
out_sensitivity = in_sensitivity * weight'; % f'?

net_bias_grad = ones(N, 1);
% bias_grad = -1 * in_sensitivity'* net_bias_grad ./ N;
bias_grad = in_sensitivity'* net_bias_grad ./ N;

end

