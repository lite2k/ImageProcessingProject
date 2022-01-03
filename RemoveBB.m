function [ res,newRegion ] = RemoveBB( Image,Region,num )

for R=1:num
   Area = Region(R).Area;
   if(Area < 375 || Area > 2000)
       Region(R).BoundingBox(1) = 0;
       Region(R).BoundingBox(2) = 0;
       Region(R).BoundingBox(3) = 0;
       Region(R).BoundingBox(4) = 0;
   end
   

end

res = Image;
newRegion=Region;
end

