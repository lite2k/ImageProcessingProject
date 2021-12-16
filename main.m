%Read cases and resize operations

rear = imread('C:\Users\DELL\Desktop\image processing\1 Vehicle Logo Recognition\TestCases\Case2\Case2-Rear1.jpg'); 
%rear = imread('C:\Users\DELL\Desktop\image processing\1 Vehicle Logo Recognition\TestCases\Case2\Case2-Rear2.jpg');
%rear = imread('C:\Users\DELL\Desktop\image processing\1 Vehicle Logo Recognition\TestCases\Case1\Case1-Front1.bmp');
%rear = imread('C:\Users\DELL\Desktop\image processing\1 Vehicle Logo Recognition\TestCases\Case2\Case2-Front2.jpg');
%rear = imresize(rear ,[750 750]);
%front = imread('');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Preprocessing (filter, edge detect., etc....)

[H,W,D] = size(rear);
gray_Rear = rgb2gray(rear);
figure,imshow(gray_Rear);
%filtered = imgaussfilt(gray_Rear,'FilterSize',5);
bin_Rear = im2bw(gray_Rear);
%connected = bwconncomp(bin_Rear);
%stat = regionprops(connected,'Centroid');
%rectangle('position',bb,'edgecolor','r','linewidth',1.3);
%filtered = imgaussfilt(gray_Rear,2,'FilterSize',5);
edge = edge(bin_Rear,'canny');
[edge1,t,r] = hough(edge);
%bin_Rear = im2bw(edge);
figure,imshow(edge1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Cropping and scaling

%figure,imshow(bin_Rear);
%c = round([H W]/2);
%fraction = round([H W]/8);
%targetsize = [100 100];
%cropped = imcrop(rear,rear_crop);
%figure,imshow(cropped);
%rear_crop = bwconncomp(rear_crop);
%figure,imshow(edge1);
rear_crop = imcrop(edge1,[0 (H/3) W (H/3)]);
orig_crop = imcrop(rear,[0 (H/3) W (H/3)]);
empty = rear_crop;
empty(:) = 0; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Morphological analysis

%rear_erode = imerode(rear_crop,se);
%figure,imshow(rear_erode);
%figure,imshow(rear_dilate);
%diff = imsubtract(rear_dilate,rear_dilate);
%figure,imshow(bin_Rear);
%plot(c(1),c(2),'*r')
se = strel('square',1);
rear_dilate = imdilate(edge1,se);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Region detection and display

stats1 = regionprops (edge1, 'BoundingBox','Area');
[L ,num] = bwlabel(edge1);
figure,imshow(edge1);

for R=1:num
  bb = stats1(R).BoundingBox;
  rectangle('position',bb,'edgecolor','r','linewidth',1.3)
end
[H_orig,W_orig,D_orig] = size(orig_crop);

for R=1:num
  bb = stats1(R).BoundingBox;
  Area = stats1(R).Area;
  X = floor(bb(1));
  Y = floor(bb(2));
  W =bb(3);
  H = bb(4);
  if(Area <= 130 )%&& Area < 480)
      for i=Y:Y+H
          for j=X:X+W
              rectangle('position',bb,'edgecolor','g','linewidth',1.3)
%               el ma3ana ll empty
%               if(i>H+Y)
%                    i=H+Y;
%               if(i <= 0)
%                    i = 1;
%               end
% %               
% %               if(j>W+X)
% %                    j = W+X;
%               if(j <= 0)
%                    j = 1;
%               end
%               %rear_crop(i,j)
%               empty(i,j) = rear_dilate(i,j);
          end
      end 
  end
end
new = rear_dilate - empty;
stat2 = regionprops(new,'BoundingBox');
[l, num] = bwlabel(new);
%figure,imshow(empty);


% for index=1 : num
%     bb = stats1(index).BoundingBox;
%         if(bb(3) <= 40 && bb(4) <= 20)
%             for i =  ceil(bb(1)):floor(bb(1)+bb(3))
%                 for j = ceil(bb(2)) : floor(bb(2)+bb(4))
%                     if(i>H_orig)
%                         i=H_orig;
%                     elseif(i <= 0)
%                         i = 1;
%                     end
%                     if(j>W_orig)
%                         j =W_orig;
%                     elseif(j == 0)
%                         j = 1;
%                     end
%                     empty(j,i,1) = orig_crop(j,i,1);
%                     empty(j,i,2) = orig_crop(j,i,2);
%                     empty(j,i,3) = orig_crop(j,i,3);
%                 end
%             end
%         end
% end

%figure,imshow(newImage);