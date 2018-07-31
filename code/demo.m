% =====================================================
%                     Fashion Cut
% ===================================================== 
% This is the demo code of the Fashion Cut Project
% 
% =====================================================

clear, clc;
dir_img = '../img/';
dir_data = '../data/';
img_name = load([dir_data 'test_name.mat']);
landmarks = load([dir_data 'test_landmarks.mat']);
visibility = load([dir_data 'test_visibility.mat']);

img_name = img_name.name;
landmarks = landmarks.landmarks;
visibility = visibility.visibility;

options = config();

N = 5000;
% for i = 1:N
for i = 2001:2020

    close all;
    img = imread([dir_img, img_name{i}]);
    labelmap = FashionParsing(img, landmarks(i,:), visibility(i,:), options);
    vmap = alphamask(img, labelmap, options);

    % figure(i),
    % subplot(1,2,1); imshow(img);
    % subplot(1,2,2); imshow(vmap);
    % imwrite(labelmap, [options.file_results, img_name{i}(1:end-4), '.png']);
    % saveas(figure(1), ['../results/fig_', img_name{i}]);

    imwrite(vmap, [options.file_results, img_name{i}(1:end-4), '.png']);

end