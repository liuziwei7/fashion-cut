function res = post_regionprops(img)
% regionprops
%     se3 = strel('disk',3); 
    res = img;
    L=bwlabel(img);
    stat=regionprops(logical(L),'area');
    area=cat(1,stat.Area);
    
    if size(area,1)~=0        
        img(L~=find(area==max(area)))=0;        
        res = img;
%         res=imerode(img,se3);
    end
end
