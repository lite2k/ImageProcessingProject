function [ processed_im ] = PostProcc( Image )

gray_Rear = rgb2gray(Image);

processed_im = edge(gray_Rear,'sobel');

end

