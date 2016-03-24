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
    
    for x=0:imageWidth-1
        for y=0:imageLength-1
            leftImageWindow = getImageWindow((x*8)+1,(y*8)+1,imageWindowLength,imageWindowWidth,leftImage);
            
                for x=0:imageWidth-1
                    for y=0:imageLength-1
                        rightImageWindow = getImageWindow((x*8)+1,(y*8)+1,imageWindowLength,imageWindowWidth,rightImage);
                        SSD = getSSD(leftImageWindow, rightImageWindow); 
                        imageSSD(x+1,y+1) = SSD;
         
                    end
                end
                
                imageSSD;
        end
    end
    imageSSD;
end