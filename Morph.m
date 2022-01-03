function [ Morph_im ] = Morph( Image )

se = strel('line',5,20);
Morph_im = imclose(Image, se);
se = strel('square',3);
Morph_im = imdilate(Morph_im,se);

end

