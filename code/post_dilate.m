function res = post_dilate(img,param_erode, param_dilate)
% image erode and dilate    
    se1 = strel('disk', param_erode);
    se2 = strel('disk', param_dilate);
    
    res = imerode(img,se1);
    res = imdilate(res,se2);
end