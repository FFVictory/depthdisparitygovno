function disparity = main( ~ )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    leftImage = getImage('../testimages/testL.jpg');
    rightImage = getImage('../testimages/testR.jpg');
    leftImage = imageToGrey(leftImage);
    imshow(leftImage);
    
end