function [ index ] = ExtractLogo(Region,num )
%figure,imshow(Image);
min = 1000;
index = 0;
 for R=1:num
       circularity = (Region(R).Perimeter .^ 2) ./ (4 * pi * Region(R).ConvexArea);
       if(circularity < min)
           min = circularity;
           index = R;
       end
 end
rectangle('position',Region(index).BoundingBox,'edgecolor','r','linewidth',1.3);
end

