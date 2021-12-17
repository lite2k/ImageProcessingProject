function [ cropped_im,empty_im ] = Crop( Image,orig_im )

[H,W,D] = size(orig_im);
cropped_im = imcrop(Image,[0 (H/3) W (H/3)]);
figure,imshow(cropped_im);
orig_im = imcrop(orig_im,[0 (H/3) W (H/3)]);
empty_im = orig_im;
empty_im(:) = 0; 

end

