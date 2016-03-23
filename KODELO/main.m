function disparity = main( ~ )

    leftImage = getImage('../testimages/testL.jpg');
    rightImage = getImage('../testimages/testR.jpg');
    leftImage = imageToGrey(leftImage);
    rightImage = imageToGrey(rightImage);
    
    imageWindow = getImageWindow(1,1,8,8,leftImage);
    
    imshow(imageWindow);
    
end