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
    
    for y=0:imageLength-1
        for x=0:imageWidth-1
            leftImageWindow = getImageWindow((x*8)+1,(y*8)+1,imageWindowLength,imageWindowWidth,leftImage);
            
                for y=0:imageLength-1
                    for x=0:imageWidth-1
                        
                        rightImageWindow = getImageWindow((x*8)+1,(y*8)+1,imageWindowLength,imageWindowWidth,rightImage);
                        SSD = getSSD(leftImageWindow, rightImageWindow); 
                        imageSSD(y+1,x+1) = SSD;
                        
                    end
                end
                
                [M , I] = min(reshape(imageSSD, numel(imageSSD) , 1));
                [minSSDX,minSSDY] = ind2sub(size(imageSSD), I);
                
                rightImageWindow = getImageWindow(((minSSDX-1)*8)+1,((minSSDY-1)*8)+1,imageWindowLength,imageWindowWidth,rightImage);
                     
                for y=1:imageLength 
                     for x = 1:imageWidth
                        leftPixel = leftImageWindow(x,y);
                        for y=1:imageLength 
                            for x = 1:imageWidth
                                
                            end
                        end
                            
                     end
                end
        end
    end
    imageSSD;
end