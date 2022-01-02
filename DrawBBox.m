function [ num ] = DrawBBox( Image,Region ,color)
%Region detection and display

% Region = regionprops (Image, 'BoundingBox','Area','ConvexArea','Perimeter');
[L ,num] = bwlabel(Image);

for R=1:num
  bb = Region(R).BoundingBox;
  rectangle('position',bb,'edgecolor',color,'linewidth',1.3)
end

end

