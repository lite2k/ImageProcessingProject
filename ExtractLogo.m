function [ index ] = ExtractLogo(Region,num )

minC = 1000;

index = 0;
b = [0,0,0,0];
 for R=1:num
     bb = Region(R).BoundingBox;
     if(bb == b)
         continue;
     else
       circularity = (Region(R).Perimeter .^ 2) ./ (4 * pi * Region(R).ConvexArea);
       if(circularity < minC )
           minC = circularity;
           index = R;
       end
     end
 end
rectangle('position',Region(index).BoundingBox,'edgecolor','r','linewidth',1.3);
end

