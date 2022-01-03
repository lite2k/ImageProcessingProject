function [ Name ] = GetCarModel( Image )
kia = imread('./Results/Kia.png');
opel = imread('./Results/Opel.png');
hyundai = imread('./Results/Hyundai.png');
bmw = imread('./Results/Bmw.png');

kia = imresize(kia ,[100 100]);
opel = imresize(opel ,[100 100]);
hyundai = imresize(hyundai ,[100 100]);
bmw = imresize(bmw ,[100 100]);

Image = imresize(Image ,[100 100]);

propKia = ssim(kia,Image);
propOpel = ssim(opel,Image);
propHyundai = ssim(hyundai,Image);
propBmw = ssim(bmw,Image);

if(propKia > propOpel && propKia > propHyundai) % && propKia > propBmw )
    Name = "Kia";
elseif(propHyundai>propKia && propHyundai>propOpel)% && propHyundai >propBmw)
    Name = "Hyundai";
elseif(propOpel>propKia && propOpel>propHyundai)% && propOpel > propBmw)
    Name = "Opel";
%elseif(propBmw>propKia && propBmw>propHyundai) && propBmw > propOpel)
%Name = "Bmw";
else
    Name = "unknown";
end

end

