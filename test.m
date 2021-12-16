%Case1-Front1.bmp  %Case2-Front2.jpg %Case2-Rear1.jpg %Case2-Rear2.jpg
Image = imread('D:\image proccessing\OneDrive_2021-12-14\1 Vehicle Logo Recognition\TestCases\Case1\Case2-Rear2.jpg');
Image = rgb2gray(Image);
figure,imshow(Image);
J = imadjust(Image,[0.3 0.7],[]);
figure,imshow(J);
BW = edge(J,'canny');
figure, imshow(BW);
se=strel('line',4,0);
h=imdilate(BW,se);
figure,imshow(h);
stats1 = regionprops (h, 'BoundingBox');
[L ,num] = bwlabel(h);
for R=1:num
  bb = stats1(R).BoundingBox;
  %figure,imshow(bin_Rear);
  rectangle('position',bb,'edgecolor','r','linewidth',1.3)
end