function vmap=alphamask(img, labelmap, options)
% Combine original image with binary mask
    alpha = options.alpha;
    vmap = double(img)/255;
    vmap(:,:,1) =vmap(:,:,1).*(1-labelmap*alpha(1)) + labelmap*alpha(1);
    vmap(:,:,2) =vmap(:,:,2).*(1-labelmap*alpha(2)*4) +labelmap*alpha(2); 
    vmap(:,:,3) =vmap(:,:,3).*(1-labelmap*alpha(3)*4) +labelmap*alpha(3);    
end