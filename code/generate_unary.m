function unary = generate_unary(mask, weight)   
    unary(:,:,1)=weight *(1-mask);
    unary(:,:,2)=mask;
end