function y = sigmoid(w, X_design)
% X_design: N by P+1
% w: P+1 by 1
% y: 1 or -1 N by 1

h = 1./ (1+ exp(-1*X_design*w)); %h(i) (0,1)
y = sign(h .* 2 -1);
end