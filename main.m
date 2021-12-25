%Read cases and resize operations

% orig_im = imread('.\TestCases\Case2\Case2-Rear1.jpg'); 
% orig_im = imread('.\TestCases\Case2\Case2-Rear2.jpg'); 
% orig_im = imread('.\TestCases\Case1\Case1-Front1.bmp'); 
% orig_im = imread('.\TestCases\Case2\Case2-Front2.jpg'); 

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

cropped_im = Crop(procc_im,pos);
empty_im = Crop(empty_im,pos);
input_im = Crop(input_im,pos);

[h_crop,w_crop,d] = size(cropped_im);

center = round([h_crop w_crop]/2);

pos = [center(2)-150 0+25 250 200];

pos_crop = Crop(cropped_im,pos);
empty_im = Crop(empty_im,pos);
input_im = Crop(input_im,pos);

figure('Name','cropped','NumberTitle','off'),imshow(pos_crop);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Morphological analysis

Morph_im = Morph(pos_crop); 
figure('Name','Morph','NumberTitle','off'),imshow(Morph_im);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Region detection and display

[Regions,num] = DrawBBox(Morph_im);

res = RemoveSmallBB(Morph_im,Regions,num);
figure('Name','Remove Small','NumberTitle','off'),imshow(res);
[Regions,num] = DrawBBox(res);
index = ExtractLogo(Regions,num);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Logo = Crop(input_im,Regions(index).BoundingBox);
figure('Name','Logo','NumberTitle','off'),imshow(Logo);
Name = GetCarModel(Logo);
Name




