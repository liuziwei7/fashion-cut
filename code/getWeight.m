function w = getWeight(type, overlap)
    if type==1
        w=0.8;
    elseif type == 2
        w=0.3;
    elseif type ==3
        if overlap > 0.1
            w=sqrt(overlap);
        else
            w=max(overlap,0.03);
        end    
    elseif type ==4
        if overlap > 0.1
            w=overlap;
        else
            w=0.05;
        end
    else       
%         if overlap > 0.15
%             w=(overlap);
%         else
            w=overlap;
%         end
    end   
end