function res = gaussian_smooth(imBW)
    imBW=double(imBW);
    H = fspecial('gaussian', 10, 5);
    res = imfilter(imBW,H);
    
end