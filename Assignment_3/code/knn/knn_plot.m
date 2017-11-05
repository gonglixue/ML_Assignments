function knn_plot(X, y, K)
% X: 2 * (N1+N2)
figure;
ma = {'ko','ks'};
fc = {[0 0 0],[1 1 1]};
ty = unique(y); %不同的label

for i = 1:length(ty)
    pos = find(y==ty(i));
    plot(X(1, pos), X(2, pos), ma{i},'markerfacecolor', fc{i}); %画出不同类别的散点
    hold on
end

[Xv Yv] = meshgrid(min(X(1,:)):0.05:max(X(1,:)),...
                   min(X(2,:)):0.05:max(X(2,:)));
XX = [Xv(:)'; Yv(:)'];
classes = knn(XX, X, y, K)';
contour(Xv,Yv, reshape(classes, size(Xv)), [0.5 0.5], 'k')

ti = sprintf('K = %g',K);
title(ti);

hold off;
end