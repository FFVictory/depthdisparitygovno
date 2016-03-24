function disparity = main( ~ )

    leftImage = getImage('../testimages/testL.jpg');
    rightImage = getImage('../testimages/testR.jpg');
    leftImage = imageToGrey(leftImage);
    rightImage = imageToGrey(rightImage);
    
    imageWindowWidth = 8;
    imageWindowLength = 8;
    
    imageWidth = 320/8;
    imageLength = 240/8;
    
    imageSSD = [];
    
    disparityMap = [];
    
    for y=0:imageLength-1
        for x=0:imageWidth-1
            leftImageX = (x*8)+1;
            leftImageY = (y*8)+1;
            
            leftImageWindow = getImageWindow(leftImageX, leftImageY,imageWindowLength,imageWindowWidth,leftImage);
            
                for y=0:imageLength-1
                    for x=0:imageWidth-1
                        
                        rightImageWindow = getImageWindow((x*8)+1,(y*8)+1,imageWindowLength,imageWindowWidth,rightImage);
                        SSD = getSSD(leftImageWindow, rightImageWindow); 
                        imageSSD(y+1,x+1) = SSD;
                        
                    end
                end
                
                [M , I] = min(reshape(imageSSD, numel(imageSSD) , 1));
                [minSSDX,minSSDY] = ind2sub(size(imageSSD), I);
                rightWindowSSDX = ((minSSDX-1)*8)+1;
                rightWindowSSDY = ((minSSDY-1)*8)+1;
                rightImageWindow = getImageWindow(rightWindowSSDX,rightWindowSSDY,imageWindowLength,imageWindowWidth,rightImage);
                
                pixelSSDArray = [];
                
                for y=1:imageWindowLength 
                     for x = 1:imageWindowWidth
                        leftPixel = leftImageWindow(x,y);
                        for i=1:imageWindowLength 
                            for j = 1:imageWindowWidth
                                rightPixel = rightImageWindow(i,j);
                                pixelSSD = getSSDPixel(leftPixel, rightPixel); 
                                pixelSSDArray(i,j) = pixelSSD;
                            end
                        end
                       
                        [minWindowSSD , MinimumSSD] = min(reshape(pixelSSDArray, numel(pixelSSDArray) , 1));
                        [pixelSSDX,pixelSSDY] = ind2sub(size(pixelSSDArray), MinimumSSD);
                        
                        RightPixelMinSSDX = rightWindowSSDX + pixelSSDX;
                        RightPixelMinSSDY = rightWindowSSDY + pixelSSDY;
                        
                        LeftPixelX = leftImageX + x;
                        LeftPixelY = leftImageY + y;
                        
                        DisparityValue = sqrt(LeftPixelX^2 - RightPixelMinSSDX^2) + sqrt(LeftPixelY^2 - RightPixelMinSSDY^2);
                        
                        DisparityMap(LeftPixelX , LeftPixelY) = DisparityValue;

                     end
                end       
        end
    end
    imshow(DisparityMap);
end