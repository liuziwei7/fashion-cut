function res = PostProcessing(img, label, options)

    label = post_dilate(label, 2, 2); % image erode and dilate        
    label = post_regionprops(label);% regionprops for the max region

    label = post_dilate(label, 2, 1); % image erode and dilate 
    label = post_regionprops(label); % regionprops for the max region
        
    label = gaussian_smooth(label);% gaussian smooth of the edges
          
    weight = options.postpro_weight;
    unary = generate_unary(label, weight); % generate unary for DenseCRF
    
    label = DenseCRF(img, unary, options, 2); % 2nd DenseCRF
    res = post_regionprops(label);  % save max region    
%     imwrite(label,[options.file_results 'bw.png']);

end