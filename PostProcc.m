function [ processed_im ] = PostProcc( Image )

%[H,W,D] = size(Image);
gray_Rear = rgb2gray(Image);
figure,imshow(gray_Rear);
adjusted = imadjust(gray_Rear,[0.3 0.7],[]);
%bin_Rear = im2bw(adjusted);
processed_im = edge(adjusted,'canny');
figure,imshow(processed_im);
%filtered = imgaussfilt(gray_Rear,'FilterSize',5);
%connected = bwconncomp(bin_Rear);
%stat = regionprops(connected,'Centroid');
%rectangle('position',bb,'edgecolor','r','linewidth',1.3);
%filtered = imgaussfilt(gray_Rear,2,'FilterSize',5);
%[edge1,t,r] = hough(edge_rear);
%bin_Rear = im2bw(edge);


end

