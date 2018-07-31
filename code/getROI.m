function [roi, overlap] = getROI(img, landmarks, options)
    H = size(img, 1);
    W = size(img, 2);    
    n = options.ployseq;
    markx = landmarks(2*n-1);
    marky = landmarks(2*n);
    markx = markx.* W + W/2;
    marky = marky.* H + H/2;
    roi = roipoly(img,markx,marky);
    roiarea = polyarea(markx,marky);
    overlap = roiarea / (H*W);
end