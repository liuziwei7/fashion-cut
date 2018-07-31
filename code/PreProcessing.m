function unary = PreProcessing(img, landmarks, visibility, options)
    
    type = getType(landmarks, visibility, options); % get pose type
    [mask, overlap] = getROI(img, landmarks, options); % generate ploygen
    mask = gaussian_smooth(mask); % add gaussian smooth
    weight = getWeight(type, overlap); % get weights for different cases
    
    unary = generate_unary(mask, weight);% generate unary for DenseCRF
end