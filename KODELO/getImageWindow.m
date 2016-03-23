function imageWindow = getImageWindow(imageX, imageY, imageLenght, imageWidth, image)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    imageLenght = imageLenght - 1;
    imageWidth = imageWidth - 1;
    
    imageWindow = image(imageY:imageY+imageWidth, imageX:imageX+imageLenght);
    
end

