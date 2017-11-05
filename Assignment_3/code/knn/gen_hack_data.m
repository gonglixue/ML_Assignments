% use the first 50 images in ./hack_py/source_image/img_%d.jpg
N_img = 100;
N = N_img*5;
image_matrix = []; % 140 by 250
label_matrix = load('./hack_py/label_100img.txt'); % 50 by 5

% parse label to 1 by (5*50)
label_matrix = reshape(label_matrix',[1,N]); % 1 by 250

for i=0:N_img-1
    %fprintf('%d\n', i);
    file_name = sprintf('./hack_py/source_image/img_%d.jpg',i)
    image_i = extract_image(file_name);
    image_matrix = [image_matrix image_i];
end

save hack_data image_matrix label_matrix;

