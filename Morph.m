function [ Morph_im ] = Morph( Image )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

se = strel('line',20,1);
%Morph_im = imdilate(Image,se);
%se = strel('disk', 1, 0);
Morph_im = imclose(Image, se);
%Morph_im = imfill(Image, 'holes');

end

