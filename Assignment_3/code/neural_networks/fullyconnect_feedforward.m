function [out] = fullyconnect_feedforward(in,  weight, bias)
%The feedward process of fullyconnect
%   input parameters:
%       in      : the intputs, shape: [number of images, number of inputs]
%       weight  : the weight matrix, shape: [number of inputs, number of outputs]
%       bias    : the bias, shape: [number of outputs, 1]
%
%   output parameters:
%       out     : the output of this layer, shape: [number of images, number of outputs]

% TODO

% num_of_l2_unit = size(weight, 2);  %��һ����Ԫ����

out = in * weight;
out = out + repmat(bias', size(out,1), 1);

end

