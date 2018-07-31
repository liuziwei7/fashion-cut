function label = DenseCRF(im, scores, options, rule)
% rule: different parameters
    
    file_densecrf = options.file_densecrf;
    dir_caches = options.dir_caches;
    if rule ~= 1
        params = num2str(options.param2_densecrf);
    else
        params = num2str(options.param1_densecrf);
    end
%     disp([' ' param]);
    if ~exist(dir_caches)        
        mkdir(dir_caches);
    end
    file_img = [dir_caches, 'img'];
    file_unary = [dir_caches, 'unary'];
    file_output = [dir_caches, 'output'];
       
    height_img = size(im, 1);
    width_img = size(im, 2);
    im = single(im);
    channel_features = 3;
    features = im;   
    num_label = size(scores,3);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % write img to binary file
    fid = fopen(file_img, 'wb');
    fwrite(fid, height_img, 'int');
    fwrite(fid, width_img, 'int');
    fwrite(fid, channel_features, 'int');
    img = permute(features, [2, 1, 3]);
    img = reshape(img, height_img * width_img, [])';
    assert(fwrite(fid, img, 'float') == height_img * width_img * channel_features);
    fclose(fid);
    % write unary to binary file
    fid = fopen(file_unary, 'wb');
    fwrite(fid, height_img, 'int');
    fwrite(fid, width_img, 'int');    
    unary = permute(scores, [2, 1, 3]);
    unary = reshape(unary, height_img * width_img, [])';
    assert(fwrite(fid, -unary, 'float') == height_img * width_img * num_label);
    fclose(fid);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % apply densecrf
%     tic;
    %type~=5
 
    system([file_densecrf, ' ', file_img, ' ', file_unary, ' ', file_output,' ', params]);
    %' 3', ' 6', ' 1', ' 3']);  
    
%     disp('Dense CRF Done.');

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % save results
    fid = fopen(file_output, 'rb');
    label = fread(fid,  height_img * width_img, 'uint8');
    label = reshape(label, width_img, height_img)';
    fclose(fid);    
        
end