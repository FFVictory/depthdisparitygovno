function pixelSSDArray = getPixelSSDArray(leftPixel,imageWindowLength,imageWindowWidth,rightImageWindow)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    pixelSSDArray = [];
     for i=1:imageWindowLength 
         for j = 1:imageWindowWidth
              rightPixel = rightImageWindow(i,j);
              pixelSSD = getSSDPixel(leftPixel, rightPixel); 
              pixelSSDArray(i,j) = pixelSSD;
         end
     end

end

