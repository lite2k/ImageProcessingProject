%Read cases and resize operations

orig_im = imread('.\TestCases\Case2\Case2-Rear1.jpg'); 
%orig_im = imread('.\TestCases\Case2\Case2-Rear2.jpg'); 
%orig_im = imread('.\TestCases\Case1\Case1-Front1.bmp'); 
%orig_im = imread('.\TestCases\Case2\Case2-Front2.jpg'); 
%orig_im = imread('.\TestCases\Bounses\Case3\Case 3-1.jpg');

input_im = imresize(orig_im ,[750 750]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Preprocessing (filter, edge detect., etc....)

procc_im = PostProcc(input_im);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Cropping and scaling

[H,W,D] = size(input_im);

pos = [0 (H/3) floor(W/0.5) (H/3)];

pos_crop = imcrop(procc_im,pos);
input_im = imcrop(input_im,pos);

figure('Name','cropped','NumberTitle','off'),imshow(pos_crop);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Morphological analysis

Morph_im = Morph(pos_crop); 
figure('Name','Morph','NumberTitle','off'),imshow(Morph_im);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Region detection and display

Regions = regionprops (Morph_im, 'BoundingBox','Area','ConvexArea','Perimeter','Eccentricity','Extent');
num = DrawBBox(Morph_im,Regions,'b');

[res,Regions] = RemoveBB(Morph_im,Regions,num);
figure('Name','Remove Small','NumberTitle','off'),imshow(res);
num = DrawBBox(res,Regions,'r');

index = ExtractLogo(Regions,num);
rectangle('position',Regions(index).BoundingBox,'edgecolor','g','linewidth',1.3)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Logo = imcrop(input_im,Regions(index).BoundingBox);
figure('Name','Logo','NumberTitle','off'),imshow(Logo);
Name = GetCarModel(Logo);
Name




