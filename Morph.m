function [ Morph_im ] = Morph( Image )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

se = strel('line',4,1);
Morph_im = imdilate(Image,se);

end

