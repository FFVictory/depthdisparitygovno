function [ rgbHistogram ] = computeHistograms( image )


Red = image(:,:,1);
Green = image(:,:,2);
Blue = image(:,:,3);

%Get histValues for each channel
Rnh = imhist(Red)./numel(Red);
rgbHistogram{1,1} = Rnh;
Gnh = imhist(Green)./numel(Green);
rgbHistogram{2,1} = Gnh;
Bnh = imhist(Blue)./numel(Blue);
rgbHistogram{3,1} = Bnh;
end

