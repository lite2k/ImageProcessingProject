function [ stats1,num ] = DrawBBox( Image )
%Region detection and display

stats1 = regionprops (Image, 'BoundingBox','Area');
[L ,num] = bwlabel(Image);
figure,imshow(Image);

for R=1:num
  bb = stats1(R).BoundingBox;
  rectangle('position',bb,'edgecolor','r','linewidth',1.3)
end

end

