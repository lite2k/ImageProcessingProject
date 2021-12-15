%rear = imread('C:\Users\DELL\Desktop\image processing\1 Vehicle Logo Recognition\TestCases\Case2\Case2-Rear1.jpg'); 
%rear = imread('C:\Users\DELL\Desktop\image processing\1 Vehicle Logo Recognition\TestCases\Case2\Case2-Rear2.jpg');
rear =imread('C:\Users\DELL\Desktop\image processing\1 Vehicle Logo Recognition\TestCases\Case1\Case1-Front1.bmp');
%rear = imread('C:\Users\DELL\Desktop\image processing\1 Vehicle Logo Recognition\TestCases\Case1\Case1-Front1.bmp');
%rear = imread('C:\Users\DELL\Desktop\image processing\1 Vehicle Logo Recognition\TestCases\Case2\Case2-Front2.jpg');
%rear = imresize(rear ,[150 150]);
%front = imread('');

[H,W,D] = size(rear);
gray_Rear = rgb2gray(rear);
%gray_Rear = bwconncomp(gray_Rear);
%figure,imshow(gray_Rear);
bin_Rear = imbinarize(gray_Rear);
%rear_filter=imgaussfilt(gray_Rear,1);
%bin_Rear = imbinarize(rear_filter);

%figure,imshow(bin_Rear);
%c = round([H W]/2);
%fraction = round([H W]/8);
%targetsize = [100 100];
%cropped = imcrop(rear,rear_crop);
%figure,imshow(cropped);

rear_crop = imcrop(bin_Rear,[0 (H/3) W (H/3)]);
%rear_crop = bwconncomp(rear_crop);
figure,imshow(rear_crop);
orig_crop = imcrop(rear,[0 (H/3) W (H/3)]);
newImage = orig_crop;
newImage(:) = 0; 

se = strel('disk',1);
%rear_erode = imerode(rear_crop,se);
rear_dilate = imclose(rear_crop,se);
%figure,imshow(rear_erode);
%figure,imshow(rear_dilate);

%diff = imsubtract(rear_dilate,rear_dilate);
%figure,imshow(bin_Rear);
%plot(c(1),c(2),'*r')

stats1 = regionprops (rear_dilate, 'BoundingBox');
[L ,num] = bwlabel(rear_dilate);
figure,imshow(rear_dilate);

for R=1:num
  bb = stats1(R).BoundingBox;
  %figure,imshow(bin_Rear);
  rectangle('position',bb,'edgecolor','r','linewidth',1.3)
end
[H_orig,W_orig,D_orig] = size(orig_crop);

for index=1 : num
    bb = stats1(index).BoundingBox;
        if(bb(3) <= 40 && bb(4) <= 20)
            for i =  ceil(bb(1)):floor(bb(1)+bb(3))
                for j = ceil(bb(2)) : floor(bb(2)+bb(4))
                    if(i>H_orig)
                        i=H_orig;
                    elseif(i <= 0)
                        i = 1;
                    end
                    if(j>W_orig)
                        j =W_orig;
                    elseif(j == 0)
                        j = 1;
                    end
                    newImage(j,i,1) = orig_crop(j,i,1);
                    newImage(j,i,2) = orig_crop(j,i,2);
                    newImage(j,i,3) = orig_crop(j,i,3);
                end
            end
        end
end

figure,imshow(newImage);