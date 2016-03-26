function imageSSDArray = getImageSSDArray(rightImage, imageLength, imageWidth, leftImageWindow, imageWindowLength, imageWindowWidth)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    imageSSDArray = [];
    for y=0:imageLength-1
          for x=0:imageWidth-1
                        
             rightImageWindow = getImageWindow((x*8)+1,(y*8)+1,imageWindowLength,imageWindowWidth,rightImage);
             SSD = getSSD(leftImageWindow, rightImageWindow); 
             imageSSDArray(y+1,x+1) = SSD;
                        
         end
    end    

end

