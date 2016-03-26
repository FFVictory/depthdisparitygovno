function disparity = main( ~ )

    leftImage = getImage('../testimages/testL.jpg');
    rightImage = getImage('../testimages/testR.jpg');
    leftImage = imageToGrey(leftImage);
    rightImage = imageToGrey(rightImage);
    
    imageWindowWidth = 8;
    imageWindowLength = 8;
    
    imageWidth = 320/8;
    imageLength = 240/8;
    
    imageSSDArray = [];
    
    disparityMap = [];
    
    for y=0:imageLength-1
        for x=0:imageWidth-1
            
                leftImageX = (x*8)+1;
                leftImageY = (y*8)+1;
            
                leftImageWindow = getImageWindow(leftImageX, leftImageY,imageWindowLength,imageWindowWidth,leftImage);
            
                imageSSDArray = getImageSSDArray(rightImage, imageLength, imageWidth, leftImageWindow, imageWindowLength, imageWindowWidth);
                
                [M , I] = min(reshape(imageSSDArray, numel(imageSSDArray) , 1));
                [minSSDY, minSSDX] = ind2sub(size(imageSSDArray), I);
                
                rightWindowSSDX = ((minSSDX-1)*8)+1;
                rightWindowSSDY = ((minSSDY-1)*8)+1;
                
                rightImageWindow = getImageWindow(rightWindowSSDX,rightWindowSSDY,imageWindowLength,imageWindowWidth,rightImage);
                
                pixelSSDArray = [];
                
                for y1=1:imageWindowLength 
                     for x1 = 1:imageWindowWidth
                         
                        leftPixel = leftImageWindow(y1, x1);
                        
                        pixelSSDArray = getPixelSSDArray(leftPixel, imageWindowLength, imageWindowWidth, rightImageWindow);
                       
                        [minWindowSSD , MinimumSSD] = min(reshape(pixelSSDArray, numel(pixelSSDArray) , 1));
                        [pixelSSDY,pixelSSDX] = ind2sub(size(pixelSSDArray), MinimumSSD);
                        
                        RightPixelMinSSDX = rightWindowSSDX + pixelSSDX;
                        RightPixelMinSSDY = rightWindowSSDY + pixelSSDY;
                        
                        LeftPixelX = leftImageX + (x1-1);
                        LeftPixelY = leftImageY + (y1-1);
                        
                        DisparityValue = sqrt((LeftPixelX - RightPixelMinSSDX)^2) + sqrt((LeftPixelY - RightPixelMinSSDY)^2);
                        
                        disparityMap(LeftPixelY , LeftPixelX) = DisparityValue;

                     end
                end 
                
        end
    end
    
    imshow(rightImage);
    imshow(disparityMap);
    
end