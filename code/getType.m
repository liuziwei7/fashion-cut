function type = getType(landmarks, visibility, options)
    coeff = load(options.coeff);
    mean_shape = load(options.mean_shape);
    coeff = coeff.coeff;
    mean_shape = mean_shape.mean_shape;
    num_points = options.num_points;
    value = sum(landmarks*coeff.*mean_shape);
    if sum(visibility==2)>=3 || ...
         (sum(landmarks(3:4:num_points*2)-landmarks(1:4:num_points*2))<0)
        type=5;
    elseif sum(visibility==2)>=1     
        type=4;
    elseif  value<0.63 && sum(visibility==1)>=3      
        type=3;
    elseif  value<0.7     
        type=2;
    else       
        type=1;
    end           
end