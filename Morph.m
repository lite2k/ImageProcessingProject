function [ Morph_im ] = Morph( Image )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

se = strel('line',5,20);

Morph_im = imclose(Image, se);
se = strel('square',3);
Morph_im = imdilate(Morph_im,se);
%se = strel('sphere',1);



end

