function [ processed_im ] = PostProcc( Image )

gray_Rear = rgb2gray(Image);

%adjusted = imadjust(gray_Rear,[0.3 0.7],[]);

processed_im = edge(gray_Rear,'sobel');

end

