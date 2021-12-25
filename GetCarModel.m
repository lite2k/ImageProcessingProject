function [ Name ] = GetCarModel( Image )
kia = imread('./Results/Kia.png');
opel = imread('./Results/Opel.png');
hyundai = imread('./Results/Hyundai.png');
accent = imread('./Results/Accent.png');

if(isequal(hyundai,Image) == 1 || isequal(accent,Image) == 1)
    Name = "Hyundai";
elseif(isequal(kia,Image) == 1)
    Name = "Kia";
elseif(isequal(opel,Image) == 1)
    Name = "Opel";
else
    Name = "unknown";
end

end

