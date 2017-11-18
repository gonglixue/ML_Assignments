function show_face(fea)
% Input: fea -- face image dataset. Each 1x1024 row vector of fea is a data point.
% 每一行是一个样本

faceW = 32;
faceH = 32;

numPerLine = 20;
ShowLine = 2;
num_sample = size(fea, 1);

Y = zeros(faceH*ShowLine,faceW*numPerLine);
for i=0:ShowLine-1
   for j=0:numPerLine-1
     if i*numPerLine+j+1 >num_sample
         break;
     end
     Y(i*faceH+1:(i+1)*faceH,j*faceW+1:(j+1)*faceW) = reshape(fea(i*numPerLine+j+1,:),[faceH,faceW]);
   end
end
figure;
imagesc(Y);colormap(gray);axis image; axis off;
end