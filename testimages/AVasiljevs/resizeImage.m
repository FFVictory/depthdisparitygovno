function [ resizedImage] = resizeImage( imageToTransform , newSize)
%Changes the size of the image to the one supplied in argument
    resizedImage  = imresize(imageToTransform , newSize);
end

