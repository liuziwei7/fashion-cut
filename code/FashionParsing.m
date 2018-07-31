function labelmap = FashionParsing(img, landmarks, visibility, options)
% ===================================================================
% This is the main function of FashionParsing
% 
% ===================================================================
% INPUTS: 
%         img - input rgb image
%         landmarks - landmarks of the clothes
%         visibility - shows whether the landmarks are in the image
%         options - suitable parameters of the functions
% OUTPUTS:
%         labelmap - result of fashionparsing
% ===================================================================

    scores = PreProcessing(img, landmarks, visibility, options);   
    label = DenseCRF(img, scores, options, 1);
    labelmap = PostProcessing(img, label, options);

end
