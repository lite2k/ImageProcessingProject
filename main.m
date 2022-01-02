%Read cases and resize operations

%orig_im = imread('.\TestCases\Case2\Case2-Rear1.jpg'); 
%orig_im = imread('.\TestCases\Case2\Case2-Rear2.jpg'); 
%orig_im = imread('.\TestCases\Case1\Case1-Front1.bmp'); 
%orig_im = imread('.\TestCases\Case2\Case2-Front2.jpg'); 
%orig_im = imread('.\TestCases\Bounses\Case3\Case 3-1.jpg');
%orig_im = imread('.\TestCases\Bounses\Case3\Case 3-2.jpg');
%orig_im = imread('.\TestCases\Bounses\Case3\Case 3-3.jpg');
%orig_im = imread('.\TestCases\Bounses\Case3\Case 3-4.jpg');
input_im = imresize(orig_im ,[750 750]);
empty_im = input_im;
empty_im(:) = 0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Preprocessing (filter, edge detect., etc....)

procc_im = PostProcc(input_im);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Cropping and scaling

[H,W,D] = size(input_im);

pos = [0 (H/3) floor(W/0.5) (H/3)];

pos_crop = imcrop(procc_im,pos);
empty_im = imcrop(empty_im,pos);
input_im = imcrop(input_im,pos);

[h_crop,w_crop,d] = size(pos_crop);

figure('Name','cropped','NumberTitle','off'),imshow(pos_crop);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Morphological analysis

Morph_im = Morph(pos_crop); 
figure('Name','Morph','NumberTitle','off'),imshow(Morph_im);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Region detection and display
Regions = regionprops (Morph_im, 'BoundingBox','Area','ConvexArea','Perimeter');
num = DrawBBox(Morph_im,Regions,'b');

[res,Regions] = RemoveSmallBB(Morph_im,Regions,num);
figure('Name','Remove Small','NumberTitle','off'),imshow(res);
num = DrawBBox(res,Regions,'r');
index = ExtractLogo(Regions,num);
rectangle('position',Regions(index).BoundingBox,'edgecolor','g','linewidth',1.3)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Logo = Crop(input_im,Regions(index).BoundingBox);
Regions(index).Area
figure('Name','Logo','NumberTitle','off'),imshow(Logo);
Name = GetCarModel(Logo);
Name




