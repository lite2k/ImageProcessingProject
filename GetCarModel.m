function [ Name ] = GetCarModel( Image )
kia = imread('./Results/Kia.png');
opel = imread('./Results/Opel.png');
hyundai = imread('./Results/Hyundai.png');

kia = imresize(kia ,[100 100]);
opel = imresize(opel ,[100 100]);
hyundai = imresize(hyundai ,[100 100]);

Image = imresize(Image ,[100 100]);

propkia = ssim(kia,Image);
propOpel = ssim(opel,Image);
propHyundai = ssim(hyundai,Image);

if(propkia > propOpel && propkia > propHyundai )
    Name = "Kia";
elseif(propHyundai>propkia && propHyundai>propOpel)
    Name = "Hyundai";
elseif(propOpel>propkia && propOpel>propHyundai)
    Name = "Opel";
else
    Name = "unknown";
end

end

