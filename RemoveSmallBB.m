function [ res ] = RemoveSmallBB( Image,Region,num )

for R=1:num
  bb = Region(R).BoundingBox;
  Area = Region(R).Area;
  X = floor(bb(1));
  Y = floor(bb(2));
  W =bb(3);
  H = bb(4);
  if(Area <= 300 )
      for i=Y:Y+H
          for j=X:X+W
              if(i <= 0)
                 i = 1;
              end
              if(j <= 0)
                   j = 1;
              end
              Image(i,j) = 0;
          end
      end 
  end
end

res = Image;
end

