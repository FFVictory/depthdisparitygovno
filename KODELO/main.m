function disparity = main( ~ )

    leftImage = getImage('../testimages/testL.jpg');
    rightImage = getImage('../testimages/testR.jpg');
    leftImage = imageToGrey(leftImage);
    rightImage = imageToGrey(rightImage);
    
    imageWindowWidth = 4;
    imageWindowLength = 4;
    
    imageWidth = 320/4;
    imageLength = 240/4;
    
    imageSSDArray = [];
    
    disparityMap = [];
    % y,x are window coordinates
    for y=0:imageLength-1
        for x=0:imageWidth-1
            
                leftImageX = (x*imageWindowWidth)+1;
                leftImageY = (y*imageWindowLength)+1;
            
                leftImageWindow = getImageWindow(leftImageX, leftImageY,imageWindowLength,imageWindowWidth,leftImage);
            
                %Argument 2/3 should be changed to window numbers
                searchArea = getSearchArea(x+1,y+1 ,imageWidth,imageLength );
                
                minimumWindowSSD = getImageSSDArray(rightImage, searchArea, leftImageWindow, imageWindowLength, imageWindowWidth);
                
                minSSDX = minimumWindowSSD(1);
                minSSDY = minimumWindowSSD(2);

                rightWindowSSDX = ((minSSDX-1)*imageWindowWidth)+1;
                rightWindowSSDY = ((minSSDY-1)*imageWindowLength)+1;
                
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
    
     imshow(uint8(disparityMap));
    
end