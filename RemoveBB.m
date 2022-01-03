function [ res,newRegion ] = RemoveBB( Image,Region,num )

for R=1:num
   Area = Region(R).Area;
   if(Area < 375 || Area > 2000)
       Region(R).BoundingBox(1) = 0;
       Region(R).BoundingBox(2) = 0;
       Region(R).BoundingBox(3) = 0;
       Region(R).BoundingBox(4) = 0;
   end
   
%   X = floor(bb(1));
%   Y = floor(bb(2));
%   W =bb(3);
%   H = bb(4);
%   if(Area <= 400 )
%       for i=Y:Y+H
%           for j=X:X+W
%               if(i <= 0)
%                  i = 1;
%               end
%               if(j <= 0)
%                    j = 1;
%               end
%               Image(i,j) = 0;
%           end
%       end 
%   end
end

res = Image;
newRegion=Region;
end

