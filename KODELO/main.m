function disparity = main( ~ )

    leftImage = getImage('../testimages/testL.jpg');
    rightImage = getImage('../testimages/testR.jpg');
    leftImage = imageToGrey(leftImage);
    rightImage = imageToGrey(rightImage);
    
    imageWindowWidth = 8;
    imageWindowLength = 8;
    
    imageWidth = 320;
    imageLength = 240;
    
    imageWindowsArray = [];
    
    for x=1:+imageWindowWidth:imageWidth
        for y=1:+imageWindowLength:imageLength
            imageWindowsArray(end+1)=getImageWindow(x,y,imageWindowLength,imageWindowWidth,rightImage);
        end
    end
    imageWindowsArray;
end